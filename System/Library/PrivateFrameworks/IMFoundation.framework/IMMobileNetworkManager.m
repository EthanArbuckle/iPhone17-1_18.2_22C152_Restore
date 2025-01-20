@interface IMMobileNetworkManager
+ (id)sharedInstance;
- (BOOL)_isDataConnectionAvailable;
- (BOOL)_legacy_inValidSIMState;
- (BOOL)autoAssociateCellular;
- (BOOL)autoAssociateWiFi;
- (BOOL)dataConnectionExists;
- (BOOL)disableFastDormancy;
- (BOOL)has2GDataConnection;
- (BOOL)hasLTEDataConnection;
- (BOOL)inValidSIMState;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isDataConnectionActive;
- (BOOL)isDataContextActive;
- (BOOL)isDataContextUsable;
- (BOOL)isDataIndicatorNone;
- (BOOL)isDataPossible;
- (BOOL)isDataSwitchEnabled;
- (BOOL)isHostingWiFiHotSpot;
- (BOOL)isSIMLocked;
- (BOOL)isSIMRemoved;
- (BOOL)isWiFiAssociated;
- (BOOL)isWiFiCaptive;
- (BOOL)isWiFiEnabled;
- (BOOL)isWiFiUsable;
- (BOOL)registered;
- (BOOL)requiresSIMInserted;
- (BOOL)shouldBringUpDataContext;
- (BOOL)willTryToAutoAssociateWiFiNetwork;
- (BOOL)willTryToSearchForWiFiNetwork;
- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync;
- (CoreTelephonyClient)_coreTelephonyClient;
- (IMMobileNetworkManager)init;
- (NSMutableSet)cellularAutoAssociationTokens;
- (NSNumber)wiFiScaledRSSI;
- (NSNumber)wiFiScaledRate;
- (NSNumber)wiFiSignalStrength;
- (NSRecursiveLock)lock;
- (RadiosPreferences)_radiosPreferences;
- (__CTServerConnection)_ctServerConnection;
- (id)_dataCTXPCServiceSubscriptionContext;
- (id)_telephonyDataSIMStatus;
- (int)_getCurrentCTDataStatus;
- (void)_adjustCellularAutoAssociation;
- (void)_cellAssertion;
- (void)_createCTServerConnection;
- (void)_initializeDataState;
- (void)_lockedAdjustCellularAutoAssociation;
- (void)_locked_recalculateDataContextUsableAndPostNotificationIfNeeded:(BOOL)a3;
- (void)_locked_updateDataConnectionStateWithContext:(id)a3;
- (void)_locked_updateDataStateBasedOnDataConnectionStatus:(id)a3;
- (void)_locked_updateDataStateBasedOnDataStatus:(id)a3;
- (void)_locked_updateDataStateWithContext:(id)a3;
- (void)_makeDataConnectionAvailable:(BOOL)a3;
- (void)_releaseCTServerConnection;
- (void)addCellularAutoAssociationClientToken:(id)a3;
- (void)addFastDormancyDisableToken:(id)a3;
- (void)addWiFiAutoAssociationClientToken:(id)a3;
- (void)airplaneModeChanged;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)internetConnectionActivationError:(int)a3;
- (void)internetConnectionStateChanged:(id)a3;
- (void)internetDataStatusBasic:(id)a3;
- (void)removeCellularAutoAssociationClientToken:(id)a3;
- (void)removeFastDormancyDisableToken:(id)a3;
- (void)removeWiFiAutoAssociationClientToken:(id)a3;
- (void)setCellularAutoAssociationTokens:(id)a3;
- (void)setDataConnectionActive:(BOOL)a3;
- (void)setIsDataContextActive:(BOOL)a3;
- (void)setIsDataContextUsable:(BOOL)a3;
- (void)setIsDataIndicatorNone:(BOOL)a3;
- (void)setIsDataPossible:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setShouldBringUpDataContext:(BOOL)a3;
- (void)set_cellAssertion:(void *)a3;
- (void)set_coreTelephonyClient:(id)a3;
- (void)set_ctServerConnection:(__CTServerConnection *)a3;
- (void)set_radiosPreferences:(id)a3;
- (void)showNetworkOptions;
- (void)showSIMUnlock;
@end

