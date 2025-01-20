@interface AMSDefaults
+ (BOOL)QAMode;
+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5;
+ (BOOL)_resultFromSampleSession:(id)a3 isActive:(BOOL *)a4;
+ (BOOL)allowDuplicateAccounts;
+ (BOOL)allowUpsellEnrollmentForAppliedAccounts;
+ (BOOL)alwaysSendBlindedData;
+ (BOOL)alwaysSendCacheBuster;
+ (BOOL)alwaysSendGUID;
+ (BOOL)autoSyncDisabledForAccountData;
+ (BOOL)autoSyncDisabledForMetricsIdentifierStore;
+ (BOOL)automationMode;
+ (BOOL)cleanedUpUserDefaultsDataAfterMigrationToStorage;
+ (BOOL)debugUIDynamicUIEnabled;
+ (BOOL)debugUIMessagingUIEnabled;
+ (BOOL)devMode;
+ (BOOL)deviceIsBundleOverride;
+ (BOOL)didFetchBundleOwnerStatus;
+ (BOOL)didRetrieveDeviceOffers;
+ (BOOL)didRetrieveDeviceOffersEligibility;
+ (BOOL)didRetrieveTVOffers;
+ (BOOL)didSetUpServerDataCache;
+ (BOOL)disableHARLogging;
+ (BOOL)disablePrivacyAcknowledgement;
+ (BOOL)disableStubbedMarketingItems;
+ (BOOL)enableCameraRedeem;
+ (BOOL)enablePurchaseQueue;
+ (BOOL)enableRemoteSecuritySigning;
+ (BOOL)engagementExtendTimeouts;
+ (BOOL)forceEngagementPurchaseSuccess;
+ (BOOL)ignoreServerTrustEvaluation;
+ (BOOL)includeFullRequestInHARLogging;
+ (BOOL)includeFullResponseInHARLogging;
+ (BOOL)logHARData;
+ (BOOL)migratedDeviceOffers;
+ (BOOL)migratedDeviceOffersForWatch;
+ (BOOL)migratedPrivacyAcknowledgements;
+ (BOOL)migratedStorageToDefaultsForNonAMSInternal;
+ (BOOL)migratedToNewCookieStorage;
+ (BOOL)perfomedDeviceOfferSetup;
+ (BOOL)reviewComposerDemoMode;
+ (BOOL)shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5;
+ (BOOL)showSandboxAccountUI;
+ (BOOL)showSpyglassPurchases;
+ (BOOL)ss_ignoreServerTrustEvaluation;
+ (BOOL)streamHARToDisk;
+ (BOOL)useNewAccountStore;
+ (BOOL)useNewCookieStorage;
+ (NSArray)bagOverrideIgnoredKeys;
+ (NSArray)deviceBiometricIdentities;
+ (NSArray)deviceGroups;
+ (NSArray)deviceRegistrationDenyList;
+ (NSDate)authenticationStarted;
+ (NSDate)lastCarrierOfferRegistrationDate;
+ (NSDate)lastFraudScoreStateCleanupDate;
+ (NSDate)mescalCertExpiration;
+ (NSDate)metricsTimingWindowStartTime;
+ (NSDictionary)accountFlagOverrides;
+ (NSDictionary)bagOverrideInserts;
+ (NSDictionary)bagOverrides;
+ (NSDictionary)bagURLCookies;
+ (NSDictionary)deviceOfferEligibility;
+ (NSDictionary)harURLFilters;
+ (NSDictionary)journeysURLOverrides;
+ (NSDictionary)jsSourceOverrides;
+ (NSDictionary)jsVersionMap;
+ (NSDictionary)marketingItemOverrides;
+ (NSDictionary)mediaClientIdOverrides;
+ (NSDictionary)regulatoryEligibilityAttributes;
+ (NSDictionary)sourceOverrides;
+ (NSDictionary)storefrontSuffixes;
+ (NSDictionary)treatmentOverrides;
+ (NSDictionary)ttrMetricsClickStreamUserIdHistory;
+ (NSString)defaultPaymentPassIdentifier;
+ (NSString)deviceOffersSerialNumber;
+ (NSString)forwardedForIPAddress;
+ (NSString)lastMigratedBuildVersion;
+ (NSString)mediaTokenOverride;
+ (NSString)metricsCanaryIdentifier;
+ (NSString)multiUserContainerID;
+ (id)_allKeysForDomain:(__CFString *)a3;
+ (id)_valueForKey:(id)a3;
+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4;
+ (id)allKeys;
+ (id)debugUI;
+ (id)demoAccount;
+ (id)journeysURLOverride;
+ (id)sharedDatabaseChangeToken;
+ (id)sharedStoreReviewMetricsForProcess:(id)a3;
+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4;
+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5;
+ (int64_t)acknowledgePrivacyOverride;
+ (int64_t)applePayClassic;
+ (int64_t)cardEnrollmentAutomatic;
+ (int64_t)cardEnrollmentManual;
+ (int64_t)cardEnrollmentSilent;
+ (int64_t)cardEnrollmentUpsell;
+ (int64_t)deviceBiometricsState;
+ (int64_t)forceLoadUrlMetrics;
+ (int64_t)pushEnvironment;
+ (int64_t)reversePushEnabled;
+ (void)_cleanupSampleSessions;
+ (void)_setBool:(BOOL)a3 forKey:(id)a4;
+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5;
+ (void)_setInteger:(int64_t)a3 forKey:(id)a4;
+ (void)_setValue:(id)a3 forKey:(id)a4;
+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5;
+ (void)setAccountFlagOverrides:(id)a3;
+ (void)setAcknowledgePrivacyOverride:(int64_t)a3;
+ (void)setAllowDuplicateAccounts:(BOOL)a3;
+ (void)setAllowUpsellEnrollmentForAppliedAccounts:(BOOL)a3;
+ (void)setAlwaysSendBlindedData:(BOOL)a3;
+ (void)setAlwaysSendCacheBuster:(BOOL)a3;
+ (void)setAlwaysSendGUID:(BOOL)a3;
+ (void)setApplePayClassic:(int64_t)a3;
+ (void)setAuthenticationStarted:(id)a3;
+ (void)setAutoSyncDisabledForAccountData:(BOOL)a3;
+ (void)setAutoSyncDisabledForMetricsIdentifierStore:(BOOL)a3;
+ (void)setAutomationMode:(BOOL)a3;
+ (void)setBagOverrideIgnoredKeys:(id)a3;
+ (void)setBagOverrideInserts:(id)a3;
+ (void)setBagOverrides:(id)a3;
+ (void)setBagURLCookies:(id)a3;
+ (void)setCardEnrollmentAutomatic:(int64_t)a3;
+ (void)setCardEnrollmentManual:(int64_t)a3;
+ (void)setCardEnrollmentSilent:(int64_t)a3;
+ (void)setCardEnrollmentUpsell:(int64_t)a3;
+ (void)setCleanedUpUserDefaultsDataAfterMigrationToStorage:(BOOL)a3;
+ (void)setDebugUI:(id)a3;
+ (void)setDefaultPaymentPassIdentifier:(id)a3;
+ (void)setDemoAccount:(id)a3;
+ (void)setDevMode:(BOOL)a3;
+ (void)setDeviceBiometricIdentities:(id)a3;
+ (void)setDeviceBiometricsState:(int64_t)a3;
+ (void)setDeviceGroups:(id)a3;
+ (void)setDeviceIsBundleOverride:(BOOL)a3;
+ (void)setDeviceOfferEligibility:(id)a3;
+ (void)setDeviceRegistrationDenyList:(id)a3;
+ (void)setDidFetchBundleOwnerStatus:(BOOL)a3;
+ (void)setDidRetrieveDeviceOffers:(BOOL)a3;
+ (void)setDidRetrieveDeviceOffersEligibility:(BOOL)a3;
+ (void)setDidRetrieveTVOffers:(BOOL)a3;
+ (void)setDidSetUpServerDataCache:(BOOL)a3;
+ (void)setDisableHARLogging:(BOOL)a3;
+ (void)setDisablePrivacyAcknowledgement:(BOOL)a3;
+ (void)setDisableStubbedMarketingItems:(BOOL)a3;
+ (void)setEnableCameraRedeem:(BOOL)a3;
+ (void)setEnablePurchaseQueue:(BOOL)a3;
+ (void)setEnableRemoteSecuritySigning:(BOOL)a3;
+ (void)setEngagementExtendTimeouts:(BOOL)a3;
+ (void)setForceEngagementPurchaseSuccess:(BOOL)a3;
+ (void)setForceLoadUrlMetrics:(int64_t)a3;
+ (void)setForwardedForIPAddress:(id)a3;
+ (void)setHarURLFilters:(id)a3;
+ (void)setIgnoreServerTrustEvaluation:(BOOL)a3;
+ (void)setIncludeFullRequestInHARLogging:(BOOL)a3;
+ (void)setIncludeFullResponseInHARLogging:(BOOL)a3;
+ (void)setJourneysURLOverride:(id)a3;
+ (void)setJourneysURLOverrides:(id)a3;
+ (void)setJsSourceOverrides:(id)a3;
+ (void)setJsVersionMap:(id)a3;
+ (void)setLastCarrierOfferRegistrationDate:(id)a3;
+ (void)setLastFraudScoreStateCleanupDate:(id)a3;
+ (void)setLastMigratedBuildVersion:(id)a3;
+ (void)setLogHARData:(BOOL)a3;
+ (void)setMarketingItemOverrides:(id)a3;
+ (void)setMediaClientIdOverrides:(id)a3;
+ (void)setMediaTokenOverride:(id)a3;
+ (void)setMescalCertExpiration:(id)a3;
+ (void)setMetricsCanaryIdentifier:(id)a3;
+ (void)setMetricsTimingWindowStartTime:(id)a3;
+ (void)setMigratedDeviceOffers:(BOOL)a3;
+ (void)setMigratedDeviceOffersForWatch:(BOOL)a3;
+ (void)setMigratedPrivacyAcknowledgements:(BOOL)a3;
+ (void)setMigratedStorageToDefaultsForNonAMSInternal:(BOOL)a3;
+ (void)setMigratedToNewCookieStorage:(BOOL)a3;
+ (void)setPerfomedDeviceOfferSetup:(BOOL)a3;
+ (void)setPushEnvironment:(int64_t)a3;
+ (void)setQAMode:(BOOL)a3;
+ (void)setRegulatoryEligibilityAttributes:(id)a3;
+ (void)setReversePushEnabled:(int64_t)a3;
+ (void)setReviewComposerDemoMode:(BOOL)a3;
+ (void)setSharedStoreReviewMetrics:(id)a3 forProcess:(id)a4;
+ (void)setShowSandboxAccountUI:(BOOL)a3;
+ (void)setShowSpyglassPurchases:(BOOL)a3;
+ (void)setSourceOverrides:(id)a3;
+ (void)setStorefrontSuffixes:(id)a3;
+ (void)setStreamHARToDisk:(BOOL)a3;
+ (void)setTreatmentOverrides:(id)a3;
+ (void)setTtrMetricsClickStreamUserIdHistory:(id)a3;
+ (void)shouldSampleWithPercentageValue:(id)a3 sessionDurationValue:(id)a4 identifier:(id)a5 completion:(id)a6;
+ (void)updateBadgeIdsForBundle:(id)a3 block:(id)a4;
@end

