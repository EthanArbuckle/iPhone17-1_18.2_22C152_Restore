@interface CRKConcreteIDSFirewall
+ (id)appleIDFromFirewallEntry:(id)a3;
+ (id)firewallEntryForAppleID:(id)a3;
- (CRKConcreteIDSFirewall)initWithUnderlyingFirewall:(id)a3;
- (IDSFirewall)underlyingFirewall;
- (void)addAllowedAppleIDs:(id)a3 completion:(id)a4;
- (void)fetchAllowedAppleIDsWithCompletion:(id)a3;
- (void)removeAllowedAppleIDs:(id)a3 completion:(id)a4;
@end

@implementation CRKConcreteIDSFirewall

- (CRKConcreteIDSFirewall)initWithUnderlyingFirewall:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSFirewall;
  v6 = [(CRKConcreteIDSFirewall *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingFirewall, a3);
  }

  return v7;
}

- (void)addAllowedAppleIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKConcreteIDSFirewall.m", 42, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  if ([v7 count])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke;
    v16[3] = &unk_2646F3460;
    v16[4] = self;
    objc_super v9 = objc_msgSend(v7, "crk_mapUsingBlock:", v16);
    v10 = [(CRKConcreteIDSFirewall *)self underlyingFirewall];
    v11 = [v9 allObjects];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_2;
    v14[3] = &unk_2646F34B0;
    id v15 = v8;
    [v10 donateEntries:v11 withCompletion:v14];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

id __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() firewallEntryForAppleID:v2];

  return v3;
}

void __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_3;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeAllowedAppleIDs:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKConcreteIDSFirewall.m", 65, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  if ([v7 count])
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke;
    v16[3] = &unk_2646F3460;
    v16[4] = self;
    objc_super v9 = objc_msgSend(v7, "crk_mapUsingBlock:", v16);
    v10 = [(CRKConcreteIDSFirewall *)self underlyingFirewall];
    v11 = [v9 allObjects];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_2;
    v14[3] = &unk_2646F34B0;
    id v15 = v8;
    [v10 removeDonatedEntries:v11 withCompletion:v14];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

id __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() firewallEntryForAppleID:v2];

  return v3;
}

void __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_3;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchAllowedAppleIDsWithCompletion:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    objc_super v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKConcreteIDSFirewall.m", 88, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  v6 = [(CRKConcreteIDSFirewall *)self underlyingFirewall];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke;
  v10[3] = &unk_2646F3548;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  [v6 currentDonatedEntries:v10];
}

void __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_2;
  v11[3] = &unk_2646F3520;
  id v12 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    id v3 = objc_msgSend(*(id *)(a1 + 40), "crk_filterUsingBlock:", &__block_literal_global_3);
    id v4 = (void *)MEMORY[0x263EFFA08];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_4;
    v7[3] = &unk_2646F34F8;
    v7[4] = *(void *)(a1 + 48);
    id v5 = objc_msgSend(v3, "crk_mapUsingBlock:", v7);
    id v6 = [v4 setWithArray:v5];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isDonated];
}

id __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() appleIDFromFirewallEntry:v2];

  return v3;
}

+ (id)firewallEntryForAppleID:(id)a3
{
  id v3 = [MEMORY[0x263F4A0E8] URIWithUnprefixedURI:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F4A048]) initWithURI:v3];

  return v4;
}

+ (id)appleIDFromFirewallEntry:(id)a3
{
  id v3 = [a3 uri];
  id v4 = [v3 unprefixedURI];

  return v4;
}

- (IDSFirewall)underlyingFirewall
{
  return self->_underlyingFirewall;
}

- (void).cxx_destruct
{
}

@end