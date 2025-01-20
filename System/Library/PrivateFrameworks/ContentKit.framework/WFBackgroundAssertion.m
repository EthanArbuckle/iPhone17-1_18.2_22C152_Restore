@interface WFBackgroundAssertion
+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4;
@end

@implementation WFBackgroundAssertion

+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = getWFBackgroundAssertionLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[WFBackgroundAssertion backgroundAssertionWithName:expirationHandler:]";
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_INFO, "%s Starting background assertion for %{public}@", buf, 0x16u);
  }

  v8 = objc_opt_class();
  v9 = +[WFApplicationContext sharedContext];
  uint64_t v10 = [v9 applicationOrNil];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = +[WFApplicationContext sharedContext];
    uint64_t v13 = [v12 applicationState];

    if (v13 != 2) {
      v8 = objc_opt_class();
    }
  }
  else
  {
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__WFBackgroundAssertion_backgroundAssertionWithName_expirationHandler___block_invoke;
  v18[3] = &unk_264288800;
  id v19 = v5;
  id v20 = v6;
  id v14 = v6;
  id v15 = v5;
  v16 = [v8 backgroundAssertionWithName:v15 expirationHandler:v18];

  return v16;
}

uint64_t __71__WFBackgroundAssertion_backgroundAssertionWithName_expirationHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = getWFBackgroundAssertionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "+[WFBackgroundAssertion backgroundAssertionWithName:expirationHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_216505000, v2, OS_LOG_TYPE_INFO, "%s Background assertion expired for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end