@implementation AMSDefaults

+ (NSDictionary)treatmentOverrides
{
  v2 = [a1 _valueForKey:@"AMSTreatmentOverrides"];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  v4 = v2;

  return v4;
}

+ (id)_valueForKey:(id)a3 domain:(__CFString *)a4
{
  v5 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a4);
  v6 = (void *)CFPreferencesCopyAppValue(v5, a4);

  return v6;
}

+ (id)_valueForKey:(id)a3
{
  return (id)[a1 _valueForKey:a3 domain:@"com.apple.AppleMediaServices"];
}

+ (NSDictionary)storefrontSuffixes
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSStorefrontSuffixes"];
}

+ (NSDictionary)bagOverrides
{
  return (NSDictionary *)[a1 _valueForKey:@"BagOverrides"];
}

+ (NSDictionary)bagOverrideInserts
{
  return (NSDictionary *)[a1 _valueForKey:@"BagOverrideInserts"];
}

+ (NSArray)bagOverrideIgnoredKeys
{
  return (NSArray *)[a1 _valueForKey:@"BagOverrideIgnoredKeys"];
}

+ (BOOL)engagementExtendTimeouts
{
  return [a1 _BOOLForKey:@"extendTimeouts" defaultValue:0 domain:@"com.apple.AppleMediaServices"];
}

