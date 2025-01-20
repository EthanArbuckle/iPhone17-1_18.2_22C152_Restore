@interface CKOperationMMCSRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)chunkingLibraryCorruptionMode;
- (BOOL)insufficientDiskSpaceMode;
- (BOOL)resumableContainerLimpMode;
- (CKOperationMMCSRequestOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkingLibraryCorruptionMode:(BOOL)a3;
- (void)setInsufficientDiskSpaceMode:(BOOL)a3;
- (void)setResumableContainerLimpMode:(BOOL)a3;
@end

@implementation CKOperationMMCSRequestOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_resumableContainerLimpMode(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(v20, v9, v8, @"ResumableContainerLimpMode");
  uint64_t v13 = objc_msgSend_chunkingLibraryCorruptionMode(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v20, v14, v13, @"ChunkingLibraryCorruptionMode");
  uint64_t v18 = objc_msgSend_insufficientDiskSpaceMode(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v20, v19, v18, @"InsufficientDiskSpaceMode");
}

- (CKOperationMMCSRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKOperationMMCSRequestOptions;
  v5 = [(CKOperationMMCSRequestOptions *)&v14 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_resumableContainerLimpMode = objc_msgSend_decodeBoolForKey_(v4, v7, @"ResumableContainerLimpMode", v8);
    v5->_chunkingLibraryCorruptionMode = objc_msgSend_decodeBoolForKey_(v4, v9, @"ChunkingLibraryCorruptionMode", v10);
    v5->_insufficientDiskSpaceMode = objc_msgSend_decodeBoolForKey_(v4, v11, @"InsufficientDiskSpaceMode", v12);
  }

  return v5;
}

- (BOOL)resumableContainerLimpMode
{
  return self->_resumableContainerLimpMode;
}

- (void)setResumableContainerLimpMode:(BOOL)a3
{
  self->_resumableContainerLimpMode = a3;
}

- (BOOL)chunkingLibraryCorruptionMode
{
  return self->_chunkingLibraryCorruptionMode;
}

- (void)setChunkingLibraryCorruptionMode:(BOOL)a3
{
  self->_chunkingLibraryCorruptionMode = a3;
}

- (BOOL)insufficientDiskSpaceMode
{
  return self->_insufficientDiskSpaceMode;
}

- (void)setInsufficientDiskSpaceMode:(BOOL)a3
{
  self->_insufficientDiskSpaceMode = a3;
}

@end