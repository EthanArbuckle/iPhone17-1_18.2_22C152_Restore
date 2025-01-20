@interface MADManagedSpotlightEntry
+ (BOOL)deleteEntryWithUniqueIdentifier:(id)a3 error:(id *)a4;
+ (id)entryWithURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 mediaType:(unint64_t)a8 error:(id *)a9;
+ (id)fetchEntriesWithMediaType:(unint64_t)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
+ (id)fetchEntryWithUniqueIdentifier:(id)a3 error:(id *)a4;
+ (unint64_t)countForMediaType:(unint64_t)a3 error:(id *)a4;
- (id)description;
@end

@implementation MADManagedSpotlightEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = [(MADManagedSpotlightEntry *)self url];
  [v3 appendFormat:@"url: %@, ", v6];

  v7 = [(MADManagedSpotlightEntry *)self uniqueIdentifier];
  [v3 appendFormat:@"uniqueIdentifier: %@, ", v7];

  v8 = [(MADManagedSpotlightEntry *)self bundleIdentifier];
  [v3 appendFormat:@"bundleIdentifier: %@, ", v8];

  v9 = [(MADManagedSpotlightEntry *)self typeIdentifier];
  [v3 appendFormat:@"typeIdentifier: %@, ", v9];

  v10 = [(MADManagedSpotlightEntry *)self sandboxToken];
  [v3 appendFormat:@"sandboxToken: %@, ", v10];

  [v3 appendFormat:@"mediaType: %d, ", -[MADManagedSpotlightEntry mediaType](self, "mediaType")];
  [v3 appendFormat:@"attemptCount: %d, ", -[MADManagedSpotlightEntry attemptCount](self, "attemptCount")];
  v11 = [(MADManagedSpotlightEntry *)self nextAttemptDate];
  [v3 appendFormat:@"nextAttemptDate: %@, ", v11];

  objc_msgSend(v3, "appendFormat:", @"status: %d>", -[MADManagedSpotlightEntry status](self, "status"));
  return v3;
}

+ (id)entryWithURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 mediaType:(unint64_t)a8 error:(id *)a9
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v15 = a4;
  id v40 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = +[MADSystemDataStore systemDataStore];
  id v43 = 0;
  v19 = [a1 fetchEntryWithUniqueIdentifier:v15 error:&v43];
  id v20 = v43;
  if (v20)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a9;
        *(_DWORD *)buf = 138412290;
        id v45 = v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
      }
    }
    v23 = 0;
    if (a9) {
      *a9 = (id)[v20 copy];
    }
    goto LABEL_37;
  }
  if (!v19)
  {
    v25 = [MADManagedSpotlightEntry alloc];
    v26 = [v18 managedObjectContext];
    v27 = [(MADManagedSpotlightEntry *)v25 initWithContext:v26];

    [(MADManagedSpotlightEntry *)v27 setUrl:v39];
    [(MADManagedSpotlightEntry *)v27 setUniqueIdentifier:v15];
    [(MADManagedSpotlightEntry *)v27 setBundleIdentifier:v40];
    [(MADManagedSpotlightEntry *)v27 setTypeIdentifier:v16];
    [(MADManagedSpotlightEntry *)v27 setSandboxToken:v17];
    [(MADManagedSpotlightEntry *)v27 setMediaType:a8];
    [(MADManagedSpotlightEntry *)v27 setStatus:0];
    [(MADManagedSpotlightEntry *)v27 setAttemptCount:0];
    v28 = [MEMORY[0x1E4F1C9C8] now];
    [(MADManagedSpotlightEntry *)v27 setNextAttemptDate:v28];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v45 = v15;
        __int16 v46 = 2112;
        id v47 = v40;
        __int16 v48 = 2112;
        id v49 = v16;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "[MADSystemDataStore][%@] Registering new asset - %@ %@", buf, 0x20u);
      }
    }
    id v42 = 0;
    char v30 = [v18 commitChangesOrRollbackAndResetContext:&v42];
    id v31 = v42;
    id v20 = v31;
    if (v30)
    {
      id v41 = v31;
      v32 = [a1 fetchEntryWithUniqueIdentifier:v15 error:&v41];
      id v33 = v41;

      v27 = v32;
      id v20 = v33;
      if (!a9 || !v33)
      {
        v27 = v32;
        v23 = v27;
        goto LABEL_36;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = *a9;
          *(_DWORD *)buf = 138412290;
          id v45 = v35;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
        }
      }
      id v36 = (id)[v33 copy];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v37 = VCPLogInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v20;
          _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to register asset (%@)", buf, 0xCu);
        }
      }
      if (!a9)
      {
        v23 = 0;
        goto LABEL_36;
      }
      id v36 = (id)[v20 copy];
    }
    v23 = 0;
    *a9 = v36;
