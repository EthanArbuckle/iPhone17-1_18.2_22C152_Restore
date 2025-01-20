@interface IDSNRDevicePreferencesHandler
- (BOOL)areThereFreshQuickRelayRequests;
- (IDSDeviceOnlineMonitor)deviceOnlineMonitor;
- (IDSNRDevicePreferencesHandler)initWithDeviceIdentifier:(id)a3;
- (NRDevicePreferences)nrDevicePreferences;
- (NSMutableSet)servicesPreferringInfraWiFi;
- (id)announcePresenceBlock;
- (unsigned)announcePresenceDelayInSeconds;
- (unsigned)copyOfQuickRelayRequestsCountOnTheLastRequest;
- (unsigned)presenceOperationMode;
- (unsigned)quickRelayRequestsCount;
- (void)_annouceAvailabilityForCloudMessaging;
- (void)_reportPreferInfraWiFiToPowerLogs:(BOOL)a3;
- (void)annouceAvailabilityForCloudMessaging;
- (void)cancel;
- (void)idsDeviceOnlineMonitor:(id)a3 statusChanged:(unsigned int)a4;
- (void)localSetUpCompleted;
- (void)localSetUpStarted;
- (void)releaseQuickRelay;
- (void)requestQuickRelay;
- (void)revokeAvailabilityForCloudMessaging;
- (void)setAllowedTrafficClasses:(id)a3;
- (void)setAnnouncePresenceBlock:(id)a3;
- (void)setAnnouncePresenceDelayInSeconds:(unsigned int)a3;
- (void)setBluetoothLinkPreferences:(id)a3 inputbps:(id)a4 outputbps:(id)a5;
- (void)setCopyOfQuickRelayRequestsCountOnTheLastRequest:(unsigned int)a3;
- (void)setDeviceOnlineMonitor:(id)a3;
- (void)setNrDevicePreferences:(id)a3;
- (void)setPreferInfraWiFiRequest:(BOOL)a3 services:(id)a4;
- (void)setPresenceOperationMode:(unsigned int)a3;
- (void)setQuickRelayRequest:(BOOL)a3;
- (void)setQuickRelayRequestsCount:(unsigned int)a3;
- (void)setServicesPreferringInfraWiFi:(id)a3;
@end

@implementation IDSNRDevicePreferencesHandler

- (IDSNRDevicePreferencesHandler)initWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)IDSNRDevicePreferencesHandler;
  v5 = [(IDSNRDevicePreferencesHandler *)&v36 init];
  if (v5)
  {
    if (v4)
    {
      v6 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v4];
      if (v6)
      {
        v7 = (NRDevicePreferences *)[objc_alloc((Class)NRDevicePreferences) initWithDeviceIdentifier:v6];
        nrDevicePreferences = v5->_nrDevicePreferences;
        v5->_nrDevicePreferences = v7;

        v9 = v5->_nrDevicePreferences;
        v10 = +[IDSFoundationLog IPsecLink];
        v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v38 = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NRDevicePreferences created with NRDeviceIdentifier %@.", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          sub_10071DD30((uint64_t)v4, (uint64_t)v6, v11);
        }

        v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        servicesPreferringInfraWiFi = v5->_servicesPreferringInfraWiFi;
        v5->_servicesPreferringInfraWiFi = v13;

        *(void *)&v5->_quickRelayRequestsCount = 0;
        v15 = +[IDSPairingManager sharedInstance];
        v12 = [v15 pairedDeviceUniqueID];

        BOOL v16 = sub_1002DA728();
        v17 = +[IDSServerBag sharedInstance];
        v18 = [v17 objectForKey:@"cloud-messaging-presence-operation-mode"];

        if (v18)
        {
          objc_opt_class();
          int v19 = 2;
          if (objc_opt_isKindOfClass())
          {
            unsigned int v20 = [v18 unsignedIntValue];
            if (v20 >= 2) {
              int v19 = 2;
            }
            else {
              int v19 = v20;
            }
          }
        }
        else
        {
          int v19 = 2;
        }

        v5->_unsigned int presenceOperationMode = v19;
        if (v19) {
          BOOL v21 = v16;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INITIATED, 0);
          dispatch_queue_t v24 = dispatch_queue_create("SKPresenceQueue", v23);

          v25 = [[IDSDeviceOnlineMonitor alloc] initWithDelegate:v5 uniqueIdentifier:v12 queue:v24];
          deviceOnlineMonitor = v5->_deviceOnlineMonitor;
          v5->_deviceOnlineMonitor = v25;
        }
        int v27 = _os_feature_enabled_impl();
        if ((v27 & 1) == 0) {
          v5->_unsigned int presenceOperationMode = 0;
        }
        v28 = +[IDSServerBag sharedInstance];
        v29 = [v28 objectForKey:@"cloud-messaging-presence-announce-delay"];

        if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          unsigned int v30 = [v29 unsignedIntValue];
        }
        else {
          unsigned int v30 = 665;
        }

        v5->_announcePresenceDelayInSeconds = v30;
        v31 = +[IDSFoundationLog IPsecLink];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v32 = @"NO";
          unsigned int presenceOperationMode = v5->_presenceOperationMode;
          if (v27) {
            CFStringRef v34 = @"YES";
          }
          else {
            CFStringRef v34 = @"NO";
          }
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v38 = presenceOperationMode;
          *(_WORD *)&v38[4] = 2112;
          if (v16) {
            CFStringRef v32 = @"YES";
          }
          *(void *)&v38[6] = v34;
          __int16 v39 = 2112;
          CFStringRef v40 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "IDSNRDevicePreferencesHandler: CloudMessagingPrsenceOperationMode: %d, feature flag:%@, remoteSupportOnlineMonitoring:%@", buf, 0x1Cu);
        }
      }
      else
      {
        v12 = +[IDSFoundationLog IPsecLink];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10071DCB8((uint64_t)v4, v12);
        }
      }
    }
    else
    {
      v6 = +[IDSFoundationLog IPsecLink];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10071DC74(v6);
      }
    }
  }
  return v5;
}

