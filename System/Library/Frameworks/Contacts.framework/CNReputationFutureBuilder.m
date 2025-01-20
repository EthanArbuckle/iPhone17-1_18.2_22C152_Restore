@interface CNReputationFutureBuilder
- (CNFuture)scoreFuture;
- (CNReputationContactsAdapter)contactsAdapter;
- (CNReputationCoreRecentsAdapter)coreRecentsAdapter;
- (CNReputationFutureBuilder)initWithHandle:(id)a3 coreRecentsAdapter:(id)a4 contactsAdapter:(id)a5 logger:(id)a6;
- (CNReputationHandle)handle;
- (CNReputationLogger)logger;
- (id)build;
- (id)contactsTrustForEmailAddress:(id)a3;
- (id)contactsTrustForPhoneNumber:(id)a3;
- (id)coreRecentsTrustForHandle:(id)a3;
- (void)addContactsTrustForEmailAddress;
- (void)addContactsTrustForPhoneNumber;
- (void)addCoreRecentsTrust;
- (void)setScoreFuture:(id)a3;
@end

@implementation CNReputationFutureBuilder

- (CNReputationFutureBuilder)initWithHandle:(id)a3 coreRecentsAdapter:(id)a4 contactsAdapter:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNReputationFutureBuilder;
  v14 = [(CNReputationFutureBuilder *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    handle = v14->_handle;
    v14->_handle = (CNReputationHandle *)v15;

    objc_storeStrong((id *)&v14->_coreRecentsAdapter, a4);
    objc_storeStrong((id *)&v14->_contactsAdapter, a5);
    objc_storeStrong((id *)&v14->_logger, a6);
    v17 = v14;
  }

  return v14;
}

- (void)addCoreRecentsTrust
{
  v3 = [(CNReputationFutureBuilder *)self scoreFuture];

  if (v3)
  {
    v4 = [(CNReputationFutureBuilder *)self scoreFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__CNReputationFutureBuilder_addCoreRecentsTrust__block_invoke;
    v9[3] = &unk_1E56B6660;
    v9[4] = self;
    v5 = [v4 recover:v9];
    [(CNReputationFutureBuilder *)self setScoreFuture:v5];
  }
  else
  {
    id v8 = [(CNReputationFutureBuilder *)self handle];
    v6 = [v8 stringValue];
    v7 = [(CNReputationFutureBuilder *)self coreRecentsTrustForHandle:v6];
    [(CNReputationFutureBuilder *)self setScoreFuture:v7];
  }
}

id __48__CNReputationFutureBuilder_addCoreRecentsTrust__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [v1 handle];
  v3 = [v2 stringValue];
  v4 = [v1 coreRecentsTrustForHandle:v3];

  return v4;
}

- (id)coreRecentsTrustForHandle:(id)a3
{
  id v4 = a3;
  v5 = [(CNReputationFutureBuilder *)self coreRecentsAdapter];

  if (v5)
  {
    v6 = [(CNReputationFutureBuilder *)self coreRecentsAdapter];
    v7 = [v6 recentContactsForHandle:v4];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke;
    v13[3] = &unk_1E56B49B0;
    v13[4] = self;
    [v7 addFailureBlock:v13];
    id v8 = [v7 flatMap:&__block_literal_global_65];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_2;
    v12[3] = &unk_1E56B6688;
    v12[4] = self;
    [v8 addSuccessBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_3;
    v11[3] = &unk_1E56B49B0;
    v11[4] = self;
    [v8 addFailureBlock:v11];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F5A408];
    v7 = +[CNErrorFactory errorWithCode:200 userInfo:0];
    id v8 = [v9 futureWithError:v7];
  }

  return v8;
}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 logger];
  [v4 couldNotQueryCoreRecentsWithError:v3];
}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 coreRecentsConfirmedTrust];
}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 coreRecentsCouldNotConfirmTrust];
}

- (void)addContactsTrustForEmailAddress
{
  id v3 = [(CNReputationFutureBuilder *)self scoreFuture];

  if (v3)
  {
    id v4 = [(CNReputationFutureBuilder *)self scoreFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__CNReputationFutureBuilder_addContactsTrustForEmailAddress__block_invoke;
    v9[3] = &unk_1E56B6660;
    v9[4] = self;
    v5 = [v4 recover:v9];
    [(CNReputationFutureBuilder *)self setScoreFuture:v5];
  }
  else
  {
    id v8 = [(CNReputationFutureBuilder *)self handle];
    v6 = [v8 stringValue];
    v7 = [(CNReputationFutureBuilder *)self contactsTrustForEmailAddress:v6];
    [(CNReputationFutureBuilder *)self setScoreFuture:v7];
  }
}

id __60__CNReputationFutureBuilder_addContactsTrustForEmailAddress__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = [v1 handle];
  id v3 = [v2 stringValue];
  id v4 = [v1 contactsTrustForEmailAddress:v3];

  return v4;
}

