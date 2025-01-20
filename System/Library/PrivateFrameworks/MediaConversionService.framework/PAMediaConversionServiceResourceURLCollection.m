@interface PAMediaConversionServiceResourceURLCollection
+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5;
+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5;
+ (id)collectionWithMainResourceURL:(id)a3;
+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3;
- (BOOL)allURLsAreReadable;
- (BOOL)containsAllRoles:(id)a3;
- (BOOL)containsAnyRole:(id)a3;
- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6;
- (BOOL)ensureFilesExistWithError:(id *)a3;
- (BOOL)isBlastDoorAccessRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeExistingEmptyFilesWithError:(id *)a3;
- (NSDictionary)blastDoorMainSourceProperties;
- (NSDictionary)blastDoorVideoComplementProperties;
- (NSError)blastDoorError;
- (NSMutableDictionary)urlReferencesByRole;
- (NSURL)blastDoorSourceURL;
- (PAMediaConversionServiceResourceURLCollection)init;
- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate;
- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3;
- (id)description;
- (id)fileSizeSummary;
- (id)filenameExtensionAndPathHashForRole:(id)a3;
- (id)logMessageSummary;
- (id)logMessageSummaryWithFullPath:(BOOL)a3;
- (id)resourceURLForRole:(id)a3;
- (id)typeIdentifierForResourceURLWithRole:(id)a3;
- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (unint64_t)urlCount;
- (void)enumerateResourceURLReferences:(id)a3;
- (void)enumerateResourceURLs:(id)a3;
- (void)setAccessProviderDelegate:(id)a3;
- (void)setResourceURL:(id)a3 forRole:(id)a4;
- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5;
- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4;
- (void)setUrlReferencesByRole:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessProviderDelegate, 0);
  objc_storeStrong((id *)&self->_urlReferencesByRole, 0);
}

- (void)setAccessProviderDelegate:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate
{
  return (PAMediaConversionServiceResourceURLCollectionAccessProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlReferencesByRole:(id)a3
{
}

- (NSMutableDictionary)urlReferencesByRole
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = *MEMORY[0x1E4F28320];
  v18[0] = @"mobile";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  int v12 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:v11 error:a6];

  char v13 = 0;
  if (v12)
  {
    v14 = [v8 lastPathComponent];
    v15 = [v9 URLByAppendingPathComponent:v14];

    char v13 = [v10 copyItemAtURL:v8 toURL:v15 error:a6];
  }

  return v13;
}

- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 541, @"Invalid parameter not satisfying: %@", @"outputDirectoryName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 542, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

LABEL_3:
  int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v44 = 0;
  char v13 = [v11 path];
  char v14 = [v12 fileExistsAtPath:v13 isDirectory:&v44];

  if (v44) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 546, @"Invalid parameter not satisfying: %@", @"exists && isDirectory" object file lineNumber description];
  }
  v16 = [v11 URLByAppendingPathComponent:v9];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  uint64_t v45 = *MEMORY[0x1E4F28320];
  v46[0] = @"mobile";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  v18 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  char v19 = [v12 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:v17 error:&obj];
  objc_storeStrong(v18, obj);

  if (v19) {
    goto LABEL_9;
  }
  v22 = [(id)v39[5] domain];
  if ([v22 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    BOOL v23 = [(id)v39[5] code] == 516;

    if (v23)
    {
LABEL_9:
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __114__PAMediaConversionServiceResourceURLCollection_urlForDebugDumpWithDirectoryName_inExistingParentDirectory_error___block_invoke;
      v28[3] = &unk_1E6CFE9A8;
      id v20 = v16;
      id v29 = v20;
      v30 = self;
      v31 = &v38;
      v32 = &v33;
      [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:v28];
      if (*((unsigned char *)v34 + 24))
      {
        id v21 = 0;
        if (a5) {
          *a5 = (id) v39[5];
        }
      }
      else
      {
        id v21 = v20;
      }

      _Block_object_dispose(&v33, 8);
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v21 = 0;
  if (a5) {
    *a5 = (id) v39[5];
  }
LABEL_20:
  _Block_object_dispose(&v38, 8);

  return v21;
}

void __114__PAMediaConversionServiceResourceURLCollection_urlForDebugDumpWithDirectoryName_inExistingParentDirectory_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 URLByAppendingPathComponent:v9];
  v11 = (void *)a1[5];
  uint64_t v12 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = [v11 copyURL:v8 forRole:v9 toDirectory:v10 error:&obj];

  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (unint64_t)urlCount
{
  return [(NSMutableDictionary *)self->_urlReferencesByRole count];
}

- (void)enumerateResourceURLs:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLs___block_invoke;
  v6[3] = &unk_1E6CFE980;
  id v7 = v4;
  id v5 = v4;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLReferences:v6];
}

