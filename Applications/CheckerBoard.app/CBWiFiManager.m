@interface CBWiFiManager
+ (CBWiFiManager)sharedInstance;
- (BOOL)attemptingToAssociateToCurrentNetworkByIndex:(int64_t)a3;
- (BOOL)attemptsNetworkReconnect;
- (BOOL)isAssociatedToNetwork;
- (BOOL)isWiFiPoweredOn;
- (BOOL)reconnecting;
- (BOOL)scanning;
- (CBWiFiManager)init;
- (CBWiFiNetworkInfo)lastGoodNetwork;
- (CBWiFiNetworkInfo)pendingLastGoodNetwork;
- (CWFInterface)cwInterface;
- (NSMutableArray)filteredWiFiScanResults;
- (NSMutableArray)previousScanFilteredWiFiScanResults;
- (NSMutableSet)wifiScanRequestors;
- (NSString)currentNetworkSSID;
- (NSTimer)reconnectTimer;
- (NSTimer)scanTimer;
- (OS_dispatch_semaphore)networkScanSemaphore;
- (id)_associationParametersFromScanResult:(id)a3 withPassword:(id)a4;
- (id)scanParametersWithSSID:(id)a3 isHidden:(BOOL)a4;
- (int)signalStrengthBars;
- (int)signalStrengthRSSI;
- (void)_associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5;
- (void)_associateToHiddenUnencryptedNetwork:(id)a3;
- (void)_associateToNetworkWithScanResult:(id)a3;
- (void)_associateToUnencryptedNetwork:(id)a3;
- (void)_attemptReconnect;
- (void)_deregisterWiFiNotifications;
- (void)_forceWiFiOnIfNecessary;
- (void)_handleCWInterfaceEvent:(id)a3;
- (void)_performDirectedScanIncludingHidden:(BOOL)a3 AndAssociateToNetworkWithName:(id)a4 password:(id)a5;
- (void)_postDidAssociateToEncryptedNetworkNotificationWithError:(id)a3;
- (void)_postDidAssociateToOpenNetworkNotificationWithError:(id)a3;
- (void)_powerStateDidChange;
- (void)_registerWiFiNotifications;
- (void)_resolveReconnectingStatus;
- (void)_restartWiFiNetworkScan;
- (void)_savePendingInfoWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5;
- (void)_setTimeForNextScan:(double)a3;
- (void)_sortWiFiScanResultsAlphabetically:(id)a3;
- (void)_startWiFiNetworkScan;
- (void)_stopWiFiNetworkScan;
- (void)_updateForAssociationChange;
- (void)_updateSignalStrength;
- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4;
- (void)_wifiScanCompleted:(id)a3;
- (void)associateToEncryptedNetworkWithName:(id)a3 password:(id)a4;
- (void)associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4;
- (void)associateToHiddenEncryptedNetworkWithName:(id)a3 password:(id)a4;
- (void)associateToHiddenUnencryptedNetworkWithName:(id)a3;
- (void)associateToNetworkByIndex:(int64_t)a3;
- (void)dealloc;
- (void)setAttemptsNetworkReconnect:(BOOL)a3;
- (void)setCwInterface:(id)a3;
- (void)setFilteredWiFiScanResults:(id)a3;
- (void)setLastGoodNetwork:(id)a3;
- (void)setNetworkReconnectEnabled:(BOOL)a3;
- (void)setNetworkScanSemaphore:(id)a3;
- (void)setPendingLastGoodNetwork:(id)a3;
- (void)setPowered:(BOOL)a3;
- (void)setPreviousScanFilteredWiFiScanResults:(id)a3;
- (void)setReconnectTimer:(id)a3;
- (void)setReconnecting:(BOOL)a3;
- (void)setScanTimer:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setSignalStrengthBars:(int)a3;
- (void)setSignalStrengthRSSI:(int)a3;
- (void)setWifiPoweredOn:(BOOL)a3;
- (void)setWifiScanRequestors:(id)a3;
- (void)startWiFiNetworkScanRequestFrom:(id)a3;
- (void)stopWiFiNetworkScanRequestFrom:(id)a3;
- (void)updateWiFiState;
@end

@implementation CBWiFiManager

+ (CBWiFiManager)sharedInstance
{
  if (qword_10008FE98 != -1) {
    dispatch_once(&qword_10008FE98, &stru_10007A150);
  }
  v2 = (void *)qword_10008FE90;

  return (CBWiFiManager *)v2;
}