LABEL_36:

    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v24 = VCPLogInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v45 = v15;
      __int16 v46 = 2112;
      id v47 = v40;
      __int16 v48 = 2112;
      id v49 = v16;
      _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "[MADSystemDataStore][%@] Returning existing entry - %@ %@", buf, 0x20u);
    }
  }
  v23 = v19;
  id v20 = 0;
LABEL_37:

  return v23;
}

+ (id)fetchEntriesWithMediaType:(unint64_t)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v8 = +[MADSystemDataStore systemDataStore];
  v9 = +[MADManagedSpotlightEntry fetchRequest];
  v10 = (void *)MEMORY[0x1E4F28F60];
  v11 = [MEMORY[0x1E4F1C9C8] now];
  v12 = [v10 predicateWithFormat:@"(mediaType==%d) AND (nextAttemptDate<=%@)", a3, v11];
  [v9 setPredicate:v12];

  if (a4) {
    [v9 setFetchLimit:a4];
  }
  v13 = [v8 managedObjectContext];
  id v18 = 0;
  v14 = [v13 executeFetchRequest:v9 error:&v18];
  id v15 = v18;

  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v15;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch asset (%@)", buf, 0xCu);
      }
    }
    if (a5) {
      *a5 = (id)[v15 copy];
    }
  }

  return v14;
}

+ (id)fetchEntryWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  *(void *)&v28[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v28 = v5;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Querying with uniqueIdentifier:%@", buf, 0xCu);
    }
  }
  v7 = +[MADSystemDataStore systemDataStore];
  v8 = +[MADManagedSpotlightEntry fetchRequest];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uniqueIdentifier==%@", v5];
  [v8 setPredicate:v9];

  v10 = [v7 managedObjectContext];
  id v24 = 0;
  v11 = [v10 executeFetchRequest:v8 error:&v24];
  id v12 = v24;

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [v11 count];
      id v15 = [v11 firstObject];
      *(_DWORD *)buf = 67109378;
      v28[0] = v14;
      LOWORD(v28[1]) = 2112;
      *(void *)((char *)&v28[1] + 2) = v15;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "[MADSystemDataStore] Query returns %d results ... firstObject:%@", buf, 0x12u);
    }
  }
  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v28 = v12;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch asset (%@)", buf, 0xCu);
      }
    }
    if (a4)
    {
      id v17 = 0;
      *a4 = (id)[v12 copy];
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"[MADSystemDataStore] Fetch %lu assets (expected 1)", objc_msgSend(v11, "count"));
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v28 = v18;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    if (a4)
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v21 = [NSString stringWithFormat:@"%@", v18];
      v26 = v21;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      *a4 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v22];
    }
LABEL_24:
    id v17 = 0;
    goto LABEL_26;
  }
  id v17 = [v11 firstObject];
LABEL_26:

  return v17;
}

+ (BOOL)deleteEntryWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MADSystemDataStore systemDataStore];
  v7 = +[MADManagedSpotlightEntry fetchRequest];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uniqueIdentifier==%@", v5];
  [v7 setPredicate:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  v10 = [v6 managedObjectContext];
  id v15 = 0;
  id v11 = (id)[v10 executeRequest:v9 error:&v15];
  id v12 = v15;

  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to remove entry (%@)", buf, 0xCu);
      }
    }
    if (a4) {
      *a4 = (id)[v12 copy];
    }
  }

  return v12 == 0;
}

+ (unint64_t)countForMediaType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = +[MADSystemDataStore systemDataStore];
  v7 = +[MADManagedSpotlightEntry fetchRequest];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [MEMORY[0x1E4F1C9C8] now];
  v10 = [v8 predicateWithFormat:@"(mediaType==%d) AND (nextAttemptDate<=%@)", a3, v9];
  [v7 setPredicate:v10];

  id v11 = [v6 managedObjectContext];
  id v16 = 0;
  unint64_t v12 = [v11 countForFetchRequest:v7 error:&v16];
  id v13 = v16;

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch count (%@)", buf, 0xCu);
      }
    }
    if (a4) {
      *a4 = (id)[v13 copy];
    }
  }

  return v12;
}

@end