@interface FTSelectedPNRSubscription
+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4;
+ (FTSelectedPNRSubscription)sharedInstance;
- (BOOL)_doesSubscriptionInfoContainMultipleLabels:(id)a3;
- (BOOL)_doesSubscriptionInfoContainMultipleUniqueLabels:(id)a3;
- (BOOL)_isIdentityFallbackProhibitedForDeviceBasedOnCapability:(int64_t)a3 subscriptionInfo:(id)a4;
- (BOOL)_isInDualPhoneIdentityModeBasedOnCapability:(int64_t)a3;
- (BOOL)_legacy_isPhoneNumberEmergencyNumber:(id)a3;
- (BOOL)isDeviceInDualPhoneIdentityMode;
- (BOOL)isPhoneNumberEmergencyNumber:(id)a3;
- (BOOL)isSelectedPhoneNumberRegistrationSubscriptionContext:(id)a3;
- (FTSelectedPNRSubscription)init;
- (id)_firstPresentSubscriptionFromAvailableSubscriptions:(id)a3;
- (id)_protected_reevaluateCacheIfNeededAndPersistUpdate:(BOOL)a3;
- (id)_reevaluateCachedActiveSubscriptionWithError:(id *)a3;
- (id)_reevaluateCachedSelectedPhoneNumberRegistrationWithSubscription:(id)a3 activeContexts:(id)a4 fallbackProhibited:(BOOL)a5 persistUpdate:(BOOL)a6 error:(id *)a7;
- (id)_reevaluateCachedSelectedPhoneNumberWithContext:(id)a3 error:(id *)a4;
- (id)_reevaluateCachedSubscriptionWithError:(id *)a3;
- (id)_subscriptionFromAvailableSubscriptions:(id)a3 matchingSelectedLabel:(id)a4;
- (id)selectedPhoneNumberRegistrationSubscriptionWithError:(id *)a3;
- (id)selectedRegistrationPhoneNumberWithError:(id *)a3;
- (id)setSelectedPhoneNumberRegistrationSubscriptionNumber:(id)a3;
- (void)_distributed_invalidateCache;
- (void)_protected_invalidateCache;
- (void)_reevaluateDualIdentityModeWithSubscriptionInfo:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)dualSimCapabilityDidChange;
- (void)persistSelectedPhoneNumberRegistrationSubscriptionIfNeeded;
- (void)phoneNumberAvailable:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation FTSelectedPNRSubscription

- (id)selectedRegistrationPhoneNumberWithError:(id *)a3
{
  v3 = objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  v6 = objc_msgSend_phoneNumber(v3, v4, v5);

  return v6;
}

- (void)_reevaluateDualIdentityModeWithSubscriptionInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_sharedInstance(FTUserConfiguration, v5, v6);
  char isDeviceInDualPhoneIdentityMode = objc_msgSend_isDeviceInDualPhoneIdentityMode(v7, v8, v9);

  if ((isDeviceInDualPhoneIdentityMode & 1) == 0
    && objc_msgSend__doesSubscriptionInfoContainMultipleUniqueLabels_(self, v11, (uint64_t)v4))
  {
    v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Determined that device has entered dual identity mode { subscriptionInfo: %@ }", (uint8_t *)&v19, 0xCu);
    }

    v17 = objc_msgSend_sharedInstance(FTUserConfiguration, v15, v16);
    objc_msgSend_setIsDeviceInDualPhoneIdentityMode_(v17, v18, 1);
  }
}

- (id)_firstPresentSubscriptionFromAvailableSubscriptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  id v7 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, v19, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend_labelID(v10, v5, v6, (void)v15);
        if (objc_msgSend_length(v11, v12, v13))
        {
          id v7 = v10;

          goto LABEL_11;
        }
      }
      id v7 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v15, v19, 16);
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_isInDualPhoneIdentityModeBasedOnCapability:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedInstance(FTUserConfiguration, a2, a3);
  int isDeviceInDualPhoneIdentityMode = objc_msgSend_isDeviceInDualPhoneIdentityMode(v4, v5, v6);

  if (a3 == 2 || a3 == 4) {
    BOOL v11 = isDeviceInDualPhoneIdentityMode;
  }
  else {
    BOOL v11 = 0;
  }
  v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (v11) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    int v16 = 138412802;
    long long v17 = v14;
    if (isDeviceInDualPhoneIdentityMode) {
      uint64_t v13 = @"YES";
    }
    __int16 v18 = 2048;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Determined if device is in dual phone identity mode { isDualIdentity: %@, dualSIMCapability: %ld, isDeviceInDualPhoneIdentityMode: %@ }", (uint8_t *)&v16, 0x20u);
  }

  return v11;
}