+ (BOOL)alwaysSendCacheBuster
{
  return [a1 _BOOLForKey:@"AMSAlwaysSendBuster" defaultValue:0];
}

+ (BOOL)enableRemoteSecuritySigning
{
  return [a1 _BOOLForKey:@"AMSEnableRemoteSecuritySigning" defaultValue:1];
}

+ (NSString)forwardedForIPAddress
{
  return (NSString *)[a1 _valueForKey:@"AMSUserDefaultsForwardedForIPAddress"];
}

+ (BOOL)alwaysSendGUID
{
  return [a1 _BOOLForKey:@"AMSAlwaysSendGuid" defaultValue:0];
}

+ (int64_t)reversePushEnabled
{
  return [a1 _integerForKey:@"AMSReversePushEnabled" defaultValue:0];
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  return [a1 _BOOLForKey:a3 defaultValue:a4 domain:@"com.apple.AppleMediaServices"];
}

+ (BOOL)logHARData
{
  return [a1 _BOOLForKey:@"AMSLogHARData" defaultValue:0];
}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  else {
    return a4;
  }
}

+ (BOOL)QAMode
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSQAMode" defaultValue:0];
  }
  return has_internal_content;
}

+ (BOOL)ss_ignoreServerTrustEvaluation
{
  return [a1 _BOOLForKey:@"ISIgnoreExtendedValidation" defaultValue:0 domain:@"com.apple.itunesstored"];
}

+ (BOOL)ignoreServerTrustEvaluation
{
  return [a1 _BOOLForKey:@"AMSIgnoreServerTrustEvaluation" defaultValue:0];
}

+ (void)shouldSampleWithPercentageValue:(id)a3 sessionDurationValue:(id)a4 identifier:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = AMSLogKey();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke;
    v20[3] = &unk_1E55A19E8;
    id v21 = v14;
    id v25 = a1;
    id v22 = v12;
    id v24 = v13;
    id v23 = v11;
    id v15 = v14;
    [v10 valueWithCompletion:v20];
  }
  else
  {
    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_opt_class();
      v19 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      v29 = v19;
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No percentage provided for identifier: %{public}@", buf, 0x20u);
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

+ (BOOL)includeFullResponseInHARLogging
{
  return [a1 _BOOLForKey:@"AMSIncludeFullResponseInHARLogging" defaultValue:0];
}

+ (int64_t)acknowledgePrivacyOverride
{
  return [a1 _integerForKey:@"AMSAcknowledgePrivacyOverride" defaultValue:0];
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4 domain:(__CFString *)a5
{
  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat) {
    return AppIntegerValue;
  }
  else {
    return a4;
  }
}

+ (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  return [a1 _integerForKey:a3 defaultValue:a4 domain:@"com.apple.AppleMediaServices"];
}

+ (int64_t)forceLoadUrlMetrics
{
  return [a1 _integerForKey:@"AMSForceLoadUrlMetrics" defaultValue:0];
}

+ (BOOL)includeFullRequestInHARLogging
{
  return [a1 _BOOLForKey:@"AMSIncludeFullRequestInHARLogging" defaultValue:0];
}

+ (BOOL)disablePrivacyAcknowledgement
{
  return [a1 _BOOLForKey:@"DisableGDPR" defaultValue:0 domain:@"com.apple.itunesstored"];
}

+ (BOOL)shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [a1 _cleanupSampleSessions];
  v9 = [NSString stringWithFormat:@"%@-%@", @"AMSSamplingSession", v8];

  id v10 = [a1 _valueForKey:v9];
  char v20 = 0;
  char v11 = [a1 _resultFromSampleSession:v10 isActive:&v20];
  if (v20)
  {
    LOBYTE(v12) = v11;
  }
  else
  {
    +[AMSRandomNumberGenerator normalizedRandomDouble];
    BOOL v14 = v13 >= 0.0;
    if (v13 > 1.0) {
      BOOL v14 = 0;
    }
    BOOL v12 = v13 <= a3 && v14;
    if (a4 > 0.0)
    {
      v21[0] = @"date";
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      v22[0] = v15;
      v21[1] = @"result";
      v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
      v22[1] = v16;
      v21[2] = @"duration";
      v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
      v22[2] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

      [a1 _setValue:v18 forKey:v9];
    }
  }

  return v12;
}

