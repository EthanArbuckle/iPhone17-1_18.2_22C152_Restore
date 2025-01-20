@interface CPBitmapStore
- (BOOL)findImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5;
- (BOOL)lockOnRead;
- (BOOL)saveImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5;
- (CGImage)_copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 fillMem:(id)a8 alternateCompletion:(id)a9;
- (CGImage)copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 draw:(id)a8;
- (CGImage)copyImageForKey:(id)a3;
- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4;
- (CPBitmapStore)initWithPath:(id)a3 version:(int)a4;
- (id)_versionPath;
- (id)allGroups;
- (id)cacheNumberForKey:(id)a3;
- (id)imageNameForKey:(id)a3 inGroup:(id)a4;
- (id)imagePath;
- (int)setVersion:(int)a3;
- (int)version;
- (unint64_t)cacheItemLimit;
- (unint64_t)imageCount;
- (unsigned)memContentOffset;
- (void)dealloc;
- (void)openAndMmap:(id)a3 withInfo:(_img *)a4;
- (void)purge;
- (void)removeImagesInGroups:(id)a3;
- (void)removeImagesInGroups:(id)a3 completion:(id)a4;
- (void)setCacheItemLimit:(unint64_t)a3;
- (void)setLockOnRead:(BOOL)a3;
- (void)storeGrayscaleImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8;
- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 formatColor:(CGColor *)a7 scale:(double)a8 data:(id)a9;
- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 data:(id)a8;
- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8;
- (void)storeImageForKey:(id)a3 inGroup:(id)a4 opaque:(BOOL)a5 image:(CGImage *)a6;
@end

@implementation CPBitmapStore

- (CPBitmapStore)initWithPath:(id)a3 version:(int)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CPBitmapStore;
  v6 = [(CPBitmapStore *)&v14 init];
  if (v6)
  {
    v7 = (NSString *)a3;
    v6->_path = v7;
    if (access([(NSString *)v7 fileSystemRepresentation], 4)) {
      mkpath_np((const char *)objc_msgSend(-[CPBitmapStore imagePath](v6, "imagePath"), "fileSystemRepresentation"), 0x1EDu);
    }
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v6->_cache = v8;
    [(NSCache *)v8 setName:@"com.apple.cpbitmapstore"];
    [(NSCache *)v6->_cache setCountLimit:40];
    v9 = dispatch_queue_create("SerialQueueRemoveImagesBackground", 0);
    v6->_serialQueueRemoveImagesBackground = (OS_dispatch_queue *)v9;
    global_queue = dispatch_get_global_queue(9, 0);
    dispatch_set_target_queue(v9, global_queue);
    v11 = dispatch_queue_create("SerialQueueRemoveImagesDefault", 0);
    v6->_serialQueueRemoveImagesDefault = (OS_dispatch_queue *)v11;
    v12 = dispatch_get_global_queue(21, 0);
    dispatch_set_target_queue(v11, v12);
    v6->_version = a4;
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_serialQueueRemoveImagesBackground);
  dispatch_release((dispatch_object_t)self->_serialQueueRemoveImagesDefault);
  v3.receiver = self;
  v3.super_class = (Class)CPBitmapStore;
  [(CPBitmapStore *)&v3 dealloc];
}

- (unint64_t)cacheItemLimit
{
  return [(NSCache *)self->_cache countLimit];
}

- (void)setCacheItemLimit:(unint64_t)a3
{
}

- (id)imageNameForKey:(id)a3 inGroup:(id)a4
{
  id result = malloc_type_malloc(0x32uLL, 0xE882C7F9uLL);
  if (result)
  {
    v7 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", result, snprintf((char *)result, 0x32uLL, "%lu%lu", objc_msgSend(a4, "hash"), objc_msgSend(a3, "hash")), 1, 1);
    return v7;
  }
  return result;
}

- (id)cacheNumberForKey:(id)a3
{
  objc_super v3 = NSNumber;
  uint64_t v4 = [a3 hash];
  return (id)[v3 numberWithUnsignedLong:v4];
}

- (BOOL)findImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5
{
  a5->var0 = [(CPBitmapStore *)self imageNameForKey:a3 inGroup:a4];
  return 1;
}