- (id)_reevaluateCachedActiveSubscriptionWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v14 = 0;
  uint64_t v5 = objc_msgSend_getActiveContexts_(coreTelephonyClient, a2, (uint64_t)&v14);
  id v6 = v14;
  uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Loaded active contexts { contexts: %@, error: %@ }", buf, 0x16u);
  }

  if (v6)
  {
    v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFE36C();
    }
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (BOOL)_isIdentityFallbackProhibitedForDeviceBasedOnCapability:(int64_t)a3 subscriptionInfo:(id)a4
{
  id v6 = objc_msgSend_sharedInstance(FTUserConfiguration, a2, a3, a4);
  uint64_t v9 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v6, v7, v8);
  v12 = objc_msgSend_firstObject(v9, v10, v11);

  char v14 = objc_msgSend__isInDualPhoneIdentityModeBasedOnCapability_(self, v13, a3);
  if (v12) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_reevaluateCachedSubscriptionWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v14 = 0;
  uint64_t v5 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, a2, (uint64_t)&v14);
  id v6 = v14;
  uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Loaded subscription info { info: %@, error: %@ }", buf, 0x16u);
  }

  if (v6)
  {
    v12 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFE304();
    }
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (FTSelectedPNRSubscription)init
{
  v13.receiver = self;
  v13.super_class = (Class)FTSelectedPNRSubscription;
  v2 = [(FTSelectedPNRSubscription *)&v13 init];
  if (v2)
  {
    id v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F23A80]);
    id v6 = im_primary_queue();
    uint64_t v8 = objc_msgSend_initWithQueue_(v5, v7, (uint64_t)v6);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v8;

    objc_msgSend_setDelegate_(v2->_coreTelephonyClient, v10, (uint64_t)v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A7BD3DB0, @"FTSelectedPNRSubscriptionChangedDistributedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (id)_protected_reevaluateCacheIfNeededAndPersistUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_lock(self->_lock, a2, a3);
  if (!self->_isCacheValid)
  {
    id v5 = objc_alloc_init(FTSelectedPNRSubscriptionCache);
    id v59 = 0;
    id v7 = objc_msgSend__reevaluateCachedSubscriptionWithError_(self, v6, (uint64_t)&v59);
    id v8 = v59;
    objc_msgSend_setSubscriptionInfo_(v5, v9, (uint64_t)v7);

    id v58 = 0;
    uint64_t v11 = objc_msgSend__reevaluateCachedActiveSubscriptionWithError_(self, v10, (uint64_t)&v58);
    id v12 = v58;
    objc_msgSend_setActiveSubscriptionInfo_(v5, v13, (uint64_t)v11);

    int v16 = objc_msgSend_subscriptionInfo(v5, v14, v15);
    objc_msgSend__reevaluateDualIdentityModeWithSubscriptionInfo_(self, v17, (uint64_t)v16);

    coreTelephonyClient = self->_coreTelephonyClient;
    id v57 = 0;
    uint64_t DualSimCapability = objc_msgSend_getDualSimCapability_(coreTelephonyClient, v19, (uint64_t)&v57);
    id v21 = v57;
    objc_msgSend_setDualSIMCapability_(v5, v22, DualSimCapability);
    if (v21)
    {
      v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE218();
      }
    }
    uint64_t v26 = objc_msgSend_dualSIMCapability(v5, v23, v24);
    v29 = objc_msgSend_subscriptionInfo(v5, v27, v28);
    uint64_t isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo = objc_msgSend__isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo_(self, v30, v26, v29);

    v34 = objc_msgSend_subscriptionInfo(v5, v32, v33);
    v37 = objc_msgSend_activeSubscriptionInfo(v5, v35, v36);
    id v56 = 0;
    v39 = objc_msgSend__reevaluateCachedSelectedPhoneNumberRegistrationWithSubscription_activeContexts_fallbackProhibited_persistUpdate_error_(self, v38, (uint64_t)v34, v37, isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo, v3, &v56);
    id v40 = v56;
    objc_msgSend_setSelectedContext_(v5, v41, (uint64_t)v39);

    v44 = objc_msgSend_selectedContext(v5, v42, v43);
    id v55 = 0;
    v46 = objc_msgSend__reevaluateCachedSelectedPhoneNumberWithContext_error_(self, v45, (uint64_t)v44, &v55);
    id v47 = v55;
    objc_msgSend_setPhoneNumber_(v5, v48, (uint64_t)v46);

    cache = self->_cache;
    self->_cache = v5;
    v50 = v5;

    self->_isCacheValid = v8 == 0;
  }
  v51 = self->_cache;
  objc_msgSend_unlock(self->_lock, v52, v53);

  return v51;
}

