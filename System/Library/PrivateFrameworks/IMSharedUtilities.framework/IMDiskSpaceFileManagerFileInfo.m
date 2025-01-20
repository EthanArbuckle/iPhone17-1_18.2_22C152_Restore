@interface IMDiskSpaceFileManagerFileInfo
- (IMDiskSpaceFileManagerFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 purgableFlags:(unint64_t)a9;
- (NSString)purgableFlagsString;
- (unint64_t)purgableFlags;
- (void)addLogItems:(id)a3;
@end

@implementation IMDiskSpaceFileManagerFileInfo

- (IMDiskSpaceFileManagerFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 purgableFlags:(unint64_t)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  unint64_t disk_allocation_size = a4.disk_allocation_size;
  unint64_t file_size = a4.file_size;
  id v15 = a3;
  if (a9) {
    BOOL v16 = (IM_APFS_PURGEABLE_IGNORE_ME() & a9) == 0;
  }
  else {
    BOOL v16 = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)IMDiskSpaceFileManagerFileInfo;
  HIBYTE(v20) = v16;
  LOBYTE(v20) = a8;
  v17 = [(IMDiskSpaceFileInfo *)&v21 initWithPath:v15 fileSize:file_size isDirectory:disk_allocation_size isAttachment:v11 isSyncAsset:v10 isSticker:v9 isPurgableOnDisk:v20];
  v18 = v17;
  if (v17) {
    v17->_purgableFlags = a9;
  }

  return v18;
}

- (void)addLogItems:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMDiskSpaceFileManagerFileInfo;
  id v4 = a3;
  [(IMDiskSpaceFileInfo *)&v8 addLogItems:v4];
  v5 = NSString;
  v6 = +[IMAPFSUtils stringForPurgableFlags:[(IMDiskSpaceFileManagerFileInfo *)self purgableFlags]];
  v7 = [v5 stringWithFormat:@"isPurgable: %@ (on disk)", v6];
  [v4 addObject:v7];
}

- (unint64_t)purgableFlags
{
  return self->_purgableFlags;
}

- (NSString)purgableFlagsString
{
  return self->_purgableFlagsString;
}

- (void).cxx_destruct
{
}

@end