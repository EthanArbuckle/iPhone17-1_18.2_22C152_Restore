@interface AMSDevice
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_deviceIsBundleWithMobileActivationFlag:(BOOL)a3 storage:(id)a4 canHonorLasset:(BOOL)a5 defaultsFlag:(BOOL)a6;
+ (BOOL)_setRawDeviceOffers:(id)a3 offersStore:(id)a4;
+ (BOOL)_shouldPostOffersUpdatedNotification:(id)a3 oldOffers:(id)a4;
+ (BOOL)deviceIsAppleTV;
+ (BOOL)deviceIsAppleTVSimulator;
+ (BOOL)deviceIsAppleWatch;
+ (BOOL)deviceIsAppleWatchSimulator;
+ (BOOL)deviceIsAudioAccessory;
+ (BOOL)deviceIsBundle;
+ (BOOL)deviceIsChinaSKU;
+ (BOOL)deviceIsComputeModule;
+ (BOOL)deviceIsInternalBuild;
+ (BOOL)deviceIsMac;
+ (BOOL)deviceIsPasscodeProtected;
+ (BOOL)deviceIsRealityDevice;
+ (BOOL)deviceIsRealityDeviceSimulator;
+ (BOOL)deviceIsSeedBuild;
+ (BOOL)deviceIsiPad;
+ (BOOL)deviceIsiPadSimulator;
+ (BOOL)deviceIsiPhone;
+ (BOOL)deviceIsiPhoneSimulator;
+ (BOOL)deviceIsiPod;
+ (BOOL)deviceIsiPodSimulator;
+ (BOOL)deviceOffersContainType:(unint64_t)a3;
+ (BOOL)expressedIntent;
+ (BOOL)isEligibleForOffers;
+ (BOOL)isGift;
+ (BOOL)isRunningInStoreDemoMode;
+ (BOOL)isSecureElementAvailable;
+ (BOOL)isWalletBiometricsEnabled;
+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bag:(id)a5 logKey:(id)a6;
+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6;
+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6 logKey:(id)a7;
+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7;
+ (BOOL)saveDeviceOffersForAccount:(id)a3 response:(id)a4 logKey:(id)a5;
+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3;
+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3 issues:(int64_t *)a4;
+ (BOOL)tearDownAllDeviceOfferFollowUpsForAccount:(id)a3 logKey:(id)a4;
+ (BOOL)tearDownDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 logKey:(id)a5;
+ (NSArray)carrierNames;
+ (NSData)macAddressData;
+ (NSNumber)screenHeight;
+ (NSNumber)screenScale;
+ (NSNumber)screenWidth;
+ (NSSet)deviceOffers;
+ (NSString)MLBSerialNumber;
+ (NSString)ROMAddress;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (NSString)buildVersion;
+ (NSString)compatibleProductType;
+ (NSString)deviceName;
+ (NSString)hardwareFamily;
+ (NSString)hardwarePlatform;
+ (NSString)language;
+ (NSString)localIPAddress;
+ (NSString)macAddress;
+ (NSString)modelPartNumber;
+ (NSString)name;
+ (NSString)operatingSystem;
+ (NSString)phoneNumber;
+ (NSString)productType;
+ (NSString)productVersion;
+ (NSString)regionCode;
+ (NSString)secureElementID;
+ (NSString)serialNumber;
+ (NSString)thinnedAppVariantId;
+ (NSString)uniqueDeviceId;
+ (id)_dataForNVRAMKey:(id)a3;
+ (id)_followUpItemWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6;
+ (id)_mgStringForCFKey:(__CFString *)a3;
+ (id)_modelNumber;
+ (id)_notificationIdFromFollowUpId:(id)a3 account:(id)a4;
+ (id)_regionInfo;
+ (id)_voicePreferredPhoneNumberContext;
+ (id)cachedRegistrationGroups;
+ (id)carrierNamesPromise;
+ (id)createBagForSubProfile;
+ (id)deviceOffersForType:(unint64_t)a3;
+ (id)registrationDenyList;
+ (id)voicePreferredPACToken;
+ (int64_t)biometricState;
+ (unint64_t)buildVariant;
+ (void)_performAuth;
+ (void)_removeDeviceOfferRegistrationItem:(id)a3 fromDeviceOfferStore:(id)a4;
+ (void)_setDeviceEligibilityKeepingExistingDeviceOffers:(id)a3 offersStore:(id)a4;
+ (void)clearRegistrationDenyList;
+ (void)registerCompanionWithSerialNumber:(id)a3;
+ (void)registerCompanionWithSerialNumber:(id)a3 bag:(id)a4;
+ (void)removeDeviceOfferRegistrationItem:(id)a3;
+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5 logKey:(id)a6;
+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bagContract:(id)a5 logKey:(id)a6;
+ (void)saveDeviceOfferEligibility:(id)a3;
+ (void)saveDeviceOffers:(id)a3;
+ (void)setBiometricState:(int64_t)a3;
+ (void)setDeviceOffersCheckEncodingForRequestParameters:(id)a3;
@end

@implementation AMSDevice

+ (BOOL)deviceIsAudioAccessory
{
  return 0;
}

+ (NSString)productVersion
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%ld.%ld", 0, 0);
  return (NSString *)v4;
}

+ (NSString)operatingSystem
{
  return (NSString *)@"iOS";
}

+ (NSString)hardwareFamily
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain hardware family: %{public}d", buf, 0x1Cu);
    }
  }
  return (NSString *)v2;
}

+ (NSString)buildVersion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (__CFString *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain build version: %{public}d", buf, 0x1Cu);
    }
    v2 = @"1A0";
  }
  return (NSString *)v2;
}

+ (NSString)uniqueDeviceId
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MGCopyAnswerWithError();
  if (v2)
  {
    v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
    {
      if (!+[AMSDevice deviceIsAppleTV])
      {
        id v5 = v3;
        CFRelease(v5);
        goto LABEL_17;
      }
      id v5 = [v3 uppercaseString];
      CFRelease(v3);
      if (v5) {
        goto LABEL_17;
      }
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 1026;
      int v18 = 0;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain unique device identifier: %{public}d", buf, 0x1Cu);
    }
  }
  __int16 v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    __int16 v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain UUID.", buf, 2u);
  }

  id v5 = objc_alloc_init(NSString);
LABEL_17:
  return (NSString *)v5;
}

+ (BOOL)deviceIsAppleTV
{
  return 0;
}

+ (NSString)language
{
  if (!+[AMSDevice deviceIsAudioAccessory]
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKey:@"AppleLanguageCodeSetup"],
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    CFTypeID v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v5 = [v4 objectForKey:@"AppleLanguages"];

    objc_opt_class();
    id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;

    v3 = [v6 firstObject];

    if (!v3) {
      v3 = @"en";
    }
  }
  return (NSString *)v3;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

+ (unint64_t)buildVariant
{
  if (qword_1EB38D7D0 != -1) {
    dispatch_once(&qword_1EB38D7D0, &__block_literal_global_39);
  }
  return qword_1EB38D7C8;
}

+ (NSString)productType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    CFTypeID v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain product type: %{public}d", buf, 0x1Cu);
    }
  }
  return (NSString *)v2;
}

+ (NSString)hardwarePlatform
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    CFTypeID v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain hardware platform: %{public}d", buf, 0x1Cu);
    }
  }
  return (NSString *)v2;
}

+ (BOOL)deviceIsAppleWatch
{
  return 0;
}

+ (NSString)localIPAddress
{
  uint64_t v8 = 0;
  v2 = 0;
  if (!getifaddrs(&v8))
  {
    v3 = v8;
    if (v8)
    {
      while (1)
      {
        if (v3->ifa_addr->sa_family == 2)
        {
          CFTypeID v4 = [NSString stringWithUTF8String:v3->ifa_name];
          int v5 = [v4 isEqualToString:@"en0"];

          if (v5) {
            break;
          }
        }
        v3 = v3->ifa_next;
        if (!v3)
        {
          v2 = 0;
          goto LABEL_8;
        }
      }
      v6.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
      v2 = [NSString stringWithUTF8String:inet_ntoa(v6)];
    }
  }
LABEL_8:
  MEMORY[0x192FA44F0](v8);
  return (NSString *)v2;
}