+ (void)_cleanupSampleSessions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AMSDefaults__cleanupSampleSessions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_cleanupSampleSessions_onceToken[0] != -1) {
    dispatch_once(_cleanupSampleSessions_onceToken, block);
  }
}

void __37__AMSDefaults__cleanupSampleSessions__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138543618;
    long long v13 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", @"AMSSamplingSession", v13))
        {
          char v14 = 0;
          v9 = [*(id *)(a1 + 32) _valueForKey:v8];
          [*(id *)(a1 + 32) _resultFromSampleSession:v9 isActive:&v14];
          if (!v14)
          {
            id v10 = +[AMSLogConfig sharedConfig];
            if (!v10)
            {
              id v10 = +[AMSLogConfig sharedConfig];
            }
            char v11 = [v10 OSLogObject];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = objc_opt_class();
              *(_DWORD *)buf = v13;
              uint64_t v20 = v12;
              __int16 v21 = 2114;
              id v22 = v8;
              _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing expired sampling session: %{public}@", buf, 0x16u);
            }

            [*(id *)(a1 + 32) _setValue:0 forKey:v8];
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

+ (void)_setValue:(id)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)_resultFromSampleSession:(id)a3 isActive:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"date"];
  v7 = [v5 objectForKeyedSubscript:@"result"];
  char v8 = [v7 BOOLValue];

  v9 = [v5 objectForKeyedSubscript:@"duration"];

  unsigned int v10 = [v9 BOOLValue];
  char v11 = [MEMORY[0x1E4F1C9C8] date];
  if (!v6)
  {
LABEL_4:
    char v8 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_9;
  }
  uint64_t v12 = [v6 dateByAddingTimeInterval:(double)v10];
  if ([v11 compare:v12] != -1)
  {

    goto LABEL_4;
  }
  if (a4) {
    *a4 = 1;
  }

LABEL_9:
  return v8;
}

+ (id)allKeys
{
  return (id)[a1 _allKeysForDomain:@"com.apple.AppleMediaServices"];
}

+ (id)_allKeysForDomain:(__CFString *)a3
{
  CFPreferencesAppSynchronize(a3);
  CFArrayRef v4 = CFPreferencesCopyKeyList(a3, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return v4;
}

+ (NSString)metricsCanaryIdentifier
{
  return (NSString *)[a1 _valueForKey:@"AMSMetricsCanaryIdentifier"];
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (v7)
  {
    if (objc_msgSend(v7, "ams_isBagValueMissingError"))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_2;
      block[3] = &unk_1E55A1998;
      uint64_t v33 = *(void *)(a1 + 64);
      id v32 = *(id *)(a1 + 40);
      if (kAMSUserDefaultsDebugUIMessagingUI_block_invoke_logOnceToken__COUNTER__[0] != -1) {
        dispatch_once(kAMSUserDefaultsDebugUIMessagingUI_block_invoke_logOnceToken__COUNTER__, block);
      }
      v9 = v32;
      goto LABEL_17;
    }
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    char v11 = [v9 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_16:

LABEL_17:
      uint64_t v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_18;
    }
    uint64_t v18 = objc_opt_class();
    long long v13 = AMSLogKey();
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v18;
    __int16 v36 = 2114;
    v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v19;
    __int16 v40 = 2114;
    id v41 = v7;
    long long v15 = "%{public}@: [%{public}@] Unable to fetch percentage for identifier: %{public}@. %{public}@";
    long long v16 = v11;
    uint32_t v17 = 42;
LABEL_15:
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);

    goto LABEL_16;
  }
  [v6 doubleValue];
  if (v10 == 0.0)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    char v11 = [v9 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    uint64_t v12 = objc_opt_class();
    long long v13 = AMSLogKey();
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v12;
    __int16 v36 = 2114;
    v37 = v13;
    __int16 v38 = 2114;
    uint64_t v39 = v14;
    long long v15 = "%{public}@: [%{public}@] Expected non-zero percentage for identifier: %{public}@.";
    long long v16 = v11;
    uint32_t v17 = 32;
    goto LABEL_15;
  }
  double v21 = v10;
  id v22 = *(void **)(a1 + 48);
  if (v22)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_336;
    v25[3] = &unk_1E55A19C0;
    id v23 = *(id *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 64);
    id v26 = v23;
    uint64_t v29 = v24;
    id v27 = *(id *)(a1 + 40);
    double v30 = v21;
    id v28 = *(id *)(a1 + 56);
    [v22 valueWithCompletion:v25];

    goto LABEL_19;
  }
  +[AMSDefaults shouldSampleWithPercentage:*(void *)(a1 + 40) sessionDuration:v10 identifier:0.0];
  uint64_t v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_18:
  v20();
LABEL_19:
}

+ (NSDate)mescalCertExpiration
{
  return (NSDate *)[a1 _valueForKey:@"AMSFPCertExpiration"];
}

+ (NSDictionary)mediaClientIdOverrides
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSMediaClientIdOverrides"];
}

+ (NSString)mediaTokenOverride
{
  return (NSString *)[a1 _valueForKey:@"AMSMediaTokenOverride"];
}

