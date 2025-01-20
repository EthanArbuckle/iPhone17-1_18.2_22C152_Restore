@interface VSSubscriptionRegistrationCenter
+ (VSSubscriptionRegistrationCenter)defaultSubscriptionRegistrationCenter;
- (BOOL)_shouldAllowAccessToSubscription:(id)a3;
- (BOOL)_shouldRaiseExceptionsForMisuse;
- (NSMutableDictionary)subscriptionsByOptions;
- (NSOperationQueue)privateQueue;
- (VSDelayOperation)expirationOperation;
- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker;
- (VSRemoteNotifier)remoteNotifier;
- (VSSecurityTask)currentTask;
- (VSSubscriptionFetchOptionsValidator)fetchOptionsValidator;
- (VSSubscriptionPredicateFactory)predicateFactory;
- (VSSubscriptionRegistrationCenter)init;
- (VSSubscriptionServiceConnection)connection;
- (id)_serviceWithErrorHandler:(id)a3;
- (void)_refreshCachedSubscriptions;
- (void)_resetExpirationOperation;
- (void)_sendLocalNotificationWithUserInfo:(id)a3;
- (void)dealloc;
- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)registerSubscription:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)removeSubscriptions:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentSubscription:(VSSubscription *)currentSubscription;
- (void)setCurrentTask:(id)a3;
- (void)setExpirationOperation:(id)a3;
- (void)setFetchOptionsValidator:(id)a3;
- (void)setLinkedOnOrAfterChecker:(id)a3;
- (void)setPredicateFactory:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setSubscriptionsByOptions:(id)a3;
@end

@implementation VSSubscriptionRegistrationCenter

- (VSSubscriptionRegistrationCenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSSubscriptionRegistrationCenter;
  v2 = [(VSSubscriptionRegistrationCenter *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subscriptionsByOptions = v2->_subscriptionsByOptions;
    v2->_subscriptionsByOptions = v3;

    v5 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSActiveSubscriptionsDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v5;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v7;

    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_privateQueue setName:@"com.apple.VideoSubscriberAccount.SubscriptionRegistrationCenter"];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[VSSubscriptionRegistrationCenter dealloc]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  [(VSDelayOperation *)self->_expirationOperation cancel];
  v4.receiver = self;
  v4.super_class = (Class)VSSubscriptionRegistrationCenter;
  [(VSSubscriptionRegistrationCenter *)&v4 dealloc];
}

+ (VSSubscriptionRegistrationCenter)defaultSubscriptionRegistrationCenter
{
  if (defaultSubscriptionRegistrationCenter___vs_lazy_init_predicate != -1) {
    dispatch_once(&defaultSubscriptionRegistrationCenter___vs_lazy_init_predicate, &__block_literal_global_35);
  }
  v2 = (void *)defaultSubscriptionRegistrationCenter___vs_lazy_init_variable;

  return (VSSubscriptionRegistrationCenter *)v2;
}

uint64_t __73__VSSubscriptionRegistrationCenter_defaultSubscriptionRegistrationCenter__block_invoke()
{
  defaultSubscriptionRegistrationCenter___vs_lazy_init_variable = objc_alloc_init(VSSubscriptionRegistrationCenter);

  return MEMORY[0x1F41817F8]();
}

- (void)setCurrentSubscription:(VSSubscription *)currentSubscription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = currentSubscription;
  v6 = (void *)MEMORY[0x1E0173AA0]();
  uint64_t v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[VSSubscriptionRegistrationCenter setCurrentSubscription:]";
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v8 = [(VSSubscriptionRegistrationCenter *)self currentTask];
  v9 = @"com.apple.developer.video-subscription-registration";
  char v10 = [v8 shouldAllowAccessForBooleanEntitlement:v9];
  v11 = @"com.apple.smoot.subscriptionservice";
  if ((v10 & 1) != 0 || [v8 shouldAllowAccessForBooleanEntitlement:v11])
  {
    if (v5)
    {
      v12 = v5;
      if ([(VSSubscription *)v12 accessLevel] == VSSubscriptionAccessLevelUnknown) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The subscription's access level must not be Unknown."];
      }
      [(VSSubscriptionRegistrationCenter *)self registerSubscription:v12];
    }
    else
    {
      v13 = [(VSSubscriptionRegistrationCenter *)self predicateFactory];
      v14 = [(VSSubscriptionRegistrationCenter *)self currentTask];
      v15 = [v13 allowedSubscriptionsPredicateForTask:v14];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke;
      v22[3] = &unk_1E6BD3F98;
      id v23 = v15;
      v24 = self;
      v12 = v15;
      [(VSSubscriptionRegistrationCenter *)self fetchActiveSubscriptionsWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v22];
    }
  }
  else if ([(VSSubscriptionRegistrationCenter *)self _shouldRaiseExceptionsForMisuse])
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v12 = (VSSubscription *)objc_claimAutoreleasedReturnValue();
    v19 = NSStringFromSelector(a2);
    [v16 raise:v17, @"The -[%@ %@] method requires an entitlement.", v12, v19 format];
  }
  else
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v12 = (VSSubscription *)objc_claimAutoreleasedReturnValue();
    v21 = NSStringFromSelector(a2);
    NSLog((NSString *)@"The -[%@ %@] method requires an entitlement.", v12, v21);
  }
}

