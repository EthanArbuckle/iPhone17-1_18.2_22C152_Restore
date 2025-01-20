@interface CKBehaviorOptions
+ (id)sharedOptions;
- (BOOL)CDPWalrusEnabled;
- (BOOL)CDPWalrusOverride;
- (BOOL)CFNetworkLogging;
- (BOOL)allowExpiredDNSBehavior;
- (BOOL)allowRecordKeyRollingInPerRecordPCSZonesForAllContainers;
- (BOOL)allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers;
- (BOOL)allowZoneKeyRollingInPerRecordPCSZonesForAllContainers;
- (BOOL)cacheChildAccounts;
- (BOOL)compressRequests;
- (BOOL)disableCaching;
- (BOOL)enableMMCSMetricsWithDefaultValue:(BOOL)a3;
- (BOOL)evictRecentAssets;
- (BOOL)fakeManateeEnabled;
- (BOOL)fakeManateeOverride;
- (BOOL)fakeWalrusEnabled;
- (BOOL)fakeWalrusOverride;
- (BOOL)isAppleInternalInstall;
- (BOOL)isCurrentAppleAccountSuspended;
- (BOOL)isDASRateLimitingDisabled;
- (BOOL)logTraffic;
- (BOOL)overrideSavePolicyForShareRecords;
- (BOOL)rollRecordMasterKeysOnUnshare;
- (BOOL)rollRecordPCSMasterKeys;
- (BOOL)rollZonePCSIdentities;
- (BOOL)rollZoneSharingKeys;
- (BOOL)sandboxCloudD;
- (BOOL)sendDebugHeader;
- (BOOL)shouldDecryptRecordsBeforeSave;
- (BOOL)shouldProfileSQL;
- (BOOL)shouldStreamTrafficLogs;
- (BOOL)useEncryption;
- (BOOL)useEnhancedPCSEncryptionContext;
- (BOOL)useModTimeInAssetCacheEviction;
- (BOOL)usePreauth;
- (NSString)llvmProfileFile;
- (const)CKCtlPrompt;
- (double)PCSCacheMinTime;
- (double)PCSCacheValidTime;
- (double)containerProxyInactiveTimeoutWithDefaultValue:(double)a3;
- (double)deviceCapabilityShareIDSQLCacheExpireDelay;
- (double)maximumQueuedFetchWaitTime;
- (double)maximumThrottleSeconds;
- (double)minTTRPromptInterval;
- (double)packageGCPeriod;
- (double)publicIdentitiesExpirationTimeout;
- (double)recordCacheExpireDelay;
- (double)shareAcceptorRetrievingDialogDelay;
- (double)shareAcceptorRetrievingDialogMinPeriod;
- (double)sqlBatchTime;
- (id)_getDictionaryOptionForKey:(id)a3 defaultValue:(id)a4;
- (id)altDSIDsToManateeAvailabilitiesOverrides;
- (id)altDSIDsToWalrusAvailabilitiesOverrides;
- (id)buildVersion;
- (id)configBaseURL;
- (id)containerIdentifierToEmailOverrides;
- (id)containerIdentifierToForceFatalManateeZoneDecryptionFailure;
- (id)customCloudDBBaseURL;
- (id)customCodeServiceBaseURL;
- (id)customDeviceServiceBaseURL;
- (id)customMetricsServiceBaseURL;
- (id)customShareServiceBaseURL;
- (id)deviceCountOverride;
- (id)initInternal;
- (id)productName;
- (id)productVersion;
- (id)recordNamesForFakingDecryptionFailure;
- (id)setupBaseURL;
- (id)shareURLToAccountIDSystemAcceptationOverrides;
- (id)sharingOptionsSummaryString;
- (id)testRunIDHeader;
- (id)transcoderFunctionName;
- (id)transcoderPermittedRemoteMeasurement;
- (id)transcoderServiceName;
- (id)vettedEmailsTestFormat;
- (int)PCSRetryCount;
- (int)backgroundSessionConnectionPoolLimitWithDefaultValue:(int)a3;
- (int)cachedRecordExpiryTime;
- (int)clientThrottleQueueWidth;
- (int)defaultRetryAfter;
- (int)deviceCapabilityShareIDSQLCacheExpiryTime;
- (int)longlivedOperationMaxRetryCount;
- (int64_t)maxPCSSizeForKeyRolls;
- (int64_t)maxRecordPCSMasterKeyRolls;
- (int64_t)releaseType;
- (int64_t)sqlBatchCount;
- (unint64_t)PCSCacheSize;
- (unint64_t)assetEvictionGracePeriodOnHighWatermarkWithDefaultValue:(unint64_t)a3;
- (unint64_t)assetEvictionGracePeriodWithDefaultValue:(unint64_t)a3;
- (unint64_t)deviceCapabilityShareIDSQLCacheCountLimit;
- (unint64_t)maxBatchSize;
- (unint64_t)maxPackageDownloadsPerBatchWithDefaultValue:(unint64_t)a3;
- (unint64_t)maxPackageUploadsPerBatchWithDefaultValue:(unint64_t)a3;
- (unint64_t)maximumMergeableDeltaRequestSize;
- (unint64_t)recordCacheEntryCountLimit;
- (unint64_t)recordCacheSizeLimit;
- (unint64_t)savedErrorCount;
- (void)_reallySetPref:(id)a3 forKey:(id)a4;
- (void)_setArrayPref:(id)a3 forKey:(id)a4;
- (void)_setPref:(id)a3 forKey:(id)a4;
- (void)resetMaximumMergeableDeltaRequestSize;
- (void)setAllowRecordKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3;
- (void)setAllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers:(BOOL)a3;
- (void)setAllowZoneKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3;
- (void)setAltDSIDsToManateeAvailabilitiesOverrides:(id)a3;
- (void)setAltDSIDsToWalrusAvailabilitiesOverrides:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setCDPWalrusEnabled:(BOOL)a3;
- (void)setCDPWalrusOverride:(BOOL)a3;
- (void)setCFNetworkLogging:(BOOL)a3;
- (void)setCKCtlPrompt:(char *)a3;
- (void)setCacheChildAccounts:(BOOL)a3;
- (void)setCachedRecordExpiryTime:(int)a3;
- (void)setCompressRequests:(BOOL)a3;
- (void)setConfigBaseURL:(id)a3;
- (void)setContainerIdentifierToEmailOverrides:(id)a3;
- (void)setContainerIdentifierToForceFatalManateeZoneDecryptionFailure:(id)a3;
- (void)setContainerProxyInactiveTimeout:(id)a3;
- (void)setCustomCloudDBBaseURL:(id)a3;
- (void)setCustomCodeServiceBaseURL:(id)a3;
- (void)setCustomDeviceServiceBaseURL:(id)a3;
- (void)setCustomMetricsServiceBaseURL:(id)a3;
- (void)setCustomShareServiceBaseURL:(id)a3;
- (void)setDeviceCountOverride:(id)a3;
- (void)setDisableCaching:(BOOL)a3;
- (void)setFakeManateeEnabled:(BOOL)a3;
- (void)setFakeManateeOverride:(BOOL)a3;
- (void)setFakeWalrusEnabled:(BOOL)a3;
- (void)setFakeWalrusOverride:(BOOL)a3;
- (void)setForceUploadRequestActivitiesToRunImmediately:(BOOL)a3;
- (void)setIsCurrentAppleAccountSuspended:(BOOL)a3;
- (void)setIsDASRateLimitingDisabled:(id)a3;
- (void)setLlvmProfileFile:(id)a3;
- (void)setLogTraffic:(BOOL)a3;
- (void)setMaxPCSSizeForKeyRolls:(int64_t)a3;
- (void)setMaximumMergeableDeltaRequestSize:(unint64_t)a3;
- (void)setModTimeInAssetCacheEviction:(BOOL)a3;
- (void)setOperationTimeout:(double)a3;
- (void)setOptimisticPCS:(BOOL)a3;
- (void)setOverrideSavePolicyForShareRecords:(BOOL)a3;
- (void)setPCSCacheValidTime:(int64_t)a3;
- (void)setProductName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecordNamesForFakingDecryptionFailure:(id)a3;
- (void)setRollRecordMasterKeysOnUnshare:(BOOL)a3;
- (void)setRollRecordPCSMasterKeys:(BOOL)a3;
- (void)setRollZonePCSIdentities:(BOOL)a3;
- (void)setRollZoneSharingKeys:(BOOL)a3;
- (void)setSendDebugHeader:(BOOL)a3;
- (void)setSetupBaseURL:(id)a3;
- (void)setShareURLToAccountIDSystemAcceptationOverrides:(id)a3;
- (void)setSharingOptionsSummaryString:(id)a3;
- (void)setShouldProfileSQL:(BOOL)a3;
- (void)setShouldStreamTrafficLogs:(BOOL)a3;
- (void)setSqlBatchCount:(int64_t)a3;
- (void)setSqlBatchTime:(double)a3;
- (void)setTestRunIDHeader:(id)a3;
- (void)setTrafficLogMaximumDataSize:(int)a3;
- (void)setTranscoderFunctionName:(id)a3;
- (void)setTranscoderPermittedRemoteMeasurement:(id)a3;
- (void)setTranscoderServiceName:(id)a3;
- (void)setUseEncryption:(BOOL)a3;
- (void)setUseEnhancedPCSEncryptionContext:(BOOL)a3;
- (void)setUsePreauth:(BOOL)a3;
- (void)setUseStingray:(BOOL)a3;
@end