- (id)_reevaluateCachedSelectedPhoneNumberRegistrationWithSubscription:(id)a3 activeContexts:(id)a4 fallbackProhibited:(BOOL)a5 persistUpdate:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  v71[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v14 = a4;
  if (self->_coreTelephonyClient)
  {
    uint64_t v15 = objc_msgSend_sharedInstance(FTUserConfiguration, v12, v13);
    id v18 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v15, v16, v17);
    id v21 = objc_msgSend_firstObject(v18, v19, v20);

    uint64_t v24 = objc_msgSend_sharedInstance(FTUserConfiguration, v22, v23);
    v65 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionNumber(v24, v25, v26);

    v29 = objc_msgSend_subscriptions(v11, v27, v28);
    if (!objc_msgSend_count(v29, v30, v31))
    {
      id v39 = 0;
LABEL_24:
      v54 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v32, v33);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v67 = v39;
        __int16 v68 = 2112;
        v69 = v21;
        _os_log_impl(&dword_1A7BC0000, v54, OS_LOG_TYPE_DEFAULT, "Determined selected phone number registration subscription context { selectedSubscription: %@, persistedLabel: %@ }", buf, 0x16u);
      }

      id v57 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v55, v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v29;
        _os_log_impl(&dword_1A7BC0000, v57, OS_LOG_TYPE_DEFAULT, "Available subscriptions { available: %@ }", buf, 0xCu);
      }

      v60 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v58, v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v63 = objc_msgSend_subscriptions(v14, v61, v62);
        *(_DWORD *)buf = 138412290;
        id v67 = v63;
        _os_log_impl(&dword_1A7BC0000, v60, OS_LOG_TYPE_DEFAULT, "Active subscriptions { active: %@ }", buf, 0xCu);
      }
      goto LABEL_31;
    }
    uint64_t v34 = objc_msgSend__subscriptionFromAvailableSubscriptions_matchingSelectedLabel_(self, v32, (uint64_t)v29, v21);
    v37 = (void *)v34;
    if (v34)
    {
      v38 = 0;
    }
    else if ((unint64_t)objc_msgSend_count(v29, v35, v36) < 2 {
           || (objc_msgSend__firstPresentSubscriptionFromAvailableSubscriptions_(self, v40, (uint64_t)v29),
    }
               uint64_t v34 = objc_claimAutoreleasedReturnValue(),
               (v38 = (void *)v34) == 0))
    {
      uint64_t v34 = objc_msgSend_firstObject(v29, v40, v41);
      v38 = (void *)v34;
    }
    if (v8) {
      v42 = v37;
    }
    else {
      v42 = (void *)v34;
    }
    id v39 = v42;
    uint64_t v45 = objc_msgSend_labelID(v39, v43, v44);
    v48 = (void *)v45;
    if (v7 && v45)
    {
      v49 = objc_msgSend_sharedInstance(FTUserConfiguration, v46, v47);
      v71[0] = v48;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)v71, 1);
    }
    else
    {
      if (v21 || !v65 || !v45) {
        goto LABEL_23;
      }
      v49 = objc_msgSend_sharedInstance(FTUserConfiguration, v46, v47);
      v70 = v48;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v51, (uint64_t)&v70, 1);
    v52 = };
    objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(v49, v53, (uint64_t)v52);

