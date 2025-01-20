@interface FMDExtHelper
+ (id)_computehash:(id)a3;
+ (id)deviceIDFromAddress:(id)a3;
+ (id)deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4;
+ (id)parseStyle:(unint64_t)a3 info:(id)a4;
+ (id)serialNumberFromVersionInfo:(id)a3;
@end

@implementation FMDExtHelper

+ (id)deviceIDFromAddress:(id)a3
{
  v3 = +[NSString stringWithFormat:@"BT_%@", a3];
  v4 = +[FMDExtHelper _computehash:v3];

  return v4;
}

+ (id)deviceTypeFromVendorId:(unsigned int)a3 productId:(unsigned int)a4
{
  v5 = +[NSString stringWithFormat:@"BT_%u_%u", *(void *)&a3, *(void *)&a4];
  v6 = [a1 _computehash:v5];

  return v6;
}

+ (id)_computehash:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  v4 = [v3 fm_sha256Hash];
  v5 = [v4 fm_hexString];
  v6 = [v5 lowercaseString];

  return v6;
}

+ (id)serialNumberFromVersionInfo:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v5 = [v3 objectAtIndexedSubscript:3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v3 objectAtIndexedSubscript:3];
    id v7 = [v6 length];

    if (!v7) {
      goto LABEL_5;
    }
    v5 = [v3 objectAtIndexedSubscript:3];
    [v4 setObject:v5 forKey:@"systemSerialNumber"];
  }

LABEL_5:
  v8 = [v3 objectAtIndexedSubscript:8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v3 objectAtIndexedSubscript:8];
    id v10 = [v9 length];

    if (!v10) {
      goto LABEL_9;
    }
    v8 = [v3 objectAtIndexedSubscript:8];
    [v4 setObject:v8 forKey:@"leftSerialNumber"];
  }

LABEL_9:
  v11 = [v3 objectAtIndexedSubscript:9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v3 objectAtIndexedSubscript:9];
    id v13 = [v12 length];

    if (!v13) {
      goto LABEL_13;
    }
    v11 = [v3 objectAtIndexedSubscript:9];
    [v4 setObject:v11 forKey:@"rightSerialNumber"];
  }

LABEL_13:

  return v4;
}

+ (id)parseStyle:(unint64_t)a3 info:(id)a4
{
  id v5 = a4;
  v6 = sub_1000104A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v32 = a3;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#PARSING style %llu with feature %@", buf, 0x16u);
  }

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v22 = 0;
    goto LABEL_34;
  }
  id v7 = [v5 objectForKeyedSubscript:@"pattern"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v5 objectForKeyedSubscript:@"mask"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v5;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v8 = v8;
        id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              v14 = [v8 objectForKeyedSubscript:v13];
              v15 = v14;
              if (v14)
              {
                unint64_t v16 = strtouq((const char *)[v14 UTF8String], 0, 16);
                unint64_t v17 = a3;
                if (v16) {
                  BOOL v18 = (v16 & 1) == 0;
                }
                else {
                  BOOL v18 = 0;
                }
                if (v18)
                {
                  do
                  {
                    unint64_t v19 = v16;
                    v16 >>= 1;
                    v17 >>= 1;
                  }
                  while (v19 >= 2 && (v19 & 2) == 0);
                }
                v20 = +[NSString stringWithFormat:@"%llu", v17 & v16];
                uint64_t v21 = [v7 stringByReplacingOccurrencesOfString:v13 withString:v20];

                id v7 = (id)v21;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v10);
        }

        id v7 = v7;
        v22 = v7;
        id v5 = v25;
        goto LABEL_33;
      }
    }
    v23 = sub_1000104A4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10001E834((uint64_t)v5, v23);
    }
  }
  else
  {
    v8 = sub_1000104A4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001E7BC((uint64_t)v5, v8);
    }
  }
  v22 = 0;
LABEL_33:

LABEL_34:

  return v22;
}

@end