- (BOOL)saveImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5
{
  return 1;
}

- (void)openAndMmap:(id)a3 withInfo:(_img *)a4
{
  int v5 = open((const char *)[a3 fileSystemRepresentation], 256);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    memset(&v17, 0, sizeof(v17));
    if (fstat(v5, &v17) < 0
      || ((v17.st_mode & 0xF000) == 0x8000 ? (BOOL v7 = v17.st_nlink > 1u) : (BOOL v7 = 1),
          v7 || (v8 = (unsigned int *)mmap(0, v17.st_size, 1, 1, v6, 0), v8 == (unsigned int *)-1)))
    {
      close(v6);
    }
    else
    {
      v9 = v8;
      size_t st_size = v17.st_size;
      close(v6);
      if (v9)
      {
        if (st_size >= 0x30 && *v9 == 1129333331 && v9[1] == 1)
        {
          a4->var1 = v9[2];
          uint64_t v11 = *(void *)(v9 + 3);
          *(void *)&long long v12 = v11;
          *((void *)&v12 + 1) = HIDWORD(v11);
          *(_OWORD *)&a4->var2 = v12;
          a4->var4 = v9[5];
          a4->var5 = *((unsigned char *)v9 + 24);
          a4->var6[0] = *((unsigned char *)v9 + 25);
          a4->var6[1] = *((unsigned char *)v9 + 26);
          a4->var6[2] = *((unsigned char *)v9 + 27);
          a4->var6[3] = *((unsigned char *)v9 + 28);
          uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
          if (a4->var4 == AlignedBytesPerRow)
          {
            unint64_t v15 = (*MEMORY[0x1E4F14B00] + a4->var3 * AlignedBytesPerRow + 47) & -*MEMORY[0x1E4F14B00];
            if (a4->var1 == v15 && v15 == st_size) {
              return v9 + 12;
            }
          }
        }
        munmap(v9, st_size);
      }
    }
  }
  return 0;
}

- (unsigned)memContentOffset
{
  return 48;
}

- (CGImage)copyImageForKey:(id)a3
{
  return 0;
}

- (id)allGroups
{
  return (id)[MEMORY[0x1E4F1CA80] set];
}

- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4
{
  id v7 = -[CPBitmapStore cacheNumberForKey:](self, "cacheNumberForKey:");
  v8 = [(NSCache *)self->_cache objectForKey:v7];
  if (v8)
  {
    return CGImageRetain(v8);
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    *(_OWORD *)v13 = 0u;
    if (![(CPBitmapStore *)self findImageWithKey:a3 inGroup:a4 andInfo:v13]) {
      return 0;
    }
    id v10 = [(CPBitmapStore *)self imagePath];
    CGImageRef image_with_memory = -[CPBitmapStore openAndMmap:withInfo:](self, "openAndMmap:withInfo:", [v10 stringByAppendingPathComponent:v13[0]], v13);
    if (image_with_memory)
    {
      if ([(CPBitmapStore *)self lockOnRead]) {
        mlock((char *)image_with_memory - 48, v13[1]);
      }
      unsigned int v12 = [(CPBitmapStore *)self memContentOffset];
      v13[1] -= v12;
      CGImageRef image_with_memory = create_image_with_memory(image_with_memory, (uint64_t)v13, [(CPBitmapStore *)self memContentOffset]);
      if (image_with_memory) {
        [(NSCache *)self->_cache setObject:image_with_memory forKey:v7];
      }
    }
    return image_with_memory;
  }
}