+ (BOOL)deviceIsiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)deviceIsiPhone
{
  return MGGetSInt32Answer() == 1;
}

void __25__AMSDevice_buildVariant__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.da"];
    v0 = [v4 stringForKey:@"ExperimentGroup"];
    v1 = v0;
    if (v0)
    {
      if ([v0 isEqual:@"carry"])
      {
        uint64_t v2 = 3;
      }
      else
      {
        int v3 = [v1 isEqual:@"walkabout"];
        uint64_t v2 = 2;
        if (v3) {
          uint64_t v2 = 3;
        }
      }
    }
    else
    {
      uint64_t v2 = 1;
    }
    qword_1EB38D7C8 = v2;
  }
}

+ (BOOL)deviceIsiPadSimulator
{
  return 0;
}

+ (BOOL)deviceIsAppleWatchSimulator
{
  return 0;
}

+ (BOOL)deviceIsAppleTVSimulator
{
  return 0;
}

+ (BOOL)isRunningInStoreDemoMode
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)qword_1EB38D7E0;
  uint64_t v9 = qword_1EB38D7E0;
  if (!qword_1EB38D7E0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_1E559EC70;
    v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 isRunningInStoreDemoMode];
}

+ (NSSet)deviceOffers
{
  uint64_t v2 = +[AMSDefaults deviceOfferEligibility];
  id v3 = [v2 objectForKeyedSubscript:@"deviceOffers"];
  if ([v3 count])
  {
    id v4 = +[AMSDeviceOffer offersSetFromArray:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSSet *)v4;
}

+ (BOOL)expressedIntent
{
  uint64_t v2 = +[AMSDefaults deviceOfferEligibility];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"expressedIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [v4 BOOLValue];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isEligibleForOffers
{
  uint64_t v2 = +[AMSDefaults deviceOfferEligibility];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"isDeviceEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [v4 BOOLValue];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isGift
{
  uint64_t v2 = +[AMSDefaults deviceOfferEligibility];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"isGift"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [v4 BOOLValue];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)clearRegistrationDenyList
{
  uint64_t v2 = objc_alloc_init(AMSDeviceOffersStore);
  [(AMSDeviceOffersStore *)v2 setDeviceRegistrationDenyList:0];

  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Cleared the device S/N denylist.", v5, 2u);
  }
}

+ (BOOL)deviceOffersContainType:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = +[AMSDevice deviceOffers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AMSDevice_Offers__deviceOffersContainType___block_invoke;
  v6[3] = &unk_1E55A1BF8;
  v6[4] = &v7;
  v6[5] = a3;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __45__AMSDevice_Offers__deviceOffersContainType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 offerType];
  if (result == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)deviceOffersForType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = +[AMSDevice deviceOffers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = +[AMSDevice deviceOffers];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    __int16 v15 = __41__AMSDevice_Offers__deviceOffersForType___block_invoke;
    v16 = &unk_1E55A1C20;
    __int16 v17 = v6;
    unint64_t v18 = a3;
    uint64_t v8 = v6;
    [v7 enumerateObjectsUsingBlock:&v13];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v8, v13, v14, v15, v16);
    char v10 = v17;
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    char v10 = [v8 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find device offers of type: %@", buf, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

void __41__AMSDevice_Offers__deviceOffersForType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 offerType] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bag:(id)a5 logKey:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  __int16 v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = AMSLogKey();
    uint64_t v14 = [v8 hashedDescription];
    *(_DWORD *)buf = 138543618;
    v46 = v13;
    __int16 v47 = 2114;
    v48 = v14;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting all follow ups for account: %{public}@", buf, 0x16u);
  }
  __int16 v15 = +[AMSDevice deviceOffers];
  uint64_t v16 = [v15 count];
  if (v16)
  {
    uint64_t v17 = v16;
    id v43 = v10;
    id v44 = v9;
    unint64_t v18 = objc_msgSend(v15, "ams_filterUsingTest:", &__block_literal_global_38);
    uint64_t v19 = [v18 count];
    v20 = objc_msgSend(v15, "ams_filterUsingTest:", &__block_literal_global_29);
    uint64_t v21 = [v20 count];
    v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v41 = v15;
      v24 = v42 = v18;
      v25 = v20;
      id v26 = v8;
      v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v17];
      v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v19];
      v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v21];
      *(_DWORD *)buf = 138544130;
      v46 = v24;
      __int16 v47 = 2114;
      v48 = v27;
      __int16 v49 = 2114;
      v50 = v28;
      __int16 v51 = 2114;
      v52 = v29;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Offers count - Total: %{public}@, iCloud: %{public}@, Apple Music: %{public}@", buf, 0x2Au);

      id v8 = v26;
      v20 = v25;
      __int16 v15 = v41;

      unint64_t v18 = v42;
    }

    if (v19 && v21)
    {
      v30 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v30)
      {
        v30 = +[AMSLogConfig sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = AMSLogKey();
        *(_DWORD *)buf = 138543362;
        v46 = v32;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting unified followup for iCloud and Apple Music", buf, 0xCu);
      }
      v33 = &AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud;
    }
    else if (v19)
    {
      v30 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v30)
      {
        v30 = +[AMSLogConfig sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v36 = AMSLogKey();
        v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        *(_DWORD *)buf = 138543618;
        v46 = v36;
        __int16 v47 = 2114;
        v48 = v37;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Found %{public}@ iCloud offers, posting follow-up", buf, 0x16u);
      }
      v33 = &AMSDeviceOfferFollowUpIdentifieriCloud;
    }
    else
    {
      if (!v21)
      {
        BOOL v35 = 0;
        id v10 = v43;
        id v9 = v44;
        goto LABEL_35;
      }
      v30 = +[AMSLogConfig sharedAccountsAuthenticationPluginConfig];
      if (!v30)
      {
        v30 = +[AMSLogConfig sharedConfig];
      }
      v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v38 = AMSLogKey();
        v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSObject count](v20, "count"));
        *(_DWORD *)buf = 138543618;
        v46 = v38;
        __int16 v47 = 2114;
        v48 = v39;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Found %{public}@ AppleMusic offers, posting follow-up", buf, 0x16u);
      }
      v33 = &AMSDeviceOfferFollowUpIdentifierAppleMusic;
    }

    id v10 = v43;
    id v9 = v44;
    BOOL v35 = +[AMSDevice postDeviceOfferFollowUpWithIdentifier:*v33 account:v8 priority:0 bag:v44 logKey:v43];
  }
  else
  {
    unint64_t v18 = +[AMSLogConfig sharedConfig];
    if (!v18)
    {
      unint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v18 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v34 = AMSLogKey();
      *(_DWORD *)buf = 138543362;
      v46 = v34;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] No offers were found for which to post follow-up(s)", buf, 0xCu);
    }
    BOOL v35 = 0;
  }
LABEL_35:

  return v35;
}

BOOL __79__AMSDevice_Offers__postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 offerType] == 2;
}

BOOL __79__AMSDevice_Offers__postAllDeviceOfferFollowUpsForAccount_priority_bag_logKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 offerType] == 1;
}

