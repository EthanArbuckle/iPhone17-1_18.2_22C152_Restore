@interface IMCTSubscriptionUtilities
+ (id)sharedInstance;
- (BOOL)deviceSupportsMultipleSubscriptions;
- (BOOL)isDataConnectionExpensive;
- (BOOL)simInHomeCountryWithSubscriptionContext:(id)a3;
- (BOOL)wifiCallingEnabledForSubscriptionContext:(id)a3;
- (CoreTelephonyClient)coreTelephonyClient;
- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector;
- (IMCTSubscriptionUtilities)init;
- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo;
- (NSArray)ctServiceSubscriptions;
- (NSArray)registeredPhoneNumbers;
- (NSArray)registeredSIMIDs;
- (NSArray)registeredSubscriptionSlotIDs;
- (NSMutableDictionary)cachedCarrierSettings;
- (NSNumber)wrmCellScore;
- (NSNumber)wrmNetworkPreference;
- (NSString)ctPhoneNumber;
- (id)_CTSIMSFromPhoneSubscriptions:(id)a3;
- (id)_cachedCarrierKeyForKeyHierarchy:(id)a3 bundleType:(int64_t)a4;
- (id)_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:(id)a3;
- (id)_createSettingsDictionaryForUniqueID:(id)a3;
- (id)_getCachedCarrierSettingValueForBundleKey:(id)a3 uniqueID:(id)a4;
- (id)_getCachedSettingOrReadFromBundleForCarrierBundleKey:(id)a3 bundleType:(int64_t)a4 forContext:(id)a5 defaultValue:(id)a6;
- (id)_getCarrierSettingsForUniqueID:(id)a3;
- (id)_iMessageService;
- (id)_registeredSims;
- (id)copyBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 bundleType:(int64_t)a5 defaultValue:(id)a6 valueIfError:(id)a7;
- (id)copyCarrierBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6;
- (id)copyIsoCountryCodeForSubscriptionContext:(id)a3;
- (id)copyOperatorBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6;
- (id)ctSubscriptionInfoWithError:(id *)a3;
- (id)newSubscriptionContextWithPhoneNumber:(id)a3 labelID:(id)a4 isDefaultVoice:(id)a5 isDefaultData:(id)a6 slot:(int64_t)a7;
- (id)newSubscriptionContextWithSlot:(int64_t)a3;
- (id)rcsConfigurationForSubscriptionContext:(id)a3;
- (id)rcsConfigurationForSubscriptionContext:(id)a3 error:(id *)a4;
- (id)stringForBundleType:(int64_t)a3;
- (unint64_t)numberOfSubscriptions;
- (void)_registerForWRM;
- (void)_resetCachedCarrierSettingsForUniqueID:(id)a3;
- (void)_setCachedCarrierSettingValue:(id)a3 bundleKey:(id)a4 uniqueID:(id)a5;
- (void)_setCarrierSettings:(id)a3 uniqueID:(id)a4;
- (void)activeSubscriptionsDidChange;
- (void)carrierBundleChange:(id)a3;
- (void)resetCacheSubscriptionInfo;
- (void)resetCacheSubscriptionInfoAndPostNotification;
- (void)setCachedCarrierSettings:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCtSubscriptionInfo:(id)a3;
- (void)setPhoneSubscriptionSelector:(id)a3;
- (void)setWrmCellScore:(id)a3;
- (void)setWrmNetworkPreference:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation IMCTSubscriptionUtilities

- (BOOL)deviceSupportsMultipleSubscriptions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((byte_1EB4A65D4 & 1) == 0)
  {
    id v8 = 0;
    v2 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfoWithError:&v8];
    v3 = (__CFString *)v8;
    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v3;
          _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Error occured fetching subscription info %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v2) {
        byte_1EB4A64B0 = objc_msgSend(v2, "__im_hasMultipleSubscriptions");
      }
      byte_1EB4A65D4 = 1;
    }
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        if (byte_1EB4A64B0) {
          v6 = @"YES";
        }
        else {
          v6 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Device supports multiple subscriptions ? %@", buf, 0xCu);
      }
    }
  }
  return byte_1EB4A64B0;
}