+ (NSDictionary)bagURLCookies
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSBagURLCookies"];
}

+ (BOOL)disableStubbedMarketingItems
{
  return [a1 _BOOLForKey:@"AMSDisableStubbedMarketingItems" defaultValue:1];
}

+ (void)setIncludeFullResponseInHARLogging:(BOOL)a3
{
}

+ (void)setIncludeFullRequestInHARLogging:(BOOL)a3
{
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4 domain:(__CFString *)a5
{
  id v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    id v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue((CFStringRef)a4, *v6, a5);
  CFPreferencesAppSynchronize(a5);
}

+ (NSString)multiUserContainerID
{
  return (NSString *)[a1 _valueForKey:@"AMSMultiUserContainerID"];
}

+ (void)_setBool:(BOOL)a3 forKey:(id)a4
{
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    double v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Percentage bag value not provided for identifier: %{public}@.", (uint8_t *)&v7, 0x20u);
  }
}

+ (BOOL)autoSyncDisabledForMetricsIdentifierStore
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSAutoSyncDisabledForMetricsIdentifierStore" defaultValue:0];
  }
  return has_internal_content;
}

+ (NSDictionary)accountFlagOverrides
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSAccountFlagOverrides"];
}

void __37__AMSDefaults__cleanupSampleSessions__block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(-2, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AMSDefaults__cleanupSampleSessions__block_invoke_2;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = *(void *)(a1 + 32);
  uint64_t v3 = v7;
  uint64_t v4 = AMSLogKey();
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke;
  block[3] = &unk_1E559EAE0;
  id v9 = v4;
  id v10 = v3;
  id v6 = v4;
  dispatch_after(v5, v2, block);
}

+ (BOOL)allowDuplicateAccounts
{
  return [a1 _BOOLForKey:@"kAMSUserDefaultsAllowDuplicateAccounts" defaultValue:0];
}

+ (BOOL)alwaysSendBlindedData
{
  return [a1 _BOOLForKey:@"AMSAlwaysSendBlindedData" defaultValue:0];
}

+ (int64_t)applePayClassic
{
  return [a1 _integerForKey:@"AMSApplePayClassic" defaultValue:0];
}

+ (NSDate)authenticationStarted
{
  return (NSDate *)[a1 _valueForKey:@"AuthenticationStarted" domain:@"com.apple.itunesstored"];
}

+ (BOOL)automationMode
{
  return [a1 _BOOLForKey:@"AutomationMode" defaultValue:0];
}

+ (int64_t)cardEnrollmentAutomatic
{
  return [a1 _integerForKey:@"AMSCardEnrollmentAutomatic" defaultValue:0];
}

+ (int64_t)cardEnrollmentManual
{
  return [a1 _integerForKey:@"AMSCardEnrollmentManual" defaultValue:0];
}

+ (int64_t)cardEnrollmentSilent
{
  return [a1 _integerForKey:@"AMSCardEnrollmentSilent" defaultValue:0];
}

+ (int64_t)cardEnrollmentUpsell
{
  return [a1 _integerForKey:@"AMSCardEnrollmentUpsell" defaultValue:0];
}

+ (id)debugUI
{
  return (id)[a1 _valueForKey:@"AMSDebugUI"];
}

+ (BOOL)debugUIDynamicUIEnabled
{
  v2 = +[AMSDefaults debugUI];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"DynamicUI"];

  if (v3)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"DynamicUI"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

+ (BOOL)debugUIMessagingUIEnabled
{
  v2 = +[AMSDefaults debugUI];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"MessagingUI"];

  if (v3)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"MessagingUI"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

+ (NSString)defaultPaymentPassIdentifier
{
  return (NSString *)[a1 _valueForKey:@"AMSDefaultPaymentPassIdentifier"];
}

+ (NSArray)deviceBiometricIdentities
{
  return (NSArray *)[a1 _valueForKey:@"AMSDeviceBiometricsIdentities"];
}

+ (int64_t)deviceBiometricsState
{
  return [a1 _integerForKey:@"AMSDeviceBiometricsState" defaultValue:0];
}

+ (NSArray)deviceGroups
{
  return (NSArray *)[a1 _valueForKey:@"deviceGroups" domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (BOOL)deviceIsBundleOverride
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSDeviceIsBundleOverride" defaultValue:0];
  }
  return has_internal_content;
}

