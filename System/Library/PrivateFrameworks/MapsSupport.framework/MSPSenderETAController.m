@interface MSPSenderETAController
- (BOOL)_validateNavigationState:(id *)a3;
- (BOOL)startSharingWith:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 error:(id *)a6;
- (BOOL)startSharingWithGroup:(id)a3 error:(id *)a4;
- (BOOL)stopSharingWith:(id)a3 reason:(unint64_t)a4 error:(id *)a5;
- (BOOL)stopSharingWithGroup:(id)a3 reason:(unint64_t)a4 error:(id *)a5;
- (BOOL)stopSharingWithReason:(unint64_t)a3 error:(id *)a4;
- (MSPSenderETAController)initWithRelay:(id)a3;
- (MSPSenderETAControllerDelegate)delegate;
- (NSArray)activeHandles;
- (NSDictionary)serviceNamesByActiveHandle;
- (id)rulesForParticipant:(id)a3;
- (void)_cleanObjects;
- (void)_createGroupSessionIfNeededWithIdentifier:(id)a3;
- (void)_invalidateActiveHandles;
- (void)_invalidateSharedTripWithError:(id)a3;
- (void)_restoreLastSession;
- (void)_setState:(id)a3 forEvent:(unint64_t)a4;
- (void)_startLiveForVirtualReceiver:(id)a3;
- (void)_startNavigationListener;
- (void)_startingGroupSession;
- (void)_stopLiveForVirtualReceiver:(id)a3;
- (void)_stopNavigationListener;
- (void)_updateStorage;
- (void)dealloc;
- (void)groupSession:(id)a3 participantDidJoin:(id)a4;
- (void)groupSession:(id)a3 participantDidLeave:(id)a4;
- (void)groupSessionEnded:(id)a3 withError:(id)a4;
- (void)navigationListenerArrived:(id)a3;
- (void)navigationListenerETAUpdated:(id)a3;
- (void)navigationListenerIsReady:(id)a3;
- (void)navigationListenerLocationUpdated:(id)a3;
- (void)navigationListenerResumed:(id)a3;
- (void)navigationListenerRouteUpdated:(id)a3;
- (void)navigationListenerStopped:(id)a3;
- (void)navigationListenerTrafficUpdated:(id)a3;
- (void)navigationListenerWaypointsUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)touchedRules;
@end

@implementation MSPSenderETAController

- (NSDictionary)serviceNamesByActiveHandle
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  senderStrategyController = self->_senderStrategyController;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__MSPSenderETAController_serviceNamesByActiveHandle__block_invoke;
  v8[3] = &unk_1E617E828;
  id v9 = v3;
  id v5 = v3;
  [(MSPSharedTripSenderStrategyController *)senderStrategyController performWithAllMinimalSenders:v8];
  v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

- (NSArray)activeHandles
{
  return (NSArray *)[(NSMutableSet *)self->_destinations allObjects];
}

- (MSPSenderETAController)initWithRelay:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSPSenderETAController;
  id v5 = [(MSPSenderETAController *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_idsRelay, v4);
    uint64_t v7 = [v4 storageController];
    storageController = v6->_storageController;
    v6->_storageController = (MSPSharedTripStorageController *)v7;

    id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    destinations = v6->_destinations;
    v6->_destinations = v9;

    v11 = objc_alloc_init(MSPNavigationListener);
    navigationListener = v6->_navigationListener;
    v6->_navigationListener = v11;

    [(MSPSenderETAController *)v6 _restoreLastSession];
    v13 = [MEMORY[0x1E4F64860] sharedPlatform];
    int v14 = [v13 isInternalInstall];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v15 addObserver:v6 selector:sel__startLiveForVirtualReceiver_ name:@"MSPSharedTripVirtualReceiverStartLiveUpdates" object:0 suspensionBehavior:4];

      v16 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v16 addObserver:v6 selector:sel__stopLiveForVirtualReceiver_ name:@"MSPSharedTripVirtualReceiverStopLiveUpdates" object:0 suspensionBehavior:4];
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPSenderETAController dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Sender] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSenderETAController;
  [(MSPSenderETAController *)&v4 dealloc];
}