@implementation IMMobileNetworkManager

- (void)_initializeDataState
{
  v8 = objc_msgSend__dataCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  if (v8)
  {
    objc_msgSend_lock(self->_lock, v5, v6, v7);
    objc_msgSend__locked_updateDataStateWithContext_(self, v9, (uint64_t)v8, v10);
    objc_msgSend__locked_updateDataConnectionStateWithContext_(self, v11, (uint64_t)v8, v12);
    objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v13, 0, v14);
    objc_msgSend_unlock(self->_lock, v15, v16, v17);
  }
  else
  {
    v18 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_191892000, v18, OS_LOG_TYPE_DEFAULT, "Failed to initialize data state due to nil subscription context", v19, 2u);
    }
  }
}

- (void)_locked_updateDataStateBasedOnDataStatus:(id)a3
{
  id v4 = a3;
  self->_isDataPossible = objc_msgSend_cellularDataPossible(v4, v5, v6, v7);
  char hasIndicator = objc_msgSend_hasIndicator(v4, v8, v9, v10);

  self->_isDataIndicatorNone = hasIndicator ^ 1;
}

- (id)_dataCTXPCServiceSubscriptionContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_currentDataSubscriptionContextSync)
  {
    id v4 = 0;
  }
  else
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v11 = 0;
    objc_msgSend_getCurrentDataSubscriptionContextSync_(coreTelephonyClient, a2, (uint64_t)&v11, v2);
    uint64_t v6 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();
    id v4 = v11;
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
    self->_currentDataSubscriptionContextSync = v6;

    if (!self->_currentDataSubscriptionContextSync)
    {
      v8 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find relevant telephony subscription context { contextError: %@ }", buf, 0xCu);
      }
    }
  }
  uint64_t v9 = self->_currentDataSubscriptionContextSync;

  return v9;
}

- (void)_createCTServerConnection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_coreTelephonyClient)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F23A80]);
    uint64_t v6 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v3, v4, MEMORY[0x1E4F14428], v5);
    coreTelephonyClient = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v6;

    objc_msgSend_setDelegate_(self->_coreTelephonyClient, v8, (uint64_t)self, v9);
    *(_WORD *)&self->_registered = 257;
    objc_msgSend__initializeDataState(self, v10, v11, v12);
  }
  if (!self->_ctServerConnection)
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    _CTServerConnectionSetTargetQueue();
  }
  if (!self->_coreTelephonyClient || !self->_ctServerConnection)
  {
    id v13 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_coreTelephonyClient;
      ctServerConnection = self->_ctServerConnection;
      LODWORD(v16[0]) = 138412546;
      *(void *)((char *)v16 + 4) = v14;
      WORD6(v16[0]) = 2112;
      *(void *)((char *)v16 + 14) = ctServerConnection;
      _os_log_impl(&dword_191892000, v13, OS_LOG_TYPE_DEFAULT, "Failed to create connection(s) to CoreTelephony! { _coreTelephonyClient: %@, _ctServerConnection: %@ }", (uint8_t *)v16, 0x16u);
    }
  }
}

- (IMMobileNetworkManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMMobileNetworkManager;
  uint64_t v2 = [(IMMobileNetworkManager *)&v13 init];
  if (v2)
  {
    id v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = (RadiosPreferences *)objc_alloc_init((Class)IMWeakLinkClass());
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v5;

    objc_msgSend_setDelegate_(v2->_radiosPreferences, v7, (uint64_t)v2, v8);
    objc_msgSend__createCTServerConnection(v2, v9, v10, v11);
  }
  return v2;
}

- (void)_locked_updateDataStateWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  id v16 = 0;
  uint64_t v7 = objc_msgSend_getDataStatus_error_(coreTelephonyClient, v6, (uint64_t)v4, (uint64_t)&v16);
  id v11 = v16;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_copyBasic(v7, v8, v9, v10);
    objc_msgSend__locked_updateDataStateBasedOnDataStatus_(self, v13, (uint64_t)v12, v14);
  }
  else
  {
    v15 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_191892000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query initial data status from telephony { dataError: %@, context: %@ }", buf, 0x16u);
    }
  }
}