LABEL_23:
    goto LABEL_24;
  }
  id v21 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1A7BFE3D4(v21);
  }
  id v39 = 0;
LABEL_31:

  return v39;
}

- (BOOL)_doesSubscriptionInfoContainMultipleUniqueLabels:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v7 = objc_msgSend_subscriptions(v3, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v16 = objc_msgSend_labelID(v15, v10, v11);
        uint64_t v19 = objc_msgSend_length(v16, v17, v18);

        if (v19)
        {
          uint64_t v20 = objc_msgSend_labelID(v15, v10, v11);
          objc_msgSend_addObject_(v4, v21, (uint64_t)v20);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v26, v30, 16);
    }
    while (v12);
  }

  BOOL v24 = (unint64_t)objc_msgSend_count(v4, v22, v23) > 1;
  return v24;
}

- (id)_subscriptionFromAvailableSubscriptions:(id)a3 matchingSelectedLabel:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_labelID(v14, v9, v10, (void)v19);
        uint64_t v17 = v15;
        if (v6 && v15 && objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v6))
        {
          id v11 = v14;

          goto LABEL_13;
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v11;
}

- (id)_reevaluateCachedSelectedPhoneNumberWithContext:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v34 = 0;
    uint64_t v10 = objc_msgSend_getPhoneNumber_error_(coreTelephonyClient, v6, (uint64_t)v8, &v34);
    id v11 = v34;
    id v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
    uint64_t v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFE4C4();
      }

      uint64_t v18 = objc_msgSend_number(v10, v16, v17);
      long long v19 = 0;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE45C();
      }

      id v11 = v11;
      uint64_t v18 = 0;
      long long v19 = v11;
    }
  }
  else
  {
    id v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1A7BFE418(v11);
    }
    uint64_t v18 = 0;
    long long v19 = 0;
    uint64_t v10 = 0;
  }

  if (!objc_msgSend_length(v18, v20, v21))
  {
    uint64_t v24 = (void *)CTSettingCopyMyPhoneNumber();
    long long v27 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v25, v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v24;
      _os_log_impl(&dword_1A7BC0000, v27, OS_LOG_TYPE_DEFAULT, "No selected registration phone number found -- falling back { phoneNumberFallbackValue: %@ }", buf, 0xCu);
    }

    if (objc_msgSend_length(v24, v28, v29))
    {
      id v30 = v24;

      uint64_t v18 = v30;
    }
  }
  uint64_t v31 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v22, v23);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = v18;
    __int16 v37 = 2112;
    v38 = v10;
    __int16 v39 = 2112;
    id v40 = v19;
    _os_log_impl(&dword_1A7BC0000, v31, OS_LOG_TYPE_DEFAULT, "Returning selected registration phone number for device { phoneNumber: %@, phoneNumberInfo: %@, clientError: %@ }", buf, 0x20u);
  }

  if (a4) {
    *a4 = v19;
  }
  id v32 = v18;

  return v32;
}

+ (FTSelectedPNRSubscription)sharedInstance
{
  if (qword_1EB47C8A0 != -1) {
    dispatch_once(&qword_1EB47C8A0, &unk_1EFE07860);
  }
  v2 = (void *)qword_1EB47C858;

  return (FTSelectedPNRSubscription *)v2;
}

+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8) || objc_msgSend_length(v6, v9, v10))
  {
    if (objc_msgSend_length(v5, v9, v10) && objc_msgSend_length(v6, v11, v12))
    {
      id v14 = objc_msgSend__IDFromFZIDType_(v6, v13, 0);
      uint64_t v17 = objc_msgSend__stripFZIDPrefix(v14, v15, v16);

      long long v19 = objc_msgSend__IDFromFZIDType_(v5, v18, 0);
      long long v22 = objc_msgSend__stripFZIDPrefix(v19, v20, v21);

      if (objc_msgSend_hasPrefix_(v17, v23, @"+"))
      {
        v25 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v24, @"+");
        uint64_t v27 = objc_msgSend_stringByRemovingCharactersFromSet_(v17, v26, (uint64_t)v25);

        uint64_t v17 = (void *)v27;
      }
      BOOL v30 = (_FTAreIDsEquivalent() & 1) != 0
         || (_FTAreIDsEquivalent() & 1) != 0
         || objc_msgSend_rangeOfString_(v17, v28, (uint64_t)v22) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend_rangeOfString_(v22, v28, (uint64_t)v17) != 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v31 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v28, v29);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = @"NO";
        int v34 = 138412802;
        id v35 = v5;
        __int16 v36 = 2112;
        if (v30) {
          id v32 = @"YES";
        }
        id v37 = v6;
        __int16 v38 = 2112;
        __int16 v39 = v32;
        _os_log_impl(&dword_1A7BC0000, v31, OS_LOG_TYPE_DEFAULT, "Determined whether phone numbers are equivalent { phoneNumber: %@, existingPhoneNumber: %@, equivalent: %@ }", (uint8_t *)&v34, 0x20u);
      }
    }
    else
    {
      LOBYTE(v30) = 0;
    }
  }
  else
  {
    LOBYTE(v30) = 1;
  }

  return v30;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"FTSelectedPNRSubscriptionChangedDistributedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)FTSelectedPNRSubscription;
  [(FTSelectedPNRSubscription *)&v4 dealloc];
}

