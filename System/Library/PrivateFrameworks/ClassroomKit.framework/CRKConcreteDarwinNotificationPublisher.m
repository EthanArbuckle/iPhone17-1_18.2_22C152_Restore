@interface CRKConcreteDarwinNotificationPublisher
- (id)subscribeToNotificationWithName:(id)a3 handler:(id)a4;
@end

@implementation CRKConcreteDarwinNotificationPublisher

- (id)subscribeToNotificationWithName:(id)a3 handler:(id)a4
{
  return +[CRKConcreteDarwinNotificationSubscription subscriptionWithNotificationName:a3 handler:a4];
}

@end