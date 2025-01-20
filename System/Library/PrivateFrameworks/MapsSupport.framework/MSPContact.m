@interface MSPContact
+ (id)properties;
+ (id)shortName:(id)a3;
+ (void)contactWithAccountIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MSPContact

+ (id)properties
{
  if (qword_1EB7F45E8 != -1) {
    dispatch_once(&qword_1EB7F45E8, &__block_literal_global_9);
  }
  v2 = (void *)_MergedGlobals_42;

  return v2;
}

void __24__MSPContact_properties__block_invoke()
{
  v10[14] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v1 = *MEMORY[0x1E4F1AEB0];
  v10[0] = v0;
  v10[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AEA0];
  v10[2] = *MEMORY[0x1E4F1ADF0];
  v10[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEB8];
  v10[4] = *MEMORY[0x1E4F1ADE0];
  v10[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEF8];
  v10[6] = *MEMORY[0x1E4F1AEC0];
  v10[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEF0];
  v10[8] = *MEMORY[0x1E4F1AF00];
  v10[9] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADC8];
  v10[10] = *MEMORY[0x1E4F1AED8];
  v10[11] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AFA8];
  v10[12] = *MEMORY[0x1E4F1AEE0];
  v10[13] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
  v9 = (void *)_MergedGlobals_42;
  _MergedGlobals_42 = v8;
}

+ (void)contactWithAccountIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v9 = objc_alloc(MEMORY[0x1E4F1B908]);
  v10 = +[MSPContact properties];
  v11 = (void *)[v9 initWithKeysToFetch:v10];

  [v11 setSortOrder:1];
  int v12 = [v6 containsString:@"@"];
  v13 = (void *)MEMORY[0x1E4F1B8F8];
  if (v12)
  {
    v14 = [MEMORY[0x1E4F1B8F8] predicateForContactMatchingEmailAddress:v6];
    [v11 setPredicate:v14];
  }
  else
  {
    v14 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v6];
    v15 = [v13 predicateForContactsMatchingPhoneNumber:v14];
    [v11 setPredicate:v15];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__MSPContact_contactWithAccountIdentifier_completion___block_invoke;
  v22[3] = &unk_1E617C880;
  v22[4] = &v24;
  id v23 = 0;
  [v8 enumerateContactsWithFetchRequest:v11 error:&v23 usingBlock:v22];
  id v16 = v23;
  if (v16)
  {
    v17 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v16;
      _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_ERROR, "error resolving contact: %@", buf, 0xCu);
    }
  }
  if (v7)
  {
    v18 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)v25[5];
      *(_DWORD *)buf = 138412290;
      id v31 = v19;
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, "contactWithAddress contact %@", buf, 0xCu);
    }

    v20 = [a1 shortName:v25[5]];
    v21 = [(id)v25[5] identifier];
    v7[2](v7, v20, v21);
  }
  _Block_object_dispose(&v24, 8);
}

void __54__MSPContact_contactWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
    *a3 = 1;
  }
}

+ (id)shortName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1B910] stringFromContact:a3 style:1000];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

@end