@interface BLTBulletinDistributorSubscriber
- (BLTBulletinDistributorSubscriber)init;
- (BLTBulletinDistributorSubscriber)initWithClient:(id)a3;
- (BLTBulletinDistributorSubscriberDelegate)delegate;
- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate;
- (BLTPingSubscribing)client;
- (NSSet)sectionIDs;
- (NSString)machServiceName;
- (NSXPCConnection)connection;
- (void)_connectIfNecessary;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)sendBulletinSummary:(id)a3;
- (void)setClient:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6;
- (void)subscribeWithMachServiceName:(id)a3;
- (void)unsubscribeFromSectionID:(id)a3;
@end

@implementation BLTBulletinDistributorSubscriber

- (BLTBulletinDistributorSubscriber)init
{
  return [(BLTBulletinDistributorSubscriber *)self initWithClient:0];
}

- (BLTBulletinDistributorSubscriber)initWithClient:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLTBulletinDistributorSubscriber;
  v6 = [(BLTBulletinDistributorSubscriber *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    subscriptions = v7->_subscriptions;
    v7->_subscriptions = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bulletindistributor.subscriber", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (NSSet)sectionIDs
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  dispatch_queue_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__BLTBulletinDistributorSubscriber_sectionIDs__block_invoke;
  v6[3] = &unk_264683E00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __46__BLTBulletinDistributorSubscriber_sectionIDs__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v3 = [v2 setWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
  id v10 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__BLTBulletinDistributorSubscriber_subscribeToSectionID_forFullBulletins_withAck_ackAllowedOnLocalConnection___block_invoke;
  block[3] = &unk_264683E28;
  BOOL v15 = a4;
  BOOL v16 = a5;
  BOOL v17 = a6;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

void __110__BLTBulletinDistributorSubscriber_subscribeToSectionID_forFullBulletins_withAck_ackAllowedOnLocalConnection___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(BLTBulletinDistributorSubscriptionInfo);
  [(BLTBulletinDistributorSubscriptionInfo *)v2 setFullBulletins:*(unsigned __int8 *)(a1 + 48)];
  [(BLTBulletinDistributorSubscriptionInfo *)v2 setAck:*(unsigned __int8 *)(a1 + 49)];
  [(BLTBulletinDistributorSubscriptionInfo *)v2 setAckAllowedOnLocalConnection:*(unsigned __int8 *)(a1 + 50)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)unsubscribeFromSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BLTBulletinDistributorSubscriber_unsubscribeFromSectionID___block_invoke;
  v7[3] = &unk_264683BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __61__BLTBulletinDistributorSubscriber_unsubscribeFromSectionID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__BLTBulletinDistributorSubscriber_pingWithBulletin_ack___block_invoke;
  block[3] = &unk_264683E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __57__BLTBulletinDistributorSubscriber_pingWithBulletin_ack___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) sectionID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4) {
    return;
  }
  [*(id *)(a1 + 32) _connectIfNecessary];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  if (v6)
  {
    id v7 = [v6 remoteObjectProxy];
  }
  else
  {
    id v7 = *(id *)(v5 + 48);
  }
  id v17 = v7;
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = [*(id *)(a1 + 40) sectionID];
  id v10 = [v8 objectForKeyedSubscript:v9];

  dispatch_queue_t v11 = (void *)MEMORY[0x223CAC810](*(void *)(a1 + 48));
  if (!*(void *)(a1 + 48)
    || [v10 ack]
    && (([v10 ackAllowedOnLocalConnection] & 1) != 0
     || ([*(id *)(a1 + 32) deviceDelegate],
         id v12 = objc_claimAutoreleasedReturnValue(),
         char v13 = [v12 isLocallyConnectedToRemote],
         v12,
         (v13 & 1) == 0)))
  {
    if ([v10 fullBulletins])
    {
      if (!v11) {
        goto LABEL_17;
      }
      [v17 pingWithBulletin:*(void *)(a1 + 40) ack:v11];
    }
    else
    {
      if (!v11)
      {
LABEL_18:
        dispatch_queue_t v11 = [*(id *)(a1 + 40) recordID];
        BOOL v16 = [*(id *)(a1 + 40) sectionID];
        [v17 pingWithRecordID:v11 forSectionID:v16];

        goto LABEL_19;
      }
      id v14 = [*(id *)(a1 + 40) recordID];
      BOOL v15 = [*(id *)(a1 + 40) sectionID];
      [v17 pingWithRecordID:v14 forSectionID:v15 ack:v11];
    }
LABEL_19:

    goto LABEL_20;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  if (([v10 fullBulletins] & 1) == 0) {
    goto LABEL_18;
  }
LABEL_17:
  [v17 pingWithBulletin:*(void *)(a1 + 40)];
LABEL_20:
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BLTBulletinDistributorSubscriber_pingWithRecordID_forSectionID___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __66__BLTBulletinDistributorSubscriber_pingWithRecordID_forSectionID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(a1 + 32) _connectIfNecessary];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    if (v4)
    {
      id v5 = [v4 remoteObjectProxy];
    }
    else
    {
      id v5 = *(id *)(v3 + 48);
    }
    id v6 = v5;
    [v5 pingWithRecordID:*(void *)(a1 + 48) forSectionID:*(void *)(a1 + 40)];
  }
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BLTWorkQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_completion___block_invoke;
  block[3] = &unk_264683E50;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __90__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceDelegate];
  [v2 getWillNanoPresentNotificationForSectionID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = BLTWorkQueue();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion___block_invoke;
  v15[3] = &unk_264683EA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __104__BLTBulletinDistributorSubscriber_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceDelegate];
  [v2 getWillNanoPresentNotificationForSectionID:*(void *)(a1 + 40) subsectionIDs:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)sendBulletinSummary:(id)a3
{
  id v4 = a3;
  id v5 = BLTWorkQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__BLTBulletinDistributorSubscriber_sendBulletinSummary___block_invoke;
  v7[3] = &unk_264683BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__BLTBulletinDistributorSubscriber_sendBulletinSummary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceDelegate];
  [v2 sendBulletinSummary:*(void *)(a1 + 40)];
}

