@interface FSStatFSResult
+ (BOOL)supportsSecureCoding;
- (FSStatFSResult)initWithCoder:(id)a3;
- (FSStatFSResult)initWithFSTypeName:(id)a3;
- (NSString)fileSystemTypeName;
- (id)description;
- (int64_t)availableBlocks;
- (int64_t)availableBytes;
- (int64_t)blockSize;
- (int64_t)fileSystemSubType;
- (int64_t)freeBlocks;
- (int64_t)freeBytes;
- (int64_t)freeFiles;
- (int64_t)ioSize;
- (int64_t)totalBlocks;
- (int64_t)totalBytes;
- (int64_t)totalFiles;
- (int64_t)usedBlocks;
- (int64_t)usedBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableBlocks:(int64_t)a3;
- (void)setAvailableBytes:(int64_t)a3;
- (void)setBlockSize:(int64_t)a3;
- (void)setFileSystemSubType:(int64_t)a3;
- (void)setFreeBlocks:(int64_t)a3;
- (void)setFreeBytes:(int64_t)a3;
- (void)setFreeFiles:(int64_t)a3;
- (void)setIoSize:(int64_t)a3;
- (void)setTotalBlocks:(int64_t)a3;
- (void)setTotalBytes:(int64_t)a3;
- (void)setTotalFiles:(int64_t)a3;
- (void)setUsedBlocks:(int64_t)a3;
- (void)setUsedBytes:(int64_t)a3;
@end

@implementation FSStatFSResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6[0] = [(FSStatFSResult *)self blockSize];
  v6[1] = [(FSStatFSResult *)self ioSize];
  v6[2] = [(FSStatFSResult *)self totalBlocks];
  v6[3] = [(FSStatFSResult *)self availableBlocks];
  v6[4] = [(FSStatFSResult *)self freeBlocks];
  v6[5] = [(FSStatFSResult *)self totalBytes];
  v6[6] = [(FSStatFSResult *)self availableBytes];
  v6[7] = [(FSStatFSResult *)self freeBytes];
  v6[8] = [(FSStatFSResult *)self totalFiles];
  v6[9] = [(FSStatFSResult *)self freeFiles];
  v6[10] = [(FSStatFSResult *)self fileSystemSubType];
  [v4 encodeBytes:v6 length:88 forKey:@"FSStatFSResult"];
  v5 = [(FSStatFSResult *)self fileSystemTypeName];
  [v4 encodeObject:v5 forKey:@"FSStatFSResult.fsTypeName"];
}

- (FSStatFSResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FSStatFSResult;
  uint64_t v17 = 0;
  v5 = [(FSStatFSResult *)&v16 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = v4;
  uint64_t v7 = [v6 decodeBytesForKey:@"FSStatFSResult" returnedLength:&v17];
  v8 = 0;
  if (v7 && v17 == 88)
  {
    long long v9 = *(_OWORD *)v7;
    *(_OWORD *)(v5 + 8) = *(_OWORD *)v7;
    uint64_t v10 = *(void *)(v7 + 16);
    *((void *)v5 + 3) = v10;
    uint64_t v11 = *(void *)(v7 + 24);
    *((void *)v5 + 4) = v11;
    uint64_t v12 = *(void *)(v7 + 32);
    *((void *)v5 + 5) = v12;
    *((void *)v5 + 13) = *(unsigned int *)(v7 + 80);
    *((void *)v5 + 7) = v10 * v9;
    *((void *)v5 + 8) = v11 * v9;
    *((void *)v5 + 9) = v12 * v9;
    *(_OWORD *)(v5 + 88) = *(_OWORD *)(v7 + 64);
    uint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"FSStatFSResult.fsTypeName"];
    v14 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v13;

LABEL_5:
    v8 = v5;
  }

  return v8;
}

- (FSStatFSResult)initWithFSTypeName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSStatFSResult;
  id v6 = [(FSStatFSResult *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileSystemTypeName, a3);
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"FSKitStatFSResult:totalBytes(%ld):availableBytes(%ld):freeBytes(%ld):totalFiles(%ld):freeFiles(%ld)", -[FSStatFSResult totalBytes](self, "totalBytes"), -[FSStatFSResult availableBytes](self, "availableBytes"), -[FSStatFSResult freeBytes](self, "freeBytes"), -[FSStatFSResult totalFiles](self, "totalFiles"), -[FSStatFSResult freeFiles](self, "freeFiles"));
}

- (int64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(int64_t)a3
{
  self->_blockSize = a3;
}

- (int64_t)ioSize
{
  return self->_ioSize;
}

- (void)setIoSize:(int64_t)a3
{
  self->_ioSize = a3;
}

- (int64_t)totalBlocks
{
  return self->_totalBlocks;
}

- (void)setTotalBlocks:(int64_t)a3
{
  self->_totalBlocks = a3;
}

- (int64_t)availableBlocks
{
  return self->_availableBlocks;
}

- (void)setAvailableBlocks:(int64_t)a3
{
  self->_availableBlocks = a3;
}

- (int64_t)freeBlocks
{
  return self->_freeBlocks;
}

- (void)setFreeBlocks:(int64_t)a3
{
  self->_freeBlocks = a3;
}

- (int64_t)usedBlocks
{
  return self->_usedBlocks;
}

- (void)setUsedBlocks:(int64_t)a3
{
  self->_usedBlocks = a3;
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(int64_t)a3
{
  self->_totalBytes = a3;
}

- (int64_t)availableBytes
{
  return self->_availableBytes;
}

- (void)setAvailableBytes:(int64_t)a3
{
  self->_availableBytes = a3;
}

- (int64_t)freeBytes
{
  return self->_freeBytes;
}

- (void)setFreeBytes:(int64_t)a3
{
  self->_freeBytes = a3;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (void)setUsedBytes:(int64_t)a3
{
  self->_usedBytes = a3;
}

- (int64_t)totalFiles
{
  return self->_totalFiles;
}

- (void)setTotalFiles:(int64_t)a3
{
  self->_totalFiles = a3;
}

- (int64_t)freeFiles
{
  return self->_freeFiles;
}

- (void)setFreeFiles:(int64_t)a3
{
  self->_freeFiles = a3;
}

- (int64_t)fileSystemSubType
{
  return self->_fileSystemSubType;
}

- (void)setFileSystemSubType:(int64_t)a3
{
  self->_fileSystemSubType = a3;
}

- (NSString)fileSystemTypeName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
}

@end