- (CGImage)_copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 fillMem:(id)a8 alternateCompletion:(id)a9
{
  if (a7 == 0.0) {
    return 0;
  }
  long long v34 = 0u;
  *(void *)&long long v33 = vcvtpd_u64_f64(a5.width * a7);
  *((void *)&v33 + 1) = vcvtpd_u64_f64(a5.height * a7);
  BYTE8(v34) = a6;
  uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  uint64_t v15 = AlignedBytesPerRow * *((void *)&v33 + 1);
  unsigned int v16 = [(CPBitmapStore *)self memContentOffset];
  uint64_t v17 = (v15 + v16 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
  v32[1] = v17;
  *(_DWORD *)((char *)&v34 + 9) = 0;
  id v18 = [(CPBitmapStore *)self imagePath];
  v19 = strdup((const char *)objc_msgSend((id)objc_msgSend(v18, "stringByAppendingPathComponent:", @"tmp.XXXXXXXX"), "fileSystemRepresentation"));
  if (!v19) {
    return 0;
  }
  v20 = (std::__fs::filesystem::path *)v19;
  int v21 = mkstemp(v19);
  if (v21 < 0) {
    goto LABEL_14;
  }
  int v22 = v21;
  if (fchmod(v21, 0x180u) < 0 || ftruncate(v22, v17) < 0)
  {
    close(v22);
    goto LABEL_13;
  }
  v23 = mmap(0, v17, 3, 1, v22, 0);
  close(v22);
  if (v23 == (void *)-1)
  {
LABEL_13:
    unlink((const char *)v20);
    goto LABEL_14;
  }
  if (!v23)
  {
LABEL_14:
    free(v20);
    return 0;
  }
  (*((void (**)(id, void *, size_t *))a8 + 2))(a8, v23, v32);
  v32[0] = (size_t)[(CPBitmapStore *)self imageNameForKey:a3 inGroup:a4];
  munmap(v23, v32[1]);
  v24 = (void *)[v18 stringByAppendingPathComponent:v32[0]];
  v25 = (const std::__fs::filesystem::path *)[v24 fileSystemRepresentation];
  rename(v20, v25, v26);
  int v28 = v27;
  free(v20);
  if (v28 < 0
    || ![(CPBitmapStore *)self saveImageWithKey:a3 inGroup:a4 andInfo:v32])
  {
    return 0;
  }
  if (a9)
  {
    (*((void (**)(id))a9 + 2))(a9);
    return 0;
  }
  CGImageRef image_with_memory = [(CPBitmapStore *)self openAndMmap:v24 withInfo:v32];
  if (image_with_memory)
  {
    unsigned int v31 = [(CPBitmapStore *)self memContentOffset];
    v32[1] -= v31;
    CGImageRef image_with_memory = create_image_with_memory(image_with_memory, (uint64_t)v32, [(CPBitmapStore *)self memContentOffset]);
    if (image_with_memory) {
      [(NSCache *)self->_cache setObject:image_with_memory forKey:[(CPBitmapStore *)self cacheNumberForKey:a3]];
    }
  }
  return image_with_memory;
}

- (CGImage)copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 draw:(id)a8
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__CPBitmapStore_copyAndStoreImageForKey_inGroup_withSize_opaque_scale_draw___block_invoke;
  v9[3] = &unk_1E56693F0;
  *(double *)&v9[6] = a7;
  v9[4] = self;
  v9[5] = a8;
  return [(CPBitmapStore *)self _copyAndStoreImageForKey:a3 inGroup:a4 withSize:a6 format:v9 scale:0 fillMem:a5.width alternateCompletion:a5.height];
}