- (void)subscriptionInfoDidChange
{
  objc_super v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Subscription info did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Phone number changed -- clearing cached selected phone number registration subscription { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__protected_invalidateCache(self, v8, v9);
}

- (void)phoneNumberAvailable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Phone number became available -- clearing cached selected phone number registration subscription { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__protected_invalidateCache(self, v8, v9);
}

- (void)activeSubscriptionsDidChange
{
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Active subscriptions did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (void)dualSimCapabilityDidChange
{
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Dual SIM capability did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (void)_distributed_invalidateCache
{
  id v3 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "Posting distributed notification to invalidate selected phone number subscription caches in other processes", v5, 2u);
  }

  byte_1E9739580 = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"FTSelectedPNRSubscriptionChangedDistributedNotification", 0, 0, 0);
  im_dispatch_after_primary_queue();
}

- (void)_protected_invalidateCache
{
  objc_msgSend_lock(self->_lock, a2, v2);
  cache = self->_cache;
  self->_cache = 0;

  self->_isCacheValid = 0;
  lock = self->_lock;

  objc_msgSend_unlock(lock, v5, v6);
}

- (id)selectedPhoneNumberRegistrationSubscriptionWithError:(id *)a3
{
  id v3 = objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  uint64_t v6 = objc_msgSend_selectedContext(v3, v4, v5);

  return v6;
}

- (void)persistSelectedPhoneNumberRegistrationSubscriptionIfNeeded
{
  objc_msgSend__protected_invalidateCache(self, a2, v2);
  id v5 = (id)objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v4, 1);
}

- (BOOL)isSelectedPhoneNumberRegistrationSubscriptionContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v5, 0);
  uint64_t v9 = objc_msgSend_selectedContext(v6, v7, v8);
  uint64_t v12 = objc_msgSend_sharedInstance(FTUserConfiguration, v10, v11);
  uint64_t v15 = objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v12, v13, v14);
  uint64_t v18 = objc_msgSend_firstObject(v15, v16, v17);

  uint64_t v21 = objc_msgSend_slotID(v4, v19, v20);
  uint64_t v24 = objc_msgSend_slotID(v9, v22, v23);
  uint64_t v29 = objc_msgSend_labelID(v4, v25, v26);
  int isEqualToString = 0;
  if (v29 && v18)
  {
    uint64_t v31 = objc_msgSend_labelID(v4, v27, v28);
    int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v18);
  }
  if (v21 == v24) {
    BOOL v35 = 1;
  }
  else {
    BOOL v35 = isEqualToString;
  }
  __int16 v36 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v33, v34);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    __int16 v38 = @"NO";
    int v39 = 138413058;
    id v40 = v4;
    if (v35) {
      __int16 v38 = @"YES";
    }
    __int16 v41 = 2112;
    v42 = v9;
    __int16 v43 = 2112;
    uint64_t v44 = v18;
    __int16 v45 = 2112;
    v46 = v38;
    _os_log_debug_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEBUG, "Determined if provided subscription context is selected IDS phone number subscription context { context: %@, selectedContext: %@, persistedLabel: %@, isMatching: %@ }", (uint8_t *)&v39, 0x2Au);
  }

  return v35;
}