@implementation CKBehaviorOptions

- (BOOL)useEncryption
{
  return sub_18AF3DE3C((uint64_t)self, @"UseEncryption", 1);
}

+ (id)sharedOptions
{
  if (qword_1EB279C70 != -1) {
    dispatch_once(&qword_1EB279C70, &unk_1ED7EF238);
  }
  v2 = (void *)qword_1EB279C68;

  return v2;
}

- (id)initInternal
{
  v4.receiver = self;
  v4.super_class = (Class)CKBehaviorOptions;
  v2 = [(CKBehaviorOptions *)&v4 init];
  if (v2) {
    v2->_isAppleInternalInstall = os_variant_has_internal_content();
  }
  return v2;
}

- (id)_getDictionaryOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = sub_18B0D3D04((uint64_t)self, a3);
  if (v7)
  {
    v11 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v12, v13, v14);

      v11 = (void *)v15;
      if (!v15) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    v11 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v8, v9, v10);
    if (!v11)
    {
LABEL_7:
      v17 = v6;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v17 = v11;
  if (isKindOfClass) {
    goto LABEL_7;
  }
LABEL_8:
  id v18 = v17;

  return v18;
}

- (void)_setPref:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v8 = a4;
  if (byte_1E912FED0)
  {
    objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E4F28B50], v6, @"com.apple.cloudkit.CloudKitIntegrationTests", v7);
    if (objc_claimAutoreleasedReturnValue())
    {
      uint64_t v9 = [CKException alloc];
      id v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E4F1C3C8], @"You must not set CKBehaviorOptions from CloudKitIntegrationTests, since they run in parallel, one test's set value may unexpectedly break another test.  Move this test to CloudKitSerialIntegrationTests");
      objc_exception_throw(v11);
    }
  }
  objc_msgSend__reallySetPref_forKey_(self, v6, (uint64_t)v12, (uint64_t)v8);
}