- (id)contactsTrustForEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = [(CNReputationFutureBuilder *)self contactsAdapter];

  if (v5)
  {
    v6 = [(CNReputationFutureBuilder *)self contactsAdapter];
    v7 = [v6 contactsForEmailAddress:v4];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke;
    v13[3] = &unk_1E56B49B0;
    v13[4] = self;
    [v7 addFailureBlock:v13];
    id v8 = [v7 flatMap:&__block_literal_global_65];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_2;
    v12[3] = &unk_1E56B6688;
    v12[4] = self;
    [v8 addSuccessBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_3;
    v11[3] = &unk_1E56B49B0;
    v11[4] = self;
    [v8 addFailureBlock:v11];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F5A408];
    v7 = +[CNErrorFactory errorWithCode:200 userInfo:0];
    id v8 = [v9 futureWithError:v7];
  }

  return v8;
}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 logger];
  [v4 couldNotQueryContactsForEmailAddressWithError:v3];
}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 contactsConfirmedTrustOfEmailAddress];
}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 contactsCouldNotConfirmTrustOfEmailAddress];
}

- (void)addContactsTrustForPhoneNumber
{
  id v3 = [(CNReputationFutureBuilder *)self scoreFuture];

  if (v3)
  {
    id v4 = [(CNReputationFutureBuilder *)self scoreFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__CNReputationFutureBuilder_addContactsTrustForPhoneNumber__block_invoke;
    v9[3] = &unk_1E56B6660;
    v9[4] = self;
    v5 = [v4 recover:v9];
    [(CNReputationFutureBuilder *)self setScoreFuture:v5];
  }
  else
  {
    id v8 = [(CNReputationFutureBuilder *)self handle];
    v6 = [v8 stringValue];
    v7 = [(CNReputationFutureBuilder *)self contactsTrustForPhoneNumber:v6];
    [(CNReputationFutureBuilder *)self setScoreFuture:v7];
  }
}

id __59__CNReputationFutureBuilder_addContactsTrustForPhoneNumber__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = [v1 handle];
  id v3 = [v2 stringValue];
  id v4 = [v1 contactsTrustForPhoneNumber:v3];

  return v4;
}

- (id)contactsTrustForPhoneNumber:(id)a3
{
  id v4 = a3;
  v5 = [(CNReputationFutureBuilder *)self contactsAdapter];

  if (v5)
  {
    v6 = [(CNReputationFutureBuilder *)self contactsAdapter];
    v7 = [v6 contactsForPhoneNumber:v4];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke;
    v13[3] = &unk_1E56B49B0;
    v13[4] = self;
    [v7 addFailureBlock:v13];
    id v8 = [v7 flatMap:&__block_literal_global_65];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_2;
    v12[3] = &unk_1E56B6688;
    v12[4] = self;
    [v8 addSuccessBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_3;
    v11[3] = &unk_1E56B49B0;
    v11[4] = self;
    [v8 addFailureBlock:v11];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F5A408];
    v7 = +[CNErrorFactory errorWithCode:200 userInfo:0];
    id v8 = [v9 futureWithError:v7];
  }

  return v8;
}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 logger];
  [v4 couldNotQueryContactsForPhoneNumberWithError:v3];
}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 contactsConfirmedTrustOfPhoneNumber];
}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 contactsCouldNotConfirmTrustOfPhoneNumber];
}

- (id)build
{
  id v3 = [(CNReputationFutureBuilder *)self scoreFuture];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__CNReputationFutureBuilder_build__block_invoke;
  v8[3] = &unk_1E56B3D30;
  v8[4] = self;
  id v4 = [v3 recover:v8];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CNReputationFutureBuilder_build__block_invoke_9;
  v7[3] = &unk_1E56B66B0;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

uint64_t __34__CNReputationFutureBuilder_build__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logger];
  [v1 reputationUnestablished];

  v2 = (void *)MEMORY[0x1E4F5A408];

  return [v2 futureWithResult:&unk_1EE089338];
}

id __34__CNReputationFutureBuilder_build__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CNReputationResult alloc];
  v5 = [*(id *)(a1 + 32) handle];
  if (v3) {
    uint64_t v6 = [v3 integerValue];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [(CNReputationResult *)v4 initWithHandle:v5 score:v6];

  id v8 = [MEMORY[0x1E4F5A408] futureWithResult:v7];

  return v8;
}

- (CNReputationHandle)handle
{
  return self->_handle;
}

- (CNReputationCoreRecentsAdapter)coreRecentsAdapter
{
  return self->_coreRecentsAdapter;
}

- (CNReputationContactsAdapter)contactsAdapter
{
  return self->_contactsAdapter;
}

- (CNReputationLogger)logger
{
  return self->_logger;
}

- (CNFuture)scoreFuture
{
  return self->_scoreFuture;
}

- (void)setScoreFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreFuture, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_contactsAdapter, 0);
  objc_storeStrong((id *)&self->_coreRecentsAdapter, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end