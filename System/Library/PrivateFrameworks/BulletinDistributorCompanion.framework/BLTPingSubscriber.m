@interface BLTPingSubscriber
- (BLTPingService)service;
- (BLTPingSubscriber)init;
- (BLTPingSubscriber)initWithService:(id)a3;
- (NSMutableDictionary)pingHandlers;
- (id)sectionIDs;
- (id)subscriptionInfos;
- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6;
- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6 forNotifications:(BOOL)a7;
- (void)dealloc;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5;
- (void)pingWithBulletin:(id)a3;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5;
- (void)sendBulletinSummary:(id)a3 forBulletin:(id)a4 destinations:(unint64_t)a5;
- (void)setPingHandlers:(id)a3;
- (void)setService:(id)a3;
- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardForAnyConnectionHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withBulletinAckHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withBulletinHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardForAnyConnectionHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withNotificationAckHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withNotificationHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withPingAckForwardHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withPingAckHandler:(id)a4;
- (void)subscribeToSectionID:(id)a3 withPingHandler:(id)a4;
- (void)subscribeWithMachServiceName:(id)a3;
- (void)unsubscribeFromSectionID:(id)a3;
@end

@implementation BLTPingSubscriber

- (BLTPingSubscriber)init
{
  v3 = objc_alloc_init(BLTRemotePingSubscriberService);
  v4 = [(BLTPingSubscriber *)self initWithService:v3];
  if (v4) {
    [(BLTRemotePingSubscriberService *)v3 setDelegate:v4];
  }

  return v4;
}

- (BLTPingSubscriber)initWithService:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTPingSubscriber;
  v6 = [(BLTPingSubscriber *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    pthread_mutex_init(&v7->_lock, 0);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    pingHandlers = v7->_pingHandlers;
    v7->_pingHandlers = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:2 forFullBulletins:1 forNotifications:1];
}

- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6 forNotifications:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [[BLTPingHandlerHolder alloc] initWithPingHandler:v12];

  [(BLTPingHandlerHolder *)v14 setAckType:a5];
  [(BLTPingHandlerHolder *)v14 setSectionID:v13];
  [(BLTPingHandlerHolder *)v14 setForBulletin:v8];
  [(BLTPingHandlerHolder *)v14 setForNotification:v7];
  pthread_mutex_lock(&self->_lock);
  [(NSMutableDictionary *)self->_pingHandlers setObject:v14 forKeyedSubscript:v13];
  [(BLTPingService *)self->_service subscribeToSectionID:v13 forFullBulletins:v8 withAck:[(BLTPingHandlerHolder *)v14 canAck] ackAllowedOnLocalConnection:[(BLTPingHandlerHolder *)v14 canAckOnLocalConnection]];

  pthread_mutex_unlock(&self->_lock);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BLTPingSubscriber;
  [(BLTPingSubscriber *)&v3 dealloc];
}

- (id)sectionIDs
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = [(NSMutableDictionary *)self->_pingHandlers allKeys];
  id v6 = [v4 setWithArray:v5];

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)subscriptionInfos
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_pingHandlers allValues];
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)unsubscribeFromSectionID:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_pingHandlers objectForKeyedSubscript:v5];

  if (v4)
  {
    [(NSMutableDictionary *)self->_pingHandlers removeObjectForKey:v5];
    [(BLTPingService *)self->_service unsubscribeFromSectionID:v5];
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)_subscribeToSectionID:(id)a3 pingHandler:(id)a4 ackType:(unint64_t)a5 forFullBulletins:(BOOL)a6
{
}

- (void)subscribeToSectionID:(id)a3 withPingHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:0 forFullBulletins:0];
}

- (void)subscribeToSectionID:(id)a3 withPingAckHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:1 forFullBulletins:0];
}

- (void)subscribeToSectionID:(id)a3 withPingAckForwardHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:2 forFullBulletins:0];
}

- (void)subscribeToSectionID:(id)a3 withBulletinHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:0 forFullBulletins:1];
}