- (void)_locked_updateDataConnectionStateWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  id v12 = 0;
  uint64_t v7 = objc_msgSend_getConnectionState_connectionType_error_(coreTelephonyClient, v6, (uint64_t)v4, 0, &v12);
  id v10 = v12;
  if (v7)
  {
    objc_msgSend__locked_updateDataStateBasedOnDataConnectionStatus_(self, v8, (uint64_t)v7, v9);
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "Failed to query initial data connection status from telephony { connectionError: %@, context: %@ }", buf, 0x16u);
    }
  }
}

- (void)_locked_recalculateDataContextUsableAndPostNotificationIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v5 = !self->_isDataIndicatorNone && self->_isDataContextActive && self->_isDataPossible;
  uint64_t v6 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataPossible) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    int v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "   Data context is attached: %@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v8 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataContextActive) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    int v23 = 138412290;
    v24 = v9;
    _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "   Data context is active: %@", (uint8_t *)&v23, 0xCu);
  }

  id v10 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataIndicatorNone) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    int v23 = 138412290;
    v24 = v11;
    _os_log_impl(&dword_191892000, v10, OS_LOG_TYPE_DEFAULT, "   Data indicator is none: %@", (uint8_t *)&v23, 0xCu);
  }

  id v12 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataContextUsable) {
      objc_super v13 = @"YES";
    }
    else {
      objc_super v13 = @"NO";
    }
    int v23 = 138412290;
    v24 = v13;
    _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_DEFAULT, "   Data context is usable (previous): %@", (uint8_t *)&v23, 0xCu);
  }

  id v14 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = @"NO";
    if (v5) {
      __int16 v15 = @"YES";
    }
    int v23 = 138412290;
    v24 = v15;
    _os_log_impl(&dword_191892000, v14, OS_LOG_TYPE_DEFAULT, "   Data context is usable (new): %@", (uint8_t *)&v23, 0xCu);
  }

  if (self->_isDataContextUsable != v5)
  {
    self->_isDataContextUsable = v5;
    if (v3)
    {
      id v16 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = @"NO";
        if (v5) {
          uint64_t v17 = @"YES";
        }
        int v23 = 138412546;
        v24 = @"__kIMMobileNetworkManagerDataStatusChangedNotification";
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_DEFAULT, "    => Posting data status changed notification { notification: %@, dataContextUsable: %@ }", (uint8_t *)&v23, 0x16u);
      }

      uint64_t v21 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v18, v19, v20);
      objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, @"__kIMMobileNetworkManagerDataStatusChangedNotification", 0);
    }
  }
}

- (void)_locked_updateDataStateBasedOnDataConnectionStatus:(id)a3
{
  self->_isDataContextActive = objc_msgSend_state(a3, a2, (uint64_t)a3, v3) == 2;
}

+ (id)sharedInstance
{
  if (qword_1EB273CF0 != -1) {
    dispatch_once(&qword_1EB273CF0, &unk_1EE22FC78);
  }
  uint64_t v2 = (void *)qword_1EB273C50;
  return v2;
}

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->_radiosPreferences, a2, 0, v2);
  cellAssertion = self->_cellAssertion;
  if (cellAssertion)
  {
    CFRelease(cellAssertion);
    self->_cellAssertion = 0;
  }
  objc_msgSend__releaseCTServerConnection(self, v4, v5, v6);
  objc_msgSend_lock(self->_lock, v8, v9, v10);
  objc_msgSend_removeAllObjects(self->_cellAutoAssociationTokens, v11, v12, v13);
  objc_msgSend__adjustCellularAutoAssociation(self, v14, v15, v16);
  objc_msgSend_unlock(self->_lock, v17, v18, v19);
  v20.receiver = self;
  v20.super_class = (Class)IMMobileNetworkManager;
  [(IMMobileNetworkManager *)&v20 dealloc];
}

