@interface SKPaymentQueue
+ (BOOL)canMakePayments;
+ (SKPaymentQueue)defaultQueue;
+ (void)listenForStorefrontChanges;
- (BOOL)shouldContinueTransaction:(id)a3 inNewStorefront:(id)a4;
- (NSArray)transactionObservers;
- (NSArray)transactions;
- (SKPaymentQueue)initWithPaymentQueueClient:(id)a3;
- (SKPaymentQueueClient)paymentQueueClient;
- (SKStorefront)storefront;
- (id)_initSKPaymentQueue;
- (id)delegate;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_checkForMessages;
- (void)_checkServerQueueForced:(BOOL)a3;
- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4 inAppPurchaseID:(id)a5 userAction:(int64_t)a6;
- (void)_notifyObserversAboutChanges:(id)a3 sendUpdatedDownloads:(BOOL)a4;
- (void)_notifyObserversAboutRemovals:(id)a3;
- (void)_processTransactionDict:(id)a3 forTransaction:(id)a4 error:(id)a5;
- (void)_removeLocalTransaction:(id)a3;
- (void)_removeNilTransactionObservers;
- (void)_updatedTransactions:(id)a3 restored:(BOOL)a4;
- (void)addPayment:(SKPayment *)payment;
- (void)addTransactionObserver:(id)observer;
- (void)askToShowMessageWithReplyBlock:(id)a3;
- (void)cancelDownloads:(NSArray *)downloads;
- (void)clearTransactions;
- (void)dealloc;
- (void)downloadAdded:(id)a3;
- (void)downloadRemoved:(id)a3;
- (void)downloadStatusChanged:(id)a3;
- (void)finishTransaction:(SKPaymentTransaction *)transaction;
- (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)listenForPurchaseIntents;
- (void)notifyObserversForNewStorefront:(id)a3;
- (void)notifyPurchaseIntentObserversForProducts:(id)a3;
- (void)pauseDownloads:(NSArray *)downloads;
- (void)presentCodeRedemptionSheet;
- (void)processTransaction:(SKPaymentTransaction *)a3 completionHandler:(id)a4;
- (void)removeTransactionObserver:(id)observer;
- (void)removeTransactionWithID:(unint64_t)a3;
- (void)removedEntitlementsForProductIdentifiers:(id)a3;
- (void)removedTransactions:(id)a3;
- (void)restoreCompletedTransactions;
- (void)restoreCompletedTransactionsWithApplicationUsername:(NSString *)username;
- (void)resumeDownloads:(NSArray *)downloads;
- (void)setDelegate:(id)delegate;
- (void)showPriceConsentIfNeeded;
- (void)startDownloads:(NSArray *)downloads;
- (void)stopListeningForPurchaseIntents;
- (void)updatedTransactions:(id)a3;
@end

@implementation SKPaymentQueue

uint64_t __30__SKPaymentQueue_defaultQueue__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultQueue_sSharedQueue;
  defaultQueue_sSharedQueue = (uint64_t)v1;

  v3 = (id *)*(id *)(defaultQueue_sSharedQueue + 8);
  v4 = +[SKClientBroker defaultBroker];
  [v4 unregisterClientWithIdentifier:v3[2]];

  objc_storeStrong(v3 + 2, @"DefaultQueue");
  v5 = +[SKClientBroker defaultBroker];
  [v5 registerClient:defaultQueue_sSharedQueue withIdentifier:0x1F08A8800];

  return +[SKPaymentQueue listenForStorefrontChanges];
}

+ (SKPaymentQueue)defaultQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SKPaymentQueue_defaultQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultQueue_sSharedInstanceOnce != -1) {
    dispatch_once(&defaultQueue_sSharedInstanceOnce, block);
  }
  v2 = (void *)defaultQueue_sSharedQueue;

  return (SKPaymentQueue *)v2;
}