void __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 count])
    {
      uint64_t v7 = [v5 filteredArrayUsingPredicate:*(void *)(a1 + 32)];

      if ([v7 count])
      {
        [*(id *)(a1 + 40) removeSubscriptions:v7];
      }
      else
      {
        v9 = VSDefaultLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "No app subscriptions to remove.", buf, 2u);
        }
      }
    }
    else
    {
      v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v10 = 0;
        _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "No active subscriptions to remove.", v10, 2u);
      }

      uint64_t v7 = v5;
    }
  }
  else
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke_cold_1();
    }
  }
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VSSubscriptionRegistrationCenter *)self connection];
  id v6 = [v5 serviceWithErrorHandler:v4];

  return v6;
}

- (BOOL)_shouldAllowAccessToSubscription:(id)a3
{
  id v4 = a3;
  v5 = [(VSSubscriptionRegistrationCenter *)self predicateFactory];
  id v6 = [(VSSubscriptionRegistrationCenter *)self currentTask];
  uint64_t v7 = [v5 allowedSubscriptionsPredicateForRequestKind:1 fromTask:v6];

  LOBYTE(v6) = [v7 evaluateWithObject:v4];
  return (char)v6;
}

- (BOOL)_shouldRaiseExceptionsForMisuse
{
  v2 = [(VSSubscriptionRegistrationCenter *)self linkedOnOrAfterChecker];
  char v3 = [v2 shouldPerformBehavior:0];

  return v3;
}

- (void)_sendLocalNotificationWithUserInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__VSSubscriptionRegistrationCenter__sendLocalNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E6BD2C38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  VSPerformCompletionHandler(v6);
}

void __71__VSSubscriptionRegistrationCenter__sendLocalNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VSActiveSubscriptionsDidChangeNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_refreshCachedSubscriptions
{
  char v3 = (void *)MEMORY[0x1E0173AA0](self, a2);
  id v4 = [(VSSubscriptionRegistrationCenter *)self subscriptionsByOptions];
  id v5 = (void *)[v4 copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke;
  v7[3] = &unk_1E6BD3FE8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E0173AA0]();
  [*(id *)(a1 + 32) removeObjectForKey:v5];
  id v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke_2;
  v12[3] = &unk_1E6BD3FC0;
  id v9 = v6;
  id v13 = v9;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v14 = v10;
  uint64_t v15 = v11;
  [v8 fetchActiveSubscriptionsWithOptions:v10 completionHandler:v12];
}

