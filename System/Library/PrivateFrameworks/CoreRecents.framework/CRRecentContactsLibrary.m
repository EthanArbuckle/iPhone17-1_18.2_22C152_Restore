@interface CRRecentContactsLibrary
+ (id)_recentEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 weight:(id)a6 metadata:(id)a7 options:(unint64_t)a8;
+ (id)apiLogDescriptionOfEvent:(id)a3;
+ (id)defaultInstance;
+ (id)explicitGroupEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 metadata:(id)a6 options:(unint64_t)a7;
+ (id)frecencyComparator;
+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5;
+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6;
+ (id)groupMemberWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5;
+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3;
+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6;
+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 metadata:(id)a7;
+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8;
+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8 options:(unint64_t)a9;
- (BOOL)_removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 recentsDomain:(id)a5 error:(id *)a6;
- (BOOL)removeRecentContacts:(id)a3 error:(id *)a4;
- (BOOL)removeRecentContactsWithRecentIDs:(id)a3 recentsDomain:(id)a4 error:(id *)a5;
- (CRRecentContactsLibrary)init;
- (id)_newConnection;
- (id)_remoteLibraryWithErrorHandler:(id)a3;
- (id)_removeRecentContactsMatchingQuery:(id)a3;
- (id)_searchRecentsUsingQuery:(id)a3;
- (id)_searchRecentsUsingQuery:(id)a3 error:(id *)a4;
- (id)copyOrderedRecentsForSearchText:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 kinds:(id)a6;
- (id)copyRecentsForDomain:(id)a3;
- (id)restorePreviouslyDeletedRecentContacts:(id)a3;
- (int)_daemonProcessID;
- (unint64_t)maxDateEventsPerRecentContact;
- (void)_recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7 completion:(id)a8;
- (void)_removeAllRecentContactsWithCompletion:(id)a3;
- (void)_searchRecentsUsingQuery:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)performRecentsSearch:(id)a3 operationQueue:(id)a4 completion:(id)a5;
- (void)performRecentsSearch:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5;
- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 completion:(id)a6;
- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7;
- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 userInitiated:(BOOL)a6;
- (void)requestRecentsUsingPredicate:(id)a3 inDomains:(id)a4 comparator:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)start;
@end

@implementation CRRecentContactsLibrary

+ (id)defaultInstance
{
  if (defaultInstance_cn_once_token_1 != -1) {
    dispatch_once(&defaultInstance_cn_once_token_1, &__block_literal_global_3);
  }
  return (id)defaultInstance_cn_once_object_1;
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_77(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[6];
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A7853000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Result for query #%lu received; preparing reply",
      buf,
      0xCu);
  }
  v6 = *(NSObject **)(a1[4] + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_78;
  block[3] = &unk_1E5CFBEA0;
  uint64_t v7 = a1[6];
  block[5] = a1[5];
  block[6] = v7;
  block[4] = a2;
  dispatch_async(v6, block);
}

- (void)performRecentsSearch:(id)a3 queue:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke;
  v5[3] = &unk_1E5CFBF90;
  v5[4] = a4;
  v5[5] = a5;
  [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:a3 completion:v5];
}