void __71__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLs___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [a3 url];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (void)enumerateResourceURLReferences:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableDictionary *)self->_urlReferencesByRole allKeys];
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_117];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
      uint64_t v12 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v11];
      unsigned __int8 v13 = 0;
      v4[2](v4, v11, v12, &v13);
      LODWORD(v11) = v13;

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __80__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLReferences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)fileSizeSummary
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"<"];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  urlReferencesByRole = self->_urlReferencesByRole;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PAMediaConversionServiceResourceURLCollection_fileSizeSummary__block_invoke;
  v9[3] = &unk_1E6CFE958;
  id v10 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = [v6 componentsJoinedByString:@"|"];
  [v3 appendString:v7];

  [v3 appendString:@">"];
  return v3;
}

void __64__PAMediaConversionServiceResourceURLCollection_fileSizeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v13 = 0;
  uint64_t v14 = 0;
  char v6 = [a3 getFileSize:&v14 error:&v13];
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v14];
    uint64_t v9 = [v8 stringValue];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get file size for url with role %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v9 = @"?";
  }
  id v10 = *(void **)(a1 + 32);
  v15[0] = v5;
  v15[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v12 = [v11 componentsJoinedByString:@"="];
  [v10 addObject:v12];
}

- (id)description
{
  return [(PAMediaConversionServiceResourceURLCollection *)self logMessageSummaryWithFullPath:1];
}

- (id)logMessageSummary
{
  return [(PAMediaConversionServiceResourceURLCollection *)self logMessageSummaryWithFullPath:0];
}

- (id)logMessageSummaryWithFullPath:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28E78] stringWithString:@"<"];
  char v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __79__PAMediaConversionServiceResourceURLCollection_logMessageSummaryWithFullPath___block_invoke;
  id v13 = &unk_1E6CFE930;
  id v14 = v6;
  BOOL v15 = a3;
  id v7 = v6;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:&v10];
  uint64_t v8 = objc_msgSend(v7, "componentsJoinedByString:", @"|", v10, v11, v12, v13);
  [v5 appendString:v8];

  [v5 appendString:@">"];
  return v5;
}

void __79__PAMediaConversionServiceResourceURLCollection_logMessageSummaryWithFullPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v14[0] = v5;
  int v8 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v9 = [v6 path];
  uint64_t v10 = v9;
  uint64_t v11 = v9;
  if (!v8)
  {
    uint64_t v11 = [v9 lastPathComponent];
  }
  v14[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v13 = [v12 componentsJoinedByString:@"="];
  [v7 addObject:v13];

  if (!v8) {
}
  }

- (BOOL)allURLsAreReadable
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PAMediaConversionServiceResourceURLCollection_allURLsAreReadable__block_invoke;
  v6[3] = &unk_1E6CFE908;
  int v8 = &v9;
  id v4 = v3;
  id v7 = v4;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLs:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

