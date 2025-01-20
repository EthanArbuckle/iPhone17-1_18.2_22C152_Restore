@interface CKLazuliEnablementManager
- (BOOL)_isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:(id)a3;
- (BOOL)_isRCSBusinessMessagingSupportedForSubscription:(id)a3;
- (BOOL)_isRCSDisabledByProfileForContext:(id)a3;
- (BOOL)isRCSBusinessMessagingEnabledByDefault;
- (BOOL)isRCSBusinessMessagingSupported;
- (BOOL)isRCSEnabledForAnyActiveSubscription;
- (BOOL)isRCSSupportedForAnyActiveSubscription;
- (CKLazuliEnablementManager)init;
- (CoreTelephonyClient)client;
- (NSMutableDictionary)contextToConfigurationCache;
- (NSMutableDictionary)enablementCache;
- (NSMutableDictionary)registrationStateCache;
- (id)_cacheGetConfigurationForContext:(id)a3;
- (id)_enablementCacheObjectForContext:(id)a3;
- (id)_fetchIsRCSEnabled:(id)a3;
- (id)_registrationCacheObjectForContext:(id)a3;
- (id)ctSubscriptionInfo;
- (id)fetchSystemConfiguration:(id)a3;
- (id)getSubscriptionWithRCSBusinessMessaging;
- (id)isRCSEnabled:(id)a3;
- (id)isRCSEnabledForSubscriptionContext:(id)a3;
- (id)rcsMessagingCapabilitiesForContext:(id)a3;
- (int64_t)_fetchRegistrationState:(id)a3;
- (int64_t)_isRCSBusinessMessagingEnabledByUserPreferenceForSubscriptionContext:(id)a3;
- (int64_t)isRCSBusinessMessagingEnabledByUserPreference;
- (int64_t)registrationStateFor:(id)a3;
- (int64_t)registrationStateForSubscriptionContext:(id)a3;
- (void)_cacheSetConfigurationForContext:(id)a3 forContext:(id)a4;
- (void)_enablementCacheSetObject:(id)a3 forContext:(id)a4;
- (void)_registrationCacheSetObject:(id)a3 forContext:(id)a4;
- (void)_setRCSBusinessMessagingEnabledForSubscription:(id)a3 enabled:(id)a4;
- (void)setClient:(id)a3;
- (void)setContextToConfigurationCache:(id)a3;
- (void)setEnablementCache:(id)a3;
- (void)setRCSBusinessMessagingEnabled:(id)a3 specifier:(id)a4;
- (void)setRCSEnabled:(id)a3 specifier:(id)a4;
- (void)setRegistrationStateCache:(id)a3;
- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4;
@end

@implementation CKLazuliEnablementManager

- (CKLazuliEnablementManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKLazuliEnablementManager;
  v2 = [(CKLazuliEnablementManager *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v4 = [v3 initWithQueue:MEMORY[0x263EF83A0]];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    enablementCache = v2->_enablementCache;
    v2->_enablementCache = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    contextToConfigurationCache = v2->_contextToConfigurationCache;
    v2->_contextToConfigurationCache = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    registrationStateCache = v2->_registrationStateCache;
    v2->_registrationStateCache = v10;
  }
  return v2;
}

- (id)_fetchIsRCSEnabled:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 operationStatus];
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "Operation status is nil", (uint8_t *)&v16, 2u);
        }
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if ([v6 featureDisabledByProfile])
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "Feature is disabled by profile.", (uint8_t *)&v16, 2u);
        }
LABEL_35:

        goto LABEL_36;
      }
      goto LABEL_36;
    }
    uint64_t v11 = [v7 switchState];
    uint64_t v12 = v11;
    if (v11 == -1)
    {
      if ([v6 featureEnabledByDefault])
      {
        if (IMOSLoggingEnabled())
        {
          objc_super v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            LOWORD(v16) = 0;
            _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_INFO, "RCS is enabled by default.", (uint8_t *)&v16, 2u);
          }
          goto LABEL_27;
        }
