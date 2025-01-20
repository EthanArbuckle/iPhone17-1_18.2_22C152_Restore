@interface IDSDXPCPairing
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDXPCPairing)initWithQueue:(id)a3 idsDaemon:(id)a4 serviceController:(id)a5 pairingManager:(id)a6 quickSwitchHelper:(id)a7 accountController:(id)a8 utunController:(id)a9 utunDeliveryController:(id)a10;
- (IDSDaemon)idsDaemon;
- (IDSPairingManager)pairingManager;
- (IDSQuickSwitchHelper)quickSwitchHelper;
- (IDSUTunController)utunController;
- (IDSUTunDeliveryController)utunDeliveryController;
- (OS_dispatch_queue)queue;
- (id)_pairedDeviceCBUUIDs;
- (id)_pairingDeviceCBUUIDs;
- (id)_sortedArrayFromCBUUIDSet:(id)a3;
- (void)_addPairedDevice:(id)a3 withInfo:(id)a4 completion:(id)a5;
- (void)_updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5;
- (void)addPairedDevice:(id)a3 completion:(id)a4;
- (void)addPairedDeviceWithInfo:(id)a3 completion:(id)a4;
- (void)connectPairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)deletePairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)disconnectActivePairedDevice:(id)a3;
- (void)dropAllMessagesWithoutAnyAllowedClassifierForDevice:(id)a3 completion:(id)a4;
- (void)forgetDeviceWithID:(id)a3 completion:(id)a4;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)getPairingDevicesWithCompletion:(id)a3;
- (void)getPairingRecordsWithCompletion:(id)a3;
- (void)pairedDevicesInfo:(id)a3;
- (void)redeliverMessagesForDevice:(id)a3 completion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setAllowedTrafficClassifiersForDevice:(id)a3 classifiers:(id)a4 completion:(id)a5;
- (void)setIdsDaemon:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQuickSwitchHelper:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setUtunController:(id)a3;
- (void)setUtunDeliveryController:(id)a3;
- (void)setupCompletedForPairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)stopLocalPairingForDeviceWithID:(id)a3 completion:(id)a4;
- (void)switchActivePairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)unpairDeviceWithID:(id)a3 completion:(id)a4;
- (void)unpairStartForDeviceWithID:(id)a3 completion:(id)a4;
- (void)updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5;
- (void)updatePairedDeviceWithID:(id)a3 supportIPsec:(BOOL)a4 completion:(id)a5;
@end

@implementation IDSDXPCPairing

- (IDSDXPCPairing)initWithQueue:(id)a3 idsDaemon:(id)a4 serviceController:(id)a5 pairingManager:(id)a6 quickSwitchHelper:(id)a7 accountController:(id)a8 utunController:(id)a9 utunDeliveryController:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)IDSDXPCPairing;
  v18 = [(IDSDXPCPairing *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_idsDaemon, a4);
    objc_storeStrong((id *)&v19->_serviceController, a5);
    objc_storeStrong((id *)&v19->_pairingManager, a6);
    objc_storeStrong((id *)&v19->_quickSwitchHelper, a7);
    objc_storeStrong((id *)&v19->_accountController, a8);
    objc_storeStrong((id *)&v19->_utunController, a9);
    objc_storeStrong((id *)&v19->_utunDeliveryController, a10);
  }

  return v19;
}

- (void)addPairedDevice:(id)a3 completion:(id)a4
{
}

- (void)addPairedDeviceWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 cbuuid];
  [(IDSDXPCPairing *)self _addPairedDevice:v8 withInfo:v7 completion:v6];
}

- (void)updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5
{
}

- (void)connectPairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) connectPairedDevice (cbuuid: %@)", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(IDSDXPCPairing *)self utunController];
  v10 = [v6 UUIDString];
  [v9 connectPairedDevice:v10];

  v7[2](v7, 0);
}

- (void)setupCompletedForPairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) setupCompletedForPairedDevice (cbuuid: %@)", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(IDSDXPCPairing *)self utunDeliveryController];
  [v9 localSetupCompleted];

  v7[2](v7, 0);
}

- (void)getPairingDevicesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairingDevices", (uint8_t *)&v8, 2u);
  }

  id v6 = [(IDSDXPCPairing *)self _pairingDeviceCBUUIDs];
  id v7 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairingDevices yielded CBUUIDs: %@", (uint8_t *)&v8, 0xCu);
  }

  v4[2](v4, v6, 0);
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairedDevices", (uint8_t *)&v8, 2u);
  }

  id v6 = [(IDSDXPCPairing *)self _pairedDeviceCBUUIDs];
  id v7 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairedDevices yielded CBUUIDs: %@", (uint8_t *)&v8, 0xCu);
  }

  v4[2](v4, v6, 0);
}

