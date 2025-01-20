@interface SKMutableTexture
+ (SKMutableTexture)mutableTextureWithSize:(CGSize)size;
- (SKMutableTexture)initWithSize:(CGSize)a3 ioSurfaceBacked:(BOOL)a4 pixelFormat:(int)a5;
- (SKMutableTexture)initWithSize:(CGSize)size;
- (SKMutableTexture)initWithSize:(CGSize)size pixelFormat:(int)format;
- (id)description;
- (shared_ptr<jet_texture>)_backingTexture;
- (void)dealloc;
- (void)modifyPixelDataWithBlock:(void *)block;
@end

@implementation SKMutableTexture

- (SKMutableTexture)initWithSize:(CGSize)a3 ioSurfaceBacked:(BOOL)a4 pixelFormat:(int)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  int v38 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SKMutableTexture;
  v9 = -[SKTexture _initWithGLTextureId:size:](&v37, sel__initWithGLTextureId_size_, 0);
  if (v9)
  {
    v10 = SKGetGlobalDefaults();
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kSKMutableTextureExists"];

    [(SKTexture *)v9 size];
    unsigned int v12 = v11;
    unsigned int v36 = v11;
    [(SKTexture *)v9 size];
    unsigned int v14 = v13;
    if (a5 == 1380410945) {
      char v15 = 4;
    }
    else {
      char v15 = 2;
    }
    if (a5 == 1380411457) {
      char v15 = 3;
    }
    unsigned int valuePtr = v12 << v15;
    unsigned int v35 = v13;
    BOOL v16 = ((v12 << v15) & 0xC) == 0 && a4;
    v9->_ioSurface = 0;
    v9->_textureSize.CGFloat width = width;
    v9->_textureSize.CGFloat height = height;
    v9->_pixelData = 0;
    v9->_pixelDataLength = 0;
    v9->_ioSurfaceBacked = v16;
    v9->_pixelFormat = a5;
    v17 = [(SKTexture *)v9 _textureCache];
    v18 = v17;
    if (a5 == 1380410945)
    {
      uint64_t v19 = 10;
    }
    else if (a5 == 1380411457)
    {
      uint64_t v19 = 0;
    }
    else if (v9->_ioSurfaceBacked)
    {
      uint64_t v19 = 4;
    }
    else
    {
      uint64_t v19 = 3;
    }
    [v17 setTextureFormat:v19];
    size_t v20 = valuePtr * v14;
    int v33 = valuePtr * v14;
    if (v9->_ioSurfaceBacked)
    {
      v9->_ioSurface = 0;
      int v32 = 4;
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFNumberRef v23 = CFNumberCreate(v21, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0ED50], v23);
      CFRelease(v23);
      CFNumberRef v24 = CFNumberCreate(v21, kCFNumberSInt32Type, &v32);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0ED48], v24);
      CFRelease(v24);
      CFNumberRef v25 = CFNumberCreate(v21, kCFNumberSInt32Type, &v36);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF50], v25);
      CFRelease(v25);
      CFNumberRef v26 = CFNumberCreate(v21, kCFNumberSInt32Type, &v35);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EDF8], v26);
      CFRelease(v26);
      CFNumberRef v27 = CFNumberCreate(v21, kCFNumberSInt32Type, &v38);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE48], v27);
      CFRelease(v27);
      CFNumberRef v28 = CFNumberCreate(v21, kCFNumberSInt32Type, &v33);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0ED30], v28);
      CFRelease(v28);
      v9->_ioSurface = IOSurfaceCreate(Mutable);
      CFRelease(Mutable);
      v31.receiver = v9;
      v31.super_class = (Class)SKMutableTexture;
      [(SKTexture *)&v31 setTextureTarget:3553];
    }
    else
    {
      v9->_pixelDataLength = v20;
      v9->_pixelData = malloc_type_malloc(v20, 0x47E5514AuLL);
      v30.receiver = v9;
      v30.super_class = (Class)SKMutableTexture;
      [(SKTexture *)&v30 setTextureTarget:3553];
    }
  }
  return v9;
}