- (void)_updateStorage
{
  +[MSPSharedTripSenderStrategyController updateGroupSessionStorage:self->_sessionStorage fromController:self->_senderStrategyController];
  id v3 = [(MSPNavigationListener *)self->_navigationListener currentState];
  id v5 = (id)[v3 copy];

  objc_super v4 = [(MSPSharedTripGroupSession *)self->_groupSession identifier];
  [v5 setGroupIdentifier:v4];

  [(MSPGroupSessionStorage *)self->_sessionStorage updateWithState:v5];
  [(MSPSharedTripStorageController *)self->_storageController setSenderSessionStorage:self->_sessionStorage];
}

- (void)_restoreLastSession
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(MSPSharedTripStorageController *)self->_storageController senderSessionStorage];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = [v3 state];
    v6 = [MEMORY[0x1E4F1CA48] array];
    if ([v4 minimalStrategyIdentifiersCount])
    {
      uint64_t v7 = [v4 minimalStrategyIdentifiers];
      [v6 addObjectsFromArray:v7];
    }
    if ([v4 messageStrategyIdentifiersCount])
    {
      v8 = [v4 messageStrategyIdentifiers];
      [v6 addObjectsFromArray:v8];
    }
    if ([v4 smsStrategyIdentifiersCount])
    {
      id v9 = [v4 smsStrategyIdentifiers];
      [v6 addObjectsFromArray:v9];
    }
    v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v5 mspDescription];
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "[Sender] _restoreLastSession restoring state %@ to %@", buf, 0x16u);
    }
    if ([v6 count] && objc_msgSend(v5, "hasGroupIdentifier"))
    {
      v12 = [v5 groupIdentifier];
      [(MSPSenderETAController *)self _createGroupSessionIfNeededWithIdentifier:v12];

      v13 = objc_msgSend(MEMORY[0x1E4F6AB90], "_msp_IDSIdentifiersFor:", v6);
      [(NSMutableSet *)self->_destinations addObjectsFromArray:v13];
      [(MSPSharedTripGroupSession *)self->_groupSession addSharingWith:v13];
      [(MSPSharedTripSenderStrategyController *)self->_senderStrategyController restoreFromGroupSessionStorage:v4];
      [(MSPSenderETAController *)self _setState:v5 forEvent:1];
      objc_initWeak((id *)buf, self);
      int v14 = self->_navigationListener;
      dispatch_time_t v15 = dispatch_time(0, 3000000000);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __45__MSPSenderETAController__restoreLastSession__block_invoke;
      v20 = &unk_1E617E788;
      v21 = v14;
      v16 = v14;
      objc_copyWeak(&v22, (id *)buf);
      dispatch_after(v15, MEMORY[0x1E4F14428], &v17);
      objc_destroyWeak(&v22);

      objc_destroyWeak((id *)buf);
    }
    [(MSPSenderETAController *)self _invalidateActiveHandles];
  }
}

void __45__MSPSenderETAController__restoreLastSession__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInNavigatingState] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained stopSharingWithReason:0 error:0];
  }
}

- (void)_createGroupSessionIfNeededWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_groupSession)
  {
    id v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "MSPSenderETAController creating group session for uuid %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
    uint64_t v7 = [WeakRetained startSharingGroupSessionWithTripIdentifer:v4];
    groupSession = self->_groupSession;
    self->_groupSession = v7;

    [(MSPSharedTripGroupSession *)self->_groupSession setDelegate:self];
    id v9 = [[MSPSharedTripSenderStrategyController alloc] initWithGroupSession:self->_groupSession messageStrategyDelegate:self];
    senderStrategyController = self->_senderStrategyController;
    self->_senderStrategyController = v9;

    v11 = objc_alloc_init(MSPGroupSessionStorage);
    sessionStorage = self->_sessionStorage;
    self->_sessionStorage = v11;

    v13 = [(MSPSharedTripGroupSession *)self->_groupSession identifier];
    [(MSPGroupSessionStorage *)self->_sessionStorage setGroupIdentifier:v13];

    int v14 = [(MSPSharedTripGroupSession *)self->_groupSession initiatorIdentifier];
    [(MSPGroupSessionStorage *)self->_sessionStorage setOriginatorIdentifier:v14];

    [(MSPSenderETAController *)self _startNavigationListener];
    dispatch_time_t v15 = [(MSPSenderETAController *)self delegate];
    v16 = [(MSPGroupSessionStorage *)self->_sessionStorage groupIdentifier];
    [v15 senderController:self didStartSharingWithGroupIdentifier:v16];
  }
}

- (void)_startingGroupSession
{
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  id v5 = [(MSPNavigationListener *)self->_navigationListener navigationSessionIdentifier];
  [(MSPSenderETAController *)self _createGroupSessionIfNeededWithIdentifier:v5];
}

- (BOOL)startSharingWith:(id)a3 capabilityType:(unint64_t)a4 serviceName:(id)a5 error:(id *)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if ([(MSPSenderETAController *)self _validateNavigationState:a6])
  {
    if (a4 <= 1)
    {
      v52[0] = *MEMORY[0x1E4F28228];
      *(void *)buf = @"Unknown";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v52 count:1];
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:0 userInfo:v12];

      if (a6)
      {
        id v13 = v13;
        BOOL v14 = 0;
        *a6 = v13;
      }
      else
      {
        BOOL v14 = 0;
      }
LABEL_33:

      goto LABEL_34;
    }
    if (![v10 count])
    {
      v52[0] = *MEMORY[0x1E4F28228];
      *(void *)buf = @"No contact handles provided";
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v52 count:1];
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:11 userInfo:v17];

LABEL_25:
      v33 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        destinations = self->_destinations;
        if (a4 - 2 > 2) {
          v35 = @"Unknown";
        }
        else {
          v35 = off_1E617E888[a4 - 2];
        }
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = destinations;
        __int16 v50 = 2114;
        v51 = v35;
        _os_log_impl(&dword_1B87E5000, v33, OS_LOG_TYPE_DEFAULT, "[Sender] destinations is now %{private}@ (startSharingWith %{public}@)", buf, 0x16u);
      }

      if (a6) {
        *a6 = v13;
      }
      BOOL v14 = v13 == 0;
      goto LABEL_33;
    }
    dispatch_time_t v15 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 - 2 > 2) {
        v16 = @"Unknown";
      }
      else {
        v16 = off_1E617E888[a4 - 2];
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v50 = 2114;
      v51 = v16;
      _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_DEFAULT, "[Sender] startSharingWith identifiers: %@, via %{public}@", buf, 0x16u);
    }

    [(MSPSenderETAController *)self _startingGroupSession];
    id v18 = objc_msgSend(MEMORY[0x1E4F6AB90], "_msp_IDSIdentifiersFor:", v10);
    [(NSMutableSet *)self->_destinations addObjectsFromArray:v18];
    [(MSPSharedTripGroupSession *)self->_groupSession addSharingWith:v18];
    uint64_t v19 = v11;
    if (!v11)
    {
      if (a4 - 2 > 2)
      {
        id v20 = 0;
        goto LABEL_18;
      }
      uint64_t v19 = *off_1E617E870[a4 - 2];
    }
    id v20 = v19;