- (id)setSelectedPhoneNumberRegistrationSubscriptionNumber:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  id v63 = 0;
  uint64_t v7 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v6, (uint64_t)&v63);
  id v8 = v63;
  uint64_t v11 = objc_msgSend_subscriptions(v7, v9, v10);
  unint64_t v12 = 0x1E4F6C000uLL;
  uint64_t v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v66 = v7;
    __int16 v67 = 2112;
    id v68 = v8;
    _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, "Loaded subscription info { info: %@, error: %@ }", buf, 0x16u);
  }

  if (objc_msgSend_count(v11, v16, v17))
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v20 = v11;
    id v24 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v59, v73, 16);
    if (v24)
    {
      id v58 = v11;
      uint64_t v25 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v25) {
            objc_enumerationMutation(v20);
          }
          if (v4)
          {
            uint64_t v27 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            uint64_t v28 = objc_msgSend_slotID(v27, v22, v23);
            BOOL v30 = v28 == 1 ? &unk_1EFE11B98 : &unk_1EFE11B80;
            if (v28 == 2
               ? objc_msgSend_isEqualToNumber_(&unk_1EFE11BB0, v29, (uint64_t)v4)
               : objc_msgSend_isEqualToNumber_(v30, v29, (uint64_t)v4))
            {
              id v24 = v27;
              goto LABEL_25;
            }
          }
        }
        id v24 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v59, v73, 16);
        if (v24) {
          continue;
        }
        break;
      }
LABEL_25:
      uint64_t v11 = v58;
      unint64_t v12 = 0x1E4F6C000;
    }

    id v36 = 0;
  }
  else
  {
    id v32 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19);
    uint64_t v33 = v32;
    if (v8)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v66 = v7;
        __int16 v67 = 2112;
        id v68 = v11;
        __int16 v69 = 2112;
        id v70 = v8;
        _os_log_error_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_ERROR, "Failed to fetch subscriptions { subscriptionInfo: %@, subscriptions: %@, error: %@ }", buf, 0x20u);
      }

      id v36 = v8;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFE280();
      }

      id v36 = 0;
    }
    id v24 = 0;
  }
  id v37 = objc_msgSend_registration(*(void **)(v12 + 952), v34, v35);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = objc_msgSend_labelID(v24, v38, v39);
    *(_DWORD *)buf = 138413058;
    id v66 = v4;
    __int16 v67 = 2112;
    id v68 = v40;
    __int16 v69 = 2112;
    id v70 = v24;
    __int16 v71 = 2112;
    v72 = v11;
    _os_log_impl(&dword_1A7BC0000, v37, OS_LOG_TYPE_DEFAULT, "Selected new phone number registration subscription context { subscriptionNumber: %@, labelID: %@, selectedSubscription: %@, availableSubscriptions: %@ }", buf, 0x2Au);
  }
  __int16 v43 = objc_msgSend_sharedInstance(FTUserConfiguration, v41, v42);
  v46 = objc_msgSend_labelID(v24, v44, v45);
  v64 = v46;
  v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v47, (uint64_t)&v64, 1);
  objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(v43, v49, (uint64_t)v48);

  objc_msgSend__protected_invalidateCache(self, v50, v51);
  objc_msgSend__distributed_invalidateCache(self, v52, v53);
  id v55 = (id)objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v54, 0);
  id v56 = v36;

  return v56;
}

