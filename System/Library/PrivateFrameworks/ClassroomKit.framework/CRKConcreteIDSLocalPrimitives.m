@interface CRKConcreteIDSLocalPrimitives
+ (id)makeAccountsDifferenceEngineForPrimitives:(id)a3;
- (BOOL)isRemoteUserNotRegisteredError:(id)a3;
- (BOOL)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (CRKArrayDifferenceEngine)accountsDifferenceEngine;
- (CRKConcreteIDSLocalPrimitives)initWithServiceName:(id)a3;
- (IDSAccountController)accountController;
- (IDSService)service;
- (NSArray)accounts;
- (NSDictionary)debugInfo;
- (NSHashTable)didReceiveSubscriptions;
- (NSHashTable)didSendSubscriptions;
- (NSMutableArray)backingAccounts;
- (NSString)serviceName;
- (id)errorForIDSIDStatus:(int64_t)a3;
- (id)errorsByAddressForQueryRefreshResult:(id)a3;
- (id)makeRemoteUserNotRegisteredError;
- (id)subscribeToMessageReceivesWithHandler:(id)a3;
- (id)subscribeToMessageSendsWithHandler:(id)a3;
- (void)didReceiveSubscriptionDidCancel:(id)a3;
- (void)didReceiveSubscriptionDidResume:(id)a3;
- (void)didSendSubscriptionDidCancel:(id)a3;
- (void)didSendSubscriptionDidResume:(id)a3;
- (void)fetchFirewallWithCompletion:(id)a3;
- (void)forceRefreshIDStatusForDestinations:(id)a3 completion:(id)a4;
- (void)insertAccounts:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inAccountsAtIndex:(unint64_t)a4;
- (void)publishAccountChanges;
- (void)removeAccountsAtIndexes:(id)a3;
- (void)removeObjectFromAccountsAtIndex:(unint64_t)a3;
- (void)replaceObjectInAccountsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation CRKConcreteIDSLocalPrimitives

- (CRKConcreteIDSLocalPrimitives)initWithServiceName:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRKConcreteIDSLocalPrimitives;
  v5 = [(CRKConcreteIDSLocalPrimitives *)&v23 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [v6 setWantsCrossAccountMessaging:1];
    uint64_t v7 = objc_opt_new();
    backingAccounts = v5->_backingAccounts;
    v5->_backingAccounts = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    didSendSubscriptions = v5->_didSendSubscriptions;
    v5->_didSendSubscriptions = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    didReceiveSubscriptions = v5->_didReceiveSubscriptions;
    v5->_didReceiveSubscriptions = (NSHashTable *)v11;

    uint64_t v13 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:v4];
    service = v5->_service;
    v5->_service = (IDSService *)v15;

    v17 = (void *)MEMORY[0x263EF83A0];
    [(IDSService *)v5->_service addDelegate:v5 withDelegateProperties:v6 queue:MEMORY[0x263EF83A0]];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F49FF8]) initWithService:v4];
    accountController = v5->_accountController;
    v5->_accountController = (IDSAccountController *)v18;

    [(IDSAccountController *)v5->_accountController addDelegate:v5 queue:v17];
    uint64_t v20 = [(id)objc_opt_class() makeAccountsDifferenceEngineForPrimitives:v5];
    accountsDifferenceEngine = v5->_accountsDifferenceEngine;
    v5->_accountsDifferenceEngine = (CRKArrayDifferenceEngine *)v20;

    [(CRKConcreteIDSLocalPrimitives *)v5 publishAccountChanges];
  }

  return v5;
}

- (id)subscribeToMessageReceivesWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _CRKLogASM_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Creating message receive subscription", (uint8_t *)&v10, 0x16u);
  }
  v8 = [[CRKConcreteIDSMessageDidReceiveSubscription alloc] initWithHandler:v4];

  [(CRKConcreteIDSMessageDidReceiveSubscription *)v8 setDelegate:self];

  return v8;
}

- (id)subscribeToMessageSendsWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _CRKLogASM_5();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Creating message send subscription", (uint8_t *)&v10, 0x16u);
  }
  v8 = [[CRKConcreteIDSMessageDidSendSubscription alloc] initWithHandler:v4];

  [(CRKConcreteIDSMessageDidSendSubscription *)v8 setDelegate:self];

  return v8;
}

