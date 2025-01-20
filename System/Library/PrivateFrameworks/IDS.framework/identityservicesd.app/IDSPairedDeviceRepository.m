@interface IDSPairedDeviceRepository
- (BOOL)_addPairedDevice:(id)a3;
- (BOOL)_criticalPerformTransactionWithBlock:(id)a3;
- (BOOL)_criticalPersistState;
- (BOOL)_criticalPurgeSecuredEncryptionKeysForAllPairedDevices;
- (BOOL)_criticalRemovePairedDeviceWithCBUUID:(id)a3;
- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 deviceInfoPayload:(id)a4;
- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 deviceUniqueID:(id)a4 buildVersion:(id)a5 productVersion:(id)a6 productName:(id)a7 pairingProtocolVersion:(unsigned int)a8 minCompatibilityVersion:(unsigned int)a9 maxCompatibilityVersion:(unsigned int)a10 serviceMinCompatibilityVersion:(unsigned __int16)a11;
- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5;
- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4;
- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4;
- (BOOL)_performTransactionInCriticalSectionWithBlock:(id)a3;
- (BOOL)addPairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4;
- (BOOL)containsPairedDeviceWithCBUUID:(id)a3;
- (BOOL)isEmpty;
- (BOOL)loadPairedDevicesFromStorage;
- (BOOL)purgeSecuredEncryptionKeysForAllPairedDevices;
- (BOOL)removePairedDeviceWithCBUUID:(id)a3;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 deviceInfoPayload:(id)a4;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 deviceUniqueID:(id)a4 buildVersion:(id)a5 productVersion:(id)a6 productName:(id)a7 pairingProtocolVersion:(unsigned int)a8 minCompatibilityVersion:(unsigned int)a9 maxCompatibilityVersion:(unsigned int)a10 serviceMinCompatibilityVersion:(unsigned __int16)a11;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4;
- (IDSPairedDeviceRepository)initWithPersister:(id)a3;
- (id)_criticalActivePairedDevice;
- (id)_criticalAllPairedDevices;
- (id)_criticalPairedDeviceWithCBUUID:(id)a3;
- (id)activePairedDevice;
- (id)allPairedDevices;
- (id)allPairedDevicesWithType:(int64_t)a3;
- (id)description;
- (id)pairedDeviceWithCBUUID:(id)a3;
- (id)pairedDevicesWithIsPairingValue:(BOOL)a3;
- (int64_t)_criticalActivatePairedDeviceWithCBUUID:(id)a3;
- (int64_t)_criticalPerformPairedDeviceActivationWithCBUUID:(id)a3;
- (int64_t)activatePairedDeviceWithCBUUID:(id)a3;
- (void)_accessPairedDevicesInCriticalSectionWithBlock:(id)a3;
- (void)_criticalLoadPairedDeviceArray:(id)a3;
- (void)_criticalPerformPairedDeviceDeactivation;
- (void)_criticalPutPairedDevice:(id)a3;
- (void)_criticalUpdatePairedDevice:(id)a3 isActive:(BOOL)a4;
- (void)deactivatePairedDevices;
@end

@implementation IDSPairedDeviceRepository

- (id)activePairedDevice
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1003E0DC8;
  v9 = sub_1003E0DD8;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000064E8;
  v4[3] = &unk_100980390;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_accessPairedDevicesInCriticalSectionWithBlock:(id)a3
{
  p_pairedDevicesLock = &self->_pairedDevicesLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_pairedDevicesLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_pairedDevicesLock);
}