- (void)notifyObserversForNewStorefront:(id)a3
{
  id v5 = a3;
  id v6 = *((id *)self->_internal + 8);
  objc_sync_enter(v6);
  id v7 = *((id *)self->_internal + 7);
  if (!v7
    || ([v5 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqual:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_storeStrong((id *)self->_internal + 7, a3);
    v11 = (void *)*((void *)self->_internal + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SKPaymentQueue_Package__notifyObserversForNewStorefront___block_invoke;
    v12[3] = &unk_1E5FAAA30;
    v12[4] = self;
    [v11 enumerateObjectsUsingBlock:v12];
  }

  objc_sync_exit(v6);
}

- (id)_initSKPaymentQueue
{
  v8.receiver = self;
  v8.super_class = (Class)SKPaymentQueue;
  v2 = [(SKPaymentQueue *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentQueueInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;

    id v5 = +[SKClientBroker defaultBroker];
    [v5 registerClient:v2 withIdentifier:*((void *)v2->_internal + 2)];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
    [v6 addObserver:v2 selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB2628] object:0];
  }
  return v2;
}

uint64_t __42__SKPaymentQueue__checkServerQueueForced___block_invoke_85(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatedTransactions:a2 restored:0];
}

void __59__SKPaymentQueue_Package__notifyObserversForNewStorefront___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector()) {
    [v3 paymentQueueDidChangeStorefront:*(void *)(a1 + 32)];
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  if (*((unsigned char *)self->_internal + 8))
  {
    [(SKPaymentQueue *)self _checkServerQueueForced:1];
    *((unsigned char *)self->_internal + 8) = 0;
  }
}

- (void)_updatedTransactions:(id)a3 restored:(BOOL)a4
{
  BOOL v40 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = *((id *)self->_internal + 6);
  objc_sync_enter(v35);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = *((id *)self->_internal + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "UUID", v35);

        if (v13)
        {
          v14 = [v12 UUID];
          [v7 setObject:v12 forKeyedSubscript:v14];
        }
        v15 = [v12 transactionIdentifier];

        if (v15)
        {
          v16 = [v12 transactionIdentifier];
          [v6 setObject:v12 forKeyedSubscript:v16];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v9);
  }

  long long v49 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  obuint64_t j = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v47;
    v37 = v44;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        v21 = [[SKPaymentTransaction alloc] initWithServerTransaction:v20];
        v22 = v21;
        if (v40)
        {
          v23 = [(SKPaymentTransaction *)v21 originalTransaction];
          if (v23)
          {
            BOOL v24 = [(SKPaymentTransaction *)v22 transactionState] == SKPaymentTransactionStatePurchased;

            if (v24) {
              [(SKPaymentTransaction *)v22 _setTransactionState:3];
            }
          }
        }
        v25 = [(SKPaymentTransaction *)v22 UUID];

        if (!v25
          || ([(SKPaymentTransaction *)v22 UUID],
              v26 = objc_claimAutoreleasedReturnValue(),
              [v7 objectForKeyedSubscript:v26],
              v27 = (SKPaymentTransaction *)objc_claimAutoreleasedReturnValue(),
              v26,
              !v27))
        {
          v28 = [(SKPaymentTransaction *)v22 transactionIdentifier];

          if (!v28
            || ([(SKPaymentTransaction *)v22 transactionIdentifier],
                v29 = objc_claimAutoreleasedReturnValue(),
                [v6 objectForKeyedSubscript:v29],
                v27 = (SKPaymentTransaction *)objc_claimAutoreleasedReturnValue(),
                v29,
                !v27))
          {
            v30 = (void *)*((void *)self->_internal + 6);
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v44[0] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke;
            v44[1] = &unk_1E5FAA940;
            v45 = v22;
            uint64_t v31 = [v30 indexOfObjectPassingTest:v43];
            if (v31 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v27 = 0;
            }
            else
            {
              v27 = [*((id *)self->_internal + 6) objectAtIndexedSubscript:v31];
            }
          }
        }
        uint64_t v32 = [(SKPaymentTransaction *)v22 transactionState];
        if (v32 == [(SKPaymentTransaction *)v27 transactionState]
          || [(SKPaymentTransaction *)v27 transactionState] == SKPaymentTransactionStatePurchasing
          || [(SKPaymentTransaction *)v27 transactionState] == SKPaymentTransactionStateDeferred)
        {
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v27;
              _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Updating existing transaction %{public}@", buf, 0xCu);
            }
            if ([(SKPaymentTransaction *)v27 mergeWithTransaction:v22]) {
              [v38 addObject:v27];
            }
            goto LABEL_44;
          }
        }
        else
        {
        }
        v33 = [v20 objectForKeyedSubscript:0x1F08A8900];
        if (!v33
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [*((id *)self->_internal + 2) isEqualToString:v33])
        {
          [*((id *)self->_internal + 5) addObject:v22];
          [*((id *)self->_internal + 6) addObject:v22];
          [v38 addObject:v22];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v55 = v22;
            _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "New transaction added to queue %{public}@", buf, 0xCu);
          }
        }

        v27 = 0;
LABEL_44:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v17);
  }

  objc_sync_exit(v35);
  if ([v38 count])
  {
    id v36 = *((id *)self->_internal + 8);
    objc_sync_enter(v36);
    v34 = (void *)*((void *)self->_internal + 8);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_93;
    v41[3] = &unk_1E5FAAA08;
    v41[4] = self;
    id v42 = v38;
    [v34 enumerateObjectsUsingBlock:v41];

    objc_sync_exit(v36);
  }
}

- (void)addTransactionObserver:(id)observer
{
  id v4 = observer;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot add nil observer"];
  }
  id v5 = [[SKWeakReference alloc] initWithObject:v4];
  id v6 = *((id *)self->_internal + 8);
  objc_sync_enter(v6);
  id v7 = (void *)*((void *)self->_internal + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__SKPaymentQueue_addTransactionObserver___block_invoke;
  v9[3] = &unk_1E5FAA940;
  id v8 = v4;
  id v10 = v8;
  if ([v7 indexOfObjectPassingTest:v9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*((id *)self->_internal + 8) addObject:v5];
    if ([*((id *)self->_internal + 8) count] == 1)
    {
      [(SKPaymentQueue *)self _checkServerQueueForced:0];
      [(SKPaymentQueue *)self _checkForMessages];
      [(SKPaymentQueue *)self listenForPurchaseIntents];
    }
  }

  objc_sync_exit(v6);
}

- (void)_checkServerQueueForced:(BOOL)a3
{
  BOOL v3 = a3;
  if ([*((id *)self->_internal + 8) count])
  {
    id v5 = +[SKServiceBroker defaultBroker];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__SKPaymentQueue__checkServerQueueForced___block_invoke;
    v10[3] = &unk_1E5FA9938;
    v10[4] = self;
    id v6 = [v5 storeKitServiceWithErrorHandler:v10];

    id v7 = [(SKPaymentQueue *)self paymentQueueClient];
    id v8 = [v7 plist];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SKPaymentQueue__checkServerQueueForced___block_invoke_85;
    v9[3] = &unk_1E5FA9960;
    void v9[4] = self;
    [v6 checkServerQueueForClientIfNecessary:v8 forceCheck:v3 reply:v9];
  }
}

- (SKPaymentQueueClient)paymentQueueClient
{
  return (SKPaymentQueueClient *)*((id *)self->_internal + 3);
}

- (void)_checkForMessages
{
  BOOL v3 = +[SKServiceBroker defaultBroker];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SKPaymentQueue__checkForMessages__block_invoke;
  v5[3] = &unk_1E5FA9938;
  v5[4] = self;
  id v4 = [v3 storeKitServiceWithErrorHandler:v5];

  [v4 checkForMessages];
}

- (void)dealloc
{
  BOOL v3 = +[SKClientBroker defaultBroker];
  [v3 unregisterClientWithIdentifier:*((void *)self->_internal + 2)];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2628] object:0];

  v5.receiver = self;
  v5.super_class = (Class)SKPaymentQueue;
  [(SKPaymentQueue *)&v5 dealloc];
}

