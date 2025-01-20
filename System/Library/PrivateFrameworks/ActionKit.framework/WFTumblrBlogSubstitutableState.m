@interface WFTumblrBlogSubstitutableState
+ (Class)processingValueClass;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFTumblrBlogSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v11[3] = &unk_264E5B5E8;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)WFTumblrBlogSubstitutableState;
  id v9 = v8;
  [(WFVariableSubstitutableParameterState *)&v10 processWithContext:a3 userInputRequiredHandler:a4 valueHandler:v11];
}

void __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = +[WFDiskCache workflowCache];
  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  objc_super v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
  v16[3] = &unk_264E5B320;
  id v17 = v5;
  id v13 = *(id *)(a1 + 32);
  id v18 = v6;
  id v19 = v13;
  id v14 = v6;
  id v15 = v5;
  [v7 objectOfClasses:v10 forKey:v12 completion:v16];
}

void __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:a1[4]];
  uint64_t v4 = a1[6];
  id v6 = (id)v3;
  if (v3)
  {
    id v5 = [NSURL URLWithString:v3];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, a1[5]);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, a1[5]);
  }
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end