- (void)_searchRecentsUsingQuery:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_searchRecentsUsingQuery_completion__cn_once_token_7 != -1) {
    dispatch_once(&_searchRecentsUsingQuery_completion__cn_once_token_7, &__block_literal_global_74);
  }
  uint64_t v7 = [(id)_searchRecentsUsingQuery_completion__cn_once_object_7 nextUnsignedInteger];
  v8 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1A7853000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Will execute query #%lu", buf, 0xCu);
  }
  if (os_variant_has_internal_diagnostics())
  {
    v9 = +[CRLogging client];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [a3 predicate];
      *(_DWORD *)buf = 134218242;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A7853000, (os_log_t)v9, OS_LOG_TYPE_INFO, "Query #%lu predicate: %@", buf, 0x16u);
    }
  }
  id v11 = [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_77;
  v13[3] = &unk_1E5CFBEC8;
  v13[5] = a4;
  v13[6] = v7;
  v13[4] = self;
  [v11 addSuccessBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_80;
  v12[3] = &unk_1E5CFBEF0;
  v12[5] = a4;
  v12[6] = v7;
  v12[4] = self;
  [v11 addFailureBlock:v12];
}

- (id)_searchRecentsUsingQuery:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 uuid];
  id v6 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke;
  v26[3] = &unk_1E5CFBF18;
  v26[4] = v5;
  v26[5] = v6;
  id v7 = [(CRRecentContactsLibrary *)self _remoteLibraryWithErrorHandler:v26];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [a3 weightDecayer];
  uint64_t v10 = [a3 comparator];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F5A538], "defaultProvider"), "timestamp");
  uint64_t v12 = v11;
  v13 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1A7853000, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Will execute query %{public}@", buf, 0xCu);
  }
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_86;
  v19 = &unk_1E5CFBF40;
  v14 = &__block_literal_global_201;
  uint64_t v25 = v12;
  if (v9) {
    v14 = (void *)v9;
  }
  uint64_t v20 = v8;
  uint64_t v21 = v5;
  v23 = v14;
  uint64_t v24 = v10;
  id v22 = v6;
  [v7 searchRecentsUsingQuery:a3 completion:&v16];
  return (id)objc_msgSend(v6, "future", v16, v17, v18, v19);
}

void __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_86(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v17 = a3;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = [v11 weight];
          if (v12)
          {
            (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), [v11 mostRecentDate], v12);
            objc_msgSend(v11, "setDecayedWeight:", objc_msgSend(NSNumber, "numberWithDouble:"));
          }
          objc_msgSend(v6, "cr_insertObject:usingComparator:", v11, *(void *)(a1 + 64));
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
      a3 = v17;
    }
  }
  else
  {
    id v6 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F5A538], "defaultProvider"), "timestamp");
  uint64_t v14 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v13 - *(double *)(a1 + 72)];
  uint64_t v15 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1A7853000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Did execute query %{public}@ (%{public}@)", buf, 0x16u);
  }
  [*(id *)(a1 + 48) finishWithResult:v6 error:a3];
}

- (id)_remoteLibraryWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

CRRecentContactsLibrary *__42__CRRecentContactsLibrary_defaultInstance__block_invoke()
{
  result = objc_alloc_init(CRRecentContactsLibrary);
  defaultInstance_cn_once_object_1 = (uint64_t)result;
  return result;
}

- (CRRecentContactsLibrary)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRRecentContactsLibrary;
  v2 = [(CRRecentContactsLibrary *)&v5 init];
  if (v2)
  {
    v3 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"com.apple.corerecents.%@.%p", objc_opt_class(), v2), "UTF8String"];
    v2->_replyQueue = (OS_dispatch_queue *)dispatch_queue_create(v3, MEMORY[0x1E4F14430]);
    [(CRRecentContactsLibrary *)v2 start];
  }
  return v2;
}

- (void)start
{
  __assert_rtn("-[CRRecentContactsLibrary start]", "CRRecentContactsLibrary.m", 170, "_connection == NULL && \"attempt to start connection multiple times.\"");
}

- (id)_newConnection
{
  id v2 = objc_alloc(MEMORY[0x1E4F29268]);
  return (id)[v2 initWithMachServiceName:@"com.apple.corerecents.recentsd" options:4096];
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_78(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A7853000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Calling completion handler for query #%lu", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v4 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A7853000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Did execute query #%lu", (uint8_t *)&v6, 0xCu);
  }
}

