@interface IDSCTAdapter
+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4;
+ (id)sharedInstance;
- (BOOL)_legacy_supportsSMSIdentification;
- (BOOL)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
- (BOOL)dualSIMCapabilityEnabled;
- (BOOL)hasMultipleSIMs;
- (BOOL)isAnySIMInserted;
- (BOOL)isAnySIMUsable;
- (BOOL)isPNRNumber:(id)a3 andPhoneBookNumber:(id)a4 differentEnoughFromSIMIdentifier:(id)a5 toReregisterWithNewNumber:(id *)a6;
- (BOOL)isPhoneNumberEmergencyNumber:(id)a3;
- (BOOL)supportsIdentification;
- (CoreTelephonyClient)coreTelephonyClient;
- (IDSCTAdapter)initWithCoreTelephonyClient:(id)a3 systemMonitor:(id)a4;
- (IDSCTAdapterCache)cache;
- (IMSystemMonitor)systemMonitor;
- (NSHashTable)listeners;
- (NSMutableDictionary)registrationStateByLabelID;
- (id)CTPNRForSIM:(id)a3;
- (id)SIMForIdentifier:(id)a3;
- (id)_unlocked_currentSIMsWithError:(id *)a3;
- (id)carrierBundleValueFromAllSIMsForKey:(id)a3 ofType:(Class)a4 withFallback:(id)a5;
- (id)carrierBundleValueFromSIM:(id)a3 forKey:(id)a4 ofType:(Class)a5 withFallback:(id)a6;
- (id)contextForSim:(id)a3;
- (id)currentSIMsWithError:(id *)a3;
- (os_unfair_lock_s)lock;
- (void)SIMStatusDidChange:(id)a3 status:(id)a4;
- (void)_checkRegistrationStateForContext:(id)a3;
- (void)_iterateListenersForSelector:(SEL)a3 block:(id)a4;
- (void)_locked_accessCache:(id)a3;
- (void)_unlocked_iterateListenersForSelector:(SEL)a3 block:(id)a4;
- (void)addListener:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)context:(id)a3 pnrSupportChanged:(BOOL)a4;
- (void)dealloc;
- (void)didDetectSimDeactivation:(id)a3 info:(id)a4;
- (void)dualSimCapabilityDidChange;
- (void)operatorBundleChange:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4;
- (void)removeListener:(id)a3;
- (void)setCache:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setListeners:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setRegistrationStateByLabelID:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)subscriptionInfoDidChange;
- (void)systemApplicationDidBecomeActive;
@end

@implementation IDSCTAdapter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19DB1EDFC;
  block[3] = &unk_1E5970A28;
  block[4] = a1;
  if (qword_1EB2BB860 != -1) {
    dispatch_once(&qword_1EB2BB860, block);
  }
  v2 = (void *)qword_1EB2BB868;
  return v2;
}

- (IDSCTAdapter)initWithCoreTelephonyClient:(id)a3 systemMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IDSCTAdapter;
  v9 = [(IDSCTAdapter *)&v28 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registrationStateByLabelID = v10->_registrationStateByLabelID;
    v10->_registrationStateByLabelID = v11;

    v13 = objc_alloc_init(IDSCTAdapterCache);
    id cache = v10->_cache;
    v10->_id cache = v13;

    objc_storeStrong(&v10->_coreTelephonyClient, a3);
    objc_msgSend_setDelegate_(v10->_coreTelephonyClient, v15, (uint64_t)v10, v16);
    uint64_t v20 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v17, v18, v19);
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v20;

    objc_storeStrong((id *)&v10->_systemMonitor, a4);
    if ((objc_msgSend_isActive(v10->_systemMonitor, v22, v23, v24) & 1) == 0) {
      objc_msgSend_setActive_(v10->_systemMonitor, v25, 1, v26);
    }
    objc_msgSend_addListener_(v10->_systemMonitor, v25, (uint64_t)v10, v26);
  }

  return v10;
}

