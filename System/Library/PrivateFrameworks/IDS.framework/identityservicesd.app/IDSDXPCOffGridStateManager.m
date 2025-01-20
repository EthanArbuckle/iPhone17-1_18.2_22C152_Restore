@interface IDSDXPCOffGridStateManager
- (BOOL)_isConnectedForIML;
- (BOOL)_isDeviceOnline;
- (BOOL)_isExpiredProvisionedPayload:(id)a3;
- (BOOL)_isIMLRegistered;
- (BOOL)_isStewieAvailableForIML;
- (BOOL)_isStewieAvailableForSMS;
- (BOOL)_needsToRequestForIML;
- (BOOL)_needsToRequestForSMS;
- (BOOL)_needsToRequestForStewie;
- (BOOL)_shouldProvisionOffGridPayloads;
- (BOOL)isConnected;
- (BOOL)isStewieConnectedForIML;
- (BOOL)provisionRequestInProgress;
- (CoreTelephonyClient)ctClient;
- (HKMedicalIDStore)hkMedicalIDStore;
- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3;
- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3 ctClient:(id)a4 ctMessagingClient:(id)a5 hkMedicalIDStore:(id)a6 familyManager:(id)a7 statusClient:(id)a8 connectionMonitor:(id)a9 systemMonitor:(id)a10 persistentMap:(id)a11;
- (IDSFamilyManager)familyManager;
- (IDSPersistentMap)persistentMap;
- (IDSSKStatusClient)statusClient;
- (IDSStewieCTMessagingClient)ctMessagingClient;
- (IMDispatchTimer)clearSendKeyOnConnectTimer;
- (IMDispatchTimer)provisionTimer;
- (IMDispatchTimer)stateResetTimer;
- (IMNetworkConnectionMonitor)connectionMonitor;
- (IMSystemMonitor)systemMonitor;
- (NSData)payloadKeyToSendOnIMLConnect;
- (NSDate)lastProvisionTime;
- (NSDate)onlineSince;
- (NSError)lastProvisionError;
- (NSMutableDictionary)clientRemoteObjects;
- (OS_dispatch_queue)queue;
- (double)_clearSendKeyOnConnectInterval;
- (double)_failedProvisionInterval;
- (double)_payloadValidityDuration;
- (double)_payloadValidityRequirement;
- (double)_payloadValidityShift;
- (double)_provisionOnInviteDebounceTimeInterval;
- (double)_resetStateInterval;
- (double)_statePersistenceTimeInterval;
- (double)_successfulProvisionInterval;
- (id)_errorForDeviceOffline;
- (id)_errorForInvalidState;
- (id)_errorForNoProvisionedPayload;
- (id)_errorForStewieNotAvailable;
- (id)_fetchFamilyContactsWithPhoneNumbersOnly:(BOOL)a3;
- (id)_getDecryptionKeyForProvisionedPayloadWithStatus:(int64_t)a3;
- (id)_statusPayloadForOffGridMode:(int64_t)a3;
- (int)emergencyContactsNotificationToken;
- (int)familyContactsNotificationToken;
- (int64_t)_getRequestReason;
- (int64_t)_offGridModeDisableWhenOnlineForTimeInterval;
- (int64_t)_offGridStatusFromStatusPayload:(id)a3;
- (int64_t)offGridConnectAction;
- (int64_t)offGridMode;
- (int64_t)publishStatus;
- (os_unfair_lock_s)offGridConnectActionLock;
- (os_unfair_lock_s)provisionLock;
- (os_unfair_lock_s)publishLock;
- (unint64_t)_payloadCount;
- (unint64_t)_payloadCountPerDuration;
- (void)_areAllPrimaryContactsIMLReachableWithCompletion:(id)a3;
- (void)_calloutToDelegateWithUpdatedContacts:(id)a3;
- (void)_clearOffGridResetTimer;
- (void)_clearSendKeyOnConnect;
- (void)_clearSendKeyOnConnectTimerFired;
- (void)_connectStewieWithContext:(id)a3 options:(id)a4 withCompletion:(id)a5;
- (void)_contactsDidChange;
- (void)_disableOffGridModeViaStatusClient;
- (void)_emergencyContactsDidChange;
- (void)_exitStewieWithCompletion:(id)a3;
- (void)_familyContactsDidChange;
- (void)_fetchEmergencyContactsWithCompletion:(id)a3;
- (void)_initializeOffGridModeAndPublishStatusFromDisk;
- (void)_listenForContactsChangeNotifications;
- (void)_markPayloadAsSentForDecryptionKey:(id)a3;
- (void)_markProvisionRequestCompleted;
- (void)_markProvisionRequestInProgress;
- (void)_offGridPayloadProvisioningTimerFiredShouldForce:(BOOL)a3;
- (void)_offGridResetTimerFired;
- (void)_provisionOffGridPayloadsShouldForce:(BOOL)a3;
- (void)_registerSysdiagnoseBlock;
- (void)_reportOffGridEntryMetricWithService:(int64_t)a3 source:(id)a4 success:(BOOL)a5;
- (void)_reportOffGridModeMetricWithPreviousMode:(int64_t)a3 currentMode:(int64_t)a4 previousPublishStatus:(int64_t)a5 currentPublishStatus:(int64_t)a6 previousStewieConnectionStatus:(BOOL)a7 currentStewieConnectionStatus:(BOOL)a8 previousNetworkConnectionStatus:(BOOL)a9 currentNetworkConnectionStatus:(BOOL)a10 duration:(double)a11;
- (void)_resetOffGridModeIfRequired;
- (void)_scheduleClearSendOnConnectTimer;
- (void)_scheduleOffGridPayloadProvisioningTimerWithInterval:(double)a3 shouldForce:(BOOL)a4;
- (void)_scheduleOffGridResetTimerWithInterval:(double)a3;
- (void)_scheduleOrClearOffGridResetTimerIfRequired;
- (void)_sendOffGridStatusDecryptionKey;
- (void)_setAndPersistOffGridMode:(int64_t)a3 publishStatus:(int64_t)a4;
- (void)_stewieContextForPayloadKey:(id)a3 completion:(id)a4;
- (void)_updateClientsWithCurrentStateAndError:(id)a3;
- (void)_updateOffGridConnectActionWithPayloadKey:(id)a3;
- (void)availabilityChangedForIML:(BOOL)a3;
- (void)connectStewieWithCompletion:(id)a3;
- (void)connectionMonitorDidUpdate:(id)a3;
- (void)dealloc;
- (void)disconnectStewieWithCompletion:(id)a3;
- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4;
- (void)fetchContactsOfType:(int64_t)a3 phoneNumbersOnly:(BOOL)a4 completion:(id)a5;
- (void)fetchCurrentOffGridMode:(id)a3;
- (void)fetchCurrentPublishStatus:(id)a3;
- (void)fetchStewieAvailabilityWithCompletion:(id)a3;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6;
- (void)invitedHandlesWithCompletion:(id)a3;
- (void)monitorConnection:(id)a3;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setClearSendKeyOnConnectTimer:(id)a3;
- (void)setClientRemoteObjects:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setCtMessagingClient:(id)a3;
- (void)setEmergencyContactsNotificationToken:(int)a3;
- (void)setFamilyContactsNotificationToken:(int)a3;
- (void)setFamilyManager:(id)a3;
- (void)setHkMedicalIDStore:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsStewieConnectedForIML:(BOOL)a3;
- (void)setLastProvisionError:(id)a3;
- (void)setLastProvisionTime:(id)a3;
- (void)setOffGridConnectAction:(int64_t)a3;
- (void)setOffGridConnectActionLock:(os_unfair_lock_s)a3;
- (void)setOffGridMode:(int64_t)a3;
- (void)setOffGridMode:(int64_t)a3 allowOnlineEnablement:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)setOnlineSince:(id)a3;
- (void)setPayloadKeyToSendOnIMLConnect:(id)a3;
- (void)setPersistentMap:(id)a3;
- (void)setProvisionLock:(os_unfair_lock_s)a3;
- (void)setProvisionRequestInProgress:(BOOL)a3;
- (void)setProvisionTimer:(id)a3;
- (void)setPublishLock:(os_unfair_lock_s)a3;
- (void)setPublishStatus:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStateResetTimer:(id)a3;
- (void)setStatusClient:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setupOffGridStateManagerClient:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)statusClient:(id)a3 publishRequestCompletedForStatusPayload:(id)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)systemDidUnlock;
@end

@implementation IDSDXPCOffGridStateManager

- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3 ctClient:(id)a4 ctMessagingClient:(id)a5 hkMedicalIDStore:(id)a6 familyManager:(id)a7 statusClient:(id)a8 connectionMonitor:(id)a9 systemMonitor:(id)a10 persistentMap:(id)a11
{
  id v39 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  id v17 = a9;
  id v18 = a10;
  id v33 = a11;
  v40.receiver = self;
  v40.super_class = (Class)IDSDXPCOffGridStateManager;
  v19 = [(IDSDXPCOffGridStateManager *)&v40 init];
  if (v19)
  {
    id v31 = v18;
    v20 = v17;
    v21 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Created IDSDXPCOffGridStateManager {self: %p}", buf, 0xCu);
    }

    v19->_isStewieConnectedForIML = 0;
    objc_storeStrong((id *)&v19->_ctClient, a4);
    objc_storeStrong((id *)&v19->_ctMessagingClient, a5);
    [(IDSStewieCTMessagingClient *)v19->_ctMessagingClient setAvailabilityDelegate:v19];
    objc_storeStrong((id *)&v19->_hkMedicalIDStore, a6);
    objc_storeStrong((id *)&v19->_familyManager, a7);
    objc_storeStrong((id *)&v19->_statusClient, a8);
    [(IDSSKStatusClient *)v19->_statusClient setDelegate:v19];
    id v17 = v20;
    if (v20) {
      v22 = v20;
    }
    else {
      v22 = (IMNetworkConnectionMonitor *)[objc_alloc((Class)IMNetworkConnectionMonitor) initWithRemoteHost:0 delegate:v19];
    }
    connectionMonitor = v19->_connectionMonitor;
    v19->_connectionMonitor = v22;
    id v18 = v31;

    objc_storeStrong((id *)&v19->_systemMonitor, a10);
    [(IMSystemMonitor *)v19->_systemMonitor addListener:v19];
    objc_storeStrong((id *)&v19->_queue, a3);
    objc_storeStrong((id *)&v19->_persistentMap, a11);
    provisionTimer = v19->_provisionTimer;
    v19->_provisionTimer = 0;

    stateResetTimer = v19->_stateResetTimer;
    v19->_stateResetTimer = 0;

    v19->_provisionRequestInProgress = 0;
    v19->_publishLock._os_unfair_lock_opaque = 0;
    v19->_provisionLock._os_unfair_lock_opaque = 0;
    v19->_isConnected = [(IDSDXPCOffGridStateManager *)v19 _isDeviceOnline];
    uint64_t v26 = +[NSDate now];
    onlineSince = v19->_onlineSince;
    v19->_onlineSince = (NSDate *)v26;

    v19->_offGridConnectActionLock._os_unfair_lock_opaque = 0;
    payloadKeyToSendOnIMLConnect = v19->_payloadKeyToSendOnIMLConnect;
    v19->_payloadKeyToSendOnIMLConnect = 0;
    v19->_offGridConnectAction = 0;

    clearSendKeyOnConnectTimer = v19->_clearSendKeyOnConnectTimer;
    v19->_clearSendKeyOnConnectTimer = 0;

    [(IDSDXPCOffGridStateManager *)v19 _registerSysdiagnoseBlock];
    [(IDSDXPCOffGridStateManager *)v19 _initializeOffGridModeAndPublishStatusFromDisk];
    [(IDSDXPCOffGridStateManager *)v19 _scheduleOrClearOffGridResetTimerIfRequired];
    [(IDSDXPCOffGridStateManager *)v19 _provisionOffGridPayloadsShouldForce:0];
    [(IDSDXPCOffGridStateManager *)v19 _listenForContactsChangeNotifications];
  }

  return v19;
}

- (IDSDXPCOffGridStateManager)initWithQueue:(id)a3
{
  id v35 = a3;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.ids.offgridstatus.ct", v4);
  id v34 = v4;
  dispatch_queue_t v32 = dispatch_queue_create("com.apple.ids.offgridstatus.sk", v4);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [IDSDXPCOffGridStateManager alloc];
  dispatch_queue_t v33 = v5;
  id v15 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v5];
  v16 = +[IDSStewieCTMessagingClient sharedInstance];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  id v17 = (void *)qword_100A4A630;
  uint64_t v45 = qword_100A4A630;
  if (!qword_100A4A630)
  {
    id v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    id v39 = sub_1000EB4F8;
    objc_super v40 = &unk_10097ED88;
    v41 = &v42;
    sub_1000EB4F8((uint64_t)&v37);
    id v17 = (void *)v43[3];
  }
  id v31 = v15;
  id v18 = v17;
  _Block_object_dispose(&v42, 8);
  id v19 = [v18 alloc];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v20 = (void *)qword_100A4A640;
  uint64_t v45 = qword_100A4A640;
  if (!qword_100A4A640)
  {
    id v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    id v39 = sub_1000EB6B8;
    objc_super v40 = &unk_10097ED88;
    v41 = &v42;
    sub_1000EB6B8((uint64_t)&v37);
    v20 = (void *)v43[3];
  }
  v21 = v20;
  _Block_object_dispose(&v42, 8);
  id v30 = objc_alloc_init(v21);
  id v22 = [v19 initWithHealthStore:v30];
  v23 = +[IDSFamilyManager sharedInstance];
  v24 = [IDSSKStatusClient alloc];
  v25 = [(IDSSKStatusClient *)v24 initWithStatusTypeIdentifier:kIDSOffGridModeStatusTypeIdentifier queue:v32];
  uint64_t v26 = +[IMSystemMonitor sharedInstance];
  v27 = [[IDSPersistentMap alloc] initWithIdentifier:@"com.apple.identityservicesd.offgrid.provisioning.store" versionNumber:1 decodableClasses:v13 migrationBlock:0];
  v29 = [(IDSDXPCOffGridStateManager *)v14 initWithQueue:v35 ctClient:v31 ctMessagingClient:v16 hkMedicalIDStore:v22 familyManager:v23 statusClient:v25 connectionMonitor:0 systemMonitor:v26 persistentMap:v27];

  return v29;
}

- (void)monitorConnection:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSDXPCOffGridStateManager monitoring new connection {self: %p, connection: %@}", (uint8_t *)&v6, 0x16u);
  }
}

- (void)dealloc
{
  notify_cancel(self->_emergencyContactsNotificationToken);
  notify_cancel(self->_familyContactsNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)IDSDXPCOffGridStateManager;
  [(IDSDXPCOffGridStateManager *)&v3 dealloc];
}

- (void)_initializeOffGridModeAndPublishStatusFromDisk
{
  objc_super v3 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-offgrid-mode"];
  id v15 = v3;
  if (v3) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = 1;
  }
  if ([(IDSDXPCOffGridStateManager *)self _isDeviceOnline]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  int v6 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-publish-status"];
  uint64_t v7 = v6;
  int64_t v8 = v5;
  if (v6) {
    int64_t v8 = (int)[v6 intValue];
  }
  id v9 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-offgrid-mode-date"];
  if (v9
    && (+[NSDate now],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 timeIntervalSinceDate:v9],
        double v12 = v11,
        [(IDSDXPCOffGridStateManager *)self _statePersistenceTimeInterval],
        double v14 = v13,
        v10,
        v12 < v14))
  {
    self->_offGridMode = v4;
    self->_publishStatus = v8;
  }
  else
  {
    self->_offGridMode = 1;
    [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:1 publishStatus:v5];
  }
}

- (void)fetchCurrentPublishStatus:(id)a3
{
}

- (void)fetchCurrentOffGridMode:(id)a3
{
}

- (void)setupOffGridStateManagerClient:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, int64_t, int64_t, void))a5;
  if (a3)
  {
    uint64_t v10 = [a3 remoteObjectProxy];
    double v11 = +[IDSFoundationLog IDSOffGridStateManager];
    double v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218242;
        v20 = self;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding OffGrid state manager client {self: %p, uuid: %@}", (uint8_t *)&v19, 0x16u);
      }

      double v13 = [(IDSDXPCOffGridStateManager *)self clientRemoteObjects];

      if (!v13)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        [(IDSDXPCOffGridStateManager *)self setClientRemoteObjects:v14];
      }
      double v12 = [(IDSDXPCOffGridStateManager *)self clientRemoteObjects];
      [v12 setObject:v10 forKeyedSubscript:v8];
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10070FC34((uint64_t)self, (uint64_t)v8, v12);
    }

    v9[2](v9, self->_offGridMode, self->_publishStatus, 0);
  }
  else
  {
    id v15 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218242;
      v20 = self;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing OffGrid state manager client {self: %p, uuid: %@}", (uint8_t *)&v19, 0x16u);
    }

    v16 = [(IDSDXPCOffGridStateManager *)self clientRemoteObjects];
    [v16 setObject:0 forKeyedSubscript:v8];

    id v17 = [(IDSDXPCOffGridStateManager *)self clientRemoteObjects];
    id v18 = [v17 count];

    if (!v18) {
      [(IDSDXPCOffGridStateManager *)self setClientRemoteObjects:0];
    }
  }
}

- (void)_setAndPersistOffGridMode:(int64_t)a3 publishStatus:(int64_t)a4
{
  id v20 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-metric-state-changed-date"];
  uint64_t v7 = +[NSDate now];
  id v8 = v7;
  int64_t offGridMode = self->_offGridMode;
  if (*(_OWORD *)&self->_offGridMode != __PAIR128__(a4, a3))
  {
    if (v20)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:");
      double v11 = v10;
      int64_t offGridMode = self->_offGridMode;
    }
    else
    {
      double v11 = 0.0;
    }
    int64_t publishStatus = self->_publishStatus;
    BOOL isStewieConnectedForIML = self->_isStewieConnectedForIML;
    unsigned __int8 v14 = [(IDSDXPCOffGridStateManager *)self _isDeviceOnline];
    BYTE1(v19) = [(IDSDXPCOffGridStateManager *)self _isDeviceOnline];
    LOBYTE(v19) = v14;
    -[IDSDXPCOffGridStateManager _reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:](self, "_reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:", offGridMode, a3, publishStatus, a4, isStewieConnectedForIML, isStewieConnectedForIML, v11, v19);
    [(IDSPersistentMap *)self->_persistentMap setObject:v8 forKey:@"latest-metric-state-changed-date"];
  }
  self->_int64_t offGridMode = a3;
  persistentMap = self->_persistentMap;
  v16 = +[NSNumber numberWithInteger:a3];
  [(IDSPersistentMap *)persistentMap setObject:v16 forKey:@"latest-offgrid-mode"];

  self->_int64_t publishStatus = a4;
  id v17 = self->_persistentMap;
  id v18 = +[NSNumber numberWithInteger:a4];
  [(IDSPersistentMap *)v17 setObject:v18 forKey:@"latest-publish-status"];

  [(IDSPersistentMap *)self->_persistentMap setObject:v8 forKey:@"latest-offgrid-mode-date"];
  [(IDSDXPCOffGridStateManager *)self _scheduleOrClearOffGridResetTimerIfRequired];
}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
}