LABEL_18:
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke;
    v46[3] = &unk_1E617E7B0;
    id v21 = v20;
    id v47 = v21;
    unint64_t v48 = a4;
    id v22 = (void *)MEMORY[0x1BA9C2AF0](v46);
    v23 = [MEMORY[0x1E4F64860] sharedPlatform];
    int v24 = [v23 isInternalInstall];

    if (v24)
    {
      MSPSharedTripGetVirtualReceivers(v10);
      __int16 v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ([(__CFString *)v25 count])
      {
        v26 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [(__CFString *)v25 count];
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v27;
          __int16 v50 = 2114;
          v51 = v25;
          _os_log_impl(&dword_1B87E5000, v26, OS_LOG_TYPE_DEFAULT, "[Sender] found %lu virtual receivers: %{public}@", buf, 0x16u);
        }

        senderStrategyController = self->_senderStrategyController;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke_23;
        v43[3] = &unk_1E617E7D8;
        id v45 = v22;
        v44 = v25;
        [(MSPSharedTripSenderStrategyController *)senderStrategyController performWithVirtualSenders:1 block:v43];
        uint64_t v29 = MSPSharedTripGetRealReceivers(v18);

        id v18 = (void *)v29;
      }
    }
    v30 = self->_senderStrategyController;
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke_2;
    v40 = &unk_1E617E7D8;
    id v41 = v18;
    id v42 = v22;
    id v31 = v18;
    id v32 = v22;
    [(MSPSharedTripSenderStrategyController *)v30 performWithVirtualSenders:0 block:&v37];
    [(MSPSenderETAController *)self _updateStorage];
    [(MSPSenderETAController *)self _invalidateActiveHandles];

    id v13 = 0;
    goto LABEL_25;
  }
  BOOL v14 = 0;
LABEL_34:

  return v14;
}

void __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [v8 addParticipants:v5 forServiceName:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40) == 4)
  {
    v6 = [MEMORY[0x1E4F64860] sharedPlatform];
    if ([v6 isInternalInstall])
    {
      int BOOL = GEOConfigGetBOOL();

      if (BOOL) {
        [v8 addLiveParticipants:v5];
      }
    }
    else
    {
    }
  }
}

