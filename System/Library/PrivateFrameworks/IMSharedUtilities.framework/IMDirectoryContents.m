@interface IMDirectoryContents
+ (BOOL)isGroupPhotoPath:(id)a3;
- (BOOL)isAttachmentPath:(id)a3;
- (BOOL)isStickerPath:(id)a3;
- (BOOL)isSyncAssetPath:(id)a3;
- (IMDirectoryContents)initWithRootPath:(id)a3 attachmentsPath:(id)a4 syncAssetsPath:(id)a5 stickersPath:(id)a6;
- (NSArray)attachmentPaths;
- (NSArray)sortedPaths;
- (NSArray)syncAssetPaths;
- (NSArray)topLevelPaths;
- (NSDictionary)fileInfoMap;
- (NSSet)allPaths;
- (NSString)attachmentsPath;
- (NSString)rootPath;
- (NSString)stickersPath;
- (NSString)syncAssetsPath;
- (int64_t)spaceSavedFromIgnoreLivePhotoBundles;
- (void)gather;
- (void)gatherLivePhotoBundleContentInfoAtPath:(id)a3;
- (void)recursivelyGatherFileInfoAtPath:(id)a3 fileInfoMap:(id)a4;
- (void)setAllPaths:(id)a3;
- (void)setAttachmentPaths:(id)a3;
- (void)setFileInfoMap:(id)a3;
- (void)setSortedPaths:(id)a3;
- (void)setSpaceSavedFromIgnoreLivePhotoBundles:(int64_t)a3;
- (void)setSyncAssetPaths:(id)a3;
- (void)setTopLevelPaths:(id)a3;
@end

@implementation IMDirectoryContents

- (IMDirectoryContents)initWithRootPath:(id)a3 attachmentsPath:(id)a4 syncAssetsPath:(id)a5 stickersPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)IMDirectoryContents;
  v14 = [(IMDirectoryContents *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    rootPath = v14->_rootPath;
    v14->_rootPath = (NSString *)v15;

    if (v11)
    {
      uint64_t v17 = [v11 copy];
      attachmentsPath = v14->_attachmentsPath;
      v14->_attachmentsPath = (NSString *)v17;
    }
    if (v13)
    {
      uint64_t v19 = [v13 copy];
      stickersPath = v14->_stickersPath;
      v14->_stickersPath = (NSString *)v19;
    }
    if (v12)
    {
      uint64_t v21 = [v12 copy];
      syncAssetsPath = v14->_syncAssetsPath;
      v14->_syncAssetsPath = (NSString *)v21;
    }
    v14->_spaceSavedFromIgnoreLivePhotoBundles = 0;
  }

  return v14;
}

- (BOOL)isAttachmentPath:(id)a3
{
  id v4 = a3;
  v5 = [(IMDirectoryContents *)self attachmentsPath];
  if (v5)
  {
    v6 = [(IMDirectoryContents *)self attachmentsPath];
    char v7 = [v4 hasPrefix:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isStickerPath:(id)a3
{
  id v4 = a3;
  v5 = [(IMDirectoryContents *)self stickersPath];
  if (v5)
  {
    v6 = [(IMDirectoryContents *)self stickersPath];
    char v7 = [v4 hasPrefix:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isSyncAssetPath:(id)a3
{
  id v4 = a3;
  v5 = [(IMDirectoryContents *)self syncAssetsPath];
  if (v5)
  {
    v6 = [(IMDirectoryContents *)self syncAssetsPath];
    char v7 = [v4 hasPrefix:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)gatherLivePhotoBundleContentInfoAtPath:(id)a3
{
  id v4 = a3;
  long long v9 = IMFileSizeZero;
  id v8 = 0;
  BOOL v5 = IMFileSizeForItemAtPath(v4, (off_t *)&v9, 1, &v8);
  id v6 = v8;
  if (v5)
  {
    self->_spaceSavedFromIgnoreLivePhotoBundles += v9;
  }
  else
  {
    char v7 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09F21A0();
    }
  }
}

- (void)recursivelyGatherFileInfoAtPath:(id)a3 fileInfoMap:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v41 = 0;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6 isDirectory:&v41];

  if (!v9) {
    goto LABEL_28;
  }
  int v40 = 0;
  unint64_t v10 = +[IMAPFSUtils purgableFlagsForPath:v6 error:&v40];
  if (v40)
  {
    id v11 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09F22C0();
    }
  }
  if (!v41)
  {
    long long v34 = IMFileSizeZero;
    id v33 = 0;
    BOOL v16 = IMFileSizeForItemAtPath(v6, (off_t *)&v34, 1, &v33);
    id v17 = v33;
    if (!v16)
    {
      v18 = IMLogHandleForCategory("DiskSpace");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1A09F21A0();
      }
    }
    uint64_t v19 = [IMDiskSpaceFileManagerFileInfo alloc];
    BOOL v20 = [(IMDirectoryContents *)self isAttachmentPath:v6];
    BOOL v21 = [(IMDirectoryContents *)self isSyncAssetPath:v6];
    LOBYTE(v32) = [(IMDirectoryContents *)self isStickerPath:v6];
    v22 = [(IMDiskSpaceFileManagerFileInfo *)v19 initWithPath:v6 fileSize:v34 isDirectory:0 isAttachment:v20 isSyncAsset:v21 isSticker:v32 purgableFlags:v10];
    [v7 setObject:v22 forKeyedSubscript:v6];

    goto LABEL_27;
  }
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v39 = 0;
  id v13 = [v12 contentsOfDirectoryAtPath:v6 error:&v39];
  id v14 = v39;

  if (!v14)
  {
    v23 = (void *)MEMORY[0x1E4F442D8];
    objc_super v24 = [v6 pathExtension];
    v25 = [v23 typeWithFilenameExtension:v24];
    int v26 = [v25 conformsToType:*MEMORY[0x1E4F44420]];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v13;
    uint64_t v27 = [v17 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v17);
          }
          v31 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          if (v26) {
            [(IMDirectoryContents *)self gatherLivePhotoBundleContentInfoAtPath:v31];
          }
          else {
            [(IMDirectoryContents *)self recursivelyGatherFileInfoAtPath:v31 fileInfoMap:v7];
          }
        }
        uint64_t v28 = [v17 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v28);
    }

LABEL_27:
    goto LABEL_28;
  }
  uint64_t v15 = IMLogHandleForCategory("DiskSpace");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1A09F2230();
  }