- (void)setOffGridMode:(int64_t)a3 allowOnlineEnablement:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  double v11 = (void (**)(id, int64_t, int64_t, void *))a6;
  unsigned int v12 = [(IDSDXPCOffGridStateManager *)self _isDeviceOnline];
  double v13 = +[IDSFoundationLog IDSOffGridStateManager];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v14) {
      goto LABEL_11;
    }
    int64_t offGridMode = self->_offGridMode;
    int64_t publishStatus = self->_publishStatus;
    CFStringRef v17 = @"NO";
    if (v12) {
      CFStringRef v17 = @"YES";
    }
    *(_DWORD *)buf = 134218754;
    int64_t v46 = offGridMode;
    __int16 v47 = 2048;
    int64_t v48 = publishStatus;
    __int16 v49 = 2048;
    int64_t v50 = a3;
    __int16 v51 = 2112;
    CFStringRef v52 = v17;
    id v18 = "[Online Enablement Allowed] Received request to set offgrid mode from {Mode:%ld PublishStatus:%ld} to {Mode:%l"
          "d} {isOnline: %@}";
  }
  else
  {
    if (!v14) {
      goto LABEL_11;
    }
    int64_t v19 = self->_offGridMode;
    int64_t v20 = self->_publishStatus;
    CFStringRef v21 = @"NO";
    if (v12) {
      CFStringRef v21 = @"YES";
    }
    *(_DWORD *)buf = 134218754;
    int64_t v46 = v19;
    __int16 v47 = 2048;
    int64_t v48 = v20;
    __int16 v49 = 2048;
    int64_t v50 = a3;
    __int16 v51 = 2112;
    CFStringRef v52 = v21;
    id v18 = "Received request to set offgrid mode from {Mode:%ld PublishStatus:%ld} to {Mode:%ld} {isOnline: %@}";
  }
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 0x2Au);
LABEL_11:

  if (a3)
  {
    id v22 = [(IDSDXPCOffGridStateManager *)self _getDecryptionKeyForProvisionedPayloadWithStatus:a3];
    if (!v22)
    {
      v23 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10070FCF0();
      }
    }
    if (a3 == 2 && !v7 && ((v12 ^ 1) & 1) == 0)
    {
      v24 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Invalid off grid mode requested by client while online.", buf, 2u);
      }

      int64_t v25 = self->_offGridMode;
      int64_t v26 = self->_publishStatus;
      v27 = [(IDSDXPCOffGridStateManager *)self _errorForInvalidState];
      v11[2](v11, v25, v26, v27);

      goto LABEL_40;
    }
    [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:a3 publishStatus:0];
    v11[2](v11, self->_offGridMode, self->_publishStatus, 0);
    if (v12)
    {
      id v31 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Publishing offgrid mode through StatusKit", buf, 2u);
      }

      statusClient = self->_statusClient;
      dispatch_queue_t v33 = [(IDSDXPCOffGridStateManager *)self _statusPayloadForOffGridMode:a3];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000E48C4;
      v44[3] = &unk_100981208;
      v44[4] = self;
      [(IDSSKStatusClient *)statusClient publishStatus:v33 completion:v44];
LABEL_29:

      goto LABEL_40;
    }
    ctMessagingClient = self->_ctMessagingClient;
    if (self->_isStewieConnectedForIML)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000E49A8;
      v43[3] = &unk_10097E688;
      v43[4] = self;
      [(IDSStewieCTMessagingClient *)ctMessagingClient sendOffGridStatusDecryptionKey:v22 completion:v43];
      goto LABEL_40;
    }
    if ([(IDSStewieCTMessagingClient *)ctMessagingClient isActiveForIML])
    {
      [(IDSDXPCOffGridStateManager *)self _updateOffGridConnectActionWithPayloadKey:v22];
      goto LABEL_40;
    }
    unsigned int v35 = [(IDSDXPCOffGridStateManager *)self _needsToRequestForStewie];
    id v36 = +[IDSFoundationLog IDSOffGridStateManager];
    id v37 = v36;
    if (!v35)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10070FCBC();
      }

      [(IDSDXPCOffGridStateManager *)self _updateOffGridConnectActionWithPayloadKey:0];
      [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:self->_offGridMode publishStatus:2];
      dispatch_queue_t v33 = [(IDSDXPCOffGridStateManager *)self _errorForStewieNotAvailable];
      [(IDSDXPCOffGridStateManager *)self _updateClientsWithCurrentStateAndError:v33];
      goto LABEL_29;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v38 = @"YES";
      if (!v22) {
        CFStringRef v38 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      int64_t v46 = (int64_t)v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Requesting stewie and publishing offgrid status through CT. Has provisioned payload key %@", buf, 0xCu);
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000E4AC8;
    v39[3] = &unk_100981BC0;
    id v22 = v22;
    id v40 = v22;
    v41 = self;
    id v42 = v10;
    [(IDSDXPCOffGridStateManager *)self _stewieContextForPayloadKey:v22 completion:v39];
  }
  else
  {
    v28 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Invalid off grid mode requested by client.", buf, 2u);
    }

    int64_t v29 = self->_offGridMode;
    int64_t v30 = self->_publishStatus;
    id v22 = [(IDSDXPCOffGridStateManager *)self _errorForInvalidState];
    v11[2](v11, v29, v30, v22);
  }
LABEL_40:
}

- (void)invitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4E54;
  v7[3] = &unk_10097E818;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = @"YES";
    *(_DWORD *)buf = 138412802;
    id v26 = v11;
    __int16 v27 = 2112;
    if (!v12) {
      CFStringRef v15 = @"NO";
    }
    CFStringRef v28 = v15;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received request to send invite from sender handle %@ with payload %@ to %@", buf, 0x20u);
  }

  if ([(IDSDXPCOffGridStateManager *)self _isDeviceOnline]) {
    goto LABEL_10;
  }
  v16 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cannot invite, we are offline", buf, 2u);
  }

  if (!v13)
  {
LABEL_10:
    statusClient = self->_statusClient;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000E513C;
    v19[3] = &unk_100981BE8;
    id v20 = v11;
    id v21 = v12;
    id v22 = v10;
    v23 = self;
    id v24 = v13;
    [(IDSSKStatusClient *)statusClient inviteHandles:v22 fromSenderHandle:v20 withDictionaryPayload:v21 completion:v19];

    CFStringRef v17 = v20;
  }
  else
  {
    CFStringRef v17 = [(IDSDXPCOffGridStateManager *)self _errorForDeviceOffline];
    (*((void (**)(id, id, id, id, void *))v13 + 2))(v13, v10, v11, v12, v17);
  }
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received request to remove invite for handles %@", buf, 0xCu);
  }

  if ([(IDSDXPCOffGridStateManager *)self _isDeviceOnline]) {
    goto LABEL_8;
  }
  id v9 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot remove invite, we are offline", buf, 2u);
  }

  if (!v7)
  {
LABEL_8:
    statusClient = self->_statusClient;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E5494;
    v12[3] = &unk_100981C10;
    id v13 = v6;
    BOOL v14 = self;
    id v15 = v7;
    [(IDSSKStatusClient *)statusClient removeInvitedHandles:v13 completion:v12];

    id v10 = v13;
  }
  else
  {
    id v10 = [(IDSDXPCOffGridStateManager *)self _errorForDeviceOffline];
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v10);
  }
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to remove all invites", buf, 2u);
  }

  id v6 = [(IDSSKStatusClient *)self->_statusClient invitedHandles];
  statusClient = self->_statusClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E56F8;
  v10[3] = &unk_100981C38;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [(IDSSKStatusClient *)statusClient removeAllInvitedHandlesWithCompletion:v10];
}

- (void)fetchStewieAvailabilityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to fetch Stewie availability", (uint8_t *)&v13, 2u);
  }

  unsigned int v6 = [(IDSDXPCOffGridStateManager *)self _isStewieAvailableForIML];
  if (v6) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = 0;
  }
  unsigned int v8 = [(IDSDXPCOffGridStateManager *)self _isStewieAvailableForSMS];
  uint64_t v9 = v8 | v6;
  if (v8) {
    uint64_t v10 = v7 | 0x20;
  }
  else {
    uint64_t v10 = v7;
  }
  id v11 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    int v13 = 138412546;
    CFStringRef v14 = v12;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetched Stewie availability: %@, services available: %ld", (uint8_t *)&v13, 0x16u);
  }

  if (v4) {
    v4[2](v4, v9, v10, 0);
  }
}

