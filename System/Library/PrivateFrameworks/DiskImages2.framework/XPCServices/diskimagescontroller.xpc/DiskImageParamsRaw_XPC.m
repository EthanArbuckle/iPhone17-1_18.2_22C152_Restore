@interface DiskImageParamsRaw_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsRaw_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  v4 = v3;
  if (v3)
  {
    [v3 backend];
  }
  else
  {
    uint64_t v9 = 0;
    v10 = 0;
  }
  sub_1001493EC((uint64_t)&v9, &v11);
  sub_1000A8614(&v11, (void **)&v13);
  if (v12) {
    sub_100004944(v12);
  }
  if (v10) {
    sub_100004944(v10);
  }

  if (v13)
  {
    [(DiskImageParamsXPC *)self setBlockSize:*(void *)(v13[3] + 64)];
    v5 = [(DiskImageParamsXPC *)self backendXPC];
    if (v5)
    {
      [v5 backend];
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    [(DiskImageParamsXPC *)self blockSize];
    operator new();
  }
  if (v14) {
    sub_100004944(v14);
  }
  v6 = [(DiskImageParamsXPC *)self backendXPC];
  v7 = v6;
  if (v6)
  {
    [v6 backend];
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  sub_1000A8698(&v11, (void **)&v13);
  if (v12) {
    sub_100004944(v12);
  }

  if (v13)
  {
    sub_100124B70((uint64_t)v13);
    sub_1001101B4((AEAContext_impl **)(v13[7] + 8));
    operator new();
  }
  if (v14) {
    sub_100004944(v14);
  }
  v8 = [(DiskImageParamsXPC *)self backendXPC];
  if (v8)
  {
    [v8 backend];
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  [(DiskImageParamsXPC *)self blockSize];
  operator new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWritableFormat
{
  v2 = [(DiskImageParamsXPC *)self backendXPC];
  v3 = v2;
  if (v2)
  {
    [v2 backend];
  }
  else
  {
    uint64_t v6 = 0;
    v7 = 0;
  }
  sub_1001493EC((uint64_t)&v6, &v8);
  sub_1000A8614(&v8, &v10);
  v4 = v10;
  if (v11) {
    sub_100004944(v11);
  }
  if (v9) {
    sub_100004944(v9);
  }
  if (v7) {
    sub_100004944(v7);
  }

  return v4 == 0;
}

- (unint64_t)numBlocks
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  v4 = v3;
  if (v3)
  {
    [v3 backend];
    v3 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v5 = (*(uint64_t (**)(void *))(*(void *)v3 + 40))(v3);
  unint64_t v6 = [(DiskImageParamsXPC *)self blockSize];
  if (v9) {
    sub_100004944(v9);
  }

  return v5 / v6;
}

@end