- (void)airplaneModeChanged
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, @"__kIMMobileNetworkManagerAirplaneModeChangedNotification", 0);
}

- (BOOL)isAirplaneModeEnabled
{
  return ((uint64_t (*)(RadiosPreferences *, char *))MEMORY[0x1F4181798])(self->_radiosPreferences, sel_airplaneMode);
}

- (void)_adjustCellularAutoAssociation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_autoAssociateCellular(self, a2, v2, v3))
  {
    objc_msgSend_setDataConnectionActive_(self, v5, 1, v6);
    if (!self->_cellAssertion)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
        int v12 = 138412290;
        uint64_t v13 = cellAutoAssociationTokens;
        _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "Interface manager: enabling cell assertion (client tokens: %@)", (uint8_t *)&v12, 0xCu);
      }

      _CTServerConnectionPacketContextAssertionCreate();
    }
  }
  else if (self->_cellAssertion)
  {
    uint64_t v9 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_cellAutoAssociationTokens;
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "Interface manager: disabling cell assertion (client tokens: %@)", (uint8_t *)&v12, 0xCu);
    }

    cellAssertion = self->_cellAssertion;
    if (cellAssertion)
    {
      CFRelease(cellAssertion);
      self->_cellAssertion = 0;
    }
  }
}

- (void)_lockedAdjustCellularAutoAssociation
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__adjustCellularAutoAssociation(self, v5, v6, v7);
  lock = self->_lock;
  objc_msgSend_unlock(lock, v8, v9, v10);
}

- (BOOL)disableFastDormancy
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E20], a2, v2, v3);
  char v8 = objc_msgSend_disableFastDormancy(v4, v5, v6, v7);

  return v8;
}

- (void)addFastDormancyDisableToken:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F59E20];
  id v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addFastDormancyDisableToken_(v10, v8, (uint64_t)v4, v9);
}

- (void)removeFastDormancyDisableToken:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F59E20];
  id v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFastDormancyDisableToken_(v10, v8, (uint64_t)v4, v9);
}

- (BOOL)isHostingWiFiHotSpot
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v4, v5, v6, v7);

  return isHostingWiFiHotSpot;
}

- (BOOL)willTryToAutoAssociateWiFiNetwork
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v4, v5, v6, v7);

  return v8;
}

- (BOOL)willTryToSearchForWiFiNetwork
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_willTryToSearchForWiFiNetwork(v4, v5, v6, v7);

  return v8;
}

- (NSNumber)wiFiSignalStrength
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_wiFiSignalStrength(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (NSNumber)wiFiScaledRSSI
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_wiFiScaledRSSI(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (NSNumber)wiFiScaledRate
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_wiFiScaledRate(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (BOOL)isWiFiUsable
{
  int isWiFiEnabled = objc_msgSend_isWiFiEnabled(self, a2, v2, v3);
  int isWiFiAssociated = objc_msgSend_isWiFiAssociated(self, v6, v7, v8);
  int v13 = isWiFiAssociated & (objc_msgSend_isWiFiCaptive(self, v10, v11, v12) ^ 1);
  if (isWiFiEnabled) {
    return v13;
  }
  else {
    return 0;
  }
}

- (BOOL)isWiFiAssociated
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char isWiFiAssociated = objc_msgSend_isWiFiAssociated(v4, v5, v6, v7);

  return isWiFiAssociated;
}

- (BOOL)isWiFiEnabled
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char isWiFiEnabled = objc_msgSend_isWiFiEnabled(v4, v5, v6, v7);

  return isWiFiEnabled;
}

- (BOOL)isWiFiCaptive
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char isWiFiCaptive = objc_msgSend_isWiFiCaptive(v4, v5, v6, v7);

  return isWiFiCaptive;
}

- (BOOL)autoAssociateWiFi
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  char v8 = objc_msgSend_autoAssociateWiFi(v4, v5, v6, v7);

  return v8;
}

- (void)addWiFiAutoAssociationClientToken:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F59E38];
  id v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addWiFiAutoAssociationClientToken_(v10, v8, (uint64_t)v4, v9);
}