uint64_t __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke_23(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __76__MSPSenderETAController_startSharingWith_capabilityType_serviceName_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (BOOL)startSharingWithGroup:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)stopSharingWithGroup:(id)a3 reason:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)stopSharingWith:(id)a3 reason:(unint64_t)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35 = v6;
  if ([v6 count])
  {
    objc_msgSend(MEMORY[0x1E4F6AB90], "_msp_IDSIdentifiersFor:", v6);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    char v7 = 0;
    uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v12 = [MEMORY[0x1E4F64860] sharedPlatform];
          int v13 = [v12 isInternalInstall];

          if (v13 && (MSPSharedTripVirtualReceiverIsValid(v11) & 1) != 0)
          {
            *(void *)unint64_t v48 = 0;
            *(void *)&v48[8] = v48;
            *(void *)&v48[16] = 0x2020000000;
            char v49 = 0;
            senderStrategyController = self->_senderStrategyController;
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __55__MSPSenderETAController_stopSharingWith_reason_error___block_invoke_25;
            v39[3] = &unk_1E617E800;
            v39[5] = v48;
            v39[6] = a4;
            v39[4] = v11;
            [(MSPSharedTripSenderStrategyController *)senderStrategyController performWithVirtualSenders:1 block:v39];
            dispatch_time_t v15 = MSPGetSharedTripLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = @"YES";
              if (!*(unsigned char *)(*(void *)&v48[8] + 24)) {
                v16 = @"NO";
              }
              int v17 = v16;
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v11;
              __int16 v46 = 2114;
              id v47 = v17;
              _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "stopSharingWith (virtual): %{public}@ wasSharing: %{public}@", buf, 0x16u);
            }
          }
          else
          {
            *(void *)unint64_t v48 = 0;
            *(void *)&v48[8] = v48;
            *(void *)&v48[16] = 0x2020000000;
            char v49 = 0;
            id v18 = self->_senderStrategyController;
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __55__MSPSenderETAController_stopSharingWith_reason_error___block_invoke;
            v40[3] = &unk_1E617E800;
            v40[5] = v48;
            v40[6] = a4;
            v40[4] = v11;
            [(MSPSharedTripSenderStrategyController *)v18 performWithVirtualSenders:0 block:v40];
            dispatch_time_t v15 = MSPGetSharedTripLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = @"YES";
              if (!*(unsigned char *)(*(void *)&v48[8] + 24)) {
                uint64_t v19 = @"NO";
              }
              id v20 = v19;
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v11;
              __int16 v46 = 2114;
              id v47 = v20;
              _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "stopSharingWith: %{public}@ wasSharing: %{public}@", buf, 0x16u);
            }
          }

          if ((v7 & 1) == 0 && *(unsigned char *)(*(void *)&v48[8] + 24)) {
            char v7 = 1;
          }
          _Block_object_dispose(v48, 8);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v8);
    }

    id v21 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [obj count];
      *(_DWORD *)unint64_t v48 = 134218243;
      *(void *)&v48[4] = v22;
      *(_WORD *)&v48[12] = 2113;
      *(void *)&v48[14] = obj;
      _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_INFO, "Removing %lu identifiers from sharing: %{private}@", v48, 0x16u);
    }

    destinations = self->_destinations;
    int v24 = [MEMORY[0x1E4F1CAD0] setWithArray:obj];
    [(NSMutableSet *)destinations minusSet:v24];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
    v26 = [WeakRetained removeSharingWith:obj];
    groupSession = self->_groupSession;
    self->_groupSession = v26;

    [(MSPSenderETAController *)self _updateStorage];
    if (![(NSMutableSet *)self->_destinations count]) {
      [(MSPSenderETAController *)self _cleanObjects];
    }
    [(MSPSenderETAController *)self _invalidateActiveHandles];

    BOOL v28 = v7 & 1;
  }
  else
  {
    BOOL v28 = 0;
  }
  if (a5 && !v28)
  {
    uint64_t v29 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v48 = 0;
      _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_ERROR, "[Sender] Asked to stop sharing but we didn't match with any of the handles", v48, 2u);
    }

    *(void *)buf = *MEMORY[0x1E4F28228];
    *(void *)unint64_t v48 = @"Not currently sharing with contacts";
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:buf count:1];
    id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:13 userInfo:v30];

    *a5 = v31;
  }
  id v32 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = self->_destinations;
    *(_DWORD *)unint64_t v48 = 138477827;
    *(void *)&v48[4] = v33;
    _os_log_impl(&dword_1B87E5000, v32, OS_LOG_TYPE_DEFAULT, "[Sender] destinations is now %{private}@ (stopSharingWith)", v48, 0xCu);
  }

  return v28;
}

void __55__MSPSenderETAController_stopSharingWith_reason_error___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  LOBYTE(v3) = [v5 removeParticipant:v3 reason:v4];
  LOBYTE(v4) = [v5 removeLiveParticipant:a1[4]];

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3 | v4;
}

void __55__MSPSenderETAController_stopSharingWith_reason_error___block_invoke_25(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  LOBYTE(v3) = [v5 removeParticipant:v3 reason:v4];
  LOBYTE(v4) = [v5 removeLiveParticipant:a1[4]];

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3 | v4;
}

- (BOOL)stopSharingWithReason:(unint64_t)a3 error:(id *)a4
{
  char v7 = [(NSMutableSet *)self->_destinations allObjects];
  BOOL v8 = [(MSPSenderETAController *)self stopSharingWith:v7 reason:a3 error:a4];

  if ([(NSMutableSet *)self->_destinations count])
  {
    uint64_t v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_FAULT, "[Sender] stopSharing didn't clear all destinations, forcing it now", v11, 2u);
    }

    [(MSPSenderETAController *)self _updateStorage];
    [(MSPSenderETAController *)self _cleanObjects];
    [(MSPSenderETAController *)self _invalidateActiveHandles];
  }
  return v8;
}