- (SKMutableTexture)initWithSize:(CGSize)size
{
  return -[SKMutableTexture initWithSize:ioSurfaceBacked:pixelFormat:](self, "initWithSize:ioSurfaceBacked:pixelFormat:", 1, 1380401729, size.width, size.height);
}

- (SKMutableTexture)initWithSize:(CGSize)size pixelFormat:(int)format
{
  return -[SKMutableTexture initWithSize:ioSurfaceBacked:pixelFormat:](self, "initWithSize:ioSurfaceBacked:pixelFormat:", 1, *(void *)&format, size.width, size.height);
}

+ (SKMutableTexture)mutableTextureWithSize:(CGSize)size
{
  v3 = -[SKMutableTexture initWithSize:]([SKMutableTexture alloc], "initWithSize:", size.width, size.height);

  return v3;
}

- (void)modifyPixelDataWithBlock:(void *)block
{
  v4 = block;
  v5 = (void (**)(void, void, void))v4;
  if (self->_ioSurfaceBacked)
  {
    IOSurfaceLock(self->_ioSurface, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(self->_ioSurface);
    size_t AllocSize = IOSurfaceGetAllocSize(self->_ioSurface);
    ((void (**)(void, void *, size_t))v5)[2](v5, BaseAddress, AllocSize);
    IOSurfaceUnlock(self->_ioSurface, 0, 0);
  }
  else
  {
    (*((void (**)(void *, void *, unint64_t))v4 + 2))(v4, self->_pixelData, self->_pixelDataLength);
    v8 = [(SKTexture *)self _textureCache];
    uint64_t v9 = 0;
    v10 = 0;
    [v8 setBackingTexture:&v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }
}

- (shared_ptr<jet_texture>)_backingTexture
{
  v4 = v2;
  v5 = [(SKTexture *)self _textureCache];
  v6 = v5;
  if (v5)
  {
    [v5 backingTexture];
  }
  else
  {
    uint64_t v21 = 0;
    v22 = 0;
  }

  if (v21)
  {
    uint64_t v9 = v22;
    void *v4 = v21;
    v4[1] = v9;
  }
  else
  {
    v10 = [(SKTexture *)self _textureCache];
    [v10 pixelSize];
    double v12 = v11;

    double v13 = [(SKTexture *)self _textureCache];
    [v13 pixelSize];
    unsigned int v15 = vcvtpd_u64_f64(v14);

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__SKMutableTexture__backingTexture__block_invoke;
    v18[3] = &unk_263FEA2A8;
    v18[4] = self;
    unsigned int v19 = vcvtpd_u64_f64(v12);
    unsigned int v20 = v15;
    SKCPerformResourceOperation(v18);
    BOOL v16 = [(SKTexture *)self _textureCache];
    v17 = v16;
    if (v16)
    {
      [v16 backingTexture];
    }
    else
    {
      void *v4 = 0;
      v4[1] = 0;
    }

    v7 = (jet_texture *)v22;
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  result.__cntrl_ = v8;
  result.__ptr_ = v7;
  return result;
}

void __35__SKMutableTexture__backingTexture__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 248))
  {
    uint64_t v4 = *a2;
    uint64_t ID = IOSurfaceGetID(*(IOSurfaceRef *)(v3 + 240));
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, void))(*(void *)v4 + 32))(v4, ID, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), 3, 0);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v8, v6);
  }
  uint64_t texture_2d = jet_context::create_texture_2d();
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v8, texture_2d);
}

- (id)description
{
  uint64_t v3 = NSString;
  [(SKTexture *)self pixelSize];
  uint64_t v5 = (int)v4;
  [(SKTexture *)self pixelSize];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<SKMutableTexture> (%d x %d)", v5, (int)v6);
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  pixelData = self->_pixelData;
  if (pixelData)
  {
    free(pixelData);
    self->_pixelData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SKMutableTexture;
  [(SKTexture *)&v5 dealloc];
}

@end