+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6 logKey:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = objc_msgSend(v11, "ams_DSID");

  if (v13)
  {
    uint64_t v14 = objc_alloc_init(AMSFollowUp);
    id v31 = v12;
    __int16 v15 = +[AMSDevice _followUpItemWithIdentifier:v10 account:v11 priority:a5 bag:v12];
    uint64_t v16 = AMSLogKey();
    [v15 setLogKey:v16];

    uint64_t v17 = [(AMSFollowUp *)v14 postFollowUpItem:v15];
    id v32 = 0;
    id v18 = (id)[v17 resultWithTimeout:&v32 error:5.0];
    id v19 = v32;
    BOOL v20 = v19 == 0;
    uint64_t v21 = +[AMSLogConfig sharedConfig];
    v22 = (void *)v21;
    if (v19)
    {
      if (!v21)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      v34 = v24;
      __int16 v35 = 2114;
      id v36 = v10;
      __int16 v37 = 2114;
      id v38 = v19;
      v25 = "AMSDevice+Offers: [%{public}@] Failed to post follow up with identifier: %{public}@, error: %{public}@";
      id v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      uint32_t v28 = 32;
    }
    else
    {
      if (!v21)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      __int16 v35 = 2114;
      id v36 = v10;
      v25 = "AMSDevice+Offers: [%{public}@] Posted follow up with identifier: %{public}@";
      id v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
      uint32_t v28 = 22;
    }
    _os_log_impl(&dword_18D554000, v26, v27, v25, buf, v28);

LABEL_17:
    id v12 = v31;
    goto LABEL_18;
  }
  id v19 = +[AMSLogConfig sharedConfig];
  if (!v19)
  {
    id v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v14 = [v19 OSLogObject];
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_INFO))
  {
    v29 = AMSLogKey();
    *(_DWORD *)buf = 138543362;
    v34 = v29;
    _os_log_impl(&dword_18D554000, &v14->super, OS_LOG_TYPE_INFO, "AMSDevice+Offers: [%{public}@] Failed to post device offer for account with <nil> DSID", buf, 0xCu);
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

+ (void)registerCompanionWithSerialNumber:(id)a3 bag:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Attempting to register companion serial number: %@", buf, 0xCu);
  }

  if (v5)
  {
    id v9 = +[AMSDefaults deviceOfferEligibility];
    id v10 = (void *)[v9 mutableCopy];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    uint64_t v13 = +[AMSLogConfig sharedConfig];
    uint64_t v14 = (void *)v13;
    if (!v11)
    {
      if (!v13)
      {
        uint64_t v14 = +[AMSLogConfig sharedConfig];
      }
      id v19 = [v14 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find device offer eligibility dictionary, creating new instance", buf, 2u);
      }

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v28 = v5;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [v11 setObject:v18 forKeyedSubscript:@"companionSerialNumbers"];
      goto LABEL_33;
    }
    if (!v13)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    __int16 v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Found device offer eligibility dictionary", buf, 2u);
    }

    uint64_t v16 = [v11 objectForKeyedSubscript:@"companionSerialNumbers"];
    uint64_t v17 = (void *)[v16 mutableCopy];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;

      if (v18)
      {
LABEL_32:
        [v18 addObject:v5];
        v22 = (void *)[v18 copy];
        [v11 setObject:v22 forKeyedSubscript:@"companionSerialNumbers"];

LABEL_33:
        v23 = (void *)[v11 copy];
        +[AMSDefaults setDeviceOfferEligibility:v23];

        +[AMSDefaults setDidRetrieveDeviceOffers:0];
        v24 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        id v12 = objc_msgSend(v24, "ams_activeiTunesAccount");

        if (v12)
        {
          v25 = [[AMSDeviceOfferRegistrationTask alloc] initWithAccount:v12 bag:v6];
          id v26 = [(AMSDeviceOfferRegistrationTask *)v25 perform];
        }
        else
        {
          v25 = +[AMSLogConfig sharedConfig];
          if (!v25)
          {
            v25 = +[AMSLogConfig sharedConfig];
          }
          os_log_type_t v27 = [(AMSDeviceOfferRegistrationTask *)v25 OSLogObject];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Device offer registration could not be performed - no account", buf, 2u);
          }
        }
        goto LABEL_41;
      }
    }
    else
    {
    }
    BOOL v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      BOOL v20 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Failed to find companion serial number array, creating new instance", buf, 2u);
    }

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_32;
  }
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: Failed to register companion serial number for nil serial number", buf, 2u);
  }
LABEL_41:
}

+ (void)removeDeviceOfferRegistrationItem:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [a1 _removeDeviceOfferRegistrationItem:v4 fromDeviceOfferStore:v5];
}

+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5 logKey:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!+[AMSDevice tearDownAllDeviceOfferFollowUpsForAccount:v10 logKey:v12])
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = [v10 hashedDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v46 = v15;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to tear down all follow ups while removing device offer: %{public}@ for account: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v16 = +[AMSDefaults deviceOfferEligibility];
  uint64_t v17 = (void *)[v16 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  id v19 = [v18 objectForKeyedSubscript:@"deviceOffers"];
  BOOL v20 = (void *)[v19 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if ([v21 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__25;
    __int16 v47 = __Block_byref_object_dispose__25;
    id v48 = 0;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    __int16 v35 = __72__AMSDevice_Offers__removeDeviceOfferWithIdentifier_account_bag_logKey___block_invoke;
    id v36 = &unk_1E55A1C68;
    id v22 = v9;
    id v37 = v22;
    id v38 = buf;
    [v21 enumerateObjectsUsingBlock:&v33];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      objc_msgSend(v21, "removeObject:", v33, v34, v35, v36);
      v23 = (void *)[v21 copy];
      [v18 setObject:v23 forKeyedSubscript:@"deviceOffers"];

      v24 = (void *)[v18 copy];
      +[AMSDefaults setDeviceOfferEligibility:v24];
    }
    else
    {
      v24 = +[AMSLogConfig sharedConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v24 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = [v10 hashedDescription];
        *(_DWORD *)uint64_t v39 = 138543874;
        id v40 = v12;
        __int16 v41 = 2114;
        id v42 = v22;
        __int16 v43 = 2114;
        id v44 = v29;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to find device offer: %{public}@ for account: %{public}@", v39, 0x20u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v25 = +[AMSLogConfig sharedConfig];
    if (!v25)
    {
      v25 = +[AMSLogConfig sharedConfig];
    }
    id v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v27 = [v10 hashedDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v46 = v27;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to find any offers to remove while removing device offer: %{public}@ for account: %{public}@", buf, 0x20u);
    }
  }
  +[AMSDefaults setDidRetrieveDeviceOffers:0];
  id v30 = +[AMSLogConfig sharedConfig];
  if (!v30)
  {
    id v30 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v31 = [v30 OSLogObject];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = [v10 hashedDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Posting device offer followups for account: %{public}@", buf, 0x16u);
  }
  +[AMSDevice postAllDeviceOfferFollowUpsForAccount:v10 priority:0 bag:v11 logKey:v12];
}

void __72__AMSDevice_Offers__removeDeviceOfferWithIdentifier_account_bag_logKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [[AMSDeviceOffer alloc] initWithDictionary:v10];
  id v8 = [(AMSDeviceOffer *)v7 offerIdentifier];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (BOOL)saveDeviceOffersForAccount:(id)a3 response:(id)a4 logKey:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[AMSDefaults setDidRetrieveDeviceOffersEligibility:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v9 objectForKeyedSubscript:@"deviceEligibility"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v47 = +[AMSDefaults deviceOfferEligibility];
  uint64_t v14 = [v47 objectForKeyedSubscript:@"companionSerialNumbers"];
  if (v14) {
    [v13 setObject:v14 forKeyedSubscript:@"companionSerialNumbers"];
  }
  if (v12)
  {
    __int16 v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      __int16 v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: [%{public}@] Device is eligible, saving offers", buf, 0xCu);
    }

    uint64_t v17 = [v12 objectForKeyedSubscript:@"isDeviceEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v44 = [v17 BOOLValue];
    }
    else {
      unsigned int v44 = 0;
    }
    id v18 = [v12 objectForKeyedSubscript:@"eligibilityCriteria"];

    objc_opt_class();
    v45 = v18;
    id v46 = a1;
    __int16 v43 = v14;
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
      BOOL v20 = [v19 objectForKeyedSubscript:@"agreedToTerms"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v41 = [v20 BOOLValue];
      }
      else {
        unsigned int v41 = 0;
      }
      id v28 = [v19 objectForKeyedSubscript:@"expressedIntent"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v40 = [v28 BOOLValue];
      }
      else {
        unsigned int v40 = 0;
      }
      v29 = [v19 objectForKeyedSubscript:@"goodStanding"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = [v29 BOOLValue];
      }
      else {
        uint64_t v24 = 0;
      }
      id v30 = [v19 objectForKeyedSubscript:@"isGift"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v39 = [v30 BOOLValue];
      }
      else {
        unsigned int v39 = 0;
      }
      id v42 = v10;
      uint64_t v31 = [v19 objectForKeyedSubscript:@"isICloudFamily"];

      objc_opt_class();
      id v32 = v9;
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = [v31 BOOLValue];
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v33 = [v19 objectForKeyedSubscript:@"validPayment"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v27 = [v33 BOOLValue];
      }
      else {
        uint64_t v27 = 0;
      }

      id v9 = v32;
      id v21 = v42;
      uint64_t v23 = v40;
      uint64_t v22 = v41;
      uint64_t v25 = v39;
    }
    else
    {
      id v21 = v10;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    objc_msgSend(v8, "ams_setAgreedToTerms:", v22);
    objc_msgSend(v8, "ams_setInGoodStanding:", v24);
    objc_msgSend(v8, "ams_setiCloudFamily:", v26);
    objc_msgSend(v8, "ams_setValidPayment:", v27);
    uint64_t v34 = [MEMORY[0x1E4F28ED0] numberWithBool:v23];
    [v13 setObject:v34 forKeyedSubscript:@"expressedIntent"];

    __int16 v35 = [MEMORY[0x1E4F28ED0] numberWithBool:v44];
    [v13 setObject:v35 forKeyedSubscript:@"isDeviceEligible"];

    id v36 = [MEMORY[0x1E4F28ED0] numberWithBool:v25];
    [v13 setObject:v36 forKeyedSubscript:@"isGift"];

    a1 = v46;
    id v10 = v21;
    uint64_t v14 = v43;
  }
  id v37 = objc_opt_new();
  [a1 _setDeviceEligibilityKeepingExistingDeviceOffers:v13 offersStore:v37];

  return v12 != 0;
}

+ (void)saveDeviceOfferEligibility:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  id v5 = [v4 objectForKeyedSubscript:@"deviceOffers"];
  [a1 _setDeviceEligibilityKeepingExistingDeviceOffers:v4 offersStore:v6];

  [a1 saveDeviceOffers:v5];
}

+ (void)saveDeviceOffers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[AMSDefaults didRetrieveTVOffers])
  {
    uint64_t v5 = objc_msgSend(v4, "ams_filterUsingTest:", &__block_literal_global_61);

    id v4 = (id)v5;
  }
  else if (objc_msgSend(v4, "ams_anyWithTest:", &__block_literal_global_63))
  {
    +[AMSDefaults setDidRetrieveTVOffers:1];
  }
  id v6 = objc_opt_new();
  int v7 = [a1 _setRawDeviceOffers:v4 offersStore:v6];

  if (v7)
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = AMSLogKey();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Posting offers changed notification", (uint8_t *)&v12, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.AppleMediaServices.deviceOffersChanged", 0, 0, 1u);
  }
}

