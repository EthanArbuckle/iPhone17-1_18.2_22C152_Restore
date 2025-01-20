@interface MSPReceiverETAController
- (BOOL)_allowMessageWithState:(id)a3 forGroup:(id)a4 fromID:(id)a5;
- (BOOL)_cleanUpNecessaryForGroup:(id)a3;
- (BOOL)subscribeToUpdatesToSharedTrip:(id)a3 error:(id *)a4;
- (BOOL)unsubscribeFromUpdatesToSharedTrip:(id)a3 error:(id *)a4;
- (MSPReceiverETAController)initWithRelay:(id)a3;
- (MSPReceiverETAControllerDelegate)delegate;
- (NSArray)allTrips;
- (void)_cleanGroup:(id)a3;
- (void)_cleanupIfNecessary;
- (void)_resolveContactIfNeeded:(id)a3 fromId:(id)a4 completion:(id)a5;
- (void)_setNotificationCenter:(id)a3;
- (void)_showOrUpdateNotificationIfNeeded:(id)a3;
- (void)_updateData:(id)a3 forGroup:(id)a4 fromID:(id)a5;
- (void)_updateDelegateWithUpdateState:(id)a3 to:(id)a4 freshAvailable:(BOOL)a5;
- (void)blockSharedTrip:(id)a3;
- (void)cleanTimer;
- (void)clearBlockedTripIdentifiers;
- (void)dealloc;
- (void)groupSessionEnded:(id)a3;
- (void)purgeExpiredBlockedTripIdentifiers;
- (void)relay:(id)a3 receiveData:(id)a4 info:(id)a5 fromID:(id)a6;
- (void)relay:(id)a3 sharingClosed:(id)a4;
- (void)setDelegate:(id)a3;
- (void)storageController:(id)a3 updatedSharedTripGroupStorage:(id)a4;
- (void)updateContacts;
@end

@implementation MSPReceiverETAController

- (NSArray)allTrips
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  v4 = [WeakRetained storageController];
  [v4 initialiseStoredSessionsIfNeeded];

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_orderedNavStateIdentifiers, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_orderedNavStateIdentifiers;
  uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return (NSArray *)v12;
}

- (MSPReceiverETAController)initWithRelay:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSPReceiverETAController;
  v5 = [(MSPReceiverETAController *)&v22 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_idsRelay, v4);
    uint64_t v7 = +[MSPSharedTripBlocklist sharedInstance];
    blockedList = v6->_blockedList;
    v6->_blockedList = (MSPSharedTripBlocklist *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedSessions = v6->_sharedSessions;
    v6->_sharedSessions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedNavStates = v6->_sharedNavStates;
    v6->_sharedNavStates = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    waitingNavStates = v6->_waitingNavStates;
    v6->_waitingNavStates = v13;

    long long v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    orderedNavStateIdentifiers = v6->_orderedNavStateIdentifiers;
    v6->_orderedNavStateIdentifiers = v15;

    long long v17 = [v4 storageController];
    [v17 setDelegate:v6];

    [v4 setDelegate:v6];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel_updateContacts name:*MEMORY[0x1E4F1AF80] object:0];
  }
  uint64_t v19 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEBUG, "MSPReceiverETAController initialized", v21, 2u);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPReceiverETAController dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[Receiver] %{private}s", buf, 0xCu);
  }

  [(NSTimer *)self->_cleanupTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MSPReceiverETAController;
  [(MSPReceiverETAController *)&v4 dealloc];
}

- (void)_setNotificationCenter:(id)a3
{
}

- (void)cleanTimer
{
  [(NSTimer *)self->_cleanupTimer invalidate];
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;
}