- (void)getPairingRecordsWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void *, void))a3;
  v5 = [(IDSDXPCPairing *)self pairingManager];
  id v8 = [v5 localDeviceRecord];

  id v6 = [(IDSDXPCPairing *)self pairingManager];
  id v7 = [v6 pairedDeviceRecords];

  v4[2](v4, v8, v7, 0);
}

- (void)pairedDevicesInfo:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = [(IDSDXPCPairing *)self pairingManager];
  id v6 = [v5 allPairedDevices];

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
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
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "dictionaryRepresentation", (void)v14);
        [v7 addObject:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v4[2](v4, v7, 0);
}

- (void)updatePairedDeviceWithID:(id)a3 supportIPsec:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (v8)
  {
    id v33 = v8;
    id v10 = +[NSArray arrayWithObjects:&v33 count:1];
  }
  else
  {
    uint64_t v11 = [(IDSDXPCPairing *)self pairingManager];
    id v12 = [v11 cbuuidsOfPairedDevices];
    id v10 = [v12 allObjects];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    id v25 = v8;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v19 = [(IDSDXPCPairing *)self pairingManager];
        unsigned __int8 v20 = [v19 updatePairedDeviceWithCBUUID:v18 supportIPsec:v6];

        if ((v20 & 1) == 0)
        {
          id v22 = +[NSString stringWithFormat:@"We were unable to update the cache. Possibly because the device doesn't exist. Look at the logs to know for sure. {uuid: %@}", v18];
          uint64_t v23 = IDSGenericErrorDomain;
          NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
          v31 = v22;
          id v24 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          id v21 = +[NSError errorWithDomain:v23 code:1 userInfo:v24];

          goto LABEL_14;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    id v21 = 0;
LABEL_14:
    id v8 = v25;
  }
  else
  {
    id v21 = 0;
  }

  v9[2](v9, v21);
}

- (void)deletePairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) deletePairedDeviceWithID (cbuuid: %@)", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self utunController];
  id v10 = [v6 UUIDString];
  [v9 deletePairedDevice:v10];

  uint64_t v11 = [(IDSDXPCPairing *)self pairingManager];
  id v12 = [v6 UUIDString];
  [v11 removeLocalPairedDevice:v12];

  id v13 = +[IDSUTunDeliveryController sharedInstance];
  [v13 stopIdsNRDeviceBridgeAndPreferenceHandler];

  v7[2](v7, 0);
}

- (void)unpairStartForDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) deletePairedDeviceWithID (cbuuid: %@)", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self utunDeliveryController];
  [v9 defaultPeerUnpairStart];

  v7[2](v7, 0);
}

- (void)stopLocalPairingForDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138477827;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) stopLocalPairingForDeviceWithID {cbuuid: %{private}@}", (uint8_t *)&v15, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self utunController];
  int v10 = [v6 UUIDString];
  [v9 obliterateConnectionInfoForCBUUID:v10];

  id v11 = [(IDSDXPCPairing *)self pairingManager];
  uint64_t v12 = [v6 UUIDString];
  [v11 removeLocalPairedDevice:v12];

  id v13 = +[IDSPairingManager sharedInstance];
  LOBYTE(v12) = [v13 isCurrentDevicePairedOrPairing];

  if ((v12 & 1) == 0)
  {
    int v14 = [(IDSDXPCPairing *)self accountController];
    [v14 stopLocalSetup];
  }
  v7[2](v7, 0);
}

- (void)unpairDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) unpairDevice (cbuuid: %@)", (uint8_t *)&v21, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self pairingManager];
  int v10 = [v9 cbuuidsOfPairedDevices];
  unsigned int v11 = [v10 containsObject:v6];

  if (v11)
  {
    uint64_t v12 = [(IDSDXPCPairing *)self utunController];
    id v13 = [v6 UUIDString];
    [v12 obliterateConnectionInfoForCBUUID:v13];

    int v14 = [(IDSDXPCPairing *)self pairingManager];
    int v15 = [v6 UUIDString];
    [v14 removeLocalPairedDevice:v15];

    id v16 = [(IDSDXPCPairing *)self serviceController];
    long long v17 = [v16 allServicesWithAdHocServiceType:2];

    uint64_t v18 = [(IDSDXPCPairing *)self idsDaemon];
    [v18 dropQueuedBroadcastsForServices:v17];

    v19 = [(IDSDXPCPairing *)self idsDaemon];
    [v19 _processMessagesUponUnpairing];

    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = +[NSError errorWithDomain:IDSLocalPairingErrorDomain code:8 userInfo:0];
    long long v17 = (void *)v20;
  }
  v7[2](v7, v20);
}

