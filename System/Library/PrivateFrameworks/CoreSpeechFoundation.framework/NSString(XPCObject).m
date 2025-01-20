@interface NSString(XPCObject)
- (char)_cs_xpcObject;
- (id)_cs_initWithXPCObject:()XPCObject;
@end

@implementation NSString(XPCObject)

- (char)_cs_xpcObject
{
  v1 = (char *)[a1 UTF8String];
  if (v1) {
    v1 = (char *)xpc_string_create(v1);
  }
  return v1;
}

- (id)_cs_initWithXPCObject:()XPCObject
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  if (MEMORY[0x1BA9E7EA0](v4) != MEMORY[0x1E4F145F0])
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
LABEL_4:
      v7 = 0;
      goto LABEL_5;
    }
    int v11 = 136315138;
    v12 = "-[NSString(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s xpc object should be XPC_TYPE_STRING";
LABEL_13:
    _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_4;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  if (!string_ptr)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    int v11 = 136315138;
    v12 = "-[NSString(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s xpc object string return nil";
    goto LABEL_13;
  }
  v7 = (void *)[a1 initWithUTF8String:string_ptr];
LABEL_5:

  return v7;
}

@end