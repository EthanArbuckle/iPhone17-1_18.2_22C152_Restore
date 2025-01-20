@interface AVTPushNotificationsConnectionFactory
- (id)connectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5;
@end

@implementation AVTPushNotificationsConnectionFactory

- (id)connectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F280F0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithEnvironmentName:v10 namedDelegatePort:v9 queue:v8];

  return v11;
}

@end