void __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke_2;
    block[3] = &unk_1E5CFBF68;
    uint64_t v5 = *(void *)(a1 + 40);
    block[5] = a3;
    block[6] = v5;
    block[4] = a2;
    dispatch_async(v4, block);
  }
  else
  {
    int v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __65__CRRecentContactsLibrary_performRecentsSearch_queue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F5A338]);
  _searchRecentsUsingQuery_completion__cn_once_object_7 = (uint64_t)result;
  return result;
}

+ (id)_recentEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 weight:(id)a6 metadata:(id)a7 options:(unint64_t)a8
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CRRecentContactsLibrary.m", 63, @"Invalid parameter not satisfying: %@", @"groupMembers");
    if (a5) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CRRecentContactsLibrary.m", 64, @"Invalid parameter not satisfying: %@", @"date");
LABEL_3:
  if (![a3 count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CRRecentContactsLibrary.m", 65, @"Must specify at least one group member per event.");
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", a3, @"members", a5, @"timestamp", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a8), @"options", 0);
  long long v18 = v17;
  if (a4) {
    [v17 setObject:a4 forKey:@"displayName"];
  }
  if (a7) {
    [v18 setObject:a7 forKey:@"metadata"];
  }
  if (a6) {
    [v18 setObject:a6 forKey:@"weight"];
  }
  return v18;
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6
{
  return (id)[a1 recentEventForAddress:a3 displayName:a4 kind:a5 date:a6 weight:0 metadata:0 options:0];
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 metadata:(id)a7
{
  return (id)[a1 recentEventForAddress:a3 displayName:a4 kind:a5 date:a6 weight:0 metadata:a7 options:0];
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8
{
  return (id)[a1 recentEventForAddress:a3 displayName:a4 kind:a5 date:a6 weight:a7 metadata:a8 options:0];
}

+ (id)recentEventForAddress:(id)a3 displayName:(id)a4 kind:(id)a5 date:(id)a6 weight:(id)a7 metadata:(id)a8 options:(unint64_t)a9
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v15 = a4;
    if ([a4 caseInsensitiveCompare:a3]) {
      a4 = v15;
    }
    else {
      a4 = 0;
    }
  }
  v17[0] = [a1 groupMemberWithAddress:a3 displayName:a4 kind:a5];
  return (id)objc_msgSend(a1, "_recentEventForGroupMembers:displayName:date:weight:metadata:options:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1), 0, a6, a7, a8, a9);
}

+ (id)explicitGroupEventForGroupMembers:(id)a3 displayName:(id)a4 date:(id)a5 metadata:(id)a6 options:(unint64_t)a7
{
  return (id)[a1 _recentEventForGroupMembers:a3 displayName:a4 date:a5 weight:0 metadata:a6 options:a7 | 0x100000];
}

+ (id)groupMemberWithAddress:(id)a3 displayName:(id)a4 kind:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CRRecentContactsLibrary.m", 112, @"Invalid parameter not satisfying: %@", @"address");
    if (a5) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CRRecentContactsLibrary.m", 113, @"Invalid parameter not satisfying: %@", @"kind");
LABEL_3:
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:a3 forKeyedSubscript:@"address"];
  [v10 setObject:a5 forKeyedSubscript:@"kind"];
  if (a4) {
    [v10 setObject:a4 forKeyedSubscript:@"displayName"];
  }
  return v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];

  v3.receiver = self;
  v3.super_class = (Class)CRRecentContactsLibrary;
  [(CRRecentContactsLibrary *)&v3 dealloc];
}

- (unint64_t)maxDateEventsPerRecentContact
{
  return 5;
}

