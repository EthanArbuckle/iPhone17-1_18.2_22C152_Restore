@interface SPProtoSerializer
+ (id)arrayWithSPPlist:(id)a3;
+ (id)dataWithObject:(id)a3;
+ (id)dictionaryWithSPPlist:(id)a3;
+ (id)numberWithSPProtoSockPuppetObject:(id)a3;
+ (id)objectWithData:(id)a3;
+ (id)protoSPObjectWithArray:(id)a3 forKey:(id)a4;
+ (id)protoSPObjectWithData:(id)a3 forKey:(id)a4;
+ (id)protoSPObjectWithDictionary:(id)a3 forKey:(id)a4;
+ (id)protoSPObjectWithNumber:(id)a3 forKey:(id)a4;
+ (id)protoSPObjectWithObject:(id)a3 forKey:(id)a4;
+ (id)protoSPObjectWithString:(id)a3 forKey:(id)a4;
+ (id)spPlistWithArray:(id)a3;
+ (id)spPlistWithDictionary:(id)a3;
@end

@implementation SPProtoSerializer

+ (id)dataWithObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[SPCacheMessage toProto:v3];
    v5 = objc_alloc_init(SPProtoSockPuppetObject);
    [(SPProtoSockPuppetObject *)v5 setType:1];
    [(SPProtoSockPuppetObject *)v5 setCacheMessage:v4];
    v6 = [(SPProtoSockPuppetObject *)v5 data];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)objectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[SPProtoSockPuppetObject alloc] initWithData:v3];

  if ([(SPProtoSockPuppetObject *)v4 type] == 1)
  {
    v5 = [(SPProtoSockPuppetObject *)v4 cacheMessage];
    v6 = +[SPCacheMessage fromProto:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)protoSPObjectWithNumber:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  [(SPProtoSockPuppetObject *)v7 setKey:v6];

  [(SPProtoSockPuppetObject *)v7 setType:5];
  id v8 = v5;
  v9 = (const char *)[v8 objCType];
  if (!strcmp(v9, "B"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:6];
    -[SPProtoSockPuppetObject setNBOOL:](v7, "setNBOOL:", [v8 BOOLValue]);
    goto LABEL_18;
  }
  if (!strcmp(v9, "q"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:7];
    id v10 = [v8 integerValue];
    goto LABEL_12;
  }
  if (!strcmp(v9, "Q"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:8];
    -[SPProtoSockPuppetObject setNuint64:](v7, "setNuint64:", [v8 unsignedIntegerValue]);
    goto LABEL_18;
  }
  if (!strcmp(v9, "c"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:9];
    id v12 = [v8 charValue];
LABEL_17:
    [(SPProtoSockPuppetObject *)v7 setNint32:v12];
    goto LABEL_18;
  }
  if (!strcmp(v9, "s"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:10];
    id v12 = [v8 shortValue];
    goto LABEL_17;
  }
  if (!strcmp(v9, "i"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:11];
    id v11 = (id)(int)[v8 intValue];
    goto LABEL_13;
  }
  if (!strcmp(v9, "f"))
  {
    [(SPProtoSockPuppetObject *)v7 setSubtype:13];
    [v8 floatValue];
    -[SPProtoSockPuppetObject setNfloat:](v7, "setNfloat:");
  }
  else
  {
    if (strcmp(v9, "d"))
    {
      [(SPProtoSockPuppetObject *)v7 setSubtype:15];
      id v10 = [v8 longLongValue];
LABEL_12:
      id v11 = v10;
LABEL_13:
      [(SPProtoSockPuppetObject *)v7 setNint64:v11];
      goto LABEL_18;
    }
    [(SPProtoSockPuppetObject *)v7 setSubtype:14];
    [v8 doubleValue];
    -[SPProtoSockPuppetObject setNdouble:](v7, "setNdouble:");
  }
LABEL_18:

  return v7;
}

+ (id)numberWithSPProtoSockPuppetObject:(id)a3
{
  id v3 = a3;
  switch([v3 subtype])
  {
    case 6u:
      uint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 nBOOL]);
      break;
    case 8u:
      uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 nuint64]);
      break;
    case 9u:
      uint64_t v4 = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", (char)[v3 nint32]);
      break;
    case 0xAu:
      uint64_t v4 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)[v3 nint32]);
      break;
    case 0xDu:
      [v3 nfloat];
      uint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      break;
    case 0xEu:
      [v3 ndouble];
      uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      break;
    default:
      uint64_t v4 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 nint64]);
      break;
  }
  id v5 = (void *)v4;

  return v5;
}