- (CBWiFiManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)CBWiFiManager;
  v2 = [(CBWiFiManager *)&v14 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up Wi-Fi manager…", v13, 2u);
    }

    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    wifiScanRequestors = v2->_wifiScanRequestors;
    v2->_wifiScanRequestors = v4;

    v2->_reconnecting = 0;
    lastGoodNetwork = v2->_lastGoodNetwork;
    v2->_lastGoodNetwork = 0;

    pendingLastGoodNetwork = v2->_pendingLastGoodNetwork;
    v2->_pendingLastGoodNetwork = 0;

    v2->_networkReconnectEnabled = 1;
    v8 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    cwInterface = v2->_cwInterface;
    v2->_cwInterface = v8;

    [(CWFInterface *)v2->_cwInterface activate];
    [(CBWiFiManager *)v2 _registerWiFiNotifications];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    networkScanSemaphore = v2->_networkScanSemaphore;
    v2->_networkScanSemaphore = (OS_dispatch_semaphore *)v10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  [(CBWiFiManager *)self _stopWiFiNetworkScan];
  [(CBWiFiManager *)self _deregisterWiFiNotifications];
  v4 = [(CBWiFiManager *)self cwInterface];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)CBWiFiManager;
  [(CBWiFiManager *)&v5 dealloc];
}

- (void)_deregisterWiFiNotifications
{
  v3 = [(CBWiFiManager *)self cwInterface];

  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deregistering Wi-Fi notifications…", v6, 2u);
    }

    objc_super v5 = [(CBWiFiManager *)self cwInterface];
    [v5 stopMonitoringAllEvents];
  }
}

- (void)_registerWiFiNotifications
{
  v3 = [(CBWiFiManager *)self cwInterface];

  if (v3)
  {
    objc_initWeak(&location, self);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000289E8;
    v34[3] = &unk_10007A178;
    objc_copyWeak(&v35, &location);
    v4 = [(CBWiFiManager *)self cwInterface];
    [v4 setEventHandler:v34];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100028A44;
    v32[3] = &unk_100079608;
    objc_copyWeak(&v33, &location);
    objc_super v5 = [(CBWiFiManager *)self cwInterface];
    [v5 setInvalidationHandler:v32];

    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registering for Wi-Fi notifications…", buf, 2u);
    }

    v7 = [(CBWiFiManager *)self cwInterface];
    id v30 = 0;
    [v7 startMonitoringEventType:10 error:&v30];
    id v8 = v30;

    v9 = [(CBWiFiManager *)self cwInterface];
    id v29 = v8;
    [v9 startMonitoringEventType:11 error:&v29];
    id v10 = v29;

    v11 = [(CBWiFiManager *)self cwInterface];
    id v28 = v10;
    [v11 startMonitoringEventType:18 error:&v28];
    id v12 = v28;

    v13 = [(CBWiFiManager *)self cwInterface];
    id v27 = v12;
    [v13 startMonitoringEventType:24 error:&v27];
    id v14 = v27;

    v15 = [(CBWiFiManager *)self cwInterface];
    id v26 = v14;
    [v15 startMonitoringEventType:1 error:&v26];
    id v16 = v26;

    v17 = [(CBWiFiManager *)self cwInterface];
    id v25 = v16;
    [v17 startMonitoringEventType:6 error:&v25];
    id v18 = v25;

    v19 = [(CBWiFiManager *)self cwInterface];
    id v24 = v18;
    [v19 startMonitoringEventType:7 error:&v24];
    id v20 = v24;

    v21 = [(CBWiFiManager *)self cwInterface];
    id v23 = v20;
    [v21 startMonitoringEventType:2 error:&v23];
    id v22 = v23;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

- (void)_handleCWInterfaceEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  switch((unint64_t)v5)
  {
    case 1uLL:
      v6 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device power callback triggered", (uint8_t *)&v26, 2u);
      }

      [(CBWiFiManager *)self _powerStateDidChange];
      goto LABEL_38;
    case 2uLL:
      id v10 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(CBWiFiManager *)self cwInterface];
        id v12 = [v11 networkName];
        int v26 = 138412290;
        v27[0] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WiFi SSID has changed: %@", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_33;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_9;
    case 6uLL:
      v13 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Extended link changed", (uint8_t *)&v26, 2u);
      }

      v7 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(CBWiFiManager *)self cwInterface];
        v15 = [v14 cachedLinkDownStatus];
        int v26 = 138412290;
        v27[0] = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WiFi link status set to %@", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_18;
    case 7uLL:
      id v16 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Link quality changed", (uint8_t *)&v26, 2u);
      }

      float v17 = 0.0;
      if ([(CBWiFiManager *)self isAssociatedToNetwork])
      {
        id v18 = [(CBWiFiManager *)self cwInterface];

        if (v18)
        {
          v19 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating signal strength…", (uint8_t *)&v26, 2u);
          }

          id v20 = [(CBWiFiManager *)self cwInterface];
          v21 = [v20 currentScanResult];
          id v18 = [v21 RSSI];

          WFScaleRSSI();
          float v17 = v22;
        }
      }
      else
      {
        id v18 = 0;
      }
      id v24 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67109376;
        LODWORD(v27[0]) = v18;
        WORD2(v27[0]) = 2048;
        *(double *)((char *)v27 + 6) = v17;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Raw RSSI %d, Scaled RSSI %f", (uint8_t *)&v26, 0x12u);
      }

      *(float *)&double v25 = v17;
      [(CBWiFiManager *)self _updateSignalStrengthFromRawRSSI:v18 andScaledRSSI:v25];
      goto LABEL_38;
    case 0xAuLL:
      id v10 = CheckerBoardLogHandleForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      LOWORD(v26) = 0;
      id v23 = "WiFi available callback triggered";
      goto LABEL_32;
    case 0xBuLL:
      id v10 = CheckerBoardLogHandleForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      LOWORD(v26) = 0;
      id v23 = "Device attachment callback triggered";
      goto LABEL_32;
    default:
      if (v5 == (id)18)
      {
        id v10 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          id v23 = "Wifi network service changed";
LABEL_32:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 2u);
        }
