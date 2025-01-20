@interface CPLEngineIDMapping
- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasPendingIdentifiers;
- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4;
- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5;
- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3;
- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3;
- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (unint64_t)scopeType;
@end

@implementation CPLEngineIDMapping

- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 resetAllFinalCloudIdentifiersForScopeWithIdentifier:v6 error:a4];

  return (char)a4;
}

- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 addAddEventForRecordWithLocalScopedIdentifier:v8 direction:a4 error:a5];

  return (char)a5;
}

- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 addDeleteEventForRecordWithLocalScopedIdentifier:v8 direction:a4 error:a5];

  return (char)a5;
}

- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 removeMappingForCloudScopedIdentifier:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasPendingIdentifiers
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasPendingIdentifiers];

  return v3;
}

- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    v7 = __CPLStorageOSLogDomain_5820();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Marking all pending cloud identifiers as final", v11, 2u);
    }
  }
  id v8 = [(CPLEngineStorage *)self platformObject];
  char v9 = [v8 markAllPendingIdentifiersForScopeWithIdentifier:v6 asFinalWithError:a4];

  return v9;
}

- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!_CPLSilentLogging)
  {
    v10 = __CPLStorageOSLogDomain_5820();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Remapping cloud identifier %@ to %@", (uint8_t *)&v14, 0x16u);
    }
  }
  v11 = [(CPLEngineStorage *)self platformObject];
  char v12 = [v11 setFinalCloudScopedIdentifier:v8 forPendingCloudScopedIdentifier:v9 error:a5];

  return v12;
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  char v18 = 0;
  v4 = (CPLScopedIdentifier *)a3;
  v5 = [(CPLScopedIdentifier *)v4 scopeIdentifier];
  id v6 = [(CPLEngineStorage *)self platformObject];
  v7 = [v6 localScopedIdentifierForCloudScopedIdentifier:v4 isFinal:&v18];

  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = 1;
    v10 = v4;
    do
    {
      v11 = [CPLScopedIdentifier alloc];
      id v12 = [NSString alloc];
      v13 = [(CPLScopedIdentifier *)v4 identifier];
      int v14 = (void *)[v12 initWithFormat:@"%@_%lu", v13, v9];
      id v8 = [(CPLScopedIdentifier *)v11 initWithScopeIdentifier:v5 identifier:v14];

      id v15 = [(CPLEngineStorage *)self platformObject];
      __int16 v16 = [v15 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v18];

      ++v9;
      v10 = v8;
    }
    while (v16);
  }

  return v8;
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  int v14 = [(CPLEngineIDMapping *)self firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:v12];
  if ([v14 isEqual:v12])
  {
    if (_CPLSilentLogging) {
      goto LABEL_14;
    }
    id v15 = __CPLStorageOSLogDomain_5820();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    __int16 v16 = " temporarily";
    *(_DWORD *)v26 = 138412802;
    *(void *)&v26[4] = v13;
    if (v9) {
      __int16 v16 = "";
    }
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v14;
    *(_WORD *)&v26[22] = 2080;
    v27 = v16;
    id v17 = "Mapping local identifier %@ to cloud identifier %@%s";
    char v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
    uint32_t v20 = 32;
    goto LABEL_12;
  }
  if (_CPLSilentLogging) {
    goto LABEL_14;
  }
  id v15 = __CPLStorageOSLogDomain_5820();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v21 = " temporarily";
    *(_DWORD *)v26 = 138413058;
    *(void *)&v26[4] = v13;
    *(_WORD *)&v26[12] = 2112;
    if (v9) {
      v21 = "";
    }
    *(void *)&v26[14] = v14;
    *(_WORD *)&v26[22] = 2080;
    v27 = v21;
    LOWORD(v28) = 2112;
    *(void *)((char *)&v28 + 2) = v12;
    id v17 = "Mapping local identifier %@ to cloud identifier %@%s [%@ was already taken]";
    char v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    uint32_t v20 = 42;
LABEL_12:
    _os_log_impl(&dword_1B4CAC000, v18, v19, v17, v26, v20);
  }
LABEL_13:

LABEL_14:
  v22 = [(CPLEngineStorage *)self platformObject];
  int v23 = [v22 addCloudScopedIdentifier:v14 forLocalScopedIdentifier:v13 isFinal:v9 direction:a6 error:a7];

  if (v23) {
    id v24 = v14;
  }
  else {
    id v24 = 0;
  }

  return v24;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (!_CPLSilentLogging)
  {
    int v14 = __CPLStorageOSLogDomain_5820();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = " temporarily";
      *(_DWORD *)os_log_type_t v19 = 138412802;
      *(void *)&v19[4] = v13;
      if (v9) {
        id v15 = "";
      }
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v12;
      __int16 v20 = 2080;
      v21 = v15;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Mapping local identifier %@ to cloud identifier %@%s", v19, 0x20u);
    }
  }
  __int16 v16 = [(CPLEngineStorage *)self platformObject];
  char v17 = [v16 addCloudScopedIdentifier:v12 forLocalScopedIdentifier:v13 isFinal:v9 direction:a6 error:a7];

  return v17;
}

- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3
{
  id v4 = a3;
  char v12 = 0;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 localScopedIdentifierForCloudScopedIdentifier:v4 isFinal:&v12];

  if (!v6)
  {
    v7 = [(CPLEngineStorage *)self engineStore];
    id v8 = [v7 remappedRecords];
    BOOL v9 = [v8 realScopedIdentifierForRemappedScopedIdentifier:v4];

    if (v9 && ([v9 isEqual:v4] & 1) == 0)
    {
      v10 = [(CPLEngineStorage *)self platformObject];
      id v6 = [v10 localScopedIdentifierForCloudScopedIdentifier:v9 isFinal:&v12];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [v7 localScopedIdentifierForCloudScopedIdentifier:v6 isFinal:a4];

  return v8;
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(CPLEngineStorage *)self platformObject];
  BOOL v9 = [v8 cloudScopedIdentifierForLocalScopedIdentifier:v7 isFinal:a4];

  if (!v9 && *a4)
  {
    if (!_CPLSilentLogging)
    {
      v11 = __CPLStorageOSLogDomain_5820();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "No cloud identifier for %@ means the cloud identifier should not be final", buf, 0xCu);
      }
    }
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineIDMapping.m"];
    [v12 handleFailureInMethod:a2, self, v13, 33, @"No cloud identifier for %@ means the cloud identifier should not be final", v7 object file lineNumber description];

    abort();
  }

  return v9;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v10 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  return (char)a6;
}

- (unint64_t)scopeType
{
  return 3;
}

@end