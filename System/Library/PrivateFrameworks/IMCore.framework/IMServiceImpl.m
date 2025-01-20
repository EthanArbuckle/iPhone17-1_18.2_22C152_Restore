@interface IMServiceImpl
+ (BOOL)_iMessageEnabledForMultipleSubscriptionsForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5;
+ (BOOL)_isLastAddressedHandleSubscriptionActive:(id)a3;
+ (BOOL)_isSIMIdIDSRegisteredSIM:(id)a3;
+ (BOOL)_isiMessageEnabledIfLastAddressedHandleIsNotActiveAnymore:(id)a3;
+ (BOOL)_readMMSUserOverride;
+ (BOOL)_shouldCheckIfLastAddressedHandleIsInSubscriptionsAnymoreButiMessageIsEnabledForAlias:(id)a3 previousService:(id)a4;
+ (BOOL)hasAlias:(id)a3 onAccountForService:(id)a4;
+ (BOOL)iMessageEnabled;
+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4;
+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5;
+ (BOOL)mmsEnabled;
+ (BOOL)mmsEnabledforPhoneNumber:(id)a3 simID:(id)a4;
+ (BOOL)smsEnabled;
+ (BOOL)systemSupportsSMSSending;
+ (BOOL)systemSupportsSendingAttachmentsOfTypes:(id)a3 error:(int64_t *)a4;
+ (Class)serviceClass;
+ (id)_phoneNumberOnSubscriptionWithSIMID:(id)a3;
+ (id)activeServices;
+ (id)allServices;
+ (id)allServicesNonBlocking;
+ (id)connectedServices;
+ (id)connectedServicesWithCapability:(unint64_t)a3;
+ (id)operationalServicesWithCapability:(unint64_t)a3;
+ (id)serviceWithInternalName:(id)a3;
+ (id)serviceWithName:(id)a3;
+ (id)servicesWithCapability:(unint64_t)a3;
+ (id)servicesWithCapabilityName:(id)a3;
+ (id)supportedCountryCodes;
+ (void)setServiceClass:(Class)a3;
- (BOOL)_wantsInternationizedNumbers;
- (BOOL)allowsMultipleConnections;
- (BOOL)equalID:(id)a3 andID:(id)a4;
- (BOOL)groupsMergeDisplayNames;
- (BOOL)handleIDInsensitivityIsCarrierBased;
- (BOOL)handlesChatInvites;
- (BOOL)hasLoadedServiceProperties;
- (BOOL)ignoresNetworkConnectivity;
- (BOOL)initialSyncPerformed;
- (BOOL)isDiscontinued;
- (BOOL)isEnabled;
- (BOOL)isPersistent;
- (BOOL)isPlugInService;
- (BOOL)shouldDisableDeactivation;
- (BOOL)shouldInternationalizeNumbers;
- (BOOL)shouldReuseTypingIndicatorGUID;
- (BOOL)supportsAudioMessages;
- (BOOL)supportsAuthorization;
- (BOOL)supportsCanonicalHandles;
- (BOOL)supportsCapability:(id)a3;
- (BOOL)supportsCrossAccountIDSMessaging;
- (BOOL)supportsDatabaseStorage;
- (BOOL)supportsForwardingAudioMessages;
- (BOOL)supportsGroupAttachments;
- (BOOL)supportsIDStatusLookup;
- (BOOL)supportsMessaging;
- (BOOL)supportsMutatingGroupMembers;
- (BOOL)supportsNetworkFallback;
- (BOOL)supportsOfflineTransfers;
- (BOOL)supportsOneSessionForAllAccounts;
- (BOOL)supportsPhoneNumberMapping;
- (BOOL)supportsRegistration;
- (BOOL)supportsRelay;
- (BOOL)supportsReplication;
- (BOOL)supportsReplicationCapability:(id)a3;
- (BOOL)supportsSMS;
- (BOOL)supportsShowingSatelliteMessageDownloadCount;
- (BOOL)supportsStickers;
- (BOOL)supportsTypingIndicators;
- (Class)accountClass;
- (IMAccount)bestAccount;
- (IMServiceImpl)initWithName:(id)a3;
- (NSArray)abProperties;
- (NSArray)accountIDs;
- (NSArray)addressBookProperties;
- (NSArray)emailDomains;
- (NSArray)siblingServiceNames;
- (NSArray)siblingServices;
- (NSDictionary)defaultAccountSettings;
- (NSDictionary)defaultSettings;
- (NSDictionary)serviceDefaults;
- (NSDictionary)serviceProperties;
- (NSDictionary)serviceProps;
- (NSString)addressBookProperty;
- (NSString)countryCode;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)name;
- (NSString)shortName;
- (id)_sorting;
- (id)canonicalFormOfID:(id)a3;
- (id)description;
- (id)idsServiceNames;
- (id)infoForAllScreenNames;
- (id)infoForPreferredScreenNames;
- (id)infoForScreenName:(id)a3;
- (id)myScreenNames;
- (id)normalizedFormOfID:(id)a3;
- (int64_t)chatResolutionPriority;
- (int64_t)compareNames:(id)a3;
- (int64_t)maxAttachmentSize;
- (int64_t)maxChatParticipantsForHandle:(id)a3 simID:(id)a4;
- (int64_t)serviceForSendingPriority;
- (unint64_t)caseInsensitivityByHandleType;
- (unint64_t)status;
- (unsigned)IDSensitivity;
- (unsigned)screenNameSensitivity;
- (void)_calculateBestAccount;
- (void)_loadPropertiesIfNeeded;
- (void)activeAccountsChanged:(id)a3;
- (void)dealloc;
- (void)defaultsChanged:(id)a3;
- (void)disconnect;
- (void)doneSetup;
- (void)setAbProperties:(id)a3;
- (void)setAllowsMultipleConnections:(BOOL)a3;
- (void)setBestAccount:(id)a3;
- (void)setCaseInsensitivityByHandleType:(unint64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setDefaultAccountSettings:(id)a3;
- (void)setDefaultSettings:(id)a3;
- (void)setEmailDomains:(id)a3;
- (void)setHandleIDInsensitivityIsCarrierBased:(BOOL)a3;
- (void)setHasLoadedServiceProperties:(BOOL)a3;
- (void)setIgnoresNetworkConnectivity:(BOOL)a3;
- (void)setIsDiscontinued:(BOOL)a3;
- (void)setIsPersistent:(BOOL)a3;
- (void)setIsPlugInService:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedShortName:(id)a3;
- (void)setName:(id)a3;
- (void)setScreenNameSensitivity:(unsigned int)a3;
- (void)setServiceDefaults:(id)a3;
- (void)setServiceProperties:(id)a3;
- (void)setServiceProps:(id)a3;
- (void)setShouldDisableDeactivation:(BOOL)a3;
- (void)setShouldInternationalizeNumbers:(BOOL)a3;
- (void)setShouldReuseTypingIndicatorGUID:(BOOL)a3;
- (void)setSiblingServiceNames:(id)a3;
- (void)setSupportsCrossAccountIDSMessaging:(BOOL)a3;
- (void)setSupportsSMS:(BOOL)a3;
- (void)statusChangedForAccount:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation IMServiceImpl

+ (BOOL)smsEnabled
{
  v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61740], a2, v2, v3);
  char v8 = objc_msgSend_supportsSMS(v4, v5, v6, v7);

  if (v8) {
    return 1;
  }
  v13 = (void *)qword_1EB3F21C0;
  if (!qword_1EB3F21C0)
  {
    v14 = objc_msgSend_sharedInstance(IMAccountController, v9, v10, v11);
    v18 = objc_msgSend_smsService(IMServiceImpl, v15, v16, v17);
    uint64_t v21 = objc_msgSend_bestAccountForService_(v14, v19, (uint64_t)v18, v20);
    v22 = (void *)qword_1EB3F21C0;
    qword_1EB3F21C0 = v21;

    v13 = (void *)qword_1EB3F21C0;
  }

  return objc_msgSend_allowsSMSRelay(v13, v9, v10, v11);
}

