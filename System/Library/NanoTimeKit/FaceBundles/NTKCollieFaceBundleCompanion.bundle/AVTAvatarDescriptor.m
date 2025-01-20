@interface AVTAvatarDescriptor
+ (BOOL)_canLoadDataRepresentation:(id)a3 minSupportedVersion:(int64_t)a4 serializationVersion:(int64_t)a5 error:(id *)a6;
+ (BOOL)ntk_canLoadDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (void)_device:(id)a3 minSupportedVersion:(int64_t *)a4 serializationVersion:(int64_t *)a5;
@end

@implementation AVTAvatarDescriptor

+ (void)_device:(id)a3 minSupportedVersion:(int64_t *)a4 serializationVersion:(int64_t *)a5
{
  unsigned int v7 = [a3 nrDeviceVersion];
  int64_t v8 = 0;
  int64_t v9 = 0;
  v10 = &dword_26718;
  do
  {
    if (*v10 <= v7)
    {
      int64_t v9 = *((void *)v10 + 1);
      int64_t v8 = *((void *)v10 + 2);
    }
    v10 += 6;
  }
  while (v10 < &dword_26778);
  *a4 = v9;
  *a5 = v8;
}

+ (BOOL)_canLoadDataRepresentation:(id)a3 minSupportedVersion:(int64_t)a4 serializationVersion:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v24 = 0;
  v11 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v24];
  id v12 = v24;
  if (v11)
  {
    v13 = [v11 objectForKey:@"minVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v14 = (int64_t)[v13 integerValue];
    }
    else {
      int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v17 = [v11 objectForKey:@"version"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v18 = (int64_t)[v17 integerValue];
      CFStringRef v19 = @"Recipe version / minVersion (%d / %d) could not be determined";
      uint64_t v16 = 2003;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 >= a4)
        {
          if (v14 <= a5)
          {
            v15 = 0;
            uint64_t v16 = 0;
LABEL_14:

            if (!v15) {
              goto LABEL_16;
            }
            goto LABEL_15;
          }
          uint64_t v16 = 2002;
          int64_t v18 = v14;
          int64_t v14 = a5;
          CFStringRef v19 = @"Recipe is too new (%d > %d)";
        }
        else
        {
          CFStringRef v19 = @"Recipe is too old (%d < %d)";
          uint64_t v16 = 2001;
          int64_t v14 = a4;
        }
      }
    }
    else
    {
      CFStringRef v19 = @"Recipe version / minVersion (%d / %d) could not be determined";
      uint64_t v16 = 2003;
      int64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v18, v14);
    goto LABEL_14;
  }
  v15 = +[NSString stringWithFormat:@"Recipe could not be decoded (%@)", v12];
  uint64_t v16 = 2003;
  if (v15)
  {
LABEL_15:
    uint64_t v20 = kNTKErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v26 = v15;
    v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v22 = +[NSError errorWithDomain:v20 code:v16 userInfo:v21];

    id v12 = (id)v22;
  }
LABEL_16:

  if (a6) {
    *a6 = v12;
  }

  return v12 == 0;
}

+ (BOOL)ntk_canLoadDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v8 = a3;
  [a1 _device:a4 minSupportedVersion:&v11 serializationVersion:&v10];
  LOBYTE(a5) = [a1 _canLoadDataRepresentation:v8 minSupportedVersion:v11 serializationVersion:v10 error:a5];

  return (char)a5;
}

@end