- (void)removeWiFiAutoAssociationClientToken:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F59E38];
  id v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeWiFiAutoAssociationClientToken_(v10, v8, (uint64_t)v4, v9);
}

- (void)showNetworkOptions
{
  objc_msgSend_sharedInstance(MEMORY[0x1E4F59E38], a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_showNetworkOptions(v7, v4, v5, v6);
}

- (BOOL)autoAssociateCellular
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  BOOL v8 = objc_msgSend_count(self->_cellAutoAssociationTokens, v5, v6, v7) != 0;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (void)addCellularAutoAssociationClientToken:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    objc_msgSend_lock(self->_lock, v4, v5, v6);
    cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
    if (!cellAutoAssociationTokens)
    {
      uint64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v12 = self->_cellAutoAssociationTokens;
      self->_cellAutoAssociationTokens = v11;

      cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
    }
    objc_msgSend_addObject_(cellAutoAssociationTokens, v8, (uint64_t)v7, v9);
    objc_msgSend_unlock(self->_lock, v13, v14, v15);
    uint64_t v16 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = self->_cellAutoAssociationTokens;
      int v21 = 138412546;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_DEFAULT, "Client token: %@ being added to Cellular association clients (%@)", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend__lockedAdjustCellularAutoAssociation(self, v18, v19, v20);
  }
}

- (void)removeCellularAutoAssociationClientToken:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
      int v18 = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      int v21 = cellAutoAssociationTokens;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %@ being removed to cellular association clients (%@)", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend_lock(self->_lock, v7, v8, v9);
    objc_msgSend_removeObject_(self->_cellAutoAssociationTokens, v10, (uint64_t)v4, v11);
    objc_msgSend_unlock(self->_lock, v12, v13, v14);
    objc_msgSend__lockedAdjustCellularAutoAssociation(self, v15, v16, v17);
  }
}

- (void)internetConnectionActivationError:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a3;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony connection activation error callback { error: %d }", (uint8_t *)v13, 8u);
  }

  uint64_t v6 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "Failed to bring up data context", (uint8_t *)v13, 2u);
  }

  objc_msgSend_lock(self->_lock, v7, v8, v9);
  self->_shouldBringUpDataContext = 0;
  objc_msgSend_unlock(self->_lock, v10, v11, v12);
}

- (void)internetConnectionStateChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony connection state changed callback { dataConnectionStatusInfo: %@ }", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_lock(self->_lock, v6, v7, v8);
  self->_shouldBringUpDataContext = 1;
  objc_msgSend__locked_updateDataStateBasedOnDataConnectionStatus_(self, v9, (uint64_t)v4, v10);
  objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v11, 1, v12);
  objc_msgSend_unlock(self->_lock, v13, v14, v15);
}

- (void)internetDataStatusBasic:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony internetDataStatus callback { dataStatus: %@ }", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_lock(self->_lock, v6, v7, v8);
  self->_shouldBringUpDataContext = 1;
  objc_msgSend__locked_updateDataStateBasedOnDataStatus_(self, v9, (uint64_t)v4, v10);
  objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v11, 1, v12);
  objc_msgSend_unlock(self->_lock, v13, v14, v15);
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self->_lock, v5, v6, v7);
  uint64_t v8 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
    int v18 = 138412546;
    id v19 = currentDataSubscriptionContextSync;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: updating currentDataSimContext. {old: %@; new: %@}",
      (uint8_t *)&v18,
      0x16u);
  }

  uint64_t v13 = (CTXPCServiceSubscriptionContext *)objc_msgSend_copy(v4, v10, v11, v12);
  uint64_t v14 = self->_currentDataSubscriptionContextSync;
  self->_currentDataSubscriptionContextSync = v13;

  objc_msgSend_unlock(self->_lock, v15, v16, v17);
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
  if (!currentDataSubscriptionContextSync)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v22 = 0;
    uint64_t v9 = objc_msgSend_getCurrentDataSubscriptionContextSync_(coreTelephonyClient, v5, (uint64_t)&v22, v6);
    id v10 = v22;
    uint64_t v14 = (CTXPCServiceSubscriptionContext *)objc_msgSend_copy(v9, v11, v12, v13);
    uint64_t v15 = self->_currentDataSubscriptionContextSync;
    self->_currentDataSubscriptionContextSync = v14;

    if (!self->_currentDataSubscriptionContextSync)
    {
      uint64_t v16 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't get the current context: %@", buf, 0xCu);
      }
    }
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
  }
  uint64_t v17 = currentDataSubscriptionContextSync;
  objc_msgSend_unlock(self->_lock, v18, v19, v20);
  return v17;
}

