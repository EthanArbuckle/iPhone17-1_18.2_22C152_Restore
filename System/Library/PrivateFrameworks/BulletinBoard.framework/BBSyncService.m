@interface BBSyncService
- (BBSyncService)initWithDelegate:(id)a3 queue:(id)a4;
- (BBSyncServiceDelegate)delegate;
- (BOOL)_hasDestination;
- (BOOL)_syncHasDefaultPairedDevice;
- (id)_dismissalDictionaryForBulletin:(id)a3;
- (id)_platformFromDeviceType:(int64_t)a3;
- (id)_syncAccount;
- (id)_syncLocalDevices;
- (unint64_t)pairedDeviceCount;
- (void)_reallyEnqueueBulletin:(id)a3 feeds:(unint64_t)a4;
- (void)_reallySend;
- (void)_sendSyncMessage:(id)a3;
- (void)_startTimerIfNecessary;
- (void)_stopTimer;
- (void)dealloc;
- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BBSyncService

- (BBSyncService)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BBSyncService;
  v8 = [(BBSyncService *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    pendingDismissalIDs = v9->_pendingDismissalIDs;
    v9->_pendingDismissalIDs = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    pendingDismissalDictionaries = v9->_pendingDismissalDictionaries;
    v9->_pendingDismissalDictionaries = (NSMutableSet *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.bulletinboard"];
    service = v9->_service;
    v9->_service = (IDSService *)v14;

    [(IDSService *)v9->_service addDelegate:v9 queue:v9->_queue];
    v16 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(BSContinuousMachTimer *)self->_sendTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BBSyncService;
  [(BBSyncService *)&v3 dealloc];
}

- (unint64_t)pairedDeviceCount
{
  v2 = [(IDSService *)self->_service devices];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  v4 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "IDS activeAccountsChanged", v5, 2u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v11 = [a3 deviceForFromID:v10];
  if (v11)
  {
    uint64_t v12 = [v9 objectForKey:@"f"];
    uint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v14 = [v9 objectForKey:@"s"];
    v15 = [v9 objectForKey:@"u"];
    v34 = [v9 objectForKey:@"b"];
    v16 = [v9 objectForKey:@"m"];
    v17 = (void *)BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v18 = v17;
      v19 = [v11 name];
      *(_DWORD *)buf = 138413058;
      id v36 = v9;
      __int16 v37 = 2114;
      v38 = v14;
      __int16 v39 = 2114;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_217675000, v18, OS_LOG_TYPE_DEFAULT, "Received IDS message %@ for %{public}@ and %{public}@ from \"%{public}@\"", buf, 0x2Au);
    }
    if (v14)
    {
      v20 = -[BBSyncService _platformFromDeviceType:](self, "_platformFromDeviceType:", [v11 deviceType]);
      if (v20)
      {
        uint64_t v33 = v13;
        v21 = [MEMORY[0x263F318B0] sharedCategories];
        v22 = [v21 bundleIDForPlatform:*MEMORY[0x263F31888] fromBundleID:v14 platform:v20];

        if ([v22 length])
        {
          v23 = BBLogSync;
          if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v36 = v14;
            __int16 v37 = 2114;
            v38 = v22;
            _os_log_impl(&dword_217675000, v23, OS_LOG_TYPE_DEFAULT, "Mapping bundle id using categories: %{public}@ -> %{public}@", buf, 0x16u);
          }
          id v24 = v22;

          uint64_t v14 = v24;
        }
        uint64_t v13 = v33;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained syncService:self receivedDismissalDictionaries:v34 dismissalIDs:v16 inSection:v14 universalSectionID:v15 forFeeds:v13];
  }
  else
  {
    v26 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR)) {
      -[BBSyncService service:account:incomingMessage:fromID:]((uint64_t)v10, v26, v27, v28, v29, v30, v31, v32);
    }
  }
}

- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BBSyncService *)self _hasDestination]) {
    [(BBSyncService *)self _reallyEnqueueBulletin:v6 feeds:a4];
  }
}