- (void)dealloc
{
  objc_msgSend_removeListener_(self->_systemMonitor, a2, (uint64_t)self, v2);
  v4.receiver = self;
  v4.super_class = (Class)IDSCTAdapter;
  [(IDSCTAdapter *)&v4 dealloc];
}

- (BOOL)dualSIMCapabilityEnabled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19DB1F0B8;
  v4[3] = &unk_1E5975740;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isAnySIMUsable
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19DB1F314;
  v4[3] = &unk_1E5975740;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isAnySIMInserted
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19DB1F6C8;
  v4[3] = &unk_1E5975740;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasMultipleSIMs
{
  v3 = objc_msgSend_currentSIMsWithError_(self, a2, 0, v2);
  v6 = objc_msgSend___imArrayByApplyingBlock_(v3, v4, (uint64_t)&unk_1EEFCD7B8, v5);
  BOOL v10 = (unint64_t)objc_msgSend_count(v6, v7, v8, v9) > 1;

  return v10;
}

- (BOOL)supportsIdentification
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19DB1FB1C;
  v4[3] = &unk_1E5975768;
  v4[4] = self;
  v4[5] = v5;
  void v4[6] = &v7;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  char v2 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
  return v2;
}

- (BOOL)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19DB200C4;
  v4[3] = &unk_1E5975740;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_legacy_supportsSMSIdentification
{
  *(void *)&v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  if (qword_1E944F920 != -1) {
    dispatch_once(&qword_1E944F920, &unk_1EEFCEA18);
  }
  if (qword_1E944F930 != -1) {
    dispatch_once(&qword_1E944F930, &unk_1EEFCEA38);
  }
  unsigned __int8 v21 = -86;
  uint64_t v2 = off_1E944F918(*MEMORY[0x1E4F1CF80], nullsub_4, &v18);
  if (!v2)
  {
    double v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4, v5, v18, v19, v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Could not create CT server connection to query _CTServerConnectionIsPhoneNumberRegistrationSupported", buf, 2u);
    }

    return 1;
  }
  char v6 = (const void *)v2;
  uint64_t v7 = off_1E944F928(v2, &v21);
  v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9, v10, v18, v19, v20);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v23 = v21;
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v7;
    v25[2] = 2048;
    *(void *)&v25[3] = v7 >> 32;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsPhoneNumberRegistrationSupported returned value { registrationSupported: %d, error: (%d:%ld) }", buf, 0x18u);
  }

  CFRelease(v6);
  if (v7)
  {
    v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v23 = v7;
      __int16 v24 = 2048;
      *(void *)v25 = v7 >> 32;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query _CTServerConnectionIsPhoneNumberRegistrationSupported from CT { error: (%d:%ld) }", buf, 0x12u);
    }

    return 1;
  }
  return v21 != 0;
}

- (id)carrierBundleValueFromAllSIMsForKey:(id)a3 ofType:(Class)a4 withFallback:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = objc_msgSend_currentSIMsWithError_(self, v11, 0, 0.0, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v25, v14, v29, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v12);
        }
        v22 = objc_msgSend_carrierBundleValueFromSIM_forKey_ofType_withFallback_(self, v16, *(void *)(*((void *)&v25 + 1) + 8 * i), v17, v8, a4, v9);
        if (v22) {
          objc_msgSend_addObject_(v10, v21, (uint64_t)v22, v23);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v25, v17, v29, 16);
    }
    while (v18);
  }

  return v10;
}

