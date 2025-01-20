@interface HKEntitlements
@end

@implementation HKEntitlements

void __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = [v5 copy];
  v9 = (void *)_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements;
  _containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42___HKEntitlements__allowedEntitlementsSet__block_invoke()
{
  v4[48] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"com.apple.private.healthkit.analytics-agreements.control";
  v4[1] = @"com.apple.private.healthkit.os_version";
  v4[2] = @"application-identifier";
  v4[3] = @"com.apple.private.healthkit.authorization_bypass";
  v4[4] = @"com.apple.private.healthkit.authorization_manager";
  v4[5] = @"com.apple.private.healthkit.background-workout-start";
  v4[6] = @"com.apple.private.healthkit.contributor";
  v4[7] = @"com.apple.private.healthkit.hkctl";
  v4[8] = @"com.apple.private.healthkit.source.default";
  v4[9] = @"com.apple.private.healthkit.feature-availability.read";
  v4[10] = @"com.apple.private.healthkit.feature-availability.read-any";
  v4[11] = @"com.apple.private.healthkit.feature-availability.read-write";
  v4[12] = @"com.apple.private.healthkit.feature-availability.read-write-any";
  v4[13] = @"com.apple.private.healthkit.health-app-source";
  v4[14] = @"com.apple.developer.healthkit.access";
  v4[15] = @"com.apple.developer.healthkit";
  v4[16] = @"com.apple.developer.healthkit.background-delivery";
  v4[17] = @"com.apple.developer.healthkit.recalibrate-estimates";
  v4[18] = @"com.apple.private.healthkit.healthlite";
  v4[19] = @"com.apple.private.healthkit.healthrecords.account-info";
  v4[20] = @"com.apple.private.healthkit.heartbeat-series-feature-status.read-only";
  v4[21] = @"com.apple.private.healthkit.key-value.protected-local.read-write";
  v4[22] = @"com.apple.private.healthkit.key-value.protected-ubiquitous.read-write";
  v4[23] = @"com.apple.private.healthkit.key-value.ubiquitous.read-write";
  v4[24] = @"com.apple.private.healthkit.source_override";
  v4[25] = @"com.apple.private.healthkit.local-device-source";
  v4[26] = @"com.apple.private.healthkit.medicaliddata";
  v4[27] = @"com.apple.private.healthkit.medication-doseEvent.read-write";
  v4[28] = @"com.apple.private.healthkit.menstrual-cycles-diagnostics";
  v4[29] = @"com.apple.private.healthkit.mobility-walking-steadiness-feature-status.read-only";
  v4[30] = @"com.apple.developer.healthkit.nikefuel-source";
  v4[31] = @"com.apple.private.healthkit.notification-sync.read-write";
  v4[32] = @"com.apple.private.healthkit.obliteration";
  v4[33] = @"com.apple.private.healthkit.preferred_source";
  v4[34] = @"com.apple.private.healthkit.attachments";
  v4[35] = @"com.apple.private.healthkit.access";
  v4[36] = @"com.apple.private.healthkit";
  v4[37] = @"com.apple.private.healthkit.metadata.private";
  v4[38] = @"com.apple.private.healthkit.sync";
  v4[39] = @"com.apple.private.healthkit.read_authorization_bypass";
  v4[40] = @"com.apple.private.healthkit.read_authorization_override";
  v4[41] = @"com.apple.private.healthkit.source.research-study";
  v4[42] = @"com.apple.private.healthkit.skip-insertion-filter";
  v4[43] = @"com.apple.private.healthkit.source.creation";
  v4[44] = @"com.apple.private.healthkit.source.identities";
  v4[45] = @"com.apple.private.healthkit.source.owner";
  v4[46] = @"com.apple.private.healthkit.write_authorization_override";
  v4[47] = @"com.apple.private.healthkit.database-accessibility-assertion";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:48];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)_allowedEntitlementsSet_entitlementKeySet;
  _allowedEntitlementsSet_entitlementKeySet = v2;
}

void __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "fetchContainerAppExtensionEntitlementsWithCompletion: failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end