- (id)_syncAccount
{
  v2 = [(IDSService *)self->_service accounts];
  unint64_t v3 = [v2 anyObject];

  return v3;
}

- (BOOL)_hasDestination
{
  unint64_t v3 = [(BBSyncService *)self _syncAccount];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(BBSyncService *)self _syncHasDefaultPairedDevice];
  }

  return v4;
}

- (void)_reallyEnqueueBulletin:(id)a3 feeds:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [v6 sectionID];
  if (self->_queuedFeed != a4 || ![(NSString *)self->_queuedSectionID isEqualToString:v7])
  {
    [(BBSyncService *)self _reallySend];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained syncService:self universalSectionIdentifierForSectionIdentifier:v7];

    self->_queuedFeed = a4;
    objc_storeStrong((id *)&self->_queuedSectionID, v7);
    queuedUniversalSectionID = self->_queuedUniversalSectionID;
    self->_queuedUniversalSectionID = v9;
  }
  v11 = (void *)BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v6 bulletinID];
    int v17 = 138412290;
    objc_super v18 = v13;
    _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "really enqueueing bulletin %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v14 = [v6 dismissalID];
  if (v14)
  {
    [(NSMutableSet *)self->_pendingDismissalIDs addObject:v14];
  }
  else
  {
    pendingDismissalDictionaries = self->_pendingDismissalDictionaries;
    v16 = [(BBSyncService *)self _dismissalDictionaryForBulletin:v6];
    [(NSMutableSet *)pendingDismissalDictionaries addObject:v16];
  }
  [(BBSyncService *)self _startTimerIfNecessary];
}

- (BOOL)_syncHasDefaultPairedDevice
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(IDSService *)self->_service devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isDefaultPairedDevice])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_syncLocalDevices
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(IDSService *)self->_service devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v4 = 138412290;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice", v14))
        {
          if (v6)
          {
            long long v10 = BBLogSync;
            if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              v20 = v9;
              _os_log_error_impl(&dword_217675000, v10, OS_LOG_TYPE_ERROR, "Dismissal sync found more than one default paired device! Device: %@", buf, 0xCu);
            }
          }
          else
          {
            id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          uint64_t v12 = (void *)IDSCopyIDForDevice();
          [v6 addObject:v12];
        }
        else
        {
          v11 = BBLogSync;
          if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v9;
            _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "Found non default device: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_reallySend
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(BBSyncService *)self _stopTimer];
  if (self->_queuedSectionID)
  {
    if (self->_queuedFeed)
    {
      uint64_t v3 = [(NSMutableSet *)self->_pendingDismissalDictionaries count];
      uint64_t v4 = [(NSMutableSet *)self->_pendingDismissalIDs count];
      if (v3 | v4)
      {
        uint64_t v5 = v4;
        id v11 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
        objc_msgSend(v11, "bs_setSafeObject:forKey:", self->_queuedSectionID, @"s");
        objc_msgSend(v11, "bs_setSafeObject:forKey:", self->_queuedUniversalSectionID, @"u");
        id v6 = [NSNumber numberWithUnsignedInteger:self->_queuedFeed];
        objc_msgSend(v11, "bs_setSafeObject:forKey:", v6, @"f");

        if (v3)
        {
          uint64_t v7 = [(NSMutableSet *)self->_pendingDismissalDictionaries allObjects];
          objc_msgSend(v11, "bs_setSafeObject:forKey:", v7, @"b");
        }
        if (v5)
        {
          long long v8 = [(NSMutableSet *)self->_pendingDismissalIDs allObjects];
          objc_msgSend(v11, "bs_setSafeObject:forKey:", v8, @"m");
        }
        [(BBSyncService *)self _sendSyncMessage:v11];
        [(NSMutableSet *)self->_pendingDismissalDictionaries removeAllObjects];
        [(NSMutableSet *)self->_pendingDismissalIDs removeAllObjects];
        queuedSectionID = self->_queuedSectionID;
        self->_queuedFeed = 0;
        self->_queuedSectionID = 0;

        queuedUniversalSectionID = self->_queuedUniversalSectionID;
        self->_queuedUniversalSectionID = 0;
      }
    }
  }
}

