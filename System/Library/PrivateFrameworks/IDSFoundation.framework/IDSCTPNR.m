@interface IDSCTPNR
- (BOOL)isPNRSupported;
- (BOOL)isRelevantContext:(id)a3;
- (BOOL)isSIMReady;
- (BOOL)issuePNRForMechanism:(id)a3 pushToken:(id)a4 attemptCount:(unsigned int)a5 completion:(id)a6;
- (BOOL)userOptInRequired;
- (CTXPCServiceSubscriptionContext)context;
- (CoreTelephonyClient)coreTelephonyClient;
- (IDSCTPNRDelegate)PNRDelegate;
- (IDSCTPNRInfo)PNRInfo;
- (NSString)description;
- (NSString)labelID;
- (NSString)uniqueIdentifier;
- (id)_initWithCoreTelephonyClient:(id)a3 SIM:(id)a4;
- (id)_telephonyRequestForPushToken:(id)a3 phoneNumberValidationMechanism:(id)a4 attemptCount:(unsigned int)a5;
- (int64_t)carrierShortcodeSupported;
- (os_unfair_lock_s)contextLock;
- (unint64_t)slotID;
- (void)_resetCarrierShortcodeSupportedCachedValue;
- (void)carrierBundleChange:(id)a3;
- (void)operatorBundleChange:(id)a3;
- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4;
- (void)pnrRequestSent:(id)a3 pnrReqData:(id)a4;
- (void)pnrResponseReceived:(id)a3 pnrRspData:(id)a4;
- (void)setCarrierShortcodeSupported:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setContextLock:(os_unfair_lock_s)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setLabelID:(id)a3;
- (void)setPNRDelegate:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation IDSCTPNR

- (id)_initWithCoreTelephonyClient:(id)a3 SIM:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IDSCTPNR;
  v9 = [(IDSCTPNR *)&v19 init];
  v10 = v9;
  if (v9)
  {
    v9->_contextLock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_coreTelephonyClient, a3);
    objc_msgSend_setDelegate_(v7, v11, (uint64_t)v10, v12);
    uint64_t v16 = objc_msgSend_SIMIdentifier(v8, v13, v14, v15);
    labelID = v10->_labelID;
    v10->_labelID = (NSString *)v16;

    v10->_carrierShortcodeSupported = -1;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v8 = objc_msgSend_labelID(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p, labelID: %@>", v10, v4, self, v8);

  return (NSString *)v11;
}

- (CTXPCServiceSubscriptionContext)context
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  p_id context = &self->_context;
  id context = self->_context;
  if (!context)
  {
    id coreTelephonyClient = self->_coreTelephonyClient;
    id v43 = 0;
    v9 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v4, (uint64_t)&v43, v5);
    id v12 = v43;
    if (!v9)
    {
      uint64_t v14 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v10, v11, v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_19DB80EC4();
      }
    }
    v38 = v9;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v15 = objc_msgSend_subscriptions(v9, v10, v11, 0.0, v12);
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, v17, v48, 16);
    if (v18)
    {
      uint64_t v22 = v18;
      uint64_t v23 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v15);
          }
          v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v26 = objc_msgSend_labelID(v25, v19, v20, v21);
          int isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)self->_labelID, v28);

          if (isEqualToString)
          {
            objc_storeStrong(&self->_context, v25);
            goto LABEL_16;
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v19, (uint64_t)&v39, v21, v48, 16);
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    v33 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v30, v31, v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = *p_context;
      *(_DWORD *)buf = 138412546;
      id v45 = v34;
      __int16 v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "Finished loading context for PNR { context: %@, info: %@ }", buf, 0x16u);
    }

    id context = *p_context;
  }
  id v35 = context;
  os_unfair_lock_unlock(p_contextLock);
  return (CTXPCServiceSubscriptionContext *)v35;
}

- (void)setContext:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_contextLock);
  id context = self->_context;
  self->_id context = v4;

  os_unfair_lock_unlock(&self->_contextLock);
}

