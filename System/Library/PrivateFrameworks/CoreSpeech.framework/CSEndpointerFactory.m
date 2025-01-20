@interface CSEndpointerFactory
+ (id)endpointerProxy;
@end

@implementation CSEndpointerFactory

+ (id)endpointerProxy
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F5D450] isAttentiveSiriEnabled];
  v3 = *MEMORY[0x1E4F5D160];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D160], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 136315138;
      v9 = "+[CSEndpointerFactory endpointerProxy]";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s endpointer running on corespeechd", (uint8_t *)&v8, 0xCu);
    }
    v5 = &off_1E65880B8;
  }
  else
  {
    if (v4)
    {
      int v8 = 136315138;
      v9 = "+[CSEndpointerFactory endpointerProxy]";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s endpointer running on assistantd", (uint8_t *)&v8, 0xCu);
    }
    v5 = off_1E65880B0;
  }
  id v6 = objc_alloc_init(*v5);
  return v6;
}

@end