- (id)_criticalActivePairedDevice
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(NSMutableDictionary *)self->_pairedDevices allValues];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isActive])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)allPairedDevicesWithType:(int64_t)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_1003E0DC8;
  v14 = sub_1003E0DD8;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000045B0;
  v9[3] = &unk_100980390;
  v9[4] = self;
  v9[5] = &v10;
  [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v9];
  v4 = (void *)v11[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003E1A84;
  v8[3] = &unk_10098B6F8;
  v8[4] = a3;
  id v5 = +[NSPredicate predicateWithBlock:v8];
  uint64_t v6 = [v4 filteredSetUsingPredicate:v5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_criticalAllPairedDevices
{
  v4 = [(NSMutableDictionary *)self->_pairedDevices allValues];
  id v5 = +[NSSet setWithArray:v4];

  return v5;
}

- (IDSPairedDeviceRepository)initWithPersister:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSPairedDeviceRepository;
  uint64_t v6 = [(IDSPairedDeviceRepository *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_pairedDevicesLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pairedDevices = v7->_pairedDevices;
    v7->_pairedDevices = v8;

    objc_storeStrong((id *)&v7->_persister, a3);
  }

  return v7;
}

- (id)description
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1003E0DC8;
  v9 = sub_1003E0DD8;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003E0DE0;
  v4[3] = &unk_100980390;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)loadPairedDevicesFromStorage
{
  [(IDSPairedDevicePersister *)self->_persister loadPairedDevices];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003E0F20;
  v5[3] = &unk_10097E440;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v6;
  [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v5];

  return v3 != 0;
}

- (void)_criticalLoadPairedDeviceArray:(id)a3
{
  id v4 = a3;
  [(NSMutableDictionary *)self->_pairedDevices removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138412290;
    long long v14 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "cbuuid", v14, (void)v15);
        if ([v12 length])
        {
          [(NSMutableDictionary *)self->_pairedDevices setObject:v11 forKeyedSubscript:v12];
        }
        else
        {
          long long v13 = +[IMRGLog pairedDeviceRepo];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Loaded a paired device from storage with an empty/missing CBUUID: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }
}

- (BOOL)containsPairedDeviceWithCBUUID:(id)a3
{
  id v3 = [(IDSPairedDeviceRepository *)self pairedDeviceWithCBUUID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)pairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = sub_1003E0DC8;
    long long v17 = sub_1003E0DD8;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003E12C0;
    v10[3] = &unk_100981940;
    uint64_t v12 = &v13;
    v10[4] = self;
    id v11 = v4;
    [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v10];
    id v5 = (void *)v14[5];
    if (!v5)
    {
      id v6 = +[IMRGLog pairedDeviceRepo];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1007229C4();
      }

      id v5 = (void *)v14[5];
    }
    id v7 = v5;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100722984();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_criticalPairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToIgnoringCase:kIDSDefaultPairedDeviceID]) {
    [(IDSPairedDeviceRepository *)self _criticalActivePairedDevice];
  }
  else {
  id v5 = [(NSMutableDictionary *)self->_pairedDevices objectForKeyedSubscript:v4];
  }

  return v5;
}

- (BOOL)addPairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding a paired device to the repository with CBUUID: %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [[IDSPairedDevice alloc] initWithCBUUID:v6 pairingType:a4];
  BOOL v9 = [(IDSPairedDeviceRepository *)self _addPairedDevice:v8];

  return v9;
}

- (BOOL)_addPairedDevice:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003E151C;
  v6[3] = &unk_10098B6D8;
  id v7 = a3;
  id v8 = self;
  id v4 = v7;
  LOBYTE(self) = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v6];

  return (char)self;
}

- (void)_criticalPutPairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog deviceState];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 cbuuid];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Putting paired device %@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [v4 cbuuid];
  if ([v7 length])
  {
    [(NSMutableDictionary *)self->_pairedDevices setObject:v4 forKeyedSubscript:v7];
  }
  else
  {
    id v8 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100722A94();
    }
  }
}

- (BOOL)removePairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing a paired device from the repository with CBUUID: %@", buf, 0xCu);
  }

  if ([v4 length])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003E186C;
    v9[3] = &unk_10098B6D8;
    v9[4] = self;
    id v10 = v4;
    BOOL v6 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v9];
  }
  else
  {
    id v7 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100722AC8();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_criticalRemovePairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_pairedDevices allKeys];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    [(NSMutableDictionary *)self->_pairedDevices removeObjectForKey:v4];
    BOOL v7 = [(IDSPairedDeviceRepository *)self _criticalPersistState];
  }
  else
  {
    id v8 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100722AFC();
    }

    BOOL v7 = 1;
  }

  return v7;
}

