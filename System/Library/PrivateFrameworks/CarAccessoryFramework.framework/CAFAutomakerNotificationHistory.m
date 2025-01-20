@interface CAFAutomakerNotificationHistory
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (NSArray)historicalNotificationServices;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFAutomakerNotificationHistory

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFAutomakerNotificationHistory;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFAutomakerNotificationHistory;
  [(CAFAccessory *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFAutomakerNotificationHistory;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (NSArray)historicalNotificationServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000021000001"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000021000001"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

+ (id)accessoryIdentifier
{
  return @"0x0000000001400001";
}

+ (id)observerProtocol
{
  return &unk_26FDAFB00;
}

@end