- (void)_releaseCTServerConnection
{
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = 0;

  if (self->_registered) {
    *(_WORD *)&self->_registered = 0;
  }
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    self->_ctServerConnection = 0;
    CFRelease(ctServerConnection);
  }
}

- (BOOL)_isDataConnectionAvailable
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!IMPCDoesInterfaceExist()) {
    return 1;
  }
  if (!self->_registered) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_currentDataSubscriptionContextSync(self, v3, v4, v5);
  if (!v7)
  {
    BOOL v15 = 0;
    int v28 = 1;
    goto LABEL_22;
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  id v32 = 0;
  uint64_t v9 = objc_msgSend_getConnectionState_connectionType_error_(coreTelephonyClient, v6, (uint64_t)v7, 0, &v32);
  uint64_t v13 = (__CFString *)v32;
  if (v9)
  {
    int v14 = objc_msgSend_state(v9, v10, v11, v12);
    BOOL v15 = v14 == 2;
    uint64_t v16 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = @"NO";
      if (v14 == 2) {
        uint64_t v17 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_DEFAULT, "Data context active: %@", buf, 0xCu);
    }

    int v18 = self->_coreTelephonyClient;
    id v31 = 0;
    uint64_t v20 = objc_msgSend_getDataStatus_error_(v18, v19, (uint64_t)v7, (uint64_t)&v31);
    id v21 = v31;
    int v25 = objc_msgSend_indicator(v20, v22, v23, v24);

    if (v25)
    {
      v26 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = @"NO";
        if (v14 == 2) {
          uint64_t v27 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_191892000, v26, OS_LOG_TYPE_DEFAULT, "Connection available: %@", buf, 0xCu);
      }

      int v28 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v29 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_impl(&dword_191892000, v29, OS_LOG_TYPE_DEFAULT, "Couldn't get the connection state: %@", buf, 0xCu);
    }

    id v21 = 0;
    BOOL v15 = 0;
  }
  int v28 = 1;
LABEL_21:

LABEL_22:
  if (v28) {
    return 0;
  }
  return v15;
}

- (int)_getCurrentCTDataStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_currentDataSubscriptionContextSync(self, a2, v2, v3);
  if (v6)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v16 = 0;
    uint64_t v8 = objc_msgSend_getDataStatus_error_(coreTelephonyClient, v5, (uint64_t)v6, (uint64_t)&v16);
    id v9 = v16;
    int v13 = objc_msgSend_indicator(v8, v10, v11, v12);

    if (v9)
    {
      int v14 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_191892000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't get the data status: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (void)_makeDataConnectionAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (IMPCDoesInterfaceExist() && self->_registered)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Forcing data connection available: %@", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v7 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldBringUpDataContext) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      int v20 = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "    ShouldBringUpDataContext: %@", (uint8_t *)&v20, 0xCu);
    }

    id v9 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isDataContextUsable) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      int v20 = 138412290;
      id v21 = v10;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "    DataContextUsable: %@", (uint8_t *)&v20, 0xCu);
    }

    if (self->_isDataContextUsable == v3)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "Data connection is already active", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      uint64_t v12 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_DEFAULT, "Making cellular data connection active", (uint8_t *)&v20, 2u);
      }

      uint64_t v17 = objc_msgSend__dataCTXPCServiceSubscriptionContext(self, v13, v14, v15);
      if (v17)
      {
        id v18 = objc_msgSend_setPacketContextActiveByServiceType_connectionType_active_(self->_coreTelephonyClient, v16, (uint64_t)v17, 0, v3);
        if (v18)
        {
          uint64_t v19 = OSLogHandleForIDSCategory("Network");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 138412290;
            id v21 = v18;
            _os_log_impl(&dword_191892000, v19, OS_LOG_TYPE_DEFAULT, "Failed to make cellular data connection active { error: %@ }", (uint8_t *)&v20, 0xCu);
          }
        }
      }
      else
      {
        id v18 = OSLogHandleForIDSCategory("Network");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_191892000, v18, OS_LOG_TYPE_DEFAULT, "Failed to make cellular data connection active due to nil subscription context", (uint8_t *)&v20, 2u);
        }
      }
    }
  }
}