LABEL_33:

        [(CBWiFiManager *)self updateWiFiState];
      }
      else if (v5 == (id)24)
      {
        v7 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [(CBWiFiManager *)self cwInterface];
          int v26 = 67109120;
          LODWORD(v27[0]) = [v8 reachabilityFlags];
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WiFi Reachability has changes %u", (uint8_t *)&v26, 8u);
        }
LABEL_18:
      }
      else
      {
LABEL_9:
        v9 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 134217984;
          v27[0] = [v4 type];
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unhandled CWFEvent %ld", (uint8_t *)&v26, 0xCu);
        }
      }
LABEL_38:

      return;
  }
}

- (NSString)currentNetworkSSID
{
  v2 = [(CBWiFiManager *)self cwInterface];
  v3 = [v2 currentScanResult];
  id v4 = [v3 networkName];

  return (NSString *)v4;
}

- (void)updateWiFiState
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating Wi-Fi state…", v4, 2u);
  }

  [(CBWiFiManager *)self _updateForAssociationChange];
  [(CBWiFiManager *)self _updateSignalStrength];
}

- (void)_updateForAssociationChange
{
  if ([(CBWiFiManager *)self isAssociatedToNetwork])
  {
    if ([(CBWiFiManager *)self reconnecting])
    {
      [(CBWiFiManager *)self _resolveReconnectingStatus];
    }
    else
    {
      uint64_t v10 = [(CBWiFiManager *)self pendingLastGoodNetwork];
      if (v10)
      {
        v11 = (void *)v10;
        id v12 = [(CBWiFiManager *)self pendingLastGoodNetwork];
        v13 = [v12 scanResult];
        id v14 = [v13 networkName];
        v15 = [(CBWiFiManager *)self currentNetworkSSID];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          float v17 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [(CBWiFiManager *)self currentNetworkSSID];
            *(_DWORD *)buf = 138412290;
            float v22 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating last known good network to %@", buf, 0xCu);
          }
          v19 = [(CBWiFiManager *)self pendingLastGoodNetwork];
          [(CBWiFiManager *)self setLastGoodNetwork:v19];

          [(CBWiFiManager *)self setPendingLastGoodNetwork:0];
        }
      }
    }
  }
  else
  {
    uint64_t v3 = [(CBWiFiManager *)self lastGoodNetwork];
    if (v3)
    {
      id v4 = (void *)v3;
      unsigned __int8 v5 = [(CBWiFiManager *)self reconnecting];

      if ((v5 & 1) == 0)
      {
        v6 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = [(CBWiFiManager *)self lastGoodNetwork];
          id v8 = [v7 scanResult];
          v9 = [v8 networkName];
          *(_DWORD *)buf = 138412290;
          float v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Beginning attempt to reconnect to network %@", buf, 0xCu);
        }
        [(CBWiFiManager *)self setReconnecting:1];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100029438;
        block[3] = &unk_1000794E0;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (void)_resolveReconnectingStatus
{
  if ([(CBWiFiManager *)self isAssociatedToNetwork]
    && [(CBWiFiManager *)self reconnecting])
  {
    uint64_t v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending attempt to reconnect to network", v6, 2u);
    }

    id v4 = [(CBWiFiManager *)self reconnectTimer];

    if (v4)
    {
      unsigned __int8 v5 = [(CBWiFiManager *)self reconnectTimer];
      [v5 invalidate];

      [(CBWiFiManager *)self setReconnectTimer:0];
    }
    [(CBWiFiManager *)self stopWiFiNetworkScanRequestFrom:self];
    [(CBWiFiManager *)self setReconnecting:0];
  }
}

- (BOOL)isAssociatedToNetwork
{
  v2 = [(CBWiFiManager *)self cwInterface];
  uint64_t v3 = [v2 currentScanResult];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_sortWiFiScanResultsAlphabetically:(id)a3
{
  id v3 = a3;
  BOOL v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sorting Wi-Fi scan results…", v5, 2u);
  }

  [v3 sortWithOptions:16 usingComparator:&stru_10007A1B8];
}

- (void)_forceWiFiOnIfNecessary
{
  unsigned __int8 v3 = [(CBWiFiManager *)self isWiFiPoweredOn];
  BOOL v4 = CheckerBoardLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi is on post Wi-Fi being ready for us", v6, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi is off post Wi-Fi being ready for us. Forcing it on now…", buf, 2u);
    }

    [(CBWiFiManager *)self setPowered:1];
  }
}

