@interface NSDictionary(HealthDaemonFoundation)
+ (id)hd_dictionaryFromXPCObject:()HealthDaemonFoundation;
@end

@implementation NSDictionary(HealthDaemonFoundation)

+ (id)hd_dictionaryFromXPCObject:()HealthDaemonFoundation
{
  id v3 = a3;
  v4 = v3;
  if (!v3 || MEMORY[0x21D49FD90](v3) != MEMORY[0x263EF8708])
  {
LABEL_3:
    v5 = 0;
    goto LABEL_4;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      +[NSDictionary(HealthDaemonFoundation) hd_dictionaryFromXPCObject:](v7);
    }
    goto LABEL_3;
  }
LABEL_4:

  return v5;
}

+ (void)hd_dictionaryFromXPCObject:()HealthDaemonFoundation .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "Failed to convert XPC dictionary to CF dictionary", v1, 2u);
}

@end