- (BOOL)sendMessage:(id)a3 toAddress:(id)a4 fromID:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = (void *)MEMORY[0x22A620140](a5);
  uint64_t v18 = _CRKLogASM_5();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    int v29 = 138544642;
    v30 = v20;
    __int16 v31 = 2048;
    v32 = self;
    __int16 v33 = 2114;
    id v34 = v14;
    __int16 v35 = 2114;
    id v36 = v15;
    __int16 v37 = 2114;
    v38 = v17;
    __int16 v39 = 2114;
    id v40 = v16;
    _os_log_impl(&dword_224C00000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Sending message %{public}@ to destination %{public}@ from appleID %{public}@ with options: %{public}@", (uint8_t *)&v29, 0x3Eu);
  }
  v21 = objc_opt_new();
  [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EB8]];
  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "shouldFireAndForget"));
  [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x263F49EF8]];

  [v21 setObject:v17 forKeyedSubscript:*MEMORY[0x263F49F10]];
  objc_super v23 = [v16 deliveryTimeout];
  [v21 setObject:v23 forKeyedSubscript:*MEMORY[0x263F49F80]];

  v24 = [(CRKConcreteIDSLocalPrimitives *)self service];
  v25 = [MEMORY[0x263EFFA08] setWithObject:v15];
  v26 = (void *)[v21 copy];
  char v27 = [v24 sendMessage:v14 toDestinations:v25 priority:300 options:v26 identifier:a7 error:a8];

  return v27;
}

- (void)fetchFirewallWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteIDSLocalPrimitives *)self service];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CRKConcreteIDSLocalPrimitives_fetchFirewallWithCompletion___block_invoke;
  v7[3] = &unk_2646F3BA0;
  id v8 = v4;
  id v6 = v4;
  [v5 retrieveFirewallWithQueue:MEMORY[0x263EF83A0] completion:v7];
}

void __61__CRKConcreteIDSLocalPrimitives_fetchFirewallWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = [[CRKConcreteIDSFirewall alloc] initWithUnderlyingFirewall:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)forceRefreshIDStatusForDestinations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F4A058];
  id v8 = a3;
  uint64_t v9 = [v7 sharedInstance];
  int v10 = [(CRKConcreteIDSLocalPrimitives *)self serviceName];
  uint64_t v11 = [(CRKConcreteIDSLocalPrimitives *)self serviceName];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__CRKConcreteIDSLocalPrimitives_forceRefreshIDStatusForDestinations_completion___block_invoke;
  v13[3] = &unk_2646F3BC8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v9 forceRefreshIDStatusForDestinations:v8 service:v10 listenerID:v11 queue:MEMORY[0x263EF83A0] completionBlock:v13];
}

void __80__CRKConcreteIDSLocalPrimitives_forceRefreshIDStatusForDestinations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) errorsByAddressForQueryRefreshResult:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (NSDictionary)debugInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"Accounts";
  uint64_t v2 = [(CRKConcreteIDSLocalPrimitives *)self accounts];
  id v3 = objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_13);
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

uint64_t __42__CRKConcreteIDSLocalPrimitives_debugInfo__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (id)makeRemoteUserNotRegisteredError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F49E40] code:3 userInfo:0];
}

- (BOOL)isRemoteUserNotRegisteredError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F49E40]]) {
    BOOL v5 = [v3 code] == 3;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a7;
  id v12 = _CRKLogASM_5();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = [NSNumber numberWithBool:v8];
    id v16 = [v11 verboseDescription];
    *(_DWORD *)buf = 138544386;
    int v29 = v14;
    __int16 v30 = 2048;
    __int16 v31 = self;
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    __int16 v35 = v15;
    __int16 v36 = 2114;
    __int16 v37 = v16;
    _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: IDSService did send message (%{public}@) with success (%{public}@) and error (%{public}@)", buf, 0x34u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = [(CRKConcreteIDSLocalPrimitives *)self didSendSubscriptions];
  uint64_t v18 = [v17 allObjects];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v22++) receiveMessageIdentifier:v10 didSucceed:v8 error:v11];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = _CRKLogASM_5();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544130;
    char v27 = v13;
    __int16 v28 = 2048;
    int v29 = self;
    __int16 v30 = 2114;
    id v31 = v9;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: IDSService did receive message (%{public}@) from sender (%{public}@)", buf, 0x2Au);
  }
  id v14 = (void *)IDSCopyRawAddressForDestination();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = [(CRKConcreteIDSLocalPrimitives *)self didReceiveSubscriptions];
  id v16 = [v15 allObjects];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v20++) receiveMessage:v9 senderAppleID:v14 senderAddress:v10];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (void)didSendSubscriptionDidResume:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteIDSLocalPrimitives *)self didSendSubscriptions];
  [v5 addObject:v4];
}