LABEL_28:
}

- (NSArray)sortedPaths
{
  sortedPaths = self->_sortedPaths;
  if (!sortedPaths)
  {
    id v4 = [(NSDictionary *)self->_fileInfoMap allKeys];
    BOOL v5 = [v4 sortedArrayUsingComparator:&unk_1EF2BFA00];
    id v6 = self->_sortedPaths;
    self->_sortedPaths = v5;

    sortedPaths = self->_sortedPaths;
  }

  return sortedPaths;
}

- (NSSet)allPaths
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(IMDirectoryContents *)self sortedPaths];
  BOOL v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (NSArray)attachmentPaths
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  attachmentPaths = self->_attachmentPaths;
  if (!attachmentPaths)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v5 = [(IMDirectoryContents *)self sortedPaths];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ([(IMDirectoryContents *)self isAttachmentPath:v10])
          {
            id v11 = [(IMDirectoryContents *)self fileInfoMap];
            id v12 = [v11 objectForKeyedSubscript:v10];
            char v13 = [v12 isDirectory];

            if ((v13 & 1) == 0) {
              [(NSArray *)v4 addObject:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    id v14 = self->_attachmentPaths;
    self->_attachmentPaths = v4;

    attachmentPaths = self->_attachmentPaths;
  }

  return attachmentPaths;
}

- (NSArray)syncAssetPaths
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_syncAssetPaths)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(IMDirectoryContents *)self sortedPaths];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ([(IMDirectoryContents *)self isSyncAssetPath:v9])
          {
            uint64_t v10 = [(IMDirectoryContents *)self fileInfoMap];
            id v11 = [v10 objectForKeyedSubscript:v9];
            char v12 = [v11 isDirectory];

            if ((v12 & 1) == 0) {
              [v3 addObject:v9];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)topLevelPaths
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_topLevelPaths)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(IMDirectoryContents *)self sortedPaths];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 stringByDeletingLastPathComponent];
          id v11 = [(IMDirectoryContents *)self rootPath];
          int v12 = [v10 isEqualToString:v11];

          if (v12) {
            [(NSArray *)v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    topLevelPaths = self->_topLevelPaths;
    self->_topLevelPaths = v3;
  }
  attachmentPaths = self->_attachmentPaths;

  return attachmentPaths;
}

- (void)gather
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = IMLogHandleForCategory("DiskSpace");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(IMDirectoryContents *)self rootPath];
    int v14 = 138412290;
    long long v15 = v4;
    _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Directory Contents: Gathering info for path: %@", (uint8_t *)&v14, 0xCu);
  }
  topLevelPaths = self->_topLevelPaths;
  self->_topLevelPaths = 0;

  attachmentPaths = self->_attachmentPaths;
  self->_attachmentPaths = 0;

  syncAssetPaths = self->_syncAssetPaths;
  self->_syncAssetPaths = 0;

  sortedPaths = self->_sortedPaths;
  self->_sortedPaths = 0;

  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [(IMDirectoryContents *)self rootPath];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    int v12 = [(IMDirectoryContents *)self rootPath];
    [(IMDirectoryContents *)self recursivelyGatherFileInfoAtPath:v12 fileInfoMap:v9];
  }
  else
  {
    int v12 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2374(v12);
    }
  }

  fileInfoMap = self->_fileInfoMap;
  self->_fileInfoMap = v9;
}

+ (BOOL)isGroupPhotoPath:(id)a3
{
  id v3 = [a3 lastPathComponent];
  char v4 = [v3 containsString:@"GroupPhotoImage"];

  return v4;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)attachmentsPath
{
  return self->_attachmentsPath;
}

- (NSString)syncAssetsPath
{
  return self->_syncAssetsPath;
}

- (NSString)stickersPath
{
  return self->_stickersPath;
}

- (int64_t)spaceSavedFromIgnoreLivePhotoBundles
{
  return self->_spaceSavedFromIgnoreLivePhotoBundles;
}

- (void)setSpaceSavedFromIgnoreLivePhotoBundles:(int64_t)a3
{
  self->_spaceSavedFromIgnoreLivePhotoBundles = a3;
}

- (NSDictionary)fileInfoMap
{
  return self->_fileInfoMap;
}

- (void)setFileInfoMap:(id)a3
{
}

- (void)setSortedPaths:(id)a3
{
}

- (void)setTopLevelPaths:(id)a3
{
}

- (void)setAttachmentPaths:(id)a3
{
}

- (void)setSyncAssetPaths:(id)a3
{
}

- (void)setAllPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPaths, 0);
  objc_storeStrong((id *)&self->_syncAssetPaths, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_topLevelPaths, 0);
  objc_storeStrong((id *)&self->_sortedPaths, 0);
  objc_storeStrong((id *)&self->_fileInfoMap, 0);
  objc_storeStrong((id *)&self->_stickersPath, 0);
  objc_storeStrong((id *)&self->_syncAssetsPath, 0);
  objc_storeStrong((id *)&self->_attachmentsPath, 0);

  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end