- (void)setBluetoothLinkPreferences:(id)a3 inputbps:(id)a4 outputbps:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_alloc_init((Class)NRBluetoothLinkPreferences);
  [v12 setPacketsPerSecond:v10];

  [v12 setInputBytesPerSecond:v9];
  [v12 setOutputBytesPerSecond:v8];

  v11 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v11 setBluetoothLinkPreferences:v12];
}

- (void)setPreferInfraWiFiRequest:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = v6;
  if (v4)
  {
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v13 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
          unsigned __int8 v14 = [v13 containsObject:v12];

          if ((v14 & 1) == 0)
          {
            v15 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
            [v15 addObject:v12];

            BOOL v16 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
            [v16 addPreferWiFiRequest];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    id v17 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v7);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
          v22 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
          unsigned int v23 = [v22 containsObject:v21];

          if (v23)
          {
            dispatch_queue_t v24 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
            [v24 removeObject:v21];

            v25 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
            [v25 removePreferWiFiRequest];
          }
        }
        id v18 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }
  }
  [(IDSNRDevicePreferencesHandler *)self _reportPreferInfraWiFiToPowerLogs:v4];
}

- (void)localSetUpStarted
{
  v3 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling [NRDevicePreferences deviceSetupStarted:]", v5, 2u);
  }

  BOOL v4 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v4 deviceSetupStarted];
}

- (void)localSetUpCompleted
{
  v3 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling [NRDevicePreferences deviceSetupCompleted:]", v5, 2u);
  }

  BOOL v4 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v4 deviceSetupCompleted];
}

- (void)_reportPreferInfraWiFiToPowerLogs:(BOOL)a3
{
  BOOL v3 = a3;
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
  if (v5) {
    CFDictionarySetValue(theDict, @"IDSServicePrefersInfraWifi", v5);
  }

  id v6 = +[NSNumber numberWithBool:v3];
  if (v6) {
    CFDictionarySetValue(theDict, @"InfraWiFiState", v6);
  }

  IDSPowerLogDictionary();
}

- (void)setAllowedTrafficClasses:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v5 setPolicyTrafficClassifiers:v4];
}

- (void)setQuickRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(IDSNRDevicePreferencesHandler *)self setQuickRelayRequestsCount:[(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount] + 1];
    [(IDSNRDevicePreferencesHandler *)self requestQuickRelay];
  }
  else
  {
    -[IDSNRDevicePreferencesHandler setQuickRelayRequestsCount:](self, "setQuickRelayRequestsCount:");
    [(IDSNRDevicePreferencesHandler *)self releaseQuickRelay];
  }
  id v5 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v5)
  {
    id v6 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    int v7 = [v6 status];
  }
  else
  {
    int v7 = 0;
  }
  id v8 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    uint64_t v10 = [(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount];
    v11 = sub_10021F028(v7);
    int v12 = 138412802;
    CFStringRef v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Called [NRDevicePreferences setQuickRelayRequest:] {wantsQuickRelay: %@}, {quickRelayRequestsCount: %lu}, {remoteStatus:%@}", (uint8_t *)&v12, 0x20u);
  }
}

