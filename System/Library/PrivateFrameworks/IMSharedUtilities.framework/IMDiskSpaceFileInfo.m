@interface IMDiskSpaceFileInfo
- (BOOL)isAttachment;
- (BOOL)isDirectory;
- (BOOL)isPurgableOnDisk;
- (BOOL)isSticker;
- (BOOL)isSyncAsset;
- (IMDiskSpaceFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 isPurgableOnDisk:(BOOL)a9;
- (IMFileSize)fileSize;
- (NSString)fileExtension;
- (NSString)guid;
- (NSString)path;
- (id)logString;
- (void)addLogItems:(id)a3;
- (void)log;
@end

@implementation IMDiskSpaceFileInfo

- (IMDiskSpaceFileInfo)initWithPath:(id)a3 fileSize:(IMFileSize)a4 isDirectory:(BOOL)a5 isAttachment:(BOOL)a6 isSyncAsset:(BOOL)a7 isSticker:(BOOL)a8 isPurgableOnDisk:(BOOL)a9
{
  BOOL v10 = a6;
  unint64_t disk_allocation_size = a4.disk_allocation_size;
  unint64_t file_size = a4.file_size;
  id v15 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IMDiskSpaceFileInfo;
  v16 = [(IMDiskSpaceFileInfo *)&v28 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    path = v16->_path;
    v16->_path = (NSString *)v17;

    v16->_isDirectory = a5;
    v16->_isAttachment = v10;
    v16->_isSyncAsset = a7;
    v16->_isPurgableOnDisk = a9;
    v16->_fileSize.unint64_t file_size = file_size;
    v16->_fileSize.unint64_t disk_allocation_size = disk_allocation_size;
    v16->_isSticker = a8;
    if (v10)
    {
      v19 = [v15 stringByDeletingLastPathComponent];
      uint64_t v20 = [v19 lastPathComponent];
      guid = v16->_guid;
      v16->_guid = (NSString *)v20;
    }
    v22 = [v15 pathExtension];
    v23 = v22;
    if (v22 && [v22 length])
    {
      v24 = v23;
      fileExtension = v16->_fileExtension;
      v16->_fileExtension = v24;
    }
    else
    {
      v26 = [v15 lastPathComponent];
      fileExtension = v26;
      if (v26
        && [(NSString *)v26 length]
        && [(NSString *)fileExtension containsString:@"GroupPhotoImage"])
      {
        objc_storeStrong((id *)&v16->_fileExtension, fileExtension);
      }
    }
  }
  return v16;
}

- (void)addLogItems:(id)a3
{
  v4 = NSString;
  if (self->_guid) {
    guid = (__CFString *)self->_guid;
  }
  else {
    guid = @"nil";
  }
  id v6 = a3;
  v7 = [v4 stringWithFormat:@"guid: %@ (on disk)", guid];
  [v6 addObject:v7];

  v8 = [NSString stringWithFormat:@"path: %@ (on disk)", self->_path];
  [v6 addObject:v8];

  v9 = NSString;
  BOOL v10 = (void *)MEMORY[0x1E4F28EE0];
  v11 = [NSNumber numberWithUnsignedLongLong:self->_fileSize.file_size];
  v12 = [v10 stringFromHugeNumber:v11];
  v13 = [v9 stringWithFormat:@"file size: %@ (on disk)", v12];
  [v6 addObject:v13];

  v14 = NSString;
  id v15 = (void *)MEMORY[0x1E4F28EE0];
  v16 = [NSNumber numberWithUnsignedLongLong:self->_fileSize.disk_allocation_size];
  uint64_t v17 = [v15 stringFromHugeNumber:v16];
  v18 = [v14 stringWithFormat:@"disk allocation size: %@", v17];
  [v6 addObject:v18];

  if (self->_isAttachment) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  uint64_t v20 = [NSString stringWithFormat:@"isAttachment: %@", v19];
  [v6 addObject:v20];

  if (self->_isDirectory) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  id v22 = [NSString stringWithFormat:@"isDirectory: %@", v21];
  [v6 addObject:v22];
}

- (id)logString
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(IMDiskSpaceFileInfo *)self addLogItems:v3];
  [v3 sortUsingComparator:&unk_1EF2BF540];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v7 = [v3 componentsJoinedByString:@"\n      "];
  v8 = [v4 stringWithFormat:@"%@%@%@", v6, @"\n      ", v7];

  return v8;
}

- (void)log
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = IMLogHandleForCategory("DiskSpace");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(IMDiskSpaceFileInfo *)self logString];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);
  }
}

- (NSString)path
{
  return self->_path;
}

- (IMFileSize)fileSize
{
  unint64_t disk_allocation_size = self->_fileSize.disk_allocation_size;
  unint64_t file_size = self->_fileSize.file_size;
  result.unint64_t disk_allocation_size = disk_allocation_size;
  result.unint64_t file_size = file_size;
  return result;
}

- (BOOL)isAttachment
{
  return self->_isAttachment;
}

- (BOOL)isSyncAsset
{
  return self->_isSyncAsset;
}

- (BOOL)isPurgableOnDisk
{
  return self->_isPurgableOnDisk;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_guid, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end