+ (id)protoSPObjectWithString:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  id v8 = v7;
  if (v5) {
    [(SPProtoSockPuppetObject *)v7 setKey:v5];
  }
  [(SPProtoSockPuppetObject *)v8 setType:2];
  [(SPProtoSockPuppetObject *)v8 setText:v6];

  return v8;
}

+ (id)protoSPObjectWithData:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  id v8 = v7;
  if (v5) {
    [(SPProtoSockPuppetObject *)v7 setKey:v5];
  }
  [(SPProtoSockPuppetObject *)v8 setType:4];
  [(SPProtoSockPuppetObject *)v8 setObject:v6];

  return v8;
}

+ (id)protoSPObjectWithObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  id v8 = v7;
  if (v5) {
    [(SPProtoSockPuppetObject *)v7 setKey:v5];
  }
  [(SPProtoSockPuppetObject *)v8 setType:3];
  [(SPProtoSockPuppetObject *)v8 setObject:v6];

  return v8;
}

+ (id)protoSPObjectWithDictionary:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  id v8 = v7;
  if (v5) {
    [(SPProtoSockPuppetObject *)v7 setKey:v5];
  }
  [(SPProtoSockPuppetObject *)v8 setType:16];
  v9 = +[SPProtoSerializer spPlistWithDictionary:v6];

  id v10 = [v9 data];
  [(SPProtoSockPuppetObject *)v8 setObject:v10];

  return v8;
}

+ (id)protoSPObjectWithArray:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  id v8 = v7;
  if (v5) {
    [(SPProtoSockPuppetObject *)v7 setKey:v5];
  }
  [(SPProtoSockPuppetObject *)v8 setType:17];
  v9 = +[SPProtoSerializer spPlistWithArray:v6];

  id v10 = [v9 data];
  [(SPProtoSockPuppetObject *)v8 setObject:v10];

  return v8;
}

+ (id)spPlistWithArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(SPProtoSockPuppetPlist);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v7 = 136446722;
    long long v26 = v7;
    id v27 = v5;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[SPProtoSerializer protoSPObjectWithString:v11 forKey:0];
LABEL_16:
          v13 = (void *)v12;
          -[SPProtoSockPuppetPlist addObject:](v4, "addObject:", v12, v26);
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[SPProtoSerializer protoSPObjectWithNumber:v11 forKey:0];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[SPProtoSerializer protoSPObjectWithData:v11 forKey:0];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[SPProtoSerializer protoSPObjectWithDictionary:v11 forKey:0];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[SPProtoSerializer protoSPObjectWithArray:v11 forKey:0];
          goto LABEL_16;
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        if (qword_100052538 != -1) {
          dispatch_once(&qword_100052538, &stru_100045B50);
        }
        id v14 = (id)qword_100052530;
        v15 = (char *)[v14 countByEnumeratingWithState:&v28 objects:v42 count:16];
        if (v15)
        {
          v16 = v15;
          int v17 = 0;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v14);
              }
              v17 |= objc_opt_isKindOfClass();
            }
            v16 = (char *)[v14 countByEnumeratingWithState:&v28 objects:v42 count:16];
          }
          while (v16);

          id v5 = v27;
          if (v17) {
            goto LABEL_34;
          }
        }
        else
        {
        }
        v20 = wk_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_opt_class();
          *(_DWORD *)buf = v26;
          v37 = "+[SPProtoSerializer spPlistWithArray:]";
          __int16 v38 = 1024;
          int v39 = 208;
          __int16 v40 = 2114;
          v41 = v22;
          id v23 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s:%d: obj is of class %{public}@ which is not an allowed class", buf, 0x1Cu);
        }
LABEL_34:
        v13 = spUtils_serializeObject(v11);
        v21 = +[SPProtoSerializer protoSPObjectWithObject:v13 forKey:0];
        [(SPProtoSockPuppetPlist *)v4 addObject:v21];

LABEL_17:
        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v24 = [v5 countByEnumeratingWithState:&v32 objects:v43 count:16];
      id v8 = v24;
    }
    while (v24);
  }

  return v4;
}

+ (id)spPlistWithDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(SPProtoSockPuppetPlist);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v35;
    *(void *)&long long v7 = 136446722;
    long long v27 = v7;
    long long v28 = v4;
    uint64_t v29 = *(void *)v35;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v10);
        uint64_t v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, v27);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = +[SPProtoSerializer protoSPObjectWithString:v12 forKey:v11];