void __76__CPBitmapStore_copyAndStoreImageForKey_inGroup_withSize_opaque_scale_draw___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) memContentOffset];
  if (v6 >= 1)
  {
    *(void *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(unsigned char *)(a2 + 24) = *(unsigned char *)(a3 + 40);
    *(unsigned char *)(a2 + 25) = *(unsigned char *)(a3 + 41);
    *(unsigned char *)(a2 + 26) = *(unsigned char *)(a3 + 42);
    *(unsigned char *)(a2 + 27) = *(unsigned char *)(a3 + 43);
    *(unsigned char *)(a2 + 28) = *(unsigned char *)(a3 + 44);
  }
  double v7 = *(double *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  unsigned int v9 = *(unsigned __int8 *)(a3 + 40);
  if (v9 < 3)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_7:
    uint64_t v11 = DeviceRGB;
    unsigned int v9 = *(unsigned __int8 *)(a3 + 40);
    goto LABEL_8;
  }
  if (v9 - 3 < 2)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_8:
  if (v9 > 5)
  {
    size_t v12 = 0;
  }
  else
  {
    if (v9 == 2)
    {
      size_t v13 = *(void *)(a3 + 32);
      size_t v12 = 5;
LABEL_17:
      uint32_t v14 = 4102;
      goto LABEL_20;
    }
    size_t v12 = 8;
  }
  size_t v13 = *(void *)(a3 + 32);
  uint32_t v14 = 8194;
  switch(v9)
  {
    case 0u:
      break;
    case 1u:
      uint32_t v14 = 8198;
      break;
    case 2u:
      goto LABEL_17;
    case 3u:
      uint32_t v14 = 1;
      break;
    case 5u:
      uint32_t v14 = 7;
      break;
    default:
      uint32_t v14 = 0;
      break;
  }
LABEL_20:
  uint64_t v15 = CGBitmapContextCreate((void *)(a2 + v6), *(void *)(a3 + 16), *(void *)(a3 + 24), v12, v13, v11, v14);
  CGColorSpaceRelease(v11);
  CGContextTranslateCTM(v15, 0.0, (double)*(unint64_t *)(a3 + 24));
  CGContextScaleCTM(v15, v7, -v7);
  CGAffineTransformMakeScale(&v16, v7, -v7);
  CGContextSetBaseCTM();
  (*(void (**)(uint64_t, CGContext *))(v8 + 16))(v8, v15);
  CGContextRelease(v15);
}

- (void)storeImageForKey:(id)a3 inGroup:(id)a4 opaque:(BOOL)a5 image:(CGImage *)a6
{
  if (a6)
  {
    BOOL v7 = a5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    size_t v13[2] = __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke;
    v13[3] = &unk_1E5669418;
    v13[4] = self;
    v13[5] = a6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke_2;
    v12[3] = &unk_1E5669058;
    v12[5] = a3;
    v12[6] = a6;
    v12[4] = self;
    double Width = (double)CGImageGetWidth(a6);
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, v7, v13, v12, Width, (double)CGImageGetHeight(a6), 1.0);
  }
}

void __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) memContentOffset];
  if (v6 >= 1)
  {
    *(void *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(unsigned char *)(a2 + 24) = *(unsigned char *)(a3 + 40);
    *(unsigned char *)(a2 + 25) = *(unsigned char *)(a3 + 41);
    *(unsigned char *)(a2 + 26) = *(unsigned char *)(a3 + 42);
    *(unsigned char *)(a2 + 27) = *(unsigned char *)(a3 + 43);
    *(unsigned char *)(a2 + 28) = *(unsigned char *)(a3 + 44);
  }
  DataProvider = CGImageGetDataProvider(*(CGImageRef *)(a1 + 40));
  if (DataProvider)
  {
    CFDataRef v8 = CGDataProviderCopyData(DataProvider);
    if (v8)
    {
      CFDataRef v9 = v8;
      id v10 = (void *)(a2 + v6);
      BytePtr = CFDataGetBytePtr(v8);
      size_t Length = CFDataGetLength(v9);
      memcpy(v10, BytePtr, Length);
      CFRelease(v9);
    }
  }
}

uint64_t __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) cacheNumberForKey:*(void *)(a1 + 40)];
  return [v1 setObject:v2 forKey:v3];
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8
{
  if (a8)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__CPBitmapStore_storeImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke;
    v8[3] = &unk_1E5669440;
    v8[4] = self;
    v8[5] = a8;
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, a6, v8, &__block_literal_global_7, a5.width, a5.height, a7);
  }
}

void *__73__CPBitmapStore_storeImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) memContentOffset];
  if (v6 >= 1)
  {
    *(void *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(unsigned char *)(a2 + 24) = *(unsigned char *)(a3 + 40);
    *(unsigned char *)(a2 + 25) = *(unsigned char *)(a3 + 41);
    *(unsigned char *)(a2 + 26) = *(unsigned char *)(a3 + 42);
    *(unsigned char *)(a2 + 27) = *(unsigned char *)(a3 + 43);
    *(unsigned char *)(a2 + 28) = *(unsigned char *)(a3 + 44);
  }
  BOOL v7 = (void *)(a2 + v6);
  CFDataRef v8 = (const void *)[*(id *)(a1 + 40) bytes];
  size_t v9 = [*(id *)(a1 + 40) length];
  return memcpy(v7, v8, v9);
}

