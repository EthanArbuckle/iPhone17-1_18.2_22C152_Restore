@interface FAFamilyCircleChangeHandler
+ (void)_refetchFamilyWithContext:(id)a3 completion:(id)a4;
+ (void)handleDidRepairFamilyWithCompletion:(id)a3;
+ (void)handleDidSetupFamilyWithCompletion:(id)a3;
+ (void)handleURLResponse:(id)a3;
@end

@implementation FAFamilyCircleChangeHandler

+ (void)handleURLResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v11 = 138412546;
    v12 = v7;
    __int16 v13 = 2080;
    v14 = "+[FAFamilyCircleChangeHandler handleURLResponse:]";
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v11, 0x16u);
  }
  v8 = [v4 allHeaderFields];

  v9 = [v8 objectForKey:@"X-Apple-Family-Changed"];

  if (v9)
  {
    v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D252C000, v10, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate - Family state has changed", (uint8_t *)&v11, 2u);
    }

    [a1 _refetchFamilyWithContext:@"family_changed_header" completion:&__block_literal_global_1];
  }
}

+ (void)handleDidRepairFamilyWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 2080;
    int v11 = "+[FAFamilyCircleChangeHandler handleDidRepairFamilyWithCompletion:]";
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  [a1 _refetchFamilyWithContext:@"family_repair" completion:v4];
}

+ (void)handleDidSetupFamilyWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 2080;
    int v11 = "+[FAFamilyCircleChangeHandler handleDidSetupFamilyWithCompletion:]";
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }
  [a1 _refetchFamilyWithContext:@"family_setup" completion:v4];
}

+ (void)_refetchFamilyWithContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2080;
    v20 = "+[FAFamilyCircleChangeHandler _refetchFamilyWithContext:completion:]";
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "%@ %s: force fetching family changes", buf, 0x16u);
  }
  __int16 v10 = objc_alloc_init(FAFetchFamilyCircleRequest);
  [(FAFetchFamilyCircleRequest *)v10 setCachePolicy:1000];
  [(FAFetchFamilyCircleRequest *)v10 setContext:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__FAFamilyCircleChangeHandler__refetchFamilyWithContext_completion___block_invoke;
  v15[3] = &unk_1E6924DE0;
  id v16 = v5;
  id v11 = v5;
  [(FAFetchFamilyCircleRequest *)v10 startRequestWithCompletionHandler:v15];
  uint64_t v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    __int16 v19 = 2080;
    v20 = "+[FAFamilyCircleChangeHandler _refetchFamilyWithContext:completion:]";
    _os_log_impl(&dword_1D252C000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s done", buf, 0x16u);
  }
}

uint64_t __68__FAFamilyCircleChangeHandler__refetchFamilyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end