- (BOOL)subscribeToUpdatesToSharedTrip:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v23 = 138412290;
    *(void *)&v23[4] = v6;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController subscribeToUpdatesToSharedTrip sharedTripIdentifier: %@", v23, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  uint64_t v9 = [WeakRetained storageController];
  v10 = [v9 groupSessionInfoForKey:v6];

  if ([v10 hasState])
  {
    v11 = [v10 state];
    if ([v11 closed])
    {

      goto LABEL_7;
    }
    v12 = [v10 state];
    int v13 = [v12 arrived];

    if (v13)
    {
LABEL_7:
      if (a4)
      {
        v24[0] = *MEMORY[0x1E4F28228];
        *(void *)v23 = @"Trip already ended";
        long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v24 count:1];
        long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:18 userInfo:v14];

        char v16 = 0;
        *a4 = v15;
      }
      else
      {
        char v16 = 0;
      }
      goto LABEL_13;
    }
  }
  long long v17 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v6];
  if (!v17)
  {
    long long v17 = [WeakRetained groupSessionForIdentifier:v6];
    [(NSMutableDictionary *)self->_sharedSessions setObject:v17 forKeyedSubscript:v6];
    if (!self->_transaction)
    {
      v18 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v18;
    }
  }
  v20 = [v10 receivingHandle];
  v21 = [v10 receivingAccountIdentifier];
  char v16 = [v17 joinLiveModeFromHandle:v20 fromAccountID:v21 error:a4];

LABEL_13:
  return v16;
}

- (BOOL)unsubscribeFromUpdatesToSharedTrip:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v15 = 138412290;
    *(void *)&v15[4] = v6;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController unsubscribeFromUpdatesToSharedTrip sharedTripIdentifier: %@", v15, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    if (a4)
    {
      v16[0] = *MEMORY[0x1E4F28228];
      *(void *)long long v15 = @"Invalid trip ID";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v16 count:1];
      int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.SharedTrip" code:17 userInfo:v12];

      BOOL v11 = 0;
      *a4 = v13;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  if (![v8 leaveLiveModeIfNeeded:a4]) {
    goto LABEL_10;
  }
  [(NSMutableDictionary *)self->_sharedSessions setObject:0 forKeyedSubscript:v6];
  if (![(NSMutableDictionary *)self->_sharedSessions count])
  {
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)blockSharedTrip:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (MSPSharedTripBlocklist *)a3;
  v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController blockSharedTrip identifier: %@", buf, 0xCu);
  }

  [(MSPReceiverETAController *)self unsubscribeFromUpdatesToSharedTrip:v4 error:0];
  [(MSPSharedTripBlocklist *)self->_blockedList blockIdentifier:v4];
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    blockedList = self->_blockedList;
    *(_DWORD *)buf = 138412290;
    v25 = blockedList;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController blockSharedTrip _blockedList: %@", buf, 0xCu);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_sharedNavStates allValues];
  uint64_t v9 = (void *)[v8 copy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v16 = self->_blockedList;
        long long v17 = objc_msgSend(v15, "groupIdentifier", (void)v19);
        LODWORD(v16) = [(MSPSharedTripBlocklist *)v16 containsIdentifier:v17];

        if (v16)
        {
          v18 = [v15 groupIdentifier];
          [(MSPReceiverETAController *)self _cleanGroup:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)clearBlockedTripIdentifiers
{
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController clear blocked trip identifiers", v4, 2u);
  }

  [(MSPSharedTripBlocklist *)self->_blockedList clearBlockedIdentifiers];
}

- (void)purgeExpiredBlockedTripIdentifiers
{
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController purge expired blocked trip identifiers", v4, 2u);
  }

  [(MSPSharedTripBlocklist *)self->_blockedList purgeExpiredIdentifiers];
}

- (void)_showOrUpdateNotificationIfNeeded:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    v5 = [(NSMutableDictionary *)self->_sharedNavStates objectForKeyedSubscript:v4];
    if ([v5 hasClosed] && objc_msgSend(v5, "closed"))
    {
      id v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        id v30 = v4;
        uint64_t v7 = "[SR] _showOrUpdateNotification trip closed id %@";
LABEL_10:
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v29, 0xCu);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
    if ([v5 hasMuted] && objc_msgSend(v5, "muted"))
    {
      id v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        id v30 = v4;
        uint64_t v7 = "[SR] _showOrUpdateNotification trip muted id %@";
        goto LABEL_10;
      }
