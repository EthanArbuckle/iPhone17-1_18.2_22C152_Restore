@interface CHPersistentStoreDescription
+ (id)persistentStoreDescriptionWithURL:(id)a3;
- (CHPersistentStoreDescription)defaultPersistentStoreDescription;
@end

@implementation CHPersistentStoreDescription

- (void).cxx_destruct
{
}

+ (id)persistentStoreDescriptionWithURL:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___CHPersistentStoreDescription;
  v3 = objc_msgSendSuper2(&v15, sel_persistentStoreDescriptionWithURL_, a3);
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v3 setOption:v5 forKey:*MEMORY[0x1E4F1BE98]];

  [v3 setValue:@"1" forPragmaNamed:@"secure_delete"];
  v6 = +[CHProcessHandle processHandle];
  if (([v6 hasAppProtectionReadEntitlement] & 1) == 0)
  {
    v7 = ch_security_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:](v7);
    }
  }
  if ([v6 hasDataStoreReadWriteEntitlement])
  {
    uint64_t v8 = *MEMORY[0x1E4F1BF20];
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    int v10 = [v6 hasDataStoreReadOnlyEntitlement];
    uint64_t v8 = *MEMORY[0x1E4F1BF20];
    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  [v3 setOption:v9 forKey:v8];
LABEL_10:
  v11 = [v3 options];
  v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    v13 = ch_security_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[CHPersistentStoreDescription persistentStoreDescriptionWithURL:](v13);
    }
  }
  return v3;
}

- (CHPersistentStoreDescription)defaultPersistentStoreDescription
{
  return (CHPersistentStoreDescription *)objc_getProperty(self, a2, 40, 1);
}

+ (void)persistentStoreDescriptionWithURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = 0x1F129FE08;
  __int16 v3 = 2112;
  uint64_t v4 = 0x1F129FE28;
  _os_log_fault_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_FAULT, "Call History access requires BOOLean entitlement %@ or %@. This will be a hard error in the future.", (uint8_t *)&v1, 0x16u);
}

+ (void)persistentStoreDescriptionWithURL:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0x1F129FE68;
  _os_log_fault_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_FAULT, "Call History access now requires App Protection Entitlement %@", (uint8_t *)&v1, 0xCu);
}

@end