- (void)subscribeToSectionID:(id)a3 withBulletinAckHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:1 forFullBulletins:1];
}

- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:2 forFullBulletins:1];
}

- (void)subscribeToSectionID:(id)a3 withBulletinAckForwardForAnyConnectionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:3 forFullBulletins:1];
}

- (void)subscribeToSectionID:(id)a3 withNotificationHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:0 forFullBulletins:1 forNotifications:1];
}

- (void)subscribeToSectionID:(id)a3 withNotificationAckHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:1 forFullBulletins:1 forNotifications:1];
}

- (void)subscribeToSectionID:(id)a3 withNotificationAckForwardForAnyConnectionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (id)MEMORY[0x223CAC810](a4);
  [(BLTPingSubscriber *)self _subscribeToSectionID:v6 pingHandler:v7 ackType:3 forFullBulletins:1 forNotifications:1];
}

- (void)pingWithBulletin:(id)a3
{
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  pingHandlers = self->_pingHandlers;
  v9 = [v11 sectionID];
  v10 = [(NSMutableDictionary *)pingHandlers objectForKeyedSubscript:v9];

  pthread_mutex_unlock(p_lock);
  if (v10) {
    [v10 pingWithBulletin:v11 ack:v6];
  }
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  id v11 = [(NSMutableDictionary *)self->_pingHandlers objectForKeyedSubscript:v8];
  pthread_mutex_unlock(p_lock);
  if (v11) {
    [v11 pingWithRecordID:v12 forSectionID:v8 ack:v9];
  }
}

- (void)sendBulletinSummary:(id)a3 forBulletin:(id)a4 destinations:(unint64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(BLTPBBulletinSummary);
  v10 = [v8 recordID];
  [(BLTPBBulletinSummary *)v9 setRecordID:v10];

  id v11 = [v8 publisherBulletinID];
  [(BLTPBBulletinSummary *)v9 setPublisherBulletinID:v11];

  v28 = v8;
  id v12 = [v8 sectionID];
  [(BLTPBBulletinSummary *)v9 setSectionID:v12];

  v29 = v9;
  [(BLTPBBulletinSummary *)v9 setDestinations:a5];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v19 = objc_alloc_init(BLTPBBulletinSummaryKey);
        [(BLTPBBulletinSummaryKey *)v19 setKey:v18];
        v20 = [v13 objectForKeyedSubscript:v18];
        int v21 = [MEMORY[0x263F57700] activePairedDeviceSupportsNSNullPListExtenion];
        int v22 = v21;
        if (v21) {
          v23 = &v31;
        }
        else {
          v23 = 0;
        }
        if (v21) {
          id v31 = 0;
        }
        id v30 = 0;
        v24 = +[BLTObjectSerializer serializeObject:v20 nulls:v23 error:&v30];
        id v25 = 0;
        if (v22) {
          id v25 = v31;
        }
        id v26 = v30;
        [(BLTPBBulletinSummaryKey *)v19 setValue:v24];

        [(BLTPBBulletinSummaryKey *)v19 setValueNulls:v25];
        if (!v26) {
          [(BLTPBBulletinSummary *)v29 addKey:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  pthread_mutex_lock(&self->_lock);
  [(BLTPingService *)self->_service sendBulletinSummary:v29];
  pthread_mutex_unlock(&self->_lock);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(BLTPingService *)self->_service getWillNanoPresentNotificationForSectionID:v8 subsectionIDs:0 completion:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  pthread_mutex_lock(p_lock);
  [(BLTPingService *)self->_service getWillNanoPresentNotificationForSectionID:v11 subsectionIDs:v10 completion:v9];

  pthread_mutex_unlock(p_lock);
}

- (void)subscribeWithMachServiceName:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  [(BLTPingService *)self->_service subscribeWithMachServiceName:v5];

  pthread_mutex_unlock(p_lock);
}

- (NSMutableDictionary)pingHandlers
{
  return self->_pingHandlers;
}

- (void)setPingHandlers:(id)a3
{
}

- (BLTPingService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pingHandlers, 0);
}

@end