void __67__PAMediaConversionServiceResourceURLCollection_allURLsAreReadable__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [a3 path];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isReadableFileAtPath:v7];

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)removeExistingEmptyFilesWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PAMediaConversionServiceResourceURLCollection_removeExistingEmptyFilesWithError___block_invoke;
  v10[3] = &unk_1E6CFE8E0;
  char v12 = &v18;
  id v13 = &v14;
  id v7 = v5;
  id v11 = v7;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((unsigned char *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

void __83__PAMediaConversionServiceResourceURLCollection_removeExistingEmptyFilesWithError___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v21 = 0;
  char v10 = [v8 getFileSize:&v21 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v8 url];
      uint64_t v18 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543874;
      id v23 = v7;
      __int16 v24 = 2112;
      v25 = v14;
      __int16 v26 = 2114;
      uint64_t v27 = v18;
      uint64_t v16 = MEMORY[0x1E4F14500];
      char v17 = "Unable to get file size for URL ref with role %{public}@ %@: %{public}@";
      goto LABEL_10;
    }
LABEL_7:
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
  if (!v21)
  {
    id v11 = (void *)a1[4];
    char v12 = [v8 url];
    uint64_t v13 = *(void *)(a1[5] + 8);
    id v19 = *(id *)(v13 + 40);
    LOBYTE(v11) = [v11 removeItemAtURL:v12 error:&v19];
    objc_storeStrong((id *)(v13 + 40), v19);

    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v8 url];
        uint64_t v15 = *(void *)(*(void *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543874;
        id v23 = v7;
        __int16 v24 = 2112;
        v25 = v14;
        __int16 v26 = 2114;
        uint64_t v27 = v15;
        uint64_t v16 = MEMORY[0x1E4F14500];
        char v17 = "Unable to remove empty file for URL ref with role %{public}@ %@: %{public}@";
LABEL_10:
        _os_log_error_impl(&dword_1DD979000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)ensureFilesExistWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PAMediaConversionServiceResourceURLCollection_ensureFilesExistWithError___block_invoke;
  v10[3] = &unk_1E6CFE8E0;
  id v7 = v5;
  id v11 = v7;
  char v12 = &v14;
  uint64_t v13 = &v18;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((unsigned char *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

void __75__PAMediaConversionServiceResourceURLCollection_ensureFilesExistWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 url];
  int v8 = [v7 path];

  if ([*(id *)(a1 + 32) fileExistsAtPath:v8 isDirectory:0]) {
    goto LABEL_17;
  }
  uint64_t v9 = [v6 url];
  char v10 = [v9 URLByDeletingLastPathComponent];

  char v25 = 0;
  id v11 = *(void **)(a1 + 32);
  char v12 = [v10 path];
  LODWORD(v11) = [v11 fileExistsAtPath:v12 isDirectory:&v25];

  if (v11)
  {
    if (v25) {
      goto LABEL_9;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    uint64_t v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "Attempting to create empty destination output file at path %@ but the parent directory path exists and is not a directory";
    goto LABEL_19;
  }
  uint64_t v15 = *(void **)(a1 + 32);
  uint64_t v28 = *MEMORY[0x1E4F28320];
  id v29 = @"mobile";
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v17 + 40);
  LOBYTE(v15) = [v15 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:v16 error:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);

  if (v15) {
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v31 = v23;
    uint64_t v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "Attempting to create empty destination output file at path %@ but parent directory creation failed:";
LABEL_19:
    _os_log_error_impl(&dword_1DD979000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
  }
LABEL_8:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v26 = *MEMORY[0x1E4F28320];
    uint64_t v27 = @"mobile";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    LOBYTE(v18) = [v18 createFileAtPath:v8 contents:0 attributes:v19];

    if ((v18 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v8;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create empty file at destination %@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:4 userInfo:0];
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
LABEL_17:
}

- (id)filenameExtensionAndPathHashForRole:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v10 = 0;
    uint64_t v11 = 0;
    [v3 getPathHash:&v11 lastPathComponent:&v10];
    id v5 = v10;
    id v6 = NSString;
    id v7 = [v5 pathExtension];
    int v8 = [v6 stringWithFormat:@"%@|%lx", v7, v11];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PAMediaConversionServiceResourceURLCollection_bookmarkDataDictionaryRepresentationWithError___block_invoke;
  v10[3] = &unk_1E6CFE8E0;
  char v12 = &v18;
  id v7 = v5;
  id v11 = v7;
  uint64_t v13 = &v14;
  [(NSMutableDictionary *)urlReferencesByRole enumerateKeysAndObjectsUsingBlock:v10];
  if (*((unsigned char *)v15 + 24))
  {
    id v8 = 0;
    if (a3) {
      *a3 = (id) v19[5];
    }
  }
  else
  {
    id v8 = v7;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __95__PAMediaConversionServiceResourceURLCollection_bookmarkDataDictionaryRepresentationWithError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [a3 dictionaryRepresentationWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to encode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (id)typeIdentifierForResourceURLWithRole:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 305, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }
  id v6 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v5];
  id v7 = v6;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [v6 url];
  if (!v8)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceResourceURLCollection.m" lineNumber:313 description:@"Unexpected nil role"];
  }
  id v34 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C728];
  id v33 = 0;
  char v10 = [v8 getResourceValue:&v34 forKey:v9 error:&v33];
  id v11 = v34;
  id v12 = v33;
  id v13 = v12;
  if ((v10 & 1) == 0)
  {
    uint64_t v15 = [v12 domain];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F281F8]];
    char v14 = v16;
    if (v16)
    {
      uint64_t v17 = [v13 code];

      if (v17 != 260)
      {
        char v14 = 0;
        if (v11) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
      uint64_t v18 = (void *)MEMORY[0x1E4F442D8];
      uint64_t v15 = [v8 lastPathComponent];
      id v19 = [v15 pathExtension];
      uint64_t v20 = [v18 typeWithFilenameExtension:v19];
      uint64_t v21 = [v20 identifier];

      id v11 = (id)v21;
    }

    if (v11) {
      goto LABEL_13;
    }
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v30 = [v8 path];
      *(_DWORD *)buf = 138543874;
      id v36 = v5;
      __int16 v37 = 2112;
      uint64_t v38 = v30;
      __int16 v39 = 2114;
      uint64_t v40 = v13;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to determine type identifier for URL with role %{public}@ %@: %{public}@", buf, 0x20u);
    }
    id v11 = 0;
    goto LABEL_24;
  }
  char v14 = 0;
LABEL_13:
  if (v11)
  {
    if ((v14 & 1) == 0)
    {
      v22 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
      int v23 = [v22 conformsToType:*MEMORY[0x1E4F44400]];

      if (v23)
      {
        __int16 v24 = CGImageSourceCreateWithURL((CFURLRef)v8, 0);
        if (v24)
        {
          char v25 = v24;
          uint64_t v26 = CGImageSourceGetType(v24);
          uint64_t v27 = v26;
          if (v26)
          {
            id v28 = v26;

            id v11 = v28;
          }
          CFRelease(v25);
        }
      }
    }
  }
LABEL_24:

LABEL_25:
  return v11;
}