+ (NSDictionary)deviceOfferEligibility
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSDeviceOfferEligibility" domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (NSArray)deviceRegistrationDenyList
{
  return (NSArray *)[a1 _valueForKey:@"deviceRegistrationBlacklist" domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (NSString)deviceOffersSerialNumber
{
  return (NSString *)[a1 _valueForKey:@"AMSDeviceOffersSerialNumber" domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (BOOL)devMode
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSDevMode" defaultValue:0];
  }
  return has_internal_content;
}

+ (BOOL)didFetchBundleOwnerStatus
{
  return [a1 _BOOLForKey:@"AMSDidFetchBundleOwnerStatus" defaultValue:0];
}

+ (BOOL)didRetrieveDeviceOffers
{
  return [a1 _BOOLForKey:@"AMSDidRetrieveDeviceOffers" defaultValue:0 domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (BOOL)didRetrieveDeviceOffersEligibility
{
  return [a1 _BOOLForKey:@"AMSDidRetrieveDeviceOffersEligibility" defaultValue:0 domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (BOOL)didRetrieveTVOffers
{
  return [a1 _BOOLForKey:@"AMSDidRetrieveTVOffers" defaultValue:0 domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (BOOL)didSetUpServerDataCache
{
  return [a1 _BOOLForKey:@"AMSDidSetUpServerDataCache" defaultValue:0];
}

+ (BOOL)disableHARLogging
{
  return [a1 _BOOLForKey:@"AMSDisableHARLogging" defaultValue:0];
}

+ (BOOL)enableCameraRedeem
{
  return [a1 _BOOLForKey:@"AMSEnableCameraRedeem" defaultValue:1];
}

+ (BOOL)enablePurchaseQueue
{
  return [a1 _BOOLForKey:@"AMSEnablePurchaseQueue" defaultValue:0];
}

+ (BOOL)forceEngagementPurchaseSuccess
{
  return [a1 _BOOLForKey:@"AMSForceEngagementPurchaseSuccess" defaultValue:0];
}

+ (NSDictionary)harURLFilters
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSHARURLFilters"];
}

+ (id)journeysURLOverride
{
  v2 = [a1 _valueForKey:@"AMSJourneysURLOverride"];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (NSDictionary)journeysURLOverrides
{
  v2 = [a1 _valueForKey:@"urlOverrides" domain:@"com.apple.amsengagementd"];
  uint64_t v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_37);

  return (NSDictionary *)v3;
}

AMSPair *__35__AMSDefaults_journeysURLOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  int v7 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  uint64_t v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (NSDictionary)jsVersionMap
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSJSVersionMap"];
}

+ (NSDate)lastCarrierOfferRegistrationDate
{
  return (NSDate *)[a1 _valueForKey:@"AMSLastCarrierOfferRegistrationDate"];
}

+ (NSString)lastMigratedBuildVersion
{
  return (NSString *)[a1 _valueForKey:@"AMSLastMigratedBuildVersion"];
}

+ (NSDictionary)marketingItemOverrides
{
  v2 = [a1 _valueForKey:@"AMSMarketingItemOverrides"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;

    if (v3)
    {
      id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:4 error:0];
      goto LABEL_6;
    }
  }
  else
  {

    id v3 = 0;
  }
  id v4 = 0;
LABEL_6:

  return (NSDictionary *)v4;
}

+ (NSDate)metricsTimingWindowStartTime
{
  return (NSDate *)[a1 _valueForKey:@"AMSMetricsTimingWindowStartTime"];
}

+ (BOOL)migratedDeviceOffers
{
  return [a1 _BOOLForKey:@"AMSMigratedDeviceOffers" defaultValue:0];
}

+ (BOOL)migratedDeviceOffersForWatch
{
  return [a1 _BOOLForKey:@"AMSMigratedDeviceOffersForWatch" defaultValue:0];
}

+ (BOOL)migratedPrivacyAcknowledgements
{
  return [a1 _BOOLForKey:@"AMSMigratedPrivacyAcknowledgements" defaultValue:0];
}

+ (BOOL)migratedStorageToDefaultsForNonAMSInternal
{
  return [a1 _BOOLForKey:@"AMSMigratedStorageToDefaultsForNonAMSInternal" defaultValue:0];
}

+ (BOOL)cleanedUpUserDefaultsDataAfterMigrationToStorage
{
  return [a1 _BOOLForKey:@"AMSCleanedUpUserDefaultsDataAfterMigrationToStorage" defaultValue:0];
}

+ (NSDictionary)jsSourceOverrides
{
  v2 = [a1 _valueForKey:@"AMSJSSourceOverrides"];
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_316);

  return (NSDictionary *)v3;
}

AMSPair *__32__AMSDefaults_jsSourceOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  int v7 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  uint64_t v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (BOOL)migratedToNewCookieStorage
{
  return [a1 _BOOLForKey:@"AMSMigratedToNewCookieStorage" defaultValue:0];
}

+ (BOOL)perfomedDeviceOfferSetup
{
  return [a1 _BOOLForKey:@"AMSPerformedDeviceOfferSetup" defaultValue:0 domain:@"com.apple.AppleMediaServices.notbackedup"];
}

+ (int64_t)pushEnvironment
{
  return [a1 _integerForKey:@"AMSPushEnvironment" defaultValue:0];
}

+ (BOOL)autoSyncDisabledForAccountData
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSAutoSyncDisabledForAccountData" defaultValue:0];
  }
  return has_internal_content;
}

+ (NSDictionary)ttrMetricsClickStreamUserIdHistory
{
  if (os_variant_has_internal_content())
  {
    id v3 = [a1 _valueForKey:@"AMSTTRMetricsClickStreamUserIdHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v3 = (void *)MEMORY[0x1E4F1CC08];
LABEL_5:
  return (NSDictionary *)v3;
}

+ (NSDictionary)regulatoryEligibilityAttributes
{
  return (NSDictionary *)[a1 _valueForKey:@"AMSRegulatoryEligibilityAttributes"];
}

+ (BOOL)reviewComposerDemoMode
{
  int has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
  {
    LOBYTE(has_internal_content) = [a1 _BOOLForKey:@"AMSReviewComposerDemoMode" defaultValue:0];
  }
  return has_internal_content;
}

+ (id)sharedStoreReviewMetricsForProcess:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@-%@", @"AMSSharedStoreReviewMetrics", a3];
  id v5 = [a1 _valueForKey:v4];

  return v5;
}

+ (BOOL)showSandboxAccountUI
{
  return [a1 _BOOLForKey:@"AMSShowSandboxAccountUI" defaultValue:0];
}

+ (BOOL)showSpyglassPurchases
{
  return [a1 _BOOLForKey:@"AMSShowSpyglassPurchasesTab" defaultValue:0];
}

+ (NSDictionary)sourceOverrides
{
  v2 = [a1 _valueForKey:@"AMSSourceOverrides"];
  id v3 = objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_323);

  return (NSDictionary *)v3;
}

AMSPair *__30__AMSDefaults_sourceOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  int v7 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  uint64_t v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (BOOL)streamHARToDisk
{
  return [a1 _BOOLForKey:@"AMSStreamHARToDisk" defaultValue:0];
}

+ (NSDate)lastFraudScoreStateCleanupDate
{
  return (NSDate *)[a1 _valueForKey:@"AMSFraudReportLastStateCleanupDate"];
}

+ (void)setLastFraudScoreStateCleanupDate:(id)a3
{
}

+ (void)setAcknowledgePrivacyOverride:(int64_t)a3
{
}

+ (void)setAllowDuplicateAccounts:(BOOL)a3
{
}

+ (void)setAlwaysSendBlindedData:(BOOL)a3
{
}

+ (void)setAlwaysSendCacheBuster:(BOOL)a3
{
}

+ (void)setAlwaysSendGUID:(BOOL)a3
{
}

+ (void)setApplePayClassic:(int64_t)a3
{
}

+ (void)setAuthenticationStarted:(id)a3
{
}

+ (void)setAutomationMode:(BOOL)a3
{
}

+ (void)setBagOverrideIgnoredKeys:(id)a3
{
}

+ (void)setBagOverrideInserts:(id)a3
{
}

+ (void)setBagOverrides:(id)a3
{
}

+ (void)setBagURLCookies:(id)a3
{
}

+ (void)setCardEnrollmentAutomatic:(int64_t)a3
{
}

+ (void)setCardEnrollmentManual:(int64_t)a3
{
}

+ (void)setCardEnrollmentSilent:(int64_t)a3
{
}

+ (void)setCardEnrollmentUpsell:(int64_t)a3
{
}

+ (void)setDebugUI:(id)a3
{
}

+ (void)setDefaultPaymentPassIdentifier:(id)a3
{
}

+ (void)setDeviceBiometricIdentities:(id)a3
{
}

+ (void)setDeviceBiometricsState:(int64_t)a3
{
}

+ (void)setDeviceGroups:(id)a3
{
}

+ (void)setDeviceIsBundleOverride:(BOOL)a3
{
}

+ (void)setDeviceOfferEligibility:(id)a3
{
}

+ (void)setDeviceRegistrationDenyList:(id)a3
{
}

+ (void)setDevMode:(BOOL)a3
{
}

+ (void)setDidFetchBundleOwnerStatus:(BOOL)a3
{
}

+ (void)setDidRetrieveDeviceOffers:(BOOL)a3
{
}

+ (void)setDidRetrieveDeviceOffersEligibility:(BOOL)a3
{
}

+ (void)setDidRetrieveTVOffers:(BOOL)a3
{
}

+ (void)setDidSetUpServerDataCache:(BOOL)a3
{
}

+ (void)setDisableHARLogging:(BOOL)a3
{
}

+ (void)setDisablePrivacyAcknowledgement:(BOOL)a3
{
}

+ (void)setDisableStubbedMarketingItems:(BOOL)a3
{
}

+ (void)setEnableCameraRedeem:(BOOL)a3
{
}

+ (void)setEnablePurchaseQueue:(BOOL)a3
{
}

+ (void)setEnableRemoteSecuritySigning:(BOOL)a3
{
}

+ (void)setEngagementExtendTimeouts:(BOOL)a3
{
}

+ (void)setForceEngagementPurchaseSuccess:(BOOL)a3
{
}

+ (void)setForceLoadUrlMetrics:(int64_t)a3
{
}

+ (void)setIgnoreServerTrustEvaluation:(BOOL)a3
{
}

+ (void)setJsSourceOverrides:(id)a3
{
  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_326);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setValue:v4 forKey:@"AMSJSSourceOverrides"];
}