- (void)subscribeWithMachServiceName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__BLTBulletinDistributorSubscriber_subscribeWithMachServiceName___block_invoke;
  v7[3] = &unk_264683BB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__BLTBulletinDistributorSubscriber_subscribeWithMachServiceName___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_INFO, "Subscriber updating machServiceName to %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 56) invalidate];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;

  [*(id *)(a1 + 40) setMachServiceName:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _connectIfNecessary];
  id v6 = [*(id *)(a1 + 40) delegate];
  [v6 subscriber:*(void *)(a1 + 40) subscribedWithMachServiceName:*(void *)(a1 + 32)];
}

- (void)_connectIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(BLTBulletinDistributorSubscriber *)self machServiceName];

  if (v3)
  {
    if (!self->_connection)
    {
      id v4 = objc_alloc(MEMORY[0x263F08D68]);
      id v5 = [(BLTBulletinDistributorSubscriber *)self machServiceName];
      id v6 = (NSXPCConnection *)[v4 initWithMachServiceName:v5 options:4096];
      connection = self->_connection;
      self->_connection = v6;

      uint64_t v8 = self->_connection;
      uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D60B888];
      [(NSXPCConnection *)v8 setExportedInterface:v9];

      id v10 = self->_connection;
      dispatch_queue_t v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D611EB0];
      [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

      [(NSXPCConnection *)self->_connection setExportedObject:self];
      [(NSXPCConnection *)self->_connection resume];
      objc_initWeak(&location, self);
      id v12 = self->_connection;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __55__BLTBulletinDistributorSubscriber__connectIfNecessary__block_invoke;
      v13[3] = &unk_264683EC8;
      objc_copyWeak(&v14, &location);
      [(NSXPCConnection *)v12 setInvalidationHandler:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __55__BLTBulletinDistributorSubscriber__connectIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

- (BLTBulletinDistributorSubscriberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTBulletinDistributorSubscriberDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceDelegate);
  return (BLTBulletinDistributorSubscriberDeviceDelegate *)WeakRetained;
}

- (void)setDeviceDelegate:(id)a3
{
}

- (NSString)machServiceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMachServiceName:(id)a3
{
}

- (BLTPingSubscribing)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end