+ (id)servicesWithCapabilityName:(id)a3
{
  id v4 = a3;
  char v8 = objc_msgSend_allServices(a1, v5, v6, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A4B34694;
  v14[3] = &unk_1E5B7B328;
  id v15 = v4;
  id v9 = v4;
  v12 = objc_msgSend___imArrayByFilteringWithBlock_(v8, v10, (uint64_t)v14, v11);

  return v12;
}

+ (id)allServices
{
  id v4 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  objc_msgSend_blockUntilConnected(v4, v5, v6, v7);

  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v15 = objc_msgSend_listener(v11, v12, v13, v14);
  v19 = objc_msgSend_allServices(v15, v16, v17, v18);

  return v19;
}

+ (id)allServicesNonBlocking
{
  id v4 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  objc_msgSend_connectToDaemonWithLaunch_(v4, v5, 0, v6);

  uint64_t v10 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  uint64_t v14 = objc_msgSend_listener(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_allServices(v14, v15, v16, v17);

  return v18;
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)chatResolutionPriority
{
  id v4 = objc_msgSend__sorting(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x1E4F6E258], v6);

  int64_t v11 = objc_msgSend_integerValue(v7, v8, v9, v10);
  return v11;
}

- (id)_sorting
{
  id v4 = objc_msgSend_serviceProps(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x1E4F6E248], v6);

  return v7;
}

- (NSDictionary)serviceProps
{
  return self->_serviceProps;
}

- (void)statusChangedForAccount:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 1024;
      int v21 = v6;
      __int16 v22 = 1024;
      int v23 = v5;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Status changed for account: %@             from: %d to: %d", (uint8_t *)&v18, 0x18u);
    }
  }
  objc_msgSend__calculateBestAccount(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_notificationCenter(IMServiceAgent, v13, v14, v15);
  objc_msgSend___mainThreadPostNotificationName_object_(v16, v17, @"__kIMServiceStatusChangedNotification", (uint64_t)self);
}

- (void)_calculateBestAccount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  objc_msgSend_activeAccountsForService_(v5, v6, (uint64_t)self, v7);
  id v8 = (IMServiceImpl *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Accounts: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  objc_msgSend_bestAccountFromAccounts_(IMAccountController, v9, (uint64_t)v8, v10);
  uint64_t v12 = (IMAccount *)objc_claimAutoreleasedReturnValue();
  bestAccount = self->_bestAccount;
  self->_bestAccount = v12;

  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = self->_bestAccount;
      int v16 = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Recalculated best account for %@: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

+ (id)serviceWithInternalName:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6, v7))
  {
    id v14 = 0;
    goto LABEL_24;
  }
  if (!qword_1EB3F2420)
  {
    id v10 = a1;
    objc_sync_enter(v10);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = (void *)qword_1EB3F2420;
    qword_1EB3F2420 = (uint64_t)v11;

    objc_sync_exit(v10);
  }
  if (qword_1EB3F2410 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E1B0], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F2410;
LABEL_23:
    id v14 = v13;
    goto LABEL_24;
  }
  if (qword_1EB3F22E8 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E1B8], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F22E8;
    goto LABEL_23;
  }
  if (qword_1EB3F22E0 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E1A8], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F22E0;
    goto LABEL_23;
  }
  if (qword_1EB3F2418 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E1A0], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F2418;
    goto LABEL_23;
  }
  if (qword_1EB3F2408 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E190], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F2408;
    goto LABEL_23;
  }
  if (qword_1EB3F22D8 && objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E4F6E198], v9))
  {
    uint64_t v13 = (void *)qword_1EB3F22D8;
    goto LABEL_23;
  }
  id v16 = a1;
  objc_sync_enter(v16);
  id v19 = objc_msgSend_objectForKey_((void *)qword_1EB3F2420, v17, (uint64_t)v4, v18);
  objc_sync_exit(v16);

  if (!v19)
  {
    id v23 = objc_alloc((Class)objc_msgSend_serviceClass(v16, v20, v21, v22));
    id v19 = objc_msgSend_initWithName_(v23, v24, (uint64_t)v4, v25);
    if (objc_msgSend_isEqualToString_(v4, v26, *MEMORY[0x1E4F6E190], v27))
    {
      v30 = &qword_1EB3F2408;
    }
    else if (objc_msgSend_isEqualToString_(v4, v28, *MEMORY[0x1E4F6E1B0], v29))
    {
      v30 = &qword_1EB3F2410;
    }
    else if (objc_msgSend_isEqualToString_(v4, v31, *MEMORY[0x1E4F6E1B8], v32))
    {
      v30 = &qword_1EB3F22E8;
    }
    else if (objc_msgSend_isEqualToString_(v4, v33, *MEMORY[0x1E4F6E1A8], v34))
    {
      v30 = &qword_1EB3F22E0;
    }
    else if (objc_msgSend_isEqualToString_(v4, v35, *MEMORY[0x1E4F6E1A0], v36))
    {
      v30 = &qword_1EB3F2418;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v4, v37, *MEMORY[0x1E4F6E198], v38)) {
        goto LABEL_41;
      }
      v30 = &qword_1EB3F22D8;
    }
    objc_storeStrong((id *)v30, v19);