+ (id)sharedInstance
{
  if (qword_1EB4A66E8 != -1) {
    dispatch_once(&qword_1EB4A66E8, &unk_1EF2BF400);
  }
  v2 = (void *)qword_1EB4A6650;

  return v2;
}

- (NSArray)ctServiceSubscriptions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1EB4A6600) {
    BOOL v2 = qword_1EB4A6608 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || !self->_coreTelephonyClient)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Classes CTXPCServiceSubscriptionInfo and CTXPCServiceSubscriptionContext were not weak linked properly, returning nil.", (uint8_t *)&v9, 2u);
      }
    }
    v5 = 0;
  }
  else
  {
    v3 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 subscriptions];
    }
    else
    {
      v5 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Returning subscriptions %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }

  return (NSArray *)v5;
}

- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo
{
  return (IMCTXPCServiceSubscriptionInfo *)[(IMCTSubscriptionUtilities *)self ctSubscriptionInfoWithError:0];
}

- (id)ctSubscriptionInfoWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  ctSubscriptionInfo = self->_ctSubscriptionInfo;
  if (!ctSubscriptionInfo)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v18 = 0;
    v7 = [(CoreTelephonyClient *)coreTelephonyClient getSubscriptionInfoWithError:&v18];
    id v8 = v18;
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [v8 code];
          *(_DWORD *)buf = 134218242;
          uint64_t v20 = v11;
          __int16 v21 = 2112;
          v22 = v7;
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Error while getting the subscription info: %ld with info: %@", buf, 0x16u);
        }
      }
      v12 = 0;
      if (a3) {
        *a3 = v8;
      }
    }
    else
    {
      v12 = [[IMCTXPCServiceSubscriptionInfo alloc] initWithSubscriptionInfo:v7];
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = (uint64_t)v12;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Retrieved new CT subscription info %@", buf, 0xCu);
        }
      }
    }
    v16 = self->_ctSubscriptionInfo;
    p_ctSubscriptionInfo = &self->_ctSubscriptionInfo;
    *p_ctSubscriptionInfo = v12;

    ctSubscriptionInfo = *p_ctSubscriptionInfo;
  }

  return ctSubscriptionInfo;
}

- (IMCTSubscriptionUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMCTSubscriptionUtilities;
  BOOL v2 = [(IMCTSubscriptionUtilities *)&v10 init];
  if (v2)
  {
    if (qword_1EB4A6610 != -1) {
      dispatch_once(&qword_1EB4A6610, &unk_1EF2BE378);
    }
    uint64_t v3 = objc_msgSend(objc_alloc((Class)MEMORY[0x1A6227910](@"CoreTelephonyClient", @"CoreTelephony")), "initWithQueue:", MEMORY[0x1E4F14428]);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v3;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    v5 = (IDSPhoneSubscriptionSelector *)objc_alloc_init(MEMORY[0x1E4F6AB70]);
    phoneSubscriptionSelector = v2->_phoneSubscriptionSelector;
    v2->_phoneSubscriptionSelector = v5;

    v7 = +[IMFeatureFlags sharedFeatureFlags];
    int v8 = [v7 isDynamicLQMDisabledByWRM];

    if (v8) {
      [(IMCTSubscriptionUtilities *)v2 _registerForWRM];
    }
  }
  return v2;
}

- (void)_registerForWRM
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isDynamicLQMDisabledByWRM];

  if (v4)
  {
    int out_token = 0;
    wrmNetworkPreference = self->_wrmNetworkPreference;
    self->_wrmNetworkPreference = (NSNumber *)&unk_1EF3057F0;

    wrmCellScore = self->_wrmCellScore;
    self->_wrmCellScore = (NSNumber *)&unk_1EF305808;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1A07E8AA4;
    v9[3] = &unk_1E5A11EB0;
    v9[4] = self;
    uint32_t v7 = notify_register_dispatch("com.apple.WRM.iRAT_event.linkRecommendation", &out_token, MEMORY[0x1E4F14428], v9);
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          uint32_t v12 = v7;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "LQM-WRM Failed to register for com.apple.WRM.iRAT_event.linkRecommendation (%u)", buf, 8u);
        }
      }
    }
  }
}

