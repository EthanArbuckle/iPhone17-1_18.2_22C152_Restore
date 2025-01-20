@interface MSMMCSProtocol
+ (id)computeItemIDForAsset:(id)a3;
- (MSMMCSProtocol)initWithPersonID:(id)a3 path:(id)a4;
- (NSString)personID;
- (_mmcs_engine)engine;
- (id)_getUTIFromItem:(unint64_t)a3;
- (int)_getFileDescriptorFromItem:(unint64_t)a3;
- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5;
- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5;
- (void)_requestCompleted;
- (void)abort;
- (void)deactivate;
- (void)deactivateRemoveAllFiles:(BOOL)a3;
- (void)dealloc;
- (void)didFinishUsingAssets:(id)a3;
@end

@implementation MSMMCSProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineDirPath, 0);
  objc_storeStrong((id *)&self->_MMCSDirPath, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (_mmcs_engine)engine
{
  return self->_engine;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)_requestCompleted
{
}

- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  __assert_rtn("-[MSMMCSProtocol _putItemDone:putReceipt:error:]", "MSMMCSProtocol.m", 201, "0");
}

- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  __assert_rtn("-[MSMMCSProtocol _getItemDone:path:error:]", "MSMMCSProtocol.m", 197, "0");
}

- (id)_getUTIFromItem:(unint64_t)a3
{
  return 0;
}

- (int)_getFileDescriptorFromItem:(unint64_t)a3
{
}

- (void)didFinishUsingAssets:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) metadata];
        v9 = [v8 objectForKey:@"MSAssetMetadataItemID"];

        if (v9)
        {
          [v9 unsignedLongLongValue];
          MMCSUnregisterFile();
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)abort
{
}

- (void)dealloc
{
  [(MSMMCSProtocol *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSMMCSProtocol;
  [(MSMMCSProtocol *)&v3 dealloc];
}

- (void)deactivateRemoveAllFiles:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_engine)
  {
    MMCSEngineDestroy();
    self->_engine = 0;
  }
  personID = self->_personID;
  self->_personID = 0;

  engineDirPath = self->_engineDirPath;
  self->_engineDirPath = 0;

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Removing database.", v9, 2u);
    }
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v7 removeItemAtPath:self->_MMCSDirPath error:0];
  }
  MMCSDirPath = self->_MMCSDirPath;
  self->_MMCSDirPath = 0;
}

- (void)deactivate
{
}

- (MSMMCSProtocol)initWithPersonID:(id)a3 path:(id)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSMMCSProtocol;
  v9 = [(MSMMCSProtocol *)&v23 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_MMCSDirPath, a4);
    long long v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    uint64_t v12 = *MEMORY[0x1E4F73808];
    v24[0] = *MEMORY[0x1E4F73800];
    v24[1] = v12;
    v25[0] = MEMORY[0x1E4F1CC38];
    v25[1] = MEMORY[0x1E4F1CC38];
    v24[2] = *MEMORY[0x1E4F737F8];
    v25[2] = MEMORY[0x1E4F1CC38];
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C3A0]];
    v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v15 getCFRunLoop];
    MSPlatform();
    id v16 = v8;
    id v17 = a3;
    v19 = id v18 = v7;
    [v19 appBundleInfoString];
    v10->_engine = (_mmcs_engine *)MMCSEngineCreate();

    id v7 = v18;
    objc_storeStrong((id *)&v10->_engineDirPath, a4);
    v20 = v17;
    id v8 = v16;
    objc_storeStrong((id *)&v10->_personID, v20);
  }
  return v10;
}

+ (id)computeItemIDForAsset:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 metadata];
  uint64_t v5 = [v4 objectForKey:@"MSAssetMetadataItemID"];
  if (!v5)
  {
    uint64_t v6 = NSNumber;
    id v7 = (void *)__masterManifest_1113;
    if (!__masterManifest_1113)
    {
      id v8 = MSPathMMCSMasterManifest();
      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v10 = [v9 fileExistsAtPath:v8];

      if (v10)
      {
        long long v11 = (void *)MEMORY[0x1E4F28F98];
        uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
        id v28 = 0;
        uint64_t v13 = [v11 propertyListWithData:v12 options:1 format:0 error:&v28];
        id v14 = v28;
        uint64_t v15 = (void *)__masterManifest_1113;
        __masterManifest_1113 = v13;

        if (!__masterManifest_1113 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v14;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize MMCS master manifest: %{public}@", buf, 0xCu);
        }
      }
      if (!__masterManifest_1113)
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v17 = (void *)__masterManifest_1113;
        __masterManifest_1113 = (uint64_t)v16;
      }
      id v7 = (void *)__masterManifest_1113;
    }
    id v18 = v7;
    v19 = [v18 objectForKey:@"nextFileID"];
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = [v19 unsignedLongLongValue] + 1;
    }
    else
    {
      uint64_t v22 = arc4random();
      uint64_t v21 = arc4random() | (unint64_t)(v22 << 32);
    }
    objc_super v23 = [NSNumber numberWithUnsignedLongLong:v21];
    [v18 setObject:v23 forKey:@"nextFileID"];

    v24 = (void *)__masterManifest_1113;
    v25 = MSPathMMCSMasterManifest();
    [v24 writeToFile:v25 atomically:1];

    uint64_t v5 = [v6 numberWithUnsignedLongLong:v21];
    v26 = (void *)[v4 mutableCopy];
    [v26 setObject:v5 forKey:@"MSAssetMetadataItemID"];
    [v3 setMetadata:v26];
  }
  return v5;
}

@end