- (void)setPowered:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CBWiFiManager *)self cwInterface];

  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting Wi-Fi power state to %d", buf, 8u);
    }

    v7 = [(CBWiFiManager *)self cwInterface];
    id v10 = 0;
    [v7 setPower:v3 error:&v10];
    id v8 = v10;

    if (v8)
    {
      v9 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wifi power-on caused an error: %@", buf, 0xCu);
      }
    }
    else
    {
      [(CBWiFiManager *)self _powerStateDidChange];
    }
  }
}

- (void)_powerStateDidChange
{
  BOOL v3 = [(CBWiFiManager *)self cwInterface];

  if (v3)
  {
    BOOL v4 = [(CBWiFiManager *)self cwInterface];
    -[CBWiFiManager setWifiPoweredOn:](self, "setWifiPoweredOn:", [v4 powerOn]);

    BOOL v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = [(CBWiFiManager *)self isWiFiPoweredOn];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi power state changed to %d", (uint8_t *)v7, 8u);
    }

    [(CBWiFiManager *)self updateWiFiState];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"CBWiFiPowerStateDidChangeNotification" object:0];
  }
}

- (id)scanParametersWithSSID:(id)a3 isHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)CWFScanParameters);
  [v6 setIncludeHiddenNetworks:v4];
  [v6 setMinimumRSSI:-80];
  if (v5) {
    [v6 setSSID:v5];
  }
  [v6 setMergeScanResults:1];
  v7 = +[NSSet setWithArray:&off_10007CFB0];
  [v6 setIncludeProperties:v7];

  return v6;
}

- (void)startWiFiNetworkScanRequestFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CBWiFiManager *)self wifiScanRequestors];
    id v6 = [v5 count];

    v7 = CheckerBoardLogHandleForCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WiFi scan requested by %@, but it is not the first.", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "First WiFi scan request from %@. Beginning WiFi scan", (uint8_t *)&v12, 0xCu);
      }

      [(CBWiFiManager *)self _startWiFiNetworkScan];
    }
    id v10 = [(CBWiFiManager *)self wifiScanRequestors];
    unsigned __int8 v11 = [v10 containsObject:v4];

    if (v11)
    {
      v9 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ is already known to be a WiFi scan requestor", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      v9 = [(CBWiFiManager *)self wifiScanRequestors];
      [v9 addObject:v4];
    }
  }
  else
  {
    v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000494B0();
    }
  }
}

