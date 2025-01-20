@interface MADManagedRequest
+ (BOOL)removeRequest:(id)a3 error:(id *)a4;
+ (id)entryWithRequestID:(id)a3 bundleIdentifier:(id)a4 sourceIdentifier:(id)a5 assetIdentifier:(id)a6 assetURL:(id)a7 assetURLExtension:(id)a8 resultDirectoryURL:(id)a9 resultDirectoryURLExtension:(id)a10 request:(id)a11 error:(id *)a12;
+ (id)fetchTaskScheduleWithPredicate:(id)a3 error:(id *)a4;
- (id)description;
@end

@implementation MADManagedRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@", v5];

  v6 = [(MADManagedRequest *)self requestID];
  v7 = [(MADManagedRequest *)self requestDate];
  [v3 appendFormat:@", requestID: %@, requestDate: %@,", v6, v7];

  v8 = [(MADManagedRequest *)self bundleIdentifier];
  [v3 appendFormat:@", bundle: %@, ", v8];

  v9 = [(MADManagedRequest *)self sourceIdentifier];
  v10 = [(MADManagedRequest *)self assetIdentifier];
  v11 = [(MADManagedRequest *)self assetURL];
  [v3 appendFormat:@", asset: id-%@, source-%@, url-%@, ", v9, v10, v11];

  v12 = [(MADManagedRequest *)self resultDirectoryURL];
  [v3 appendFormat:@", resultDirectoryURL: %@, ", v12];

  [v3 appendFormat:@", status: %d, ", (int)-[MADManagedRequest status](self, "status")];
  [v3 appendFormat:@", attempts: %d, ", (int)-[MADManagedRequest attempts](self, "attempts")];
  v13 = [(MADManagedRequest *)self previousAttemptDate];
  [v3 appendFormat:@", previousAttemptDate: %@, ", v13];

  v14 = [(MADManagedRequest *)self nextAttemptDate];
  [v3 appendFormat:@", nextAttemptDate: %@, ", v14];

  [v3 appendFormat:@">"];
  return v3;
}

+ (id)entryWithRequestID:(id)a3 bundleIdentifier:(id)a4 sourceIdentifier:(id)a5 assetIdentifier:(id)a6 assetURL:(id)a7 assetURLExtension:(id)a8 resultDirectoryURL:(id)a9 resultDirectoryURLExtension:(id)a10 request:(id)a11 error:(id *)a12
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v51 = a4;
  id v52 = a5;
  id v18 = a6;
  id v19 = a7;
  id v47 = a8;
  id v48 = a9;
  id v49 = a10;
  id v20 = a11;
  v46 = v18;
  v50 = +[MADSystemDataStore systemDataStore];
  v21 = [(id)objc_opt_class() description];
  v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleIdentifier=%@ AND sourceIdentifier=%@ AND assetIdentifier=%@ AND assetURL=%@ AND requestType=%@", v51, v52, v18, v19, v21];
  id v55 = 0;
  v23 = [a1 fetchTaskScheduleWithPredicate:v22 error:&v55];
  v24 = (MADManagedRequest *)v55;
  v25 = [v23 firstObject];

  if (!v24)
  {
    v44 = [v50 managedObjectContext];
    if (v25)
    {
      v29 = v25;
    }
    else
    {
      v29 = [[MADManagedRequest alloc] initWithContext:v44];
      if (!v29)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = 0;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to allocate new entry (%@)", buf, 0xCu);
          }
        }
        if (a12)
        {
          id v35 = (id)[0 copy];
          v29 = 0;
          v24 = 0;
          goto LABEL_42;
        }
        v29 = 0;
        v24 = 0;
