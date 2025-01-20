@interface TPSWiFiCallingBundleController
- (BOOL)isHidden;
- (TPSWiFiCallingBundleController)initWithParentListController:(id)a3;
- (TPSWiFiCallingController)callingController;
- (id)capabilityState:(id)a3;
- (id)specifiers;
- (id)supportedSubscriptions;
- (void)handleTPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification:(id)a3;
@end

@implementation TPSWiFiCallingBundleController

- (TPSWiFiCallingBundleController)initWithParentListController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSWiFiCallingBundleController;
  v3 = [(TPSWiFiCallingBundleController *)&v10 initWithParentListController:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(TPSWiFiCallingBundleController *)v3 subscriptionContext];
    if (v5)
    {
      v6 = [[TPSWiFiCallingController alloc] initWithSubscriptionContext:v5];
      callingController = v4->_callingController;
      v4->_callingController = v6;

      v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:v4 selector:"handleTPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification:" name:@"TPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification" object:v4->_callingController];
    }
  }
  return v4;
}

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    v5 = TUStringKeyForNetwork();
    v6 = +[TPSWiFiCallingStrings localizedStringForKey:v5];

    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"capabilityState:" detail:objc_opt_class() cell:2 edit:0];
    [v7 setIdentifier:@"WIFI_CALLING_TELEPHONY_SETTINGS"];
    v8 = [(TPSWiFiCallingBundleController *)self callingController];

    if (v8)
    {
      v9 = [(TPSWiFiCallingBundleController *)self callingController];
      objc_super v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v7 setProperty:v9 forKey:v11];
    }
    [v4 addObject:v7];
    v12 = (NSArray *)[v4 copy];
    v13 = self->_specifiers;
    self->_specifiers = v12;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)TPSWiFiCallingBundleController;
  if ([(TPSWiFiCallingBundleController *)&v3 isHidden]) {
    return 1;
  }
  else {
    return +[UIApplication isRunningInStoreDemoMode];
  }
}

- (id)capabilityState:(id)a3
{
  objc_super v3 = [(TPSWiFiCallingBundleController *)self callingController];
  unsigned int v4 = [v3 isWiFiCallingEnabled];

  if (v4) {
    CFStringRef v5 = @"ON";
  }
  else {
    CFStringRef v5 = @"OFF";
  }
  v6 = +[TPSWiFiCallingStrings localizedStringForKey:v5];

  return v6;
}

- (id)supportedSubscriptions
{
  supportedSubscriptions = self->_supportedSubscriptions;
  if (!supportedSubscriptions)
  {
    v23 = self;
    v35.receiver = self;
    v35.super_class = (Class)TPSWiFiCallingBundleController;
    unsigned int v4 = [(TPSWiFiCallingBundleController *)&v35 subscriptions];
    CFStringRef v5 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v4 count]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v32;
      uint64_t v24 = *(void *)v32;
      do
      {
        v9 = 0;
        id v25 = v7;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          objc_super v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v9);
          if (([v10 isSimHidden] & 1) == 0)
          {
            v11 = +[TUCallCapabilities senderIdentityCapabilities];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v12 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v28;
              do
              {
                for (i = 0; i != v13; i = (char *)i + 1)
                {
                  if (*(void *)v28 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  v17 = [v16 senderIdentityUUID];
                  v18 = [v10 uuid];
                  if ([v17 isEqual:v18])
                  {
                    unsigned int v19 = [v16 supportsWiFiCalling];

                    if (v19) {
                      [v5 addObject:v10];
                    }
                  }
                  else
                  {
                  }
                }
                id v13 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
              }
              while (v13);
            }

            uint64_t v8 = v24;
            id v7 = v25;
          }
          v9 = (char *)v9 + 1;
        }
        while (v9 != v7);
        id v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v7);
    }

    v20 = (NSOrderedSet *)[v5 copy];
    v21 = v23->_supportedSubscriptions;
    v23->_supportedSubscriptions = v20;

    supportedSubscriptions = v23->_supportedSubscriptions;
  }

  return supportedSubscriptions;
}

- (void)handleTPSWiFiCallingControllerSubscriptionCapabilitiesChangedNotification:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = TPSWiFiCallingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(TPSWiFiCallingBundleController *)self parentListController];
  [v7 reloadSpecifierID:@"WIFI_CALLING_TELEPHONY_SETTINGS"];
}

- (TPSWiFiCallingController)callingController
{
  return self->_callingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingController, 0);
  objc_storeStrong((id *)&self->_supportedSubscriptions, 0);

  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end