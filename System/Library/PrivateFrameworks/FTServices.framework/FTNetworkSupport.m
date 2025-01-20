@interface FTNetworkSupport
+ (id)sharedInstance;
- (BOOL)allowAnyNetwork;
- (BOOL)dataActiveAndReachable;
- (BOOL)enableCriticalReliability;
- (BOOL)networkActive;
- (BOOL)networkEnabled;
- (BOOL)networkReachable;
- (BOOL)validNetworkActive;
- (BOOL)validNetworkActiveForBundleId:(id)a3;
- (BOOL)validNetworkEnabled;
- (BOOL)validNetworkEnabledForBundleId:(id)a3;
- (BOOL)validNetworkReachable;
- (BOOL)validNetworkReachableForBundleId:(id)a3;
- (BOOL)wiFiActiveAndReachable;
- (BOOL)willSearchForNetwork;
- (BOOL)willSearchForNetworkForBundleId:(id)a3;
- (void)_clearReliabilityTimeoutInterval;
- (void)_createAPSConnectionIfNeeded;
- (void)_reallySetCriticalReliability:(BOOL)a3;
- (void)_setReliabilityTimeoutInterval;
- (void)_tryToEnableReliability;
- (void)setEnableCriticalReliability:(BOOL)a3;
@end

@implementation FTNetworkSupport

+ (id)sharedInstance
{
  if (qword_1EB47C8A8 != -1) {
    dispatch_once(&qword_1EB47C8A8, &unk_1EFE07880);
  }
  v2 = (void *)qword_1EB47C860;

  return v2;
}

- (BOOL)allowAnyNetwork
{
  v3 = objc_msgSend_sharedInstance(FTUserConfiguration, a2, v2);
  char v6 = objc_msgSend_allowAnyNetwork(v3, v4, v5);

  return v6;
}

- (BOOL)validNetworkEnabled
{
  return MEMORY[0x1F4181798](self, sel_validNetworkEnabledForBundleId_, @"com.apple.facetime");
}

- (BOOL)validNetworkEnabledForBundleId:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v5, v6);
  if (!objc_msgSend_isWiFiEnabled(v7, v8, v9)) {
    goto LABEL_4;
  }
  v12 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v10, v11);
  if (objc_msgSend_isHostingWiFiHotSpot(v12, v13, v14))
  {

LABEL_4:
    goto LABEL_5;
  }
  v35 = objc_msgSend_sharedInstance(FTDeviceSupport, v15, v16);
  char v37 = objc_msgSend_wifiAllowedForBundleId_(v35, v36, (uint64_t)v4);

  if (v37)
  {
    char isDataConnectionActive = 1;
    goto LABEL_10;
  }
LABEL_5:
  v19 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v17, v18);
  char isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v19, v20, v21);

  if ((isAirplaneModeEnabled & 1) == 0
    && ((objc_msgSend_allowAnyNetwork(self, v23, v24) & 1) != 0
     || (objc_msgSend_sharedInstance(FTDeviceSupport, v25, v26),
         v27 = objc_claimAutoreleasedReturnValue(),
         int v29 = objc_msgSend_nonWifiAvailableForBundleId_(v27, v28, (uint64_t)v4),
         v27,
         v29)))
  {
    v30 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v25, v26);
    char isDataConnectionActive = objc_msgSend_isDataConnectionActive(v30, v31, v32);
  }
  else
  {
    char isDataConnectionActive = 0;
  }
LABEL_10:

  return isDataConnectionActive;
}

- (BOOL)validNetworkActive
{
  return MEMORY[0x1F4181798](self, sel_validNetworkActiveForBundleId_, @"com.apple.facetime");
}