LABEL_41:
    if (v19)
    {
      id v39 = v16;
      objc_sync_enter(v39);
      objc_msgSend_setObject_forKey_((void *)qword_1EB3F2420, v40, (uint64_t)v19, (uint64_t)v4);
      objc_sync_exit(v39);
    }
  }
  id v14 = v19;

LABEL_24:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)supportsCapability:(id)a3
{
  serviceProps = self->_serviceProps;
  uint64_t v4 = *MEMORY[0x1E4F6E1C8];
  id v5 = a3;
  id v8 = objc_msgSend_objectForKey_(serviceProps, v6, v4, v7);
  id v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v5, v10);

  LOBYTE(v5) = (int)objc_msgSend_intValue(v11, v12, v13, v14) > 0;
  return (char)v5;
}

- (BOOL)groupsMergeDisplayNames
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E048], v2);
}

- (NSDictionary)serviceProperties
{
  return self->_serviceProps;
}

- (BOOL)supportsMutatingGroupMembers
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E090], v2);
}

- (BOOL)isDiscontinued
{
  return self->_discontinued;
}

- (IMServiceImpl)initWithName:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMServiceImpl;
  id v8 = [(IMServiceImpl *)&v21 init];
  if (v8)
  {
    if (objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x1E4F6E190], v7))
    {
      id v11 = &qword_1EB3F2408;
    }
    else if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x1E4F6E1B0], v10))
    {
      id v11 = &qword_1EB3F2410;
    }
    else if (objc_msgSend_isEqualToString_(v5, v12, *MEMORY[0x1E4F6E1B8], v13))
    {
      id v11 = &qword_1EB3F22E8;
    }
    else if (objc_msgSend_isEqualToString_(v5, v14, *MEMORY[0x1E4F6E1A8], v15))
    {
      id v11 = &qword_1EB3F22E0;
    }
    else if (objc_msgSend_isEqualToString_(v5, v16, *MEMORY[0x1E4F6E1A0], v17))
    {
      id v11 = &qword_1EB3F2418;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v5, v18, *MEMORY[0x1E4F6E198], v19))
      {
LABEL_15:
        objc_storeStrong((id *)&v8->_name, a3);
        goto LABEL_16;
      }
      id v11 = &qword_1EB3F22D8;
    }
    objc_storeStrong((id *)v11, v8);
    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

+ (Class)serviceClass
{
  if (qword_1E965E820)
  {
    id v2 = (id)qword_1E965E820;
  }
  else
  {
    objc_opt_class();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v2;
}

- (BOOL)supportsAuthorization
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6DFE0], v2);
}

- (void)setServiceProperties:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = (NSDictionary *)a3;
  serviceProps = self->_serviceProps;
  if (serviceProps != v8 && (unint64_t)objc_msgSend_count(serviceProps, v5, v6, v7) <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v62 = 138412546;
        v63 = self;
        __int16 v64 = 2112;
        v65 = v8;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Service: %@  set properties: %@", (uint8_t *)&v62, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_serviceProps, a3);
    objc_msgSend_objectForKey_(v8, v11, *MEMORY[0x1E4F6C088], v12);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedName = self->_localizedName;
    self->_localizedName = v13;

    objc_msgSend_objectForKey_(v8, v15, *MEMORY[0x1E4F6C0C8], v16);
    uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedShortName = self->_localizedShortName;
    self->_localizedShortName = v17;

    objc_msgSend_objectForKey_(v8, v19, *MEMORY[0x1E4F6C0D0], v20);
    objc_super v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siblingServiceNames = self->_siblingServiceNames;
    self->_siblingServiceNames = v21;

    objc_msgSend_objectForKey_(v8, v23, *MEMORY[0x1E4F6C030], v24);
    uint64_t v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    emailDomains = self->_emailDomains;
    self->_emailDomains = v25;

    uint64_t v29 = objc_msgSend_objectForKey_(v8, v27, *MEMORY[0x1E4F6C048], v28);
    self->_screenNameSensitivity = objc_msgSend_intValue(v29, v30, v31, v32);

    v35 = objc_msgSend_objectForKey_(v8, v33, *MEMORY[0x1E4F6E1F0], v34);
    self->_handleIDInsensitivityIsCarrierBased = objc_msgSend_BOOLValue(v35, v36, v37, v38);

    v41 = objc_msgSend_objectForKey_(v8, v39, *MEMORY[0x1E4F6E1E8], v40);
    self->_caseInsensitivityByHandleType = (int)objc_msgSend_intValue(v41, v42, v43, v44);

    objc_msgSend__loadPropertiesIfNeeded(self, v45, v46, v47);
    if (objc_msgSend_supportsCapability_(self, v48, *MEMORY[0x1E4F6E0B8], v49) && !self->_countryCode)
    {
      v53 = objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], v50, v51, v52);
      v56 = objc_msgSend_objectForKey_(v53, v54, *MEMORY[0x1E4F1C400], v55);
      objc_msgSend_lowercaseString(v56, v57, v58, v59);
      v60 = (NSString *)objc_claimAutoreleasedReturnValue();
      countryCode = self->_countryCode;
      self->_countryCode = v60;
    }
  }
}

- (void)setServiceDefaults:(id)a3
{
}

- (void)setDefaultAccountSettings:(id)a3
{
}