- (BOOL)requiresSIMInserted
{
  *(void *)&v8[5] = *MEMORY[0x1E4F143B8];
  if (self->_ctServerConnection)
  {
    unint64_t IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
    int v3 = IsUserIdentityModuleRequired;
    unint64_t v4 = HIDWORD(IsUserIdentityModuleRequired);
    if (HIDWORD(IsUserIdentityModuleRequired))
    {
      uint64_t v5 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v8[0] = v3;
        LOWORD(v8[1]) = 1024;
        *(_DWORD *)((char *)&v8[1] + 2) = v4;
        _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired failed with error: (%i, %i).", buf, 0xEu);
      }
    }
    else
    {
      uint64_t v5 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v8 = @"NO";
        _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired returned: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired failed, missing _ctServerConnection", buf, 2u);
    }
  }

  return 0;
}

- (BOOL)isSIMRemoved
{
  unint64_t v4 = objc_msgSend__telephonyDataSIMStatus(self, a2, v2, v3);
  uint64_t v7 = v4;
  if (v4) {
    char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E4F241F0], v6);
  }
  else {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (BOOL)isSIMLocked
{
  unint64_t v4 = objc_msgSend__telephonyDataSIMStatus(self, a2, v2, v3);
  uint64_t v7 = v4;
  if (v4) {
    char isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E4F241F8], v6);
  }
  else {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (id)_telephonyDataSIMStatus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend__dataCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  if (v6)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v13 = 0;
    uint64_t v8 = objc_msgSend_getSIMStatus_error_(coreTelephonyClient, v5, (uint64_t)v6, (uint64_t)&v13);
    id v9 = v13;
    if (!v8)
    {
      id v10 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        _os_log_impl(&dword_191892000, v10, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status { error: %@, context: %@ }", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status due to nil subscription context", buf, 2u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)showSIMUnlock
{
  if (objc_msgSend_isSIMLocked(self, a2, v2, v3))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PhoneSettingsPromptForSIMUnlockNotification", 0, 0, 1u);
  }
}

- (BOOL)inValidSIMState
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_isSIMRemoved(self, a2, v2, v3))
  {
    uint64_t v11 = objc_msgSend__dataCTXPCServiceSubscriptionContext(self, v5, v6, v7);
    if (v11)
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      id v22 = 0;
      char isPhoneNumberCredentialValid_outError = objc_msgSend_isPhoneNumberCredentialValid_outError_(coreTelephonyClient, v10, (uint64_t)v11, (uint64_t)&v22);
      id v13 = v22;
      if (!v13)
      {
        if ((isPhoneNumberCredentialValid_outError & 1) == 0)
        {
          id v21 = OSLogHandleForIDSCategory("Network");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_191892000, v21, OS_LOG_TYPE_DEFAULT, "   => CT reports phone credentials are not valid for data subscription context", buf, 2u);
          }
        }
        goto LABEL_14;
      }
      uint64_t v14 = v13;
      id v15 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_191892000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query phone number credential validity for data subscription context { error: %@, context: %@ }", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v19 = OSLogHandleForIDSCategory("Network");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v19, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status due to nil subscription context", buf, 2u);
      }
    }
    char isPhoneNumberCredentialValid_outError = objc_msgSend__legacy_inValidSIMState(self, v16, v17, v18);
LABEL_14:

    return isPhoneNumberCredentialValid_outError;
  }
  uint64_t v8 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "   => CT reports SIM is removed -- assuming credential is valid", buf, 2u);
  }

  return 1;
}