+ (BOOL)canMakePayments
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 applicationHasMIDBasedSINF] ^ 1;
  }
  else {
    int v4 = 1;
  }
  objc_super v5 = [MEMORY[0x1E4F74230] sharedConnection];
  int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x1E4F74098]];

  int v7 = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
  id v8 = [MEMORY[0x1E4F74230] sharedConnection];
  int v9 = [v8 isOnDeviceAppInstallationAllowed];

  if (v6 == 2) {
    char v10 = 0;
  }
  else {
    char v10 = v4;
  }
  char v11 = v10 & ~(_BYTE)v7 & v9;
  if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"NO";
    if (v7) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    int v17 = 138544386;
    id v18 = a1;
    if (v4) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    __int16 v19 = 2114;
    v20 = v13;
    if (v6 == 2) {
      v15 = @"NO";
    }
    else {
      v15 = @"YES";
    }
    __int16 v21 = 2114;
    v22 = v14;
    if (v9) {
      v12 = @"YES";
    }
    __int16 v23 = 2114;
    BOOL v24 = v15;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Payments not allowed. demoMode: %{public}@ appAllowed: %{public}@ iapAllowed: %{public}@ appInstallAllowed: %{public}@", (uint8_t *)&v17, 0x34u);
  }

  return v11;
}

- (void)addPayment:(SKPayment *)payment
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v4 = payment;
  objc_super v5 = v4;
  if (v4)
  {
    int v6 = [(SKPayment *)v4 productIdentifier];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      if ([(SKPayment *)v5 quantity] <= 0)
      {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid quantity: %ld", -[SKPayment quantity](v5, "quantity"));
      }
      else
      {
        id v8 = [[SKPaymentTransaction alloc] initWithPayment:v5];
        id v9 = *((id *)self->_internal + 6);
        objc_sync_enter(v9);
        char v10 = (void *)*((void *)self->_internal + 6);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __29__SKPaymentQueue_addPayment___block_invoke;
        v29[3] = &unk_1E5FAA940;
        char v11 = v8;
        v30 = v11;
        uint64_t v12 = [v10 indexOfObjectPassingTest:v29];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [*((id *)self->_internal + 5) addObject:v11];
          [*((id *)self->_internal + 6) addObject:v11];
          int v13 = 1;
        }
        else
        {
          v16 = MEMORY[0x1E4F14500];
          id v17 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [(SKPayment *)v5 productIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v32 = self;
            __int16 v33 = 2114;
            uint64_t v34 = (uint64_t)v18;
            _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Payment added for transaction already in the SKPaymentQueue: %{public}@", buf, 0x16u);
          }
          __int16 v19 = [*((id *)self->_internal + 6) objectAtIndexedSubscript:v12];
          uint64_t v20 = [v19 transactionState];
          if (v20 == 2 || v20 == 4)
          {
            __int16 v21 = MEMORY[0x1E4F14500];
            id v22 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = [v19 transactionState];
              BOOL v24 = [(SKPayment *)v5 productIdentifier];
              *(_DWORD *)buf = 138543874;
              uint64_t v32 = self;
              __int16 v33 = 2048;
              uint64_t v34 = v23;
              __int16 v35 = 2114;
              id v36 = v24;
              _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reprocessing transaction with state %ld: %{public}@", buf, 0x20u);
            }
            [*((id *)self->_internal + 5) removeObjectAtIndex:v12];
            [*((id *)self->_internal + 6) removeObjectAtIndex:v12];
            [*((id *)self->_internal + 5) addObject:v11];
            [*((id *)self->_internal + 6) addObject:v11];
            int v13 = 1;
          }
          else
          {
            __int16 v25 = v19;

            int v13 = 0;
            char v11 = v25;
          }
        }
        objc_sync_exit(v9);

        v26 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
        [(SKPaymentQueue *)self _notifyObserversAboutChanges:v26 sendUpdatedDownloads:0];

        if (v13)
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __29__SKPaymentQueue_addPayment___block_invoke_28;
          v27[3] = &unk_1E5FAA968;
          v27[4] = self;
          v28 = v11;
          [(SKPaymentQueue *)self processTransaction:v28 completionHandler:v27];
        }
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F1CA00];
      v15 = [(SKPayment *)v5 productIdentifier];
      [v14 raise:*MEMORY[0x1E4F1C3C8], @"Invalid product identifier: %@", v15 format];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot add nil payment to SKPaymentQueue", buf, 0xCu);
  }
}

BOOL __29__SKPaymentQueue_addPayment___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) payment];
  id v8 = [v7 productIdentifier];
  id v9 = [v6 payment];
  char v10 = [v9 productIdentifier];
  if ([v8 isEqual:v10])
  {
    char v11 = [*(id *)(a1 + 32) payment];
    uint64_t v12 = [v11 quantity];
    int v13 = [v6 payment];
    BOOL v14 = v12 == [v13 quantity];
  }
  else
  {
    BOOL v14 = 0;
  }

  *a4 = v14;
  return v14;
}

void __29__SKPaymentQueue_addPayment___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __29__SKPaymentQueue_addPayment___block_invoke_28_cold_1();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Payment completed", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) _processTransactionDict:v5 forTransaction:*(void *)(a1 + 40) error:v6];
}

- (NSArray)transactionObservers
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = *((id *)self->_internal + 8);
  objc_sync_enter(v3);
  int v4 = (void *)*((void *)self->_internal + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SKPaymentQueue_transactionObservers__block_invoke;
  v7[3] = &unk_1E5FAA990;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  objc_sync_exit(v3);

  id v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

uint64_t __38__SKPaymentQueue_transactionObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 object];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

BOOL __41__SKPaymentQueue_addTransactionObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 object];
  uint64_t v7 = *(void **)(a1 + 32);

  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

- (void)cancelDownloads:(NSArray *)downloads
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = downloads;
  id v5 = +[SKServiceBroker defaultBroker];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__SKPaymentQueue_cancelDownloads___block_invoke;
  v21[3] = &unk_1E5FA9938;
  v21[4] = self;
  uint64_t v6 = [v5 storeKitServiceWithErrorHandler:v21];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = v4;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v12, "state", (void)v17)
          || [v12 state] == 1
          || [v12 state] == 2)
        {
          id v13 = (void *)*((void *)self->_internal + 4);
          BOOL v14 = [v12 _downloadID];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            v16 = [v12 _downloadID];
            [v6 cancelDownloadWithID:v16];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
}

void __34__SKPaymentQueue_cancelDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __34__SKPaymentQueue_cancelDownloads___block_invoke_cold_1();
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_internal + 10);

  return WeakRetained;
}