- (void)_reallySetPref:(id)a3 forKey:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v11 = objc_msgSend_CKUserDefaults(CKUserDefaults, v8, v9, v10);
  uint64_t v14 = objc_msgSend_dictionaryForKey_(v11, v12, @"BehaviorOptions", v13);

  if (v14) {
    id v18 = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);
  }
  else {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v21 = v18;
  if (objc_msgSend_conformsToProtocol_(v32, v19, (uint64_t)&unk_1ED871C10, v20))
  {
    uint64_t v25 = objc_msgSend_CKDeepCopy(v32, v22, v23, v24);

    uint64_t v26 = v25;
  }
  else
  {
    uint64_t v26 = (uint64_t)v32;
  }
  id v33 = (id)v26;
  if (v26) {
    objc_msgSend_setObject_forKeyedSubscript_(v21, v22, v26, (uint64_t)v6);
  }
  else {
    objc_msgSend_removeObjectForKey_(v21, v22, (uint64_t)v6, v24);
  }
  v30 = objc_msgSend_CKUserDefaults(CKUserDefaults, v27, v28, v29);
  objc_msgSend_setObject_forKey_(v30, v31, (uint64_t)v21, @"BehaviorOptions");

  objc_sync_exit(v7);
}

- (void)_setArrayPref:(id)a3 forKey:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = v8;
  if (v21) {
    objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)v21, v10);
  }
  else {
    objc_msgSend_removeAllObjects(v8, v9, 0, v10);
  }
  uint64_t v15 = objc_msgSend_CKUserDefaults(CKUserDefaults, v12, v13, v14);
  v19 = objc_msgSend_allObjects(v11, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v15, v20, (uint64_t)v19, (uint64_t)v6);

  objc_sync_exit(v7);
}

- (int)cachedRecordExpiryTime
{
  return sub_18B0D3D80((uint64_t)self, @"RecordExpiryTime", 86400);
}

- (void)setCachedRecordExpiryTime:(int)a3
{
  objc_msgSend_numberWithInt_(NSNumber, a2, *(uint64_t *)&a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"RecordExpiryTime");
}

- (unint64_t)recordCacheSizeLimit
{
  return (int)sub_18B0D3D80((uint64_t)self, @"RecordCacheSizeLimit", 0x4000000);
}