- (void)storeGrayscaleImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8
{
  if (a8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__CPBitmapStore_storeGrayscaleImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke;
    v9[3] = &unk_1E5669440;
    v9[4] = self;
    v9[5] = a8;
    if (a6) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 3;
    }
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, v8, v9, &__block_literal_global_18, a5.width, a5.height, a7);
  }
}

unint64_t __82__CPBitmapStore_storeGrayscaleImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) memContentOffset];
  if (v6 >= 1)
  {
    *(void *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(unsigned char *)(a2 + 24) = *(unsigned char *)(a3 + 40);
    *(unsigned char *)(a2 + 25) = *(unsigned char *)(a3 + 41);
    *(unsigned char *)(a2 + 26) = *(unsigned char *)(a3 + 42);
    *(unsigned char *)(a2 + 27) = *(unsigned char *)(a3 + 43);
    *(unsigned char *)(a2 + 28) = *(unsigned char *)(a3 + 44);
  }
  uint64_t v7 = 4 * *(void *)(a3 + 16);
  int AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  uint64_t v9 = 2 * *(void *)(a3 + 16);
  int v10 = CGBitmapGetAlignedBytesPerRow();
  uint64_t v11 = [*(id *)(a1 + 40) bytes];
  unint64_t result = [*(id *)(a1 + 40) length];
  if (result >= 4)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)(a3 + 16);
    do
    {
      if (v15 + 1 == v16) {
        uint64_t v17 = (unsigned __int16)((unint64_t)(AlignedBytesPerRow - v7) >> 2);
      }
      else {
        uint64_t v17 = 0;
      }
      uint64_t v18 = v13 + v17;
      __int16 v19 = *(_WORD *)(v11 + 4 * v13 + 2);
      if (v15 + 1 == v16) {
        uint64_t v20 = (unsigned __int16)((unint64_t)(v10 - v9) >> 1);
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v21 = v14 + v20;
      *(_WORD *)(a2 + v6 + 2 * v14) = v19;
      if (v15 + 1 == v16) {
        uint64_t v15 = 0;
      }
      else {
        ++v15;
      }
      uint64_t v14 = v21 + 1;
      uint64_t v13 = v18 + 1;
    }
    while (v18 + 1 < result >> 2);
  }
  return result;
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 data:(id)a8
{
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 formatColor:(CGColor *)a7 scale:(double)a8 data:(id)a9
{
  if (a9)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__CPBitmapStore_storeImageDataForKey_inGroup_withSize_format_formatColor_scale_data___block_invoke;
    v9[3] = &unk_1E5669468;
    v9[5] = a9;
    void v9[6] = a7;
    v9[4] = self;
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, a6, v9, &__block_literal_global_20, a5.width, a5.height, a8);
  }
}

uint64_t __85__CPBitmapStore_storeImageDataForKey_inGroup_withSize_format_formatColor_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) memContentOffset];
  if (v6 >= 1)
  {
    if (a3)
    {
      uint64_t v7 = *(CGColor **)(a1 + 48);
      if (v7)
      {
        if (*(unsigned char *)(a3 + 40) == 5)
        {
          size_t NumberOfComponents = CGColorGetNumberOfComponents(*(CGColorRef *)(a1 + 48));
          Components = CGColorGetComponents(v7);
          if (NumberOfComponents)
          {
            int v10 = (unsigned char *)(a3 + 41);
            do
            {
              double v11 = *Components++;
              *v10++ = (int)(v11 * 255.0);
              --NumberOfComponents;
            }
            while (NumberOfComponents);
          }
        }
      }
    }
    *(void *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(unsigned char *)(a2 + 24) = *(unsigned char *)(a3 + 40);
    *(unsigned char *)(a2 + 25) = *(unsigned char *)(a3 + 41);
    *(unsigned char *)(a2 + 26) = *(unsigned char *)(a3 + 42);
    *(unsigned char *)(a2 + 27) = *(unsigned char *)(a3 + 43);
    *(unsigned char *)(a2 + 28) = *(unsigned char *)(a3 + 44);
  }
  size_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = [v12 length];
  return [v12 getBytes:a2 + v6 length:v13];
}