- (void)finishTransaction:(SKPaymentTransaction *)transaction
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = transaction;
  if ([(SKPaymentTransaction *)v4 transactionState])
  {
    id v5 = [(SKPaymentTransaction *)v4 downloads];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [(SKPaymentTransaction *)v4 downloads];
      [(SKPaymentQueue *)self cancelDownloads:v7];
    }
    uint64_t v8 = [(SKPaymentTransaction *)v4 transactionIdentifier];

    if (v8)
    {
      if ([(SKPaymentTransaction *)v4 transactionState] == SKPaymentTransactionStateFailed)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SKPaymentQueue finishTransaction:]((uint64_t)self, (uint64_t)v4, v9, v10, v11, v12, v13, v14);
        }
        [(SKPaymentQueue *)self _removeLocalTransaction:v4];
        [(SKPaymentQueue *)self _checkServerQueueForced:1];
      }
      else
      {
        v15 = +[SKServiceBroker defaultBroker];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __36__SKPaymentQueue_finishTransaction___block_invoke;
        v21[3] = &unk_1E5FAA9B8;
        v21[4] = self;
        v16 = v4;
        id v22 = v16;
        long long v17 = [v15 storeKitServiceWithErrorHandler:v21];

        long long v18 = [(SKPaymentTransaction *)v16 transactionIdentifier];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __36__SKPaymentQueue_finishTransaction___block_invoke_41;
        v19[3] = &unk_1E5FAA9B8;
        v19[4] = self;
        long long v20 = v16;
        [v17 finishPaymentWithIdentifier:v18 reply:v19];
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v24 = self;
        __int16 v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing transaction %{public}@ with no identifier", buf, 0x16u);
      }
      [(SKPaymentQueue *)self _removeLocalTransaction:v4];
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot finish a purchasing transaction"];
  }
}

void __36__SKPaymentQueue_finishTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __36__SKPaymentQueue_finishTransaction___block_invoke_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) payment];
  uint64_t v6 = [v5 productIdentifier];
  [v4 _logEventWithPrimaryError:v3 mappedError:0 inAppPurchaseID:v6 userAction:4];
}

void __36__SKPaymentQueue_finishTransaction___block_invoke_41(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) _removeLocalTransaction:*(void *)(a1 + 40)];
  if (v6)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) payment];
    id v5 = [v4 productIdentifier];
    [v3 _logEventWithPrimaryError:v6 mappedError:0 inAppPurchaseID:v5 userAction:4];
  }
}

- (void)pauseDownloads:(NSArray *)downloads
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = downloads;
  id v5 = +[SKServiceBroker defaultBroker];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __33__SKPaymentQueue_pauseDownloads___block_invoke;
  v21[3] = &unk_1E5FA9938;
  v21[4] = self;
  id v6 = [v5 storeKitServiceWithErrorHandler:v21];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = v4;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v12, "state", (void)v17) || objc_msgSend(v12, "state") == 1)
        {
          uint64_t v13 = (void *)*((void *)self->_internal + 4);
          uint64_t v14 = [v12 _downloadID];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            v16 = [v12 _downloadID];
            [v6 pauseDownloadWithID:v16];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
}

void __33__SKPaymentQueue_pauseDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __33__SKPaymentQueue_pauseDownloads___block_invoke_cold_1();
  }
}

- (void)removeTransactionObserver:(id)observer
{
  id v4 = observer;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot remove nil observer"];
  }
  id v5 = *((id *)self->_internal + 8);
  objc_sync_enter(v5);
  id v6 = (void *)*((void *)self->_internal + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SKPaymentQueue_removeTransactionObserver___block_invoke;
  v9[3] = &unk_1E5FAA940;
  id v7 = v4;
  id v10 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v9];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*((id *)self->_internal + 8) removeObjectAtIndex:v8];
    if (![*((id *)self->_internal + 8) count]) {
      [(SKPaymentQueue *)self stopListeningForPurchaseIntents];
    }
  }

  objc_sync_exit(v5);
}

BOOL __44__SKPaymentQueue_removeTransactionObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 object];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

- (void)restoreCompletedTransactions
{
}

- (void)restoreCompletedTransactionsWithApplicationUsername:(NSString *)username
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = username;
  id v5 = self->_internal;
  objc_sync_enter(v5);
  id internal = self->_internal;
  if (internal[9])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring restore transactions request because transactions are already being restored", buf, 0xCu);
    }
  }
  else
  {
    internal[9] = 1;
    id v7 = +[SKServiceBroker defaultBroker];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke;
    v12[3] = &unk_1E5FA9938;
    v12[4] = self;
    uint64_t v8 = [v7 storeKitServiceWithErrorHandler:v12];

    uint64_t v9 = [(SKPaymentQueue *)self paymentQueueClient];
    id v10 = [v9 plist];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_3;
    v11[3] = &unk_1E5FA9960;
    v11[4] = self;
    [v8 restoreCompletedTransactionsForUsername:v4 client:v10 reply:v11];
  }
  objc_sync_exit(v5);
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_cold_1();
  }
  id v4 = _SKErrorFromNSError(v3);
  [*(id *)(a1 + 32) _logEventWithPrimaryError:v3 mappedError:v4 inAppPurchaseID:0 userAction:1];
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  objc_sync_enter(v5);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(*(void *)(v6 + 8) + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_45;
  v10[3] = &unk_1E5FAAA08;
  v10[4] = v6;
  id v8 = v4;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  objc_sync_exit(v5);
  id v9 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 9) = 0;
  objc_sync_exit(v9);
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) restoreCompletedTransactionsFailedWithError:*(void *)(a1 + 48)];
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _updatedTransactions:v5 restored:1];
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  objc_sync_enter(v7);
  if (v6)
  {
    id v8 = _SKErrorFromNSError(v6);
    [*(id *)(a1 + 32) _logEventWithPrimaryError:v6 mappedError:v8 inAppPurchaseID:0 userAction:1];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_4;
  v13[3] = &unk_1E5FAAA08;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v11;
  [v9 enumerateObjectsUsingBlock:v13];

  objc_sync_exit(v7);
  id v12 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(v12);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 9) = 0;
  objc_sync_exit(v12);
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_4(int8x16_t *a1, void *a2)
{
  id v3 = [a2 object];
  if (a1[2].i64[0])
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = *(NSObject **)(*(void *)(a1[2].i64[1] + 8) + 72);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_5;
      block[3] = &unk_1E5FAA9E0;
      id v5 = &v14;
      id v14 = v3;
      int8x16_t v10 = a1[2];
      id v6 = (id)v10.i64[0];
      int8x16_t v15 = vextq_s8(v10, v10, 8uLL);
      dispatch_async(v4, block);

LABEL_6:
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v7 = *(NSObject **)(*(void *)(a1[2].i64[1] + 8) + 72);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_6;
    v11[3] = &unk_1E5FAA6D8;
    id v5 = (id *)v12;
    id v8 = v3;
    uint64_t v9 = a1[2].i64[1];
    v12[0] = v8;
    v12[1] = v9;
    dispatch_async(v7, v11);
    goto LABEL_6;
  }
}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) restoreCompletedTransactionsFailedWithError:*(void *)(a1 + 48)];
}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueueRestoreCompletedTransactionsFinished:*(void *)(a1 + 40)];
}