- (id)allPairedDevices
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1003E0DC8;
  int v9 = sub_1003E0DD8;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003E1A38;
  v4[3] = &unk_100980390;
  v4[4] = self;
  v4[5] = &v5;
  [(IDSPairedDeviceRepository *)self _accessPairedDevicesInCriticalSectionWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)pairedDevicesWithIsPairingValue:(BOOL)a3
{
  int v3 = a3;
  id v4 = [(IDSPairedDeviceRepository *)self allPairedDevices];
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isPairing", (void)v13) == v3) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEmpty
{
  id v2 = [(IDSPairedDeviceRepository *)self allPairedDevices];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (int64_t)activatePairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating paired device with CBUUID: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x2020000000;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003E1DBC;
    v8[3] = &unk_10098B720;
    p_long long buf = &buf;
    v8[4] = self;
    id v9 = v4;
    [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v8];
    int64_t v6 = *(void *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (void)deactivatePairedDevices
{
  BOOL v3 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deactivating paired devices", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003E1ED0;
  v4[3] = &unk_10098B748;
  v4[4] = self;
  [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v4];
}

- (int64_t)_criticalActivatePairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  [(IDSPairedDeviceRepository *)self _criticalPerformPairedDeviceDeactivation];
  int64_t v5 = [(IDSPairedDeviceRepository *)self _criticalPerformPairedDeviceActivationWithCBUUID:v4];

  if (!v5)
  {
    if ([(IDSPairedDeviceRepository *)self _criticalPersistState]) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return v5;
}

- (void)_criticalPerformPairedDeviceDeactivation
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_pairedDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isActive])
        {
          id v9 = +[IMRGLog pairedDeviceRepo];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = [v8 cbuuid];
            *(_DWORD *)long long buf = 136315394;
            long long v16 = "-[IDSPairedDeviceRepository _criticalPerformPairedDeviceDeactivation]";
            __int16 v17 = 2112;
            id v18 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Deactivating paired device with CBUUID: %@", buf, 0x16u);
          }
          [(IDSPairedDeviceRepository *)self _criticalUpdatePairedDevice:v8 isActive:0];
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (int64_t)_criticalPerformPairedDeviceActivationWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v4];
  if (v5)
  {
    [(IDSPairedDeviceRepository *)self _criticalUpdatePairedDevice:v5 isActive:1];
    int64_t v6 = 0;
  }
  else
  {
    id v7 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[IDSPairedDeviceRepository _criticalPerformPairedDeviceActivationWithCBUUID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Cannot activate an unknown paired device. CBUUID: %@", (uint8_t *)&v9, 0x16u);
    }

    int64_t v6 = 2;
  }

  return v6;
}

- (void)_criticalUpdatePairedDevice:(id)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[IDSPairedDevice alloc] initWithPairedDevice:v6 isActive:v4];

  [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v7];
}

- (BOOL)purgeSecuredEncryptionKeysForAllPairedDevices
{
  BOOL v3 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Purging the secured encryption keys for all paired devices.", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003E2364;
  v5[3] = &unk_10098B748;
  v5[4] = self;
  return [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v5];
}