- (BOOL)containsAnyRole:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 294, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)containsAllRoles:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 283, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  uint64_t v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:");
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 277, @"No URL is currently set for role %@", v9 object file lineNumber description];
  }
  [v7 setShouldDeleteOnDeallocation:v4];
}

- (id)resourceURLForRole:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 266, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }
  id v6 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 url];

  uint64_t v8 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];

  if (v8)
  {
    id v9 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
    uint64_t v10 = [v9 validateAccessForURL:v7 role:v5];

    uint64_t v7 = (void *)v10;
  }

  return v7;
}

- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(PAMediaConversionServiceResourceURLCollection *)self setResourceURL:a3 forRole:v8];
  [(PAMediaConversionServiceResourceURLCollection *)self setShouldDeleteURLOnDeallocation:v5 forRole:v8];
}

- (void)setResourceURL:(id)a3 forRole:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 251, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 252, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

LABEL_3:
  id v8 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:v7];

  if (v8)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 253, @"This resource URL collection already has a URL for role '%@'", v7 object file lineNumber description];
  }
  id v9 = +[PAMediaConversionServiceResourceURLReference referenceWithURL:v13];
  [(NSMutableDictionary *)self->_urlReferencesByRole setObject:v9 forKeyedSubscript:v7];
}

- (unint64_t)hash
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PAMediaConversionServiceResourceURLCollection_hash__block_invoke;
  v4[3] = &unk_1E6CFE8B8;
  v4[4] = &v5;
  [(PAMediaConversionServiceResourceURLCollection *)self enumerateResourceURLReferences:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __53__PAMediaConversionServiceResourceURLCollection_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = 0;
  uint64_t result = [a3 getPathHash:&v5 lastPathComponent:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  urlReferencesByRole = self->_urlReferencesByRole;
  BOOL v4 = [a3 urlReferencesByRole];
  LOBYTE(urlReferencesByRole) = [(NSMutableDictionary *)urlReferencesByRole isEqual:v4];

  return (char)urlReferencesByRole;
}

- (PAMediaConversionServiceResourceURLCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PAMediaConversionServiceResourceURLCollection;
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    urlReferencesByRole = v2->_urlReferencesByRole;
    v2->_urlReferencesByRole = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3
{
  uint64_t v3 = [a3 allValues];
  BOOL v4 = [v3 valueForKey:@"lastPathComponent"];
  uint64_t v5 = [v4 componentsJoinedByString:@"|"];

  return v5;
}

+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (!v9)
  {
    char v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 200, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [v9 allKeys];
  BOOL v12 = [v11 sortedArrayUsingComparator:&__block_literal_global];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v26 = a3;
    uint64_t v27 = a4;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v32;
    char v28 = 1;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v29 = 0;
        uint64_t v30 = 0;
        id v19 = v9;
        uint64_t v20 = [v9 objectForKeyedSubscript:v18];
        BOOL v21 = +[PAMediaConversionServiceResourceURLReference getPathHash:&v30 lastPathComponent:&v29 forDictionaryRepresentation:v20];
        id v22 = v29;

        if (v21)
        {
          v15 ^= v30;
          [v10 addObject:v22];
        }
        else
        {
          char v28 = 0;
        }

        id v9 = v19;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);

    a3 = v26;
    a4 = v27;
    if ((v28 & 1) == 0)
    {
      BOOL v23 = 0;
      goto LABEL_21;
    }
  }
  else
  {

    uint64_t v15 = 0;
  }
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lx", v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    *a4 = [v10 componentsJoinedByString:@"|"];
  }
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

