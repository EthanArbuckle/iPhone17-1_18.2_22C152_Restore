@interface LNCATDialog(CATSupport)
- (void)getResultWithCompletionHandler:()CATSupport;
@end

@implementation LNCATDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"LNCATDialog+CATSupport.m", 25, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v6 = [a1 parameters];
  v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_4874);

  v25 = @"locale";
  v8 = [a1 localeIdentifier];
  v26[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  v10 = [a1 templateDirectoryURL];
  [v10 startAccessingSecurityScopedResource];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v11 = (void *)getCATClass_softClass_4876;
  uint64_t v24 = getCATClass_softClass_4876;
  if (!getCATClass_softClass_4876)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getCATClass_block_invoke_4877;
    v20[3] = &unk_1E5B39E50;
    v20[4] = &v21;
    __getCATClass_block_invoke_4877((uint64_t)v20);
    v11 = (void *)v22[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v21, 8);
  v13 = [a1 templateDirectoryURL];
  v14 = [a1 identifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__LNCATDialog_CATSupport__getResultWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E5B38ED0;
  v18[4] = a1;
  id v19 = v5;
  id v15 = v5;
  LODWORD(v17) = 0;
  [v12 execute:0 templateDir:v13 catId:v14 parameters:v7 globals:v9 callback:0 options:v17 completion:v18];
}

@end