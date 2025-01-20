@interface WFDaemonApplicationContextProvider
- (BOOL)shouldReverseLayoutDirection;
- (NSString)userInterfaceType;
- (WFDaemonApplicationContextProvider)init;
- (WFDaemonApplicationContextProvider)initWithUserInterfaceType:(id)a3;
- (id)applicationForWFApplicationContext:(id)a3;
- (id)bundleForWFApplicationContext:(id)a3;
- (id)keyWindowForWFApplicationContext:(id)a3;
- (id)notificationNameForApplicationStateEvent:(int64_t)a3 applicationContext:(id)a4;
- (int64_t)currentApplicationStateForWFApplicationContext:(id)a3;
@end

@implementation WFDaemonApplicationContextProvider

- (void).cxx_destruct
{
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (BOOL)shouldReverseLayoutDirection
{
  return 0;
}

- (int64_t)currentApplicationStateForWFApplicationContext:(id)a3
{
  return 0;
}

- (id)applicationForWFApplicationContext:(id)a3
{
  return 0;
}

- (id)keyWindowForWFApplicationContext:(id)a3
{
  return 0;
}

- (id)notificationNameForApplicationStateEvent:(int64_t)a3 applicationContext:(id)a4
{
  return 0;
}

- (id)bundleForWFApplicationContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle", a3);
}

- (WFDaemonApplicationContextProvider)init
{
  return [(WFDaemonApplicationContextProvider *)self initWithUserInterfaceType:0];
}

- (WFDaemonApplicationContextProvider)initWithUserInterfaceType:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDaemonApplicationContextProvider;
  v5 = [(WFDaemonApplicationContextProvider *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

@end