- (void)connectStewieWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to connect Stewie.", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E5A58;
  v7[3] = &unk_100981C60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(IDSDXPCOffGridStateManager *)self _stewieContextForPayloadKey:0 completion:v7];
}

- (void)disconnectStewieWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to disconnect Stewie", v6, 2u);
  }

  [(IDSDXPCOffGridStateManager *)self _exitStewieWithCompletion:v4];
}

- (void)_exitStewieWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(IDSStewieCTMessagingClient *)self->_ctMessagingClient isActiveForIML]
    || [(IDSStewieCTMessagingClient *)self->_ctMessagingClient isActiveForSMS])
  {
    uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting stewie", buf, 2u);
    }

    id v6 = objc_alloc_init((Class)CTStewieExitContext);
    [v6 setReason:4];
    ctClient = self->_ctClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E5D3C;
    v8[3] = &unk_100981C88;
    id v9 = v4;
    [(CoreTelephonyClient *)ctClient exitStewieWithContext:v6 completion:v8];
  }
  else
  {
    id v6 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10070FD58((id *)&self->_ctMessagingClient, v6);
    }
  }
}

- (void)_connectStewieWithContext:(id)a3 options:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting to connect Stewie.", buf, 2u);
  }

  ctClient = self->_ctClient;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E5F54;
  v16[3] = &unk_100981CB0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(CoreTelephonyClient *)ctClient requestStewieWithContext:v15 completion:v16];
}

- (void)_disableOffGridModeViaStatusClient
{
  if ([(IDSDXPCOffGridStateManager *)self _isDeviceOnline])
  {
    [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:1 publishStatus:0];
    statusClient = self->_statusClient;
    id v4 = [(IDSDXPCOffGridStateManager *)self _statusPayloadForOffGridMode:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E60E4;
    v6[3] = &unk_100981208;
    v6[4] = self;
    [(IDSSKStatusClient *)statusClient publishStatus:v4 completion:v6];
  }
  else
  {
    uint64_t v5 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10070FE10();
    }
  }
}

- (void)fetchContactsOfType:(int64_t)a3 phoneNumbersOnly:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client requested fetch contacts of types: %ld", (uint8_t *)&buf, 0xCu);
  }

  if ((a3 & 3) != 0 || !v8)
  {
    id v13 = +[NSMutableArray array];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    CFStringRef v28 = sub_1000E650C;
    __int16 v29 = sub_1000E651C;
    id v30 = 0;
    id v14 = dispatch_group_create();
    if ((a3 & 2) != 0)
    {
      id v15 = [(IDSDXPCOffGridStateManager *)self _fetchFamilyContactsWithPhoneNumbersOnly:v5];
      [v13 addObjectsFromArray:v15];
    }
    if (a3)
    {
      dispatch_group_enter(v14);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000E6524;
      v22[3] = &unk_100981CD8;
      p_long long buf = &buf;
      id v23 = v13;
      id v24 = v14;
      [(IDSDXPCOffGridStateManager *)self _fetchEmergencyContactsWithCompletion:v22];
    }
    uint64_t v16 = im_primary_queue();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E65A8;
    v18[3] = &unk_100981D00;
    id v19 = v13;
    id v21 = &buf;
    id v20 = v8;
    id v17 = v13;
    dispatch_group_notify(v14, v16, v18);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v10 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"No valid contact type provided.";
    id v11 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v12 = [v10 initWithDomain:IDSOffGridStateManagerErrorDomain code:0 userInfo:v11];
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v12);
  }
}

- (void)fetchContactsOfType:(int64_t)a3 completion:(id)a4
{
}

- (id)_fetchFamilyContactsWithPhoneNumbersOnly:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[NSMutableArray array];
  id v6 = [(IDSFamilyManager *)self->_familyManager familyHandles];
  id v7 = [v6 mutableCopy];

  id v8 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Completed fetch of family handles %@", buf, 0xCu);
  }

  id v9 = +[IDSDAccountController sharedInstance];
  id v10 = [v9 registeredLocalURIsOnService:IDSServiceNameiMessage];
  uint64_t v11 = +[NSSet setWithArray:v10];

  id v22 = (void *)v11;
  [v7 minusSet:v11];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (!v3 || IMStringIsPhoneNumber())
        {
          id v18 = objc_alloc((Class)IDSOffGridContactInfo);
          id v19 = +[IDSURI URIWithUnprefixedURI:v17];
          id v20 = [v18 initWithURI:v19 type:2];

          [v5 addObject:v20];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (void)_fetchEmergencyContactsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  hkMedicalIDStore = self->_hkMedicalIDStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E69CC;
  v9[3] = &unk_100981D28;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [(HKMedicalIDStore *)hkMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion:v9];
}

- (void)_scheduleOrClearOffGridResetTimerIfRequired
{
  if (self->_offGridMode == 1 && self->_publishStatus == 1)
  {
    [(IDSDXPCOffGridStateManager *)self _clearOffGridResetTimer];
  }
  else
  {
    [(IDSDXPCOffGridStateManager *)self _resetStateInterval];
    -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:](self, "_scheduleOffGridResetTimerWithInterval:");
  }
}

- (void)_scheduleOffGridResetTimerWithInterval:(double)a3
{
  [(IDSDXPCOffGridStateManager *)self _clearOffGridResetTimer];
  BOOL v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    double v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling a timer for resetting state if online for %fsec", buf, 0xCu);
  }

  id v6 = objc_alloc((Class)IMDispatchTimer);
  id v7 = im_primary_queue();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E6DC8;
  v10[3] = &unk_100980598;
  void v10[4] = self;
  id v8 = (IMDispatchTimer *)[v6 initWithQueue:v7 interval:(unint64_t)a3 repeats:0 handlerBlock:v10];
  stateResetTimer = self->_stateResetTimer;
  self->_stateResetTimer = v8;
}

- (void)_offGridResetTimerFired
{
  [(IMDispatchTimer *)self->_stateResetTimer invalidate];
  stateResetTimer = self->_stateResetTimer;
  self->_stateResetTimer = 0;

  id v4 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "reset state timer fired", buf, 2u);
  }

  BOOL v5 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6EB8;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_resetOffGridModeIfRequired
{
  BOOL v3 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    onlineSince = self->_onlineSince;
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)onlineSince;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "We are online since: %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_offGridMode == 1 && self->_publishStatus == 1)
  {
    BOOL v5 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = self->_onlineSince;
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Offgrid more is already disabled successfully, not attempting to reset. We are online since %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!self->_onlineSince || ![(IDSDXPCOffGridStateManager *)self _isDeviceOnline])
    {
      [(IDSDXPCOffGridStateManager *)self _resetStateInterval];
      -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:](self, "_scheduleOffGridResetTimerWithInterval:");
      return;
    }
    uint64_t v7 = [(IDSDXPCOffGridStateManager *)self _offGridModeDisableWhenOnlineForTimeInterval];
    BOOL v5 = +[NSDate dateWithTimeInterval:self->_onlineSince sinceDate:(double)v7];
    id v8 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reset time: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = +[NSDate now];
    id v10 = [v5 earlierDate:v9];

    if (v10 == v5)
    {
      id v11 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        uint64_t v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disabling offgrid mode as we were online for more than %ldsec", (uint8_t *)&v12, 0xCu);
      }

      [(IDSDXPCOffGridStateManager *)self _disableOffGridModeViaStatusClient];
    }
    else
    {
      [(IDSDXPCOffGridStateManager *)self _resetStateInterval];
      -[IDSDXPCOffGridStateManager _scheduleOffGridResetTimerWithInterval:](self, "_scheduleOffGridResetTimerWithInterval:");
    }
  }
}

- (void)_clearOffGridResetTimer
{
  stateResetTimer = self->_stateResetTimer;
  if (stateResetTimer)
  {
    [(IMDispatchTimer *)stateResetTimer invalidate];
    id v4 = self->_stateResetTimer;
    self->_stateResetTimer = 0;
  }
}

- (void)_calloutToDelegateWithUpdatedContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Contact infos changed - calling out to client delegate { updatedContacts: %@ }", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSMutableDictionary *)self->_clientRemoteObjects allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_clientRemoteObjects objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        [v11 contactInfoUpdated:v4];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_listenForContactsChangeNotifications
{
  BOOL v3 = (const char *)kHKMedicalIDEmergencyContactsDidChangeNotification;
  p_emergencyContactsNotificationToken = &self->_emergencyContactsNotificationToken;
  BOOL v5 = im_primary_queue();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000E7498;
  handler[3] = &unk_100980CE8;
  handler[4] = self;
  uint32_t v6 = notify_register_dispatch(v3, p_emergencyContactsNotificationToken, v5, handler);

  if (v6)
  {
    id v7 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10070FEBC(v6, v7);
    }
  }
  id v8 = im_primary_queue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E74A0;
  v11[3] = &unk_100980CE8;
  v11[4] = self;
  uint32_t v9 = notify_register_dispatch("com.apple.family.family_updated", &self->_familyContactsNotificationToken, v8, v11);

  if (v9)
  {
    id v10 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10070FE44(v9, v10);
    }
  }
}

- (void)_emergencyContactsDidChange
{
  BOOL v3 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified emergency contacts changed!", v4, 2u);
  }

  [(IDSDXPCOffGridStateManager *)self _contactsDidChange];
}