- (BOOL)_legacy_inValidSIMState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_ctServerConnection)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Failed to query whether phone number credential is valid due to missing CT server connection", buf, 2u);
    }
    goto LABEL_5;
  }
  uint64_t IsPhoneNumberCredentialValid = _CTServerConnectionIsPhoneNumberCredentialValid();
  if (IsPhoneNumberCredentialValid)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v7 = IsPhoneNumberCredentialValid;
      __int16 v8 = 1024;
      int v9 = HIDWORD(IsPhoneNumberCredentialValid);
      _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Error querying device user identity module { error: (%d:%d) }", buf, 0xEu);
    }
LABEL_5:

    return 1;
  }
  uint64_t v5 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "   => CT reports phone credentials are not valid", buf, 2u);
  }

  return 0;
}

- (BOOL)dataConnectionExists
{
  return IMPCDoesInterfaceExist();
}

- (BOOL)has2GDataConnection
{
  return objc_msgSend__getCurrentCTDataStatus(self, a2, v2, v3) - 1 < 2;
}

- (BOOL)hasLTEDataConnection
{
  return objc_msgSend__getCurrentCTDataStatus(self, a2, v2, v3) - 7 < 6;
}

- (BOOL)isDataSwitchEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_ctServerConnection)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionGetCellularDataIsEnabled failed, missing _ctServerConnection", buf, 2u);
    }
    goto LABEL_8;
  }
  unint64_t IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  int v3 = IsEnabled;
  unint64_t v4 = HIDWORD(IsEnabled);
  if (HIDWORD(IsEnabled))
  {
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v8 = v3;
      __int16 v9 = 1024;
      int v10 = v4;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionGetCellularDataIsEnabled failed with error: (%i, %i).", buf, 0xEu);
    }
LABEL_8:

    return 0;
  }
  return 0;
}

- (BOOL)isDataConnectionActive
{
  if (!IMPCDoesInterfaceExist()) {
    return 1;
  }
  return MEMORY[0x1F4181798](self, sel__isDataConnectionAvailable, v3, v4);
}

- (void)setDataConnectionActive:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_registered)
  {
    BOOL v3 = a3;
    uint64_t v5 = OSLogHandleForIDSCategory("Network");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "SetDataConnectionActive: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend__makeDataConnectionAvailable_(self, v7, v3, v8);
  }
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableSet)cellularAutoAssociationTokens
{
  return self->_cellAutoAssociationTokens;
}

- (void)setCellularAutoAssociationTokens:(id)a3
{
}

- (RadiosPreferences)_radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)set_radiosPreferences:(id)a3
{
}

- (__CTServerConnection)_ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)set_ctServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (void)_cellAssertion
{
  return self->_cellAssertion;
}

- (void)set_cellAssertion:(void *)a3
{
  self->_cellAssertion = a3;
}

- (CoreTelephonyClient)_coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)set_coreTelephonyClient:(id)a3
{
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)shouldBringUpDataContext
{
  return self->_shouldBringUpDataContext;
}

- (void)setShouldBringUpDataContext:(BOOL)a3
{
  self->_shouldBringUpDataContext = a3;
}

- (BOOL)isDataPossible
{
  return self->_isDataPossible;
}

- (void)setIsDataPossible:(BOOL)a3
{
  self->_isDataPossible = a3;
}

- (BOOL)isDataContextActive
{
  return self->_isDataContextActive;
}

- (void)setIsDataContextActive:(BOOL)a3
{
  self->_isDataContextActive = a3;
}

- (BOOL)isDataIndicatorNone
{
  return self->_isDataIndicatorNone;
}

- (void)setIsDataIndicatorNone:(BOOL)a3
{
  self->_isDataIndicatorNone = a3;
}

- (BOOL)isDataContextUsable
{
  return self->_isDataContextUsable;
}

- (void)setIsDataContextUsable:(BOOL)a3
{
  self->_isDataContextUsable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSubscriptionContextSync, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_cellAutoAssociationTokens, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end