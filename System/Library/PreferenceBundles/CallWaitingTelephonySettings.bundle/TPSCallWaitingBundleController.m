@interface TPSCallWaitingBundleController
- (BOOL)isHidden;
- (id)specifiers;
- (id)supportedSubscriptions;
@end

@implementation TPSCallWaitingBundleController

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    v5 = +[TPSCallWaitingStrings localizedStringForKey:@"BUNDLE_CONTROLLER_ROOT_SPECIFIER_TITLE"];
    v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v6 setIdentifier:@"CALL_WAITING_TELEPHONY_SETTINGS"];
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
  v3.super_class = (Class)TPSCallWaitingBundleController;
  if ([(TPSCallWaitingBundleController *)&v3 isHidden]) {
    return 1;
  }
  else {
    return +[UIApplication isRunningInStoreDemoMode];
  }
}

- (id)supportedSubscriptions
{
  supportedSubscriptions = self->_supportedSubscriptions;
  if (!supportedSubscriptions)
  {
    v21.receiver = self;
    v21.super_class = (Class)TPSCallWaitingBundleController;
    v4 = [(TPSCallWaitingBundleController *)&v21 subscriptions];
    v5 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v4 count]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isSimHidden", (void)v17) & 1) == 0)
          {
            v12 = [(TPSCallWaitingBundleController *)self telephonyController];
            unsigned int v13 = [v12 supportsSystemCapabilityCallWaitingForSubscriptionContext:v11];

            if (v13) {
              [v5 addObject:v11];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    v14 = (NSOrderedSet *)[v5 copy];
    v15 = self->_supportedSubscriptions;
    self->_supportedSubscriptions = v14;

    supportedSubscriptions = self->_supportedSubscriptions;
  }

  return supportedSubscriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSubscriptions, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end