- (void)_familyContactsDidChange
{
  BOOL v3 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified family contacts changed!", v4, 2u);
  }

  [(IDSDXPCOffGridStateManager *)self _contactsDidChange];
}

- (void)_contactsDidChange
{
  [(IDSDXPCOffGridStateManager *)self _fetchFamilyContactsWithPhoneNumbersOnly:1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E763C;
  v4[3] = &unk_100981D50;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint32_t v6 = self;
  id v3 = v5;
  [(IDSDXPCOffGridStateManager *)self _fetchEmergencyContactsWithCompletion:v4];
}

- (void)_scheduleOffGridPayloadProvisioningTimerWithInterval:(double)a3 shouldForce:(BOOL)a4
{
  BOOL v4 = a4;
  provisionTimer = self->_provisionTimer;
  if (provisionTimer)
  {
    [(IMDispatchTimer *)provisionTimer invalidate];
    id v8 = self->_provisionTimer;
    self->_provisionTimer = 0;
  }
  uint32_t v9 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v4) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)long long buf = 134218242;
    double v18 = a3;
    __int16 v19 = 2112;
    CFStringRef v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduling a timer for provisioning payloads in: %fsec shouldForce %@", buf, 0x16u);
  }

  id v11 = objc_alloc((Class)IMDispatchTimer);
  long long v12 = im_primary_queue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E7838;
  v15[3] = &unk_100981D78;
  v15[4] = self;
  BOOL v16 = v4;
  long long v13 = (IMDispatchTimer *)[v11 initWithQueue:v12 interval:(unint64_t)a3 repeats:0 handlerBlock:v15];
  long long v14 = self->_provisionTimer;
  self->_provisionTimer = v13;
}

- (void)_offGridPayloadProvisioningTimerFiredShouldForce:(BOOL)a3
{
  [(IMDispatchTimer *)self->_provisionTimer invalidate];
  provisionTimer = self->_provisionTimer;
  self->_provisionTimer = 0;

  uint32_t v6 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Payload provisioning timer fired", buf, 2u);
  }

  id v7 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E7940;
  v8[3] = &unk_10097E8D8;
  void v8[4] = self;
  BOOL v9 = a3;
  dispatch_async(v7, v8);
}

- (BOOL)_isExpiredProvisionedPayload:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSDate now];
  id v5 = [v3 validUntil];
  uint32_t v6 = [v4 laterDate:v5];
  unsigned int v7 = [v6 isEqualToDate:v4];

  if (v7)
  {
    id v8 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      long long v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Provisioned payload is expired. { provisionedPayload: %@, currentDate: %@ }", (uint8_t *)&v10, 0x16u);
    }
  }
  return v7;
}

- (BOOL)_shouldProvisionOffGridPayloads
{
  if (!self->_provisionRequestInProgress)
  {
    id v5 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"provisioned-payloads"];
    v2 = v5;
    if (v5 && [v5 count])
    {
      uint32_t v6 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"sent-payload-id"];
      unsigned int v7 = v6;
      if (!v6 || ![v6 count])
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        BOOL v9 = v2;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if (-[IDSDXPCOffGridStateManager _isExpiredProvisionedPayload:](self, "_isExpiredProvisionedPayload:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
              {
                long long v14 = +[IDSFoundationLog IDSOffGridStateManager];
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "We have an expired payload, should reprovision", buf, 2u);
                }

                goto LABEL_26;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        BOOL v3 = 0;
        goto LABEL_27;
      }
      id v8 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We've sent a payload, should reprovision.", buf, 2u);
      }
    }
    else
    {
      unsigned int v7 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We currently have no payloads provisioned, need to provision.", buf, 2u);
      }
    }
LABEL_26:
    BOOL v3 = 1;
LABEL_27:

    goto LABEL_28;
  }
  v2 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "We already have a request in progress, should not reprovision.", buf, 2u);
  }
  BOOL v3 = 0;
LABEL_28:

  return v3;
}

- (void)_provisionOffGridPayloadsShouldForce:(BOOL)a3
{
  id v5 = (objc_class *)IMWeakLinkClass();
  if (a3 || [(IDSDXPCOffGridStateManager *)self _shouldProvisionOffGridPayloads])
  {
    [(IDSDXPCOffGridStateManager *)self _markProvisionRequestInProgress];
    uint32_t v6 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"sent-payload-id"];
    unsigned int v7 = v6;
    if (v6 && ![v6 count])
    {
      id v8 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We haven't sent any of our payloads yet.", buf, 2u);
      }
    }
    BOOL v9 = +[NSDate now];
    [(IDSDXPCOffGridStateManager *)self _payloadValidityDuration];
    id v10 = objc_msgSend(v9, "dateByAddingTimeInterval:");
    id v11 = objc_alloc_init((Class)NSMutableArray);
    unint64_t v12 = [(IDSDXPCOffGridStateManager *)self _payloadCount];
    unint64_t v27 = [(IDSDXPCOffGridStateManager *)self _payloadCountPerDuration];
    unint64_t v28 = v12;
    long long v26 = v7;
    if (v12)
    {
      uint64_t v13 = 0;
      do
      {
        for (unint64_t i = v27; i; --i)
        {
          id v15 = [v5 alloc];
          long long v16 = [(IDSDXPCOffGridStateManager *)self _statusPayloadForOffGridMode:2];
          id v17 = [v15 initWithStatusPayload:v16 validFrom:v9 validUntil:v10];

          [v11 addObject:v17];
          id v18 = [v5 alloc];
          long long v19 = [(IDSDXPCOffGridStateManager *)self _statusPayloadForOffGridMode:1];
          id v20 = [v18 initWithStatusPayload:v19 validFrom:v9 validUntil:v10];

          [v11 addObject:v20];
        }
        [(IDSDXPCOffGridStateManager *)self _payloadValidityShift];
        id v21 = objc_msgSend(v9, "dateByAddingTimeInterval:");

        [(IDSDXPCOffGridStateManager *)self _payloadValidityShift];
        id v22 = objc_msgSend(v10, "dateByAddingTimeInterval:");

        ++v13;
        id v10 = v22;
        BOOL v9 = v21;
      }
      while (v13 != v28);
    }
    else
    {
      id v21 = v9;
      id v22 = v10;
    }
    objc_msgSend(v11, "im_shuffle");
    statusClient = self->_statusClient;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000E804C;
    v29[3] = &unk_100981D50;
    v29[4] = self;
    id v30 = v11;
    id v24 = v11;
    [(IDSSKStatusClient *)statusClient provisionStatusPayload:v24 completion:v29];

    long long v25 = v26;
  }
  else
  {
    long long v25 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Don't need to provision new payloads.", buf, 2u);
    }
  }
}

- (void)_markProvisionRequestInProgress
{
  p_provisionLock = &self->_provisionLock;
  os_unfair_lock_lock(&self->_provisionLock);
  self->_provisionRequestInProgress = 1;

  os_unfair_lock_unlock(p_provisionLock);
}

- (void)_markProvisionRequestCompleted
{
  p_provisionLock = &self->_provisionLock;
  os_unfair_lock_lock(&self->_provisionLock);
  self->_provisionRequestInProgress = 0;

  os_unfair_lock_unlock(p_provisionLock);
}

- (void)_updateOffGridConnectActionWithPayloadKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_offGridConnectActionLock);
  if (v4)
  {
    id v5 = (NSData *)v4;
    int64_t v6 = 1;
  }
  else
  {
    id v5 = 0;
    int64_t v6 = 0;
  }
  payloadKeyToSendOnIMLConnect = self->_payloadKeyToSendOnIMLConnect;
  self->_payloadKeyToSendOnIMLConnect = v5;

  self->_int64_t offGridConnectAction = v6;
  id v8 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_payloadKeyToSendOnIMLConnect;
    int64_t offGridConnectAction = self->_offGridConnectAction;
    int v11 = 134218242;
    int64_t v12 = offGridConnectAction;
    __int16 v13 = 2112;
    long long v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updated OffGrid connect action to %ld for payloadKey %@", (uint8_t *)&v11, 0x16u);
  }

  os_unfair_lock_unlock(&self->_offGridConnectActionLock);
}

- (void)_markPayloadAsSentForDecryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"provisioned-payloads"];
  int64_t v6 = v5;
  if (!v4 || !v5 || ![v5 count])
  {
    unsigned int v7 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not find payload with decryption key %@", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  id v10 = v8;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
LABEL_9:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v8);
      }
      long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "decryptionKey", (void)v22);
      unsigned __int8 v16 = [v15 isEqualToData:v4];

      if (v16) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          goto LABEL_9;
        }
        id v10 = v8;
        goto LABEL_22;
      }
    }
    id v10 = [v14 identifier];

    if (!v10) {
      goto LABEL_23;
    }
    id v17 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Saving sent payload identifier %@", buf, 0xCu);
    }

    id v18 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"sent-payload-id"];
    id v19 = [v18 mutableCopy];

    if (!v19) {
      id v19 = objc_alloc_init((Class)NSMutableSet);
    }
    [v19 addObject:v10];
    persistentMap = self->_persistentMap;
    id v21 = [v19 copy];
    [(IDSPersistentMap *)persistentMap setObject:v21 forKey:@"sent-payload-id"];
  }
LABEL_22:

LABEL_23:
}