void __52__MSPSenderETAController_serviceNamesByActiveHandle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(a2, "participants", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_startLiveForVirtualReceiver:(id)a3
{
  uint64_t v4 = [a3 object];
  id v5 = v4;
  if (v4)
  {
    senderStrategyController = self->_senderStrategyController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__MSPSenderETAController__startLiveForVirtualReceiver___block_invoke;
    v7[3] = &unk_1E617E850;
    id v8 = v4;
    [(MSPSharedTripSenderStrategyController *)senderStrategyController performWithVirtualSenders:1 block:v7];
  }
}

void __55__MSPSenderETAController__startLiveForVirtualReceiver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "addLiveParticipants:", v4, v5, v6);
}

- (void)_stopLiveForVirtualReceiver:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = v4;
  if (v4)
  {
    senderStrategyController = self->_senderStrategyController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__MSPSenderETAController__stopLiveForVirtualReceiver___block_invoke;
    v7[3] = &unk_1E617E850;
    id v8 = v4;
    [(MSPSharedTripSenderStrategyController *)senderStrategyController performWithVirtualSenders:1 block:v7];
  }
}

uint64_t __54__MSPSenderETAController__stopLiveForVirtualReceiver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeLiveParticipant:*(void *)(a1 + 32)];
}

- (void)_cleanObjects
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[MSPSenderETAController _cleanObjects]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Sender] %s", (uint8_t *)&v9, 0xCu);
  }

  sessionStorage = self->_sessionStorage;
  self->_sessionStorage = 0;

  [(MSPSharedTripStorageController *)self->_storageController setSenderSessionStorage:0];
  senderStrategyController = self->_senderStrategyController;
  self->_senderStrategyController = 0;

  [(NSMutableSet *)self->_destinations removeAllObjects];
  [(MSPSenderETAController *)self _stopNavigationListener];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  [WeakRetained stopSharing];

  groupSession = self->_groupSession;
  self->_groupSession = 0;

  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)_invalidateSharedTripWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSPSenderETAController__invalidateSharedTripWithError___block_invoke;
  block[3] = &unk_1E617C560;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__MSPSenderETAController__invalidateSharedTripWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained delegate];
    [v3 senderController:v4 didInvalidateSharedTripWithError:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)_invalidateActiveHandles
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSPSenderETAController__invalidateActiveHandles__block_invoke;
  block[3] = &unk_1E617C770;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__MSPSenderETAController__invalidateActiveHandles__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 invalidateActiveHandlesForSenderController:*(void *)(a1 + 32)];
}

- (void)_startNavigationListener
{
  id v3 = [(MSPNavigationListener *)self->_navigationListener delegate];

  if (!v3)
  {
    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "MSPSenderETAController start listening to navigation", v5, 2u);
    }

    [(MSPNavigationListener *)self->_navigationListener setDelegate:self];
  }
}

- (void)_stopNavigationListener
{
  id v3 = [(MSPNavigationListener *)self->_navigationListener delegate];

  if (v3 == self)
  {
    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "MSPSenderETAController stop listening to navigation", v5, 2u);
    }

    [(MSPNavigationListener *)self->_navigationListener setDelegate:0];
  }
}

- (BOOL)_validateNavigationState:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (![(MSPNavigationListener *)self->_navigationListener isInNavigatingState])
  {
    v15[0] = *MEMORY[0x1E4F28228];
    *(void *)long long v12 = @"Not navigating";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v15 count:1];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = 7;
    goto LABEL_9;
  }
  if (![(MSPNavigationListener *)self->_navigationListener isCompatibleTransportType])
  {
    v15[0] = *MEMORY[0x1E4F28228];
    *(void *)long long v12 = @"Incompatible transport type";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v15 count:1];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = 8;
    goto LABEL_9;
  }
  if (![(MSPNavigationListener *)self->_navigationListener isCompatibleNavigationType])
  {
    v15[0] = *MEMORY[0x1E4F28228];
    *(void *)long long v12 = @"Incompatible navigation type";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v15 count:1];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = 9;