- (unint64_t)recordCacheEntryCountLimit
{
  return (int)sub_18B0D3D80((uint64_t)self, @"RecordCacheEntryLimit", 10000);
}

- (double)recordCacheExpireDelay
{
  return sub_18B0D3E38((uint64_t)self, @"RecordCacheExpireDelay", 60.0);
}

- (unint64_t)deviceCapabilityShareIDSQLCacheCountLimit
{
  return (int)sub_18B0D3D80((uint64_t)self, @"DeviceCapabilityShareIDSQLCacheCountLimit", 0x8000);
}

- (int)deviceCapabilityShareIDSQLCacheExpiryTime
{
  return sub_18B0D3D80((uint64_t)self, @"DeviceCapabilityShareIDSQLCacheExpiryTime", 0);
}

- (double)deviceCapabilityShareIDSQLCacheExpireDelay
{
  return sub_18B0D3E38((uint64_t)self, @"DeviceCapabilityShareIDSQLCacheExpireDelay", 86400.0);
}

- (void)setOperationTimeout:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v6, (uint64_t)v7, @"OperationTimeout");
}

- (void)setTrafficLogMaximumDataSize:(int)a3
{
  objc_msgSend_numberWithInt_(NSNumber, a2, *(uint64_t *)&a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"TrafficLogMaximumDataSize");
}

- (BOOL)shouldStreamTrafficLogs
{
  return sub_18AF3DE3C((uint64_t)self, @"ShouldStreamTrafficLogs", 0);
}

- (void)setShouldStreamTrafficLogs:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"ShouldStreamTrafficLogs");
}

- (const)CKCtlPrompt
{
  v2 = sub_18B0D3EF8(self, @"CKCtlPrompt", @"ckctl> ");
  id v6 = (const char *)objc_msgSend_UTF8String(v2, v3, v4, v5);

  return v6;
}

- (void)setCKCtlPrompt:(char *)a3
{
  if (a3)
  {
    objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)a3, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CKCtlPrompt");
  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, @"CKCtlPrompt");
  }
}

- (BOOL)CFNetworkLogging
{
  return sub_18AF3DE3C((uint64_t)self, @"CFNetworkLogging", 0);
}

- (void)setCFNetworkLogging:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CFNetworkLogging");
}

- (BOOL)disableCaching
{
  return sub_18AF3DE3C((uint64_t)self, @"DisableCaching", 0);
}

- (void)setDisableCaching:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"DisableCaching");
}

- (BOOL)shouldProfileSQL
{
  return sub_18AF3DE3C((uint64_t)self, @"SQLProfile", 0);
}

- (void)setShouldProfileSQL:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"SQLProfile");
}

- (BOOL)compressRequests
{
  return sub_18AF3DE3C((uint64_t)self, @"CompressRequests", 1);
}

- (void)setCompressRequests:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CompressRequests");
}

- (BOOL)useModTimeInAssetCacheEviction
{
  return sub_18AF3DE3C((uint64_t)self, @"UseModTimeInAssetCacheEviction", 0);
}

- (void)setModTimeInAssetCacheEviction:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"UseModTimeInAssetCacheEviction");
}

- (BOOL)sendDebugHeader
{
  return sub_18AF3DE3C((uint64_t)self, @"SendDebugHeader", 0);
}

- (void)setLogTraffic:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"LogTraffic");
}

- (BOOL)logTraffic
{
  return sub_18AF3DE3C((uint64_t)self, @"LogTraffic", 1);
}

- (void)setSendDebugHeader:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"SendDebugHeader");
}

- (int)clientThrottleQueueWidth
{
  return sub_18B0D3D80((uint64_t)self, @"ClientThrottleQueueWidth", 8);
}

- (id)configBaseURL
{
  return sub_18B0D4A74(self, @"ConfigBaseURL", @"https://gateway.icloud.com/configuration");
}

- (void)setConfigBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"ConfigBaseURL");
}

- (id)setupBaseURL
{
  return sub_18B0D4A74(self, @"SetupBaseURL", @"https://gateway.icloud.com/setup");
}

- (void)setSetupBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"SetupBaseURL");
}

- (id)customCloudDBBaseURL
{
  uint64_t v3 = sub_18B0D4A74(self, @"DatabaseServiceBaseURL", 0);
  if (!v3)
  {
    uint64_t v3 = sub_18B0D4A74(self, @"CloudDBBaseURL", 0);
  }

  return v3;
}