- (BOOL)_criticalPurgeSecuredEncryptionKeysForAllPairedDevices
{
  BOOL v3 = [(NSMutableDictionary *)self->_pairedDevices allValues];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v7) pairedDeviceWithoutSecuredEncryptionKeys];
        [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  BOOL v9 = [(IDSPairedDeviceRepository *)self _criticalPersistState];

  return v9;
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 deviceInfoPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating a paired device in the repository with CBUUID: %@ with deviceInfoPayload: %@", buf, 0x16u);
  }

  if ([v6 length])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003E2630;
    v12[3] = &unk_10098B770;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    BOOL v9 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v12];
  }
  else
  {
    id v10 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100722B84();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 deviceInfoPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v6];
  if (v8)
  {
    BOOL v9 = [[IDSPairedDevice alloc] initWithPairedDevice:v8 deviceInfoPayload:v7];
    [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v9];
    BOOL v10 = [(IDSPairedDeviceRepository *)self _criticalPersistState];
  }
  else
  {
    long long v11 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100722BB8();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)long long buf = 138478083;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating a paired device supportIPsec property {cbuuid: %{private}@, supportIPsec: %{public}@}", buf, 0x16u);
  }
  if ([v6 length])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003E28C4;
    v12[3] = &unk_10098B798;
    v12[4] = self;
    id v13 = v6;
    BOOL v14 = v4;
    BOOL v9 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v12];
  }
  else
  {
    BOOL v10 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100722C2C();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v6];
  id v8 = v7;
  if (v7)
  {
    if ([v7 supportIPsec] == v4)
    {
      LOBYTE(v10) = 1;
      goto LABEL_18;
    }
    BOOL v9 = [[IDSPairedDevice alloc] initWithPairedDevice:v8 supportIPsec:v4];
    [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v9];
    BOOL v10 = [(IDSPairedDeviceRepository *)self _criticalPersistState];
    if (v10)
    {
      long long v11 = +[IMRGLog pairedDeviceRepo];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ([v8 supportIPsec]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        if ([(IDSPairedDevice *)v9 supportIPsec]) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        int v15 = 138412546;
        CFStringRef v16 = v12;
        __int16 v17 = 2112;
        CFStringRef v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated paired device support IPsec {supportIPsec.old: %@, supportIPsec.new: %@}", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    BOOL v9 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      sub_100722C60();
    }
    LOBYTE(v10) = 0;
  }

LABEL_18:
  return v10;
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 deviceUniqueID:(id)a4 buildVersion:(id)a5 productVersion:(id)a6 productName:(id)a7 pairingProtocolVersion:(unsigned int)a8 minCompatibilityVersion:(unsigned int)a9 maxCompatibilityVersion:(unsigned int)a10 serviceMinCompatibilityVersion:(unsigned __int16)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v21 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138414338;
    id v37 = v16;
    __int16 v38 = 2112;
    id v39 = v17;
    __int16 v40 = 2112;
    id v41 = v18;
    __int16 v42 = 2112;
    id v43 = v19;
    __int16 v44 = 2112;
    id v45 = v20;
    __int16 v46 = 1024;
    unsigned int v47 = a8;
    __int16 v48 = 1024;
    unsigned int v49 = a9;
    __int16 v50 = 1024;
    unsigned int v51 = a10;
    __int16 v52 = 1024;
    int v53 = a11;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating a paired device with CBUUID: %@ to (deviceUniqueID: %@) (buildVersion: %@) (productVersion: %@) (productName: %@) (pairingProtocolVersion: %u) (minCompatibilityVersion: %u) (maxCompatibilityVersion: %u) (serviceMinCompatibilityVersion: %u)", buf, 0x4Cu);
  }

  if ([v16 length])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1003E2D0C;
    v26[3] = &unk_10098B7C0;
    v26[4] = self;
    id v27 = v16;
    id v28 = v17;
    id v29 = v18;
    id v30 = v19;
    id v31 = v20;
    unsigned int v32 = a8;
    unsigned int v33 = a9;
    unsigned int v34 = a10;
    unsigned __int16 v35 = a11;
    BOOL v22 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v26];
  }
  else
  {
    v23 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_100722CC8();
    }

    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 deviceUniqueID:(id)a4 buildVersion:(id)a5 productVersion:(id)a6 productName:(id)a7 pairingProtocolVersion:(unsigned int)a8 minCompatibilityVersion:(unsigned int)a9 maxCompatibilityVersion:(unsigned int)a10 serviceMinCompatibilityVersion:(unsigned __int16)a11
{
  uint64_t v11 = *(void *)&a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  BOOL v22 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v17];
  v23 = v22;
  v65 = v21;
  if (v22)
  {
    v56 = self;
    v24 = [v22 privateData];
    key = (void *)IDSPrivateDeviceDataProductBuildVersion;
    v25 = -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:");
    int v53 = (void *)IDSPrivateDeviceDataProductVersion;
    v64 = -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:");
    v54 = (void *)IDSPrivateDeviceDataProductName;
    v63 = -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:");
    v62 = [v23 uniqueID];
    v59 = v25;
    if ([v19 length]) {
      unsigned int v26 = [v25 isEqualToIgnoringCase:v19] ^ 1;
    }
    else {
      unsigned int v26 = 0;
    }
    id v28 = v19;
    value = v20;
    if ([v20 length]) {
      unsigned int v29 = [v64 isEqualToIgnoringCase:v20] ^ 1;
    }
    else {
      unsigned int v29 = 0;
    }
    id v30 = v18;
    if ([v21 length]) {
      unsigned int v31 = [v63 isEqualToIgnoringCase:v21] ^ 1;
    }
    else {
      unsigned int v31 = 0;
    }
    id v58 = v17;
    if ([v30 length]) {
      unsigned int v55 = [v62 isEqualToIgnoringCase:v30] ^ 1;
    }
    else {
      unsigned int v55 = 0;
    }
    unsigned int v32 = [v23 pairingProtocolVersion];
    unsigned int v33 = [v23 minCompatibilityVersion];
    unsigned int v60 = [v23 maxCompatibilityVersion];
    unsigned int v34 = [v23 serviceMinCompatibilityVersion];
    if (((v26 | v29 | v31) & 1) == 0 && v32 == v11 && v33 == a9 && v60 == a10 && v34 == a11)
    {
      unsigned __int8 v27 = 1;
      id v18 = v30;
      id v19 = v28;
      id v20 = value;
      id v17 = v58;
      unsigned __int16 v35 = v59;
    }
    else
    {
      unsigned int v51 = v34;
      theDict = [v24 mutableCopy];
      if (!theDict) {
        theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      }
      if (v26)
      {
        v36 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v67 = v59;
          *(_WORD *)&v67[8] = 2112;
          id v68 = v28;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Updated paired device build version from: %@ to: %@", buf, 0x16u);
        }

        if (v28) {
          CFDictionarySetValue(theDict, key, v28);
        }
      }
      if (v29)
      {
        id v37 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v67 = v64;
          *(_WORD *)&v67[8] = 2112;
          id v68 = value;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Updated paired device product version from: %@ to: %@", buf, 0x16u);
        }

        if (value) {
          CFDictionarySetValue(theDict, v53, value);
        }
      }
      id v19 = v28;
      unsigned __int16 v35 = v59;
      if (v31)
      {
        __int16 v38 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v67 = v63;
          *(_WORD *)&v67[8] = 2112;
          id v68 = v65;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Updated paired device product name from: %@ to: %@", buf, 0x16u);
        }

        if (v65) {
          CFDictionarySetValue(theDict, v54, v65);
        }
      }
      id v18 = v30;
      id v20 = value;
      if (v55)
      {
        id v39 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v67 = v62;
          *(_WORD *)&v67[8] = 2112;
          id v68 = v18;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Updated paired device uniqueID from: %@ to: %@", buf, 0x16u);
        }
      }
      if (v32 != v11)
      {
        __int16 v40 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v41 = [v23 pairingProtocolVersion];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)v67 = v41;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v11;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Updated paired device pairing protocol from: %u to: %u", buf, 0xEu);
        }
      }
      BOOL v42 = v33 == a9;
      id v17 = v58;
      if (!v42)
      {
        id v43 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v44 = [v23 minCompatibilityVersion];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)v67 = v44;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = a9;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Updated paired device min compatibility version from: %u to: %u", buf, 0xEu);
        }
      }
      if (v60 != a10)
      {
        id v45 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v46 = [v23 maxCompatibilityVersion];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)v67 = v46;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = a10;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Updated paired device max compatibility version from: %u to: %u", buf, 0xEu);
        }
      }
      if (v51 != a11)
      {
        unsigned int v47 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v48 = [v23 serviceMinCompatibilityVersion];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)v67 = v48;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = a11;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Updated paired device service min compatibility version from: %u to: %u", buf, 0xEu);
        }
      }
      unsigned int v49 = [[IDSPairedDevice alloc] initWithPairedDevice:v23 deviceUniqueID:v18 pairingProtocolVersion:v11 minCompatibilityVersion:a9 maxCompatibilityVersion:a10 serviceMinCompatibilityVersion:a11 privateData:theDict];
      [(IDSPairedDeviceRepository *)v56 _criticalPutPairedDevice:v49];
      unsigned __int8 v27 = [(IDSPairedDeviceRepository *)v56 _criticalPersistState];
    }
  }
  else
  {
    v24 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100722CFC();
    }
    unsigned __int8 v27 = 0;
  }

  return v27;
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138478083;
    id v15 = v6;
    __int16 v16 = 2050;
    int64_t v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating a paired device pairingType property {cbuuid: %{private}@, pairingType: %{public}ld}", buf, 0x16u);
  }

  if ([v6 length])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003E365C;
    v11[3] = &unk_10098B7E8;
    v11[4] = self;
    id v12 = v6;
    int64_t v13 = a4;
    BOOL v8 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v11];
  }
  else
  {
    BOOL v9 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100722C2C();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v6];
  BOOL v8 = v7;
  if (!v7)
  {
    BOOL v10 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      sub_100722D70();
    }
    LOBYTE(v9) = 0;
    goto LABEL_11;
  }
  if ([v7 pairingType] != (id)a4)
  {
    BOOL v10 = [[IDSPairedDevice alloc] initWithPairedDevice:v8 pairingType:a4];
    [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v10];
    BOOL v9 = [(IDSPairedDeviceRepository *)self _criticalPersistState];
    if (v9)
    {
      uint64_t v11 = +[IMRGLog pairedDeviceRepo];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218240;
        id v14 = [v8 pairingType];
        __int16 v15 = 2048;
        int64_t v16 = [(IDSPairedDevice *)v10 pairingType];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated paired device support pairingType {pairingType.old: %ld, pairingType.new: %ld}", (uint8_t *)&v13, 0x16u);
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v9) = 1;
LABEL_12:

  return v9;
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[IMRGLog pairedDeviceRepo];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138478339;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating a paired device uris, loginID and pushToken properties {cbuuid: %{private}@, uris: %{public}@, pushToken: %{public}@}", buf, 0x20u);
  }

  if ([v8 length])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003E39CC;
    v15[3] = &unk_10098B810;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    BOOL v12 = [(IDSPairedDeviceRepository *)self _performTransactionInCriticalSectionWithBlock:v15];
  }
  else
  {
    int v13 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100722C2C();
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_criticalUpdatePairedDeviceWithCBUUID:(id)a3 iCloudURIs:(id)a4 pushToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IDSPairedDeviceRepository *)self _criticalPairedDeviceWithCBUUID:v8];
  BOOL v12 = v11;
  if (v11)
  {
    int v13 = [v11 iCloudURIs];
    id v14 = +[NSSet setWithArray:v9];
    __int16 v15 = +[NSSet setWithArray:v13];
    if ([v15 isEqualToSet:v14]
      && ([v12 pushToken],
          id v16 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v17 = [v16 isEqualToData:v10],
          v16,
          (v17 & 1) != 0))
    {
      LOBYTE(v18) = 1;
    }
    else
    {
      id v19 = [[IDSPairedDevice alloc] initWithPairedDevice:v12 iCloudURIs:v9 pushToken:v10];
      [(IDSPairedDeviceRepository *)self _criticalPutPairedDevice:v19];
      BOOL v18 = [(IDSPairedDeviceRepository *)self _criticalPersistState];
      if (v18)
      {
        id v20 = +[IMRGLog pairedDeviceRepo];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [(IDSPairedDevice *)v19 iCloudURIs];
          __int16 v23 = [v12 pushToken];
          id v22 = [(IDSPairedDevice *)v19 pushToken];
          *(_DWORD *)long long buf = 138413058;
          unsigned int v26 = v13;
          __int16 v27 = 2112;
          id v28 = v24;
          __int16 v29 = 2112;
          id v30 = v23;
          __int16 v31 = 2112;
          unsigned int v32 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updated paired device support uris and pushToken {uris.old: %@, uris.new: %@, pushToken.old: %@, pushToken.new: %@}", buf, 0x2Au);
        }
      }
    }
  }
  else
  {
    int v13 = +[IMRGLog pairedDeviceRepo];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100722DD8();
    }
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice
{
  id v2 = [(IDSPairedDeviceRepository *)self activePairedDevice];
  unsigned __int8 v3 = [v2 supportIPsec];

  return v3;
}

- (BOOL)_performTransactionInCriticalSectionWithBlock:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = -86;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003E3D78;
  v6[3] = &unk_10098B838;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(IDSPairedDeviceRepository *)v7 _accessPairedDevicesInCriticalSectionWithBlock:v6];
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)_criticalPerformTransactionWithBlock:(id)a3
{
  p_pairedDevices = &self->_pairedDevices;
  pairedDevices = self->_pairedDevices;
  id v5 = (uint64_t (**)(void))a3;
  id v6 = [(NSMutableDictionary *)pairedDevices mutableCopy];
  char v7 = v5[2](v5);

  if ((v7 & 1) == 0) {
    objc_storeStrong((id *)p_pairedDevices, v6);
  }

  return v7;
}

- (BOOL)_criticalPersistState
{
  id v2 = self;
  id v3 = [(NSMutableDictionary *)self->_pairedDevices allValues];
  LOBYTE(v2) = [(IDSPairedDevicePersister *)v2->_persister savePairedDevices:v3];

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persister, 0);

  objc_storeStrong((id *)&self->_pairedDevices, 0);
}

@end