- (void)forgetDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) forgetDevice (cbuuid: %@)", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self pairingManager];
  int v10 = [v6 UUIDString];
  [v9 removeLocalPairedDevice:v10];

  v7[2](v7, 0);
}

- (void)switchActivePairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) switchActivePairedDevice (cbuuid: %@)", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [(IDSDXPCPairing *)self quickSwitchHelper];
  int v10 = [v6 UUIDString];
  [v9 initiateQuickSwitchToDeviceWithCBUUID:v10 force:0 completionBlock:v7];
}

- (void)disconnectActivePairedDevice:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) switchToNoActivePairedDevice", v12, 2u);
  }

  id v6 = [(IDSDXPCPairing *)self utunController];
  id v7 = [(IDSDXPCPairing *)self pairingManager];
  id v8 = [v7 pairedDeviceUUIDString];
  [v6 obliterateConnectionInfoForCBUUID:v8];

  id v9 = [(IDSDXPCPairing *)self pairingManager];
  [v9 disconnectActivePairedDevice];

  int v10 = [(IDSDXPCPairing *)self idsDaemon];
  int v11 = [v10 broadcasterWithMessageContext:0];

  [v11 deactivatePairedDevices];
  v4[2](v4, 0);
}

- (void)redeliverMessagesForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) redeliverMessagesForDevice (device ID: %@)", (uint8_t *)&v13, 0xCu);
  }

  id v9 = +[IDSPairingManager sharedInstance];
  int v10 = [v9 pairedDeviceUniqueID];

  if ([v6 isEqualToString:v10])
  {
    int v11 = [(IDSDXPCPairing *)self idsDaemon];
    [v11 launchOnDemandServicesForQueuedBroadcastAttempts];

    id v12 = [(IDSDXPCPairing *)self idsDaemon];
    [v12 _processStoredMessagesIncludingClassD:1];
  }
  v7[2](v7, 0);
}

- (void)setAllowedTrafficClassifiersForDevice:(id)a3 classifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  int v11 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(Daemon) setAllowedTrafficClassifiersForDevice (device ID: %@)   (classifiers: %@)", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(IDSDXPCPairing *)self utunDeliveryController];
  [v12 setAllowedTrafficClasses:v9];

  v10[2](v10, 0);
}

- (void)dropAllMessagesWithoutAnyAllowedClassifierForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)", buf, 0xCu);
  }

  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = v6;
        _IDSLogV();
      }
    }
  }
  int v10 = [(IDSDXPCPairing *)self utunDeliveryController];
  [v10 defaultPeerDropDisallowedMessages];

  int v11 = [(IDSDXPCPairing *)self idsDaemon];
  [v11 _processDisallowedMessages];

  v7[2](v7, 0);
}

- (id)_pairingDeviceCBUUIDs
{
  v3 = +[IDSPairingManager sharedInstance];
  v4 = [v3 cbuuidsOfPairingDevices];

  v5 = [(IDSDXPCPairing *)self _sortedArrayFromCBUUIDSet:v4];

  return v5;
}

- (id)_pairedDeviceCBUUIDs
{
  v3 = +[IDSPairingManager sharedInstance];
  v4 = [v3 cbuuidsOfPairedDevices];

  v5 = [(IDSDXPCPairing *)self _sortedArrayFromCBUUIDSet:v4];

  return v5;
}

- (id)_sortedArrayFromCBUUIDSet:(id)a3
{
  v3 = [a3 allObjects];
  v4 = [v3 sortedArrayUsingComparator:&stru_10098C5B0];

  return v4;
}

- (void)_updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5
{
  int v11 = (void (**)(id, void))a5;
  id v8 = [a3 UUIDString];
  if ([v8 length])
  {
    id v9 = [(IDSDXPCPairing *)self pairingManager];
    [v9 updateLocalPairedDevice:v8 pairingType:a4];

    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    int v10 = +[NSError errorWithDomain:IDSLocalPairingErrorDomain code:6 userInfo:0];
    ((void (**)(id, void *))v11)[2](v11, v10);
  }
}