- (void)_startWiFiNetworkScan
{
  objc_initWeak(&location, self);
  BOOL v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029DE4;
  block[3] = &unk_100079720;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopWiFiNetworkScanRequestFrom:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(CBWiFiManager *)self wifiScanRequestors],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WiFi scan requestor %@ no longer needs WiFi scan.", (uint8_t *)&v13, 0xCu);
    }

    BOOL v8 = [(CBWiFiManager *)self wifiScanRequestors];
    [v8 removeObject:v4];

    v9 = [(CBWiFiManager *)self wifiScanRequestors];
    id v10 = [v9 count];

    if (!v10)
    {
      unsigned __int8 v11 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Count of requestors for WiFi scan is now zero. Stopping WiFi scan.", (uint8_t *)&v13, 2u);
      }

      [(CBWiFiManager *)self _stopWiFiNetworkScan];
    }
  }
  else
  {
    int v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004954C();
    }
  }
}

- (void)_stopWiFiNetworkScan
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  BOOL v3 = [(CBWiFiManager *)self cwInterface];

  if (v3)
  {
    id v4 = [(CBWiFiManager *)self cwInterface];
    id v5 = [(CBWiFiManager *)self cwInterface];
    unsigned int v6 = [v5 requestParameters];
    v7 = [v6 UUID];
    uint64_t v12 = 0;
    [v4 cancelRequestsWithUUID:v7 error:&v12];
  }
  BOOL v8 = [(CBWiFiManager *)self scanTimer];

  if (v8)
  {
    v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Invalidating scan timer…", v11, 2u);
    }

    id v10 = [(CBWiFiManager *)self scanTimer];
    [v10 invalidate];

    [(CBWiFiManager *)self setScanTimer:0];
  }
}

- (void)_restartWiFiNetworkScan
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting network scan…", v4, 2u);
  }

  [(CBWiFiManager *)self _stopWiFiNetworkScan];
  [(CBWiFiManager *)self updateWiFiState];
  [(CBWiFiManager *)self performSelector:"_startWiFiNetworkScan" withObject:0 afterDelay:0.3];
}

- (void)_wifiScanCompleted:(id)a3
{
  id v4 = a3;
  [(CBWiFiManager *)self updateWiFiState];
  id v5 = +[NSMutableArray arrayWithArray:v4];

  [(CBWiFiManager *)self setFilteredWiFiScanResults:v5];
  unsigned int v6 = [(CBWiFiManager *)self filteredWiFiScanResults];
  [(CBWiFiManager *)self _sortWiFiScanResultsAlphabetically:v6];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"CBWiFiNetworkScanCompletedNotification" object:0];

  [(CBWiFiManager *)self setScanning:0];

  [(CBWiFiManager *)self _setTimeForNextScan:8.0];
}

- (void)_setTimeForNextScan:(double)a3
{
  id v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing next scan in %f seconds", buf, 0xCu);
  }

  if ([(CBWiFiManager *)self scanning])
  {
    unsigned int v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is already scanning for networks", buf, 2u);
    }
  }
  else
  {
    v7 = [(CBWiFiManager *)self scanTimer];

    if (v7)
    {
      BOOL v8 = [(CBWiFiManager *)self scanTimer];
      [v8 invalidate];
    }
    v9 = [(CBWiFiManager *)self filteredWiFiScanResults];
    id v10 = [v9 copy];
    [(CBWiFiManager *)self setPreviousScanFilteredWiFiScanResults:v10];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002A6A0;
    v11[3] = &unk_10007A208;
    v11[4] = self;
    *(double *)&v11[5] = a3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (BOOL)attemptingToAssociateToCurrentNetworkByIndex:(int64_t)a3
{
  id v5 = [(CBWiFiManager *)self filteredWiFiScanResults];
  unsigned int v6 = [v5 objectAtIndexedSubscript:a3];

  v7 = [v6 networkName];
  BOOL v8 = [(CBWiFiManager *)self currentNetworkSSID];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  return v9;
}

- (void)associateToNetworkByIndex:(int64_t)a3
{
  id v5 = [(CBWiFiManager *)self filteredWiFiScanResults];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  [(CBWiFiManager *)self _associateToNetworkWithScanResult:v6];
}

- (id)_associationParametersFromScanResult:(id)a3 withPassword:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CWFAssocParameters);
  [v7 setScanResult:v6];

  [v7 setRememberUponSuccessfulAssociation:1];
  if (v5) {
    [v7 setPassword:v5];
  }

  return v7;
}

- (void)associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4
{
}

