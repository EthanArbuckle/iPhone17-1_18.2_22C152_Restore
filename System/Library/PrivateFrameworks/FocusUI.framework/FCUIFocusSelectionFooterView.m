@interface FCUIFocusSelectionFooterView
@end

@implementation FCUIFocusSelectionFooterView

void __42___FCUIFocusSelectionFooterView__openURL___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x263F3F608];
  v14[0] = *MEMORY[0x263F3F5E8];
  v14[1] = v5;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA88];
  v14[2] = *MEMORY[0x263F3F5C0];
  v15[2] = @"FCUIAppLaunchOriginFocusSelectionViewController";
  v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v11 = 0;
  int v7 = [v2 openSensitiveURL:v4 withOptions:v6 error:&v11];
  id v8 = v11;

  v9 = FCUILogSelection;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *v3;
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_21FEDE000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_ERROR))
  {
    __42___FCUIFocusSelectionFooterView__openURL___block_invoke_cold_1(v3, (uint64_t)v8, v9);
  }
}

void __42___FCUIFocusSelectionFooterView__openURL___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21FEDE000, log, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end