- (BOOL)isDataConnectionExpensive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMPCDoesInterfaceExist())
  {
    uint64_t v3 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
    int v4 = objc_msgSend(v3, "__im_preferredDataSubscriptionContext");

    if (v4)
    {
      v5 = [MEMORY[0x1E4F23A18] descriptorWithSubscriptionContext:v4];
      coreTelephonyClient = self->_coreTelephonyClient;
      id v13 = 0;
      int v7 = [(CoreTelephonyClient *)coreTelephonyClient interfaceCostExpensive:v5 error:&v13];
      id v8 = v13;
      int v9 = IMOSLoggingEnabled();
      if (v8)
      {
        if (v9)
        {
          objc_super v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v15 = v8;
            _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "LQM-WRM Error occurred trying to get interfaceCostExpensive %@", buf, 0xCu);
          }
        }
        LOBYTE(v7) = 1;
      }
      else if (v9)
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v15) = v7;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "LQM-WRM interfaceCostExpensive returned %d", buf, 8u);
        }
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)_iMessageService
{
  if (qword_1E94FF268 != -1) {
    dispatch_once(&qword_1E94FF268, &unk_1EF2C0080);
  }
  BOOL v2 = (void *)qword_1E94FF280;

  return v2;
}

- (id)_CTSIMSFromPhoneSubscriptions:(id)a3
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F6AB68], sel_CTSIMSFromPhoneSubscriptions_);
}

- (id)_registeredSims
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(IMCTSubscriptionUtilities *)self _iMessageService];
  uint64_t v3 = [v2 accounts];

  int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", (void)v14))
        {
          uint64_t v11 = [v10 matchingSim];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint32_t v12 = (void *)[v4 copy];

  return v12;
}

- (NSArray)registeredSubscriptionSlotIDs
{
  BOOL v2 = [(IMCTSubscriptionUtilities *)self _registeredSims];
  uint64_t v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1EF2BE498);

  return (NSArray *)v3;
}

- (NSArray)registeredSIMIDs
{
  BOOL v2 = [(IMCTSubscriptionUtilities *)self _registeredSims];
  uint64_t v3 = [v2 arrayByApplyingSelector:sel_SIMIdentifier];

  return (NSArray *)v3;
}

- (NSArray)registeredPhoneNumbers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = [(IMCTSubscriptionUtilities *)self registeredSubscriptionSlotIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (int)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
        objc_super v10 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
        uint64_t v11 = objc_msgSend(v10, "__im_phoneNumberForSlotID:", v9);

        if (v3 && v11) {
          CFArrayAppendValue(v3, v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 labelID];
    if ([v5 length]) {
      [v4 labelID];
    }
    else {
    uint64_t v6 = [v4 phoneNumber];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)cachedCarrierSettings
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_cachedCarrierSettings = &self->_cachedCarrierSettings;
  cachedCarrierSettings = self->_cachedCarrierSettings;
  if (!cachedCarrierSettings)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
    uint64_t v7 = [v6 subscriptions];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      uint64_t v10 = MEMORY[0x1E4F1CC08];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v13 = [(IMCTSubscriptionUtilities *)self _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:v12];
          long long v14 = v13;
          if (v12 && [v13 length]) {
            [v5 setObject:v10 forKey:v14];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_cachedCarrierSettings, v5);
    if (IMOSLoggingEnabled())
    {
      long long v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = *p_cachedCarrierSettings;
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v16;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Created the cached carrier settings dict %@", buf, 0xCu);
      }
    }
    cachedCarrierSettings = *p_cachedCarrierSettings;
  }

  return cachedCarrierSettings;
}

