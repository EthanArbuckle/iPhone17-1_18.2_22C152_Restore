@interface _CDInteraction(BiomeEvents)
+ (id)eventWithData:()BiomeEvents dataVersion:;
- (id)serialize;
- (uint64_t)dataVersion;
- (void)serialize;
@end

@implementation _CDInteraction(BiomeEvents)

+ (id)eventWithData:()BiomeEvents dataVersion:
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = 0;
  v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
  id v6 = v10;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[_CDInteraction(BiomeEvents) eventWithData:dataVersion:]((uint64_t)v6, v8);
    }
  }
  return v5;
}

- (uint64_t)dataVersion
{
  return 1;
}

- (id)serialize
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  id v8 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(_CDInteraction(BiomeEvents) *)(uint64_t)v4 serialize];
    }
  }
  return v3;
}

+ (void)eventWithData:()BiomeEvents dataVersion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Failed to initialize CDInteraction from NSData in ATXInteractionEventProvider with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)serialize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Failed to serialize CDInteraction data in ATXInteractionEventProvider with error: %@", (uint8_t *)&v2, 0xCu);
}

@end