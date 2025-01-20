@interface IMCombinedDirectoryContents
- (IMCombinedDirectoryContents)initWithCombinedDirectoryContents:(id)a3;
- (NSArray)directoryContents;
- (id)combineArrays:(id)a3 rhs:(id)a4;
- (void)gather;
@end

@implementation IMCombinedDirectoryContents

- (IMCombinedDirectoryContents)initWithCombinedDirectoryContents:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) rootPath];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v13 = [v6 componentsJoinedByString:@" + "];
  v16.receiver = self;
  v16.super_class = (Class)IMCombinedDirectoryContents;
  v14 = [(IMDirectoryContents *)&v16 initWithRootPath:v13 attachmentsPath:0 syncAssetsPath:0 stickersPath:0];

  if (v14) {
    objc_storeStrong((id *)&v14->_directoryContents, a3);
  }

  return v14;
}

- (id)combineArrays:(id)a3 rhs:(id)a4
{
  id v5 = a4;
  v6 = (void *)[a3 mutableCopy];
  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
  }
  [v6 addObjectsFromArray:v5];

  return v6;
}

- (void)gather
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = IMLogHandleForCategory("DiskSpace");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(IMDirectoryContents *)self rootPath];
    *(_DWORD *)buf = 138412290;
    v36 = v4;
    _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "IMCombinedDirectoryContents: Combining directory contents for paths: %@", buf, 0xCu);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(IMCombinedDirectoryContents *)self directoryContents];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        uint64_t v10 = [(IMDirectoryContents *)self fileInfoMap];
        uint64_t v11 = (void *)[v10 mutableCopy];

        if (!v11)
        {
          uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v12 = [v9 fileInfoMap];
        [v11 addEntriesFromDictionary:v12];

        [(IMDirectoryContents *)self setFileInfoMap:v11];
        v13 = [(IMDirectoryContents *)self sortedPaths];
        v14 = [v9 sortedPaths];
        v15 = [(IMCombinedDirectoryContents *)self combineArrays:v13 rhs:v14];

        [v15 sortUsingComparator:&unk_1EF2BFB20];
        [(IMDirectoryContents *)self setSortedPaths:v15];
        objc_super v16 = [(IMDirectoryContents *)self topLevelPaths];
        long long v17 = [v9 topLevelPaths];
        long long v18 = [(IMCombinedDirectoryContents *)self combineArrays:v16 rhs:v17];
        [(IMDirectoryContents *)self setTopLevelPaths:v18];

        long long v19 = [(IMDirectoryContents *)self attachmentPaths];
        long long v20 = [v9 attachmentPaths];
        v21 = [(IMCombinedDirectoryContents *)self combineArrays:v19 rhs:v20];
        [(IMDirectoryContents *)self setAttachmentPaths:v21];

        uint64_t v22 = [(IMDirectoryContents *)self syncAssetPaths];
        v23 = [v9 syncAssetPaths];
        v24 = [(IMCombinedDirectoryContents *)self combineArrays:v22 rhs:v23];
        [(IMDirectoryContents *)self setSyncAssetPaths:v24];

        v25 = [(IMDirectoryContents *)self allPaths];
        v26 = (void *)[v25 mutableCopy];

        if (!v26)
        {
          v26 = [MEMORY[0x1E4F1CA80] set];
        }
        v27 = [v9 allPaths];
        v28 = [v27 allObjects];
        [v26 addObjectsFromArray:v28];

        [(IMDirectoryContents *)self setAllPaths:v26];
        -[IMDirectoryContents setSpaceSavedFromIgnoreLivePhotoBundles:](self, "setSpaceSavedFromIgnoreLivePhotoBundles:", -[IMDirectoryContents spaceSavedFromIgnoreLivePhotoBundles](self, "spaceSavedFromIgnoreLivePhotoBundles")+ [v9 spaceSavedFromIgnoreLivePhotoBundles]);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
}

- (NSArray)directoryContents
{
  return self->_directoryContents;
}

- (void).cxx_destruct
{
}

@end