- (BOOL)validNetworkActiveForBundleId:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_allowAnyNetwork(self, v5, v6))
  {
    int v9 = 1;
  }
  else
  {
    v10 = objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8);
    int v9 = objc_msgSend_nonWifiAvailableForBundleId_(v10, v11, (uint64_t)v4);
  }
  v12 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v7, v8);
  if (objc_msgSend_isWiFiAssociated(v12, v13, v14))
  {
    v17 = objc_msgSend_sharedInstance(FTDeviceSupport, v15, v16);
    char v19 = objc_msgSend_wifiAllowedForBundleId_(v17, v18, (uint64_t)v4);
  }
  else
  {
    char v19 = 0;
  }

  if (v9)
  {
    v22 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v20, v21);
    uint64_t v27 = objc_msgSend_currentReachabilityStatus(v22, v23, v24);
    if (v19) {
      goto LABEL_14;
    }
  }
  else
  {
    v22 = objc_msgSend_reachabilityForLocalWiFi(FTEmbeddedReachability, v20, v21);
    uint64_t v30 = objc_msgSend_currentReachabilityStatus(v22, v28, v29);
    if (v19) {
      goto LABEL_16;
    }
    uint64_t v27 = v30;
  }
  v31 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v25, v26);
  char isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v31, v32, v33);

  char isWiFiUsable = 0;
  if ((isAirplaneModeEnabled & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_14:
    if ((unint64_t)(v27 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v36 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v25, v26);
      char isWiFiUsable = objc_msgSend_isWiFiUsable(v36, v37, v38);

      goto LABEL_17;
    }
LABEL_16:
    char isWiFiUsable = 1;
  }
LABEL_17:

  return isWiFiUsable;
}

- (BOOL)validNetworkReachable
{
  return MEMORY[0x1F4181798](self, sel_validNetworkReachableForBundleId_, @"com.apple.facetime");
}

- (BOOL)validNetworkReachableForBundleId:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v5, v6);
  uint64_t v10 = objc_msgSend_currentReachabilityStatus(v7, v8, v9);
  v13 = objc_msgSend_sharedInstance(FTDeviceSupport, v11, v12);
  char v15 = objc_msgSend_wifiAllowedForBundleId_(v13, v14, (uint64_t)v4);

  if ((objc_msgSend_allowAnyNetwork(self, v16, v17) & 1) != 0
    || (objc_msgSend_sharedInstance(FTDeviceSupport, v18, v19),
        v20 = objc_claimAutoreleasedReturnValue(),
        int v22 = objc_msgSend_nonWifiAvailableForBundleId_(v20, v21, (uint64_t)v4),
        v20,
        v22))
  {
    if (v10 == 1) {
      BOOL v23 = v15;
    }
    else {
      BOOL v23 = 0;
    }
    BOOL v24 = v10 == 2 || v23;
  }
  else if (v10 == 1)
  {
    BOOL v24 = v15;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)wiFiActiveAndReachable
{
  v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], a2, v2);
  if (!objc_msgSend_isWiFiEnabled(v3, v4, v5))
  {
    BOOL v14 = 0;
LABEL_6:

    return v14;
  }
  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v6, v7);
  char isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v8, v9, v10);

  if ((isHostingWiFiHotSpot & 1) == 0)
  {
    v3 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v12, v13);
    BOOL v14 = objc_msgSend_currentReachabilityStatus(v3, v15, v16) == 1;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)willSearchForNetwork
{
  return MEMORY[0x1F4181798](self, sel_willSearchForNetworkForBundleId_, @"com.apple.facetime");
}

- (BOOL)willSearchForNetworkForBundleId:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_validNetworkReachable(self, v5, v6) & 1) != 0
    || (objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v11 = objc_msgSend_wifiAllowedForBundleId_(v9, v10, (uint64_t)v4),
        v9,
        !v11))
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    if ((objc_msgSend_allowAnyNetwork(self, v12, v13) & 1) != 0
      || (objc_msgSend_sharedInstance(FTDeviceSupport, v14, v15),
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          int v18 = objc_msgSend_nonWifiAvailableForBundleId_(v16, v17, (uint64_t)v4),
          v16,
          v18))
    {
      uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v14, v15);
      int v22 = objc_msgSend_isDataConnectionActive(v19, v20, v21) ^ 1;
    }
    else
    {
      uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v14, v15);
      if (objc_msgSend_willTryToSearchForWiFiNetwork(v19, v24, v25))
      {
        LOBYTE(v22) = 1;
      }
      else
      {
        v28 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v26, v27);
        LOBYTE(v22) = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v28, v29, v30);
      }
    }
  }
  return v22;
}