- (id)_createSettingsDictionaryForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMCTSubscriptionUtilities *)self cachedCarrierSettings];
    [v5 setObject:MEMORY[0x1E4F1CC08] forKey:v4];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Could not create settings dictionary because uniqueID is nil", v7, 2u);
    }
  }

LABEL_4:
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)_resetCachedCarrierSettingsForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMCTSubscriptionUtilities *)self _createSettingsDictionaryForUniqueID:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "UniqueID is nil, can not reset cache.", v7, 2u);
    }
  }
}

- (id)_getCarrierSettingsForUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMCTSubscriptionUtilities *)self cachedCarrierSettings];
    uint64_t v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      uint64_t v6 = [(IMCTSubscriptionUtilities *)self _createSettingsDictionaryForUniqueID:v4];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "UniqueID is nil.", v9, 2u);
      }
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_setCarrierSettings:(id)a3 uniqueID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && [v6 length])
  {
    uint64_t v7 = [(IMCTSubscriptionUtilities *)self cachedCarrierSettings];
    [v7 setObject:v8 forKey:v6];
  }
}

- (id)stringForBundleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"CTBundleTypeUnknown";
  }
  else {
    return off_1E5A11EF0[a3 - 1];
  }
}

- (id)_cachedCarrierKeyForKeyHierarchy:(id)a3 bundleType:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count]
    && ([v6 lastObject],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v10 = [(IMCTSubscriptionUtilities *)self stringForBundleType:a4];
    uint64_t v11 = [v9 stringWithString:v10];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [v11 appendFormat:@"-%@", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_getCachedCarrierSettingValueForBundleKey:(id)a3 uniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length] && objc_msgSend(v6, "length"))
  {
    uint64_t v8 = [(IMCTSubscriptionUtilities *)self _getCarrierSettingsForUniqueID:v7];
    uint64_t v9 = [v8 objectForKey:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_setCachedCarrierSettingValue:(id)a3 bundleKey:(id)a4 uniqueID:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length])
  {
    uint64_t v11 = [(IMCTSubscriptionUtilities *)self _getCarrierSettingsForUniqueID:v10];
    id v12 = (void *)[v11 mutableCopy];

    if (v8)
    {
      if (v12)
      {
        if ([v9 length])
        {
          [v12 setObject:v8 forKey:v9];
          [(IMCTSubscriptionUtilities *)self _setCarrierSettings:v12 uniqueID:v10];
          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412802;
              id v15 = v8;
              __int16 v16 = 2112;
              id v17 = v9;
              __int16 v18 = 2112;
              long long v19 = v12;
              _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Request to set value %@ for key %@. Carrier settings dict is now %@", (uint8_t *)&v14, 0x20u);
            }
          }
        }
      }
    }
  }
}

- (id)_getCachedSettingOrReadFromBundleForCarrierBundleKey:(id)a3 bundleType:(int64_t)a4 forContext:(id)a5 defaultValue:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(IMCTSubscriptionUtilities *)self _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:v11];
  int v14 = [(IMCTSubscriptionUtilities *)self _cachedCarrierKeyForKeyHierarchy:v10 bundleType:a4];
  id v15 = [(IMCTSubscriptionUtilities *)self _getCachedCarrierSettingValueForBundleKey:v14 uniqueID:v13];
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "There is no cached value for key %@, fetching from carrier bundle with uniqueID %@", buf, 0x16u);
      }
    }
    v26 = (void *)[objc_alloc((Class)qword_1EB4A65F8) initWithBundleType:a4];
    id v17 = v12;
    coreTelephonyClient = self->_coreTelephonyClient;
    id v27 = 0;
    long long v19 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyCarrierBundleValueWithDefault:v11 keyHierarchy:v10 bundleType:v26 error:&v27];
    id v20 = v27;
    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v29 = v19;
          __int16 v30 = 2112;
          id v31 = v10;
          __int16 v32 = 2112;
          id v33 = v13;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Retrieved carrier bundle value %@ for key %@ for uniqueID %@", buf, 0x20u);
        }
      }
      id v22 = v19;
    }
    else
    {
      id v22 = v17;
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v29 = 0;
          __int16 v30 = 2112;
          id v31 = v17;
          __int16 v32 = 2112;
          id v33 = v10;
          __int16 v34 = 2112;
          v35 = v13;
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Retrieved nil carrier bundle value %@, defaulting to value %@ for key %@ for uniqueID %@", buf, 0x2Au);
        }

        id v22 = v17;
      }
    }

    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v29 = v20;
          __int16 v30 = 2112;
          id v31 = v10;
          __int16 v32 = 2112;
          id v33 = v13;
          _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Got error %@ fetching key %@ for uniqueID %@", buf, 0x20u);
        }
      }
    }
    else
    {
      [(IMCTSubscriptionUtilities *)self _setCachedCarrierSettingValue:v22 bundleKey:v14 uniqueID:v13];
      id v17 = v22;
    }
    id v15 = v17;
  }

  return v15;
}

