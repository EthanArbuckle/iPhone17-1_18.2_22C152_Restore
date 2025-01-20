@interface TPSSIMPasscodeBundleController
- (BOOL)isHidden;
- (BOOL)supportsDisabledSubscriptions;
- (PSSpecifier)rootSpecifier;
- (TPSSIMPasscodeBundleController)initWithParentListController:(id)a3;
- (TPSSubscriberTelephonyController)subscriberController;
- (id)specifiers;
- (id)supportedSubscriptions;
- (void)setRootSpecifier:(id)a3;
@end

@implementation TPSSIMPasscodeBundleController

- (TPSSIMPasscodeBundleController)initWithParentListController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSSIMPasscodeBundleController;
  v3 = [(TPSSIMPasscodeBundleController *)&v9 initWithParentListController:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(TPSSIMPasscodeBundleController *)v3 subscriptionContext];
    if (v5)
    {
      v6 = (TPSSubscriberTelephonyController *)[objc_alloc((Class)TPSSubscriberTelephonyController) initWithSubscriptionContext:v5];
      subscriberController = v4->_subscriberController;
      v4->_subscriberController = v6;
    }
  }
  return v4;
}

- (TPSSubscriberTelephonyController)subscriberController
{
  if (!self->_subscriberController)
  {
    v3 = [(TPSSIMPasscodeBundleController *)self subscriptionContext];

    if (v3)
    {
      id v4 = objc_alloc((Class)TPSSubscriberTelephonyController);
      v5 = [(TPSSIMPasscodeBundleController *)self subscriptionContext];
      v6 = (TPSSubscriberTelephonyController *)[v4 initWithSubscriptionContext:v5];
      subscriberController = self->_subscriberController;
      self->_subscriberController = v6;
    }
  }
  v8 = self->_subscriberController;

  return v8;
}

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = +[NSMutableArray array];
    v5 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"BUNDLE_CONTROLLER_ROOT_SPECIFIER_TITLE"];
    v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v6 setIdentifier:@"SIM_PASSCODE_TELEPHONY_SETTINGS"];
    [v4 addObject:v6];
    v7 = (NSArray *)[v4 copy];
    v8 = self->_specifiers;
    self->_specifiers = v7;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)TPSSIMPasscodeBundleController;
  if ([(TPSSIMPasscodeBundleController *)&v3 isHidden]) {
    return 1;
  }
  else {
    return +[UIApplication isRunningInStoreDemoMode];
  }
}

- (BOOL)supportsDisabledSubscriptions
{
  return 1;
}

- (id)supportedSubscriptions
{
  supportedSubscriptions = self->_supportedSubscriptions;
  if (!supportedSubscriptions)
  {
    v23.receiver = self;
    v23.super_class = (Class)TPSSIMPasscodeBundleController;
    id v4 = [(TPSSIMPasscodeBundleController *)&v23 subscriptions];
    v5 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v4 count]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v11 isSimHidden] & 1) == 0)
          {
            v12 = [(TPSSIMPasscodeBundleController *)self telephonyController];
            v13 = [v12 telephonyClient];
            v14 = [v13 shouldAllowSimLockFor:v11];

            if ([v14 BOOLValue])
            {
              [v5 addObject:v11];
            }
            else
            {
              v15 = TPSSIMPasscodeLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v25 = v14;
                __int16 v26 = 2112;
                v27 = v11;
                _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "SIM Lock is not allowed (%@); excluding subscription %@.",
                  buf,
                  0x16u);
              }
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v8);
    }

    v16 = (NSOrderedSet *)[v5 copy];
    v17 = self->_supportedSubscriptions;
    self->_supportedSubscriptions = v16;

    supportedSubscriptions = self->_supportedSubscriptions;
  }

  return supportedSubscriptions;
}

- (PSSpecifier)rootSpecifier
{
  return self->_rootSpecifier;
}

- (void)setRootSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootSpecifier, 0);
  objc_storeStrong((id *)&self->_supportedSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriberController, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end