uint64_t __38__AMSDevice_Offers__saveDeviceOffers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AMSDeviceOffer alloc] initWithDictionary:v2];

  id v4 = [(AMSDeviceOffer *)v3 offerIdentifier];
  uint64_t v5 = [v4 isEqualToString:@"com.apple.TV"] ^ 1;

  return v5;
}

uint64_t __38__AMSDevice_Offers__saveDeviceOffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AMSDeviceOffer alloc] initWithDictionary:v2];

  id v4 = [(AMSDeviceOffer *)v3 offerIdentifier];
  uint64_t v5 = [v4 isEqualToString:@"com.apple.TV"];

  return v5;
}

+ (void)setDeviceOffersCheckEncodingForRequestParameters:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[AMSDefaults didRetrieveDeviceOffersEligibility];
  if (v3)
  {
    BOOL v5 = v4;
    BOOL v6 = +[AMSProcessInfo isBuddyRunning];
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    id v8 = v7;
    if (v6 || !v5)
    {
      if (!v7)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v11 = [v8 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Will decorate request parameters with serial number", (uint8_t *)&v24, 2u);
      }

      objc_msgSend(v3, "ams_setNullableObject:forKey:", @"true", @"deviceOffersCheck");
      int v12 = +[AMSDefaults deviceOfferEligibility];
      id v13 = [v12 objectForKeyedSubscript:@"companionSerialNumbers"];
      uint64_t v14 = (void *)[v13 mutableCopy];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v14;
      }
      else {
        id v8 = 0;
      }

      uint64_t v15 = +[AMSDevice serialNumber];
      id v9 = v15;
      if (v8)
      {
        if (v15) {
          [v8 addObject:v15];
        }
        uint64_t v16 = +[AMSLogConfig sharedConfig];
        if (!v16)
        {
          uint64_t v16 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          uint64_t v25 = v8;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Decorating request parameters with serial numbers: %@", (uint8_t *)&v24, 0xCu);
        }

        objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"serialNumber");
      }
      else
      {
        if (os_variant_has_internal_content())
        {
          id v18 = +[AMSDefaults deviceOffersSerialNumber];
          if (v18)
          {
            id v19 = +[AMSLogConfig sharedConfig];
            if (!v19)
            {
              id v19 = +[AMSLogConfig sharedConfig];
            }
            BOOL v20 = [v19 OSLogObject];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 138412290;
              uint64_t v25 = v18;
              _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Internal deviceOffer serial number override found: %@", (uint8_t *)&v24, 0xCu);
            }

            id v21 = v18;
            id v9 = v21;
          }
        }
        uint64_t v22 = +[AMSLogConfig sharedConfig];
        if (!v22)
        {
          uint64_t v22 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v23 = [v22 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          uint64_t v25 = v9;
          _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Decorating request parameters with serial number: %@", (uint8_t *)&v24, 0xCu);
        }

        objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, @"serialNumber");
        id v8 = 0;
      }
    }
    else
    {
      if (!v7)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        id v10 = "AMSDevice+Offers: Skipping decoration of request parameters with serial number";
LABEL_12:
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 2u);
      }
    }
  }
  else
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      id v10 = "AMSDevice+Offers: Skipping decoration of request parameters with serial number for no request parameters";
      goto LABEL_12;
    }
  }
}

+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3
{
  return [a1 shouldPresentSetupOffersForAccount:a3 issues:0];
}

+ (BOOL)shouldPresentSetupOffersForAccount:(id)a3 issues:(int64_t *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    BOOL v5 = +[AMSDevice isEligibleForOffers];
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v7 = objc_msgSend(v6, "ams_activeiCloudAccount");
    id v8 = objc_msgSend(v6, "ams_activeiTunesAccount");
    uint64_t v9 = [v7 ams_DSID];
    if (v9
      && (id v10 = (void *)v9,
          objc_msgSend(v8, "ams_DSID"),
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      int v12 = [v7 ams_DSID];
      id v13 = objc_msgSend(v8, "ams_DSID");
      unsigned int v30 = [v12 isEqualToNumber:v13];
    }
    else
    {
      unsigned int v30 = 0;
    }
    uint64_t v14 = +[AMSDevice deviceOffers];
    uint64_t v15 = [v14 count];

    v29 = [v7 hashedDescription];
    id v28 = [v8 hashedDescription];
    uint64_t v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = v4;
      [MEMORY[0x1E4F28ED0] numberWithBool:v5];
      id v18 = v26 = v6;
      id v19 = [MEMORY[0x1E4F28ED0] numberWithBool:v30];
      BOOL v20 = [MEMORY[0x1E4F28ED0] numberWithBool:v15 != 0];
      *(_DWORD *)buf = 138413314;
      id v32 = v29;
      __int16 v33 = 2112;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v19;
      __int16 v39 = 2112;
      unsigned int v40 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Determining setup device offer eligibility for iCloud account: %@, iTunes account: %@, isEligible: %@, isCombinedAccount: %@, hasOffers: %@", buf, 0x34u);

      BOOL v4 = v27;
      BOOL v6 = v26;
    }

    BOOL v21 = v5 & v30;
    if (v15) {
      BOOL v22 = v5 & v30;
    }
    else {
      BOOL v22 = 0;
    }
    if (v4)
    {
      int64_t *v4 = 0;
      if (!v15) {
        BOOL v21 = 0;
      }
      if (!v21)
      {
        uint64_t v23 = 2;
        if (v5) {
          uint64_t v23 = 0;
        }
        int64_t v24 = v23 | v30 ^ 1;
        if (!v15) {
          v24 |= 4uLL;
        }
        int64_t *v4 = v24;
      }
    }
  }
  else
  {
    BOOL v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      BOOL v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: No account specified for offer check", buf, 2u);
    }
    BOOL v22 = 0;
  }

  return v22;
}