LABEL_28:
        v10 = (void *)MEMORY[0x263EFFA88];
LABEL_37:

        goto LABEL_38;
      }
    }
    else if (!v11)
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_INFO, "Lazuli is enabled.", (uint8_t *)&v16, 2u);
        }
LABEL_27:

        goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(v12 + 1) > 3) {
          v14 = @"???";
        }
        else {
          v14 = off_2644F0940[v12 + 1];
        }
        int v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "Lazuli switch state is not enabled: %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_35;
    }
LABEL_36:
    v10 = (void *)MEMORY[0x263EFFA80];
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_INFO, "System configuration is nil", (uint8_t *)&v16, 2u);
    }
  }
  v10 = (void *)MEMORY[0x263EFFA80];
LABEL_38:

  return v10;
}

- (int64_t)_fetchRegistrationState:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 operationStatus];
    v8 = v7;
    if (v7)
    {
      int64_t v9 = [v7 registrationState];
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v14 = 134217984;
          int64_t v15 = v9;
          _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_INFO, "Registration state is: %ld.", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_INFO, "Operation status is nil", (uint8_t *)&v14, 2u);
        }
      }
      int64_t v9 = -1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_INFO, "System configuration is nil", (uint8_t *)&v14, 2u);
      }
    }
    int64_t v9 = -1;
  }

  return v9;
}

- (id)isRCSEnabledForSubscriptionContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKLazuliEnablementManager *)self _enablementCacheObjectForContext:v4];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(CKLazuliEnablementManager *)self _fetchIsRCSEnabled:v4];
      [(CKLazuliEnablementManager *)self _enablementCacheSetObject:v7 forContext:v4];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        uint64_t v11 = "-[CKLazuliEnablementManager isRCSEnabledForSubscriptionContext:]";
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "[%s] No active subscriptions.", (uint8_t *)&v10, 0xCu);
      }
    }
    id v7 = (id)MEMORY[0x263EFFA80];
  }

  return v7;
}

- (int64_t)registrationStateForSubscriptionContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKLazuliEnablementManager *)self _registrationCacheObjectForContext:v4];
    v6 = v5;
    if (v5)
    {
      int64_t v7 = (int)[v5 intValue];
    }
    else
    {
      int64_t v7 = [(CKLazuliEnablementManager *)self _fetchRegistrationState:v4];
      int64_t v9 = [NSNumber numberWithInteger:v7];
      [(CKLazuliEnablementManager *)self _registrationCacheSetObject:v9 forContext:v4];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[CKLazuliEnablementManager registrationStateForSubscriptionContext:]";
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "[%s] No active subscriptions.", (uint8_t *)&v11, 0xCu);
      }
    }
    int64_t v7 = -1;
  }

  return v7;
}

- (id)ctSubscriptionInfo
{
  v2 = [MEMORY[0x263F4AF48] sharedInstance];
  id v3 = [v2 ctSubscriptionInfo];

  return v3;
}

- (id)getSubscriptionWithRCSBusinessMessaging
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(CKLazuliEnablementManager *)self isRCSSupportedForAnyActiveSubscription])
  {
    id v3 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
    id v4 = objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", v10, (void)v13))
          {
            id v11 = v10;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_13:
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (void)setRCSBusinessMessagingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(CKLazuliEnablementManager *)self isRCSSupportedForAnyActiveSubscription])
  {
    uint64_t v6 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
    uint64_t v7 = objc_msgSend(v6, "__im_subscriptionsWithRCSSupport");

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", v13, (void)v14))
          {
            [(CKLazuliEnablementManager *)self _setRCSBusinessMessagingEnabledForSubscription:v13 enabled:v5];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)_setRCSBusinessMessagingEnabledForSubscription:(id)a3 enabled:(id)a4
{
  id v6 = a3;
  int v7 = [a4 BOOLValue];
  id v8 = [(CKLazuliEnablementManager *)self client];
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v14 = 0;
    uint64_t v10 = (id *)&v14;
    [v8 enableBusinessMessaging:v6 withError:&v14];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v10 = (id *)&v13;
    [v8 disableBusinessMessaging:v6 withError:&v13];
  }

  id v11 = *v10;
  if (v11)
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CKLazuliEnablementManager _setRCSBusinessMessagingEnabledForSubscription:enabled:]((uint64_t)v11, v12);
    }
  }
}

