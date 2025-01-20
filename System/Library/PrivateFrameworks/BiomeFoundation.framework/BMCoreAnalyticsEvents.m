@interface BMCoreAnalyticsEvents
+ (id)dictionaryWithAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5;
+ (id)dictionaryWithDatavaultByUsageExecutableName:(id)a3;
+ (id)dictionaryWithDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6;
+ (void)sendAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5;
+ (void)sendDatavaultEntitlementUsage:(id)a3;
+ (void)sendDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6;
+ (void)sendEvent:(id)a3 payload:(id)a4;
@end

@implementation BMCoreAnalyticsEvents

+ (void)sendAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5
{
  id v5 = +[BMCoreAnalyticsEvents dictionaryWithAllStreamsEventWritten:a3 size:*(void *)&a4 streamIdentifier:a5];
  +[BMCoreAnalyticsEvents sendEvent:@"com.apple.biome.streamWrites" payload:v5];
}

+ (id)dictionaryWithAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"isWritten";
  v7 = NSNumber;
  id v8 = a5;
  v9 = [v7 numberWithBool:v6];
  v14[0] = v9;
  v13[1] = @"size";
  v10 = [NSNumber numberWithUnsignedInt:v5];
  v13[2] = @"streamIdentifier";
  v14[1] = v10;
  v14[2] = v8;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

+ (void)sendEvent:(id)a3 payload:(id)a4
{
}

+ (void)sendDatavaultEntitlementUsage:(id)a3
{
  id v3 = +[BMCoreAnalyticsEvents dictionaryWithDatavaultByUsageExecutableName:a3];
  +[BMCoreAnalyticsEvents sendEvent:@"com.apple.biome.datavault-entitlement-usage" payload:v3];
}

+ (void)sendDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    v10 = +[BMCoreAnalyticsEvents dictionaryWithDeletionPolicyMetrics:v11 stream:v9 numDeleted:v7 exception:v6];
    +[BMCoreAnalyticsEvents sendEvent:@"com.apple.biome.deletion-policy-metrics" payload:v10];
  }
}

+ (id)dictionaryWithDatavaultByUsageExecutableName:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"executableName";
  v8[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)dictionaryWithDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"policyID";
  v17[1] = @"stream";
  v18[0] = a3;
  v18[1] = a4;
  v17[2] = @"numDeleted";
  id v9 = NSNumber;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v9 numberWithUnsignedInt:v7];
  v13 = (void *)v12;
  v17[3] = @"exception";
  uint64_t v14 = MEMORY[0x1E4F1CC28];
  if (v6) {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
  }
  v18[2] = v12;
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

@end