- (void)setCustomCloudDBBaseURL:(id)a3
{
  id v4 = a3;
  objc_msgSend__setPref_forKey_(self, v5, 0, @"CloudDBBaseURL");
  objc_msgSend_absoluteString(v4, v6, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__setPref_forKey_(self, v9, (uint64_t)v10, @"DatabaseServiceBaseURL");
}

- (id)customShareServiceBaseURL
{
  return sub_18B0D4A74(self, @"ShareServiceBaseURL", 0);
}

- (void)setCustomShareServiceBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"ShareServiceBaseURL");
}

- (id)customDeviceServiceBaseURL
{
  return sub_18B0D4A74(self, @"DeviceServiceBaseURL", 0);
}

- (void)setCustomDeviceServiceBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"DeviceServiceBaseURL");
}

- (id)customCodeServiceBaseURL
{
  return sub_18B0D4A74(self, @"CodeServiceBaseURL", 0);
}

- (void)setCustomCodeServiceBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CodeServiceBaseURL");
}

- (id)customMetricsServiceBaseURL
{
  return sub_18B0D4A74(self, @"MetricsServiceBaseURL", 0);
}

- (void)setCustomMetricsServiceBaseURL:(id)a3
{
  objc_msgSend_absoluteString(a3, a2, (uint64_t)a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"MetricsServiceBaseURL");
}

- (void)setTestRunIDHeader:(id)a3
{
}

- (id)testRunIDHeader
{
  return sub_18B0D3EF8(self, @"TestRunIDHeader", 0);
}

- (BOOL)evictRecentAssets
{
  return sub_18AF3DE3C((uint64_t)self, @"EvictRecentAssets", 1);
}

- (unint64_t)assetEvictionGracePeriodWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18B0D3D80((uint64_t)self, @"AssetEvictionGracePeriod", a3);
}

- (unint64_t)assetEvictionGracePeriodOnHighWatermarkWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18B0D3D80((uint64_t)self, @"AssetEvictionGracePeriodOnHighWatermark", a3);
}

- (unint64_t)maxPackageDownloadsPerBatchWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MaxPackageDownloadsPerBatch", a3);
}

- (unint64_t)maxPackageUploadsPerBatchWithDefaultValue:(unint64_t)a3
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MaxPackageUploadsPerBatch", a3);
}

- (double)packageGCPeriod
{
  return sub_18B0D3E38((uint64_t)self, @"PackageGCPeriodSeconds", 3600.0);
}

- (int64_t)releaseType
{
  return objc_msgSend_isAppleInternalInstall(self, a2, v2, v3);
}

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (BOOL)sandboxCloudD
{
  return sub_18AF3DE3C((uint64_t)self, @"SandboxCloudD", 1);
}

- (unint64_t)PCSCacheSize
{
  return (int)sub_18B0D3D80((uint64_t)self, @"PCSCacheSize", 64);
}

- (double)PCSCacheMinTime
{
  return sub_18B0D3E38((uint64_t)self, @"PCSCacheMinTime", 60.0);
}

- (int)PCSRetryCount
{
  return sub_18B0D3D80((uint64_t)self, @"PCSRetryCount", 2);
}

- (int)longlivedOperationMaxRetryCount
{
  return sub_18B0D3D80((uint64_t)self, @"LongLivedOpMaxRetryCount", 5);
}

- (void)setOptimisticPCS:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"OptimisticPCS");
}

- (void)setUseEncryption:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"UseEncryption");
}

- (void)setUseStingray:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"UseStingray");
}

- (void)setUsePreauth:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"UsePreauth");
}

- (BOOL)usePreauth
{
  return sub_18AF3DE3C((uint64_t)self, @"UsePreauth", 1);
}

- (BOOL)rollRecordPCSMasterKeys
{
  return sub_18AF3DE3C((uint64_t)self, @"RollRecordPCSMasterKeys", 1);
}

- (void)setRollRecordPCSMasterKeys:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"RollRecordPCSMasterKeys");
}

- (BOOL)rollRecordMasterKeysOnUnshare
{
  return sub_18AF3DE3C((uint64_t)self, @"RollRecordMasterKeysOnUnshare", 0);
}

- (void)setRollRecordMasterKeysOnUnshare:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"RollRecordMasterKeysOnUnshare");
}

- (BOOL)rollZonePCSIdentities
{
  return sub_18AF3DE3C((uint64_t)self, @"RollZonePCSIdentities", 1);
}

- (void)setRollZonePCSIdentities:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"RollZonePCSIdentities");
}

- (BOOL)rollZoneSharingKeys
{
  return sub_18AF3DE3C((uint64_t)self, @"RollZoneSharingKeys", 1);
}

- (void)setRollZoneSharingKeys:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"RollZoneSharingKeys");
}