void __63__VSSubscriptionRegistrationCenter__refreshCachedSubscriptions__block_invoke_2(id *a1, void *a2, void *a3)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E0173AA0]();
  if (([a1[4] isEqual:v5] & 1) == 0)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = (void *)[a1[5] copy];
    [v8 setObject:v9 forKey:@"VSFetchOptionsKey"];

    if (v5)
    {
      id v10 = [a1[4] valueForKeyPath:@"source"];
      uint64_t v11 = [v5 valueForKeyPath:@"source"];
      v12 = (void *)v11;
      if (v10 && v11)
      {
        v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT %K IN %@", @"source", v11];
        v21 = [a1[4] filteredArrayUsingPredicate:v22];
        [v8 setObject:v21 forKey:@"VSRemovedSubscriptionsKey"];
        v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT %K IN %@", @"source", v10];
        v19 = [v5 filteredArrayUsingPredicate:v20];
        [v8 setObject:v19 forKey:@"VSAddedSubscriptionsKey"];
        v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"source", v10];
        id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT self IN %@", a1[4]];
        id v14 = (void *)MEMORY[0x1E4F28BA0];
        v23[0] = v18;
        v23[1] = v13;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        v16 = [v14 andPredicateWithSubpredicates:v15];

        uint64_t v17 = [v5 filteredArrayUsingPredicate:v16];
        [v8 setObject:v17 forKey:@"VSUpdatedSubscriptionsKey"];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to obtain latest and cached subscription sources."];
      }
    }
    [a1[6] _sendLocalNotificationWithUserInfo:v8];
  }
}

- (void)_resetExpirationOperation
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E0173AA0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v25 = self;
  id v4 = [(VSSubscriptionRegistrationCenter *)self subscriptionsByOptions];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v49;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v48 + 1) + 8 * v8);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v10 = v9;
        uint64_t v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v53, 16, context);
        if (v11)
        {
          uint64_t v12 = *(void *)v45;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v45 != v12) {
                objc_enumerationMutation(v10);
              }
              [v3 addObject:*(void *)(*((void *)&v44 + 1) + 8 * v13++)];
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v6);
  }

  id v14 = [(VSSubscriptionRegistrationCenter *)v25 expirationOperation];
  [v14 cancel];

  if ([v3 count])
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__11;
    v42 = __Block_byref_object_dispose__11;
    v43 = objc_alloc_init(VSOptional);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v3;
    uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v35;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1E0173AA0]();
          v20 = [v18 expirationDate];
          v21 = (void *)v39[5];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke;
          v31[3] = &unk_1E6BD4010;
          v33 = &v38;
          id v32 = v20;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2;
          v28[3] = &unk_1E6BD4038;
          v30 = &v38;
          id v22 = v32;
          id v29 = v22;
          [v21 conditionallyUnwrapObject:v31 otherwise:v28];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
      }
      while (v15);
    }

    id v23 = (void *)v39[5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_3;
    v27[3] = &unk_1E6BD4060;
    v27[4] = v25;
    [v23 conditionallyUnwrapObject:v27 otherwise:&__block_literal_global_47];
    _Block_object_dispose(&v38, 8);
  }
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) earlierDate:a2];
  uint64_t v3 = +[VSOptional optionalWithObject:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[VSOptional optionalWithObject:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v5 = objc_msgSend(v3, "vs_isBefore:", v4);

  if (v5)
  {
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Creating delay operation with fireDate: %@", buf, 0xCu);
    }

    uint64_t v7 = +[VSDelayOperation delayOperationWithFireDate:v3];
    [*(id *)(a1 + 32) setExpirationOperation:v7];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_initWeak(&location, v7);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_43;
    v8[3] = &unk_1E6BD2880;
    objc_copyWeak(&v9, (id *)buf);
    objc_copyWeak(&v10, &location);
    [v7 setCompletionBlock:v8];
    [v7 start];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_43(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3)
  {
    int v5 = [WeakRetained privateQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2_44;
    v6[3] = &unk_1E6BD2C38;
    id v7 = v4;
    id v8 = WeakRetained;
    [v5 addOperationWithBlock:v6];
  }
}

uint64_t __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_2_44(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Operation is not canceled, refreshing subscriptions.", v4, 2u);
    }

    return [*(id *)(a1 + 40) _refreshCachedSubscriptions];
  }
  return result;
}

