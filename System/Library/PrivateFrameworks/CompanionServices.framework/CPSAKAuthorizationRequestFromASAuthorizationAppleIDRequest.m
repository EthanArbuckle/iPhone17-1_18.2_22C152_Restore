@interface CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest
@end

@implementation CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest

id ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v3 = (void *)getASAuthorizationScopeEmailSymbolLoc_ptr;
  uint64_t v14 = getASAuthorizationScopeEmailSymbolLoc_ptr;
  if (!getASAuthorizationScopeEmailSymbolLoc_ptr)
  {
    v4 = (void *)AuthenticationServicesLibrary();
    v12[3] = (uint64_t)dlsym(v4, "ASAuthorizationScopeEmail");
    getASAuthorizationScopeEmailSymbolLoc_ptr = v12[3];
    v3 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
  {
    ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
    goto LABEL_17;
  }
  if ([v2 isEqualToString:*v3])
  {
    v5 = (id *)MEMORY[0x263F29018];
LABEL_11:
    id v8 = *v5;
    goto LABEL_13;
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v6 = (void *)getASAuthorizationScopeFullNameSymbolLoc_ptr;
  uint64_t v14 = getASAuthorizationScopeFullNameSymbolLoc_ptr;
  if (!getASAuthorizationScopeFullNameSymbolLoc_ptr)
  {
    v7 = (void *)AuthenticationServicesLibrary();
    v12[3] = (uint64_t)dlsym(v7, "ASAuthorizationScopeFullName");
    getASAuthorizationScopeFullNameSymbolLoc_ptr = v12[3];
    v6 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
LABEL_17:
    v10 = (_Unwind_Exception *)___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  if ([v2 isEqualToString:*v6])
  {
    v5 = (id *)MEMORY[0x263F29020];
    goto LABEL_11;
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

uint64_t ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getASAuthorizationPasswordRequestClass_block_invoke_cold_1(v0);
}

@end