- (void)_addPairedDevice:(id)a3 withInfo:(id)a4 completion:(id)a5
{
  v34 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  id v33 = [v8 BTOutOfBandKey];
  unsigned int v10 = [v8 shouldPairDirectlyOverIPsec];
  if (+[IMUserDefaults isAlwaysPairAsTinker]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = (uint64_t)[v8 pairingType];
  }
  v32 = [v8 bluetoothMACAddress];
  id v12 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = +[IDSLogFormatter descriptionForData:v33 options:2];
    if (v10) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    __int16 v15 = +[IDSLogFormatter descriptionForData:v32 options:2];
    *(_DWORD *)buf = 138478851;
    CFStringRef v46 = v34;
    __int16 v47 = 2113;
    id v48 = v13;
    __int16 v49 = 2114;
    CFStringRef v50 = v14;
    __int16 v51 = 2050;
    uint64_t v52 = v11;
    __int16 v53 = 2113;
    v54 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(Daemon) _addPairedDevice:BTOutOfBandKey:completion: (cbuuid: %{private}@, btOutOfBandKey.hash: %{private}@, shouldPairDirectlyOverIPsec: %{public}@, pairingType: %{public}ld, bluetoothMACAddress.hash: %{private}@)", buf, 0x34u);
  }
  id v16 = [(__CFString *)v34 UUIDString];
  long long v17 = [(IDSDXPCPairing *)self pairingManager];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1003EC984;
  v43[3] = &unk_100981C88;
  id v18 = v9;
  id v44 = v18;
  [v17 registerPairedDeviceWithUniqueID:v34 didConnectBlock:v43];

  if ([v16 length])
  {
    if (v10) {
      int v19 = 1;
    }
    else {
      int v19 = IMGetDomainBoolForKeyWithDefaultValue();
    }
    int v21 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v22 = @"NO";
      if (v19) {
        CFStringRef v22 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(Daemon) _addPairedDevice: PairDirectlyOverIPsec: %@", buf, 0xCu);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1003EC994;
    v35[3] = &unk_10098C5D8;
    char v42 = v19;
    id v40 = v18;
    v35[4] = self;
    id v23 = v16;
    id v36 = v23;
    id v37 = v33;
    uint64_t v41 = v11;
    id v38 = v32;
    CFStringRef v24 = v34;
    v39 = (__CFString *)v24;
    id v25 = objc_retainBlock(v35);
    long long v26 = [(IDSDXPCPairing *)self pairingManager];
    long long v27 = [v26 pairedDeviceUUIDString];

    if (v27 && ([(__CFString *)v27 isEqualToIgnoringCase:v23] & 1) != 0)
    {
      long long v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        CFStringRef v46 = v27;
        __int16 v47 = 2113;
        id v48 = v23;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "(Daemon) Told to add a paired device but there is no need to reset communication with the currently active paired device. {activeCBUUID: %{private}@, cbuuidString: %{private}@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      if (v25) {
        ((void (*)(void *, void))v25[2])(v25, 0);
      }
    }
    else
    {
      long long v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v46 = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "(Daemon) Reset communication with currently active paired device before adding a new paired device: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          CFStringRef v31 = v24;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            CFStringRef v31 = v24;
            _IDSLogV();
          }
        }
      }
      NSErrorUserInfoKey v30 = [(IDSDXPCPairing *)self quickSwitchHelper];
      [v30 resetCommunicationStateBeforeQuickSwitchWithCompletionBlock:v25];
    }
    uint64_t v20 = v40;
  }
  else
  {
    uint64_t v20 = +[NSError errorWithDomain:IDSLocalPairingErrorDomain code:6 userInfo:0];
    (*((void (**)(id, void *))v18 + 2))(v18, v20);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSDaemon)idsDaemon
{
  return self->_idsDaemon;
}

- (void)setIdsDaemon:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSQuickSwitchHelper)quickSwitchHelper
{
  return self->_quickSwitchHelper;
}

- (void)setQuickSwitchHelper:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSUTunController)utunController
{
  return self->_utunController;
}

- (void)setUtunController:(id)a3
{
}

- (IDSUTunDeliveryController)utunDeliveryController
{
  return self->_utunDeliveryController;
}

- (void)setUtunDeliveryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utunDeliveryController, 0);
  objc_storeStrong((id *)&self->_utunController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_quickSwitchHelper, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_idsDaemon, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end