AMSPair *__36__AMSDefaults_setJsSourceOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  int v7 = [v4 absoluteString];

  uint64_t v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (void)setForwardedForIPAddress:(id)a3
{
}

+ (void)setJourneysURLOverride:(id)a3
{
  id v4 = [a3 absoluteString];
  [a1 _setValue:v4 forKey:@"AMSJourneysURLOverride"];
}

+ (void)setJourneysURLOverrides:(id)a3
{
  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_328);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setValue:v4 forKey:@"urlOverrides" domain:@"com.apple.amsengagementd"];
}

AMSPair *__39__AMSDefaults_setJourneysURLOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  int v7 = [v4 absoluteString];

  uint64_t v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (void)setHarURLFilters:(id)a3
{
}

+ (void)setJsVersionMap:(id)a3
{
}

+ (void)setLastCarrierOfferRegistrationDate:(id)a3
{
}

+ (void)setLastMigratedBuildVersion:(id)a3
{
}

+ (void)setLogHARData:(BOOL)a3
{
}

+ (void)setMarketingItemOverrides:(id)a3
{
  id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:4 error:0];
  [a1 _setValue:v4 forKey:@"AMSMarketingItemOverrides"];
}

+ (void)setMediaClientIdOverrides:(id)a3
{
}

+ (void)setMediaTokenOverride:(id)a3
{
}

+ (void)setMescalCertExpiration:(id)a3
{
}

+ (void)setMetricsCanaryIdentifier:(id)a3
{
}

+ (void)setMetricsTimingWindowStartTime:(id)a3
{
}

+ (void)setMigratedDeviceOffers:(BOOL)a3
{
}