- (void)didSendSubscriptionDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteIDSLocalPrimitives *)self didSendSubscriptions];
  [v5 removeObject:v4];
}

- (void)didReceiveSubscriptionDidResume:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteIDSLocalPrimitives *)self didReceiveSubscriptions];
  [v5 addObject:v4];
}

- (void)didReceiveSubscriptionDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteIDSLocalPrimitives *)self didReceiveSubscriptions];
  [v5 removeObject:v4];
}

+ (id)makeAccountsDifferenceEngineForPrimitives:(id)a3
{
  id v3 = a3;
  id v4 = +[CRKArrayDifferenceEngine configurationWithIncomingItemsIdentifierFunction:&__block_literal_global_26 publishedItemsIdentifierFunction:&__block_literal_global_29];
  [v4 setUpdateBlock:&__block_literal_global_32];
  [v4 setLiftingFunction:&__block_literal_global_35];
  id v5 = [[CRKArrayDifferenceEngine alloc] initWithObject:v3 keyPath:@"accounts" configuration:v4];

  return v5;
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke(uint64_t a1, void *a2)
{
  return [a2 loginID];
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 loginID];
}

uint64_t __75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_3(uint64_t a1, void *a2)
{
  return 0;
}

CRKConcreteIDSAccount *__75__CRKConcreteIDSLocalPrimitives_makeAccountsDifferenceEngineForPrimitives___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CRKConcreteIDSAccount alloc] initWithAccount:v2];

  return v3;
}

- (void)publishAccountChanges
{
  id v3 = [(CRKConcreteIDSLocalPrimitives *)self accountController];
  id v4 = [v3 accounts];
  uint64_t v5 = [v4 allObjects];
  id v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [(CRKConcreteIDSLocalPrimitives *)self accountsDifferenceEngine];
  [v9 updateWithNewArray:v8];
}

- (id)errorsByAddressForQueryRefreshResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __70__CRKConcreteIDSLocalPrimitives_errorsByAddressForQueryRefreshResult___block_invoke;
  id v12 = &unk_2646F3C90;
  id v13 = v5;
  id v14 = self;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __70__CRKConcreteIDSLocalPrimitives_errorsByAddressForQueryRefreshResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = a2;
  objc_msgSend(v5, "errorForIDSIDStatus:", objc_msgSend(a3, "integerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)errorForIDSIDStatus:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = 45;
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    if (a3 == 2) {
      uint64_t v4 = 46;
    }
    else {
      uint64_t v4 = 1;
    }
LABEL_7:
    uint64_t v5 = CRKErrorWithCodeAndUserInfo(v4, 0);
    return v5;
  }
  uint64_t v5 = 0;
  return v5;
}

- (NSArray)accounts
{
  id v2 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)insertObject:(id)a3 inAccountsAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  [v7 insertObject:v6 atIndex:a4];
}

- (void)insertAccounts:(id)a3 atIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  [v8 insertObjects:v7 atIndexes:v6];
}

- (void)removeObjectFromAccountsAtIndex:(unint64_t)a3
{
  id v4 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  [v4 removeObjectAtIndex:a3];
}

- (void)removeAccountsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  [v5 removeObjectsAtIndexes:v4];
}

- (void)replaceObjectInAccountsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(CRKConcreteIDSLocalPrimitives *)self backingAccounts];
  [v7 replaceObjectAtIndex:a3 withObject:v6];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (IDSService)service
{
  return self->_service;
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (CRKArrayDifferenceEngine)accountsDifferenceEngine
{
  return self->_accountsDifferenceEngine;
}

- (NSMutableArray)backingAccounts
{
  return self->_backingAccounts;
}

- (NSHashTable)didSendSubscriptions
{
  return self->_didSendSubscriptions;
}

- (NSHashTable)didReceiveSubscriptions
{
  return self->_didReceiveSubscriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didReceiveSubscriptions, 0);
  objc_storeStrong((id *)&self->_didSendSubscriptions, 0);
  objc_storeStrong((id *)&self->_backingAccounts, 0);
  objc_storeStrong((id *)&self->_accountsDifferenceEngine, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end