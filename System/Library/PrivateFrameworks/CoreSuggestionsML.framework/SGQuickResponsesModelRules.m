@interface SGQuickResponsesModelRules
+ (BOOL)areModelsAvailableInLanguage:(id)a3;
+ (id)rules;
@end

@implementation SGQuickResponsesModelRules

+ (BOOL)areModelsAvailableInLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [a1 rules];
  v6 = [v5 objectForKeyedSubscript:@"SGQuickResponses"];
  v7 = [v6 objectForKeyedSubscript:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__SGQuickResponsesModelRules_areModelsAvailableInLanguage___block_invoke;
  v9[3] = &unk_2647EA680;
  v10 = @"SGQRTextMessage";
  v11 = &v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

void __59__SGQuickResponsesModelRules_areModelsAvailableInLanguage___block_invoke(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("+[SGQuickResponsesModelRules areModelsAvailableInLanguage:]_block_invoke", "SGQuickResponsesModel.m", 448, "[objectives isKindOfClass:[NSDictionary class]]");
  }
  v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
  BOOL v9 = [v8 count] != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  *a4 = v9;
}

+ (id)rules
{
  return +[SGModelAsset rules];
}

@end