void objc_release(id a1)
{
  MEMORY[0x270F9A750](a1);
}

thIdentifier:(id)a3;
- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8;
- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6;
- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5;
@end

@implementation YelpAccessPlugin

+ (BOOL)supportsAccountTypeWithIdentifier:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_isEqualToString_, *MEMORY[0x263EFAFF0]);
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  id v13 = a4;
  v9 = (void (**)(id, uint64_t, void))a8;
  if (objc_msgSend_hasEntitlement_(v13, v10, *MEMORY[0x263EFB330])) {
    uint64_t hasEntitlement = 1;
  }
  else {
    uint64_t hasEntitlement = objc_msgSend_hasEntitlement_(v13, v11, *MEMORY[0x263EFB2B0]);
  }
  v9[2](v9, hasEntitlement, 0);
}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  uint64_t v7 = *MEMORY[0x263EFB330];
  v10 = (void (**)(id, uint64_t, void))a6;
  uint64_t hasEntitlement = objc_msgSend_hasEntitlement_(a4, v8, v7);
  v10[2](v10, hasEntitlement, 0);
}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  uint64_t v7 = *MEMORY[0x263EFB330];
  v10 = (void (**)(id, uint64_t, void))a6;
  uint64_t hasEntitlement = objc_msgSend_hasEntitlement_(a4, v8, v7);
  v10[2](v10, hasEntitlement, 0);
}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
}

@end