void __32__CRRecentContactsLibrary_start__block_invoke()
{
  v0 = +[CRLogging log];
  if (os_log_type_enabled((os_log_t)v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7853000, (os_log_t)v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __32__CRRecentContactsLibrary_start__block_invoke_70(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = +[CRLogging log];
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7853000, (os_log_t)v2, OS_LOG_TYPE_DEFAULT, "Mach service '%{public}@' not found.", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)frecencyComparator
{
  return +[CRSearchQuery frecencyComparator];
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5
{
  return +[CRSearchQuery frecencyComparatorForSearch:a3 preferredKinds:a4 sendingAddress:a5 queryOptions:0];
}

+ (id)rankedFrecencyComparatorWithPreferredSources:(id)a3
{
  return +[CRSearchQuery rankedFrecencyComparatorWithPreferredSources:a3];
}

+ (id)frecencyComparatorForSearch:(id)a3 preferredKinds:(id)a4 sendingAddress:(id)a5 queryOptions:(unint64_t)a6
{
  return +[CRSearchQuery frecencyComparatorForSearch:a3 preferredKinds:a4 sendingAddress:a5 queryOptions:a6];
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_80(void *a1, uint64_t a2)
{
  int v4 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_80_cold_1((uint64_t)a1, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(NSObject **)(a1[4] + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_81;
  block[3] = &unk_1E5CFBEA0;
  uint64_t v12 = a1[6];
  block[5] = a1[5];
  block[6] = v12;
  block[4] = a2;
  dispatch_async(v11, block);
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A7853000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Calling completion handler for query #%lu", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v4 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A7853000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Did execute query #%lu", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_searchRecentsUsingQuery:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend(-[CRRecentContactsLibrary _searchRecentsUsingQuery:](self, "_searchRecentsUsingQuery:", a3), "recover:", &__block_literal_global_197);
  return (id)[v5 resultWithTimeout:a4 error:5.0];
}

uint64_t __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_cold_1(a1, a2, (os_log_t)v4);
  }
  return [*(id *)(a1 + 40) finishWithError:a2];
}

- (void)requestRecentsUsingPredicate:(id)a3 inDomains:(id)a4 comparator:(id)a5 queue:(id)a6 completion:(id)a7
{
  double v13 = objc_alloc_init(CRSearchQuery);
  [(CRSearchQuery *)v13 setPredicate:a3];
  [(CRSearchQuery *)v13 setDomains:a4];
  [(CRSearchQuery *)v13 setComparator:a5];
  [(CRRecentContactsLibrary *)self performRecentsSearch:v13 queue:a6 completion:a7];
}

- (void)performRecentsSearch:(id)a3 operationQueue:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke;
  v5[3] = &unk_1E5CFBF90;
  v5[4] = a4;
  v5[5] = a5;
  [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:a3 completion:v5];
}

uint64_t __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke_2;
    v8[3] = &unk_1E5CFBF68;
    uint64_t v5 = *(void *)(a1 + 40);
    v8[5] = a3;
    v8[6] = v5;
    v8[4] = a2;
    return [v4 addOperationWithBlock:v8];
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

uint64_t __74__CRRecentContactsLibrary_performRecentsSearch_operationQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyOrderedRecentsForSearchText:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 kinds:(id)a6
{
  id v6 = [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:+[CRSearchQuery searchQueryForSearchTerm:a3 preferredKinds:a6 sendingAddress:a5 recentsDomain:a4] error:0];
  return v6;
}

- (id)copyRecentsForDomain:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(CRSearchQuery);
  v7[0] = a3;
  -[CRSearchQuery setDomains:](v5, "setDomains:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
  return [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:v5 error:0];
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  [(CRRecentContactsLibrary *)self recordContactEvents:a3 recentsDomain:a4 sendingAddress:a5 source:v9 userInitiated:0];
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  [(CRRecentContactsLibrary *)self recordContactEvents:a3 recentsDomain:a4 sendingAddress:a5 source:v11 userInitiated:v6];
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7
{
}

- (void)recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 completion:(id)a6
{
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  [(CRRecentContactsLibrary *)self _recordContactEvents:a3 recentsDomain:a4 sendingAddress:a5 source:v11 userInitiated:0 completion:a6];
}

- (void)_recordContactEvents:(id)a3 recentsDomain:(id)a4 sendingAddress:(id)a5 source:(id)a6 userInitiated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v29 = a8;
    id v30 = a4;
    id v31 = a5;
    id v15 = +[CRLogging client];
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [a3 count];
      uint64_t v17 = [a3 count];
      long long v18 = "events";
      if (v17 == 1) {
        long long v18 = "event";
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v40 = v16;
      __int16 v41 = 2080;
      v42 = v18;
      _os_log_impl(&dword_1A7853000, (os_log_t)v15, OS_LOG_TYPE_INFO, "Recording %lu %s", buf, 0x16u);
    }
    id v32 = a6;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v9) {
              goto LABEL_15;
            }
          }
          else
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CRRecentContactsLibrary.m", 472, @"CRRecentContactsLibrary: recent events must be CRRecentEvent instances.");
            if (!v9) {
              goto LABEL_15;
            }
          }
          __int16 v24 = (void *)[v23 objectForKeyedSubscript:@"options"];
          if (v24) {
            objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue") | 1), @"options");
          }
LABEL_15:
          if (os_variant_has_internal_diagnostics())
          {
            uint64_t v25 = +[CRLogging client];
            if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = [(id)objc_opt_class() apiLogDescriptionOfEvent:v23];
              *(_DWORD *)buf = 138412290;
              uint64_t v40 = v26;
              _os_log_impl(&dword_1A7853000, (os_log_t)v25, OS_LOG_TYPE_INFO, "Recording event: %@", buf, 0xCu);
            }
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v27 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v20 = v27;
      }
      while (v27);
    }
    if (v29) {
      uint64_t v28 = v29;
    }
    else {
      uint64_t v28 = &__block_literal_global_98;
    }
    objc_msgSend(-[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", 0), "recordContactEvents:domain:sendingAddress:source:completion:", a3, v30, v31, v32, v28);
  }
}

