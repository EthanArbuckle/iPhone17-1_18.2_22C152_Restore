@interface NSFileProviderKernelPartialFolderMaterializationInfo
+ (BOOL)supportsSecureCoding;
- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithCoder:(id)a3;
- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithFileName:(id)a3;
- (NSString)fileName;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderKernelPartialFolderMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithFileName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderKernelPartialFolderMaterializationInfo;
  v4 = [(NSFileProviderKernelPartialFolderMaterializationInfo *)&v6 init];
  if (v4) {
    v4->fileName = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderKernelPartialFolderMaterializationInfo;
  [(NSFileProviderKernelPartialFolderMaterializationInfo *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderKernelPartialFolderMaterializationInfo instances should only ever be encoded by XPC" userInfo:0]);
  }
  fileName = self->fileName;

  [a3 encodeObject:fileName forKey:@"filename"];
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"NSFileProviderKernelPartialFolderMaterializationInfo should only ever be decoded by XPC" userInfo:0]);
  }
  self->fileName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
  return self;
}

- (NSString)fileName
{
  return self->fileName;
}

@end