@interface IMDirectoryContentsSizes
- (IMDirectoryContentsSizes)initWithDirectoryContents:(id)a3;
- (IMFileSize)totalAttachmentSize;
- (IMFileSize)totalPurgableSize;
- (IMFileSize)totalSize;
@end

@implementation IMDirectoryContentsSizes

- (IMDirectoryContentsSizes)initWithDirectoryContents:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IMDirectoryContentsSizes;
  v5 = [(IMDirectoryContentsSizes *)&v38 init];
  if (v5)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v6 = objc_msgSend(v4, "fileInfoMap", 0);
    v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (([v12 isDirectory] & 1) == 0)
          {
            uint64_t v13 = [v12 fileSize];
            unint64_t v15 = v5->_totalSize.disk_allocation_size + v14;
            v5->_totalSize.file_size += v13;
            v5->_totalSize.disk_allocation_size = v15;
            if ([v12 isAttachment])
            {
              uint64_t v16 = [v12 fileSize];
              unint64_t v18 = v5->_totalAttachmentSize.disk_allocation_size + v17;
              v5->_totalAttachmentSize.file_size += v16;
              v5->_totalAttachmentSize.disk_allocation_size = v18;
            }
            if ([v12 isPurgableOnDisk])
            {
              uint64_t v19 = [v12 fileSize];
              unint64_t v21 = v5->_totalPurgableSize.disk_allocation_size + v20;
              v5->_totalPurgableSize.file_size += v19;
              v5->_totalPurgableSize.disk_allocation_size = v21;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v9);
    }

    v22 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = [v4 fileInfoMap];
      uint64_t v24 = [v23 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = v24;
      _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Total Item Count: %ld", buf, 0xCu);
    }
    v25 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(MEMORY[0x1E4F28EE0], "stringFromFileSize:", v5->_totalSize.file_size, v5->_totalSize.disk_allocation_size);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v26;
      _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Total Size: %@", buf, 0xCu);
    }
    v27 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(MEMORY[0x1E4F28EE0], "stringFromFileSize:", v5->_totalPurgableSize.file_size, v5->_totalPurgableSize.disk_allocation_size);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v28;
      _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "Total Purgable Size: %@", buf, 0xCu);
    }
    v29 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(MEMORY[0x1E4F28EE0], "stringFromFileSize:", v5->_totalSize.file_size - v5->_totalPurgableSize.file_size, v5->_totalSize.disk_allocation_size - v5->_totalPurgableSize.disk_allocation_size);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v30;
      _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Total Non-Purgable Size: %@", buf, 0xCu);
    }
    v31 = IMLogHandleForCategory("DiskSpace");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend(MEMORY[0x1E4F28EE0], "stringFromFileSize:", v5->_totalAttachmentSize.file_size, v5->_totalAttachmentSize.disk_allocation_size);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v32;
      _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "Total Attachment Size: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (IMFileSize)totalSize
{
  unint64_t disk_allocation_size = self->_totalSize.disk_allocation_size;
  unint64_t file_size = self->_totalSize.file_size;
  result.unint64_t disk_allocation_size = disk_allocation_size;
  result.unint64_t file_size = file_size;
  return result;
}

- (IMFileSize)totalPurgableSize
{
  unint64_t disk_allocation_size = self->_totalPurgableSize.disk_allocation_size;
  unint64_t file_size = self->_totalPurgableSize.file_size;
  result.unint64_t disk_allocation_size = disk_allocation_size;
  result.unint64_t file_size = file_size;
  return result;
}

- (IMFileSize)totalAttachmentSize
{
  unint64_t disk_allocation_size = self->_totalAttachmentSize.disk_allocation_size;
  unint64_t file_size = self->_totalAttachmentSize.file_size;
  result.unint64_t disk_allocation_size = disk_allocation_size;
  result.unint64_t file_size = file_size;
  return result;
}

@end