@interface AAAuthenticationErrorHandler
+ (void)handleAuthenticationError:(id)a3 resetAuthenticatedOnAlertFailure:(BOOL)a4 forAccount:(id)a5 inStore:(id)a6 completion:(id)a7;
@end

@implementation AAAuthenticationErrorHandler

+ (void)handleAuthenticationError:(id)a3 resetAuthenticatedOnAlertFailure:(BOOL)a4 forAccount:(id)a5 inStore:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, uint64_t, id))a7;
  if (objc_msgSend(v11, "ak_isUserCancelError"))
  {
    if (v14) {
      v14[2](v14, 1, v11);
    }
  }
  else if (v10)
  {
    [v12 setAuthenticated:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __121__AAAuthenticationErrorHandler_handleAuthenticationError_resetAuthenticatedOnAlertFailure_forAccount_inStore_completion___block_invoke;
    v15[3] = &unk_1E5A49E30;
    v16 = v14;
    [v13 saveAccount:v12 withHandler:v15];
  }
  else if (v14)
  {
    v14[2](v14, 2, v11);
  }
}

uint64_t __121__AAAuthenticationErrorHandler_handleAuthenticationError_resetAuthenticatedOnAlertFailure_forAccount_inStore_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

@end