- (void)resumeDownloads:(NSArray *)downloads
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = downloads;
  id v5 = +[SKServiceBroker defaultBroker];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__SKPaymentQueue_resumeDownloads___block_invoke;
  v21[3] = &unk_1E5FA9938;
  v21[4] = self;
  id v6 = [v5 storeKitServiceWithErrorHandler:v21];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "state", (void)v17) == 2)
        {
          uint64_t v13 = (void *)*((void *)self->_internal + 4);
          id v14 = [v12 _downloadID];
          int8x16_t v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            v16 = [v12 _downloadID];
            [v6 resumeDownloadWithID:v16];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
}

void __34__SKPaymentQueue_resumeDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __34__SKPaymentQueue_resumeDownloads___block_invoke_cold_1();
  }
}

- (void)setDelegate:(id)delegate
{
}

- (void)showPriceConsentIfNeeded
{
  id v3 = +[SKServiceBroker defaultBroker];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke;
  v5[3] = &unk_1E5FA9938;
  v5[4] = self;
  id v4 = [v3 storeKitServiceWithErrorHandler:v5];

  [v4 displayMessageWithType:&unk_1F08C0DC0];
}

void __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke_cold_1();
  }
}

- (void)presentCodeRedemptionSheet
{
  id v3 = +[SKServiceBroker defaultBroker];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke;
  v5[3] = &unk_1E5FA9938;
  v5[4] = self;
  id v4 = [v3 storeKitServiceWithErrorHandler:v5];

  *((unsigned char *)self->_internal + 8) = 1;
  [v4 presentCodeRedemptionSheet];
}

void __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke_cold_1();
  }
}

- (void)startDownloads:(NSArray *)downloads
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = downloads;
  id v5 = +[SKServiceBroker defaultBroker];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __33__SKPaymentQueue_startDownloads___block_invoke;
  v26[3] = &unk_1E5FA9938;
  v26[4] = self;
  id v6 = [v5 storeKitServiceWithErrorHandler:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138543874;
    long long v20 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        unint64_t v13 = objc_msgSend(v12, "state", v20);
        if (v13 > 5 || ((1 << v13) & 0x31) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = [v12 state];
            *(_DWORD *)buf = v20;
            v28 = self;
            __int16 v29 = 2114;
            v30 = v12;
            __int16 v31 = 2048;
            uint64_t v32 = v18;
            _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring download %{public}@ in state %ld.", buf, 0x20u);
          }
        }
        else
        {
          int8x16_t v15 = (void *)*((void *)self->_internal + 4);
          v16 = [v12 _downloadID];
          [v15 setObject:v12 forKeyedSubscript:v16];

          long long v17 = [v12 _downloadID];
          [v6 addDownloadWithID:v17];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v33 count:16];
      uint64_t v9 = v19;
    }
    while (v19);
  }
}

void __33__SKPaymentQueue_startDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __33__SKPaymentQueue_startDownloads___block_invoke_cold_1();
  }
}

- (SKStorefront)storefront
{
  id v3 = *((id *)self->_internal + 8);
  objc_sync_enter(v3);
  id v4 = *((id *)self->_internal + 7);
  objc_sync_exit(v3);

  return (SKStorefront *)v4;
}

- (NSArray)transactions
{
  id v3 = *((id *)self->_internal + 6);
  objc_sync_enter(v3);
  id v4 = (void *)[*((id *)self->_internal + 6) copy];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (SKPaymentQueue)initWithPaymentQueueClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SKPaymentQueue *)self _initSKPaymentQueue];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id internal = v5->_internal;
    long long v8 = (void *)internal[3];
    internal[3] = v6;
  }
  return v5;
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v10 = a3;
  uint64_t v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [(SKPaymentQueue *)self paymentQueueClient];
  long long v8 = [v7 delegate];

  if (objc_opt_respondsToSelector())
  {
    [v8 handleEngagementRequest:v10 resultHandler:v6];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:5 userInfo:0];
    v6[2](v6, 0, v9);
  }
}

- (void)askToShowMessageWithReplyBlock:(id)a3
{
  long long v8 = (void (**)(id, void, uint64_t))a3;
  id v4 = [(SKPaymentQueue *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(SKPaymentQueue *)self delegate];
    uint64_t v7 = [v6 paymentQueueShouldShowPriceConsent:self];
  }
  else
  {
    uint64_t v7 = 1;
  }
  v8[2](v8, v5 & 1, v7);
}

- (void)updatedTransactions:(id)a3
{
}

- (void)removedTransactions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  obuint64_t j = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = 0;
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        while ([*((id *)self->_internal + 6) count] > v9)
        {
          uint64_t v11 = [*((id *)self->_internal + 6) objectAtIndexedSubscript:v9];
          id v12 = [v11 UUID];
          int v13 = [v12 isEqualToString:v10];

          if (v13)
          {
            [v18 addObject:v11];
            [v17 addIndex:v9];

            break;
          }

          ++v9;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  if ([v17 count]) {
    [*((id *)self->_internal + 6) removeObjectsAtIndexes:v17];
  }
  objc_sync_exit(obj);

  if ([v18 count])
  {
    id obja = *((id *)self->_internal + 8);
    objc_sync_enter(obja);
    id v14 = (void *)*((void *)self->_internal + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __38__SKPaymentQueue_removedTransactions___block_invoke;
    v19[3] = &unk_1E5FAAA08;
    v19[4] = self;
    id v20 = v18;
    [v14 enumerateObjectsUsingBlock:v19];

    objc_sync_exit(obja);
  }
}

void __38__SKPaymentQueue_removedTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SKPaymentQueue_removedTransactions___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __38__SKPaymentQueue_removedTransactions___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v1 paymentQueue:v2 removedTransactions:v3];
}