- (id)carrierBundleValueFromSIM:(id)a3 forKey:(id)a4 ofType:(Class)a5 withFallback:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v16 = objc_msgSend_SIMIdentifier(v10, v13, v14, v15);
    uint64_t v19 = objc_msgSend_SIMForIdentifier_(self, v17, (uint64_t)v16, v18);

    id v10 = (id)v19;
  }
  uint64_t v20 = objc_msgSend_context(v10, v13, v14, v15);
  id v21 = objc_alloc(MEMORY[0x1E4F23938]);
  long long v26 = objc_msgSend_initWithBundleType_(v21, v22, 1, v23);
  if (v20)
  {
    id coreTelephonyClient = self->_coreTelephonyClient;
    id v48 = 0;
    v29 = objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(coreTelephonyClient, v24, (uint64_t)v20, v27, v11, v26, &v48);
    v32 = v48;
    if (v29)
    {
      char isKindOfClass = objc_opt_isKindOfClass();
      v38 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v35, v36, v37);
      v39 = v38;
      if (isKindOfClass)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = v29;
          _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "Found carrier bundle value { key: %@, value: %@ }", buf, 0x16u);
        }

        id v40 = v29;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        v46 = objc_opt_class();
        *(_DWORD *)buf = 138413058;
        id v50 = v11;
        __int16 v51 = 2112;
        id v52 = v12;
        __int16 v53 = 2112;
        Class v54 = a5;
        __int16 v55 = 2112;
        v56 = v46;
        id v47 = v46;
        _os_log_fault_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_FAULT, "Unexpected type loading carrier bundle value { key: %@, fallbackValue: %@, expectedClass: %@, foundClass: %@ }", buf, 0x2Au);
      }
    }
    else
    {
      v41 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v30, v31, v33);
      v42 = v41;
      if (v32)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = v12;
          __int16 v53 = 2112;
          Class v54 = (Class)v32;
          _os_log_error_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_ERROR, "Failed to load carrier bundle value { key: %@, fallbackValue: %@, carrierBundleError: %@ }", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        sub_19DB81788();
      }
    }
    id v40 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v32 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v24, v25, v27);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v50 = v11;
    __int16 v51 = 2112;
    id v52 = v12;
    __int16 v53 = 2112;
    Class v54 = 0;
    _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "Unable to load subscription context to look up carrier bundle value -- falling back { key: %@, fallbackValue: %@, subscriptionError: %@ }", buf, 0x20u);
  }
  id v40 = 0;
LABEL_23:

  if (v40) {
    v43 = v40;
  }
  else {
    v43 = v12;
  }
  id v44 = v43;

  return v44;
}

- (id)_unlocked_currentSIMsWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v8 = objc_msgSend_cache(self, v5, v6, v7);
  id v12 = objc_msgSend_sims(v8, v9, v10, v11);

  if (v12) {
    goto LABEL_12;
  }
  id coreTelephonyClient = self->_coreTelephonyClient;
  id v43 = 0;
  double v17 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v13, (uint64_t)&v43, v15);
  id v20 = v43;
  if (v17)
  {
    v22 = objc_msgSend_subscriptions(v17, v18, v19, v21);
    uint64_t v25 = objc_msgSend___imArrayByApplyingBlock_(v22, v23, (uint64_t)&unk_1EEFCDED8, v24);
    v29 = objc_msgSend_cache(self, v26, v27, v28);
    objc_msgSend_setSims_(v29, v30, (uint64_t)v25, v31);

    v35 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v32, v33, v34);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v45 = v17;
    uint64_t v36 = "Loaded subscription contexts { subInfo: %@ }";
  }
  else
  {
    v35 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v18, v19, v21);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    id v45 = v20;
    uint64_t v36 = "Unable to load subscription contexts { subError: %@ }";
  }
  _os_log_impl(&dword_19D9BE000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
LABEL_8:

  if (a3 && v20) {
    *a3 = v20;
  }

LABEL_12:
  double v37 = objc_msgSend_cache(self, v13, v14, v15);
  v41 = objc_msgSend_sims(v37, v38, v39, v40);

  return v41;
}

