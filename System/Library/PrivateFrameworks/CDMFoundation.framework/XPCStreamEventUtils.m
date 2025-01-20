@interface XPCStreamEventUtils
+ (id)getXPCEventName:(id)a3;
@end

@implementation XPCStreamEventUtils

+ (id)getXPCEventName:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (MEMORY[0x22A657850]() != MEMORY[0x263EF8708])
  {
    v4 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      v5 = 0;
      goto LABEL_6;
    }
    int v9 = 136315138;
    v10 = "+[XPCStreamEventUtils getXPCEventName:]";
    v8 = "%s [ERR]: Cannot extract name from XPC event of non-dictionary type";
LABEL_12:
    _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_3;
  }
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86C8]);
  if (!string)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    int v9 = 136315138;
    v10 = "+[XPCStreamEventUtils getXPCEventName:]";
    v8 = "%s [ERR]: Cannot extract name from XPC event, since the key is missing";
    goto LABEL_12;
  }
  v5 = [NSString stringWithUTF8String:string];
LABEL_6:

  return v5;
}

@end