- (void)removeImagesInGroups:(id)a3
{
}

- (void)removeImagesInGroups:(id)a3 completion:(id)a4
{
  if ([a3 count])
  {
    id v7 = [(CPBitmapStore *)self imagePath];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", v7, 0);
    uint64_t v9 = [a4 copy];
    serialQueueRemoveImagesBackground = self->_serialQueueRemoveImagesBackground;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke;
    block[3] = &unk_1E56694B8;
    block[4] = a3;
    block[5] = v8;
    block[6] = v7;
    block[7] = self;
    block[8] = v9;
    dispatch_async(serialQueueRemoveImagesBackground, block);
  }
}

void __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  size_t v32[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_2;
  v32[3] = &unk_1E5669490;
  v32[4] = v2;
  [v3 enumerateObjectsUsingBlock:v32];
  uint64_t v4 = dispatch_group_create();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v5;
        int v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v7 = [v2 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v2);
              }
              double v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "hasPrefix:", v11))
              {
                char v12 = [v6 isAbsolutePath];
                uint64_t v13 = v6;
                if ((v12 & 1) == 0) {
                  uint64_t v13 = (void *)[*(id *)(a1 + 48) stringByAppendingPathComponent:v6];
                }
                unlink((const char *)[v13 fileSystemRepresentation]);
                uint64_t v14 = objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "substringFromIndex:", objc_msgSend(v11, "length"));
                uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v14, "UTF8String"), 0, 10));
                uint64_t v16 = *(void *)(a1 + 56);
                uint64_t v17 = *(NSObject **)(v16 + 56);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_3;
                block[3] = &unk_1E5668FF8;
                block[4] = v16;
                block[5] = v15;
                dispatch_group_async(v4, v17, block);
              }
            }
            uint64_t v8 = [v2 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v8);
        }
        uint64_t v5 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v21);
  }
  uint64_t v18 = *(void **)(a1 + 64);
  if (v18)
  {
    dispatch_group_notify(v4, *(dispatch_queue_t *)(*(void *)(a1 + 56) + 48), v18);
  }
  dispatch_release(v4);
}

char *__49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  unint64_t result = (char *)malloc_type_malloc(0x32uLL, 0x9A08B503uLL);
  if (result)
  {
    unint64_t result = (char *)objc_msgSend(*(id *)(a1 + 32), "addObject:", (id)objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", result, snprintf(result, 0x32uLL, "%lu", objc_msgSend(a2, "hash")), 1, 1));
    *a3 = 0;
  }
  return result;
}

uint64_t __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)imagePath
{
  id result = self->_imagePath;
  if (!result)
  {
    id result = [(NSString *)self->_path stringByAppendingPathComponent:@"images"];
    self->_imagePath = (NSString *)result;
  }
  return result;
}

- (unint64_t)imageCount
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "subpathsAtPath:", -[CPBitmapStore imagePath](self, "imagePath"));
  return [v2 count];
}

- (void)purge
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  path = self->_path;
  [v3 removeItemAtPath:path error:0];
}

- (id)_versionPath
{
  id result = self->_versionPath;
  if (!result)
  {
    id result = [(NSString *)self->_path stringByAppendingPathComponent:@"version"];
    self->_versionPath = (NSString *)result;
  }
  return result;
}

- (int)version
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", -[CPBitmapStore _versionPath](self, "_versionPath")))return -1; {
  uint64_t v5 = 0;
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:", -[CPBitmapStore _versionPath](self, "_versionPath"), 4, &v5);
  if (v5) {
    return -1;
  }
  int result = [v3 intValue];
  self->_version = result;
  return result;
}

- (int)setVersion:(int)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", *(void *)&a3), "stringValue"), "writeToFile:atomically:encoding:error:", -[CPBitmapStore _versionPath](self, "_versionPath"), 1, 4, 0);
  return [(CPBitmapStore *)self version];
}

- (BOOL)lockOnRead
{
  return self->_lockOnRead;
}

- (void)setLockOnRead:(BOOL)a3
{
  self->_lockOnRead = a3;
}

@end