+ (void)setMigratedDeviceOffersForWatch:(BOOL)a3
{
}

+ (void)setMigratedPrivacyAcknowledgements:(BOOL)a3
{
}

+ (void)setMigratedStorageToDefaultsForNonAMSInternal:(BOOL)a3
{
}

+ (void)setCleanedUpUserDefaultsDataAfterMigrationToStorage:(BOOL)a3
{
}

+ (void)setMigratedToNewCookieStorage:(BOOL)a3
{
}

+ (void)setPerfomedDeviceOfferSetup:(BOOL)a3
{
}

+ (void)setPushEnvironment:(int64_t)a3
{
}

+ (void)setQAMode:(BOOL)a3
{
}

+ (void)setAutoSyncDisabledForMetricsIdentifierStore:(BOOL)a3
{
}

+ (void)setAutoSyncDisabledForAccountData:(BOOL)a3
{
}

+ (void)setTtrMetricsClickStreamUserIdHistory:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()) {
    [a1 _setValue:v4 forKey:@"AMSTTRMetricsClickStreamUserIdHistory"];
  }
}

+ (void)setRegulatoryEligibilityAttributes:(id)a3
{
}

+ (void)setReversePushEnabled:(int64_t)a3
{
}

+ (void)setReviewComposerDemoMode:(BOOL)a3
{
}

+ (void)setSharedStoreReviewMetrics:(id)a3 forProcess:(id)a4
{
  id v6 = NSString;
  id v7 = a3;
  id v8 = [v6 stringWithFormat:@"%@-%@", @"AMSSharedStoreReviewMetrics", a4];
  [a1 _setValue:v7 forKey:v8];
}

+ (void)setShowSandboxAccountUI:(BOOL)a3
{
}

+ (void)setShowSpyglassPurchases:(BOOL)a3
{
}

+ (void)setSourceOverrides:(id)a3
{
  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_330);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setValue:v4 forKey:@"AMSSourceOverrides"];
}

AMSPair *__34__AMSDefaults_setSourceOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  id v7 = [v4 absoluteString];

  id v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

+ (void)setStorefrontSuffixes:(id)a3
{
}

+ (void)setStreamHARToDisk:(BOOL)a3
{
}

+ (void)setTreatmentOverrides:(id)a3
{
}

+ (void)setAccountFlagOverrides:(id)a3
{
}

void __90__AMSDefaults_shouldSampleWithPercentageValue_sessionDurationValue_identifier_completion___block_invoke_336(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (v7)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = AMSLogKey();
      uint64_t v13 = *(void *)(a1 + 40);
      int v15 = 138544130;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Unable to fetch duration for identifier: %{public}@. %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  [v6 doubleValue];
  +[AMSDefaults shouldSampleWithPercentage:*(void *)(a1 + 40) sessionDuration:*(double *)(a1 + 64) identifier:v14];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)updateBadgeIdsForBundle:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (_MergedGlobals_96 != -1) {
      dispatch_once(&_MergedGlobals_96, &__block_literal_global_339);
    }
    id v8 = (void *)qword_1EB38D798;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke_2;
    block[3] = &unk_1E55A1A10;
    id v11 = v6;
    id v13 = a1;
    id v12 = v7;
    id v9 = v8;
    dispatch_sync(v9, block);
  }
}

uint64_t __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke()
{
  qword_1EB38D798 = (uint64_t)dispatch_queue_create("com.apple.AMSDefaults.badging", 0);
  return MEMORY[0x1F41817F8]();
}

void __45__AMSDefaults_updateBadgeIdsForBundle_block___block_invoke_2(uint64_t a1)
{
  id v9 = [NSString stringWithFormat:@"Badges:%@", *(void *)(a1 + 32)];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "_valueForKey:");
  id v3 = (void *)v2;
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v5];

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    if (![v6 count])
    {

      id v6 = 0;
    }
    id v7 = *(void **)(a1 + 48);
    id v8 = [v6 allObjects];
    [v7 _setValue:v8 forKey:v9];
  }
}

+ (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [a1 _setValue:v8 forKey:v7];
}

+ (BOOL)allowUpsellEnrollmentForAppliedAccounts
{
  return [a1 _BOOLForKey:@"AMSAllowUpsellForAppliedAccounts" defaultValue:0];
}

+ (id)demoAccount
{
  return 0;
}

+ (void)setAllowUpsellEnrollmentForAppliedAccounts:(BOOL)a3
{
}

+ (void)setDemoAccount:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [AMSSetDemoAccountTask alloc];
  id v5 = [v3 first];
  id v6 = [v3 second];

  id v7 = [(AMSSetDemoAccountTask *)v4 initWithUsername:v5 password:v6];
  id v8 = AMSAccountMediaTypeAppStoreSandbox;
  id v9 = [(AMSSetDemoAccountTask *)v7 clientInfo];
  [v9 setAccountMediaType:v8];

  id v10 = [(AMSSetDemoAccountTask *)v7 performTask];
  id v18 = 0;
  id v11 = [v10 resultWithError:&v18];
  id v12 = v18;

  if (!v11)
  {
    id v13 = +[AMSLogConfig sharedAccountsConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    double v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = AMSLogKey();
      __int16 v17 = AMSHashIfNeeded(v12);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to setup the demo account. error = %{public}@", buf, 0x20u);
    }
  }
}

+ (id)sharedDatabaseChangeToken
{
  return 0;
}

+ (BOOL)useNewAccountStore
{
  return 1;
}

+ (BOOL)useNewCookieStorage
{
  return 1;
}

@end