- (void)cancel
{
  BOOL v3 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v3 cancel];

  id v4 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v4 removePreferWiFiRequest];

  id v5 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];

  if (v5)
  {
    id v6 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
    [v6 removeAllObjects];

    [(IDSNRDevicePreferencesHandler *)self _reportPreferInfraWiFiToPowerLogs:0];
    int v7 = [(IDSNRDevicePreferencesHandler *)self servicesPreferringInfraWiFi];
    id v8 = [v7 count];

    if (!v8) {
      [(IDSNRDevicePreferencesHandler *)self setServicesPreferringInfraWiFi:0];
    }
  }
  CFStringRef v9 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v9)
  {
    uint64_t v10 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v10 releasePresence];

    v11 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v11 stopMonitoring];

    [(IDSNRDevicePreferencesHandler *)self setDeviceOnlineMonitor:0];
  }
}

- (void)requestQuickRelay
{
  BOOL v3 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v3)
  {
    id v4 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    if ([v4 status] == 3)
    {
    }
    else
    {
      int v7 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
      unsigned int v8 = [v7 status];

      if (v8 != 1) {
        goto LABEL_9;
      }
    }
    CFStringRef v9 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
    [v9 addQuickRelayRequest];

    [(IDSNRDevicePreferencesHandler *)self setCopyOfQuickRelayRequestsCountOnTheLastRequest:[(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount]];
LABEL_9:
    if (self->_presenceOperationMode == 1)
    {
      id v10 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
      [v10 startMonitoring];
    }
    return;
  }
  id v5 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v5 addQuickRelayRequest];

  uint64_t v6 = [(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount];

  [(IDSNRDevicePreferencesHandler *)self setCopyOfQuickRelayRequestsCountOnTheLastRequest:v6];
}

- (void)releaseQuickRelay
{
  BOOL v3 = [(IDSNRDevicePreferencesHandler *)self nrDevicePreferences];
  [v3 removeAllQuickRelayRequests];

  [(IDSNRDevicePreferencesHandler *)self setCopyOfQuickRelayRequestsCountOnTheLastRequest:0];
  id v4 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v4 && self->_presenceOperationMode == 1)
  {
    id v5 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v5 stopMonitoring];
  }
}

- (BOOL)areThereFreshQuickRelayRequests
{
  unsigned int v3 = [(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount];
  return v3 > [(IDSNRDevicePreferencesHandler *)self copyOfQuickRelayRequestsCountOnTheLastRequest];
}

- (void)annouceAvailabilityForCloudMessaging
{
  im_assert_primary_base_queue();
  unsigned int v3 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];

  if (v3)
  {
    id v4 = +[IDSFoundationLog IPsecLink];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];
      id v6 = objc_retainBlock(v5);
      *(_DWORD *)buf = 134217984;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already have scheduled {block:%p}", buf, 0xCu);
    }
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1002DB438;
    id v18 = &unk_100981000;
    objc_copyWeak(&v19, &location);
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v15);
    -[IDSNRDevicePreferencesHandler setAnnouncePresenceBlock:](self, "setAnnouncePresenceBlock:", v7, v15, v16, v17, v18);

    dispatch_time_t v8 = dispatch_time(0, 1000000000* [(IDSNRDevicePreferencesHandler *)self announcePresenceDelayInSeconds]);
    CFStringRef v9 = im_primary_base_queue();
    id v10 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];
    dispatch_after(v8, v9, v10);

    v11 = +[IDSFoundationLog IPsecLink];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];
      id v13 = objc_retainBlock(v12);
      unsigned int v14 = [(IDSNRDevicePreferencesHandler *)self announcePresenceDelayInSeconds];
      *(_DWORD *)buf = 134218240;
      id v22 = v13;
      __int16 v23 = 1024;
      unsigned int v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scheduled to announce presence {block:%p} in %d seconds", buf, 0x12u);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_annouceAvailabilityForCloudMessaging
{
  unsigned int v3 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (!v3 && self->_presenceOperationMode && sub_1002DA728())
  {
    dispatch_block_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_time_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("SKPresenceQueue", v8);

    id v10 = +[IDSPairingManager sharedInstance];
    v11 = [v10 pairedDeviceUniqueID];

    int v12 = [[IDSDeviceOnlineMonitor alloc] initWithDelegate:self uniqueIdentifier:v11 queue:v9];
    deviceOnlineMonitor = self->_deviceOnlineMonitor;
    self->_deviceOnlineMonitor = v12;

    unsigned int v14 = +[IDSFoundationLog IPsecLink];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int presenceOperationMode = self->_presenceOperationMode;
      v16[0] = 67109120;
      v16[1] = presenceOperationMode;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting IDSDeviceOnlineMonitor {presenceOperationMode:%d}", (uint8_t *)v16, 8u);
    }
  }
  id v4 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v4)
  {
    id v5 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v5 assertPresence];

    if (self->_presenceOperationMode == 2)
    {
      id v6 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
      [v6 startMonitoring];
    }
  }
}