+ (BOOL)tearDownAllDeviceOfferFollowUpsForAccount:(id)a3 logKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 hashedDescription];
    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Tearing down all follow ups for account: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  BOOL v10 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:AMSDeviceOfferFollowUpIdentifierAppleMusic account:v5 logKey:v6];
  BOOL v11 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud account:v5 logKey:v6];
  BOOL v12 = +[AMSDevice tearDownDeviceOfferFollowUpWithIdentifier:AMSDeviceOfferFollowUpIdentifieriCloud account:v5 logKey:v6];

  return v10 && v11 && v12;
}

+ (BOOL)tearDownDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 logKey:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v37 = a5;
  uint64_t v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  BOOL v10 = [v9 OSLogObject];
  id v36 = v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = [v8 hashedDescription];
    *(_DWORD *)buf = 138543874;
    id v49 = v37;
    __int16 v50 = 2114;
    id v51 = v36;
    __int16 v52 = 2114;
    uint64_t v53 = v11;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offer: [%{public}@] Tearing down follow up with identifier: %{public}@, for account: %{public}@", buf, 0x20u);

    id v7 = v36;
  }

  __int16 v39 = objc_alloc_init(AMSFollowUp);
  BOOL v12 = [(AMSFollowUp *)v39 pendingFollowUps];
  id v46 = 0;
  id v13 = [v12 resultWithError:&v46];
  id v14 = v46;

  int v15 = v14 == 0;
  __int16 v35 = v8;
  if (v14)
  {

    __int16 v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      __int16 v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v49 = v37;
      __int16 v50 = 2114;
      id v51 = v7;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to locate pending items to tear down followup with identifier: %{public}@", buf, 0x16u);
    }

    id v13 = 0;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v13;
  uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v43;
    do
    {
      uint64_t v21 = 0;
      uint64_t v38 = v19;
      do
      {
        if (*(void *)v43 != v20) {
          objc_enumerationMutation(obj);
        }
        BOOL v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
        uint64_t v23 = [v22 identifier];
        int v24 = [v23 isEqualToString:v7];

        if (v24)
        {
          uint64_t v25 = [(AMSFollowUp *)v39 clearFollowUpItem:v22];
          id v41 = v14;
          int v26 = [v25 resultWithTimeout:&v41 error:5.0];
          id v27 = v41;

          if (v27)
          {
            uint64_t v28 = v20;
            int v29 = v15;
            unsigned int v30 = +[AMSLogConfig sharedConfig];
            if (!v30)
            {
              unsigned int v30 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v31 = [v30 OSLogObject];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              id v32 = [v22 identifier];
              __int16 v33 = [v22 account];
              *(_DWORD *)buf = 138543874;
              id v49 = v37;
              __int16 v50 = 2114;
              id v51 = v32;
              __int16 v52 = 2114;
              uint64_t v53 = v33;
              _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "AMSDevice+Offers: [%{public}@] Failed to tear down followup with identifier: %{public}@ account: %{public}@", buf, 0x20u);

              id v7 = v36;
            }

            int v15 = v29;
            uint64_t v20 = v28;
            uint64_t v19 = v38;
          }
          v15 &= v26;

          id v14 = v27;
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v19);
  }

  return v15 & 1;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_97 != -1) {
    dispatch_once(&_MergedGlobals_97, &__block_literal_global_76);
  }
  id v2 = (void *)qword_1EB38D7A8;
  return (NSString *)v2;
}

void __34__AMSDevice_Offers__bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D7A8;
  qword_1EB38D7A8 = @"AMSDeviceOffers";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D7B0 != -1) {
    dispatch_once(&qword_1EB38D7B0, &__block_literal_global_81);
  }
  id v2 = (void *)qword_1EB38D7B8;
  return (NSString *)v2;
}

void __41__AMSDevice_Offers__bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D7B8;
  qword_1EB38D7B8 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  BOOL v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (id)cachedRegistrationGroups
{
  id v2 = objc_opt_new();
  id v3 = [v2 cachedRegistrationGroups];

  return v3;
}

+ (id)registrationDenyList
{
  id v2 = objc_opt_new();
  id v3 = [v2 deviceRegistrationDenyList];

  return v3;
}