+ (id)apiLogDescriptionOfEvent:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"members"), "_cn_compactMap:", &__block_literal_global_101);
  return (id)[v3 componentsJoinedByString:@", "];
}

uint64_t __52__CRRecentContactsLibrary_apiLogDescriptionOfEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"displayName"];
  uint64_t v4 = [a2 objectForKeyedSubscript:@"address"];
  return [NSString stringWithFormat:@"%@ <%@>", v3, v4];
}

- (BOOL)_removeRecentContactsWithRecentIDs:(id)a3 syncKeys:(id)a4 recentsDomain:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218242;
    uint64_t v25 = [a3 count];
    __int16 v26 = 2114;
    id v27 = a5;
    _os_log_impl(&dword_1A7853000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Will remove %lu recents from %{public}@ domain", (uint8_t *)&v24, 0x16u);
  }
  if ([a3 count])
  {
    id v12 = [(CRRecentContactsLibrary *)self _remoteLibraryWithErrorHandler:0];
    if (v12)
    {
      [v12 removeRecentContactsWithRecentIDs:a3 syncKeys:a4 domain:a5];
      double v13 = +[CRLogging client];
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A7853000, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Did remove recents", (uint8_t *)&v24, 2u);
      }
      return 1;
    }
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v15 = 9999;
  }
  uint64_t v16 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CRRecentContactsErrorDomain" code:v15 userInfo:0];
  uint64_t v17 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
    -[CRRecentContactsLibrary _removeRecentContactsWithRecentIDs:syncKeys:recentsDomain:error:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  }
  BOOL result = 0;
  if (a6) {
    *a6 = v16;
  }
  return result;
}

- (BOOL)removeRecentContactsWithRecentIDs:(id)a3 recentsDomain:(id)a4 error:(id *)a5
{
  return [(CRRecentContactsLibrary *)self _removeRecentContactsWithRecentIDs:a3 syncKeys:0 recentsDomain:a4 error:a5];
}

- (BOOL)removeRecentContacts:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend(a3, "cr_map:", sCRRecentRecentIdentifier);
  uint64_t v8 = objc_msgSend(a3, "cr_map:", sCRRecentSyncKeyDict);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "firstObject"), "recentsDomain");
  return [(CRRecentContactsLibrary *)self _removeRecentContactsWithRecentIDs:v7 syncKeys:v8 recentsDomain:v9 error:a4];
}