void __61__VSSubscriptionRegistrationCenter__resetExpirationOperation__block_invoke_45()
{
  v0 = VSDefaultLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA674000, v0, OS_LOG_TYPE_DEFAULT, "No Subscriptions Expired that have not been recently modified", v1, 2u);
  }
}

- (VSSubscriptionServiceConnection)connection
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_connection;
  if (!v3)
  {
    id v3 = objc_alloc_init(VSSubscriptionServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (VSSecurityTask)currentTask
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentTask;
  if (!v3)
  {
    id v3 = +[VSSecurityTask currentSecurityTask];
    objc_storeStrong((id *)&v2->_currentTask, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_linkedOnOrAfterChecker;
  if (!v3)
  {
    id v3 = objc_alloc_init(VSLinkedOnOrAfterChecker);
    objc_storeStrong((id *)&v2->_linkedOnOrAfterChecker, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (VSSubscriptionPredicateFactory)predicateFactory
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_predicateFactory;
  if (!v3)
  {
    id v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (void)setPredicateFactory:(id)a3
{
  id v7 = (VSSubscriptionPredicateFactory *)a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (v5->_predicateFactory != v7)
  {
    objc_storeStrong((id *)&v5->_predicateFactory, a3);
    id v6 = [(VSSubscriptionRegistrationCenter *)v5 fetchOptionsValidator];
    [v6 setPredicateFactory:v7];
  }
  objc_sync_exit(v5);
}

- (VSSubscriptionFetchOptionsValidator)fetchOptionsValidator
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_fetchOptionsValidator;
  if (!v3)
  {
    id v3 = objc_alloc_init(VSSubscriptionFetchOptionsValidator);
    uint64_t v4 = [(VSSubscriptionRegistrationCenter *)v2 predicateFactory];
    [(VSSubscriptionFetchOptionsValidator *)v3 setPredicateFactory:v4];

    objc_storeStrong((id *)&v2->_fetchOptionsValidator, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The fetchOptionsValidatorOrNil parameter must not be nil."];
  }

  return v3;
}

- (void)setFetchOptionsValidator:(id)a3
{
  id v7 = (VSSubscriptionFetchOptionsValidator *)a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchOptionsValidator != v7)
  {
    objc_storeStrong((id *)&v5->_fetchOptionsValidator, a3);
    id v6 = [(VSSubscriptionFetchOptionsValidator *)v7 predicateFactory];
    [(VSSubscriptionRegistrationCenter *)v5 setPredicateFactory:v6];
  }
  objc_sync_exit(v5);
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  int v5 = [(VSSubscriptionRegistrationCenter *)self privateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__VSSubscriptionRegistrationCenter_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E6BD29A8;
  void v6[4] = self;
  [v5 addOperationWithBlock:v6];
}

uint64_t __92__VSSubscriptionRegistrationCenter_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshCachedSubscriptions];
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E0173AA0]();
  id v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VSSubscriptionRegistrationCenter fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options parameter must not be nil."];
    if (v7) {
      goto LABEL_5;
    }
LABEL_13:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
    goto LABEL_5;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_5:
  id v10 = [(VSSubscriptionRegistrationCenter *)self currentTask];
  if ([v10 shouldAllowAccessForBooleanEntitlement:@"com.apple.developer.video-subscription-registration"] & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", @"com.apple.smoot.subscriptionservice") & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", @"com.apple.private.subscriptionservice.internal") & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", @"com.apple.private.subscriptionservice.all-sources.read-only") & 1) != 0|| (objc_msgSend(v10, "shouldAllowAccessForBooleanEntitlement:", @"com.apple.private.subscriptionservice.web-sources.read-write"))
  {
    uint64_t v11 = [(VSSubscriptionRegistrationCenter *)self fetchOptionsValidator];
    uint64_t v12 = [v11 standardizedFetchOptionsFromOptions:v6 withSecurityTask:v10];

    id v13 = [(VSSubscriptionRegistrationCenter *)self privateQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke;
    v16[3] = &unk_1E6BD4128;
    v16[4] = self;
    id v6 = v12;
    id v17 = v6;
    id v18 = v13;
    id v19 = v7;
    id v14 = v13;
    [v14 addOperationWithBlock:v16];
  }
  else
  {
    if ([(VSSubscriptionRegistrationCenter *)self _shouldRaiseExceptionsForMisuse]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Calling this method requires an entitlement."];
    }
    VSPrivateError(-5, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = VSErrorLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[VSSubscriptionRegistrationCenter fetchActiveSubscriptionsWithOptions:completionHandler:](v15);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
  }
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E0173AA0]();
  id v3 = [a1[4] subscriptionsByOptions];
  uint64_t v4 = [v3 objectForKey:a1[5]];
  int v5 = VSDefaultLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Will return cached subscriptions: %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Will fetch fresh subscriptions.", buf, 2u);
    }

    id v7 = a1[4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68;
    v21[3] = &unk_1E6BD40B0;
    id v22 = a1[6];
    id v8 = v3;
    id v23 = v8;
    id v9 = a1[5];
    id v10 = a1[4];
    id v24 = v9;
    id v25 = v10;
    id v26 = a1[7];
    uint64_t v11 = [v7 _serviceWithErrorHandler:v21];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2;
    v15[3] = &unk_1E6BD4100;
    id v12 = a1[5];
    id v16 = a1[6];
    id v17 = v8;
    id v13 = a1[5];
    id v14 = a1[4];
    id v18 = v13;
    id v19 = v14;
    id v20 = a1[7];
    [v11 fetchActiveSubscriptionsWithOptions:v12 completionHandler:v15];
  }
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68_cold_1();
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_69;
  v10[3] = &unk_1E6BD4088;
  int v5 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v3;
  id v15 = v8;
  id v9 = v3;
  [v5 addOperationWithBlock:v10];
}

uint64_t __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_69(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _resetExpirationOperation];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Fetched subscriptions: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1();
    }
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_71;
  v14[3] = &unk_1E6BD40D8;
  id v15 = v5;
  id v8 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = *(void **)(a1 + 64);
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v6;
  id v20 = v11;
  id v12 = v6;
  id v13 = v5;
  [v8 addOperationWithBlock:v14];
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_71(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = v2;
    id v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 40) removeObjectForKey:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 56) _resetExpirationOperation];
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 64);
    int v12 = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will call registration center fetch completion handler with subscriptions %@ or error %@.", (uint8_t *)&v12, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  id v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 64);
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Did call registration center fetch completion handler with subscriptions %@ or error %@.", (uint8_t *)&v12, 0x16u);
  }
}