+ (id)_followUpItemWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bag:(id)a6
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v52 = a6;
  id v9 = a4;
  BOOL v10 = [[AMSFollowUpItem alloc] initWithIdentifier:v51 account:v9 priority:a5];
  [(AMSFollowUpItem *)v10 setShouldPostNotification:0];
  BOOL v11 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_retail_sub"];
  [(AMSMetricsEvent *)v11 setEventType:@"page"];
  [(AMSMetricsEvent *)v11 setProperty:@"AccountFollowUp" forBodyKey:@"pageId"];
  [(AMSMetricsEvent *)v11 setProperty:@"Picker" forBodyKey:@"pageType"];
  [(AMSMetricsEvent *)v11 setProperty:@"Settings" forBodyKey:@"pageContext"];
  uint64_t v53 = v11;
  [(AMSFollowUpItem *)v10 setMetricsEvent:v11];
  BOOL v12 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_retail_sub"];
  [(AMSMetricsEvent *)v12 setEventType:@"click"];
  [(AMSMetricsEvent *)v12 setProperty:@"AccountFollowUp" forBodyKey:@"pageId"];
  [(AMSMetricsEvent *)v12 setProperty:@"open" forBodyKey:@"actionType"];
  [(AMSMetricsEvent *)v12 setProperty:@"button" forBodyKey:@"targetType"];
  [(AMSMetricsEvent *)v12 setProperty:@"SetUpAppleMusic" forBodyKey:@"targetId"];
  id v13 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_retail_sub"];
  [(AMSMetricsEvent *)v13 setEventType:@"click"];
  [(AMSMetricsEvent *)v13 setProperty:@"AccountFollowUp" forBodyKey:@"pageId"];
  [(AMSMetricsEvent *)v13 setProperty:@"open" forBodyKey:@"actionType"];
  [(AMSMetricsEvent *)v13 setProperty:@"button" forBodyKey:@"targetType"];
  uint64_t v54 = v13;
  [(AMSMetricsEvent *)v13 setProperty:@"SetUpIcloud" forBodyKey:@"targetId"];
  id v14 = [v9 username];

  if ([v51 isEqualToString:AMSDeviceOfferFollowUpIdentifierAppleMusic])
  {
    int v15 = NSString;
    __int16 v16 = v52;
    uint64_t v17 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_DESC_APPLE_ACCOUNT", v52);
    uint64_t v18 = [v15 stringWithValidatedFormat:v17, @"%@", 0, v14 validFormatSpecifiers error];
    [(AMSFollowUpItem *)v10 setInformativeText:v18];

    uint64_t v19 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_TITLE", v52);
    [(AMSFollowUpItem *)v10 setTitle:v19];

    uint64_t v20 = [AMSFollowUpAction alloc];
    uint64_t v21 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_CONTINUE_LABEL", v52);
    BOOL v22 = [(AMSFollowUpAction *)v20 initWithLabel:v21 parentIdentifier:v51];

    [(AMSFollowUpAction *)v22 setPreferredClient:@"com.apple.Music"];
    uint64_t v23 = [v52 URLForKey:@"appleMusicDeviceOfferDeepLink"];
    int v24 = [v23 valueWithError:0];
    [(AMSFollowUpAction *)v22 setUrl:v24];

    [(AMSFollowUpAction *)v22 setMetricsEvent:v12];
    v57[0] = v22;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    [(AMSFollowUpItem *)v10 setActions:v25];
    int v26 = v10;
    id v27 = v12;
    uint64_t v28 = v54;
  }
  else
  {
    __int16 v16 = v52;
    if ([v51 isEqualToString:AMSDeviceOfferFollowUpIdentifieriCloud])
    {
      int v29 = NSString;
      unsigned int v30 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_DESC_APPLE_ACCOUNT", v52);
      uint64_t v31 = [v29 stringWithValidatedFormat:v30, @"%@", 0, v14 validFormatSpecifiers error];
      int v26 = v10;
      [(AMSFollowUpItem *)v10 setInformativeText:v31];

      id v32 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_TITLE", v52);
      [(AMSFollowUpItem *)v10 setTitle:v32];

      __int16 v33 = [AMSFollowUpAction alloc];
      uint64_t v34 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_CONTINUE_LABEL", v52);
      BOOL v22 = [(AMSFollowUpAction *)v33 initWithLabel:v34 parentIdentifier:v51];

      __int16 v35 = [v52 URLForKey:@"iCloudDeviceOfferDeepLink"];
      id v36 = [v35 valueWithError:0];
      [(AMSFollowUpAction *)v22 setUrl:v36];

      uint64_t v28 = v13;
      [(AMSFollowUpAction *)v22 setMetricsEvent:v13];
      v56 = v22;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      [(AMSFollowUpItem *)v26 setActions:v25];
    }
    else
    {
      int v26 = v10;
      id v27 = v12;
      uint64_t v28 = v13;
      if (![v51 isEqualToString:AMSDeviceOfferFollowUpIdentifierAppleMusicAndiCloud]) {
        goto LABEL_9;
      }
      id v37 = NSString;
      uint64_t v38 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_UNIFIED_DESC_APPLE_ACCOUNT", v52);
      __int16 v39 = [v37 stringWithValidatedFormat:v38, @"%@", 0, v14 validFormatSpecifiers error];
      [(AMSFollowUpItem *)v26 setInformativeText:v39];

      unsigned int v40 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_UNIFIED_TITLE", v52);
      [(AMSFollowUpItem *)v26 setTitle:v40];

      id v41 = [AMSFollowUpAction alloc];
      long long v42 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_APPLE_MUSIC_LABEL", v52);
      BOOL v22 = [(AMSFollowUpAction *)v41 initWithLabel:v42 parentIdentifier:v51];

      [(AMSFollowUpAction *)v22 setPreferredClient:@"com.apple.Music"];
      long long v43 = [v52 URLForKey:@"appleMusicDeviceOfferDeepLink"];
      long long v44 = [v43 valueWithError:0];
      [(AMSFollowUpAction *)v22 setUrl:v44];

      [(AMSFollowUpAction *)v22 setMetricsEvent:v12];
      uint64_t v28 = v13;
      long long v45 = [AMSFollowUpAction alloc];
      id v46 = AMSLocalizedString(@"DEVICE_OFFERS_FOLLOWUP_ICLOUD_STORAGE_LABEL", v52);
      uint64_t v25 = [(AMSFollowUpAction *)v45 initWithLabel:v46 parentIdentifier:v51];

      __int16 v47 = [v52 URLForKey:@"iCloudDeviceOfferDeepLink"];
      id v48 = [v47 valueWithError:0];
      [(AMSFollowUpAction *)v25 setUrl:v48];

      [(AMSFollowUpAction *)v25 setMetricsEvent:v54];
      [(AMSFollowUpAction *)v25 setShouldClear:1];
      v55[0] = v22;
      v55[1] = v25;
      id v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      [(AMSFollowUpItem *)v26 setActions:v49];
    }
    id v27 = v12;
  }

LABEL_9:
  return v26;
}

+ (id)_notificationIdFromFollowUpId:(id)a3 account:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@", a4, a3];
}

+ (void)_performAuth
{
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Attempting to perform silent auth.", buf, 2u);
  }

  BOOL v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v5 = objc_msgSend(v4, "ams_activeiTunesAccount");

  if (v5)
  {
    id v6 = objc_alloc_init(AMSAuthenticateOptions);
    [(AMSAuthenticateOptions *)v6 setDebugReason:@"device offers"];
    [(AMSAuthenticateOptions *)v6 setAuthenticationType:1];
    [(AMSAuthenticateOptions *)v6 setCanMakeAccountActive:0];
    id v7 = [[AMSAuthenticateTask alloc] initWithAccount:v5 options:v6];
    id v8 = [(AMSAuthenticateTask *)v7 performAuthentication];
    [v8 addSuccessBlock:&__block_literal_global_178];
    [v8 addErrorBlock:&__block_literal_global_182];
  }
  else
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [(AMSAuthenticateOptions *)v6 OSLogObject];
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18D554000, &v7->super.super, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Silent auth attempt failed for no account", v9, 2u);
    }
  }
}

void __33__AMSDevice_Offers___performAuth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  BOOL v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Register Serial: Silent auth did succeed with result: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void __33__AMSDevice_Offers___performAuth__block_invoke_179(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  BOOL v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "AMSDevice+Offers: Register Serial: Silent auth failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)_removeDeviceOfferRegistrationItem:(id)a3 fromDeviceOfferStore:(id)a4
{
}

+ (void)_setDeviceEligibilityKeepingExistingDeviceOffers:(id)a3 offersStore:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v9 = [v5 dictionaryWithDictionary:a3];
  uint64_t v7 = [v6 deviceOffers];
  [v9 setObject:v7 forKeyedSubscript:@"deviceOffers"];

  id v8 = (void *)[v9 copy];
  [v6 setDeviceOfferEligibility:v8];
}

+ (BOOL)_setRawDeviceOffers:(id)a3 offersStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 deviceOffers];
  id v9 = (void *)v8;
  BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    BOOL v10 = (void *)v8;
  }
  id v11 = v10;

  char v12 = [a1 _shouldPostOffersUpdatedNotification:v7 oldOffers:v11];
  [v6 setDeviceOffers:v7];

  return v12;
}

+ (BOOL)_shouldPostOffersUpdatedNotification:(id)a3 oldOffers:(id)a4
{
  id v5 = a3;
  id v6 = __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke((uint64_t)a4);
  id v7 = __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke((uint64_t)v5);

  LOBYTE(v5) = [v6 isEqualToDictionary:v7] ^ 1;
  return (char)v5;
}

id __68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke(uint64_t a1)
{
  v1 = +[AMSDeviceOffer offersSetFromArray:a1];
  id v2 = [v1 allObjects];
  id v3 = objc_msgSend(v2, "ams_dictionaryUsingTransform:", &__block_literal_global_188);

  return v3;
}

__CFString *__68__AMSDevice_Offers___shouldPostOffersUpdatedNotification_oldOffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 offerIdentifier];
  id v3 = v2;
  if (!v2) {
    id v2 = &stru_1EDCA7308;
  }
  BOOL v4 = v2;

  return v4;
}

+ (BOOL)postAllDeviceOfferFollowUpsForAccount:(id)a3 priority:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = AMSSetLogKey(v10);
  id v14 = [[AMSContractBagShim alloc] initWithBagContract:v11];

  LOBYTE(v11) = [a1 postAllDeviceOfferFollowUpsForAccount:v12 priority:a4 bag:v14 logKey:v10];
  return (char)v11;
}