- (void)_loadPropertiesIfNeeded
{
  if (!self->_hasLoadedServiceProperties)
  {
    self->_hasLoadedServiceProperties = 1;
    uint64_t v4 = objc_msgSend_objectForKey_(self->_serviceProps, a2, *MEMORY[0x1E4F6C038], v2);
    self->_handlesChatInvites = (int)objc_msgSend_intValue(v4, v5, v6, v7) > 0;

    uint64_t v10 = objc_msgSend_objectForKey_(self->_serviceProps, v8, *MEMORY[0x1E4F6BFD8], v9);
    self->_isPersistent = (int)objc_msgSend_intValue(v10, v11, v12, v13) > 0;

    uint64_t v16 = objc_msgSend_objectForKey_(self->_serviceProps, v14, *MEMORY[0x1E4F6C060], v15);
    self->_isPlugInService = (int)objc_msgSend_intValue(v16, v17, v18, v19) > 0;

    uint64_t v22 = objc_msgSend_objectForKey_(self->_serviceProps, v20, *MEMORY[0x1E4F6BFC0], v21);
    self->_allowsMultipleConnections = (int)objc_msgSend_intValue(v22, v23, v24, v25) > 0;

    uint64_t v28 = objc_msgSend_objectForKey_(self->_serviceProps, v26, *MEMORY[0x1E4F6C0F8], v27);
    self->_shouldInternationalizeNumbers = (int)objc_msgSend_intValue(v28, v29, v30, v31) > 0;

    uint64_t v34 = objc_msgSend_objectForKey_(self->_serviceProps, v32, *MEMORY[0x1E4F6C028], v33);
    self->_shouldDisableDeactivation = (int)objc_msgSend_intValue(v34, v35, v36, v37) > 0;

    uint64_t v40 = objc_msgSend_objectForKey_(self->_serviceProps, v38, *MEMORY[0x1E4F6C050], v39);
    self->_ignoresNetworkConnectivity = (int)objc_msgSend_intValue(v40, v41, v42, v43) > 0;

    uint64_t v46 = objc_msgSend_objectForKey_(self->_serviceProps, v44, *MEMORY[0x1E4F6E1D8], v45);
    self->_isDiscontinued = (int)objc_msgSend_intValue(v46, v47, v48, v49) > 0;

    objc_msgSend_objectForKey_(self->_serviceProps, v50, *MEMORY[0x1E4F6E240], v51);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    self->_shouldReuseTypingIndicatorGUID = (int)objc_msgSend_intValue(v55, v52, v53, v54) > 0;
  }
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (BOOL)allowsMultipleConnections
{
  return self->_allowsMultipleConnections;
}

- (BOOL)supportsRegistration
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E0D0], v2);
}

- (BOOL)supportsCrossAccountIDSMessaging
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6DFF0], v2);
}

- (BOOL)shouldDisableDeactivation
{
  return self->_shouldDisableDeactivation;
}

- (id)idsServiceNames
{
  return (id)objc_msgSend_objectForKey_(self->_serviceProps, a2, *MEMORY[0x1E4F6E200], v2);
}

+ (void)setServiceClass:(Class)a3
{
  qword_1E965E820 = (uint64_t)a3;
}

+ (id)serviceWithName:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
    objc_msgSend_blockUntilConnected(v10, v11, v12, v13);

    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    uint64_t v21 = objc_msgSend_listener(v17, v18, v19, v20);
    uint64_t v24 = objc_msgSend_serviceWithName_(v21, v22, (uint64_t)v3, v23);
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)activeServices
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = objc_msgSend_allServicesNonBlocking(a1, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_sharedInstance(IMAccountController, v10, v11, v12);
        uint64_t v20 = objc_msgSend_activeAccountsForService_(v17, v18, v16, v19);
        uint64_t v24 = objc_msgSend_count(v20, v21, v22, v23);

        if (v24) {
          objc_msgSend_addObject_(v3, v10, v16, v12);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v13);
  }

  uint64_t v28 = objc_msgSend_allObjects(v3, v25, v26, v27);

  return v28;
}

+ (id)connectedServices
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = objc_msgSend_allServicesNonBlocking(a1, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_sharedInstance(IMAccountController, v10, v11, v12);
        uint64_t v20 = objc_msgSend_connectedAccountsForService_(v17, v18, v16, v19);
        uint64_t v24 = objc_msgSend_count(v20, v21, v22, v23);

        if (v24) {
          objc_msgSend_addObject_(v3, v10, v16, v12);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v13);
  }

  uint64_t v28 = objc_msgSend_allObjects(v3, v25, v26, v27);

  return v28;
}

+ (id)servicesWithCapability:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7, 0);
  uint64_t v11 = objc_msgSend_accountsWithCapability_(v8, v9, a3, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_service(v20, v14, v15, v16);
        if (v24)
        {
          uint64_t v25 = objc_msgSend_service(v20, v21, v22, v23);
          objc_msgSend_addObject_(v4, v26, (uint64_t)v25, v27);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v17);
  }

  long long v31 = objc_msgSend_allObjects(v4, v28, v29, v30);

  return v31;
}

+ (id)connectedServicesWithCapability:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7, 0);
  uint64_t v11 = objc_msgSend_connectedAccountsWithCapability_(v8, v9, a3, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_service(v20, v14, v15, v16);
        if (v24)
        {
          uint64_t v25 = objc_msgSend_service(v20, v21, v22, v23);
          objc_msgSend_addObject_(v4, v26, (uint64_t)v25, v27);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v17);
  }

  long long v31 = objc_msgSend_allObjects(v4, v28, v29, v30);

  return v31;
}

+ (id)operationalServicesWithCapability:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7, 0);
  uint64_t v11 = objc_msgSend_operationalAccountsWithCapability_(v8, v9, a3, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_service(v20, v14, v15, v16);
        if (v24)
        {
          uint64_t v25 = objc_msgSend_service(v20, v21, v22, v23);
          objc_msgSend_addObject_(v4, v26, (uint64_t)v25, v27);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v17);
  }

  long long v31 = objc_msgSend_allObjects(v4, v28, v29, v30);

  return v31;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)IMServiceImpl;
  [(IMServiceImpl *)&v7 dealloc];
}

- (BOOL)initialSyncPerformed
{
  return 1;
}

- (void)doneSetup
{
  objc_msgSend_activeAccountsChanged_(self, a2, 0, v2);
  objc_msgSend__syncWithRemoteBuddies(self, v4, v5, v6);
  objc_msgSend_notificationCenter(IMServiceAgent, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v11, v10, @"__kIMServiceStatusChangedNotification", (uint64_t)self);
}

- (void)disconnect
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend_internalName(self, v7, v8, v9);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v10;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Service(%@): Disconnecting from agent", buf, 0xCu);
    }
  }
  if ((unint64_t)objc_msgSend_status(self, v3, v4, v5) >= 3)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13, 0);
    uint64_t v17 = objc_msgSend_accountsForService_(v14, v15, (uint64_t)self, v16);

    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v32, (uint64_t)v36, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend_setIMAccountLoginStatus_(*(void **)(*((void *)&v32 + 1) + 8 * v23++), v19, 2, v20);
        }
        while (v21 != v23);
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v32, (uint64_t)v36, 16);
      }
      while (v21);
    }
  }
  uint64_t v24 = objc_msgSend_status(self, v11, v12, v13);
  bestAccount = self->_bestAccount;
  self->_bestAccount = 0;

  objc_msgSend_statusChangedForAccount_from_to_(self, v26, 0, v24, 1);
  uint64_t v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
  objc_msgSend___mainThreadPostNotificationName_object_(v30, v31, @"ServiceDidDisconnect", (uint64_t)self);
}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  if (v6 == v7)
  {
    char isEqualToString = 1;
  }
  else
  {
    char isEqualToString = 0;
    if (v6 && v7)
    {
      uint64_t v12 = objc_msgSend_canonicalFormOfID_(self, v8, (uint64_t)v6, v9);
      uint64_t v15 = objc_msgSend_canonicalFormOfID_(self, v13, (uint64_t)v10, v14);
      char isEqualToString = objc_msgSend_isEqualToString_(v12, v16, (uint64_t)v15, v17);
    }
  }

  return isEqualToString;
}