- (BOOL)dataActiveAndReachable
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], a2, v2);
  LODWORD(v6) = objc_msgSend_isDataConnectionActive(v3, v4, v5);

  if (v6)
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v8, v9);
      int isDataConnectionActive = objc_msgSend_isDataConnectionActive(v10, v11, v12);
      BOOL v14 = @"NO";
      if (isDataConnectionActive) {
        BOOL v14 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = (uint64_t)v14;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: isDataConnectionActive: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v15, v16);
      int v20 = objc_msgSend_isDataConnectionActive(v17, v18, v19);
      uint64_t v21 = @"NO";
      if (v20) {
        uint64_t v21 = @"YES";
      }
      v34 = v21;
      _IDSLogV();
    }
    int v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v15, v16, v34);
    int isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v22, v23, v24);

    if (isAirplaneModeEnabled)
    {
      v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v28, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: isAirplaneModeEnabled, return NO", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      LOBYTE(v6) = 0;
    }
    else
    {
      uint64_t v29 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v26, v27);
      uint64_t v6 = objc_msgSend_currentReachabilityStatus(v29, v30, v31);
      uint64_t v32 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v36 = v6;
        _os_log_impl(&dword_1A7BC0000, v32, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: status = %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      LOBYTE(v6) = v6 == 2;
    }
  }
  return v6;
}

- (BOOL)networkEnabled
{
  return 1;
}

- (BOOL)networkActive
{
  v3 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, a2, v2);
  if ((unint64_t)(objc_msgSend_currentReachabilityStatus(v3, v4, v5) - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    char isWiFiUsable = 1;
  }
  else
  {
    uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v6, v7);
    char isWiFiUsable = objc_msgSend_isWiFiUsable(v8, v9, v10);
  }
  return isWiFiUsable;
}

- (BOOL)networkReachable
{
  v3 = objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, a2, v2);
  BOOL v6 = (unint64_t)(objc_msgSend_currentReachabilityStatus(v3, v4, v5) - 1) < 2;

  return v6;
}

