@interface NSObject(Protobuf)
+ (id)fromPBCodable:()Protobuf;
- (_DKPRValue)toPBCodable;
@end

@implementation NSObject(Protobuf)

- (_DKPRValue)toPBCodable
{
  v2 = objc_alloc_init(_DKPRValue);
  v3 = objc_alloc_init(_DKPRValueType);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[_DKPRValueType setType:]((uint64_t)v3, 2);
      -[_DKPRValue setStringValue:]((uint64_t)v2, a1);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[_DKPRValueType setType:]((uint64_t)v3, 4);
        [a1 timeIntervalSinceReferenceDate];
        -[_DKPRValue setDateValue:]((uint64_t)v2, v4);
      }
      else
      {
        -[_DKPRValueType setType:]((uint64_t)v3, 3);
        v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1];
        -[_DKPRValue setBlobValue:]((uint64_t)v2, v6);
      }
    }
    goto LABEL_13;
  }
  if (!CFNumberIsFloatType((CFNumberRef)a1))
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, &valuePtr))
    {
      -[_DKPRValueType setType:]((uint64_t)v3, 0);
      -[_DKPRValue setIntegerValue:]((uint64_t)v2, valuePtr);
      goto LABEL_13;
    }
LABEL_11:
    v5 = 0;
    goto LABEL_14;
  }
  uint64_t valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr)) {
    goto LABEL_11;
  }
  -[_DKPRValueType setType:]((uint64_t)v3, 1);
  -[_DKPRValue setDoubleValue:]((uint64_t)v2, *(double *)&valuePtr);
LABEL_13:
  -[_DKPRValue setType:]((uint64_t)v2, v3);
  v5 = v2;
LABEL_14:

  return v5;
}

+ (id)fromPBCodable:()Protobuf
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = -[_DKPRValue type]((uint64_t)v4);
    int v6 = -[_DKPRValueType type]((uint64_t)v5);

    switch(v6)
    {
      case 0:
        uint64_t v7 = [NSNumber numberWithLongLong:-[_DKPRValue integerValue]((uint64_t)v4)];
        goto LABEL_13;
      case 1:
        uint64_t v7 = [NSNumber numberWithDouble:-[_DKPRValue doubleValue]((uint64_t)v4)];
        goto LABEL_13;
      case 2:
        uint64_t v7 = -[_DKPRValue stringValue]((uint64_t)v4);
        goto LABEL_13;
      case 3:
        v24 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v23 = objc_opt_class();
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = objc_opt_class();
        v17 = objc_msgSend(v24, "setWithObjects:", v23, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
        v18 = (void *)MEMORY[0x1E4F28DC0];
        v19 = -[_DKPRValue blobValue]((uint64_t)v4);
        id v25 = 0;
        v20 = [v18 unarchivedObjectOfClasses:v17 fromData:v19 error:&v25];
        id v21 = v25;

        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[NSObject(Protobuf) fromPBCodable:]((uint64_t)v21);
          }
          id v8 = 0;
        }
        else
        {
          id v8 = v20;
        }

        break;
      case 4:
        uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-[_DKPRValue dateValue]((uint64_t)v4)];
LABEL_13:
        id v8 = (id)v7;
        break;
      default:
        id v8 = 0;
        break;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)fromPBCodable:()Protobuf .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving object %@", (uint8_t *)&v1, 0xCu);
}

@end