- (id)_telephonyRequestForPushToken:(id)a3 phoneNumberValidationMechanism:(id)a4 attemptCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F6C3B8];
  id v9 = a3;
  double v13 = objc_msgSend_sms(v8, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = 138412290;
    id v49 = v7;
    _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "Constructing phone number registration request { mechanism: %@ }", (uint8_t *)&v48, 0xCu);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F23A00]);
  objc_msgSend_setPushToken_(v14, v15, (uint64_t)v9, v16);

  objc_msgSend_setAttemptCount_(v14, v17, 0, v18);
  objc_msgSend_setPnrReqList_(v14, v19, 0, v20);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F239F8]);
  objc_msgSend_setSvcCenterAddr_(v22, v23, 0, v24);
  objc_msgSend_setDestAddr_(v22, v25, 0, v26);
  uint64_t v30 = objc_msgSend_type(v7, v27, v28, v29);
  uint64_t v34 = v30;
  if (v30 != 2)
  {
    if (v30 != 1) {
      goto LABEL_8;
    }
    id v35 = objc_msgSend_context(v7, v31, v32, v33);

    if (v35)
    {
      v37 = objc_msgSend_context(v7, v31, v36, v33);
      objc_msgSend_setDestAddr_(v22, v38, (uint64_t)v37, v39);
    }
  }
  objc_msgSend_setPnrMechanism_(v22, v31, v34, v33);
  objc_msgSend_addObject_(v21, v40, (uint64_t)v22, v41);
LABEL_8:
  if (objc_msgSend_count(v21, v31, v32, v33))
  {
    objc_msgSend_setPnrReqList_(v14, v42, (uint64_t)v21, v43);
  }
  else
  {
    v44 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, v5, v43);
    objc_msgSend_setAttemptCount_(v14, v45, (uint64_t)v44, v46);
  }
  return v14;
}

- (NSString)uniqueIdentifier
{
  return self->_labelID;
}

- (BOOL)isPNRSupported
{
  id coreTelephonyClient = self->_coreTelephonyClient;
  uint64_t v5 = objc_msgSend_context(self, a2, v2, v3);
  id v15 = 0;
  char isPNRSupported_outError = objc_msgSend_isPNRSupported_outError_(coreTelephonyClient, v6, (uint64_t)v5, v7, &v15);
  id v9 = v15;

  if (v9)
  {
    double v13 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_19DB80F2C();
    }
  }
  return isPNRSupported_outError;
}

- (BOOL)isSIMReady
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id coreTelephonyClient = self->_coreTelephonyClient;
  uint64_t v6 = objc_msgSend_context(self, a2, v2, v3);
  id v40 = 0;
  id v9 = objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v7, (uint64_t)v6, v8, &v40);
  id v10 = v40;

  if (v10)
  {
    id v14 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v11, v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB80F94();
    }
  }
  else
  {
    id v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isReady(v9, v15, v16, v17)) {
        id v21 = @"YES";
      }
      else {
        id v21 = @"NO";
      }
      id v22 = objc_msgSend_phoneNumber(v9, v18, v19, v20);
      double v26 = objc_msgSend_imsi(v9, v23, v24, v25);
      uint64_t v30 = objc_msgSend_plmn(v9, v27, v28, v29);
      uint64_t v34 = objc_msgSend_context(self, v31, v32, v33);
      *(_DWORD *)buf = 138413570;
      long long v42 = v9;
      __int16 v43 = 2112;
      v44 = v21;
      __int16 v45 = 2112;
      double v46 = v22;
      __int16 v47 = 2112;
      int v48 = v26;
      __int16 v49 = 2112;
      uint64_t v50 = v30;
      __int16 v51 = 2112;
      v52 = v34;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);
    }
  }

  char isReady = objc_msgSend_isReady(v9, v35, v36, v37);
  return isReady;
}