- (BOOL)isRCSBusinessMessagingSupported
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(CKLazuliEnablementManager *)self isRCSSupportedForAnyActiveSubscription])return 0; {
  id v3 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  }
  id v4 = objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)_isRCSBusinessMessagingSupportedForSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:v4];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [v5 businessMessagingCapabilities];
    char v7 = [v6 supported];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F4AF48] sharedInstance];
    uint64_t v8 = (void *)[v6 copyCarrierBundleValueForSubscriptionContext:v4 keyHierarchy:&unk_26D0759C8 defaultValue:MEMORY[0x263EFFA80] valueIfError:MEMORY[0x263EFFA80]];
    char v7 = [v8 BOOLValue];
  }
  return v7;
}

- (int64_t)isRCSBusinessMessagingEnabledByUserPreference
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(CKLazuliEnablementManager *)self isRCSEnabledForAnyActiveSubscription]) {
    return 0;
  }
  id v3 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  id v4 = objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    int64_t v9 = -1;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", v11, (void)v13))
      {
        int64_t v9 = [(CKLazuliEnablementManager *)self _isRCSBusinessMessagingEnabledByUserPreferenceForSubscriptionContext:v11];
        if (v9 == 1) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (int64_t)_isRCSBusinessMessagingEnabledByUserPreferenceForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 businessMessagingCapabilities];
    int64_t v8 = [v7 userPreferenceForSwitch];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_INFO, "System configuration is nil", v11, 2u);
      }
    }
    int64_t v8 = -1;
  }

  return v8;
}

- (id)rcsMessagingCapabilitiesForContext:(id)a3
{
  id v3 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:a3];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 messagingCapabilities];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_isRCSDisabledByProfileForContext:(id)a3
{
  id v3 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:a3];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 featureDisabledByProfile];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isRCSBusinessMessagingEnabledByDefault
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(CKLazuliEnablementManager *)self isRCSEnabledForAnyActiveSubscription]) {
    return 0;
  }
  id v3 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  char v4 = objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", v10, (void)v13)&& [(CKLazuliEnablementManager *)self _isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:v10])
        {
          BOOL v11 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CKLazuliEnablementManager *)self fetchSystemConfiguration:v4];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [v5 businessMessagingCapabilities];
    char v7 = [v6 enabledByDefault];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F4AF48] sharedInstance];
    uint64_t v8 = (void *)[v6 copyCarrierBundleValueForSubscriptionContext:v4 keyHierarchy:&unk_26D0759E0 defaultValue:MEMORY[0x263EFFA80] valueIfError:MEMORY[0x263EFFA80]];
    char v7 = [v8 BOOLValue];
  }
  return v7;
}

- (BOOL)isRCSEnabledForAnyActiveSubscription
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF8C0] array];
  id v4 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
    char v7 = objc_msgSend(v6, "__im_subscriptionsWithRCSSupport");

    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        *(_DWORD *)buf = 136315394;
        v24 = "-[CKLazuliEnablementManager isRCSEnabledForAnyActiveSubscription]";
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "[%s] subscriptionsWithRCSSupport count %@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v7 = v3;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = -[CKLazuliEnablementManager isRCSEnabledForSubscriptionContext:](self, "isRCSEnabledForSubscriptionContext:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        char v15 = [v14 BOOLValue];

        if (v15)
        {
          BOOL v16 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (BOOL)isRCSSupportedForAnyActiveSubscription
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF8C0] array];
  id v4 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
    char v7 = objc_msgSend(v6, "__im_subscriptionsWithRCSSupport");

    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        int v12 = 136315394;
        long long v13 = "-[CKLazuliEnablementManager isRCSSupportedForAnyActiveSubscription]";
        __int16 v14 = 2112;
        char v15 = v9;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "[%s] subscriptionsWithRCSSupport count %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    char v7 = v3;
  }
  BOOL v10 = [v7 count] != 0;

  return v10;
}

