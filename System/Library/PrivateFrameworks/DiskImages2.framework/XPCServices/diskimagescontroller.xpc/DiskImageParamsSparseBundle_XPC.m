@interface DiskImageParamsSparseBundle_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsSparseBundle_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  if (v3)
  {
    [v3 backend];
    uint64_t v4 = v6;
    uint64_t v5 = v7;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  [(DiskImageParamsXPC *)self blockSize];
  operator new();
}

- (BOOL)isWritableFormat
{
  return 1;
}

- (unint64_t)numBlocks
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 backend];
    v3 = v8;
  }
  else
  {
    v9 = 0;
  }
  unint64_t v5 = (*(uint64_t (**)(void *))(*(void *)v3 + 40))(v3);
  unint64_t v6 = [(DiskImageParamsXPC *)self blockSize];
  if (v9) {
    sub_100004944(v9);
  }

  return v5 / v6;
}

- (BOOL)isSparseFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end