- (void)downloadAdded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)*((void *)self->_internal + 4);
  uint64_t v6 = [v4 objectForKeyedSubscript:0x1F08A8A40];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  [v7 _setDownloadState:0];
  id v8 = *((id *)self->_internal + 8);
  objc_sync_enter(v8);
  id v9 = (void *)*((void *)self->_internal + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__SKPaymentQueue_downloadAdded___block_invoke;
  v11[3] = &unk_1E5FAAA08;
  void v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [v9 enumerateObjectsUsingBlock:v11];

  objc_sync_exit(v8);
}

void __32__SKPaymentQueue_downloadAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SKPaymentQueue_downloadAdded___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __32__SKPaymentQueue_downloadAdded___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 paymentQueue:v2 updatedDownloads:v3];
}

- (void)downloadStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:0x1F08A8A40];
  uint64_t v6 = [v4 objectForKeyedSubscript:0x1F08A8A80];
  if (v5)
  {
    id v7 = [*((id *)self->_internal + 4) objectForKeyedSubscript:v5];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 _setContentURL:0];
        [v7 _setError:0];
        [v7 _setTimeRemaining:SKDownloadTimeRemainingUnknown];
        id v8 = [v6 objectForKeyedSubscript:0x1F08A89E0];
        int v9 = [v8 intValue];

        if (v9 != 4)
        {
          uint64_t v10 = [v6 objectForKeyedSubscript:@"isFailed"];
          int v11 = [v10 BOOLValue];

          if (!v11)
          {
            long long v22 = [v6 objectForKeyedSubscript:@"isCancelled"];
            int v23 = [v22 BOOLValue];

            if (v23)
            {
              [v7 _setDownloadState:5];
              LODWORD(v24) = 1.0;
              [v7 _setProgress:v24];
LABEL_20:
              id v26 = *((id *)self->_internal + 8);
              objc_sync_enter(v26);
              uint64_t v27 = (void *)*((void *)self->_internal + 8);
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __40__SKPaymentQueue_downloadStatusChanged___block_invoke;
              v39[3] = &unk_1E5FAAA08;
              v39[4] = self;
              id v7 = v7;
              id v40 = v7;
              [v27 enumerateObjectsUsingBlock:v39];

              objc_sync_exit(v26);
              goto LABEL_21;
            }
            if (v9 == 2
              || ([v6 objectForKeyedSubscript:@"isPaused"],
                  v28 = objc_claimAutoreleasedReturnValue(),
                  int v29 = [v28 BOOLValue],
                  v28,
                  v29))
            {
              [v7 _setDownloadState:2];
              int v13 = [v6 objectForKeyedSubscript:0x1F08A8A60];
              [v13 doubleValue];
              *(float *)&double v30 = v30;
              [v7 _setProgress:v30];
            }
            else
            {
              __int16 v31 = [v6 objectForKeyedSubscript:0x1F08A8A60];
              [v31 doubleValue];
              double v33 = v32;

              if (v9 == 3 || (double v34 = 1.0 - v33, 1.0 - v33 < 0.0001))
              {
                __int16 v35 = objc_msgSend(v6, "objectForKeyedSubscript:", 0x1F08A8AC0, v34);
                if ([v35 length])
                {
                  id v36 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v35 isDirectory:1];
                  [v7 _setContentURL:v36];
                }
                [v7 _setDownloadState:3];
              }
              else
              {
                objc_msgSend(v7, "_setDownloadState:", 1, v34);
              }
              [v7 _setError:0];
              *(float *)&double v37 = v33;
              [v7 _setProgress:v37];
              int v13 = [v6 objectForKeyedSubscript:0x1F08A8AA0];
              [v13 doubleValue];
              objc_msgSend(v7, "_setTimeRemaining:");
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        [v7 _setDownloadState:4];
        LODWORD(v12) = 1.0;
        [v7 _setProgress:v12];
        int v13 = [v6 objectForKeyedSubscript:0x1F08A88C0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v13;
            id v14 = [v17 objectForKeyedSubscript:@"domain"];
            id v18 = [v17 objectForKeyedSubscript:@"code"];
            uint64_t v38 = [v18 integerValue];

            uint64_t v19 = [v17 objectForKeyedSubscript:@"userInfo"];

            id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:v14 code:v38 userInfo:v19];
            long long v21 = _SKErrorFromNSError(v20);

            [v7 _setError:v21];
          }
          else
          {
            id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
            [v7 _setError:v14];
          }
          goto LABEL_18;
        }
        id v14 = v13;
        int8x16_t v15 = [v14 domain];
        if ([v15 isEqualToString:*MEMORY[0x1E4F281F8]])
        {
          uint64_t v16 = [v14 code];

          if (v16 == 3072)
          {
            [v7 _setDownloadState:5];
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
        }
        uint64_t v25 = _SKErrorFromNSError(v14);

        [v7 _setError:v25];
        id v14 = (id)v25;
        goto LABEL_18;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_21:
}

void __40__SKPaymentQueue_downloadStatusChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SKPaymentQueue_downloadStatusChanged___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __40__SKPaymentQueue_downloadStatusChanged___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 paymentQueue:v2 updatedDownloads:v3];
}

- (void)downloadRemoved:(id)a3
{
  id v4 = a3;
  id v5 = (void *)*((void *)self->_internal + 4);
  uint64_t v6 = [v4 objectForKeyedSubscript:0x1F08A8A40];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if ([v7 state] != 3 && objc_msgSend(v7, "state") != 4 && objc_msgSend(v7, "state") != 5)
  {
    [v7 _setDownloadState:5];
    id v8 = *((id *)self->_internal + 8);
    objc_sync_enter(v8);
    id v9 = (void *)*((void *)self->_internal + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__SKPaymentQueue_downloadRemoved___block_invoke;
    v10[3] = &unk_1E5FAAA08;
    v10[4] = self;
    id v11 = v7;
    [v9 enumerateObjectsUsingBlock:v10];

    objc_sync_exit(v8);
  }
}

void __34__SKPaymentQueue_downloadRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__SKPaymentQueue_downloadRemoved___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __34__SKPaymentQueue_downloadRemoved___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 paymentQueue:v2 updatedDownloads:v3];
}