- (id)normalizedFormOfID:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)canonicalFormOfID:(id)a3
{
  return (id)MEMORY[0x1F4123F88](a3, self->_screenNameSensitivity, self->_caseInsensitivityByHandleType);
}

- (int64_t)compareNames:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_name(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_name(v4, v9, v10, v11);

  int64_t v15 = objc_msgSend_localizedCompareToString_(v8, v13, (uint64_t)v12, v14);
  return v15;
}

- (unint64_t)status
{
  bestAccount = self->_bestAccount;
  if (bestAccount) {
    return objc_msgSend_loginStatus(bestAccount, a2, v2, v3);
  }
  else {
    return 1;
  }
}

- (id)infoForScreenName:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend__blockUntilInitialSyncPerformed(self, v5, v6, v7);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10, 0);
  uint64_t v14 = objc_msgSend_accountsForService_(v11, v12, (uint64_t)self, v13);

  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_existingIMHandleWithID_(*(void **)(*((void *)&v28 + 1) + 8 * i), v16, (uint64_t)v4, v17);
        uint64_t v25 = objc_msgSend_bestAccountSibling(v21, v22, v23, v24);

        if (v25)
        {
          uint64_t v18 = objc_msgSend_publicAPIPropertiesDictionary(v25, v16, v26, v17);

          goto LABEL_11;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v28, (uint64_t)v32, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v18;
}

- (id)infoForAllScreenNames
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_msgSend__blockUntilInitialSyncPerformed(self, a2, v2, v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = objc_msgSend_sharedInstance(IMAccountController, v6, v7, v8, 0);
  uint64_t v12 = objc_msgSend_accountsForService_(v9, v10, (uint64_t)self, v11);

  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v19 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v23 = objc_msgSend_arrayOfAllIMHandles(v18, v20, v21, v22);
        uint64_t v26 = objc_msgSend_initWithArray_(v19, v24, (uint64_t)v23, v25);

        if (objc_msgSend_count(v26, v27, v28, v29)) {
          objc_msgSend_addObjectsFromArray_(v5, v30, (uint64_t)v26, v31);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v32, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v15);
  }

  long long v35 = objc_msgSend_filterIMHandlesForBestAccountSiblings_(IMHandle, v33, (uint64_t)v5, v34);
  uint64_t v38 = objc_msgSend_arrayByApplyingSelector_(v35, v36, (uint64_t)sel_publicAPIPropertiesDictionary, v37);

  return v38;
}

- (id)infoForPreferredScreenNames
{
  return 0;
}

- (id)myScreenNames
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_activeAccountsForService_(v5, v6, (uint64_t)self, v7);

  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = objc_msgSend_count(v8, v10, v11, v12);
  uint64_t v16 = objc_msgSend_arrayWithCapacity_(v9, v14, v13, v15);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v8;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v28 = objc_msgSend_login(*(void **)(*((void *)&v30 + 1) + 8 * i), v20, v21, v22, (void)v30);
        if (v28) {
          objc_msgSend_addObject_(v16, v26, (uint64_t)v28, v27);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v23);
  }

  return v16;
}

- (BOOL)supportsReplicationCapability:(id)a3
{
  serviceProps = self->_serviceProps;
  uint64_t v4 = *MEMORY[0x1E4F6E1F8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(serviceProps, v6, v4, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v5, v10);

  LOBYTE(v5) = (int)objc_msgSend_intValue(v11, v12, v13, v14) > 0;
  return (char)v5;
}

- (BOOL)supportsGroupAttachments
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E030], v2);
}

- (BOOL)supportsDatabaseStorage
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E000], v2);
}

- (BOOL)supportsOneSessionForAllAccounts
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E0B0], v2);
}

- (BOOL)supportsPhoneNumberMapping
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E0B8], v2);
}

- (BOOL)supportsIDStatusLookup
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E050], v2);
}

- (BOOL)supportsAudioMessages
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6DFD8], v2);
}

- (BOOL)supportsOfflineTransfers
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E0A8], v2);
}

- (BOOL)supportsTypingIndicators
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E120], v2);
}

- (BOOL)supportsMessaging
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E080], v2);
}

- (BOOL)supportsCanonicalHandles
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6DFE8], v2);
}

- (BOOL)supportsStickers
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E110], v2);
}

- (BOOL)supportsForwardingAudioMessages
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6DFD0], v2);
}

- (BOOL)supportsShowingSatelliteMessageDownloadCount
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E100], v2);
}

- (BOOL)supportsRelay
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E0D8], v2);
}

- (BOOL)supportsReplication
{
  uint64_t v3 = objc_msgSend_objectForKeyedSubscript_(self->_serviceProps, a2, *MEMORY[0x1E4F6E230], v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)supportsNetworkFallback
{
  return objc_msgSend_supportsCapability_(self, a2, *MEMORY[0x1E4F6E098], v2);
}

- (int64_t)serviceForSendingPriority
{
  BOOL v4 = objc_msgSend__sorting(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x1E4F6E260], v6);

  int64_t v11 = objc_msgSend_integerValue(v7, v8, v9, v10);
  return v11;
}

+ (BOOL)mmsEnabledforPhoneNumber:(id)a3 simID:(id)a4
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F6E660], sel_IMMMSEnabledForPhoneNumber_simID_, a3, a4);
}

