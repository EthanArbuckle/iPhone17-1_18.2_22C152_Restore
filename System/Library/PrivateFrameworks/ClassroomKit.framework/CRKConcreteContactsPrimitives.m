@interface CRKConcreteContactsPrimitives
- (CNContactStore)contactStore;
- (CRKConcreteContactsPrimitives)init;
- (CRKConcreteContactsPrimitives)initWithContactStore:(id)a3;
- (id)fetchMeCardContactWithError:(id *)a3;
- (id)subscribeToContactsChanges:(id)a3;
@end

@implementation CRKConcreteContactsPrimitives

- (CRKConcreteContactsPrimitives)init
{
  v3 = objc_opt_new();
  v4 = [(CRKConcreteContactsPrimitives *)self initWithContactStore:v3];

  return v4;
}

- (CRKConcreteContactsPrimitives)initWithContactStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteContactsPrimitives;
  v6 = [(CRKConcreteContactsPrimitives *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactStore, a3);
  }

  return v7;
}

- (id)fetchMeCardContactWithError:(id *)a3
{
  v12[7] = *MEMORY[0x263EF8340];
  v4 = [(CRKConcreteContactsPrimitives *)self contactStore];
  uint64_t v5 = *MEMORY[0x263EFDFC8];
  v12[0] = *MEMORY[0x263EFDFE0];
  v12[1] = v5;
  uint64_t v6 = *MEMORY[0x263EFE088];
  v12[2] = *MEMORY[0x263EFDFB8];
  v12[3] = v6;
  uint64_t v7 = *MEMORY[0x263EFE050];
  v12[4] = *MEMORY[0x263EFE080];
  v12[5] = v7;
  v12[6] = *MEMORY[0x263EFE140];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:7];
  objc_super v9 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v8 error:a3];

  if (v9) {
    v10 = [[CRKConcreteContact alloc] initWithContact:v9];
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (id)subscribeToContactsChanges:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = *MEMORY[0x263EFE118];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__CRKConcreteContactsPrimitives_subscribeToContactsChanges___block_invoke;
  v9[3] = &unk_2646F36B0;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = [v4 subscribeToNotificationWithName:v5 object:0 handler:v9];

  return v7;
}

uint64_t __60__CRKConcreteContactsPrimitives_subscribeToContactsChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end