- (void)removedEntitlementsForProductIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = *((id *)self->_internal + 8);
  objc_sync_enter(v5);
  uint64_t v6 = (void *)*((void *)self->_internal + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SKPaymentQueue_removedEntitlementsForProductIdentifiers___block_invoke;
  v8[3] = &unk_1E5FAAA08;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v8];

  objc_sync_exit(v5);
}

void __59__SKPaymentQueue_removedEntitlementsForProductIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector()) {
    [v3 paymentQueue:*(void *)(a1 + 32) didRevokeEntitlementsForProductIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  [(SKPaymentQueue *)self _checkServerQueueForced:0];
  if ([*((id *)self->_internal + 8) count])
  {
    [(SKPaymentQueue *)self _checkForMessages];
  }
}

- (void)clearTransactions
{
  obuint64_t j = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  [*((id *)self->_internal + 5) removeAllObjects];
  [*((id *)self->_internal + 6) removeAllObjects];
  objc_sync_exit(obj);
}

- (void)removeTransactionWithID:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [v3 stringValue];

  obuint64_t j = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  id v5 = (void *)[*((id *)self->_internal + 5) mutableCopy];
  uint64_t v6 = (void *)[*((id *)self->_internal + 6) mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = *((id *)self->_internal + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "transactionIdentifier", obj);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = *((id *)self->_internal + 6);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v19 = objc_msgSend(v18, "transactionIdentifier", obj);
        int v20 = [v19 isEqualToString:v4];

        if (v20) {
          [v6 removeObject:v18];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v15);
  }

  id internal = self->_internal;
  p_id internal = &self->_internal;
  long long v22 = (void *)internal[5];
  internal[5] = v5;
  id v23 = v5;

  double v24 = (void *)*((void *)*p_internal + 6);
  *((void *)*p_internal + 6) = v6;

  objc_sync_exit(obj);
}

void __35__SKPaymentQueue__checkForMessages__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __35__SKPaymentQueue__checkForMessages__block_invoke_cold_1();
  }
}

void __42__SKPaymentQueue__checkServerQueueForced___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __42__SKPaymentQueue__checkServerQueueForced___block_invoke_cold_1();
  }
}

- (void)_notifyObserversAboutChanges:(id)a3 sendUpdatedDownloads:(BOOL)a4
{
  BOOL v24 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  [(SKPaymentQueue *)self _removeNilTransactionObservers];
  id v17 = *((id *)self->_internal + 8);
  objc_sync_enter(v17);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v21 = self;
  obuint64_t j = *((id *)self->_internal + 8);
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    uint64_t v23 = *(void *)v40;
    id v18 = v26;
    uint64_t v19 = v35;
    do
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "object", v17, v18, v19);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *((void *)v21->_internal + 9);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          v35[0] = __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke;
          v35[1] = &unk_1E5FAA9E0;
          id v36 = v8;
          double v37 = v21;
          id v38 = v22;
          dispatch_async(v9, block);
        }
        if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v11 = v22;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v43 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v31;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v31 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = [*(id *)(*((void *)&v30 + 1) + 8 * v14) downloads];
                if (v15) {
                  [v10 addObjectsFromArray:v15];
                }

                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v43 count:16];
            }
            while (v12);
          }

          if ([v10 count])
          {
            uint64_t v16 = *((void *)v21->_internal + 9);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v26[0] = __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke_2;
            v26[1] = &unk_1E5FAA9E0;
            id v27 = v8;
            long long v28 = v21;
            id v29 = v10;
            dispatch_async(v16, v25);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v17);
}

uint64_t __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) updatedTransactions:*(void *)(a1 + 48)];
}

uint64_t __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) updatedDownloads:*(void *)(a1 + 48)];
}

- (void)_notifyObserversAboutRemovals:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  [(SKPaymentQueue *)self _removeNilTransactionObservers];
  obuint64_t j = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *((id *)self->_internal + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v16 + 1) + 8 * v7) object];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = *((void *)self->_internal + 9);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          void block[2] = __48__SKPaymentQueue__notifyObserversAboutRemovals___block_invoke;
          block[3] = &unk_1E5FAA9E0;
          id v13 = v8;
          uint64_t v14 = self;
          id v15 = v11;
          dispatch_async(v9, block);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  objc_sync_exit(obj);
}

uint64_t __48__SKPaymentQueue__notifyObserversAboutRemovals___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) removedTransactions:*(void *)(a1 + 48)];
}

- (void)_processTransactionDict:(id)a3 forTransaction:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    if (v8)
    {
      [v9 mergeWithServerTransaction:v8];
      goto LABEL_13;
    }
    [v9 _setTransactionState:2];
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    [v9 _setError:v14];
    id v15 = [v9 payment];
    long long v16 = [v15 productIdentifier];
    long long v17 = self;
    long long v18 = v14;
    long long v19 = 0;
LABEL_12:
    [(SKPaymentQueue *)v17 _logEventWithPrimaryError:v18 mappedError:v19 inAppPurchaseID:v16 userAction:3];

    goto LABEL_13;
  }
  uint64_t v12 = [v10 domain];
  if (![v12 isEqualToString:@"ASDErrorDomain"])
  {

    goto LABEL_10;
  }
  uint64_t v13 = [v11 code];

  if (v13 != 1052)
  {
LABEL_10:
    [v9 _setTransactionState:2];
    uint64_t v14 = _SKErrorFromNSError(v11);
    [v9 _setError:v14];
    id v15 = [v9 payment];
    long long v16 = [v15 productIdentifier];
    long long v17 = self;
    long long v18 = v11;
    long long v19 = v14;
    goto LABEL_12;
  }
  if (v8) {
    [v9 mergeWithServerTransaction:v8];
  }
  [v9 _setTransactionState:4];