- (id)currentSIMsWithError:(id *)a3
{
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = sub_19DB21150;
  double v18 = sub_19DB21160;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = sub_19DB21150;
  id v12 = sub_19DB21160;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19DB21168;
  v7[3] = &unk_1E59757B0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v7, COERCE_DOUBLE(3221225472));
  if (a3)
  {
    uint64_t v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)SIMForIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend_currentSIMsWithError_(self, v5, 0, 0.0, 0);
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, v8, v25, 16);
  if (v11)
  {
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v6);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_SIMIdentifier(v15, v9, v10, v12);
        char isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v4, v18);

        if (isEqualToString)
        {
          id v11 = v15;
          goto LABEL_11;
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, v12, v25, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)contextForSim:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v8 = objc_msgSend_SIMIdentifier(v4, v5, v6, v7);
    uint64_t v11 = objc_msgSend_SIMForIdentifier_(self, v9, (uint64_t)v8, v10);

    id v4 = (id)v11;
  }
  double v12 = objc_msgSend_context(v4, v5, v6, v7);
  id coreTelephonyClient = self->_coreTelephonyClient;
  id v32 = 0;
  uint64_t v16 = objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v14, (uint64_t)v12, v15, &v32);
  id v17 = v32;
  long long v21 = v17;
  if (!v16 || v17)
  {
    uint64_t v30 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v18, v19, v20);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_19DB81800();
    }

    id v29 = 0;
  }
  else
  {
    int isReady = objc_msgSend_isReady(v16, v18, v19, v20);
    uint64_t v26 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v23, v24, v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (isReady) {
        uint64_t v27 = @"YES";
      }
      double v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "Fetched SIMContext for SIM {validContext: %@, PNRContext: %@, context: %@}", buf, 0x20u);
    }

    if (isReady) {
      double v28 = v16;
    }
    else {
      double v28 = 0;
    }
    id v29 = v28;
  }

  return v29;
}

- (BOOL)isPNRNumber:(id)a3 andPhoneBookNumber:(id)a4 differentEnoughFromSIMIdentifier:(id)a5 toReregisterWithNewNumber:(id *)a6
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v9 = a4;
  id v10 = a5;
  id v74 = 0;
  uint64_t v13 = objc_msgSend_currentSIMsWithError_(self, v11, (uint64_t)&v74, v12);
  id v68 = v74;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v14 = v13;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v70, v16, v83, 16);
  if (!v17) {
    goto LABEL_9;
  }
  uint64_t v21 = v17;
  uint64_t v22 = *(void *)v71;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v71 != v22) {
        objc_enumerationMutation(v14);
      }
      uint64_t v24 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      double v25 = objc_msgSend_SIMIdentifier(v24, v18, v19, v20);
      char isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)v10, v27);

      if (isEqualToString)
      {
        id v30 = v24;
        id v29 = objc_msgSend_contextForSim_(self, v31, (uint64_t)v30, v32);

        if (!v30) {
          goto LABEL_17;
        }
        uint64_t v36 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v33, v34, v35);
        __int16 v37 = v9;
        id v38 = v69;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v76 = v69;
          __int16 v77 = 2112;
          v78 = v37;
          __int16 v79 = 2112;
          id v80 = v30;
          __int16 v81 = 2112;
          v82 = v29;
          _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "** Checking for phone number change { phoneNumber: %@, phoneBookNumber: %@, matchingSIM: %@, matchingSIMContext: %@ }", buf, 0x2Au);
        }

        if (v29)
        {
          v42 = objc_msgSend_phoneNumberOnSIM(v29, v39, v40, v41);
          int v45 = sub_19DB218AC(v42, v37);
          if (v45)
          {
            id v47 = objc_msgSend_phoneNumberOnSIM(v29, v43, v44, v46);
            if (sub_19DB218AC(v47, v69))
            {
              int v48 = 1;
              goto LABEL_33;
            }
            if (!v69)
            {
              int v48 = 0;
              goto LABEL_33;
            }
            v65 = v47;
LABEL_30:
            v61 = objc_msgSend_phoneNumber(v29, v43, v44, v46, v65);
            int v48 = sub_19DB218AC(v61, v69);

            id v47 = v66;
            if (!v45)
            {
LABEL_34:

              v59 = a6;
              v49 = v68;
              if (!a6 || !v48) {
                goto LABEL_19;
              }
              objc_msgSend_phoneNumberOnSIM(v29, v62, v63, v64);
              id v60 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
          if (v69) {
            goto LABEL_30;
          }
        }
        else
        {
          __int16 v51 = objc_msgSend_phoneNumber(v30, v39, v40, v41);
          if (sub_19DB218AC(v51, v37))
          {
            __int16 v55 = objc_msgSend_phoneNumber(v30, v52, v53, v54);
            int v48 = sub_19DB218AC(v55, v69);

            id v29 = 0;
            v59 = a6;
            if (!a6) {
              goto LABEL_18;
            }
            v49 = v68;
            if (!v48) {
              goto LABEL_19;
            }
            objc_msgSend_phoneNumber(v30, v56, v57, v58);
            id v60 = (id)objc_claimAutoreleasedReturnValue();
            id v29 = 0;
LABEL_37:
            id *v59 = v60;
            LOBYTE(v48) = 1;
            goto LABEL_19;
          }

          id v29 = 0;
        }
        LOBYTE(v48) = 0;
        goto LABEL_18;
      }
    }
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v70, v20, v83, 16);
    if (v21) {
      continue;
    }
    break;
  }
