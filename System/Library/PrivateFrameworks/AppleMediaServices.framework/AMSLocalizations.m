@interface AMSLocalizations
+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6;
+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6;
+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6;
+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6;
@end

@implementation AMSLocalizations

+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [a1 localizedStringPromiseForKey:v10 bundle:v11 table:v12 bag:v13];
  id v24 = 0;
  v15 = [v14 resultWithTimeout:&v24 error:3.0];
  id v16 = v24;

  if (!v15)
  {
    v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      uint64_t v21 = AMSLogableError(v16);
      *(_DWORD *)buf = 138544898;
      uint64_t v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      id v30 = v10;
      __int16 v31 = 2114;
      id v32 = v11;
      __int16 v33 = 2114;
      id v34 = v12;
      __int16 v35 = 2114;
      id v36 = v13;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      v22 = (void *)v21;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Localized string not found (key: %{public}@, bundle: %{public}@, table: %{public}@, bag: %{public}@, error: %{public}@)", buf, 0x48u);
    }
  }

  return v15;
}

+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 bag:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6)
  {
    id v12 = [a6 stringForKey:@"language-tag"];
    [v12 valuePromise];
  }
  else
  {
    id v12 = AMSError(7, @"Localizations Failure", @"Bag is missing", 0);
    +[AMSPromise promiseWithError:v12];
  id v13 = };

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke;
  v27[3] = &unk_1E55A3540;
  id v14 = v9;
  id v28 = v14;
  id v15 = v10;
  id v29 = v15;
  id v16 = v11;
  id v30 = v16;
  v17 = [v13 thenWithBlock:v27];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke_2;
  v23[3] = &unk_1E55A3568;
  id v24 = v15;
  id v25 = v14;
  id v26 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  uint64_t v21 = [v17 catchWithBlock:v23];

  return v21;
}

id __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke(void *a1, uint64_t a2)
{
  v2 = +[AMSLocalizations localizedStringForKey:a1[4] bundle:a1[5] table:a1[6] languageCode:a2];
  v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

id __66__AMSLocalizations_localizedStringPromiseForKey_bundle_table_bag___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) localizedStringForKey:*(void *)(a1 + 40) value:0 table:*(void *)(a1 + 48)];
  if (v2)
  {
    v3 = +[AMSPromise promiseWithResult:v2];
  }
  else
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Localized string \"%@\" not found in %@", *(void *)(a1 + 40), *(void *)(a1 + 48)];
    v5 = AMSError(7, @"Localizations Failure", v4, 0);
    v3 = +[AMSPromise promiseWithError:v5];
  }
  return v3;
}

+ (id)localizedStringForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F28B50];
    id v14 = [v10 localizations];
    v22[0] = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v16 = [v13 preferredLocalizationsFromArray:v14 forPreferences:v15];
    v17 = [v16 firstObject];

    id v18 = [v10 localizedStringForKey:v9 value:0 table:v11 localization:v17];

    if (v18 != v9 && v18 != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v20 = [v10 localizedStringForKey:v9 value:0 table:v11];

  id v18 = (id)v20;
LABEL_9:

  return v18;
}

+ (id)localizedStringPromiseForKey:(id)a3 bundle:(id)a4 table:(id)a5 languageCode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [AMSMutableLazyPromise alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__AMSLocalizations_localizedStringPromiseForKey_bundle_table_languageCode___block_invoke;
  v21[3] = &unk_1E55A3590;
  id v25 = v13;
  id v26 = a1;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = [(AMSMutableLazyPromise *)v14 initWithBlock:v21];

  return v19;
}

void __75__AMSLocalizations_localizedStringPromiseForKey_bundle_table_languageCode___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[7];
  v2 = (void *)a1[8];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a2;
  id v8 = [v2 localizedStringForKey:v4 bundle:v5 table:v6 languageCode:v3];
  [v7 finishWithResult:v8];
}

@end