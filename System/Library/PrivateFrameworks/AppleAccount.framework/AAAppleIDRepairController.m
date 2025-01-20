@interface AAAppleIDRepairController
- (AAAppleIDRepairController)init;
- (ACAccount)primaryAccount;
- (BOOL)offline_primaryAppleIDNeedsRepair;
- (unint64_t)_fetchRepairState;
- (void)_forceFetchUpdatedUserInformationWithCompletion:(id)a3;
- (void)primaryAppleIDRepairNeedsRepairCompletion:(id)a3;
- (void)setPrimaryAccount:(id)a3;
@end

@implementation AAAppleIDRepairController

- (AAAppleIDRepairController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAAppleIDRepairController;
  v2 = [(AAAppleIDRepairController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F179C8] defaultStore];
    v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
    [(AAAppleIDRepairController *)v2 setPrimaryAccount:v4];
  }
  return v2;
}

- (BOOL)offline_primaryAppleIDNeedsRepair
{
  v3 = [(AAAppleIDRepairController *)self primaryAccount];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(AAAppleIDRepairController *)self _fetchRepairState];
  return (v4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v4 == 3;
}

- (void)primaryAppleIDRepairNeedsRepairCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__AAAppleIDRepairController_primaryAppleIDRepairNeedsRepairCompletion___block_invoke;
  v9[3] = &unk_1E5A4A088;
  id v5 = v4;
  id v10 = v5;
  objc_super v6 = (void (**)(void, void))MEMORY[0x1A622F430](v9);
  v7 = [(AAAppleIDRepairController *)self primaryAccount];

  if (v7)
  {
    unint64_t v8 = [(AAAppleIDRepairController *)self _fetchRepairState];
    if (v8) {
      v6[2](v6, v8);
    }
    else {
      [(AAAppleIDRepairController *)self _forceFetchUpdatedUserInformationWithCompletion:v6];
    }
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

uint64_t __71__AAAppleIDRepairController_primaryAppleIDRepairNeedsRepairCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithUnsignedInteger:a2];
    int v7 = 138412290;
    unint64_t v8 = v5;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Final repair state %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a2 & 0xFFFFFFFFFFFFFFFELL) == 2);
  }
  return result;
}

- (unint64_t)_fetchRepairState
{
  v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v4 = [(AAAppleIDRepairController *)self primaryAccount];
  id v5 = objc_msgSend(v4, "aa_altDSID");
  objc_super v6 = [v3 authKitAccountWithAltDSID:v5];

  int v7 = [MEMORY[0x1E4F4EF40] sharedInstance];
  unint64_t v8 = [v7 repairStateForAccount:v6];

  return v8;
}

- (void)_forceFetchUpdatedUserInformationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_super v6 = [(AAAppleIDRepairController *)self primaryAccount];
  int v7 = objc_msgSend(v6, "aa_altDSID");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke;
  v9[3] = &unk_1E5A4A0B0;
  id v10 = v4;
  id v8 = v4;
  [v5 getUserInformationForAltDSID:v7 completion:v9];
}

void __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _AALogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "repairState"));
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "User information returned state: %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    [v5 repairState];
    uint64_t v9 = *(void (**)(void))(v11 + 16);
  }
  v9();
}

- (ACAccount)primaryAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrimaryAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

void __77__AAAppleIDRepairController__forceFetchUpdatedUserInformationWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Error fetching user information: %@", (uint8_t *)&v2, 0xCu);
}

@end