- (void)revokeAvailabilityForCloudMessaging
{
  im_assert_primary_base_queue();
  unsigned int v3 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];

  if (v3)
  {
    id v4 = +[IDSFoundationLog IPsecLink];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];
      id v6 = objc_retainBlock(v5);
      int v11 = 134217984;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling scheduled {block:%p}", (uint8_t *)&v11, 0xCu);
    }
    dispatch_block_t v7 = [(IDSNRDevicePreferencesHandler *)self announcePresenceBlock];
    dispatch_block_cancel(v7);

    [(IDSNRDevicePreferencesHandler *)self setAnnouncePresenceBlock:0];
  }
  dispatch_time_t v8 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];

  if (v8)
  {
    dispatch_queue_t v9 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v9 releasePresence];

    id v10 = [(IDSNRDevicePreferencesHandler *)self deviceOnlineMonitor];
    [v10 stopMonitoring];
  }
}

- (void)idsDeviceOnlineMonitor:(id)a3 statusChanged:(unsigned int)a4
{
  id v6 = +[IDSFoundationLog IPsecLink];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_block_t v7 = sub_10021F028(a4);
    int v8 = 138412546;
    dispatch_queue_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = [(IDSNRDevicePreferencesHandler *)self quickRelayRequestsCount];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "idsDeviceOnlineMonitor status changed: {newStatus:%@}, {quickRelayRequestsCount: %lu}", (uint8_t *)&v8, 0x16u);
  }
  if (a4 == 3)
  {
    if ([(IDSNRDevicePreferencesHandler *)self areThereFreshQuickRelayRequests]) {
      [(IDSNRDevicePreferencesHandler *)self requestQuickRelay];
    }
  }
}

- (NRDevicePreferences)nrDevicePreferences
{
  return self->_nrDevicePreferences;
}

- (void)setNrDevicePreferences:(id)a3
{
}

- (NSMutableSet)servicesPreferringInfraWiFi
{
  return self->_servicesPreferringInfraWiFi;
}

- (void)setServicesPreferringInfraWiFi:(id)a3
{
}

- (IDSDeviceOnlineMonitor)deviceOnlineMonitor
{
  return self->_deviceOnlineMonitor;
}

- (void)setDeviceOnlineMonitor:(id)a3
{
}

- (unsigned)quickRelayRequestsCount
{
  return self->_quickRelayRequestsCount;
}

- (void)setQuickRelayRequestsCount:(unsigned int)a3
{
  self->_quickRelayRequestsCount = a3;
}

- (unsigned)copyOfQuickRelayRequestsCountOnTheLastRequest
{
  return self->_copyOfQuickRelayRequestsCountOnTheLastRequest;
}

- (void)setCopyOfQuickRelayRequestsCountOnTheLastRequest:(unsigned int)a3
{
  self->_copyOfQuickRelayRequestsCountOnTheLastRequest = a3;
}

- (unsigned)presenceOperationMode
{
  return self->_presenceOperationMode;
}

- (void)setPresenceOperationMode:(unsigned int)a3
{
  self->_unsigned int presenceOperationMode = a3;
}

- (id)announcePresenceBlock
{
  return self->_announcePresenceBlock;
}

- (void)setAnnouncePresenceBlock:(id)a3
{
}

- (unsigned)announcePresenceDelayInSeconds
{
  return self->_announcePresenceDelayInSeconds;
}

- (void)setAnnouncePresenceDelayInSeconds:(unsigned int)a3
{
  self->_announcePresenceDelayInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_announcePresenceBlock, 0);
  objc_storeStrong((id *)&self->_deviceOnlineMonitor, 0);
  objc_storeStrong((id *)&self->_servicesPreferringInfraWiFi, 0);

  objc_storeStrong((id *)&self->_nrDevicePreferences, 0);
}

@end