- (void)_sendSyncMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BBSyncService *)self _syncAccount];
  uint64_t v6 = [(BBSyncService *)self _syncLocalDevices];
  if (v5 | v6)
  {
    if (v5)
    {
      uint64_t v7 = (void *)IDSCopyIDForAccount();
      if (v7) {
        long long v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v7, 0);
      }
      else {
        long long v8 = 0;
      }
    }
    else
    {
      long long v8 = 0;
    }
    long long v9 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v39 = v8;
      __int16 v40 = 2112;
      uint64_t v41 = v6;
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "sending IDS message toCloudDestinations : %@ andToLocalDestinations: %@ message : %@", buf, 0x20u);
    }
    id v10 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", MEMORY[0x263EFFA80], *MEMORY[0x263F49ED8], &unk_26C7ABC70, *MEMORY[0x263F49F80], 0);
    service = self->_service;
    id v36 = 0;
    id v37 = 0;
    char v13 = [(IDSService *)service sendMessage:v4 toDestinations:v8 priority:100 options:v11 identifier:&v37 error:&v36];
    id v14 = v37;
    id v15 = v36;
    if ((v13 & 1) == 0)
    {
      long long v16 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR)) {
        -[BBSyncService _sendSyncMessage:]((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    if ([(id)v6 count])
    {
      [v11 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F49F20]];
      v23 = self->_service;
      id v34 = v15;
      id v35 = v14;
      char v24 = [(IDSService *)v23 sendMessage:v4 toDestinations:v6 priority:300 options:v11 identifier:&v35 error:&v34];
      id v25 = v35;

      id v26 = v34;
      if ((v24 & 1) == 0)
      {
        uint64_t v27 = BBLogSync;
        if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR)) {
          -[BBSyncService _sendSyncMessage:]((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
    else
    {
      id v25 = v14;
      id v26 = v15;
    }
  }
}

- (id)_dismissalDictionaryForBulletin:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  uint64_t v6 = [v4 syncHash];
  [v5 setObject:v6 forKey:@"h"];

  uint64_t v7 = [v4 date];

  if (v7)
  {
    long long v8 = NSNumber;
    [v7 timeIntervalSince1970];
    long long v9 = objc_msgSend(v8, "numberWithDouble:");
    [v5 setObject:v9 forKey:@"d"];
  }
  return v5;
}

- (void)_startTimerIfNecessary
{
  if (!self->_sendTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = (BSContinuousMachTimer *)[objc_alloc(MEMORY[0x263F29C20]) initWithIdentifier:@"com.apple.bulletinboard.BBSyncService.sendTimer"];
    sendTimer = self->_sendTimer;
    self->_sendTimer = v3;

    uint64_t v5 = self->_sendTimer;
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__BBSyncService__startTimerIfNecessary__block_invoke;
    v7[3] = &unk_264297C40;
    objc_copyWeak(&v8, &location);
    [(BSContinuousMachTimer *)v5 scheduleWithFireInterval:queue leewayInterval:v7 queue:0.1 handler:0.1];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __39__BBSyncService__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reallySend];
}

- (void)_stopTimer
{
  sendTimer = self->_sendTimer;
  if (sendTimer)
  {
    [(BSContinuousMachTimer *)sendTimer invalidate];
    id v4 = self->_sendTimer;
    self->_sendTimer = 0;
  }
}

- (id)_platformFromDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_264297C60 + a3 - 1);
  }
  return v4;
}

- (BBSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BBSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendTimer, 0);
  objc_storeStrong((id *)&self->_queuedUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_queuedSectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingDismissalIDs, 0);
  objc_storeStrong((id *)&self->_pendingDismissalDictionaries, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingMessage:(uint64_t)a5 fromID:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sendSyncMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sendSyncMessage:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end