- (void)registerSubscription:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v32 = "-[VSSubscriptionRegistrationCenter registerSubscription:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The subscription parameter must not be nil."];
  }
  BOOL v6 = [(VSSubscriptionRegistrationCenter *)self _shouldRaiseExceptionsForMisuse];
  if (![(VSSubscriptionRegistrationCenter *)self _shouldAllowAccessToSubscription:v4])
  {
    if (v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Registering this subscription (%@) requires an entitlement.", v4 format];
    }
    else {
      NSLog((NSString *)@"Registering this subscription (%@) requires an entitlement.", v4);
    }
    goto LABEL_36;
  }
  uint64_t v7 = [v4 subscriptionInfo];
  uint64_t v8 = [v7 length];

  uint64_t v9 = [v4 accessLevel];
  if (v8)
  {
    if (v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Only subscriptions with an unknown access level may be registered with an info string."];
    }
    uint64_t v10 = [v4 tierIdentifiers];
    uint64_t v11 = [v10 count];

    if (!v11) {
      goto LABEL_22;
    }
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    __int16 v14 = @"Only subscriptions without any tier identifiers may be registered with an info string.";
  }
  else
  {
    if ((unint64_t)(v9 - 1) < 2) {
      goto LABEL_22;
    }
    if (v9)
    {
      if (!v6) {
        goto LABEL_22;
      }
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    }
    else
    {
      if (!v6) {
        goto LABEL_22;
      }
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Only subscriptions with an info string may be registered with an unknown access level."];
    }
    int v12 = (void *)MEMORY[0x1E4F1CA00];
    __int16 v14 = @"Attempt to register a subscription with an unexpected access level.";
    uint64_t v13 = v15;
  }
  [v12 raise:v13 format:v14];