- (void)_removeAllRecentContactsWithCompletion:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  BOOL v6 = (void *)[v5 future];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke;
  v10[3] = &unk_1E5CFBFF8;
  v10[4] = a3;
  [v6 addSuccessBlock:v10];
  uint64_t v7 = (void *)[v5 future];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5CFC020;
  v9[4] = a3;
  [v7 addFailureBlock:v9];
  id v8 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", [v5 errorOnlyCompletionHandlerAdapter]);
  if (v8) {
    objc_msgSend(v8, "removeAllRecentContactsWithCompletion:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter"));
  }
}

uint64_t __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__CRRecentContactsLibrary__removeAllRecentContactsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_removeRecentContactsMatchingQuery:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v6 = -[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", [v5 errorOnlyCompletionHandlerAdapter]);
  id v7 = [(CRRecentContactsLibrary *)self _searchRecentsUsingQuery:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke;
  v10[3] = &unk_1E5CFC090;
  v10[4] = v6;
  void v10[5] = v5;
  [v7 addSuccessBlock:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_4;
  v9[3] = &unk_1E5CFC0B8;
  v9[4] = v5;
  [v7 addFailureBlock:v9];
  return (id)[v5 future];
}

void __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "_cn_groupBy:", &__block_literal_global_112);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_3;
  v4[3] = &unk_1E5CFC068;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = &v5;
  objc_msgSend(v3, "_cn_each:", v4);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v6[3]));
  _Block_object_dispose(&v5, 8);
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recentsDomain];
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_msgSend(a3, "cr_map:", sCRRecentRecentIdentifier);
  objc_msgSend(*(id *)(a1 + 32), "removeRecentContactsWithRecentIDs:syncKeys:domain:", v6, objc_msgSend(a3, "cr_map:", sCRRecentSyncKeyDict), a2);
  uint64_t result = [v6 count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __62__CRRecentContactsLibrary__removeRecentContactsMatchingQuery___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)restorePreviouslyDeletedRecentContacts:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  id v6 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = a3;
    _os_log_impl(&dword_1A7853000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Will restore %lu recents which were previously deleted", (uint8_t *)&v10, 0xCu);
  }
  if ([a3 count])
  {
    objc_msgSend(-[CRRecentContactsLibrary _remoteLibraryWithErrorHandler:](self, "_remoteLibraryWithErrorHandler:", objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter")), "restorePreviouslyDeletedRecentContacts:completion:", a3, objc_msgSend(v5, "completionHandlerAdapter"));
    uint64_t v7 = (void *)[v5 future];
    [v7 addSuccessBlock:&__block_literal_global_116];
    [v7 addFailureBlock:&__block_literal_global_119];
  }
  else
  {
    uint64_t v8 = +[CRLogging client];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A7853000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Did not need to restore 0 recents", (uint8_t *)&v10, 2u);
    }
    return (id)[MEMORY[0x1E4F5A408] futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  return v7;
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke()
{
  v0 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7853000, (os_log_t)v0, OS_LOG_TYPE_DEFAULT, "Did restore recents", v1, 2u);
  }
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_117(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[CRLogging client];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
    __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_117_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (int)_daemonProcessID
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

void __63__CRRecentContactsLibrary__searchRecentsUsingQuery_completion___block_invoke_80_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__CRRecentContactsLibrary__searchRecentsUsingQuery___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A7853000, log, OS_LOG_TYPE_ERROR, "Query %{public}@ failed: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_removeRecentContactsWithRecentIDs:(uint64_t)a3 syncKeys:(uint64_t)a4 recentsDomain:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__CRRecentContactsLibrary_restorePreviouslyDeletedRecentContacts___block_invoke_117_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end