+ (BOOL)hasAlias:(id)a3 onAccountForService:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedInstance(IMAccountController, v7, v8, v9);
  uint64_t v13 = objc_msgSend_accountsForService_(v10, v11, (uint64_t)v6, v12);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v13;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (MEMORY[0x1A62639B0](v5))
        {
          uint64_t v23 = IMCanonicalizeFormattedString();
        }
        else
        {
          uint64_t v23 = 0;
        }
        uint64_t v24 = objc_msgSend_aliases(v19, v20, v21, v22, (void)v40);
        if (objc_msgSend_containsObject_(v24, v25, (uint64_t)v23, v26))
        {
          char isUsableForSending = objc_msgSend__isUsableForSending(v19, v27, v28, v29);

          if (isUsableForSending) {
            goto LABEL_20;
          }
        }
        else
        {
          long long v32 = objc_msgSend_aliases(v19, v27, v28, v29);
          if (objc_msgSend_containsObject_(v32, v33, (uint64_t)v5, v34))
          {
            int v38 = objc_msgSend__isUsableForSending(v19, v35, v36, v37);

            if (v38)
            {

LABEL_20:
              LOBYTE(v16) = 1;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v31, (uint64_t)&v40, (uint64_t)v44, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v16;
}

+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4
{
  return objc_msgSend_iMessageEnabledForSenderLastAddressedHandle_simID_previousService_(IMServiceImpl, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

+ (id)_phoneNumberOnSubscriptionWithSIMID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F6E668];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_ctSubscriptionInfo(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend___im_subscriptionContextForForSimID_(v12, v13, (uint64_t)v4, v14);

  uint64_t v19 = objc_msgSend_phoneNumber(v15, v16, v17, v18);

  return v19;
}

+ (BOOL)_isSIMIdIDSRegisteredSIM:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v4, v5, v6);
  uint64_t v11 = objc_msgSend_registeredSIMIDs(v7, v8, v9, v10);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v11;
  int v14 = 0;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v33, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v12);
        }
        v14 |= objc_msgSend_isEqualToString_(v3, v15, *(void *)(*((void *)&v23 + 1) + 8 * v19++), v16, (void)v23);
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v33, 16);
    }
    while (v17);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v28 = v3;
      __int16 v29 = 2112;
      if (v14) {
        uint64_t v21 = @"YES";
      }
      id v30 = v12;
      __int16 v31 = 2112;
      long long v32 = v21;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Comparing sim ID %@ to registered sim IDs %@; isRegisteredSIM = %@.",
        buf,
        0x20u);
    }
  }
  return v14 & 1;
}

+ (BOOL)_isiMessageEnabledIfLastAddressedHandleIsNotActiveAnymore:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v4, v5, v6);
  uint64_t v11 = objc_msgSend_ctSubscriptionInfo(v7, v8, v9, v10);

  if (objc_msgSend___im_containsPhoneNumber_(v11, v12, (uint64_t)v3, v13))
  {
    LOBYTE(v17) = 0;
  }
  else
  {
    int v17 = objc_msgSend_iMessageEnabled(IMServiceImpl, v14, v15, v16);
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = @"NO";
        if (v17) {
          uint64_t v19 = @"YES";
        }
        int v21 = 138412290;
        uint64_t v22 = v19;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "User has switched SIMs, setting isiMessageEnabled = %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }

  return v17;
}

+ (BOOL)_isLastAddressedHandleSubscriptionActive:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v4, v5, v6);
  uint64_t v11 = objc_msgSend_ctSubscriptionInfo(v7, v8, v9, v10);

  uint64_t v18 = objc_msgSend_phoneNumbersOfActiveSubscriptions(v11, v12, v13, v14);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_phoneNumbersOfActiveSubscriptions(v11, v15, v16, v17);
    char v22 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v3, v21);
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

+ (BOOL)_shouldCheckIfLastAddressedHandleIsInSubscriptionsAnymoreButiMessageIsEnabledForAlias:(id)a3 previousService:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_length(a3, v6, v7, v8))
  {
    if (v5)
    {
      objc_msgSend_iMessageService(IMService, v9, v10, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12 == v5;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_iMessageEnabledForMultipleSubscriptionsForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_copy(v8, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copy(v9, v15, v16, v17);
  char v22 = objc_msgSend_iMessageService(IMService, v19, v20, v21);
  if (!objc_msgSend_length(v14, v23, v24, v25) && objc_msgSend_length(v18, v26, v27, v28))
  {
    uint64_t v29 = objc_msgSend__phoneNumberOnSubscriptionWithSIMID_(a1, v26, (uint64_t)v9, v28);

    uint64_t v14 = (void *)v29;
  }
  if (!objc_msgSend_length(v14, v26, v27, v28) && !objc_msgSend_length(v18, v30, v31, v32))
  {
    int v49 = objc_msgSend_iMessageEnabled(IMServiceImpl, v30, v33, v34);
    if (!IMOSLoggingEnabled()) {
      goto LABEL_25;
    }
    v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      uint64_t v59 = @"NO";
      if (v49) {
        uint64_t v59 = @"YES";
      }
      int v62 = 138412290;
      v63 = v59;
      _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, "Alias and SIMID are nil, but iMessage enabled: %@", (uint8_t *)&v62, 0xCu);
    }
    goto LABEL_24;
  }
  char hasAlias_onAccountForService = objc_msgSend_hasAlias_onAccountForService_(IMServiceImpl, v30, (uint64_t)v14, (uint64_t)v22);
  uint64_t v39 = objc_msgSend_length(v18, v36, v37, v38);
  if (hasAlias_onAccountForService) {
    goto LABEL_12;
  }
  BOOL v43 = v39 != 0;
  if (objc_msgSend_length(v18, v40, v41, v42))
  {
    if (objc_msgSend__isSIMIdIDSRegisteredSIM_(a1, v44, (uint64_t)v18, v45))
    {
LABEL_12:
      int v49 = 1;
      goto LABEL_19;
    }
    BOOL v43 = 0;
  }
  if objc_msgSend__shouldCheckIfLastAddressedHandleIsInSubscriptionsAnymoreButiMessageIsEnabledForAlias_previousService_(a1, v44, (uint64_t)v8, (uint64_t)v10)&& (objc_msgSend__isiMessageEnabledIfLastAddressedHandleIsNotActiveAnymore_(a1, v46, (uint64_t)v8, v48))
  {
    goto LABEL_12;
  }
  if (objc_msgSend_length(v18, v46, v47, v48)) {
    char v52 = v43;
  }
  else {
    char v52 = 1;
  }
  if (v52 & 1) != 0 || (objc_msgSend__isLastAddressedHandleSubscriptionActive_(a1, v50, (uint64_t)v8, v51))
  {
    int v49 = 0;
  }
  else
  {
    int v49 = objc_msgSend_iMessageEnabled(IMServiceImpl, v53, v54, v55);
    if (IMOSLoggingEnabled())
    {
      v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = @"NO";
        if (v49) {
          v61 = @"YES";
        }
        int v62 = 138412290;
        v63 = v61;
        _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "SIMID not found in registered good list, set iMessage enabled: %@", (uint8_t *)&v62, 0xCu);
      }
    }
  }