- (void)associateToEncryptedNetworkWithName:(id)a3 password:(id)a4
{
}

- (void)associateToHiddenEncryptedNetworkWithName:(id)a3 password:(id)a4
{
}

- (void)associateToHiddenUnencryptedNetworkWithName:(id)a3
{
  id v4 = a3;
  id v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to associate to network with a directed scan", v6, 2u);
  }

  [(CBWiFiManager *)self _performDirectedScanIncludingHidden:1 AndAssociateToNetworkWithName:v4 password:0];
}

- (void)_performDirectedScanIncludingHidden:(BOOL)a3 AndAssociateToNetworkWithName:(id)a4 password:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to associate to network with hidden scan (%d)…", (uint8_t *)&buf, 8u);
  }

  unsigned __int8 v11 = +[NSNotificationCenter defaultCenter];
  uint64_t v12 = v11;
  if (v9) {
    CFStringRef v13 = @"CBWiFiManagerWillAssociateToEncryptedNetworkNotification";
  }
  else {
    CFStringRef v13 = @"CBWiFiManagerWillAssociateToOpenNetworkNotification";
  }
  [v11 postNotificationName:v13 object:0 userInfo:&__NSDictionary0__struct];

  objc_initWeak(&buf, self);
  id v14 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AB38;
  block[3] = &unk_10007A258;
  objc_copyWeak(&v20, &buf);
  block[4] = self;
  id v18 = v8;
  BOOL v21 = v6;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v14, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&buf);
}

- (void)_associateToNetworkWithScanResult:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 requiresPassword];
  BOOL v6 = +[NSNotificationCenter defaultCenter];
  if (v5)
  {
    CFStringRef v11 = @"CBNetworkInfoKey";
    id v12 = v4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    [v6 postNotificationName:@"CBWiFiManagerWillAssociateToEncryptedNetworkNotification" object:0 userInfo:v7];
  }
  else
  {
    CFStringRef v9 = @"CBNetworkInfoKey";
    id v10 = v4;
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v6 postNotificationName:@"CBWiFiManagerWillAssociateToOpenNetworkNotification" object:0 userInfo:v8];

    [(CBWiFiManager *)self _associateToUnencryptedNetwork:v4];
    BOOL v6 = v4;
  }
}

- (void)_savePendingInfoWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (![(CBWiFiManager *)self reconnecting])
  {
    CFStringRef v9 = objc_alloc_init(CBWiFiNetworkInfo);
    [(CBWiFiManager *)self setPendingLastGoodNetwork:v9];

    id v10 = [(CBWiFiManager *)self pendingLastGoodNetwork];
    [v10 setScanResult:v13];

    CFStringRef v11 = [(CBWiFiManager *)self pendingLastGoodNetwork];
    [v11 setPassword:v8];

    id v12 = [(CBWiFiManager *)self pendingLastGoodNetwork];
    [v12 setIsHidden:v5];

    [(CBWiFiManager *)self setLastGoodNetwork:0];
  }
}

- (void)_associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CBWiFiManager *)self cwInterface];

  if (v10)
  {
    CFStringRef v11 = CheckerBoardLogHandleForCategory();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        LOWORD(buf[0]) = 0;
        id v13 = "Attempting to associate to network with password…";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)buf, 2u);
      }
    }
    else if (v12)
    {
      LOWORD(buf[0]) = 0;
      id v13 = "Attempting to associate to network with no password…";
      goto LABEL_7;
    }

    [(CBWiFiManager *)self _savePendingInfoWithScanResult:v8 password:v9 isHidden:v5];
    id v14 = [(CBWiFiManager *)self _associationParametersFromScanResult:v8 withPassword:v9];
    objc_initWeak(buf, self);
    id v15 = [(CBWiFiManager *)self cwInterface];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002B4A4;
    v16[3] = &unk_10007A280;
    objc_copyWeak(&v17, buf);
    [v15 associateWithParameters:v14 reply:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
}