uint64_t __112__PAMediaConversionServiceResourceURLCollection_getSignatureString_filenameSummary_forDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 169, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }
  id v11 = objc_opt_new();
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  char v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PAMediaConversionServiceResourceURLCollection_collectionForBookmarkDataDictionaryRepresentation_accessProvider_error___block_invoke;
  v16[3] = &unk_1E6CFE870;
  uint64_t v18 = &v24;
  id v12 = v11;
  id v17 = v12;
  id v19 = &v20;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  if (*((unsigned char *)v21 + 24))
  {
    id v13 = 0;
    if (a5) {
      *a5 = (id) v25[5];
    }
  }
  else
  {
    if (v10) {
      [v12 setAccessProviderDelegate:v10];
    }
    id v13 = v12;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

void __120__PAMediaConversionServiceResourceURLCollection_collectionForBookmarkDataDictionaryRepresentation_accessProvider_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = +[PAMediaConversionServiceResourceURLReference referenceWithDictionaryRepresentation:a3 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1[4] + 8) setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to decode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

+ (id)collectionWithMainResourceURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setResourceURL:v3 forRole:@"PAMediaConversionResourceRoleMainResource"];

  return v4;
}

- (NSError)blastDoorError
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 error];

  return (NSError *)v3;
}

- (NSURL)blastDoorSourceURL
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 blastDoorSourceURL];

  return (NSURL *)v3;
}

- (NSDictionary)blastDoorVideoComplementProperties
{
  id v3 = [(NSMutableDictionary *)self->_urlReferencesByRole objectForKeyedSubscript:@"PAMediaConversionResourceRoleVideoComplement"];
  BOOL v4 = [v3 url];

  uint64_t v5 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  objc_super v6 = [v5 propertiesForVideoComplementURL:v4];

  return (NSDictionary *)v6;
}

- (NSDictionary)blastDoorMainSourceProperties
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  id v3 = [v2 blastDoorMainSourceProperties];

  return (NSDictionary *)v3;
}

- (BOOL)isBlastDoorAccessRequired
{
  unint64_t v2 = [(PAMediaConversionServiceResourceURLCollection *)self accessProviderDelegate];
  char v3 = [v2 isBlastDoorAccessRequired];

  return v3;
}

@end