- (BOOL)allowZoneKeyRollingInPerRecordPCSZonesForAllContainers
{
  return sub_18AF3DE3C((uint64_t)self, @"AllowZoneKeyRollingInPerRecordPCSZonesForAllContainers", 1);
}

- (void)setAllowZoneKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"AllowZoneKeyRollingInPerRecordPCSZonesForAllContainers");
}

- (BOOL)allowRecordKeyRollingInPerRecordPCSZonesForAllContainers
{
  return sub_18AF3DE3C((uint64_t)self, @"AllowRecordKeyRollingInPerRecordPCSZonesForAllContainers", 1);
}

- (void)setAllowRecordKeyRollingInPerRecordPCSZonesForAllContainers:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"AllowRecordKeyRollingInPerRecordPCSZonesForAllContainers");
}

- (BOOL)allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers
{
  return sub_18AF3DE3C((uint64_t)self, @"AllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers", 1);
}

- (void)setAllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"AllowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers");
}

- (BOOL)useEnhancedPCSEncryptionContext
{
  return sub_18AF3DE3C((uint64_t)self, @"UseEnhancedPCSEncryptionContext", 1);
}

- (void)setUseEnhancedPCSEncryptionContext:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"UseEnhancedPCSEncryptionContext");
}

- (id)containerIdentifierToForceFatalManateeZoneDecryptionFailure
{
  return sub_18B0D3EF8(self, @"ContainerIDToForceFatalManateeZoneDecryptionFailure", 0);
}

- (void)setContainerIdentifierToForceFatalManateeZoneDecryptionFailure:(id)a3
{
}

- (int64_t)maxRecordPCSMasterKeyRolls
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MaxRecordPCSMasterKeyRolls", 10000);
}

- (int64_t)maxPCSSizeForKeyRolls
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MaxPCSSizeForKeyRolls", 0x80000);
}

- (void)setMaxPCSSizeForKeyRolls:(int64_t)a3
{
  if (a3 < 0) {
    a3 = 0x80000;
  }
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"MaxPCSSizeForKeyRolls");
}

- (id)productName
{
  uint64_t v3 = CKProductName();
  if (sub_18B0D567C(self))
  {
    id v4 = CKProductName();
    uint64_t v5 = sub_18B0D3EF8(self, @"ProductName", v4);

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (void)setProductName:(id)a3
{
}

- (id)productVersion
{
  uint64_t v3 = CKProductVersion();
  if (sub_18B0D567C(self))
  {
    id v4 = CKProductVersion();
    uint64_t v5 = sub_18B0D3EF8(self, @"ProductVersion", v4);

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (void)setProductVersion:(id)a3
{
}

- (id)buildVersion
{
  uint64_t v3 = CKBuildVersion();
  if (sub_18B0D567C(self))
  {
    id v4 = CKBuildVersion();
    uint64_t v5 = sub_18B0D3EF8(self, @"BuildVersion", v4);

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (void)setBuildVersion:(id)a3
{
}

- (unint64_t)maxBatchSize
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MaxBatchSize", 100);
}

- (BOOL)allowExpiredDNSBehavior
{
  return sub_18AF3DE3C((uint64_t)self, @"AllowExpiredDNSBehavior", 0);
}

- (BOOL)shouldDecryptRecordsBeforeSave
{
  return sub_18AF3DE3C((uint64_t)self, @"DecryptRecordsBeforeSave", 0);
}

- (int)defaultRetryAfter
{
  int v2 = sub_18B0D3D80((uint64_t)self, @"RetryAfter", 3);
  return v2 & ~(v2 >> 31);
}

- (double)maximumThrottleSeconds
{
  return sub_18B0D3E38((uint64_t)self, @"MaximumThrottleSeconds", 1800.0);
}

- (double)maximumQueuedFetchWaitTime
{
  return sub_18B0D3E38((uint64_t)self, @"MaximumQueuedFetchWaitTime", 30.0);
}

- (double)publicIdentitiesExpirationTimeout
{
  return sub_18B0D3E38((uint64_t)self, @"PublicIdentitiesExpirationTimeout", 300.0);
}

- (id)vettedEmailsTestFormat
{
  return sub_18B0D3EF8(self, @"VettedEmailsTestFormat", 0);
}

- (int)backgroundSessionConnectionPoolLimitWithDefaultValue:(int)a3
{
  int v3 = sub_18B0D3D80((uint64_t)self, @"BackgroundSessionConnectionPoolLimit", *(uint64_t *)&a3);
  return v3 & ~(v3 >> 31);
}

- (BOOL)enableMMCSMetricsWithDefaultValue:(BOOL)a3
{
  return sub_18AF3DE3C((uint64_t)self, @"EnableMMCSMetrics", a3);
}

- (int64_t)sqlBatchCount
{
  return (int)sub_18B0D3D80((uint64_t)self, @"SQLBatchCount", 5000);
}

- (void)setSqlBatchCount:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"SQLBatchCount");
}

- (double)sqlBatchTime
{
  return sub_18B0D3E38((uint64_t)self, @"SQLBatchTime", 0.5);
}

- (void)setSqlBatchTime:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, v4, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v6, (uint64_t)v7, @"SQLBatchTime");
}

- (unint64_t)savedErrorCount
{
  return (int)sub_18B0D3D80((uint64_t)self, @"SavedErrorCount", 3);
}

- (double)shareAcceptorRetrievingDialogDelay
{
  return sub_18B0D3E38((uint64_t)self, @"ShareAcceptorRetrievingDialogDelay", 0.5);
}

- (double)shareAcceptorRetrievingDialogMinPeriod
{
  return sub_18B0D3E38((uint64_t)self, @"ShareAcceptorRetrievingDialogMinPeriod", 1.0);
}

- (void)setPCSCacheValidTime:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"PCSCacheValidTime");
}

