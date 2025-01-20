@interface MSPushRegistration
- (MSPushRegistration)init;
- (NSArray)mailboxNames;
- (NSString)accountIdentifier;
- (NSString)bundleIdentifier;
- (NSString)notificationNamePrefix;
- (void)registerForPush:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setMailboxNames:(id)a3;
- (void)setNotificationNamePrefix:(id)a3;
@end

@implementation MSPushRegistration

- (MSPushRegistration)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSPushRegistration;
  v2 = [(MSMailDefaultService *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(MSMailDefaultService *)v2 setShouldLaunchMobileMail:1];
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    uint64_t v6 = [v5 copy];
    bundleIdentifier = v3->_bundleIdentifier;
    v3->_bundleIdentifier = (NSString *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)registerForPush:(id)a3
{
  id v5 = a3;
  if (!self->_bundleIdentifier)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MSPushRegistration.m", 43, @"Invalid parameter not satisfying: %@", @"_bundleIdentifier" object file lineNumber description];
  }
  if (!self->_accountIdentifier)
  {
    objc_super v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSPushRegistration.m", 44, @"Invalid parameter not satisfying: %@", @"_accountIdentifier" object file lineNumber description];
  }
  notificationNamePrefix = self->_notificationNamePrefix;
  if (!notificationNamePrefix)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MSPushRegistration.m", 45, @"Invalid parameter not satisfying: %@", @"_notificationNamePrefix" object file lineNumber description];

    notificationNamePrefix = self->_notificationNamePrefix;
  }
  v7 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", self->_bundleIdentifier, @"bundle", self->_accountIdentifier, @"account-id", notificationNamePrefix, @"prefix", self->_mailboxNames, @"mailboxes", 0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__MSPushRegistration_registerForPush___block_invoke;
  v12[3] = &unk_264242E08;
  id v8 = v5;
  id v13 = v8;
  [(MSService *)self _callServicesMethod:@"PushRegistration" arguments:v7 callback:v12];
}

void __38__MSPushRegistration_registerForPush___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [v7 objectForKey:@"success"];
  [v6 BOOLValue];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)notificationNamePrefix
{
  return self->_notificationNamePrefix;
}

- (void)setNotificationNamePrefix:(id)a3
{
}

- (NSArray)mailboxNames
{
  return self->_mailboxNames;
}

- (void)setMailboxNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxNames, 0);
  objc_storeStrong((id *)&self->_notificationNamePrefix, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end