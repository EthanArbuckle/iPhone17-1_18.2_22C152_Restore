@interface CNUIFMLFacade
- (CNUIFMLFacade)init;
- (CNUIFMLFacade)initWithFMLSession:(id)a3;
- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession;
- (void)fetchFriendHandlesWithCompletionHandler:(id)a3;
@end

@implementation CNUIFMLFacade

- (void).cxx_destruct
{
}

- (_TtC10ContactsUI19FindMyLocateSession)findMyLocateSession
{
  return self->_findMyLocateSession;
}

- (void)fetchFriendHandlesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIFMLFacade *)self findMyLocateSession];
  v6 = dispatch_get_global_queue(21, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E549B710;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E54972A8;
  id v6 = v2;
  v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v2;
  [v3 getAllFriendIdsWithCompletion:v5];
}

void __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E5497280;
  id v11 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v10];
  id v4 = [*(id *)(a1 + 32) allObjects];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E549B710;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __57__CNUIFMLFacade_fetchFriendHandlesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), 0);
  }
  return result;
}

- (CNUIFMLFacade)initWithFMLSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIFMLFacade;
  id v5 = [(CNUIFMLFacade *)&v9 init];
  if (v5)
  {
    if (v4) {
      id v6 = (_TtC10ContactsUI19FindMyLocateSession *)v4;
    }
    else {
      id v6 = objc_alloc_init(_TtC10ContactsUI19FindMyLocateSession);
    }
    findMyLocateSession = v5->_findMyLocateSession;
    v5->_findMyLocateSession = v6;
  }
  return v5;
}

- (CNUIFMLFacade)init
{
  return [(CNUIFMLFacade *)self initWithFMLSession:0];
}

@end