LABEL_13:
  id v20 = *((id *)self->_internal + 8);
  objc_sync_enter(v20);
  uint64_t v21 = (void *)*((void *)self->_internal + 8);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke;
  v23[3] = &unk_1E5FAAA08;
  v23[4] = self;
  id v22 = v9;
  id v24 = v22;
  [v21 enumerateObjectsUsingBlock:v23];

  objc_sync_exit(v20);
}

void __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke_2(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 paymentQueue:v2 updatedTransactions:v3];
}

- (void)_removeLocalTransaction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_msgSend(*((id *)self->_internal + 5), "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
    [*((id *)self->_internal + 5) removeObjectAtIndex:v5];
    [*((id *)self->_internal + 6) removeObject:v7];
    [(SKPaymentQueue *)self _notifyObserversAboutRemovals:v6];
  }
}

- (void)_removeNilTransactionObservers
{
  obuint64_t j = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  id v3 = objc_opt_new();
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v5 = [*((id *)self->_internal + 8) count];
    uint64_t v6 = (void *)*((void *)self->_internal + 8);
    if (i >= v5) {
      break;
    }
    id v7 = [v6 objectAtIndexedSubscript:i];
    id v8 = [v7 object];

    if (!v8) {
      [v3 addIndex:i];
    }
  }
  [v6 removeObjectsAtIndexes:v3];

  objc_sync_exit(obj);
}

uint64_t __48__SKPaymentQueue__updatedTransactions_restored___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 canMergeWithTransaction:*(void *)(a1 + 32)];
  *a4 = result;
  return result;
}

void __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_2;
    block[3] = &unk_1E5FAA9E0;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

void __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v1 paymentQueue:v2 updatedTransactions:v3];
}

- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4 inAppPurchaseID:(id)a5 userAction:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_alloc_init(SKOneErrorEvent);
  [(SKBaseErrorEvent *)v12 setInAppPurchaseID:v9];

  [(SKBaseErrorEvent *)v12 setUserAction:a6];
  [(SKBaseErrorEvent *)v12 setPrimaryError:v11];

  [(SKBaseErrorEvent *)v12 setMappedError:v10];
  +[SKAnalyticsManager sendEvent:v12];
}

- (void).cxx_destruct
{
}

- (void)notifyPurchaseIntentObserversForProducts:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SKPaymentQueue *)self _removeNilTransactionObservers];
  id v13 = *((id *)self->_internal + 8);
  objc_sync_enter(v13);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v17 = +[SKPayment paymentFromPurchaseIntentWithProduct:](SKPayment, "paymentFromPurchaseIntentWithProduct:", v6, v13);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v7 = *((id *)self->_internal + 8);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v7);
              }
              id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * j) object];
              if (objc_opt_respondsToSelector())
              {
                uint64_t v12 = *((void *)self->_internal + 9);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                void block[2] = __68__SKPaymentQueue_Package__notifyPurchaseIntentObserversForProducts___block_invoke;
                block[3] = &unk_1E5FA9C80;
                id v19 = v11;
                id v20 = self;
                id v21 = v17;
                uint64_t v22 = v6;
                dispatch_async(v12, block);
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v8);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v13);
}

void __68__SKPaymentQueue_Package__notifyPurchaseIntentObserversForProducts___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) paymentQueue:*(void *)(a1 + 40) shouldAddStorePayment:*(void *)(a1 + 48) forProduct:*(void *)(a1 + 56)];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 56) productIdentifier];
    id v4 = (void *)v3;
    uint64_t v5 = @"NO";
    if (v2) {
      uint64_t v5 = @"YES";
    }
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[SKPaymentQueue]: Sent purchase intent: %{public}@ to delegate, response was %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (v2) {
    [*(id *)(a1 + 40) addPayment:*(void *)(a1 + 48)];
  }
}

- (BOOL)shouldContinueTransaction:(id)a3 inNewStorefront:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)self->_internal + 10);
  objc_sync_enter(WeakRetained);
  id v9 = objc_loadWeakRetained((id *)self->_internal + 10);
  objc_sync_exit(WeakRetained);

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v10 = [v9 paymentQueue:self shouldContinueTransaction:v6 inStorefront:v7];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)listenForPurchaseIntents
{
  int v2 = self;
  sub_1B00CE70C();
}

- (void)stopListeningForPurchaseIntents
{
  int v2 = self;
  sub_1B00CF08C();
}

+ (void)listenForStorefrontChanges
{
}

- (void)processTransaction:(SKPaymentTransaction *)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  __int16 v8 = a3;
  id v9 = self;

  sub_1B014BBB4((uint64_t)&unk_1E9B1B010, (uint64_t)v7);
}

- (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4
{
  uint64_t v5 = sub_1B01DB560();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  __int16 v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B01DBB50();
  uint64_t v11 = v10;
  sub_1B01DB530();
  uint64_t v12 = self;
  SKPaymentQueue.forceSandbox(forBundleIdentifier:until:)(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void __29__SKPaymentQueue_addPayment___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Payment completed with error: %{public}@", v1, v2, v3, v4, v5);
}

void __34__SKPaymentQueue_cancelDownloads___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while cancelling downloads %{public}@", v1, v2, v3, v4, v5);
}

- (void)finishTransaction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __36__SKPaymentQueue_finishTransaction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while finishing transaction: %{public}@", v1, v2, v3, v4, v5);
}

void __33__SKPaymentQueue_pauseDownloads___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while pausing downloads: %{public}@", v1, v2, v3, v4, v5);
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while restoring transactions: %{public}@", v1, v2, v3, v4, v5);
}

void __34__SKPaymentQueue_resumeDownloads___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while resuming downloads: %{public}@", v1, v2, v3, v4, v5);
}

void __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while showing price consent: %{public}@", v1, v2, v3, v4, v5);
}

void __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while presenting code redemption sheet: %{public}@", v1, v2, v3, v4, v5);
}

void __33__SKPaymentQueue_startDownloads___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while starting downloads: %{public}@", v1, v2, v3, v4, v5);
}

void __35__SKPaymentQueue__checkForMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while checking for messages: %{public}@", v1, v2, v3, v4, v5);
}

void __42__SKPaymentQueue__checkServerQueueForced___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while checking server queue: %{public}@", v1, v2, v3, v4, v5);
}

@end