LABEL_31:

      goto LABEL_32;
    }
    id v6 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v4];
    if ([v6 inLiveMode])
    {
      id WeakRetained = MSPGetSharedTripLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        id v30 = v4;
        _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification while in live mode %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_30;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
    uint64_t v9 = [WeakRetained storageController];
    id v10 = [v9 receivingRulesForIdentifier:v4];

    if (v10)
    {
      uint64_t v11 = [v5 destinationWaypointInfo];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = [v5 etaInfo];
        if (v13)
        {
          long long v14 = (void *)v13;
          long long v15 = [v5 senderInfo];
          char v16 = [v15 localName];

          if (v16)
          {
            long long v17 = [v5 etaInfo];
            [v17 etaTimestamp];
            double v19 = v18;
            [v5 updatedTimestamp];
            [v10 didReceiveUpdateWithETA:v19 lastUpdated:v20];

            unint64_t v21 = [v10 currentlyNecessaryNotificationTypeForState:v5];
            long long v22 = MSPGetSharedTripLog();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v21)
            {
              if (v23)
              {
                v24 = [v5 mspDescription];
                v25 = MSPSharedTripNotificationTypeAsString(v21);
                int v29 = 138412802;
                id v30 = v4;
                __int16 v31 = 2112;
                v32 = v24;
                __int16 v33 = 2114;
                v34 = v25;
                _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification id %@ state %@ notificationType: %{public}@", (uint8_t *)&v29, 0x20u);
              }
              mapsNotificationCenter = self->_mapsNotificationCenter;
              v27 = [v5 data];
              [(MDNotificationCenter *)mapsNotificationCenter showSharedTripNotification:v4 ofType:v21 forState:v27];

              [v10 didPostNotificationType:v21 forState:v5];
            }
            else
            {
              if (v23)
              {
                LOWORD(v29) = 0;
                _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification not showing notification as type is none", (uint8_t *)&v29, 2u);
              }
            }
            v28 = [WeakRetained storageController];
            [v28 receivingRulesTouched];
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
        }
        else
        {
        }
      }
    }
    v28 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_1B87E5000, v28, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification skipping notification, rules: %@ currentState: %@", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_29;
  }
LABEL_32:
}

- (void)_resolveContactIfNeeded:(id)a3 fromId:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  sharedNavStates = self->_sharedNavStates;
  id v11 = a4;
  uint64_t v12 = [(NSMutableDictionary *)sharedNavStates objectForKeyedSubscript:v8];
  uint64_t v13 = [v11 componentsSeparatedByString:@":"];

  long long v14 = [v13 lastObject];
  long long v15 = [v12 senderInfo];
  [v15 setFromIdentifier:v14];

  char v16 = [v12 senderInfo];
  char v17 = [v16 hasLocalName];

  if (v17)
  {
    v9[2](v9);
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke;
    v30[3] = &unk_1E617C510;
    id v18 = v12;
    id v31 = v18;
    id v19 = v14;
    id v32 = v19;
    double v20 = (void (**)(void))MEMORY[0x1BA9C2AF0](v30);
    int v21 = objc_msgSend(MEMORY[0x1E4F1B980], "_maps_isAuthorized");
    long long v22 = MSPGetSharedTripLog();
    BOOL v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v24 = [v18 mspDescription];
        *(_DWORD *)buf = 138478339;
        id v34 = v19;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_INFO, "[SR] _resolveContact %{private}@ (id %@ state %@)", buf, 0x20u);
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke_22;
      v26[3] = &unk_1E617C538;
      id v27 = v18;
      v28 = v20;
      int v29 = v9;
      +[MSPContact contactWithAccountIdentifier:v19 completion:v26];
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v25 = [v18 mspDescription];
        *(_DWORD *)buf = 138478339;
        id v34 = v19;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_ERROR, "[SR] _resolveContact [not authorized for Contacts access] %{private}@ (id %@ state %@)", buf, 0x20u);
      }
      v20[2](v20);
      v9[2](v9);
    }
  }
}

void __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) senderInfo];
  v3 = [v2 fromDisplayName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) senderInfo];
    v5 = [v8 fromDisplayName];
    id v6 = [*(id *)(a1 + 32) senderInfo];
    [v6 setLocalName:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) senderInfo];
    [v8 setLocalName:v7];
  }
}