LABEL_19:
  if (IMOSLoggingEnabled())
  {
    v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = @"NO";
      int v62 = 138412802;
      if (v49) {
        v57 = @"YES";
      }
      v63 = v57;
      __int16 v64 = 2112;
      v65 = v14;
      __int16 v66 = 2112;
      v67 = v18;
      _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, "iMessage enabled for multiple subscriptions: %@ alias: %@ simID: %@", (uint8_t *)&v62, 0x20u);
    }
LABEL_24:
  }
LABEL_25:

  return v49;
}

+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive()) {
    char AddressedHandle_simID_previousService = objc_msgSend__iMessageEnabledForMultipleSubscriptionsForSenderLastAddressedHandle_simID_previousService_(a1, v11, (uint64_t)v8, (uint64_t)v9, v10);
  }
  else {
    char AddressedHandle_simID_previousService = objc_msgSend_iMessageEnabled(IMServiceImpl, v11, v12, v13);
  }
  BOOL v15 = AddressedHandle_simID_previousService;

  return v15;
}

+ (BOOL)_readMMSUserOverride
{
  return MEMORY[0x1F41239A0](a1, a2);
}

+ (BOOL)mmsEnabled
{
  id v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61740], a2, v2, v3);
  int v9 = objc_msgSend_supportsMMS(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x1E4F61740], v10, v11, v12);
  int v17 = objc_msgSend_mmsConfigured(v13, v14, v15, v16);

  char MMSUserOverride = objc_msgSend__readMMSUserOverride(a1, v18, v19, v20);
  if (v9) {
    BOOL v25 = v17 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25 && (MMSUserOverride & 1) != 0) {
    return 1;
  }
  uint64_t v27 = (void *)qword_1E965E828;
  if (!qword_1E965E828)
  {
    uint64_t v28 = objc_msgSend_sharedInstance(IMAccountController, v22, v23, v24);
    uint64_t v32 = objc_msgSend_smsService(IMServiceImpl, v29, v30, v31);
    uint64_t v35 = objc_msgSend_bestAccountForService_(v28, v33, (uint64_t)v32, v34);
    uint64_t v36 = (void *)qword_1E965E828;
    qword_1E965E828 = v35;

    uint64_t v27 = (void *)qword_1E965E828;
  }

  return objc_msgSend_allowsMMSRelay(v27, v22, v23, v24);
}

+ (BOOL)iMessageEnabled
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (IMIsRunningInIDSAccountCapableClient())
  {
    if (qword_1EB3F2208 != -1) {
      dispatch_once(&qword_1EB3F2208, &unk_1EF8E5118);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    objc_msgSend_accounts((void *)qword_1EB3F2200, v2, v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v37, 16);
    if (v10)
    {
      uint64_t v11 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend_canSend(*(void **)(*((void *)&v32 + 1) + 8 * i), v7, v8, v9))
          {
            LOBYTE(v10) = 1;
            goto LABEL_25;
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v32, (uint64_t)v37, 16);
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend_sharedInstance(IMAccountController, v2, v3, v4);
    int v17 = objc_msgSend_iMessageService(IMServiceImpl, v14, v15, v16);
    uint64_t v20 = objc_msgSend_accountsForService_(v13, v18, (uint64_t)v17, v19);

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v20;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v21, (uint64_t)&v28, (uint64_t)v36, 16);
    if (v10)
    {
      uint64_t v25 = *(void *)v29;
      while (2)
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend__isUsableForSending(*(void **)(*((void *)&v28 + 1) + 8 * j), v22, v23, v24, (void)v28))
          {
            LOBYTE(v10) = 1;
            goto LABEL_24;
          }
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v22, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_24:
  }
LABEL_25:

  return v10;
}

- (int64_t)maxChatParticipantsForHandle:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if ((IMServiceImpl *)qword_1EB3F2410 == self)
  {
    if (qword_1E965E788 != -1) {
      dispatch_once(&qword_1E965E788, &unk_1EF8E5FB8);
    }
    uint64_t v14 = objc_msgSend_sharedInstanceForBagType_((void *)qword_1E965E780, v7, 1, v9);
    uint64_t v11 = objc_msgSend_objectForKey_(v14, v15, @"md-max-chat-participants", v16);

    if (v11 && objc_msgSend_integerValue(v11, v17, v18, v19) > 10)
    {
      uint64_t v13 = objc_msgSend_integerValue(v11, v20, v21, v22);
      goto LABEL_10;
    }

LABEL_12:
    int64_t v23 = -1;
    goto LABEL_14;
  }
  if ((IMServiceImpl *)qword_1EB3F2418 == self)
  {
    int64_t v23 = (int)objc_msgSend_IMMMSMaxRecipientsForPhoneNumber_simID_(MEMORY[0x1E4F6E660], v7, (uint64_t)v6, (uint64_t)v10);
    goto LABEL_14;
  }
  if ((IMServiceImpl *)qword_1EB3F22D8 != self) {
    goto LABEL_12;
  }
  uint64_t v11 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E658], v7, v8, v9);
  uint64_t v13 = objc_msgSend_groupMessagingMaxGroupSizeForPhoneNumber_simID_(v11, v12, (uint64_t)v6, (uint64_t)v10);
LABEL_10:
  int64_t v23 = v13;

LABEL_14:
  return v23;
}

- (int64_t)maxAttachmentSize
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_serviceProps, a2, *MEMORY[0x1E4F6C080], v2);
  uint64_t v7 = v3;
  if (v3) {
    int64_t v8 = objc_msgSend_integerValue(v3, v4, v5, v6);
  }
  else {
    int64_t v8 = -1;
  }

  return v8;
}

- (BOOL)isEnabled
{
  return objc_msgSend_isActive(self->_bestAccount, a2, v2, v3);
}

- (BOOL)_wantsInternationizedNumbers
{
  return self->_shouldInternationalizeNumbers;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (NSArray)siblingServices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_msgSend_count(self->_siblingServiceNames, v4, v5, v6);
  id v10 = objc_msgSend_initWithCapacity_(v3, v8, v7 + 1, v9);
  objc_msgSend_addObject_(v10, v11, (uint64_t)self, v12);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = self->_siblingServiceNames;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v16, *(void *)(*((void *)&v24 + 1) + 8 * i), v17, (void)v24);
        uint64_t v22 = v21;
        if (v10 && v21) {
          CFArrayAppendValue((CFMutableArrayRef)v10, v21);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v18);
  }

  return (NSArray *)v10;
}

