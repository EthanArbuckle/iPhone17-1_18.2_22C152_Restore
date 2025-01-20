@interface CRKConcreteNotificationCenterPublisher
- (id)subscribeToNotificationWithName:(id)a3 object:(id)a4 handler:(id)a5;
@end

@implementation CRKConcreteNotificationCenterPublisher

- (id)subscribeToNotificationWithName:(id)a3 object:(id)a4 handler:(id)a5
{
  v7 = (void *)MEMORY[0x263F08A00];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 defaultCenter];
  v12 = +[CRKConcreteNotificationCenterSubscription subscriptionWithNotificationCenter:v11 notificationName:v10 object:v9 notificationHandler:v8];

  return v12;
}

@end