void __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 length] && objc_msgSend(v5, "length"))
  {
    id v6 = [*(id *)(a1 + 32) senderInfo];
    [v6 setLocalName:v8];

    uint64_t v7 = [*(id *)(a1 + 32) senderInfo];
    [v7 setLocalContactIdentifier:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateContacts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_sharedNavStates allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v7 = [v6 senderInfo];
        [v7 setLocalName:0];

        id v8 = [v6 senderInfo];
        [v8 setLocalContactIdentifier:0];

        objc_initWeak(&location, self);
        uint64_t v9 = [v6 groupIdentifier];
        id v10 = [v6 senderInfo];
        id v11 = [v10 fromIdentifier];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __42__MSPReceiverETAController_updateContacts__block_invoke;
        v13[3] = &unk_1E617C560;
        objc_copyWeak(&v14, &location);
        v13[4] = v6;
        [(MSPReceiverETAController *)self _resolveContactIfNeeded:v9 fromId:v11 completion:v13];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

void __42__MSPReceiverETAController_updateContacts__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 10);
    id v4 = v7[3];
    id v5 = [*(id *)(a1 + 32) groupIdentifier];
    id v6 = [v4 objectForKeyedSubscript:v5];
    [v3 etaController:v7 didUpdateETAForSharedTrip:v6];

    id WeakRetained = v7;
  }
}

- (BOOL)_allowMessageWithState:(id)a3 forGroup:(id)a4 fromID:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (__CFString *)a4;
  id v8 = (__CFString *)a5;
  if ([(__CFString *)v7 length])
  {
    if ([(MSPSharedTripBlocklist *)self->_blockedList containsIdentifier:v7])
    {
      uint64_t v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        blockedList = self->_blockedList;
        int v33 = 138412546;
        id v34 = (__CFString *)blockedList;
        __int16 v35 = 2112;
        id v36 = v7;
        id v11 = "[SR] _allowMessageWithState NO blocklist %@ contains identifier %@";
        uint64_t v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 22;
LABEL_7:
        _os_log_impl(&dword_1B87E5000, v12, v13, v11, (uint8_t *)&v33, v14);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    uint64_t v9 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v7];
    if (v9)
    {
      long long v15 = [(__CFString *)v8 componentsSeparatedByString:@":"];
      long long v16 = [v15 lastObject];
      if (![v16 length])
      {
LABEL_21:

        goto LABEL_22;
      }
      long long v17 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v7];
      long long v18 = [v17 initiatorIdentifier];
      char v19 = [v18 isEqualToString:v8];

      double v20 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v7];
      uint64_t v21 = [v20 accountIdentifiers];
      char v22 = [v21 containsObject:v16];

      if ((v19 & 1) == 0 && (v22 & 1) == 0)
      {
        BOOL v23 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v33 = 138412290;
          id v34 = v8;
          _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_ERROR, "fromID %@", (uint8_t *)&v33, 0xCu);
        }

        v24 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v7];
          uint64_t v26 = [v25 initiatorIdentifier];
          int v33 = 138412290;
          id v34 = v26;
          _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_ERROR, "initiatorIdentifier %@", (uint8_t *)&v33, 0xCu);
        }
        id v27 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [(NSMutableDictionary *)self->_sharedSessions objectForKeyedSubscript:v7];
          int v29 = [v28 accountIdentifiers];
          int v33 = 138412290;
          id v34 = v29;
          _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_ERROR, "accountIdentifiers %@", (uint8_t *)&v33, 0xCu);
        }
        id v30 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v33 = 138412546;
          id v34 = @"NO";
          __int16 v35 = 2112;
          id v36 = @"NO";
          _os_log_impl(&dword_1B87E5000, v30, OS_LOG_TYPE_ERROR, "_allowMessageWithState NO senderIsGroupInitiator %@, groupContainsSender %@", (uint8_t *)&v33, 0x16u);
        }

        goto LABEL_21;
      }
    }
    BOOL v31 = 1;
    goto LABEL_23;
  }
  uint64_t v9 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    id v11 = "[SR] _allowMessageWithState NO nil group identifier";
    uint64_t v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 2;
    goto LABEL_7;
  }
LABEL_22:
  BOOL v31 = 0;
