@interface NSNumber(XPCObject)
- (id)_cs_initWithXPCObject:()XPCObject;
- (id)_cs_xpcObject;
@end

@implementation NSNumber(XPCObject)

- (id)_cs_xpcObject
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = (char *)[v1 objCType];
  if (!v2)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[NSNumber(XPCObject) _cs_xpcObject]";
      v9 = "%s Cannot create xpcObject if objcType is NULL";
      goto LABEL_19;
    }
LABEL_7:
    xpc_object_t v5 = 0;
    goto LABEL_13;
  }
  int v3 = *v2;
  char v4 = v3 - 67;
  if ((v3 - 67) <= 0x30)
  {
    if (((1 << v4) & 0x14241) != 0)
    {
      xpc_object_t v5 = xpc_uint64_create([v1 unsignedLongLongValue]);
      goto LABEL_13;
    }
    if (((1 << v4) & 0x1424100000000) != 0)
    {
      xpc_object_t v5 = xpc_int64_create([v1 longLongValue]);
      goto LABEL_13;
    }
    if (((1 << v4) & 0xA00000000) != 0)
    {
      [v1 doubleValue];
      xpc_object_t v5 = xpc_double_create(v7);
      goto LABEL_13;
    }
  }
  if (v3 != 66)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[NSNumber(XPCObject) _cs_xpcObject]";
      v9 = "%s Cannot create xpcObject since there is no matching type";
LABEL_19:
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  xpc_object_t v5 = xpc_BOOL_create([v1 BOOLValue]);
LABEL_13:
  return v5;
}

- (id)_cs_initWithXPCObject:()XPCObject
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = v4;
  if (!v4)
  {
    double v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[NSNumber(XPCObject) _cs_initWithXPCObject:]";
      v8 = "%s Cannot create NSNumber if xpcObject is NULL";
      goto LABEL_19;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = MEMORY[0x1BA9E7EA0](v4);
  if (v6 == MEMORY[0x1E4F14570])
  {
    uint64_t v10 = [a1 initWithBool:xpc_BOOL_get_value(v5)];
  }
  else if (v6 == MEMORY[0x1E4F14598])
  {
    uint64_t v10 = [a1 initWithDouble:xpc_double_get_value(v5)];
  }
  else if (v6 == MEMORY[0x1E4F145C0])
  {
    uint64_t v10 = [a1 initWithLongLong:xpc_int64_get_value(v5)];
  }
  else
  {
    if (v6 != MEMORY[0x1E4F145F8])
    {
      double v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        v13 = "-[NSNumber(XPCObject) _cs_initWithXPCObject:]";
        v8 = "%s XPC object type should be BOOL, DOUBLE, INT64, or UINT64";
LABEL_19:
        _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t v10 = [a1 initWithUnsignedLongLong:xpc_uint64_get_value(v5)];
  }
  v9 = (void *)v10;
LABEL_15:

  return v9;
}

@end