LABEL_9:

  id v29 = 0;
  id v30 = 0;
LABEL_17:
  LOBYTE(v48) = 0;
  __int16 v37 = v9;
  id v38 = v69;
LABEL_18:
  v49 = v68;
LABEL_19:

  return v48;
}

+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) || objc_msgSend_length(v6, v10, v11, v12))
  {
    if (objc_msgSend_length(v5, v10, v11, v12) && objc_msgSend_length(v6, v13, v14, v15))
    {
      double v18 = objc_msgSend__IDFromFZIDType_(v6, v16, 0, v17);
      uint64_t v22 = objc_msgSend__stripFZIDPrefix(v18, v19, v20, v21);

      double v25 = objc_msgSend__IDFromFZIDType_(v5, v23, 0, v24);
      id v29 = objc_msgSend__stripFZIDPrefix(v25, v26, v27, v28);

      if (objc_msgSend_hasPrefix_(v22, v30, @"+", v31))
      {
        uint64_t v34 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v32, @"+", v33);
        uint64_t v37 = objc_msgSend_stringByRemovingCharactersFromSet_(v22, v35, (uint64_t)v34, v36);

        uint64_t v22 = (void *)v37;
      }
      BOOL v41 = (_IDSAreIDsEquivalent(v29, v22) & 1) != 0
         || (_IDSAreIDsEquivalent(v22, v29) & 1) != 0
         || objc_msgSend_rangeOfString_(v22, v38, (uint64_t)v29, v40) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend_rangeOfString_(v29, v38, (uint64_t)v22, v40) != 0x7FFFFFFFFFFFFFFFLL;
      v42 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v38, v39, v40);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = @"NO";
        int v45 = 138412802;
        id v46 = v5;
        __int16 v47 = 2112;
        if (v41) {
          id v43 = @"YES";
        }
        id v48 = v6;
        __int16 v49 = 2112;
        id v50 = v43;
        _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "Determined whether phone numbers are equivalent { phoneNumber: %@, existingPhoneNumber: %@, equivalent: %@ }", (uint8_t *)&v45, 0x20u);
      }
    }
    else
    {
      LOBYTE(v41) = 0;
    }
  }
  else
  {
    LOBYTE(v41) = 1;
  }

  return v41;
}