LABEL_16:
          id v14 = (void *)v13;
          [(SPProtoSockPuppetPlist *)v4 addObject:v13];
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = +[SPProtoSerializer protoSPObjectWithNumber:v12 forKey:v11];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = +[SPProtoSerializer protoSPObjectWithData:v12 forKey:v11];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = +[SPProtoSerializer protoSPObjectWithDictionary:v12 forKey:v11];
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = +[SPProtoSerializer protoSPObjectWithArray:v12 forKey:v11];
          goto LABEL_16;
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        if (qword_100052538 != -1) {
          dispatch_once(&qword_100052538, &stru_100045B50);
        }
        id v15 = (id)qword_100052530;
        v16 = (char *)[v15 countByEnumeratingWithState:&v30 objects:v44 count:16];
        if (v16)
        {
          int v17 = v16;
          int v18 = 0;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v15);
              }
              v18 |= objc_opt_isKindOfClass();
            }
            int v17 = (char *)[v15 countByEnumeratingWithState:&v30 objects:v44 count:16];
          }
          while (v17);

          uint64_t v4 = v28;
          if (v18) {
            goto LABEL_34;
          }
        }
        else
        {
        }
        v21 = wk_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v23 = objc_opt_class();
          *(_DWORD *)buf = v27;
          int v39 = "+[SPProtoSerializer spPlistWithDictionary:]";
          __int16 v40 = 1024;
          int v41 = 254;
          __int16 v42 = 2114;
          v43 = v23;
          id v24 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s:%d: obj is of class %{public}@ which is not an allowed class", buf, 0x1Cu);
        }
LABEL_34:
        id v14 = spUtils_serializeObject(v12);
        v22 = +[SPProtoSerializer protoSPObjectWithObject:v14 forKey:v11];
        [(SPProtoSockPuppetPlist *)v4 addObject:v22];

        uint64_t v9 = v29;
LABEL_17:

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v25 = [v5 countByEnumeratingWithState:&v34 objects:v45 count:16];
      id v8 = v25;
    }
    while (v25);
  }

  return v4;
}

+ (id)dictionaryWithSPPlist:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  if ([v3 objectsCount])
  {
    uint64_t v6 = 0;
    *(void *)&long long v5 = 136446466;
    long long v26 = v5;
    while (1)
    {
      long long v7 = objc_msgSend(v3, "objectAtIndex:", v6, v26, *(_OWORD *)buf, *(void *)&buf[16]);
      if ([v7 type] == 2) {
        break;
      }
      if ([v7 type] == 5)
      {
        uint64_t v9 = +[SPProtoSerializer numberWithSPProtoSockPuppetObject:v7];
        goto LABEL_11;
      }
      if ([v7 type] == 4)
      {
        id v10 = [v7 object];

        if (!v10)
        {
          uint64_t v11 = wk_default_log();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_34;
          }
          *(_DWORD *)buf = v26;
          *(void *)&uint8_t buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 279;
          uint64_t v13 = v11;
          id v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
          goto LABEL_14;
        }
        uint64_t v9 = [v7 object];
        goto LABEL_11;
      }
      if ([v7 type] == 17)
      {
        id v15 = [v7 object];

        if (v15)
        {
          v16 = [SPProtoSockPuppetPlist alloc];
          int v17 = [v7 object];
          uint64_t v11 = [(SPProtoSockPuppetPlist *)v16 initWithData:v17];

          uint64_t v18 = +[SPProtoSerializer arrayWithSPPlist:v11];
          goto LABEL_28;
        }
        uint64_t v11 = wk_default_log();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = v26;
        *(void *)&uint8_t buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 287;
        uint64_t v13 = v11;
        id v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
        goto LABEL_14;
      }
      if ([v7 type] == 16)
      {
        uint64_t v19 = [v7 object];

        if (v19)
        {
          v20 = [SPProtoSockPuppetPlist alloc];
          v21 = [v7 object];
          uint64_t v11 = [(SPProtoSockPuppetPlist *)v20 initWithData:v21];

          uint64_t v18 = +[SPProtoSerializer dictionaryWithSPPlist:v11];
          goto LABEL_28;
        }
        uint64_t v11 = wk_default_log();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = v26;
        *(void *)&uint8_t buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 295;
        uint64_t v13 = v11;
        id v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
        goto LABEL_14;
      }
      if ([v7 type] == 3)
      {
        v22 = [v7 object];

        if (v22)
        {
          uint64_t v11 = [v7 object];
          if (qword_100052538 != -1) {
            dispatch_once(&qword_100052538, &stru_100045B50);
          }
          uint64_t v18 = spUtils_deserializeObject(v11, qword_100052530);
LABEL_28:
          id v23 = (void *)v18;
          id v24 = [v7 key];
          [v4 setObject:v23 forKey:v24];

          goto LABEL_34;
        }
        uint64_t v11 = wk_default_log();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = v26;
        *(void *)&uint8_t buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 301;
        uint64_t v13 = v11;
        id v14 = "%{public}s:%d: SPProtoSerializerTypeObject, object field is empty";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
        goto LABEL_34;
      }
LABEL_35:

      if (++v6 >= (unint64_t)[v3 objectsCount]) {
        goto LABEL_38;
      }
    }
    id v8 = [v7 text];

    if (!v8)
    {
      uint64_t v11 = wk_default_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = v26;
      *(void *)&uint8_t buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 271;
      uint64_t v13 = v11;
      id v14 = "%{public}s:%d: SPProtoSerializerTypeString, text field is empty";
      goto LABEL_14;
    }
    uint64_t v9 = [v7 text];