- (BOOL)isDeviceInDualPhoneIdentityMode
{
  id v3 = objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  uint64_t v6 = objc_msgSend_dualSIMCapability(v3, v4, v5);
  char v8 = objc_msgSend__isInDualPhoneIdentityModeBasedOnCapability_(self, v7, v6);
  uint64_t v11 = objc_msgSend_subscriptionInfo(v3, v9, v10);
  int doesSubscriptionInfoContainMultipleLabels = objc_msgSend__doesSubscriptionInfoContainMultipleLabels_(self, v12, (uint64_t)v11);

  if ((v8 & 1) != 0 || (char v16 = 0, doesSubscriptionInfoContainMultipleLabels))
  {
    uint64_t v17 = objc_msgSend_activeSubscriptionInfo(v3, v14, v15);
    id v20 = objc_msgSend_subscriptions(v17, v18, v19);
    if (objc_msgSend_count(v20, v21, v22) == 1)
    {
      uint64_t v25 = objc_msgSend_activeSubscriptionInfo(v3, v23, v24);
      uint64_t v28 = objc_msgSend_subscriptions(v25, v26, v27);
      uint64_t v31 = objc_msgSend_firstObject(v28, v29, v30);
      id v36 = objc_msgSend_labelID(v31, v32, v33);
      if (v36)
      {
        id v37 = objc_msgSend_selectedContext(v3, v34, v35);
        id v40 = objc_msgSend_labelID(v37, v38, v39);
        if (v40)
        {
          v64 = v40;
          long long v62 = objc_msgSend_activeSubscriptionInfo(v3, v41, v42);
          long long v61 = objc_msgSend_subscriptions(v62, v43, v44);
          long long v60 = objc_msgSend_firstObject(v61, v45, v46);
          objc_msgSend_labelID(v60, v47, v48);
          v49 = v65 = v37;
          v52 = objc_msgSend_selectedContext(v3, v50, v51);
          objc_msgSend_labelID(v52, v53, v54);
          id v63 = v28;
          v56 = id v55 = v25;
          char isEqualToString = objc_msgSend_isEqualToString_(v49, v57, (uint64_t)v56);

          uint64_t v25 = v55;
          uint64_t v28 = v63;

          id v37 = v65;
          id v40 = v64;
        }
        else
        {
          char isEqualToString = 0;
        }
      }
      else
      {
        char isEqualToString = 0;
      }

      char v16 = isEqualToString ^ 1;
    }
    else
    {

      char v16 = 1;
    }
  }

  return v16;
}

- (BOOL)_doesSubscriptionInfoContainMultipleLabels:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = objc_msgSend_subscriptions(a3, a2, (uint64_t)a3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = objc_msgSend_labelID(*(void **)(*((void *)&v16 + 1) + 8 * i), v5, v6);
        uint64_t v14 = objc_msgSend_length(v11, v12, v13);

        if (v14) {
          ++v8;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v16, v20, 16);
    }
    while (v7);
    LOBYTE(v7) = v8 > 1;
  }

  return v7;
}

- (BOOL)isPhoneNumberEmergencyNumber:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMStringIsInHardcodedEmergencyNumberSet())
  {
LABEL_16:
    char isPhoneNumberEmergencyNumber = 1;
  }
  else
  {
    objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v5, 0);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v30 = v35 = 0u;
    uint64_t v8 = objc_msgSend_subscriptionInfo(v30, v6, v7);
    uint64_t v11 = objc_msgSend_subscriptions(v8, v9, v10);

    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v32, v42, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v33;
      *(void *)&long long v15 = 138412802;
      long long v29 = v15;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
          coreTelephonyClient = self->_coreTelephonyClient;
          id v31 = 0;
          char isEmergencyNumber_number_error = objc_msgSend_isEmergencyNumber_number_error_(coreTelephonyClient, v14, v19, v4, &v31, v29);
          id v24 = v31;
          if (v24)
          {
            uint64_t v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v22, v23);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              id v37 = v4;
              __int16 v38 = 2112;
              uint64_t v39 = v19;
              __int16 v40 = 2112;
              id v41 = v24;
              _os_log_error_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_ERROR, "Failed to check if number is emergency number { phoneNumber: %@, context: %@, error: %@ }", buf, 0x20u);
            }
          }
          if (isEmergencyNumber_number_error)
          {

            goto LABEL_16;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v32, v42, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }

    char isPhoneNumberEmergencyNumber = objc_msgSend__legacy_isPhoneNumberEmergencyNumber_(self, v26, (uint64_t)v4);
  }

  return isPhoneNumberEmergencyNumber;
}

- (BOOL)_legacy_isPhoneNumberEmergencyNumber:(id)a3
{
  id v5 = a3;
  if (qword_1E97394A8 != -1) {
    dispatch_once(&qword_1E97394A8, &unk_1EFE07A40);
  }
  if (qword_1E97394B0)
  {
    uint64_t IsEmergencyNumber = _CTServerConnectionIsEmergencyNumber();
    if (IsEmergencyNumber)
    {
      uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE57C(IsEmergencyNumber, IsEmergencyNumber, v9);
      }
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFE538(v10);
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end