- (id)isRCSEnabled:(id)a3
{
  id v4 = a3;
  char v5 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  uint64_t v6 = [v4 properties];
  char v7 = [v6 objectForKey:@"simID"];
  uint64_t v8 = [v4 properties];

  int64_t v9 = [v8 objectForKey:@"phoneNumber"];
  BOOL v10 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v9);

  uint64_t v11 = [(CKLazuliEnablementManager *)self isRCSEnabledForSubscriptionContext:v10];

  return v11;
}

- (int64_t)registrationStateFor:(id)a3
{
  id v4 = a3;
  char v5 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  uint64_t v6 = [v4 properties];
  char v7 = [v6 objectForKey:@"simID"];
  uint64_t v8 = [v4 properties];

  int64_t v9 = [v8 objectForKey:@"phoneNumber"];
  BOOL v10 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v9);

  int64_t v11 = [(CKLazuliEnablementManager *)self registrationStateForSubscriptionContext:v10];
  return v11;
}

- (void)setRCSEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKLazuliEnablementManager *)self ctSubscriptionInfo];
  int64_t v9 = [v7 properties];
  BOOL v10 = [v9 objectForKey:@"simID"];
  int64_t v11 = [v7 properties];
  int v12 = [v11 objectForKey:@"phoneNumber"];
  long long v13 = objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v10, v12);

  if (!v13)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_30;
    }
    __int16 v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CKLazuliEnablementManager setRCSEnabled:specifier:]";
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_INFO, "[%s] No active subscriptions.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (([v6 intValue] & 0x80000000) != 0 || (int)objc_msgSend(v6, "intValue") >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_INFO, "Unexpected value trying to be set for Lazuli", buf, 2u);
      }
LABEL_7:
    }
  }
  else
  {
    int v15 = [v6 BOOLValue];
    int v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_INFO, "Enabling Lazuli.", buf, 2u);
        }
      }
      long long v18 = [(CKLazuliEnablementManager *)self client];
      uint64_t v24 = 0;
      [v18 enableLazuli:v13 withError:&v24];
      long long v19 = (id *)&v24;
    }
    else
    {
      if (v16)
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_INFO, "Disabling Lazuli.", buf, 2u);
        }
      }
      long long v18 = [(CKLazuliEnablementManager *)self client];
      uint64_t v23 = 0;
      [v18 disableLazuli:v13 withError:&v23];
      long long v19 = (id *)&v23;
    }
    long long v21 = (char *)*v19;

    if (v21)
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v21;
          _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_INFO, "Error Enabling Lazuli: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      [(CKLazuliEnablementManager *)self _enablementCacheSetObject:v6 forContext:v13];
    }
  }
LABEL_30:
}

- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v33 = 136315394;
      v34 = "-[CKLazuliEnablementManager systemConfigurationChanged:withConfiguration:]";
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "[%s] New configuration for context: %@", (uint8_t *)&v33, 0x16u);
    }
  }
  if (v7)
  {
    int64_t v9 = [v7 operationStatus];
    BOOL v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 switchState];
      if ([v7 featureDisabledByProfile])
      {
        if (IMOSLoggingEnabled())
        {
          int v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_INFO, "Feature is disabled by profile.", (uint8_t *)&v33, 2u);
          }
        }
      }
      else if (!v11)
      {
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_21ED18000, v32, OS_LOG_TYPE_INFO, "Lazuli is enabled.", (uint8_t *)&v33, 2u);
          }
        }
        uint64_t v14 = 1;
        goto LABEL_18;
      }
      uint64_t v14 = 0;
