@interface ASTLocalization
+ (id)localizedStringForKey:(id)a3;
+ (void)prepareLocalizedStringsWithCompletionHandler:(id)a3;
@end

@implementation ASTLocalization

+ (void)prepareLocalizedStringsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  id v9 = 0;
  if (ASTStringsTable)
  {
    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke;
    v5[3] = &unk_264E7DCC8;
    v7 = v8;
    id v6 = v3;
    +[ASTSession requestAsset:@"strings" serverURL:0 endpoint:@"localized" completionHandler:v5];
  }
  _Block_object_dispose(v8, 8);
}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = +[ASTEncodingUtilities parseJSONResponseWithData:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  id v9 = (void *)ASTStringsTable;
  ASTStringsTable = v8;

  if (!ASTStringsTable)
  {
    v10 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_2();
    }
LABEL_7:
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  if (!ASTStringsTable
    || ([(id)ASTStringsTable objectForKeyedSubscript:v3],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = v3;
  }

  return v4;
}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x263EF8340]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_23CA80000, v1, OS_LOG_TYPE_ERROR, "Strings table could not be downloaded: %@", (uint8_t *)&v2, 0xCu);
}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x263EF8340]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_23CA80000, v1, OS_LOG_TYPE_ERROR, "Strings table could not be parsed: %@", (uint8_t *)&v2, 0xCu);
}

@end