- (void)_createAPSConnectionIfNeeded
{
  if (!self->_apsConnection)
  {
    uint64_t v13 = 0;
    IMGetConferenceSettings();
    id v3 = 0;
    id v4 = *(id *)MEMORY[0x1AD0D4F60]("APSConnectionOverrideNamedDelegatePort", @"ApplePushService");
    APSConnectionClass = self->_APSConnectionClass;
    if (!APSConnectionClass)
    {
      APSConnectionClass = (objc_class *)MEMORY[0x1AD0D4F50](@"APSConnection", @"ApplePushService");
      self->_APSConnectionClass = APSConnectionClass;
    }
    id v6 = [APSConnectionClass alloc];
    uint64_t v7 = im_primary_queue();
    uint64_t v9 = (APSConnection *)objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v6, v8, (uint64_t)v3, v4, v7);
    apsConnection = self->_apsConnection;
    self->_apsConnection = v9;

    if (!self->_apsConnection)
    {
      int v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_ERROR, "Could not create APS Connection for critical reliability check", v12, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (void)_clearReliabilityTimeoutInterval
{
  if (self->_reliabilityAttemptTimer)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out reliability check timer", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    objc_msgSend_invalidate(self->_reliabilityAttemptTimer, v4, v5);
    reliabilityAttemptTimer = self->_reliabilityAttemptTimer;
    self->_reliabilityAttemptTimer = 0;
  }
}

- (void)_setReliabilityTimeoutInterval
{
  objc_msgSend__clearReliabilityTimeoutInterval(self, a2, v2);
  id v4 = objc_alloc(MEMORY[0x1E4F6C328]);
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A7BD5E30;
  v11[3] = &unk_1E5D1AF28;
  v11[4] = self;
  uint64_t v7 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v4, v6, (uint64_t)v5, 10, 1, v11);
  reliabilityAttemptTimer = self->_reliabilityAttemptTimer;
  self->_reliabilityAttemptTimer = v7;

  uint64_t v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Setting reliability check timer", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_reallySetCriticalReliability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_criticalReliabilityEnabledState = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"YES";
    if (self->_criticalReliabilityEnabledState) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    if (!v3) {
      id v6 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Updating critical reliability state from: %@ to: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v8 = @"YES";
    if (self->_criticalReliabilityEnabledState) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    if (!v3) {
      uint64_t v8 = @"NO";
    }
    uint64_t v16 = v9;
    uint64_t v17 = (APSConnection *)v8;
    _IDSLogV();
  }
  uint64_t v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = @"NO";
    apsConnection = self->_apsConnection;
    if (v3) {
      int v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = apsConnection;
    _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Setting push critical state to: %@ (Connection: %@)", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    BOOL v14 = @"NO";
    if (v3) {
      BOOL v14 = @"YES";
    }
    uint64_t v16 = v14;
    uint64_t v17 = self->_apsConnection;
    _IDSLogV();
  }
  objc_msgSend_setEnableCriticalReliability_(self->_apsConnection, v13, self->_criticalReliabilityEnabledState, v16, v17);
  if (!self->_criticalReliabilityEnabledState)
  {
    uint64_t v15 = self->_apsConnection;
    self->_apsConnection = 0;
  }
}

- (void)_tryToEnableReliability
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_enableCriticalReliability) {
    objc_msgSend__createAPSConnectionIfNeeded(v2, v3, v4);
  }
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v2->_enableCriticalReliability) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Trying to set push critical state to: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (v2->_enableCriticalReliability) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    uint64_t v26 = v9;
    _IDSLogV();
  }
  if (!v2->_enableCriticalReliability)
  {
    objc_msgSend__reallySetCriticalReliability_(v2, v7, 0);
    objc_msgSend__clearReliabilityTimeoutInterval(v2, v19, v20);
    goto LABEL_36;
  }
  uint64_t v10 = objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8);
  char v13 = objc_msgSend_conferencingAllowed(v10, v11, v12);

  if ((v13 & 1) == 0)
  {
    uint64_t v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, " => Bailing, facetime is disabled", buf, 2u);
    }

    if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((objc_msgSend_validNetworkEnabled(v2, v14, v15) & 1) == 0)
  {
    BOOL v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, " => Bailing, network is disabled", buf, 2u);
    }

    if os_log_shim_legacy_logging_enabled() && (_IDSShouldLog()) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((objc_msgSend_validNetworkActive(v2, v16, v17) & 1) == 0)
  {
    uint64_t v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, " => Bailing, network is not active", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
LABEL_34:
      _IDSLogV();
      objc_msgSend__reallySetCriticalReliability_(v2, v25, 0, v26);
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend__reallySetCriticalReliability_(v2, v22, 0, v26);
    goto LABEL_36;
  }
  objc_msgSend__reallySetCriticalReliability_(v2, v18, 1, v26);
LABEL_36:
  objc_sync_exit(v2);
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_enableCriticalReliability != v3)
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      char v13 = v6;
      _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Setting pending set push critical state to: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v9 = @"NO";
      if (v3) {
        uint64_t v9 = @"YES";
      }
      int v11 = v9;
      _IDSLogV();
    }
    v4->_enableCriticalReliability = v3;
    if (v3) {
      objc_msgSend__setReliabilityTimeoutInterval(v4, v7, v8);
    }
    else {
      objc_msgSend__clearReliabilityTimeoutInterval(v4, v7, v8);
    }
    objc_msgSend__reallySetCriticalReliability_(v4, v10, v3, v11);
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reliabilityAttemptTimer, 0);

  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end