- (unint64_t)slotID
{
  id v4 = objc_msgSend_context(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_slotID(v4, v5, v6, v7);

  if (v8) {
    return v8 == 2;
  }
  else {
    return 2;
  }
}

- (BOOL)userOptInRequired
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int64_t carrierShortcodeSupported = self->_carrierShortcodeSupported;
  if (carrierShortcodeSupported == -1)
  {
    id coreTelephonyClient = self->_coreTelephonyClient;
    double v7 = objc_msgSend_context(self, a2, v2, v3);
    id v8 = objc_alloc(MEMORY[0x1E4F23938]);
    unsigned int v9 = 1;
    uint64_t v12 = objc_msgSend_initWithBundleType_(v8, v10, 1, v11);
    id v15 = objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(coreTelephonyClient, v13, (uint64_t)v7, v14, @"RegistrationOptInRequired", v12, 0);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v9 = objc_msgSend_BOOLValue(v15, v16, v17, v18) ^ 1;
    }
    self->_int64_t carrierShortcodeSupported = v9;
    uint64_t v19 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v16, v17, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = @"YES";
      int64_t v21 = self->_carrierShortcodeSupported;
      if (v9) {
        double v20 = @"NO";
      }
      int v23 = 138412546;
      uint64_t v24 = v20;
      __int16 v25 = 2048;
      int64_t v26 = v21;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Determined if phone number registration opt-in is required by carrier bundle { optInRequired: %@, carrierShortcodeSupported: %ld }", (uint8_t *)&v23, 0x16u);
    }

    int64_t carrierShortcodeSupported = self->_carrierShortcodeSupported;
  }
  return carrierShortcodeSupported != 1;
}

- (IDSCTPNRInfo)PNRInfo
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id coreTelephonyClient = self->_coreTelephonyClient;
  uint64_t v6 = objc_msgSend_context(self, a2, v2, v3);
  id v56 = 0;
  unsigned int v9 = objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v7, (uint64_t)v6, v8, &v56);
  id v10 = v56;

  if (v10)
  {
    double v14 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v11, v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_19DB80FFC();
    }
  }
  else
  {
    double v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isReady(v9, v15, v16, v17)) {
        int64_t v21 = @"YES";
      }
      else {
        int64_t v21 = @"NO";
      }
      id v22 = objc_msgSend_phoneNumber(v9, v18, v19, v20);
      int64_t v26 = objc_msgSend_imsi(v9, v23, v24, v25);
      uint64_t v30 = objc_msgSend_plmn(v9, v27, v28, v29);
      uint64_t v34 = objc_msgSend_context(self, v31, v32, v33);
      *(_DWORD *)buf = 138413570;
      v58 = v9;
      __int16 v59 = 2112;
      v60 = v21;
      __int16 v61 = 2112;
      v62 = v22;
      __int16 v63 = 2112;
      v64 = v26;
      __int16 v65 = 2112;
      v66 = v30;
      __int16 v67 = 2112;
      v68 = v34;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);
    }
  }

  id v35 = [IDSCTPNRInfo alloc];
  double v39 = objc_msgSend_imsi(v9, v36, v37, v38);
  __int16 v43 = objc_msgSend_plmn(v9, v40, v41, v42);
  __int16 v47 = objc_msgSend_phoneNumber(v9, v44, v45, v46);
  __int16 v51 = objc_msgSend_phoneNumberOnSIM(v9, v48, v49, v50);
  v54 = objc_msgSend_initWithIMSI_PLMN_PNRPhoneNumber_phoneBookNumber_(v35, v52, (uint64_t)v39, v53, v43, v47, v51);

  return (IDSCTPNRInfo *)v54;
}

- (BOOL)issuePNRForMechanism:(id)a3 pushToken:(id)a4 attemptCount:(unsigned int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v14 = a6;
  if (v14)
  {
    uint64_t v16 = objc_msgSend_context(self, v12, v13, v15);
    double v20 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v17, v18, v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v51 = v16;
      __int16 v52 = 2112;
      double v53 = 0;
      _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "Loaded subscription info for phone number registration request { context: %@, error: %@ }", buf, 0x16u);
    }

    if (v16 && self->_coreTelephonyClient)
    {
      uint64_t v24 = objc_msgSend__telephonyRequestForPushToken_phoneNumberValidationMechanism_attemptCount_(self, v21, (uint64_t)v11, v23, v10, v7);
      uint64_t v28 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v25, v26, v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_msgSend_pushToken(v24, v29, v30, v31);
        uint64_t v36 = objc_msgSend_attemptCount(v24, v33, v34, v35);
        id v40 = objc_msgSend_pnrReqList(v24, v37, v38, v39);
        *(_DWORD *)buf = 138413314;
        __int16 v51 = v32;
        __int16 v52 = 2112;
        double v53 = v36;
        __int16 v54 = 2112;
        v55 = v40;
        __int16 v56 = 2112;
        v57 = v16;
        __int16 v58 = 2112;
        id v59 = v10;
        _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "Issuing phone number registration request { pushToken: %@, attemptCount: %@, mechanisms: %@, context: %@, mechanism: %@ }", buf, 0x34u);
      }
      id coreTelephonyClient = self->_coreTelephonyClient;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = sub_19DB11F6C;
      v47[3] = &unk_1E59753C8;
      id v48 = v24;
      id v49 = v14;
      double v42 = v24;
      objc_msgSend_issuePNRRequest_pnrReqType_completion_(coreTelephonyClient, v43, (uint64_t)v16, v44, v42, v47);

      BOOL v45 = 1;
    }
    else
    {
      double v42 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v21, v22, v23);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        sub_19DB810D8((uint64_t)self, (uint64_t)v16, v42);
      }
      BOOL v45 = 0;
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v12, v13, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_19DB81064();
    }
    BOOL v45 = 0;
  }

  return v45;
}