- (id)copyOperatorBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_copyBundleValueForSubscriptionContext_keyHierarchy_bundleType_defaultValue_valueIfError_);
}

- (id)copyCarrierBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_copyBundleValueForSubscriptionContext_keyHierarchy_bundleType_defaultValue_valueIfError_);
}

- (id)copyBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 bundleType:(int64_t)a5 defaultValue:(id)a6 valueIfError:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = v14;
  id v17 = [(IMCTSubscriptionUtilities *)self _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:v12];
  __int16 v18 = v17;
  if (v12
    && [v17 length]
    && ([v13 lastObject],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = [v19 length],
        v19,
        v20))
  {
    long long v21 = [(IMCTSubscriptionUtilities *)self _getCachedSettingOrReadFromBundleForCarrierBundleKey:v13 bundleType:a5 forContext:v12 defaultValue:v16];
  }
  else
  {
    long long v21 = v16;
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412802;
        id v26 = v12;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Could not read carrier bundle id for key %@ because subscription context was nil or did not have phoneNumber/labelID %@. Returning default %@", (uint8_t *)&v25, 0x20u);
      }

      long long v21 = v16;
    }
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412802;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Returning carrier bundle value %@ for key %@ and context %@", (uint8_t *)&v25, 0x20u);
    }
  }
  return v21;
}

- (BOOL)simInHomeCountryWithSubscriptionContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v4 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyRegistrationDisplayStatus:a3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = IMLogHandleForCategory("IMCTSusbcriptionUtilities");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFE54();
    }

    char v7 = 0;
  }
  else
  {
    char v7 = [v4 isInHomeCountry];
  }

  return v7;
}

- (BOOL)wifiCallingEnabledForSubscriptionContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v4 = [(CoreTelephonyClient *)coreTelephonyClient getCallCapabilities:a3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = IMLogHandleForCategory("IMCTSubscriptionUtilities");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFEBC();
    }

    char v7 = 0;
  }
  else
  {
    char v7 = [v4 isWifiCallingAvailable];
  }

  return v7;
}

- (id)copyIsoCountryCodeForSubscriptionContext:(id)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  id v14 = 0;
  id v5 = (void *)[(CoreTelephonyClient *)coreTelephonyClient copyMobileSubscriberCountryCode:a3 error:&v14];
  id v6 = v14;
  if (v6)
  {
    id v7 = v6;
    id v8 = IMLogHandleForCategory("IMCTSubscriptionUtilities");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFFD0();
    }
  }
  else
  {
    id v9 = self->_coreTelephonyClient;
    id v13 = 0;
    id v8 = [(CoreTelephonyClient *)v9 copyMobileSubscriberIsoCountryCode:v5 error:&v13];
    id v7 = v13;
    if (v7)
    {
      id v10 = IMLogHandleForCategory("IMCTSubscriptionUtilities");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A09EFF68();
      }
    }
    else
    {
      if ([v8 length])
      {
        id v8 = v8;
        id v11 = v8;
        goto LABEL_9;
      }
      id v10 = IMLogHandleForCategory("IMCTSubscriptionUtilities");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A09EFF24(v10);
      }
    }
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (NSString)ctPhoneNumber
{
  BOOL v2 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
  id v3 = [v2 preferredOrDefaultSubscriptionContext];
  id v4 = [v3 phoneNumber];

  return (NSString *)v4;
}