- (double)PCSCacheValidTime
{
  return sub_18B0D3E38((uint64_t)self, @"PCSCacheValidTime", 14400.0);
}

- (double)minTTRPromptInterval
{
  return sub_18B0D3E38((uint64_t)self, @"TTRPromptInterval", 86400.0);
}

- (id)recordNamesForFakingDecryptionFailure
{
  if (self)
  {
    uint64_t v2 = sub_18B0D3D04((uint64_t)self, @"RecordNamesForFakeDecryptionFailure");
    if (v2)
    {
      id v6 = (void *)v2;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v10 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v7, v8, v9);

        id v6 = (void *)v10;
        if (!v10) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      id v6 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v3, v4, v5);
      if (!v6) {
        goto LABEL_8;
      }
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v12 = v6;
    if ((isKindOfClass & 1) == 0)
    {
LABEL_9:
      id v13 = v12;

      goto LABEL_10;
    }
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

- (void)setRecordNamesForFakingDecryptionFailure:(id)a3
{
}

- (void)setForceUploadRequestActivitiesToRunImmediately:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"ForceUploadRequestActivitiesToRunImmediately");
}

- (id)deviceCountOverride
{
  return sub_18AF3DEF4((uint64_t)self, @"DeviceCount");
}

- (void)setDeviceCountOverride:(id)a3
{
}

- (id)transcoderServiceName
{
  return sub_18B0D3EF8(self, @"TranscoderServiceName", 0);
}

- (void)setTranscoderServiceName:(id)a3
{
}

- (id)transcoderFunctionName
{
  return sub_18B0D3EF8(self, @"TranscoderFunctionName", 0);
}

- (void)setTranscoderFunctionName:(id)a3
{
}

- (id)transcoderPermittedRemoteMeasurement
{
  if (self)
  {
    uint64_t v2 = sub_18AF3DEF4((uint64_t)self, @"TranscoderPermittedRemoteMeasurement");
    if (v2)
    {
      id v6 = (void *)v2;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v10 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v7, v8, v9);

        id v6 = (void *)v10;
        if (!v10) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      id v6 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v3, v4, v5);
      if (!v6) {
        goto LABEL_8;
      }
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v12 = v6;
    if ((isKindOfClass & 1) == 0)
    {
LABEL_9:
      id v13 = v12;

      goto LABEL_10;
    }
LABEL_8:
    id v12 = 0;
    goto LABEL_9;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

- (void)setTranscoderPermittedRemoteMeasurement:(id)a3
{
}

- (id)shareURLToAccountIDSystemAcceptationOverrides
{
  return (id)MEMORY[0x1F4181798](self, sel__getDictionaryOptionForKey_defaultValue_, @"ShareURLToAccountIDSystemAcceptationOverrides", 0);
}

- (void)setShareURLToAccountIDSystemAcceptationOverrides:(id)a3
{
}

- (id)containerIdentifierToEmailOverrides
{
  return (id)MEMORY[0x1F4181798](self, sel__getDictionaryOptionForKey_defaultValue_, @"ContainerIdentifierToEmailOverrides", 0);
}

- (void)setContainerIdentifierToEmailOverrides:(id)a3
{
}

- (id)sharingOptionsSummaryString
{
  return sub_18B0D3EF8(self, @"SharingOptionsSummaryString", @"Everyone can make changes");
}

- (void)setSharingOptionsSummaryString:(id)a3
{
}

- (BOOL)fakeWalrusEnabled
{
  return sub_18AF3DE3C((uint64_t)self, @"FakeWalrusEnabled", 0);
}

- (BOOL)fakeWalrusOverride
{
  return sub_18AF3DE3C((uint64_t)self, @"FakeWalrusOverride", 0);
}

- (void)setFakeWalrusOverride:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend_numberWithBool_(NSNumber, a2, 1, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v7, @"FakeWalrusOverride");
  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, @"FakeWalrusOverride");
    objc_msgSend__setPref_forKey_(self, v6, 0, @"FakeWalrusEnabled");
  }
}