- (BOOL)isPhoneNumberEmergencyNumber:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMStringIsInHardcodedEmergencyNumberSet())
  {
    BOOL v6 = 1;
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v7 = objc_msgSend_currentSIMsWithError_(self, v5, 0, 0.0);
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, v9, v45, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v36;
      *(void *)&long long v13 = 138412802;
      long long v33 = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v7);
          }
          double v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id coreTelephonyClient = self->_coreTelephonyClient;
          uint64_t v19 = objc_msgSend_context(v17, v11, v12, *(double *)&v13, v33);
          id v34 = 0;
          char isEmergencyNumber_number_error = objc_msgSend_isEmergencyNumber_number_error_(coreTelephonyClient, v20, (uint64_t)v19, v21, v4, &v34);
          id v23 = v34;

          if (v23)
          {
            uint64_t v27 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v24, v25, v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              double v31 = objc_msgSend_context(v17, v28, v29, v30);
              *(_DWORD *)buf = v33;
              id v40 = v4;
              __int16 v41 = 2112;
              v42 = v31;
              __int16 v43 = 2112;
              id v44 = v23;
              _os_log_error_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_ERROR, "Failed to check if number is emergency number { phoneNumber: %@, context: %@, error: %@ }", buf, 0x20u);
            }
          }

          if (isEmergencyNumber_number_error)
          {
            BOOL v6 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v35, *(double *)&v13, v45, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_17:
  }
  return v6;
}

- (id)CTPNRForSIM:(id)a3
{
  id v3 = a3;
  id v4 = [IDSCTPNR alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F23A80]);
  uint64_t v8 = objc_msgSend_initWithQueue_(v5, v6, 0, v7);
  uint64_t v11 = objc_msgSend__initWithCoreTelephonyClient_SIM_(v4, v9, (uint64_t)v8, v10, v3);

  return v11;
}

- (void)addListener:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    objc_msgSend_addObject_(self->_listeners, v6, (uint64_t)v5, v7);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeListener:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    objc_msgSend_removeObject_(self->_listeners, v6, (uint64_t)v5, v7);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_unlocked_iterateListenersForSelector:(SEL)a3 block:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = self->_listeners;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v8, v20, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          v5[2](v5, v13);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v16, v15, v20, 16);
    }
    while (v10);
  }
}

- (void)_iterateListenersForSelector:(SEL)a3 block:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__unlocked_iterateListenersForSelector_block_(self, v8, (uint64_t)a3, v9, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_checkRegistrationStateForContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = objc_msgSend_labelID(v4, v6, v7, v8);
  if (!v11)
  {
    uint64_t v39 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10, v12);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v4;
      _os_log_impl(&dword_19D9BE000, v39, OS_LOG_TYPE_DEFAULT, "No label ID found for context -- ignoring { context: %@ }", buf, 0xCu);
    }

    goto LABEL_15;
  }
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_registrationStateByLabelID, v9, (uint64_t)v11, v12);
  id coreTelephonyClient = self->_coreTelephonyClient;
  id v44 = 0;
  long long v17 = objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v15, (uint64_t)v4, v16, &v44);
  id v20 = v44;
  if (v17)
  {
    uint64_t v22 = NSNumber;
    uint64_t isReady = objc_msgSend_isReady(v17, v18, v19, v21);
    double v26 = objc_msgSend_numberWithBool_(v22, v24, isReady, v25);
    double v30 = v26;
    if (!v13
      || !v26
      || (int v31 = objc_msgSend_BOOLValue(v26, v27, v28, v29),
          v31 != objc_msgSend_BOOLValue(v13, v32, v33, v34)))
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_19DB223E4;
      v41[3] = &unk_1E59757D8;
      id v42 = v4;
      id v43 = v30;
      objc_msgSend__unlocked_iterateListenersForSelector_block_(self, v37, (uint64_t)sel_SIM_didUpdateRegistrationState_, v38, v41);
    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_registrationStateByLabelID, v35, (uint64_t)v30, v36, v11);
  }
  else
  {
    id v40 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19, v21);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v20;
      _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "Failed loading PNRContext -- exiting { error: %@ }", buf, 0xCu);
    }

    os_unfair_lock_unlock(p_lock);
    double v30 = 0;
  }

  if (v17) {
LABEL_15:
  }
    os_unfair_lock_unlock(p_lock);
}