LABEL_18:
      int v15 = [(CKLazuliEnablementManager *)self _enablementCacheObjectForContext:v6];
      int v16 = v15;
      if (v15 && v14 != [v15 BOOLValue])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_INFO, "RCS enablement cache was out of date, updating the cache.", (uint8_t *)&v33, 2u);
          }
        }
        long long v18 = [NSNumber numberWithBool:v14];
        [(CKLazuliEnablementManager *)self _enablementCacheSetObject:v18 forContext:v6];
      }
      long long v19 = [(CKLazuliEnablementManager *)self rcsMessagingCapabilitiesForContext:v6];
      long long v20 = [v7 messagingCapabilities];
      BOOL v21 = v19 == v20;

      if (!v21)
      {
        v22 = [MEMORY[0x263F08A00] defaultCenter];
        objc_msgSend(v22, "__mainThreadPostNotificationName:object:", @"CNFLazuliMessagesCapabilitiesStateChangedNotification", self);
      }
      int v23 = [(CKLazuliEnablementManager *)self _isRCSDisabledByProfileForContext:v6];
      if (v23 != [v7 featureDisabledByProfile])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33) = 0;
            _os_log_impl(&dword_21ED18000, v24, OS_LOG_TYPE_INFO, "Feature disabled by profile state changed.", (uint8_t *)&v33, 2u);
          }
        }
        __int16 v25 = [MEMORY[0x263F08A00] defaultCenter];
        objc_msgSend(v25, "__mainThreadPostNotificationName:object:", @"CNFLazuliDisabledByProfileChangedNotification", self);
      }
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_21ED18000, v26, OS_LOG_TYPE_INFO, "contextToConfiguration cache was out of date, updating the cache.", (uint8_t *)&v33, 2u);
        }
      }
      [(CKLazuliEnablementManager *)self _cacheSetConfigurationForContext:v7 forContext:v6];
      uint64_t v27 = [(CKLazuliEnablementManager *)self _registrationCacheObjectForContext:v6];
      v28 = v27;
      if (v27)
      {
        uint64_t v29 = [v27 integerValue];
        if (v29 != [v10 registrationState])
        {
          v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject registrationState](v10, "registrationState"));
          [(CKLazuliEnablementManager *)self _registrationCacheSetObject:v30 forContext:v6];

          v31 = [MEMORY[0x263F08A00] defaultCenter];
          objc_msgSend(v31, "__mainThreadPostNotificationName:object:", @"CNFLazuliRegistrationStateChangedNotification", self);
        }
      }

      goto LABEL_48;
    }
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_INFO, "Operation status is nil", (uint8_t *)&v33, 2u);
      }
    }
  }
  else
  {
    BOOL v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKLazuliEnablementManager systemConfigurationChanged:withConfiguration:](v10);
    }
  }
LABEL_48:
}

- (id)_cacheGetConfigurationForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263F4AF40];
  id v6 = [v4 phoneNumber];
  id v7 = [v4 labelID];
  uint64_t v8 = [v5 IMUniqueIdentifierForPhoneNumber:v6 simID:v7];

  if (v8)
  {
    int64_t v9 = [(CKLazuliEnablementManager *)self contextToConfigurationCache];
    BOOL v10 = [v9 objectForKey:v8];

    if (v10 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        int v16 = v8;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_INFO, "Returning cached system configuration (%@) for unique identifier %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_cacheSetConfigurationForContext:(id)a3 forContext:(id)a4
{
  id v12 = a3;
  id v6 = (void *)MEMORY[0x263F4AF40];
  id v7 = a4;
  uint64_t v8 = [v7 phoneNumber];
  int64_t v9 = [v7 labelID];

  BOOL v10 = [v6 IMUniqueIdentifierForPhoneNumber:v8 simID:v9];

  if (v10)
  {
    uint64_t v11 = [(CKLazuliEnablementManager *)self contextToConfigurationCache];
    [v11 setObject:v12 forKey:v10];
  }
}

- (id)fetchSystemConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = [(CKLazuliEnablementManager *)self _cacheGetConfigurationForContext:v4];
  if (!v5)
  {
    id v6 = [(CKLazuliEnablementManager *)self client];
    id v10 = 0;
    char v5 = [v6 getSystemConfiguration:v4 withError:&v10];
    id v7 = v10;

    if (v7)
    {
      uint64_t v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CKLazuliEnablementManager fetchSystemConfiguration:]((uint64_t)v7, v8);
      }

      char v5 = 0;
    }
    else
    {
      [(CKLazuliEnablementManager *)self _cacheSetConfigurationForContext:v5 forContext:v4];
    }
  }
  return v5;
}