LABEL_9:
    id v5 = [v7 errorWithDomain:@"com.apple.Maps.SharedTrip" code:v8 userInfo:v6];

    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v5 = 0;
  if (a3) {
LABEL_10:
  }
    *a3 = v5;
LABEL_11:
  if (v5)
  {
    int v9 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      navigationListener = self->_navigationListener;
      *(_DWORD *)long long v12 = 138412546;
      *(void *)&v12[4] = v5;
      __int16 v13 = 2112;
      long long v14 = navigationListener;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_ERROR, "[Sender] invalid navigation state for sharing: %@ | listener: %@", v12, 0x16u);
    }
  }
  return v5 == 0;
}

- (void)_setState:(id)a3 forEvent:(unint64_t)a4
{
  if (a3) {
    [(MSPSharedTripSenderStrategyController *)self->_senderStrategyController setState:a3 forEvent:a4];
  }
}

- (id)rulesForParticipant:(id)a3
{
  return [(MSPSharedTripStorageController *)self->_storageController sendingRulesForIdentifier:a3];
}

- (void)touchedRules
{
}

- (void)navigationListenerWaypointsUpdated:(id)a3
{
  uint64_t v4 = [a3 currentState];
  if (v4)
  {
    [(MSPSenderETAController *)self _setState:v4 forEvent:3];
    [(MSPSenderETAController *)self _updateStorage];
  }

  MEMORY[0x1F41817F8]();
}

- (void)navigationListenerIsReady:(id)a3
{
  uint64_t v4 = [a3 currentState];
  if (v4)
  {
    [(MSPSenderETAController *)self _setState:v4 forEvent:0];
    [(MSPSenderETAController *)self _updateStorage];
  }

  MEMORY[0x1F41817F8]();
}

- (void)navigationListenerETAUpdated:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:2];
}

- (void)navigationListenerLocationUpdated:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:4];
}

- (void)navigationListenerRouteUpdated:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:5];
}

- (void)navigationListenerTrafficUpdated:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:6];
}

- (void)navigationListenerArrived:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:7];
}

- (void)navigationListenerResumed:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:8];
}

- (void)navigationListenerStopped:(id)a3
{
  id v4 = [a3 currentState];
  [(MSPSenderETAController *)self _setState:v4 forEvent:9];
  [(MSPSenderETAController *)self stopSharingWithReason:0 error:0];
}

- (void)groupSession:(id)a3 participantDidJoin:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Sender] live participant did join %@", buf, 0xCu);
  }

  if (v5)
  {
    senderStrategyController = self->_senderStrategyController;
    id v9 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [(MSPSharedTripSenderStrategyController *)senderStrategyController addLiveParticipants:v8];

    [(MSPSenderETAController *)self _updateStorage];
    [(MSPSenderETAController *)self _invalidateActiveHandles];
  }
}

- (void)groupSession:(id)a3 participantDidLeave:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[Sender] live participant did leave %@", (uint8_t *)&v7, 0xCu);
  }

  if (v5)
  {
    [(MSPSharedTripSenderStrategyController *)self->_senderStrategyController removeLiveParticipant:v5];
    [(MSPSenderETAController *)self _updateStorage];
    [(MSPSenderETAController *)self _invalidateActiveHandles];
  }
}

- (void)groupSessionEnded:(id)a3 withError:(id)a4
{
  id v5 = a4;
  [(MSPSenderETAController *)self stopSharingWithReason:0 error:0];
  [(MSPSenderETAController *)self _invalidateSharedTripWithError:v5];
}

- (MSPSenderETAControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSenderETAControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_sessionStorage, 0);
  objc_storeStrong((id *)&self->_senderStrategyController, 0);
  objc_storeStrong((id *)&self->_groupSession, 0);
  objc_destroyWeak((id *)&self->_idsRelay);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end