+ (BOOL)postDeviceOfferFollowUpWithIdentifier:(id)a3 account:(id)a4 priority:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = AMSSetLogKey(v12);
  uint64_t v17 = [[AMSContractBagShim alloc] initWithBagContract:v13];

  LOBYTE(v13) = [a1 postDeviceOfferFollowUpWithIdentifier:v15 account:v14 priority:a5 bag:v17 logKey:v12];
  return (char)v13;
}

+ (void)registerCompanionWithSerialNumber:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDeviceOfferRegistrationTask bagSubProfile];
  id v6 = +[AMSDeviceOfferRegistrationTask bagSubProfileVersion];
  id v7 = +[AMSBag bagForProfile:v5 profileVersion:v6];

  [a1 registerCompanionWithSerialNumber:v4 bag:v7];
}

+ (void)removeDeviceOfferWithIdentifier:(id)a3 account:(id)a4 bagContract:(id)a5 logKey:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = AMSSetLogKey(v10);
  id v15 = [[AMSContractBagShim alloc] initWithBagContract:v11];

  [a1 removeDeviceOfferWithIdentifier:v13 account:v12 bag:v15 logKey:v10];
}

+ (int64_t)biometricState
{
  return +[AMSDefaults deviceBiometricsState];
}

+ (void)setBiometricState:(int64_t)a3
{
}

+ (NSArray)carrierNames
{
  id v2 = +[AMSTelephonyDataCache sharedCache];
  id v3 = [v2 carrierNames];

  return (NSArray *)v3;
}

+ (id)carrierNamesPromise
{
  id v2 = +[AMSTelephonyDataCache sharedCache];
  id v3 = [v2 carrierNamesPromise];

  return v3;
}

+ (NSString)compatibleProductType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = (const __CFDictionary *)MGCopyAnswerWithError();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v2, @"CompatibleDeviceFallback");
    id v5 = (__CFString *)Value;
    if (Value)
    {
      if (CFStringCompare(Value, @"0", 0)) {
        id v5 = (__CFString *)[(__CFString *)v5 copy];
      }
      else {
        id v5 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v9;
      __int16 v15 = 1026;
      int v16 = 0;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain artwork traits: %{public}d", buf, 0x1Cu);
    }
    id v5 = 0;
  }
  return (NSString *)v5;
}

+ (NSString)deviceName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = (__CFString *)MGCopyAnswerWithError();
  if (!v2)
  {
    CFDictionaryRef v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      CFDictionaryRef v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      id v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain user assigned device name: %{public}d", buf, 0x1Cu);
    }
    CFDictionaryRef v2 = @"Unknown";
  }
  return (NSString *)v2;
}

+ (BOOL)isSecureElementAvailable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (v2)
  {
    CFBooleanRef v3 = v2;
    BOOL v4 = CFBooleanGetValue(v2) != 0;
    CFRelease(v3);
  }
  else
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 1026;
      int v16 = 0;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%@] Failed to determine Secure Element availability: %{public}d", buf, 0x1Cu);
    }
    return 0;
  }
  return v4;
}

+ (NSString)macAddress
{
  CFBooleanRef v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    CFBooleanRef v2 = +[AMSLogConfig sharedConfig];
  }
  CFBooleanRef v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain MAC address for unsupported platform.", v7, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v5 = (void *)[v4 copy];

  return (NSString *)v5;
}

+ (NSData)macAddressData
{
  CFBooleanRef v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    CFBooleanRef v2 = +[AMSLogConfig sharedConfig];
  }
  CFBooleanRef v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_ERROR, "AMSDevice: Failed to obtain MAC address data for unsupported platform.", v6, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  return (NSData *)v4;
}

+ (NSString)MLBSerialNumber
{
  return 0;
}

+ (NSString)modelPartNumber
{
  CFBooleanRef v3 = [a1 _regionInfo];
  uint64_t v4 = [a1 _modelNumber];
  uint64_t v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v6 = [NSString stringWithFormat:@"%@%@", v4, v3];
  }

  return (NSString *)v6;
}

+ (NSString)name
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[AMSDevice deviceIsiPad]
    || +[AMSDevice deviceIsiPadSimulator])
  {
    return (NSString *)@"iPad";
  }
  if (!+[AMSDevice deviceIsiPhone]
    && !+[AMSDevice deviceIsiPhoneSimulator])
  {
    if (+[AMSDevice deviceIsiPod]
      || +[AMSDevice deviceIsiPodSimulator])
    {
      return (NSString *)@"iPod";
    }
    uint64_t v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      uint64_t v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      int v7 = 138543618;
      id v8 = a1;
      __int16 v9 = 2112;
      __int16 v10 = v6;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%@] unable to determine iOS device family", (uint8_t *)&v7, 0x16u);
    }
  }
  return (NSString *)@"iPhone";
}

+ (NSString)phoneNumber
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    CFBooleanRef v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v5;
    __int16 v30 = 2114;
    uint64_t v31 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching the device's phone number.", buf, 0x16u);
  }
  int v7 = [a1 _voicePreferredPhoneNumberContext];
  id v8 = [v7 phoneNumber];
  uint64_t v9 = [v8 length];
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  uint64_t v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = AMSLogKey();
      uint64_t v14 = NSString;
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = v15;
      if (v13)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"%@: [%@] ", v16, a1];
      }
      else
      {
        [v14 stringWithFormat:@"%@: ", v15];
      uint64_t v17 = };
      int v24 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = (uint64_t)v17;
      __int16 v30 = 2114;
      uint64_t v31 = v24;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched the device's phone number. phoneNumber = %{public}@", buf, 0x16u);
      if (v13)
      {

        uint64_t v17 = a1;
      }
    }
    id v25 = v8;
  }
  else
  {
    if (!v10)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v11 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = AMSLogKey();
      uint64_t v20 = NSString;
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = v21;
      if (v19)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v20 stringWithFormat:@"%@: [%@] ", v22, a1];
      }
      else
      {
        [v20 stringWithFormat:@"%@: ", v21];
      uint64_t v23 = };
      int v26 = AMSHashIfNeeded(v7);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = (uint64_t)v23;
      __int16 v30 = 2112;
      uint64_t v31 = v26;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the device's phone number. phoneNumberInfo = %@", buf, 0x16u);
      if (v19)
      {

        uint64_t v23 = a1;
      }
    }
    id v25 = 0;
  }

  return (NSString *)v25;
}

+ (NSString)regionCode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    CFBooleanRef v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      CFBooleanRef v3 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain regionCode: %{public}d", buf, 0x1Cu);
    }
  }
  return (NSString *)v2;
}

+ (NSString)ROMAddress
{
  return 0;
}

+ (NSNumber)screenScale
{
  CFBooleanRef v2 = (void *)MEMORY[0x1E4F28ED0];
  MGGetFloat32Answer();
  return (NSNumber *)objc_msgSend(v2, "numberWithFloat:");
}

+ (NSNumber)screenHeight
{
  CFBooleanRef v2 = (void *)MGGetSInt64Answer();
  if (v2)
  {
    CFBooleanRef v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v2];
  }
  return (NSNumber *)v2;
}

+ (NSNumber)screenWidth
{
  CFBooleanRef v2 = (void *)MGGetSInt64Answer();
  if (v2)
  {
    CFBooleanRef v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v2];
  }
  return (NSNumber *)v2;
}

+ (NSString)secureElementID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  CFBooleanRef v2 = (void *)getNFSecureElementClass_softClass;
  uint64_t v17 = getNFSecureElementClass_softClass;
  if (!getNFSecureElementClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v19 = __getNFSecureElementClass_block_invoke;
    uint64_t v20 = &unk_1E559EC70;
    uint64_t v21 = &v14;
    __getNFSecureElementClass_block_invoke((uint64_t)&buf);
    CFBooleanRef v2 = (void *)v15[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v14, 8);
  if (v3 && getNFHardwareManagerClass())
  {
    uint64_t v4 = (void *)xpc_copy_entitlement_for_self();
    uint64_t v5 = v4;
    if (v4 && xpc_BOOL_get_value(v4))
    {
      id v6 = objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager", v14);
      int v7 = [v6 secureElements];

      id v8 = [v7 objectAtIndex:0];
      uint64_t v9 = [v8 serialNumber];

      __int16 v10 = v9;
    }
    else
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
      if (!v9)
      {
        uint64_t v9 = +[AMSLogConfig sharedConfig];
      }
      int v7 = [v9 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: The current process is missing the entitlement com.apple.nfcd.hwmanager", (uint8_t *)&buf, 0xCu);
      }
      __int16 v10 = 0;
    }
  }
  else
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v5 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: NearField classes unavailable", (uint8_t *)&buf, 0xCu);
    }
    __int16 v10 = 0;
  }

  return (NSString *)v10;
}