- (id)_getDecryptionKeyForProvisionedPayloadWithStatus:(int64_t)a3
{
  BOOL v3 = self;
  persistentMap = self->_persistentMap;
  if (persistentMap)
  {
    int64_t v6 = [(IDSPersistentMap *)persistentMap objectForKey:@"provisioned-payloads"];
    unsigned int v7 = v6;
    if (v6 && [v6 count])
    {
      NSErrorUserInfoKey v31 = [(IDSPersistentMap *)v3->_persistentMap objectForKey:@"sent-payload-id"];
      if (!v31) {
        NSErrorUserInfoKey v31 = objc_alloc_init((Class)NSSet);
      }
      id v8 = +[NSDate now];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v30 = v7;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v42;
        int64_t v37 = a3;
        CFStringRef v38 = v8;
        unsigned int v35 = v9;
        id v36 = v3;
        uint64_t v39 = *(void *)v42;
LABEL_8:
        uint64_t v13 = 0;
        id v40 = v11;
        while (1)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
          id v15 = [v14 statusPayload];
          if ([(IDSDXPCOffGridStateManager *)v3 _offGridStatusFromStatusPayload:v15] == a3)
          {
            unsigned __int8 v16 = [v14 validFrom];
            id v17 = [v16 earlierDate:v8];
            id v18 = [v14 validFrom];
            if (v17 == v18)
            {
              [(IDSDXPCOffGridStateManager *)v3 _payloadValidityRequirement];
              id v19 = objc_msgSend(v8, "dateByAddingTimeInterval:");
              id v20 = [v14 validUntil];
              id v21 = [v19 laterDate:v20];
              long long v22 = [v14 validUntil];
              if (v21 == v22)
              {
                uint64_t v23 = [v14 decryptionKey];
                if (v23)
                {
                  dispatch_queue_t v33 = (void *)v23;
                  CFStringRef v32 = [v14 identifier];
                  unsigned __int8 v34 = [v31 containsObject:v32];

                  a3 = v37;
                  id v8 = v38;
                  id v9 = v35;
                  BOOL v3 = v36;
                  uint64_t v12 = v39;
                  id v11 = v40;
                  if ((v34 & 1) == 0)
                  {
                    unint64_t v27 = +[IDSFoundationLog IDSOffGridStateManager];
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      int64_t v46 = v14;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Found a valid payload: %@", buf, 0xCu);
                    }

                    long long v25 = v14;
                    if (v25)
                    {
                      long long v26 = [v25 decryptionKey];
                      goto LABEL_36;
                    }
                    goto LABEL_25;
                  }
                  goto LABEL_17;
                }
              }
              a3 = v37;
              id v8 = v38;
              id v9 = v35;
              BOOL v3 = v36;
            }

            uint64_t v12 = v39;
            id v11 = v40;
          }

LABEL_17:
          if (v11 == (id)++v13)
          {
            id v24 = [v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
            id v11 = v24;
            if (v24) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

LABEL_25:
      long long v25 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10070FFE0();
      }
      long long v26 = 0;
LABEL_36:
      unsigned int v7 = v30;
    }
    else
    {
      NSErrorUserInfoKey v31 = +[IDSFoundationLog IDSOffGridStateManager];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10070FFAC();
      }
      long long v26 = 0;
    }
  }
  else
  {
    long long v26 = 0;
  }

  return v26;
}

- (BOOL)_isStewieAvailableForIML
{
  unsigned int v3 = [(IDSDXPCOffGridStateManager *)self _isIMLRegistered];
  if (v3)
  {
    if ([(IDSStewieCTMessagingClient *)self->_ctMessagingClient isAvailableForIML])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      ctMessagingClient = self->_ctMessagingClient;
      LOBYTE(v3) = [(IDSStewieCTMessagingClient *)ctMessagingClient isActiveForIML];
    }
  }
  return v3;
}

- (BOOL)_isStewieAvailableForSMS
{
  if ([(IDSStewieCTMessagingClient *)self->_ctMessagingClient isAvailableForSMS]) {
    return 1;
  }
  ctMessagingClient = self->_ctMessagingClient;

  return [(IDSStewieCTMessagingClient *)ctMessagingClient isActiveForSMS];
}

- (BOOL)_needsToRequestForStewie
{
  if ([(IDSDXPCOffGridStateManager *)self _needsToRequestForIML]) {
    return 1;
  }

  return [(IDSDXPCOffGridStateManager *)self _needsToRequestForSMS];
}

- (BOOL)_needsToRequestForSMS
{
  if ([(IDSStewieCTMessagingClient *)self->_ctMessagingClient isActiveForSMS]) {
    return 0;
  }
  ctMessagingClient = self->_ctMessagingClient;

  return [(IDSStewieCTMessagingClient *)ctMessagingClient isAvailableForSMS];
}

- (BOOL)_isIMLRegistered
{
  v2 = +[IDSDServiceController sharedInstance];
  unsigned int v3 = [v2 serviceWithIdentifier:IDSServiceNameiMessageLite];

  id v4 = +[IDSDAccountController sharedInstance];
  id v5 = [v4 registeredAccountsOnService:v3];

  if (v5)
  {
    int64_t v6 = [v5 firstObject];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_needsToRequestForIML
{
  return [(IDSDXPCOffGridStateManager *)self _isIMLRegistered]
      && ![(IDSStewieCTMessagingClient *)self->_ctMessagingClient isActiveForIML]
      && [(IDSStewieCTMessagingClient *)self->_ctMessagingClient isAvailableForIML];
}

- (BOOL)_isConnectedForIML
{
  unsigned int v3 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isStewieConnectedForIML) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "isConnectedForIML %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_isStewieConnectedForIML;
}

- (void)_stewieContextForPayloadKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)CTStewieRequestContext);
  objc_msgSend(v7, "setReason:", -[IDSDXPCOffGridStateManager _getRequestReason](self, "_getRequestReason"));
  id v8 = +[NSMutableDictionary dictionary];
  if (a3 && ([v7 reason] == (id)8 || objc_msgSend(v7, "reason") == (id)9)) {
    CFDictionarySetValue(v8, kCTStewieRequestWaitForOffGridModeMessage, &__kCFBooleanTrue);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E8F08;
  v12[3] = &unk_100981DA0;
  uint64_t v13 = v8;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  [(IDSDXPCOffGridStateManager *)self _areAllPrimaryContactsIMLReachableWithCompletion:v12];
}

- (int64_t)_getRequestReason
{
  if ([(IDSDXPCOffGridStateManager *)self _needsToRequestForIML]
    && [(IDSDXPCOffGridStateManager *)self _needsToRequestForSMS])
  {
    int64_t v3 = 8;
  }
  else if ([(IDSDXPCOffGridStateManager *)self _needsToRequestForIML])
  {
    int64_t v3 = 9;
  }
  else if ([(IDSDXPCOffGridStateManager *)self _needsToRequestForSMS])
  {
    int64_t v3 = 10;
  }
  else
  {
    int64_t v3 = 0;
  }
  CFStringRef v4 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = CTStewieRequestReasonAsString();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request reason %s", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_errorForDeviceOffline
{
  id v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Device is not connected to the internet", NSLocalizedDescriptionKey, 0);
  id v3 = objc_alloc((Class)NSError);
  id v4 = [v3 initWithDomain:IDSOffGridStatusErrorDomain code:8 userInfo:v2];

  return v4;
}

- (id)_errorForNoProvisionedPayload
{
  id v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"No provisioned key for offgrid provisioned payload.", NSLocalizedDescriptionKey, 0);
  id v3 = objc_alloc((Class)NSError);
  id v4 = [v3 initWithDomain:IDSOffGridStatusErrorDomain code:5 userInfo:v2];

  return v4;
}

- (id)_errorForInvalidState
{
  id v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Invalid state requested.", NSLocalizedDescriptionKey, 0);
  id v3 = objc_alloc((Class)NSError);
  id v4 = [v3 initWithDomain:IDSOffGridStatusErrorDomain code:7 userInfo:v2];

  return v4;
}

- (id)_errorForStewieNotAvailable
{
  id v2 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Stewie is not available.", NSLocalizedDescriptionKey, 0);
  id v3 = objc_alloc((Class)NSError);
  id v4 = [v3 initWithDomain:IDSOffGridStatusErrorDomain code:1 userInfo:v2];

  return v4;
}

- (void)_reportOffGridModeMetricWithPreviousMode:(int64_t)a3 currentMode:(int64_t)a4 previousPublishStatus:(int64_t)a5 currentPublishStatus:(int64_t)a6 previousStewieConnectionStatus:(BOOL)a7 currentStewieConnectionStatus:(BOOL)a8 previousNetworkConnectionStatus:(BOOL)a9 currentNetworkConnectionStatus:(BOOL)a10 duration:(double)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  id v18 = objc_alloc((Class)IDSOffTheGridModeMetric);
  id v19 = +[NSNumber numberWithInteger:a3];
  id v20 = +[NSNumber numberWithInteger:a4];
  id v21 = +[NSNumber numberWithInteger:a5];
  long long v22 = +[NSNumber numberWithInteger:a6];
  uint64_t v23 = +[NSNumber numberWithDouble:a11];
  LOWORD(v29) = __PAIR16__(a10, a9);
  id v24 = objc_msgSend(v18, "initWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionState:currentStewieConnectionState:previousNetworkConnectionState:currentNetworkConnectionState:duration:", v19, v20, v21, v22, v13, v12, v29, v23);

  long long v25 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = [v24 name];
    unint64_t v27 = [v24 dictionaryRepresentation];
    *(_DWORD *)long long buf = 138412546;
    NSErrorUserInfoKey v31 = v26;
    __int16 v32 = 2112;
    dispatch_queue_t v33 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Metrics: Reporting %@ with %@", buf, 0x16u);
  }
  id v28 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v28 logMetric:v24];
}

