@interface CRKFileBasedKeyedDataStore
+ (id)excludedFromiCloudBackupStoreWithDirectoryURL:(id)a3;
- (BOOL)isKeyValid:(id)a3;
- (BOOL)removeAllDataWithError:(id *)a3;
- (BOOL)removeDataForKey:(id)a3 error:(id *)a4;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CRKFileBasedKeyedDataStore)init;
- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3;
- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3 directoryResourceValuesByKey:(id)a4;
- (NSDictionary)directoryResourceValuesByKey;
- (NSFileManager)fileManager;
- (NSURL)directoryURL;
- (id)URLForKey:(id)a3;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (void)setDirectoryURL:(id)a3;
- (void)setFileManager:(id)a3;
- (void)updateExistingDirectoryResourceValues;
@end

@implementation CRKFileBasedKeyedDataStore

- (CRKFileBasedKeyedDataStore)init
{
  v3 = objc_msgSend(NSURL, "crk_uniqueTemporaryDirectoryURL");
  v4 = [(CRKFileBasedKeyedDataStore *)self initWithDirectoryURL:v3];

  return v4;
}

- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3
{
  return [(CRKFileBasedKeyedDataStore *)self initWithDirectoryURL:a3 directoryResourceValuesByKey:MEMORY[0x263EFFA78]];
}

+ (id)excludedFromiCloudBackupStoreWithDirectoryURL:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v9 = *MEMORY[0x263EFF6B0];
  v10[0] = MEMORY[0x263EFFA88];
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v5 initWithDirectoryURL:v4 directoryResourceValuesByKey:v6];

  return v7;
}

- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3 directoryResourceValuesByKey:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CRKFileBasedKeyedDataStore.m", 40, @"Invalid parameter not satisfying: %@", @"directoryURL" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)CRKFileBasedKeyedDataStore;
  v10 = [(CRKFileBasedKeyedDataStore *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_directoryURL, a3);
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    fileManager = v11->_fileManager;
    v11->_fileManager = (NSFileManager *)v12;

    uint64_t v14 = [v9 copy];
    directoryResourceValuesByKey = v11->_directoryResourceValuesByKey;
    v11->_directoryResourceValuesByKey = (NSDictionary *)v14;

    [(CRKFileBasedKeyedDataStore *)v11 updateExistingDirectoryResourceValues];
  }

  return v11;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    char v15 = [(CRKFileBasedKeyedDataStore *)self removeDataForKey:v9 error:a5];
    goto LABEL_9;
  }
  v10 = [(CRKFileBasedKeyedDataStore *)self fileManager];
  v11 = [(CRKFileBasedKeyedDataStore *)self directoryURL];
  uint64_t v12 = [v11 path];
  char v13 = [v10 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    v16 = [(CRKFileBasedKeyedDataStore *)self fileManager];
    v17 = [(CRKFileBasedKeyedDataStore *)self directoryURL];
    int v18 = [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a5];

    if (!v18) {
      goto LABEL_8;
    }
    v19 = [(CRKFileBasedKeyedDataStore *)self directoryResourceValuesByKey];
    if (![v19 count])
    {

      goto LABEL_3;
    }
    v20 = [(CRKFileBasedKeyedDataStore *)self directoryURL];
    v21 = [(CRKFileBasedKeyedDataStore *)self directoryResourceValuesByKey];
    int v22 = [v20 setResourceValues:v21 error:a5];

    if (!v22)
    {
LABEL_8:
      char v15 = 0;
      goto LABEL_9;
    }
  }
LABEL_3:
  uint64_t v14 = [(CRKFileBasedKeyedDataStore *)self URLForKey:v9];
  char v15 = [v8 writeToURL:v14 options:1 error:a5];

LABEL_9:
  return v15;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(CRKFileBasedKeyedDataStore *)self isKeyValid:v6])
  {
    id v9 = 0;
    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x263EFF8F8];
  id v8 = [(CRKFileBasedKeyedDataStore *)self URLForKey:v6];
  id v14 = 0;
  id v9 = [v7 dataWithContentsOfURL:v8 options:0 error:&v14];
  id v10 = v14;

  if (v9) {
    goto LABEL_8;
  }
  v11 = [v10 domain];
  if (([v11 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v12 = [v10 code];

  if (v12 != 260)
  {
LABEL_8:
    if (a4 && v10)
    {
      id v10 = v10;
      *a4 = v10;
    }
    goto LABEL_11;
  }

  id v10 = 0;
LABEL_11:

LABEL_12:

  return v9;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CRKFileBasedKeyedDataStore *)self isKeyValid:v6])
  {
    v7 = [(CRKFileBasedKeyedDataStore *)self fileManager];
    id v8 = [(CRKFileBasedKeyedDataStore *)self URLForKey:v6];
    char v9 = objc_msgSend(v7, "crk_safeRemoveItemAtURL:error:", v8, a4);
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  id v5 = [(CRKFileBasedKeyedDataStore *)self fileManager];
  id v6 = [(CRKFileBasedKeyedDataStore *)self directoryURL];
  LOBYTE(a3) = objc_msgSend(v5, "crk_safeRemoveItemAtURL:error:", v6, a3);

  return (char)a3;
}

- (void)updateExistingDirectoryResourceValues
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = [a2 directoryURL];
  v7 = [a3 verboseDescription];
  int v8 = 138543618;
  char v9 = v6;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_224C00000, v5, OS_LOG_TYPE_ERROR, "Failed to set resource values for directory %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
}

- (BOOL)isKeyValid:(id)a3
{
  return [a3 length] != 0;
}

- (id)URLForKey:(id)a3
{
  id v5 = a3;
  if (![(CRKFileBasedKeyedDataStore *)self isKeyValid:v5])
  {
    char v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CRKFileBasedKeyedDataStore.m", 126, @"key \"%@\" is invalid", v5 object file lineNumber description];
  }
  id v6 = [(CRKFileBasedKeyedDataStore *)self directoryURL];
  v7 = [v6 URLByAppendingPathComponent:v5];

  return v7;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSDictionary)directoryResourceValuesByKey
{
  return self->_directoryResourceValuesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryResourceValuesByKey, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end