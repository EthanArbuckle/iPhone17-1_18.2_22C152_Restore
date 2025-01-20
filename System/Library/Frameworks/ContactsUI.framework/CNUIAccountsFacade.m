@interface CNUIAccountsFacade
- (ACAccountStore)accountStore;
- (CNUIAccountsFacade)init;
- (CNUIAccountsFacade)initWithAccountStore:(id)a3 requestRunner:(id)a4;
- (CNUIAccountsFacadeRequestRunner)requestRunner;
- (void)fetchiCloudFamilyMembersWithCompletionHandler:(id)a3;
@end

@implementation CNUIAccountsFacade

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRunner, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (CNUIAccountsFacadeRequestRunner)requestRunner
{
  return self->_requestRunner;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)fetchiCloudFamilyMembersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIAccountsFacade *)self accountStore];
  v6 = [(CNUIAccountsFacade *)self requestRunner];
  v7 = objc_msgSend(v5, "aa_primaryAppleAccount");
  if (v7)
  {
    v8 = objc_msgSend(v5, "aa_grandSlamAccountForiCloudAccount:", v7);
    v9 = (void *)[objc_alloc((Class)getAAFamilyDetailsRequestClass[0]()) initWithAppleAccount:v7 grandSlamAccount:v8 accountStore:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E549A440;
    id v11 = v4;
    [v6 performRequest:v9 withHandler:v10];
  }
}

void __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E549AFF8;
  id v12 = v7;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    if (v1)
    {
      v2 = *(void (**)(uint64_t, void))(v1 + 16);
      uint64_t v3 = *(void *)(a1 + 48);
      v2(v3, 0);
    }
  }
  else if (v1)
  {
    id v4 = *(id *)(a1 + 40);
    id v6 = [v4 members];
    v5 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_50638);
    (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v5, 0);
  }
}

id __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[CNUIAAfamilyMember cnuiFamilyMemberWithAAFamilyMember:a2];
}

- (CNUIAccountsFacade)initWithAccountStore:(id)a3 requestRunner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNUIAccountsFacade;
  id v8 = [(CNUIAccountsFacade *)&v14 init];
  if (v8)
  {
    if (v6)
    {
      id v9 = (ACAccountStore *)v6;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F179C8] defaultStore];
    }
    accountStore = v8->_accountStore;
    v8->_accountStore = v9;

    if (v7) {
      id v11 = (CNUIAccountsFacadeRequestRunner *)v7;
    }
    else {
      id v11 = objc_alloc_init(CNUIAccountsFacadeRequestRunner);
    }
    requestRunner = v8->_requestRunner;
    v8->_requestRunner = v11;

    if (LoadAppleAccount_loadPredicate_50642 != -1) {
      dispatch_once(&LoadAppleAccount_loadPredicate_50642, &__block_literal_global_51_50643);
    }
  }

  return v8;
}

- (CNUIAccountsFacade)init
{
  return [(CNUIAccountsFacade *)self initWithAccountStore:0 requestRunner:0];
}

@end