- (void)_reportOffGridEntryMetricWithService:(int64_t)a3 source:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = objc_alloc((Class)IDSOffGridEntryMetric);
  id v9 = +[NSNumber numberWithInteger:a3];
  id v10 = +[NSDate now];
  id v12 = [v8 initWithService:v9 source:v7 date:v10 success:v5];

  id v11 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v11 logMetric:v12];
}

- (void)_areAllPrimaryContactsIMLReachableWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E9640;
  v5[3] = &unk_100981DC8;
  id v6 = a3;
  id v4 = v6;
  [(IDSDXPCOffGridStateManager *)self fetchContactsOfType:3 completion:v5];
}

- (void)_scheduleClearSendOnConnectTimer
{
  clearSendKeyOnConnectTimer = self->_clearSendKeyOnConnectTimer;
  if (clearSendKeyOnConnectTimer)
  {
    [(IMDispatchTimer *)clearSendKeyOnConnectTimer invalidate];
    id v4 = self->_clearSendKeyOnConnectTimer;
    self->_clearSendKeyOnConnectTimer = 0;
  }
  [(IDSDXPCOffGridStateManager *)self _clearSendKeyOnConnectInterval];
  double v6 = v5;
  id v7 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    double v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduling a timer for clearSendKeyOnConnectTimer in: %f", buf, 0xCu);
  }

  id v8 = objc_alloc((Class)IMDispatchTimer);
  id v9 = im_primary_queue();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E99BC;
  v12[3] = &unk_100980598;
  void v12[4] = self;
  id v10 = (IMDispatchTimer *)[v8 initWithQueue:v9 interval:(unint64_t)v6 repeats:0 handlerBlock:v12];
  id v11 = self->_clearSendKeyOnConnectTimer;
  self->_clearSendKeyOnConnectTimer = v10;
}

- (void)_clearSendKeyOnConnectTimerFired
{
  [(IMDispatchTimer *)self->_clearSendKeyOnConnectTimer invalidate];
  clearSendKeyOnConnectTimer = self->_clearSendKeyOnConnectTimer;
  self->_clearSendKeyOnConnectTimer = 0;

  id v4 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "clearSendPayloadKeyOnConnectTimer fired", buf, 2u);
  }

  double v5 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9AAC;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_clearSendKeyOnConnect
{
  if (self->_payloadKeyToSendOnIMLConnect)
  {
    id v3 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100710014();
    }

    id v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Timed out while sending provisioned key on IML connect", NSLocalizedDescriptionKey, 0);
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:IDSOffGridStatusErrorDomain code:6 userInfo:v4];
    [(IDSDXPCOffGridStateManager *)self _updateOffGridConnectActionWithPayloadKey:0];
    [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:self->_offGridMode publishStatus:2];
    [(IDSDXPCOffGridStateManager *)self _updateClientsWithCurrentStateAndError:v6];
  }
}

- (void)_updateClientsWithCurrentStateAndError:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t offGridMode = self->_offGridMode;
    int64_t publishStatus = self->_publishStatus;
    *(_DWORD *)long long buf = 134218240;
    int64_t v20 = offGridMode;
    __int16 v21 = 2048;
    int64_t v22 = publishStatus;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating clients: Current OffGrid Mode: {%ld} Publish Status: {%ld}", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(NSMutableDictionary *)self->_clientRemoteObjects allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = [(NSMutableDictionary *)self->_clientRemoteObjects objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        [v13 offGridModeUpdated:self->_offGridMode publishStatus:self->_publishStatus error:v4];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)_isDeviceOnline
{
  return [(IMNetworkConnectionMonitor *)self->_connectionMonitor isImmediatelyReachable];
}

- (void)statusClient:(id)a3 publishRequestCompletedForStatusPayload:(id)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  int64_t v9 = [(IDSDXPCOffGridStateManager *)self _offGridStatusFromStatusPayload:a4];
  if (v10 || !v6 || !v9) {
    [(IDSDXPCOffGridStateManager *)self _setAndPersistOffGridMode:self->_offGridMode publishStatus:2];
  }
  [(IDSDXPCOffGridStateManager *)self _updateClientsWithCurrentStateAndError:v10];
}

- (void)availabilityChangedForIML:(BOOL)a3
{
  int v3 = a3;
  id v5 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    if (self->_payloadKeyToSendOnIMLConnect) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v21 = v7;
    __int16 v22 = 2112;
    CFStringRef v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "availabilityChangedForIML %@, has key to send %@", buf, 0x16u);
  }

  int isStewieConnectedForIML = self->_isStewieConnectedForIML;
  self->_int isStewieConnectedForIML = v3;
  clearSendKeyOnConnectTimer = self->_clearSendKeyOnConnectTimer;
  if (clearSendKeyOnConnectTimer)
  {
    [(IMDispatchTimer *)clearSendKeyOnConnectTimer invalidate];
    id v10 = self->_clearSendKeyOnConnectTimer;
    self->_clearSendKeyOnConnectTimer = 0;
  }
  if (self->_offGridConnectAction == 1) {
    [(IDSDXPCOffGridStateManager *)self _sendOffGridStatusDecryptionKey];
  }
  if (isStewieConnectedForIML != v3)
  {
    uint64_t v11 = +[NSDate now];
    id v12 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-metric-state-changed-date"];
    if (v12)
    {
      [v11 timeIntervalSinceDate:v12];
      double v14 = v13;
    }
    else
    {
      double v14 = 0.0;
    }
    int64_t offGridMode = self->_offGridMode;
    int64_t publishStatus = self->_publishStatus;
    BOOL v17 = self->_isStewieConnectedForIML;
    unsigned __int8 v18 = [(IDSDXPCOffGridStateManager *)self _isDeviceOnline];
    BYTE1(v19) = [(IDSDXPCOffGridStateManager *)self _isDeviceOnline];
    LOBYTE(v19) = v18;
    -[IDSDXPCOffGridStateManager _reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:](self, "_reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:", offGridMode, offGridMode, publishStatus, publishStatus, isStewieConnectedForIML != 0, v17, v14, v19);
    [(IDSPersistentMap *)self->_persistentMap setObject:v11 forKey:@"latest-metric-state-changed-date"];
  }
}

- (void)_sendOffGridStatusDecryptionKey
{
  ctMessagingClient = self->_ctMessagingClient;
  payloadKeyToSendOnIMLConnect = self->_payloadKeyToSendOnIMLConnect;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EA02C;
  v4[3] = &unk_10097E688;
  void v4[4] = self;
  [(IDSStewieCTMessagingClient *)ctMessagingClient sendOffGridStatusDecryptionKey:payloadKeyToSendOnIMLConnect completion:v4];
}

- (id)_statusPayloadForOffGridMode:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithInteger:a3];
  [v4 setObject:v5 forKey:IDSOffGridStatusPayloadStatusKey];

  CFStringRef v6 = +[IDSPushHandler sharedInstance];
  CFStringRef v7 = [v6 pushToken];

  if (v7)
  {
    id v8 = v7;
    CFDictionarySetValue((CFMutableDictionaryRef)v4, IDSOffGridStatusPayloadStatusTokenKey, v8);
  }
  else
  {
    int64_t v9 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100710048();
    }
  }
  id v10 = [objc_alloc((Class)IMWeakLinkClass()) initWithDictionary:v4];

  return v10;
}

- (int64_t)_offGridStatusFromStatusPayload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v5 = [v3 payloadDictionary];
  if (!v5) {
    goto LABEL_5;
  }
  CFStringRef v6 = (void *)v5;
  CFStringRef v7 = [v4 payloadDictionary];
  id v8 = [v7 allKeys];
  uint64_t v9 = IDSOffGridStatusPayloadStatusKey;
  unsigned __int8 v10 = [v8 containsObject:IDSOffGridStatusPayloadStatusKey];

  if (v10)
  {
    uint64_t v11 = [v4 payloadDictionary];
    id v12 = [v11 objectForKey:v9];
    id v13 = [v12 integerValue];
  }
  else
  {
LABEL_5:
    double v14 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10071007C((uint64_t)v4, v14);
    }

    id v13 = 0;
  }

  return (int64_t)v13;
}

- (double)_payloadValidityDuration
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-status-payload-validity-sec"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 5184000.0;
  }

  return v5;
}

- (double)_payloadValidityShift
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-status-publish-expiration-sec"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2592000.0;
  }

  return v5;
}

- (double)_payloadValidityRequirement
{
  [(IDSDXPCOffGridStateManager *)self _payloadValidityShift];
  return v2 + -1.0;
}

- (unint64_t)_payloadCount
{
  unint64_t v2 = 1;
  id v3 = +[IDSServerBag sharedInstanceForBagType:1];
  double v4 = [v3 objectForKey:@"shared-channels-cp-status-payload-intervals"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v2 = (unint64_t)[v4 integerValue];
  }

  return v2;
}

- (unint64_t)_payloadCountPerDuration
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-status-payloads-per-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v4 = 5;
  }

  return v4;
}

