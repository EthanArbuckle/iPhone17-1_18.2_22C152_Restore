@interface CSITextureHelper
- (BOOL)expandIntoBuffer:(uint64_t)a1 error:(void *)a2;
- (void)dealloc;
@end

@implementation CSITextureHelper

- (BOOL)expandIntoBuffer:(uint64_t)a1 error:(void *)a2
{
  if (!a1) {
    return a1 != 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [_CSIRenditionBlockData alloc];
  id v6 = objc_msgSend(objc_msgSend(a2, "map"), "bytes");
  int v7 = *(_DWORD *)(a1 + 44);
  if (v7 <= 1195456543)
  {
    if (v7 == 1095911234)
    {
      uint64_t v8 = 1;
      goto LABEL_14;
    }
    if (v7 == 1195454774)
    {
      uint64_t v8 = 5;
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v8 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  if (v7 == 1195456544)
  {
    uint64_t v8 = 2;
    goto LABEL_14;
  }
  if (v7 == 1380401717)
  {
    uint64_t v8 = 6;
    goto LABEL_14;
  }
  if (v7 != 1380401751) {
    goto LABEL_13;
  }
  uint64_t v8 = 4;
LABEL_14:
  v9 = (unint64_t *)-[_CSIRenditionBlockData initWithBytes:pixelWidth:pixelHeight:sourceRowbytes:pixelFormat:](v5, (uint64_t)v6, *(unsigned int *)(a1 + 32), *(_DWORD *)(a1 + 36), *(void *)(a1 + 24), v8);
  -[_CSIRenditionBlockData setRowBytes:](v9, *(void *)(a1 + 24));
  -[_CSIRenditionBlockData expandCSIBitmapData:fromSlice:makeReadOnly:]((uint64_t)v9, *(const UInt8 **)(a1 + 8), 0, v4, 0, v10, v11, v12);
  if (v9) {
    int v13 = atomic_load(v9 + 5);
  }
  else {
    int v13 = 0;
  }
  *(_DWORD *)(a1 + 40) = v13;

  return a1 != 0;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->colorspaceHint);
  v3.receiver = self;
  v3.super_class = (Class)CSITextureHelper;
  [(CSITextureHelper *)&v3 dealloc];
}

@end