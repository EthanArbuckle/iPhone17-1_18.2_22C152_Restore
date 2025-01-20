@interface CNAutocompleteStewieSearch
- (id)executeRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation CNAutocompleteStewieSearch

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v8 = [v7 schedulerProvider];
  v9 = [v8 backgroundScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E63DDA10;
  id v15 = v5;
  id v16 = v6;
  id v10 = v5;
  id v11 = v6;
  v12 = [v9 performCancelableBlock:v14];

  return v12;
}

void __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v3 = [v2 stewie];
  int v4 = [v3 isEmergencyEnabled];

  id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v6 = [v5 stewie];
  int v7 = [v6 isAvocetEnabled];

  if (v4 & 1) != 0 || (v7)
  {
    v9 = CNALoggingContextDebug();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v41 = v10;
      _os_log_impl(&dword_1BEF57000, v9, OS_LOG_TYPE_DEFAULT, "Executing request %p against Stewie contacts", buf, 0xCu);
    }

    id v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = objc_opt_new();
    if (v4)
    {
      v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      v14 = [v13 stewie];
      id v15 = [v14 emergencyTerms];

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_3;
      v38[3] = &unk_1E63DD9E8;
      id v39 = *(id *)(a1 + 32);
      id v16 = objc_msgSend(v15, "_cn_filter:", v38);
      if ([v16 count])
      {
        v35 = +[CNAutocompleteResultValue resultValueWithAddress:@"stewie:emergency:112911" addressType:4];
        v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v17 localizedStringForKey:@"EMERGENCY_SERVICES" value:&stru_1F1A2F2D8 table:@"Localized-Stewie"];
        v18 = v12;
        v19 = v15;
        v20 = v11;
        v22 = uint64_t v21 = a1;
        v23 = +[CNAutocompleteResult contactResultWithDisplayName:v22 value:v35 nameComponents:0 identifier:0];

        a1 = v21;
        id v11 = v20;
        id v15 = v19;
        v12 = v18;

        [v23 setSourceType:512];
        [v18 addObject:v23];
      }
    }
    if (v7)
    {
      v24 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      v25 = [v24 stewie];
      v26 = [v25 avocetTerms];

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_2;
      v36[3] = &unk_1E63DD9E8;
      id v37 = *(id *)(a1 + 32);
      v27 = objc_msgSend(v26, "_cn_filter:", v36);
      if ([v27 count])
      {
        v28 = +[CNAutocompleteResultValue resultValueWithAddress:@"stewie:roadside:0:autocomplete:" addressType:5];
        v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v30 = [v29 localizedStringForKey:@"ROADSIDE_ASSISTANCE" value:&stru_1F1A2F2D8 table:@"Localized-Avocet"];
        v31 = +[CNAutocompleteResult contactResultWithDisplayName:v30 value:v28 nameComponents:0 identifier:0];

        [v31 setSourceType:512];
        [v12 addObject:v31];
      }
    }
    v32 = CNALoggingContextPerformance();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      [v11 timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      v41 = v33;
      __int16 v42 = 2048;
      double v43 = v34 * -1000.0;
      _os_log_impl(&dword_1BEF57000, v32, OS_LOG_TYPE_INFO, "Time to fetch %@ Stewie contacts: %.3fms", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

uint64_t __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 searchString];
  uint64_t v5 = objc_msgSend(v3, "_cn_hasPrefix:", v4);

  return v5;
}

uint64_t __63__CNAutocompleteStewieSearch_executeRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 length];
  uint64_t v5 = [*(id *)(a1 + 32) searchString];
  id v6 = v5;
  if (v4 <= 4)
  {
    uint64_t v7 = [v3 isEqualToString:v5];
LABEL_6:
    uint64_t v9 = v7;

    goto LABEL_7;
  }
  unint64_t v8 = [v5 length];

  if (v8 >= 4)
  {
    id v6 = [*(id *)(a1 + 32) searchString];
    uint64_t v7 = objc_msgSend(v3, "_cn_hasPrefix:", v6);
    goto LABEL_6;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

@end