- (double)_successfulProvisionInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-successful-provision-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2592000.0;
  }

  return v5;
}

- (double)_failedProvisionInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-failed-provision-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 600.0;
  }

  return v5;
}

- (double)_resetStateInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-reset-state-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 300.0;
  }

  return v5;
}

- (double)_clearSendKeyOnConnectInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-send-key-on-connect-interval"];

  objc_opt_class();
  double v4 = 10.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (double)_statePersistenceTimeInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-state-persistence-time-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2592000.0;
  }

  return v5;
}

- (double)_provisionOnInviteDebounceTimeInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-provision-on-invitation-debounce-delay-time-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 120.0;
  }

  return v5;
}

- (int64_t)_offGridModeDisableWhenOnlineForTimeInterval
{
  unint64_t v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-cp-disable-when-online-interval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 900;
  }
  if (+[IMUserDefaults offGridModeDisableWhenOnlineForTimeInterval](IMUserDefaults, "offGridModeDisableWhenOnlineForTimeInterval") >= 1)int64_t v4 = +[IMUserDefaults offGridModeDisableWhenOnlineForTimeInterval]; {

  }
  return v4;
}

- (void)connectionMonitorDidUpdate:(id)a3
{
  unsigned int v4 = [a3 isImmediatelyReachable];
  onlineSince = self->_onlineSince;
  if (v4)
  {
    if (onlineSince) {
      goto LABEL_6;
    }
    CFStringRef v6 = +[NSDate now];
    onlineSince = self->_onlineSince;
  }
  else
  {
    CFStringRef v6 = 0;
  }
  self->_onlineSince = v6;

LABEL_6:
  if (self->_isConnected == v4)
  {
    char v7 = v4 ^ 1;
  }
  else
  {
    id v8 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (v4) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connectionMonitorDidUpdate : %@", buf, 0xCu);
    }

    self->_isConnected = v4;
    unsigned __int8 v10 = +[NSDate now];
    uint64_t v11 = [(IDSPersistentMap *)self->_persistentMap objectForKey:@"latest-metric-state-changed-date"];
    if (v11) {
      [v10 timeIntervalSinceDate:v11];
    }
    else {
      double v12 = 0.0;
    }
    char v7 = v4 ^ 1;
    BYTE1(v16) = v4;
    LOBYTE(v16) = v4 ^ 1;
    -[IDSDXPCOffGridStateManager _reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:](self, "_reportOffGridModeMetricWithPreviousMode:currentMode:previousPublishStatus:currentPublishStatus:previousStewieConnectionStatus:currentStewieConnectionStatus:previousNetworkConnectionStatus:currentNetworkConnectionStatus:duration:", self->_offGridMode, self->_offGridMode, self->_publishStatus, self->_publishStatus, self->_isStewieConnectedForIML, self->_isStewieConnectedForIML, v12, v16);
    [(IDSPersistentMap *)self->_persistentMap setObject:v10 forKey:@"latest-metric-state-changed-date"];
  }
  id v13 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v14 = [v13 isSystemLocked];

  if ((v14 & 1) == 0 && (v7 & 1) == 0 && self->_offGridMode == 2)
  {
    long long v15 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Disabling offgrid mode post unlock", buf, 2u);
    }

    [(IDSDXPCOffGridStateManager *)self _disableOffGridModeViaStatusClient];
  }
  if (v4) {
    [(IDSDXPCOffGridStateManager *)self _provisionOffGridPayloadsShouldForce:0];
  }
}

- (void)systemDidUnlock
{
  id v3 = +[IDSFoundationLog IDSOffGridStateManager];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System did unlock.", (uint8_t *)&v7, 2u);
  }

  if ([(IDSDXPCOffGridStateManager *)self _isDeviceOnline]
    && (self->_offGridMode != 1 || self->_publishStatus != 1))
  {
    unsigned int v4 = +[IDSFoundationLog IDSOffGridStateManager];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t offGridMode = self->_offGridMode;
      int64_t publishStatus = self->_publishStatus;
      int v7 = 134218240;
      int64_t v8 = offGridMode;
      __int16 v9 = 2048;
      int64_t v10 = publishStatus;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling offgrid mode post unlock for current state: {Mode:%ld PublishStatus:%ld}", (uint8_t *)&v7, 0x16u);
    }

    [(IDSDXPCOffGridStateManager *)self _disableOffGridModeViaStatusClient];
  }
}

- (void)_registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000EAE2C;
  v3[3] = &unk_100981DF0;
  objc_copyWeak(&v4, &location);
  unint64_t v2 = im_primary_queue();
  sub_1003319E8(v3, @"IDS-OffGrid-State-Manager", (uint64_t)v2);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (IDSStewieCTMessagingClient)ctMessagingClient
{
  return self->_ctMessagingClient;
}

- (void)setCtMessagingClient:(id)a3
{
}

- (HKMedicalIDStore)hkMedicalIDStore
{
  return self->_hkMedicalIDStore;
}

- (void)setHkMedicalIDStore:(id)a3
{
}

- (IDSFamilyManager)familyManager
{
  return self->_familyManager;
}

- (void)setFamilyManager:(id)a3
{
}

- (IDSSKStatusClient)statusClient
{
  return self->_statusClient;
}

- (void)setStatusClient:(id)a3
{
}

- (IMNetworkConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (int64_t)offGridMode
{
  return self->_offGridMode;
}

- (void)setOffGridMode:(int64_t)a3
{
  self->_int64_t offGridMode = a3;
}

- (int64_t)publishStatus
{
  return self->_publishStatus;
}

- (void)setPublishStatus:(int64_t)a3
{
  self->_int64_t publishStatus = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSDate)onlineSince
{
  return self->_onlineSince;
}

- (void)setOnlineSince:(id)a3
{
}

- (IMDispatchTimer)stateResetTimer
{
  return self->_stateResetTimer;
}

- (void)setStateResetTimer:(id)a3
{
}

- (BOOL)isStewieConnectedForIML
{
  return self->_isStewieConnectedForIML;
}

- (void)setIsStewieConnectedForIML:(BOOL)a3
{
  self->_int isStewieConnectedForIML = a3;
}

- (os_unfair_lock_s)publishLock
{
  return self->_publishLock;
}

- (void)setPublishLock:(os_unfair_lock_s)a3
{
  self->_publishLock = a3;
}

- (BOOL)provisionRequestInProgress
{
  return self->_provisionRequestInProgress;
}

- (void)setProvisionRequestInProgress:(BOOL)a3
{
  self->_provisionRequestInProgress = a3;
}

- (os_unfair_lock_s)provisionLock
{
  return self->_provisionLock;
}

- (void)setProvisionLock:(os_unfair_lock_s)a3
{
  self->_provisionLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)clientRemoteObjects
{
  return self->_clientRemoteObjects;
}

- (void)setClientRemoteObjects:(id)a3
{
}

- (IMDispatchTimer)provisionTimer
{
  return self->_provisionTimer;
}

- (void)setProvisionTimer:(id)a3
{
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (NSDate)lastProvisionTime
{
  return self->_lastProvisionTime;
}

- (void)setLastProvisionTime:(id)a3
{
}

- (NSError)lastProvisionError
{
  return self->_lastProvisionError;
}

- (void)setLastProvisionError:(id)a3
{
}

- (IMDispatchTimer)clearSendKeyOnConnectTimer
{
  return self->_clearSendKeyOnConnectTimer;
}

- (void)setClearSendKeyOnConnectTimer:(id)a3
{
}

- (NSData)payloadKeyToSendOnIMLConnect
{
  return self->_payloadKeyToSendOnIMLConnect;
}

- (void)setPayloadKeyToSendOnIMLConnect:(id)a3
{
}

- (int64_t)offGridConnectAction
{
  return self->_offGridConnectAction;
}

- (void)setOffGridConnectAction:(int64_t)a3
{
  self->_int64_t offGridConnectAction = a3;
}

- (os_unfair_lock_s)offGridConnectActionLock
{
  return self->_offGridConnectActionLock;
}

- (void)setOffGridConnectActionLock:(os_unfair_lock_s)a3
{
  self->_offGridConnectActionLock = a3;
}

- (int)emergencyContactsNotificationToken
{
  return self->_emergencyContactsNotificationToken;
}

- (void)setEmergencyContactsNotificationToken:(int)a3
{
  self->_emergencyContactsNotificationToken = a3;
}

- (int)familyContactsNotificationToken
{
  return self->_familyContactsNotificationToken;
}

- (void)setFamilyContactsNotificationToken:(int)a3
{
  self->_familyContactsNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadKeyToSendOnIMLConnect, 0);
  objc_storeStrong((id *)&self->_clearSendKeyOnConnectTimer, 0);
  objc_storeStrong((id *)&self->_lastProvisionError, 0);
  objc_storeStrong((id *)&self->_lastProvisionTime, 0);
  objc_storeStrong((id *)&self->_persistentMap, 0);
  objc_storeStrong((id *)&self->_provisionTimer, 0);
  objc_storeStrong((id *)&self->_clientRemoteObjects, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateResetTimer, 0);
  objc_storeStrong((id *)&self->_onlineSince, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_statusClient, 0);
  objc_storeStrong((id *)&self->_familyManager, 0);
  objc_storeStrong((id *)&self->_hkMedicalIDStore, 0);
  objc_storeStrong((id *)&self->_ctMessagingClient, 0);

  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end