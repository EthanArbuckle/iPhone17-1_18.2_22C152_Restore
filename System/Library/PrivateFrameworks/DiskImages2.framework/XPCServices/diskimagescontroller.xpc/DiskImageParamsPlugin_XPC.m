@interface DiskImageParamsPlugin_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsPlugin_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
}

- (unint64_t)numBlocks
{
  v2 = [(DiskImageParamsXPC *)self backendXPC];
  unint64_t v3 = (*(uint64_t (**)(void))(*(void *)[v2 pluginHeader] + 16))();

  return v3;
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end