LABEL_23:

  return v31;
}

- (void)_updateData:(id)a3 forGroup:(id)a4 fromID:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F64A38]) initWithData:v8];
  if (([v11 hasEtaInfo] & 1) != 0
    || ([v11 hasRouteInfo] & 1) != 0
    || ([v11 hasDestinationInfo] & 1) != 0
    || [v11 waypointInfosCount]
    || ([v11 hasSenderInfo] & 1) != 0)
  {
    if ([(MSPReceiverETAController *)self _allowMessageWithState:v11 forGroup:v9 fromID:v10])
    {
      [v11 setGroupIdentifier:v9];
      uint64_t v12 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v13 = [v11 mspDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = v13;
        _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_DEFAULT, "[SR] processing incoming state %@", buf, 0xCu);
      }
      uint32_t v14 = [(NSMutableDictionary *)self->_sharedNavStates objectForKeyedSubscript:v9];
      id v32 = (void *)[v11 copy];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
      long long v16 = [WeakRetained storageController];
      [v16 updateGroupSessionStorageWithState:v32];

      if (v14)
      {
        [v14 merge:v11];
        long long v17 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = [v14 mspDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = v18;
          _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_INFO, "[SR] merge with existing state %@", buf, 0xCu);
        }
        char v19 = v14;
      }
      else
      {
        v25 = v11;
        uint64_t v26 = [(NSMutableDictionary *)self->_waitingNavStates objectForKeyedSubscript:v9];
        long long v17 = v26;
        if (v26)
        {
          [v26 merge:v25];
          char v19 = v17;

          id v27 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = [v19 mspDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v28;
            _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_INFO, "[SR] merge with waiting state %@", buf, 0xCu);
          }
        }
        else
        {
          char v19 = v25;
        }
        if (([v19 hasDestinationInfo] & 1) == 0
          && ![v19 waypointInfosCount]
          || ([v19 hasSenderInfo] & 1) == 0)
        {
          [(NSMutableDictionary *)self->_waitingNavStates setObject:v19 forKeyedSubscript:v9];
          int v29 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [v19 mspDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v30;
            _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_INFO, "[SR] wait state %@", buf, 0xCu);
          }
          goto LABEL_33;
        }
        [(NSMutableDictionary *)self->_waitingNavStates setObject:0 forKeyedSubscript:v9];
        [(NSMutableDictionary *)self->_sharedNavStates setObject:v19 forKeyedSubscript:v9];
        if (([(NSMutableOrderedSet *)self->_orderedNavStateIdentifiers containsObject:v9] & 1) == 0) {
          [(NSMutableOrderedSet *)self->_orderedNavStateIdentifiers insertObject:v9 atIndex:0];
        }
      }

      double v20 = [MEMORY[0x1E4F1C9C8] date];
      [v20 timeIntervalSinceReferenceDate];
      -[NSObject setLocalUpdatedTimestamp:](v19, "setLocalUpdatedTimestamp:");

      if ([(MSPReceiverETAController *)self _cleanUpNecessaryForGroup:v9])
      {
        [(MSPReceiverETAController *)self _cleanGroup:v9];
      }
      else
      {
        if (!self->_cleanupTimer)
        {
          char v22 = (void *)MEMORY[0x1E4F1CB00];
          GEOConfigGetDouble();
          objc_msgSend(v22, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__cleanupIfNecessary, 0, 1);
          BOOL v23 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          cleanupTimer = self->_cleanupTimer;
          self->_cleanupTimer = v23;
        }
        objc_initWeak((id *)buf, self);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __56__MSPReceiverETAController__updateData_forGroup_fromID___block_invoke;
        v33[3] = &unk_1E617C588;
        objc_copyWeak(&v36, (id *)buf);
        id v34 = v32;
        char v19 = v19;
        __int16 v35 = v19;
        BOOL v37 = v14 == 0;
        [(MSPReceiverETAController *)self _resolveContactIfNeeded:v9 fromId:v10 completion:v33];

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
LABEL_33:

      goto LABEL_34;
    }
    char v19 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v11 mspDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v21;
      _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEFAULT, "[SR] discarding message %@", buf, 0xCu);
    }
  }
  else
  {
    char v19 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v31 = [v11 mspDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v31;
      _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[SR] incoming state is missing too many fields: %@", buf, 0xCu);
    }
  }