- (unint64_t)numberOfSubscriptions
{
  BOOL v2 = [(IMCTSubscriptionUtilities *)self ctSubscriptionInfo];
  id v3 = [v2 subscriptions];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, " Carrier bundle had changes for context: %@. Calling reset to the cached settings", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = [(IMCTSubscriptionUtilities *)self _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:v4];
  [(IMCTSubscriptionUtilities *)self _resetCachedCarrierSettingsForUniqueID:v6];
}

- (void)resetCacheSubscriptionInfoAndPostNotification
{
  [(IMCTSubscriptionUtilities *)self resetCacheSubscriptionInfo];
  if (IMOSLoggingEnabled())
  {
    BOOL v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A0772000, v2, OS_LOG_TYPE_INFO, "Subscription info has been reset to nil. Raising notification that SIM subscriptions have changed.", v4, 2u);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMSIMSubscriptionsChangedNotification", 0, 0, 1u);
}

- (void)resetCacheSubscriptionInfo
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Resetting subscription info to nil", v4, 2u);
    }
  }
  [(IMCTSubscriptionUtilities *)self setCtSubscriptionInfo:0];
  byte_1EB4A65D4 = 0;
}

- (void)subscriptionInfoDidChange
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_resetCacheSubscriptionInfo object:0];
  [(IMCTSubscriptionUtilities *)self performSelector:sel_resetCacheSubscriptionInfoAndPostNotification withObject:0 afterDelay:1.0];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Subscriptions have changed, resetting subscription info to nil", v4, 2u);
    }
  }
}

- (void)activeSubscriptionsDidChange
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Active subscriptions have changed, resetting subscription info to nil", v4, 2u);
    }
  }
  [(IMCTSubscriptionUtilities *)self subscriptionInfoDidChange];
}

- (id)rcsConfigurationForSubscriptionContext:(id)a3 error:(id *)a4
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient getSystemConfiguration:a3 withError:a4];
}

- (id)rcsConfigurationForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  id v5 = [(IMCTSubscriptionUtilities *)self rcsConfigurationForSubscriptionContext:v4 error:&v9];
  id v6 = v9;
  if (v6)
  {
    int v7 = IMLogHandleForCategory("IMCTSubscriptionUtilities");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0038();
    }
  }

  return v5;
}

- (void)setCtSubscriptionInfo:(id)a3
{
}

- (NSNumber)wrmCellScore
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWrmCellScore:(id)a3
{
}

- (NSNumber)wrmNetworkPreference
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWrmNetworkPreference:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void)setCachedCarrierSettings:(id)a3
{
}

- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector
{
  return self->_phoneSubscriptionSelector;
}

- (void)setPhoneSubscriptionSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, 0);
  objc_storeStrong((id *)&self->_cachedCarrierSettings, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_wrmNetworkPreference, 0);
  objc_storeStrong((id *)&self->_wrmCellScore, 0);

  objc_storeStrong((id *)&self->_ctSubscriptionInfo, 0);
}

- (id)newSubscriptionContextWithSlot:(int64_t)a3
{
  id v4 = objc_alloc((Class)qword_1EB4A6608);

  return (id)[v4 initWithSlot:a3];
}

- (id)newSubscriptionContextWithPhoneNumber:(id)a3 labelID:(id)a4 isDefaultVoice:(id)a5 isDefaultData:(id)a6 slot:(int64_t)a7
{
  id v11 = (objc_class *)qword_1EB4A6608;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[[v11 alloc] initWithSlot:a7];
  [v16 setPhoneNumber:v15];

  [v16 setLabelID:v14];
  [v16 setUserDataPreferred:v12];

  [v16 setUserDefaultVoice:v13];
  return v16;
}

@end