- (void)setFakeWalrusEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"FakeWalrusEnabled");
}

- (void)setCDPWalrusEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CDPWalrusEnabled");
}

- (BOOL)CDPWalrusEnabled
{
  return sub_18AF3DE3C((uint64_t)self, @"CDPWalrusEnabled", 0);
}

- (void)setCDPWalrusOverride:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CDPWalrusOverride");
}

- (BOOL)CDPWalrusOverride
{
  return sub_18AF3DE3C((uint64_t)self, @"CDPWalrusOverride", 0);
}

- (id)altDSIDsToWalrusAvailabilitiesOverrides
{
  return sub_18AF3DEF4((uint64_t)self, @"AltDSIDsToWalrusAvailabilitiesOverrides");
}

- (void)setAltDSIDsToWalrusAvailabilitiesOverrides:(id)a3
{
}

- (BOOL)fakeManateeEnabled
{
  return sub_18AF3DE3C((uint64_t)self, @"FakeManateeEnabled", 0);
}

- (BOOL)fakeManateeOverride
{
  return sub_18AF3DE3C((uint64_t)self, @"FakeManateeOverride", 0);
}

- (void)setFakeManateeEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"FakeManateeEnabled");
}

- (void)setFakeManateeOverride:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend_numberWithBool_(NSNumber, a2, 1, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v7, @"FakeManateeOverride");
  }
  else
  {
    objc_msgSend__setPref_forKey_(self, a2, 0, @"FakeManateeOverride");
    objc_msgSend__setPref_forKey_(self, v6, 0, @"FakeManateeEnabled");
  }
}

- (id)altDSIDsToManateeAvailabilitiesOverrides
{
  return sub_18AF3DEF4((uint64_t)self, @"AltDSIDsToManateeAvailabilitiesOverrides");
}

- (void)setAltDSIDsToManateeAvailabilitiesOverrides:(id)a3
{
}

- (double)containerProxyInactiveTimeoutWithDefaultValue:(double)a3
{
  return sub_18B0D3E38((uint64_t)self, @"ContainerProxyInactiveTimeout", a3);
}

- (void)setContainerProxyInactiveTimeout:(id)a3
{
}

- (void)setIsCurrentAppleAccountSuspended:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"FakeSuspendedAppleAccount");
}

- (BOOL)isCurrentAppleAccountSuspended
{
  return sub_18AF3DE3C((uint64_t)self, @"FakeSuspendedAppleAccount", 0);
}

- (BOOL)isDASRateLimitingDisabled
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }

  return sub_18AF3DE3C((uint64_t)self, @"DisableDASRateLimiting", 0);
}

- (void)setIsDASRateLimitingDisabled:(id)a3
{
}

- (void)setCacheChildAccounts:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"CacheChildAccounts");
}

- (BOOL)cacheChildAccounts
{
  return sub_18AF3DE3C((uint64_t)self, @"CacheChildAccounts", 0);
}

- (BOOL)overrideSavePolicyForShareRecords
{
  return sub_18AF3DE3C((uint64_t)self, @"OverrideSavePolicyForShareRecords", 0);
}

- (void)setOverrideSavePolicyForShareRecords:(BOOL)a3
{
  if (a3) {
    objc_msgSend__setPref_forKey_(self, a2, MEMORY[0x1E4F1CC38], @"OverrideSavePolicyForShareRecords");
  }
  else {
    objc_msgSend__setPref_forKey_(self, a2, 0, @"OverrideSavePolicyForShareRecords");
  }
}

- (unint64_t)maximumMergeableDeltaRequestSize
{
  return (int)sub_18B0D3D80((uint64_t)self, @"MergeableDeltaRequestSize", 512000);
}

- (void)setMaximumMergeableDeltaRequestSize:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setPref_forKey_(self, v5, (uint64_t)v6, @"MergeableDeltaRequestSize");
}

- (void)resetMaximumMergeableDeltaRequestSize
{
}

- (NSString)llvmProfileFile
{
  return (NSString *)sub_18B0D3EF8(self, @"LLVMProfileFile", 0);
}

- (void)setLlvmProfileFile:(id)a3
{
}

@end