+ (NSString)serialNumber
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    id v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = AMSLogKey();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 1026;
      int v13 = 0;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain serial number: %{public}d", buf, 0x1Cu);
    }
  }
  return (NSString *)v2;
}

+ (NSString)thinnedAppVariantId
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [a1 productType];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [a1 compatibleProductType];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [v3 componentsJoinedByString:@" "];

  return (NSString *)v6;
}

+ (id)voicePreferredPACToken
{
  CFBooleanRef v2 = [a1 voicePreferredPhoneNumberContextInfo];
  id v3 = [AMSPACTokenTask alloc];
  uint64_t v4 = [v2 simLabel];
  uint64_t v5 = [(AMSPACTokenTask *)v3 initWithSimLabelID:v4];
  id v6 = [(AMSPACTokenTask *)v5 perform];

  return v6;
}

+ (BOOL)deviceIsChinaSKU
{
  if (qword_1EB38D7D8 != -1) {
    dispatch_once(&qword_1EB38D7D8, &__block_literal_global_120_0);
  }
  return _MergedGlobals_98;
}

uint64_t __29__AMSDevice_deviceIsChinaSKU__block_invoke()
{
  uint64_t result = os_eligibility_get_domain_answer();
  _MergedGlobals_98 = 0;
  return result;
}

+ (BOOL)deviceIsiPhoneSimulator
{
  return 0;
}

+ (BOOL)deviceIsiPod
{
  return MGGetSInt32Answer() == 2;
}

+ (BOOL)deviceIsiPodSimulator
{
  return 0;
}

+ (BOOL)deviceIsMac
{
  return 0;
}

+ (BOOL)deviceIsRealityDevice
{
  return 0;
}

+ (BOOL)deviceIsRealityDeviceSimulator
{
  return 0;
}

+ (BOOL)deviceIsComputeModule
{
  return MGGetSInt32Answer() == 12;
}

+ (BOOL)deviceIsBundle
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  id v3 = MEMORY[0x192FA3770](&v19, a2);
  id v4 = v19;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
  unint64_t v6 = [v5 integerValue];

  uint64_t v7 = +[AMSLogConfig sharedConfig];
  id v8 = (void *)v7;
  if (v4)
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      id v25 = v4;
      __int16 v12 = "%{public}@: [%{public}@] Failed to retrieve activation record with error: %{public}@";
      int v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_18D554000, v13, v14, v12, buf, 0x20u);
    }
  }
  else
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      id v25 = v3;
      __int16 v12 = "%{public}@: [%{public}@] Fetched activation record: %{public}@";
      int v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  uint64_t v16 = [[AMSStorageDatabase alloc] initWithDomain:@"com.apple.AppleMediaServices"];
  char v17 = objc_msgSend(a1, "_deviceIsBundleWithMobileActivationFlag:storage:canHonorLasset:defaultsFlag:", (v6 >> 6) & 1, v16, +[AMSAcknowledgePrivacyTask hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements](AMSAcknowledgePrivacyTask, "hasPreviouslyAcknowledgedAnyBundlePrivacyAcknowledgements"), +[AMSDefaults deviceIsBundleOverride](AMSDefaults, "deviceIsBundleOverride"));

  return v17;
}

+ (BOOL)deviceIsPasscodeProtected
{
  return MGGetBoolAnswer();
}

+ (BOOL)isWalletBiometricsEnabled
{
  CFBooleanRef v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74018]] == 1;

  return v3;
}

+ (id)_voicePreferredPhoneNumberContext
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = +[AMSTelephonyDataCache sharedCache];
  BOOL v3 = [v2 activeContexts];

  id v4 = [v3 voicePreferred];
  if (v4)
  {
    uint64_t v5 = [v3 findForUuid:v4];
    if (v5)
    {
      unint64_t v6 = [AMSPhoneNumberContextInfo alloc];
      uint64_t v7 = [v5 phoneNumber];
      id v8 = [v5 labelID];
      uint64_t v9 = [v5 uuid];
      uint64_t v10 = [(AMSPhoneNumberContextInfo *)v6 initWithPhoneNumber:v7 simLabel:v8 uuid:v9 isVoicePreferred:1];

      uint64_t v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      __int16 v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        os_log_type_t v14 = AMSLogKey();
        uint64_t v15 = AMSHashIfNeeded(v10);
        int v21 = 138543874;
        uint64_t v22 = v13;
        __int16 v23 = 2114;
        __int16 v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched the device's phone number context. info = %{public}@", (uint8_t *)&v21, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      __int16 v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        id v19 = AMSLogKey();
        int v21 = 138543618;
        uint64_t v22 = v18;
        __int16 v23 = 2114;
        __int16 v24 = v19;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the device's phone number. Unable to get the preferred context.", (uint8_t *)&v21, 0x16u);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v5 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      char v17 = AMSLogKey();
      int v21 = 138543618;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      __int16 v24 = v17;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to fetch the device's phone number. Unable to get the preferred context's identifier.", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)_deviceIsBundleWithMobileActivationFlag:(BOOL)a3 storage:(id)a4 canHonorLasset:(BOOL)a5 defaultsFlag:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v31[2] = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  uint64_t v9 = [a4 isLassetAndReturnError:&v25];
  id v10 = v25;
  int v11 = [v9 BOOLValue];

  uint64_t v12 = +[AMSLogConfig sharedConfig];
  uint64_t v13 = (void *)v12;
  if (v10)
  {
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    os_log_type_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = AMSLogKey();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v16;
      __int16 v30 = 2114;
      v31[0] = v10;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve lasset storage property: %{public}@", buf, 0x20u);
    }
    if (!v6) {
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    int v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      __int16 v23 = AMSLogKey();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      uint64_t v29 = v23;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using defaults is bundle override@", buf, 0x16u);
    }
    a3 = 1;
    goto LABEL_18;
  }
  if (!v12)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  char v17 = [v13 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    id v19 = AMSLogKey();
    *(_DWORD *)long long buf = 138544130;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    uint64_t v29 = v19;
    __int16 v30 = 1024;
    LODWORD(v31[0]) = v11;
    WORD2(v31[0]) = 1024;
    *(_DWORD *)((char *)v31 + 6) = v7;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Considering lasset storage property: %d, canHonor: %d@", buf, 0x22u);
  }
  a3 = (a3 || v7) & v11;
  if (v6) {
    goto LABEL_13;
  }
LABEL_18:

  return a3;
}

+ (id)_dataForNVRAMKey:(id)a3
{
  return 0;
}

+ (id)_mgStringForCFKey:(__CFString *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MGCopyAnswerWithError();
  if (!v4)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    BOOL v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)long long buf = 138544130;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = a3;
      __int16 v16 = 1026;
      int v17 = 0;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain answer for key %{public}@: %{public}d", buf, 0x26u);
    }
  }
  return v4;
}

+ (id)_modelNumber
{
  return (id)[a1 _mgStringForCFKey:@"ModelNumber"];
}

+ (id)_regionInfo
{
  return (id)[a1 _mgStringForCFKey:@"RegionInfo"];
}

+ (BOOL)deviceIsInternalBuild
{
  return os_variant_has_internal_content();
}

+ (BOOL)deviceIsSeedBuild
{
  return 0;
}

@end