- (id)_enablementCacheObjectForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263F4AF40];
  id v6 = [v4 phoneNumber];
  id v7 = [v4 labelID];
  uint64_t v8 = [v5 IMUniqueIdentifierForPhoneNumber:v6 simID:v7];

  if (v8)
  {
    int64_t v9 = [(CKLazuliEnablementManager *)self enablementCache];
    id v10 = [v9 objectForKey:v8];

    if (v10 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        int v16 = v8;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_INFO, "Returning cached enablement value (%@) for unique identifier %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_enablementCacheSetObject:(id)a3 forContext:(id)a4
{
  id v12 = a3;
  id v6 = (void *)MEMORY[0x263F4AF40];
  id v7 = a4;
  uint64_t v8 = [v7 phoneNumber];
  int64_t v9 = [v7 labelID];

  id v10 = [v6 IMUniqueIdentifierForPhoneNumber:v8 simID:v9];

  if (v10)
  {
    uint64_t v11 = [(CKLazuliEnablementManager *)self enablementCache];
    [v11 setObject:v12 forKey:v10];
  }
}

- (id)_registrationCacheObjectForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263F4AF40];
  id v6 = [v4 phoneNumber];
  id v7 = [v4 labelID];
  uint64_t v8 = [v5 IMUniqueIdentifierForPhoneNumber:v6 simID:v7];

  if (v8)
  {
    int64_t v9 = [(CKLazuliEnablementManager *)self registrationStateCache];
    id v10 = [v9 objectForKey:v8];

    if (v10 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        int v16 = v8;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_INFO, "Returning cached registrationState value (%@) for unique identifier %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_registrationCacheSetObject:(id)a3 forContext:(id)a4
{
  id v12 = a3;
  id v6 = (void *)MEMORY[0x263F4AF40];
  id v7 = a4;
  uint64_t v8 = [v7 phoneNumber];
  int64_t v9 = [v7 labelID];

  id v10 = [v6 IMUniqueIdentifierForPhoneNumber:v8 simID:v9];

  if (v10)
  {
    uint64_t v11 = [(CKLazuliEnablementManager *)self registrationStateCache];
    [v11 setObject:v12 forKey:v10];
  }
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)enablementCache
{
  return self->_enablementCache;
}

- (void)setEnablementCache:(id)a3
{
}

- (NSMutableDictionary)contextToConfigurationCache
{
  return self->_contextToConfigurationCache;
}

- (void)setContextToConfigurationCache:(id)a3
{
}

- (NSMutableDictionary)registrationStateCache
{
  return self->_registrationStateCache;
}

- (void)setRegistrationStateCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationStateCache, 0);
  objc_storeStrong((id *)&self->_contextToConfigurationCache, 0);
  objc_storeStrong((id *)&self->_enablementCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_setRCSBusinessMessagingEnabledForSubscription:(uint64_t)a1 enabled:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21ED18000, a2, OS_LOG_TYPE_ERROR, "Error enabling/disabling RCS business messaging: %@", (uint8_t *)&v2, 0xCu);
}

- (void)systemConfigurationChanged:(os_log_t)log withConfiguration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21ED18000, log, OS_LOG_TYPE_ERROR, "systemConfiguration is nil.", v1, 2u);
}

- (void)fetchSystemConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21ED18000, a2, OS_LOG_TYPE_ERROR, "Error getting systemConfiguration: %@", (uint8_t *)&v2, 0xCu);
}

@end