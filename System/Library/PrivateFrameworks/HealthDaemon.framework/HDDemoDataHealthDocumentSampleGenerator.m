@interface HDDemoDataHealthDocumentSampleGenerator
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
@end

@implementation HDDemoDataHealthDocumentSampleGenerator

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataHealthDocumentSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v27 generateFirstRunObjectsForDemoPerson:a3 firstDate:v8 objectCollection:v9];
  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v11 = [v10 BOOLForKey:@"HealthDemoDataGenerateHealthDocumentsKey"];

  if (v11)
  {
    _HKInitializeLogging();
    v12 = (os_log_t *)MEMORY[0x1E4F29F30];
    v13 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Generating demo CDA documents for date: %@", buf, 0xCu);
    }
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 URLForResource:@"demo_cdas" withExtension:@"zip"];
    v16 = [v15 path];
    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F2B9C8]) initWithPathname:v16];
      id v26 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __107__HDDemoDataHealthDocumentSampleGenerator_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection___block_invoke;
      v23[3] = &unk_1E6301B18;
      id v24 = v8;
      id v25 = v9;
      char v18 = [v17 enumerateEntriesWithError:&v26 block:v23];
      id v19 = v26;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        v20 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v17;
          __int16 v30 = 2112;
          id v31 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Error enumerating contents of %@: %@", buf, 0x16u);
        }
      }
      _HKInitializeLogging();
      v21 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Generation of demo CDA documents completed", buf, 2u);
      }
    }
    else
    {
      _HKInitializeLogging();
      v22 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "Could not locate zip file containing CDA demo documents; aborting generation",
          buf,
          2u);
      }
    }
  }
}

void __107__HDDemoDataHealthDocumentSampleGenerator_generateFirstRunObjectsForDemoPerson_firstDate_objectCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 pathname];
  v5 = [v4 lowercaseString];
  int v6 = [v5 hasSuffix:@".xml"];

  if (v6)
  {
    v7 = [v3 dataWithMaxSizeBytes:100000 error:0];
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = 0;
      id v9 = [MEMORY[0x1E4F2AC90] CDADocumentSampleWithData:v7 startDate:v8 endDate:v8 metadata:0 validationError:&v11];
      id v10 = v11;
      [*(id *)(a1 + 40) addObjectFromPhone:v9];
    }
  }
}

@end