LABEL_44:
        v28 = 0;
        goto LABEL_45;
      }
    }
    [(MADManagedRequest *)v29 setRequestID:v45];
    v30 = [MEMORY[0x1E4F1C9C8] now];
    [(MADManagedRequest *)v29 setRequestDate:v30];

    [(MADManagedRequest *)v29 setAssetIdentifier:v46];
    [(MADManagedRequest *)v29 setSourceIdentifier:v52];
    [(MADManagedRequest *)v29 setAssetURL:v19];
    [(MADManagedRequest *)v29 setAssetURLExtension:v47];
    [(MADManagedRequest *)v29 setResultDirectoryURL:v48];
    [(MADManagedRequest *)v29 setResultDirectoryURLExtension:v49];
    [(MADManagedRequest *)v29 setBundleIdentifier:v51];
    [(MADManagedRequest *)v29 setStatus:0];
    [(MADManagedRequest *)v29 setAttempts:0];
    v31 = [MEMORY[0x1E4F1C9C8] distantPast];
    [(MADManagedRequest *)v29 setPreviousAttemptDate:v31];

    v32 = [MEMORY[0x1E4F1C9C8] now];
    [(MADManagedRequest *)v29 setNextAttemptDate:v32];

    [(MADManagedRequest *)v29 setRequestType:v21];
    id v54 = 0;
    v33 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v54];
    v24 = (MADManagedRequest *)v54;
    [(MADManagedRequest *)v29 setRequestData:v33];

    if (v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v24;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to parse request (%@)", buf, 0xCu);
        }
      }
      if (a12)
      {
        id v35 = (id)[(MADManagedRequest *)v24 copy];
LABEL_42:
        v28 = 0;
        *a12 = v35;
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (v25)
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_34;
      }
      v36 = VCPLogInstance();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 138412546;
      v57 = v25;
      __int16 v58 = 2112;
      v59 = v29;
      v37 = "[MADSystemDataStore] Updating existing entry %@ to %@";
      v38 = v36;
      uint32_t v39 = 22;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_34;
      }
      v36 = VCPLogInstance();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
LABEL_33:

LABEL_34:
        id v53 = 0;
        char v41 = [v50 commitChangesOrRollback:&v53];
        v24 = (MADManagedRequest *)v53;
        if (v41)
        {
          v29 = v29;
          v28 = v29;
LABEL_45:

          goto LABEL_46;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v42 = VCPLogInstance();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v24;
            _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to register asset (%@)", buf, 0xCu);
          }
        }
        if (a12)
        {
          id v35 = (id)[(MADManagedRequest *)v24 copy];
          goto LABEL_42;
        }
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138412290;
      v57 = v29;
      v37 = "[MADSystemDataStore] Adding new entry - %@";
      v38 = v36;
      uint32_t v39 = 12;
    }
    _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, v37, buf, v39);
    goto LABEL_33;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (MADManagedRequest *)*a12;
      *(_DWORD *)buf = 138412290;
      v57 = v27;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
    }
  }
  v28 = 0;
  if (a12) {
    *a12 = (id)[(MADManagedRequest *)v24 copy];
  }
LABEL_46:

  return v28;
}

+ (id)fetchTaskScheduleWithPredicate:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MADSystemDataStore systemDataStore];
  v7 = +[MADManagedRequest fetchRequest];
  v8 = v7;
  if (v5) {
    [v7 setPredicate:v5];
  }
  v9 = [v6 managedObjectContext];
  id v14 = 0;
  v10 = [v9 executeFetchRequest:v8 error:&v14];
  id v11 = v14;

  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[MADManagedTaskSchedule] Failed to fetch processing status - %@", buf, 0xCu);
      }
    }
    if (a4) {
      *a4 = (id)[v11 copy];
    }
  }

  return v10;
}

+ (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MADSystemDataStore systemDataStore];
  v7 = +[MADManagedRequest fetchRequest];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"requestID==%@", v5];
  [v7 setPredicate:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  v10 = [v6 managedObjectContext];
  id v21 = 0;
  id v11 = [v10 executeRequest:v9 error:&v21];
  id v12 = v21;

  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v12;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Failed to remove entry (%@)", buf, 0xCu);
      }
    }
    if (a4)
    {
      id v14 = (id)[v12 copy];
LABEL_20:
      BOOL v17 = 0;
      *a4 = v14;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  id v20 = 0;
  char v15 = [v6 commitChangesOrRollback:&v20];
  id v12 = v20;
  if ((v15 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v12;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Failed to commit changes (%@)", buf, 0xCu);
      }
    }
    if (a4)
    {
      id v14 = (id)[v12 copy];
      goto LABEL_20;
    }
LABEL_21:
    BOOL v17 = 0;
    goto LABEL_22;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v5;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Removed request %@ - %@", buf, 0x16u);
    }
  }
  BOOL v17 = 1;
LABEL_22:

  return v17;
}

@end