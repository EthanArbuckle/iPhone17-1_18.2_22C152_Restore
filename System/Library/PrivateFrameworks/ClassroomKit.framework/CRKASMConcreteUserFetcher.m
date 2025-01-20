@interface CRKASMConcreteUserFetcher
- (CRKASMConcreteUserFetcher)initWithRosterRequirements:(id)a3;
- (CRKClassKitRosterRequirements)rosterRequirements;
- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation CRKASMConcreteUserFetcher

- (CRKASMConcreteUserFetcher)initWithRosterRequirements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMConcreteUserFetcher;
  v6 = [(CRKASMConcreteUserFetcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rosterRequirements, a3);
  }

  return v7;
}

- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CRKASMConcreteUserFetcher *)self rosterRequirements];
  objc_super v9 = [v8 makeQueryForPersonsWithIdentifiers:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke;
  v12[3] = &unk_2646F3400;
  id v13 = v6;
  id v10 = v6;
  [v9 setCompletion:v12];
  v11 = [(CRKASMConcreteUserFetcher *)self rosterRequirements];
  [v11 executeQuery:v9];
}

void __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_2;
  block[3] = &unk_2646F33D8;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_0, &__block_literal_global_3_0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

CRKASMConcreteUser *__69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CRKASMConcreteUser alloc] initWithBackingPerson:v2];

  return v3;
}

- (CRKClassKitRosterRequirements)rosterRequirements
{
  return self->_rosterRequirements;
}

- (void).cxx_destruct
{
}

@end