- (void)_associateToUnencryptedNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBWiFiManager *)self cwInterface];

  if (v5)
  {
    BOOL v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Begin unencrypted network association…", (uint8_t *)buf, 2u);
    }

    [(CBWiFiManager *)self _savePendingInfoWithScanResult:v4 password:0 isHidden:0];
    id v7 = [(CBWiFiManager *)self _associationParametersFromScanResult:v4 withPassword:0];
    objc_initWeak(buf, self);
    id v8 = [(CBWiFiManager *)self cwInterface];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002B6A8;
    v9[3] = &unk_10007A280;
    objc_copyWeak(&v10, buf);
    [v8 associateWithParameters:v7 reply:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)_associateToHiddenUnencryptedNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBWiFiManager *)self cwInterface];

  if (v5)
  {
    BOOL v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Begin hidden unencrypted network association…", (uint8_t *)buf, 2u);
    }

    [(CBWiFiManager *)self _savePendingInfoWithScanResult:v4 password:0 isHidden:1];
    id v7 = [(CBWiFiManager *)self _associationParametersFromScanResult:v4 withPassword:0];
    objc_initWeak(buf, self);
    id v8 = [(CBWiFiManager *)self cwInterface];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002B8AC;
    v9[3] = &unk_10007A280;
    objc_copyWeak(&v10, buf);
    [v8 associateWithParameters:v7 reply:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)setAttemptsNetworkReconnect:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network reconnect enabled: %d", (uint8_t *)v6, 8u);
  }

  [(CBWiFiManager *)self setNetworkReconnectEnabled:v3];
}

- (void)_attemptReconnect
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 67109120;
    LODWORD(v31) = [(CBWiFiManager *)self reconnecting];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempt to reconnect called, reconnecting: %d", (uint8_t *)&v30, 8u);
  }

  if ([(CBWiFiManager *)self reconnecting])
  {
    id v4 = [(CBWiFiManager *)self lastGoodNetwork];

    if (v4)
    {
      unsigned int v5 = [(CBWiFiManager *)self attemptsNetworkReconnect];
      BOOL v6 = CheckerBoardLogHandleForCategory();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          id v8 = [(CBWiFiManager *)self lastGoodNetwork];
          id v9 = [v8 scanResult];
          id v10 = [v9 networkName];
          CFStringRef v11 = [(CBWiFiManager *)self lastGoodNetwork];
          BOOL v12 = [v11 password];
          id v13 = [(CBWiFiManager *)self lastGoodNetwork];
          id v14 = [v13 scanResult];
          unsigned int v15 = [v14 requiresPassword];
          int v30 = 138412802;
          v31 = v10;
          __int16 v32 = 1024;
          BOOL v33 = v12 != 0;
          __int16 v34 = 1024;
          unsigned int v35 = v15;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect to network with SSID: (%@) Password: (%d) Security: (%d)", (uint8_t *)&v30, 0x18u);
        }
        id v16 = [(CBWiFiManager *)self lastGoodNetwork];
        id v17 = [v16 password];

        id v18 = [(CBWiFiManager *)self lastGoodNetwork];
        BOOL v6 = v18;
        if (v17)
        {
          unsigned int v19 = [v18 isHidden];

          BOOL v6 = [(CBWiFiManager *)self lastGoodNetwork];
          id v20 = [v6 scanResult];
          BOOL v21 = [v20 networkName];
          float v22 = [(CBWiFiManager *)self lastGoodNetwork];
          id v23 = [v22 password];
          if (v19) {
            [(CBWiFiManager *)self associateToHiddenEncryptedNetworkWithName:v21 password:v23];
          }
          else {
            [(CBWiFiManager *)self associateToEncryptedNetworkWithName:v21 password:v23];
          }
        }
        else
        {
          id v20 = [v18 scanResult];
          BOOL v21 = [v20 networkName];
          [(CBWiFiManager *)self associateToHiddenUnencryptedNetworkWithName:v21];
        }
      }
      else if (v7)
      {
        id v27 = [(CBWiFiManager *)self lastGoodNetwork];
        id v28 = [v27 scanResult];
        id v29 = [v28 networkName];
        int v30 = 138412290;
        v31 = v29;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network reconnect is disabled. Not attempting to reconnect to network with SSID: (%@)", (uint8_t *)&v30, 0xCu);
      }
      return;
    }
    id v24 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000496B8();
    }

    [(CBWiFiManager *)self setReconnecting:0];
  }
  double v25 = [(CBWiFiManager *)self reconnectTimer];

  if (v25)
  {
    int v26 = [(CBWiFiManager *)self reconnectTimer];
    [v26 invalidate];

    [(CBWiFiManager *)self setReconnectTimer:0];
  }
}

