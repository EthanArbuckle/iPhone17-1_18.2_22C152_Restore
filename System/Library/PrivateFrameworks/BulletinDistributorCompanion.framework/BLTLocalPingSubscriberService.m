@interface BLTLocalPingSubscriberService
- (BLTBulletinDistributorSubscriber)subscriber;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5;
- (void)sendBulletinSummary:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6;
- (void)unsubscribeFromSectionID:(id)a3;
@end

@implementation BLTLocalPingSubscriberService

- (void)unsubscribeFromSectionID:(id)a3
{
}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
}

- (void)sendBulletinSummary:(id)a3
{
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
}

- (BLTBulletinDistributorSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end