LABEL_34:
}

void __56__MSPReceiverETAController__updateData_forGroup_fromID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateDelegateWithUpdateState:*(void *)(a1 + 32) to:*(void *)(a1 + 40) freshAvailable:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_updateDelegateWithUpdateState:(id)a3 to:(id)a4 freshAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 hasRouteInfo];
  int v11 = [v8 hasDestinationInfo];
  int v12 = [v8 hasEtaInfo];
  LODWORD(v13) = [v8 arrived];
  int v32 = [v8 closed];
  if ([v8 hasMuted] && objc_msgSend(v8, "muted"))
  {
    uint32_t v14 = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = [v8 mspDescription];
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[SR] _updateDelegateWithUpdateState update muted %@", buf, 0xCu);
    }
  }
  else
  {
    long long v16 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      char v31 = (char)v13;
      if (v11) {
        long long v17 = @"YES";
      }
      else {
        long long v17 = @"NO";
      }
      v28 = self;
      long long v18 = v17;
      if (v10) {
        char v19 = @"YES";
      }
      else {
        char v19 = @"NO";
      }
      double v20 = v19;
      if (v12) {
        uint64_t v21 = @"YES";
      }
      else {
        uint64_t v21 = @"NO";
      }
      int v30 = v12;
      char v22 = v21;
      if (v13) {
        BOOL v23 = @"YES";
      }
      else {
        BOOL v23 = @"NO";
      }
      int v29 = v10;
      v24 = v23;
      if (v32) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      os_log_type_t v13 = v25;
      *(_DWORD *)buf = 138413314;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v20;
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_DEFAULT, "[SR] update delegate destination %@ route %@ eta %@ arrived %@ closed %@", buf, 0x34u);

      LOBYTE(v13) = v31;
      int v10 = v29;

      int v12 = v30;
      self = v28;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint32_t v14 = WeakRetained;
    if (v5) {
      [WeakRetained etaController:self sharedTripDidBecomeAvailable:v9];
    }
    if (v32)
    {
      [v9 stripArrivedOrClosedTrip];
      [v14 etaController:self sharedTripDidClose:v9];
    }
    else if (v13)
    {
      [v9 stripArrivedOrClosedTrip];
      [v14 etaController:self didUpdateReachedDestinationForSharedTrip:v9];
    }
    else
    {
      if (v11) {
        [v14 etaController:self didUpdateDestinationForSharedTrip:v9];
      }
      if ((v10 | v12) == 1)
      {
        [v9 truncatePointDataForPrivacy];
        [v14 etaController:self didUpdateRouteForSharedTrip:v9];
      }
      if (v12) {
        [v14 etaController:self didUpdateETAForSharedTrip:v9];
      }
    }
    id v27 = [v9 groupIdentifier];
    [(MSPReceiverETAController *)self _showOrUpdateNotificationIfNeeded:v27];
  }
}

- (void)_cleanupIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->_sharedNavStates allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if ([(MSPReceiverETAController *)self _cleanUpNecessaryForGroup:v8]) {
          [(MSPReceiverETAController *)self _cleanGroup:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)_cleanUpNecessaryForGroup:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedNavStates objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if (([v5 hasLocalUpdatedTimestamp] & 1) == 0)
    {
      uint64_t v8 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v33 = 138412290;
        id v34 = v4;
        _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "_cleanUpNecessaryForGroup called for group %@ without update timestamp", (uint8_t *)&v33, 0xCu);
      }
      goto LABEL_38;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 localUpdatedTimestamp];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    [v8 timeIntervalSinceNow];
    double v10 = v9;
    GEOConfigGetDouble();
    if (v10 < -v11)
    {
      long long v12 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 138412290;
        id v34 = v4;
        _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_DEFAULT, "_cleanUpNecessaryForGroup cleaning group %@ as abandoned", (uint8_t *)&v33, 0xCu);
      }
LABEL_37:

LABEL_38:
      BOOL v13 = 1;