- (void)_locked_accessCache:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)dualSimCapabilityDidChange
{
  id v5 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Sim cap changed -- clearing value", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19DB22588;
  v7[3] = &unk_1E5973BA8;
  v7[4] = self;
  objc_msgSend__locked_accessCache_(self, v6, (uint64_t)v7, COERCE_DOUBLE(3221225472));
}

- (void)SIMStatusDidChange:(id)a3 status:(id)a4
{
  BOOL v6 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v4, a4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "Sim status changed -- clearing value", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19DB22698;
  v8[3] = &unk_1E5973BA8;
  v8[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v8, COERCE_DOUBLE(3221225472));
}

- (void)subscriptionInfoDidChange
{
  id v5 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Sub info changed -- clearing value", buf, 2u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_19DB227C0;
  v9[3] = &unk_1E5973BA8;
  v9[4] = self;
  objc_msgSend__locked_accessCache_(self, v6, (uint64_t)v9, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v7, (uint64_t)sel_SIMInformationDidChange, v8, &unk_1EEFCDF98);
}

- (void)phoneNumberChanged:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F6C3B8];
  id v5 = a3;
  double v9 = objc_msgSend_sms(v4, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "Phone number changed -- clearing value", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19DB22924;
  v15[3] = &unk_1E5973BA8;
  v15[4] = self;
  objc_msgSend__locked_accessCache_(self, v10, (uint64_t)v15, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v11, (uint64_t)sel_SIMInformationDidChange, v12, &unk_1EEFCDFD8);
  objc_msgSend__checkRegistrationStateForContext_(self, v13, (uint64_t)v5, v14);
}

- (void)context:(id)a3 pnrSupportChanged:(BOOL)a4
{
  BOOL v6 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v4, a4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "PNR support changed -- clearing value", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19DB22A64;
  v10[3] = &unk_1E5973BA8;
  v10[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v10, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1EEFCEA58);
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  id v5 = (void *)MEMORY[0x1E4F6C3B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_sms(v5, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "PNR ready state changed -- clearing value", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19DB22BA0;
  v14[3] = &unk_1E5973BA8;
  v14[4] = self;
  objc_msgSend__locked_accessCache_(self, v11, (uint64_t)v14, COERCE_DOUBLE(3221225472));
  objc_msgSend__checkRegistrationStateForContext_(self, v12, (uint64_t)v6, v13);
}

- (void)carrierBundleChange:(id)a3
{
  id v5 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed -- clearing value", v10, 2u);
  }

  objc_msgSend__iterateListenersForSelector_block_(self, v6, (uint64_t)sel_carrierBundleInformationDidChange, v7, &unk_1EEFCE018);
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1EEFCEA78);
}

- (void)operatorBundleChange:(id)a3
{
  id v5 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Operator bundle changed -- clearing value", v10, 2u);
  }

  objc_msgSend__iterateListenersForSelector_block_(self, v6, (uint64_t)sel_carrierBundleInformationDidChange, v7, &unk_1EEFCEA98);
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1EEFCD2D8);
}

- (void)didDetectSimDeactivation:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "Detected sim deactivation", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_19DB22E90;
  v16[3] = &unk_1E59757D8;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  objc_msgSend__iterateListenersForSelector_block_(self, v14, (uint64_t)sel_SIM_didDeactivateWithInfo_, v15, v16);
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v4, a4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v6, OS_LOG_TYPE_DEFAULT, "Sim capabilitiesChanged -- clearing value", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19DB22FD4;
  v8[3] = &unk_1E5973BA8;
  v8[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v8, COERCE_DOUBLE(3221225472));
}

- (void)systemApplicationDidBecomeActive
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (IDSCTAdapterCache)cache
{
  return (IDSCTAdapterCache *)self->_cache;
}

- (void)setCache:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)registrationStateByLabelID
{
  return self->_registrationStateByLabelID;
}

- (void)setRegistrationStateByLabelID:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_registrationStateByLabelID, 0);
  objc_storeStrong(&self->_cache, 0);
  objc_storeStrong(&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end