- (void)_updateSignalStrength
{
  float v3 = 0.0;
  if ([(CBWiFiManager *)self isAssociatedToNetwork])
  {
    id v4 = [(CBWiFiManager *)self cwInterface];

    if (v4)
    {
      unsigned int v5 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating signal strength…", (uint8_t *)v11, 2u);
      }

      BOOL v6 = [(CBWiFiManager *)self cwInterface];
      BOOL v7 = [v6 currentScanResult];
      id v4 = [v7 RSSI];

      WFScaleRSSI();
      float v3 = v8;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v4;
    __int16 v12 = 2048;
    double v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating signal strength with raw RSSI %d and scaled RSSI %f", (uint8_t *)v11, 0x12u);
  }

  *(float *)&double v10 = v3;
  [(CBWiFiManager *)self _updateSignalStrengthFromRawRSSI:v4 andScaledRSSI:v10];
}

- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating signal strength from raw RSSI and scaled RSSI…", (uint8_t *)v10, 2u);
  }

  if ([(CBWiFiManager *)self isAssociatedToNetwork])
  {
    uint64_t v7 = WFSignalBarsFromScaledRSSI();
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v4 = 0;
  }
  BOOL v8 = [(CBWiFiManager *)self signalStrengthBars] != v7
    || [(CBWiFiManager *)self signalStrengthRSSI] != v4;
  [(CBWiFiManager *)self setSignalStrengthBars:v7];
  [(CBWiFiManager *)self setSignalStrengthRSSI:v4];
  id v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109632;
    v10[1] = v8;
    __int16 v11 = 1024;
    int v12 = v7;
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Signal changed (%d) to bars (%d) and RSSI (%d)…", (uint8_t *)v10, 0x14u);
  }

  if (v8) {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_10007A2A0);
  }
}

- (void)_postDidAssociateToEncryptedNetworkNotificationWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting DidAssociateToEncryptedNetwork notification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C1FC;
  block[3] = &unk_1000794E0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_postDidAssociateToOpenNetworkNotificationWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting DidAssociateToOpenNetwork notification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C370;
  block[3] = &unk_1000794E0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSMutableArray)filteredWiFiScanResults
{
  return self->_filteredWiFiScanResults;
}

- (void)setFilteredWiFiScanResults:(id)a3
{
}

- (NSMutableArray)previousScanFilteredWiFiScanResults
{
  return self->_previousScanFilteredWiFiScanResults;
}

- (void)setPreviousScanFilteredWiFiScanResults:(id)a3
{
}

- (int)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(int)a3
{
  self->_signalStrengthBars = a3;
}

- (int)signalStrengthRSSI
{
  return self->_signalStrengthRSSI;
}

- (void)setSignalStrengthRSSI:(int)a3
{
  self->_signalStrengthRSSI = a3;
}

- (BOOL)isWiFiPoweredOn
{
  return self->_wifiPoweredOn;
}

- (void)setWifiPoweredOn:(BOOL)a3
{
  self->_wifiPoweredOn = a3;
}

- (BOOL)attemptsNetworkReconnect
{
  return self->_networkReconnectEnabled;
}

- (void)setNetworkReconnectEnabled:(BOOL)a3
{
  self->_networkReconnectEnabled = a3;
}

- (NSMutableSet)wifiScanRequestors
{
  return self->_wifiScanRequestors;
}

- (void)setWifiScanRequestors:(id)a3
{
}

- (CBWiFiNetworkInfo)lastGoodNetwork
{
  return self->_lastGoodNetwork;
}

- (void)setLastGoodNetwork:(id)a3
{
}

- (CBWiFiNetworkInfo)pendingLastGoodNetwork
{
  return self->_pendingLastGoodNetwork;
}

- (void)setPendingLastGoodNetwork:(id)a3
{
}

- (NSTimer)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (void)setReconnecting:(BOOL)a3
{
  self->_reconnecting = a3;
}

- (CWFInterface)cwInterface
{
  return self->_cwInterface;
}

- (void)setCwInterface:(id)a3
{
}

- (NSTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_semaphore)networkScanSemaphore
{
  return self->_networkScanSemaphore;
}

- (void)setNetworkScanSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkScanSemaphore, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_cwInterface, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_pendingLastGoodNetwork, 0);
  objc_storeStrong((id *)&self->_lastGoodNetwork, 0);
  objc_storeStrong((id *)&self->_wifiScanRequestors, 0);
  objc_storeStrong((id *)&self->_previousScanFilteredWiFiScanResults, 0);

  objc_storeStrong((id *)&self->_filteredWiFiScanResults, 0);
}

@end