LABEL_22:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v25 = v4;
  uint64_t v16 = [v4 tierIdentifiers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        id v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v20 format:@"Attempt to register subscription with a non-string object as a tier identifier."];
        }
        if (![v22 length]) {
          [MEMORY[0x1E4F1CA00] raise:v20 format:@"Attempt to register subscription with an empty string as a tier identifier."];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }

  uint64_t v23 = VSDefaultLogObject();
  id v4 = v25;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = (const char *)v25;
    _os_log_impl(&dword_1DA674000, v23, OS_LOG_TYPE_DEFAULT, "Will register subscription: %@", buf, 0xCu);
  }

  id v24 = [(VSSubscriptionRegistrationCenter *)self _serviceWithErrorHandler:&__block_literal_global_98];
  [v24 registerSubscription:v25];

LABEL_36:
}

void __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke_cold_1();
  }
}

- (void)removeSubscriptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[VSSubscriptionRegistrationCenter removeSubscriptions:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The subscriptions parameter must not be nil."];
  }
  if (![v4 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The subscriptions array must not be empty."];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    BOOL v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = v10
           && [(VSSubscriptionRegistrationCenter *)self _shouldAllowAccessToSubscription:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);

    if (!v10)
    {
      if ([(VSSubscriptionRegistrationCenter *)self _shouldRaiseExceptionsForMisuse]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Removing thess subscriptions (%@) requires an entitlement.", v6 format];
      }
      else {
        NSLog((NSString *)@"Removing these subscriptions (%@) requires an entitlement.", v6);
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  int v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = (const char *)v6;
    _os_log_impl(&dword_1DA674000, v12, OS_LOG_TYPE_DEFAULT, "Will remove subscriptions: %@", buf, 0xCu);
  }

  uint64_t v13 = [(VSSubscriptionRegistrationCenter *)self _serviceWithErrorHandler:&__block_literal_global_109];
  [v13 removeSubscriptions:v6];

LABEL_24:
}

void __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke_cold_1();
  }
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSMutableDictionary)subscriptionsByOptions
{
  return self->_subscriptionsByOptions;
}

- (void)setSubscriptionsByOptions:(id)a3
{
}

- (VSDelayOperation)expirationOperation
{
  return self->_expirationOperation;
}

- (void)setExpirationOperation:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setCurrentTask:(id)a3
{
}

- (void)setLinkedOnOrAfterChecker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_expirationOperation, 0);
  objc_storeStrong((id *)&self->_subscriptionsByOptions, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_fetchOptionsValidator, 0);

  objc_storeStrong((id *)&self->_predicateFactory, 0);
}

void __59__VSSubscriptionRegistrationCenter_setCurrentSubscription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching active subscriptions: %@", v2, v3, v4, v5, v6);
}

- (void)fetchActiveSubscriptionsWithOptions:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Attempt to fetch active subscriptions without appropriate entitlements.", v1, 2u);
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching from service: %@", v2, v3, v4, v5, v6);
}

void __90__VSSubscriptionRegistrationCenter_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to fetch subscriptions: %@", v2, v3, v4, v5, v6);
}

void __57__VSSubscriptionRegistrationCenter_registerSubscription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error registering subscription: %@", v2, v3, v4, v5, v6);
}

void __56__VSSubscriptionRegistrationCenter_removeSubscriptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error removing subscriptions: %@", v2, v3, v4, v5, v6);
}

@end