LABEL_39:

      goto LABEL_40;
    }
    BOOL v14 = [v6 hasArrived]
       && [v6 arrived]
       && [v6 numberOfIntermediateStopsRemaining] == 0;
    if ([v6 hasClosed]) {
      int v15 = [v6 closed];
    }
    else {
      int v15 = 0;
    }
    long long v16 = (void *)MEMORY[0x1E4F1C9C8];
    long long v17 = [v6 etaInfo];
    [v17 etaTimestamp];
    long long v18 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    [v18 timeIntervalSinceNow];
    double v20 = v19;

    if ([v6 hasClosureReason])
    {
      unsigned int v21 = [v6 closureReason];
      if (v21 == 1)
      {
        double v22 = 0.0;
        uint64_t v23 = 1;
LABEL_22:
        BOOL v13 = 0;
        int v25 = v14 | v15;
        if (v20 < 0.0) {
          int v25 = 1;
        }
        if (v10 >= -v22 || !v25) {
          goto LABEL_39;
        }
        long long v12 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if (v14) {
            uint64_t v26 = @"YES";
          }
          else {
            uint64_t v26 = @"NO";
          }
          id v27 = v26;
          if (v15) {
            v28 = @"YES";
          }
          else {
            v28 = @"NO";
          }
          int v29 = v28;
          if (v20 >= 0.0) {
            int v30 = @"NO";
          }
          else {
            int v30 = @"YES";
          }
          char v31 = v30;
          int v33 = 138544898;
          id v34 = v4;
          __int16 v35 = 2048;
          double v36 = v22;
          __int16 v37 = 2114;
          v38 = @"YES";
          __int16 v39 = 2114;
          uint64_t v40 = v27;
          __int16 v41 = 2114;
          v42 = v29;
          __int16 v43 = 2048;
          uint64_t v44 = v23;
          __int16 v45 = 2114;
          v46 = v31;
          _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_DEFAULT, "_cleanUpNecessaryForGroup %{public}@ (updateLongerAgoThanExpiryInterval %#.1lfs %{public}@, arrived %{public}@, closed %{public}@ for reason %lu, etaInPast %{public}@)", (uint8_t *)&v33, 0x48u);
        }
        goto LABEL_37;
      }
      uint64_t v23 = v21;
    }
    else
    {
      uint64_t v23 = 0;
    }
    GEOConfigGetDouble();
    double v22 = v24;
    goto LABEL_22;
  }
  BOOL v13 = 0;
LABEL_40:

  return v13;
}

- (void)_cleanGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[SR] cleanGroup %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  uint64_t v7 = [WeakRetained storageController];
  [v7 removeSession:v4];

  uint64_t v8 = [(NSMutableDictionary *)self->_sharedNavStates objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_sharedSessions setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_waitingNavStates setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_sharedNavStates setObject:0 forKeyedSubscript:v4];
  [(NSMutableOrderedSet *)self->_orderedNavStateIdentifiers removeObject:v4];
  if (v8)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __40__MSPReceiverETAController__cleanGroup___block_invoke;
    long long v16 = &unk_1E617C510;
    long long v17 = self;
    id v18 = v8;
    dispatch_async(MEMORY[0x1E4F14428], &v13);
  }
  double v9 = [(NSMutableDictionary *)self->_sharedNavStates allKeys];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    [(NSTimer *)self->_cleanupTimer invalidate];
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = 0;
  }
  if (![(NSMutableDictionary *)self->_sharedSessions count])
  {
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

void __40__MSPReceiverETAController__cleanGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained etaController:*(void *)(a1 + 32) sharedTripDidBecomeUnavailable:*(void *)(a1 + 40)];
}

