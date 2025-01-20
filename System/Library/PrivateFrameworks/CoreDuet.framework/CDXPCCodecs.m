@interface CDXPCCodecs
@end

@implementation CDXPCCodecs

uint64_t __20___CDXPCCodecs__log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreduet", "CDXPCCodecs");
  uint64_t v1 = _log_log;
  _log_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __35___CDXPCCodecs_eventTypeWithEvent___block_invoke()
{
  os_log_t v0 = (void *)eventTypeWithEvent__eventTypeByMsgType;
  eventTypeWithEvent__eventTypeByMsgType = (uint64_t)&unk_1EDE1EA20;
}

uint64_t __43___CDXPCCodecs_supportedClassesToUnarchive__block_invoke()
{
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
  uint64_t v10 = 0);
  uint64_t v11 = supportedClassesToUnarchive_supportedClasses;
  supportedClassesToUnarchive_supportedClasses = v10;
  return MEMORY[0x1F41817F8](v10, v11);
}

@end