LABEL_11:
    uint64_t v11 = v9;
    uint64_t v12 = [v7 key];
    [v4 setObject:v11 forKey:v12];

    goto LABEL_34;
  }
LABEL_38:

  return v4;
}

+ (id)arrayWithSPPlist:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableArray array];
  if ([v3 objectsCount])
  {
    unint64_t v6 = 0;
    *(void *)&long long v5 = 136446466;
    long long v25 = v5;
    do
    {
      long long v7 = objc_msgSend(v3, "objectAtIndex:", v6, v25, *(_OWORD *)buf, *(void *)&buf[16]);
      if ([v7 type] == 2)
      {
        id v8 = [v7 text];

        if (v8)
        {
          uint64_t v9 = [v7 text];
LABEL_11:
          uint64_t v11 = v9;
          [v4 addObject:v9];
          goto LABEL_13;
        }
        uint64_t v11 = wk_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v25;
          *(void *)&uint8_t buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 318;
          v20 = v11;
          v21 = "%{public}s:%d: SPProtoSerializerTypeString, text field is empty";
          goto LABEL_35;
        }
      }
      else
      {
        if ([v7 type] == 5)
        {
          uint64_t v9 = +[SPProtoSerializer numberWithSPProtoSockPuppetObject:v7];
          goto LABEL_11;
        }
        if ([v7 type] == 4)
        {
          id v10 = [v7 object];

          if (v10)
          {
            uint64_t v9 = [v7 object];
            goto LABEL_11;
          }
          uint64_t v11 = wk_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            *(void *)&uint8_t buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 326;
            v20 = v11;
            v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
LABEL_35:
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
          }
        }
        else if ([v7 type] == 17)
        {
          uint64_t v12 = [v7 object];

          if (v12)
          {
            uint64_t v13 = [SPProtoSockPuppetPlist alloc];
            id v14 = [v7 object];
            uint64_t v11 = [(SPProtoSockPuppetPlist *)v13 initWithData:v14];

            id v15 = +[SPProtoSerializer arrayWithSPPlist:v11];
            [v4 addObject:v15];
          }
          else
          {
            uint64_t v11 = wk_default_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              *(void *)&uint8_t buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 334;
              v20 = v11;
              v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
              goto LABEL_35;
            }
          }
        }
        else
        {
          if ([v7 type] != 16)
          {
            if ([v7 type] != 3) {
              goto LABEL_14;
            }
            v22 = [v7 object];

            if (!v22)
            {
              uint64_t v11 = wk_default_log();
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                goto LABEL_13;
              }
              *(_DWORD *)buf = v25;
              *(void *)&uint8_t buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 348;
              v20 = v11;
              v21 = "%{public}s:%d: SPProtoSerializerTypeObject, object field is empty";
              goto LABEL_35;
            }
            uint64_t v11 = [v7 object];
            if (qword_100052538 != -1) {
              dispatch_once(&qword_100052538, &stru_100045B50);
            }
            uint64_t v19 = spUtils_deserializeObject(v11, qword_100052530);
            goto LABEL_29;
          }
          v16 = [v7 object];

          if (v16)
          {
            int v17 = [SPProtoSockPuppetPlist alloc];
            uint64_t v18 = [v7 object];
            uint64_t v11 = [(SPProtoSockPuppetPlist *)v17 initWithData:v18];

            uint64_t v19 = +[SPProtoSerializer dictionaryWithSPPlist:v11];
LABEL_29:
            id v23 = (void *)v19;
            [v4 addObject:v19];

            goto LABEL_13;
          }
          uint64_t v11 = wk_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            *(void *)&uint8_t buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 342;
            v20 = v11;
            v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
            goto LABEL_35;
          }
        }
      }
LABEL_13:

LABEL_14:
      ++v6;
    }
    while (v6 < (unint64_t)[v3 objectsCount]);
  }

  return v4;
}

@end