- (void)relay:(id)a3 receiveData:(id)a4 info:(id)a5 fromID:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v12;
    _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[SR] receiveData from %@", buf, 0xCu);
  }

  int v15 = [v12 objectForKeyedSubscript:0x1F11F7470];
  long long v16 = MEMORY[0x1E4F14428];
  id v17 = MEMORY[0x1E4F14428];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  int v29 = __58__MSPReceiverETAController_relay_receiveData_info_fromID___block_invoke;
  int v30 = &unk_1E617C5B0;
  char v31 = self;
  id v18 = v11;
  id v32 = v18;
  id v19 = v15;
  id v33 = v19;
  id v20 = v13;
  id v34 = v20;
  uint64_t v21 = v16;
  double v22 = v28;
  label = dispatch_queue_get_label(v16);
  double v24 = dispatch_queue_get_label(0);
  if (label == v24 || label && v24 && (double v24 = (const char *)strcmp(label, v24), !v24))
  {
    uint64_t v26 = (void *)MEMORY[0x1BA9C28D0](v24, v25);
    v29((uint64_t)v22);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v22);
  }

  id v27 = (void *)MEMORY[0x1E4F14428];
}

uint64_t __58__MSPReceiverETAController_relay_receiveData_info_fromID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateData:*(void *)(a1 + 40) forGroup:*(void *)(a1 + 48) fromID:*(void *)(a1 + 56)];
}

- (void)relay:(id)a3 sharingClosed:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[SR] sharingClosed %@", buf, 0xCu);
  }

  double v9 = MEMORY[0x1E4F14428];
  id v10 = MEMORY[0x1E4F14428];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  id v20 = __48__MSPReceiverETAController_relay_sharingClosed___block_invoke;
  uint64_t v21 = &unk_1E617C510;
  double v22 = self;
  id v11 = v7;
  id v23 = v11;
  id v12 = v9;
  id v13 = v19;
  label = dispatch_queue_get_label(v9);
  int v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && (int v15 = (const char *)strcmp(label, v15), !v15))
  {
    id v17 = (void *)MEMORY[0x1BA9C28D0](v15, v16);
    v20((uint64_t)v13);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }

  id v18 = (void *)MEMORY[0x1E4F14428];
}

uint64_t __48__MSPReceiverETAController_relay_sharingClosed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cleanUpNecessaryForGroup:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _cleanGroup:v4];
  }
  return result;
}

- (void)storageController:(id)a3 updatedSharedTripGroupStorage:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[SR] updatedSharedTripGroupStorage %@", buf, 0xCu);
  }

  id v7 = [v5 allKeys];
  uint64_t v8 = (void *)[v7 copy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v13;
          _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[SR] keys %@", buf, 0xCu);
        }

        int v15 = [v5 objectForKeyedSubscript:v13];
        uint64_t v16 = [v15 state];
        id v17 = [(NSMutableDictionary *)self->_sharedNavStates objectForKeyedSubscript:v13];

        if (!v17)
        {
          id v18 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v13;
            _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEFAULT, "[SR] restore %@", buf, 0xCu);
          }

          id v19 = [v16 data];
          id v20 = [v15 fromID];
          [(MSPReceiverETAController *)self _updateData:v19 forGroup:v13 fromID:v20];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)groupSessionEnded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v17 = __46__MSPReceiverETAController_groupSessionEnded___block_invoke;
  id v18 = &unk_1E617C510;
  id v19 = self;
  id v8 = v5;
  id v20 = v8;
  uint64_t v9 = v6;
  uint64_t v10 = v16;
  label = dispatch_queue_get_label(v6);
  id v12 = dispatch_queue_get_label(0);
  if (label == v12 || label && v12 && (id v12 = (const char *)strcmp(label, v12), !v12))
  {
    uint64_t v14 = (void *)MEMORY[0x1BA9C28D0](v12, v13);
    v17((uint64_t)v10);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }

  int v15 = (void *)MEMORY[0x1E4F14428];
}

uint64_t __46__MSPReceiverETAController_groupSessionEnded___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cleanUpNecessaryForGroup:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _cleanGroup:v4];
  }
  return result;
}

- (MSPReceiverETAControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPReceiverETAControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_blockedList, 0);
  objc_destroyWeak((id *)&self->_idsRelay);
  objc_storeStrong((id *)&self->_mapsNotificationCenter, 0);
  objc_storeStrong((id *)&self->_orderedNavStateIdentifiers, 0);
  objc_storeStrong((id *)&self->_waitingNavStates, 0);
  objc_storeStrong((id *)&self->_sharedNavStates, 0);
  objc_storeStrong((id *)&self->_sharedSessions, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end