- (NSArray)accountIDs
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  int64_t v8 = objc_msgSend_activeAccountsForService_(v5, v6, (uint64_t)self, v7);
  uint64_t v11 = objc_msgSend_arrayByApplyingSelector_(v8, v9, (uint64_t)sel_uniqueID, v10);

  return (NSArray *)v11;
}

- (id)description
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = objc_msgSend_internalName(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_arrayWithObjects_(v4, v6, @"IMService[", v7, v5, @"]", 0);
  uint64_t v9 = (void *)IMCreateSimpleComponentString();

  return v9;
}

- (void)defaultsChanged:(id)a3
{
  uint64_t v5 = (NSDictionary *)a3;
  uint64_t v10 = v5;
  if (self->_serviceDefaults != v5) {
    objc_storeStrong((id *)&self->_serviceDefaults, a3);
  }
  int64_t v8 = objc_msgSend_notificationCenter(IMServiceAgent, (const char *)v5, v6, v7);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v8, v9, @"__kIMServiceDefaultsChangedNotification", (uint64_t)self, 0);
}

- (void)activeAccountsChanged:(id)a3
{
  objc_msgSend__calculateBestAccount(self, a2, (uint64_t)a3, v3);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v9, v8, @"NotificationActiveAccountChanged", (uint64_t)self);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedCountryCodes
{
  return (id)objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], a2, @"us", v2);
}

+ (BOOL)systemSupportsSMSSending
{
  return 1;
}

+ (BOOL)systemSupportsSendingAttachmentsOfTypes:(id)a3 error:(int64_t *)a4
{
  id v5 = a3;
  if ((id)objc_opt_class() == a1) {
    char CanBeSent = IMMMSPartCombinationCanBeSent();
  }
  else {
    char CanBeSent = 1;
  }

  return CanBeSent;
}

- (void)setName:(id)a3
{
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSDictionary)defaultAccountSettings
{
  return self->_defaultAccountSettings;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->_isPersistent = a3;
}

- (BOOL)ignoresNetworkConnectivity
{
  return self->_ignoresNetworkConnectivity;
}

- (void)setIgnoresNetworkConnectivity:(BOOL)a3
{
  self->_ignoresNetworkConnectivity = a3;
}

- (unsigned)IDSensitivity
{
  return self->_IDSensitivity;
}

- (BOOL)handleIDInsensitivityIsCarrierBased
{
  return self->_handleIDInsensitivityIsCarrierBased;
}

- (void)setHandleIDInsensitivityIsCarrierBased:(BOOL)a3
{
  self->_handleIDInsensitivityIsCarrierBased = a3;
}

- (unint64_t)caseInsensitivityByHandleType
{
  return self->_caseInsensitivityByHandleType;
}

- (void)setCaseInsensitivityByHandleType:(unint64_t)a3
{
  self->_caseInsensitivityByHandleType = a3;
}

- (void)setShouldDisableDeactivation:(BOOL)a3
{
  self->_shouldDisableDeactivation = a3;
}

- (void)setSupportsCrossAccountIDSMessaging:(BOOL)a3
{
  self->_supportsCrossAccountIDSMessaging = a3;
}

- (BOOL)isPlugInService
{
  return self->_isPlugInService;
}

- (void)setIsPlugInService:(BOOL)a3
{
  self->_isPlugInService = a3;
}

- (BOOL)shouldReuseTypingIndicatorGUID
{
  return self->_shouldReuseTypingIndicatorGUID;
}

- (void)setShouldReuseTypingIndicatorGUID:(BOOL)a3
{
  self->_shouldReuseTypingIndicatorGUID = a3;
}

- (NSArray)emailDomains
{
  return self->_emailDomains;
}

- (void)setEmailDomains:(id)a3
{
}

- (void)setAllowsMultipleConnections:(BOOL)a3
{
  self->_allowsMultipleConnections = a3;
}

- (NSArray)addressBookProperties
{
  return self->_addressBookProperties;
}

- (NSString)addressBookProperty
{
  return self->_addressBookProperty;
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setLocalizedShortName:(id)a3
{
}

- (IMAccount)bestAccount
{
  return self->_bestAccount;
}

- (void)setBestAccount:(id)a3
{
}

- (NSDictionary)defaultSettings
{
  return self->_defaultSettings;
}

- (void)setDefaultSettings:(id)a3
{
}

- (NSArray)siblingServiceNames
{
  return self->_siblingServiceNames;
}

- (void)setSiblingServiceNames:(id)a3
{
}

- (unsigned)screenNameSensitivity
{
  return self->_screenNameSensitivity;
}

- (void)setScreenNameSensitivity:(unsigned int)a3
{
  self->_screenNameSensitivity = a3;
}

- (NSArray)abProperties
{
  return self->_abProperties;
}

- (void)setAbProperties:(id)a3
{
}

- (void)setServiceProps:(id)a3
{
}

- (BOOL)hasLoadedServiceProperties
{
  return self->_hasLoadedServiceProperties;
}

- (void)setHasLoadedServiceProperties:(BOOL)a3
{
  self->_hasLoadedServiceProperties = a3;
}

- (BOOL)supportsSMS
{
  return self->_supportsSMS;
}

- (void)setSupportsSMS:(BOOL)a3
{
  self->_supportsSMS = a3;
}

- (BOOL)shouldInternationalizeNumbers
{
  return self->_shouldInternationalizeNumbers;
}

- (void)setShouldInternationalizeNumbers:(BOOL)a3
{
  self->_shouldInternationalizeNumbers = a3;
}

- (void)setIsDiscontinued:(BOOL)a3
{
  self->_isDiscontinued = a3;
}

- (NSDictionary)serviceDefaults
{
  return self->_serviceDefaults;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (BOOL)handlesChatInvites
{
  return self->_handlesChatInvites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_serviceDefaults, 0);
  objc_storeStrong((id *)&self->_serviceProps, 0);
  objc_storeStrong((id *)&self->_abProperties, 0);
  objc_storeStrong((id *)&self->_siblingServiceNames, 0);
  objc_storeStrong((id *)&self->_defaultSettings, 0);
  objc_storeStrong((id *)&self->_bestAccount, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_addressBookProperty, 0);
  objc_storeStrong((id *)&self->_addressBookProperties, 0);
  objc_storeStrong((id *)&self->_emailDomains, 0);
  objc_storeStrong((id *)&self->_defaultAccountSettings, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end