- (BOOL)isRelevantContext:(id)a3
{
  id v4 = a3;
  objc_msgSend_context(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v4)
  {
    char isEqualToString = 1;
  }
  else
  {
    uint64_t v12 = objc_msgSend_labelID(v4, v8, v9, v11);
    char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)self->_labelID, v14);
  }
  return isEqualToString;
}

- (void)carrierBundleChange:(id)a3
{
  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v3))
  {
    double v8 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_19DB8116C();
    }

    objc_msgSend__resetCarrierShortcodeSupportedCachedValue(self, v9, v10, v11);
  }
}

- (void)operatorBundleChange:(id)a3
{
  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v3))
  {
    double v8 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_19DB811E0();
    }

    objc_msgSend__resetCarrierShortcodeSupportedCachedValue(self, v9, v10, v11);
  }
}

- (void)_resetCarrierShortcodeSupportedCachedValue
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sms(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t carrierShortcodeSupported = self->_carrierShortcodeSupported;
    int v7 = 134217984;
    int64_t v8 = carrierShortcodeSupported;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "Resetting cached carrier shortcode value { previousCarrierShortcodeSupportedValue: %ld }", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_contextLock);
  self->_int64_t carrierShortcodeSupported = -1;
  os_unfair_lock_unlock(&self->_contextLock);
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  BOOL v5 = a4;
  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRReadyStateChanged_(WeakRetained, v7, v5, v8);
  }
}

- (void)pnrRequestSent:(id)a3 pnrReqData:(id)a4
{
  id v11 = a4;
  if (objc_msgSend_isRelevantContext_(self, v6, (uint64_t)a3, v7))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRRequestSentWithRequestData_(WeakRetained, v9, (uint64_t)v11, v10);
  }
}

- (void)pnrResponseReceived:(id)a3 pnrRspData:(id)a4
{
  id v23 = a4;
  if (objc_msgSend_isRelevantContext_(self, v6, (uint64_t)a3, v7))
  {
    double v8 = [IDSCTPNRResponseData alloc];
    uint64_t v12 = objc_msgSend_PNRInfo(self, v9, v10, v11);
    uint64_t v16 = objc_msgSend_phoneBookNumber(v12, v13, v14, v15);
    double v19 = objc_msgSend_initWithCTResponse_phoneBookNumber_(v8, v17, (uint64_t)v23, v18, v16);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRResponseReceivedWithResponseData_(WeakRetained, v21, (uint64_t)v19, v22);
  }
}

- (void)subscriptionInfoDidChange
{
  objc_msgSend_setContext_(self, a2, 0, v2);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (NSString)labelID
{
  return self->_labelID;
}

- (void)setLabelID:(id)a3
{
}

- (IDSCTPNRDelegate)PNRDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
  return (IDSCTPNRDelegate *)WeakRetained;
}

- (void)setPNRDelegate:(id)a3
{
}

- (int64_t)carrierShortcodeSupported
{
  return self->_carrierShortcodeSupported;
}

- (void)setCarrierShortcodeSupported:(int64_t)a3
{
  self->_int64_t carrierShortcodeSupported = a3;
}

- (os_unfair_lock_s)contextLock
{
  return self->_contextLock;
}

- (void)setContextLock:(os_unfair_lock_s)a3
{
  self->_contextLock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_PNRDelegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong(&self->_coreTelephonyClient, 0);
}

@end