@interface ETImagePreprocessor
- (ETImagePreprocessor)initWithImagePreprocessParams:(id)a3;
- (id).cxx_construct;
- (id)tensorWithCGImage:(CGImage *)a3;
- (id)tensorWithPath:(id)a3;
- (void)dealloc;
- (void)loadSrcBufferWithCGImage:(CGImage *)a3;
- (void)preprocess;
@end

@implementation ETImagePreprocessor

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 1065353216;
  *(void *)((char *)self + 28) = 0;
  *(void *)((char *)self + 20) = 0;
  *((_DWORD *)self + 9) = 0;
  *(void *)((char *)self + 12) = 0x100000000;
  *((_DWORD *)self + 20) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *((void *)self + 7) = _D0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageShape, 0);
  cntrl = self->ctx.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->imageBlob.__cntrl_;
  if (v4)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
}

- (void)loadSrcBufferWithCGImage:(CGImage *)a3
{
  if (a3)
  {
    int Width = CGImageGetWidth(a3);
    int Height = CGImageGetHeight(a3);
    if (Width >= 1)
    {
      unsigned int v7 = Height;
      if (Height >= 1)
      {
        unint64_t v8 = self->nChannels * Width * Height;
        unint64_t currentSrcBufferSize = self->currentSrcBufferSize;
        if (v8 <= currentSrcBufferSize)
        {
          data = self->srcBuffer.data;
        }
        else
        {
          if (currentSrcBufferSize)
          {
            free(self->srcBuffer.data);
            unint64_t currentSrcBufferSize = 2 * self->currentSrcBufferSize;
          }
          if (v8 <= currentSrcBufferSize) {
            unint64_t v10 = currentSrcBufferSize;
          }
          else {
            unint64_t v10 = v8;
          }
          self->unint64_t currentSrcBufferSize = v10;
          data = malloc_type_malloc(v10, 0x2D98B55AuLL);
          self->srcBuffer.data = data;
        }
        size_t v12 = self->bytesPerPixel * Width;
        v13 = CGBitmapContextCreate(data, Width, v7, self->bitsPerComponent, v12, self->colorSpace, 0x4001u);
        v15.size.width = (double)Width;
        v15.size.height = (double)(int)v7;
        v15.origin.x = 0.0;
        v15.origin.y = 0.0;
        CGContextDrawImage(v13, v15, a3);
        self->srcBuffer.height = v7;
        self->srcBuffer.width = Width;
        self->srcBuffer.rowBytes = v12;
        *(_DWORD *)permuteMap = 50331906;
        vImagePermuteChannels_ARGB8888(&self->srcBuffer, &self->srcBuffer, permuteMap, 0);
        CGContextRelease(v13);
      }
    }
  }
}

- (void)preprocess
{
  vImagePixelCount height = self->srcBuffer.height;
  vImagePixelCount width = self->srcBuffer.width;
  size_t rowBytes = self->srcBuffer.rowBytes;
  if (width >= height) {
    vImagePixelCount v5 = self->srcBuffer.height;
  }
  else {
    vImagePixelCount v5 = self->srcBuffer.width;
  }
  v6.data = (char *)self->srcBuffer.data + rowBytes * ((height - v5) >> 1) + self->bytesPerPixel * ((width - v5) >> 1);
  v6.vImagePixelCount height = v5;
  v6.vImagePixelCount width = v5;
  v6.size_t rowBytes = rowBytes;
  vImageScale_ARGB8888(&v6, &self->targetBuffer, 0, 0);
}

- (void)dealloc
{
  CGColorSpaceRelease(self->colorSpace);
  free(self->targetBuffer.data);
  free(self->srcBuffer.data);
  v3.receiver = self;
  v3.super_class = (Class)ETImagePreprocessor;
  [(ETImagePreprocessor *)&v3 dealloc];
}

- (id)tensorWithPath:(id)a3
{
  id v4 = a3;
  vImagePixelCount v5 = CGDataProviderCreateWithFilename((const char *)[v4 UTF8String]);
  if (!v5) {
    Espresso::throw_exception_selector<Espresso::io_error,char const*>("Cannot load image with path %s", [v4 UTF8String]);
  }
  vImage_Buffer v6 = [v4 pathExtension];
  if ([v6 isEqualToString:@"png"])
  {

LABEL_5:
    CGImageRef v9 = CGImageCreateWithPNGDataProvider(v5, 0, 0, kCGRenderingIntentDefault);
    goto LABEL_7;
  }
  unsigned int v7 = [v4 pathExtension];
  int v8 = [v7 isEqualToString:@"PNG"];

  if (v8) {
    goto LABEL_5;
  }
  CGImageRef v9 = CGImageCreateWithJPEGDataProvider(v5, 0, 0, kCGRenderingIntentDefault);
LABEL_7:
  unint64_t v10 = v9;
  v11 = [(ETImagePreprocessor *)self tensorWithCGImage:v9];
  CGImageRelease(v10);

  return v11;
}

- (id)tensorWithCGImage:(CGImage *)a3
{
  [(ETImagePreprocessor *)self loadSrcBufferWithCGImage:a3];
  [(ETImagePreprocessor *)self preprocess];
  ptr = self->ctx.__ptr_;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ETImagePreprocessor_tensorWithCGImage___block_invoke;
  v8[3] = &unk_1E57472C8;
  v8[4] = self;
  Espresso::abstract_context::compute_batch_sync(ptr, v8);
  if (*(void *)(*((void *)self->imageBlob.__ptr_ + 20) + 24))
  {
    vImagePixelCount v5 = [ETDataTensor alloc];
    vImage_Buffer v6 = [(ETDataTensor *)v5 initWithData:*(void *)(*((void *)self->imageBlob.__ptr_ + 20) + 24) type:2 shape:self->imageShape strides:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    vImage_Buffer v6 = 0;
  }

  return v6;
}

void __41__ETImagePreprocessor_tensorWithCGImage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(int **)(v3 + 88);
  long long v7 = *(_OWORD *)(v3 + 160);
  long long v8 = *(_OWORD *)(v3 + 176);
  vImagePixelCount v5 = operator new(0x20uLL);
  unint64_t v10 = v5 + 2;
  v11 = v5 + 2;
  *vImagePixelCount v5 = v7;
  v5[1] = v8;
  __p = v5;
  Espresso::fill_blob_with_images_batch_safe_v2(a2, v4, (const char ***)&__p, *(unsigned int *)(v3 + 120), v6, (__n128 *)(v3 + 8));
  if (__p)
  {
    unint64_t v10 = __p;
    operator delete(__p);
  }
}

- (ETImagePreprocessor)initWithImagePreprocessParams:(id)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ETImagePreprocessor;
  vImagePixelCount v5 = [(ETImagePreprocessor *)&v38 init];
  if (v5)
  {
    int v37 = 0;
    Espresso::create_context(&v37, v32);
    uint64_t v6 = (std::__shared_weak_count *)*((void *)v5 + 14);
    *(_OWORD *)(v5 + 104) = *(_OWORD *)v32;
    *(_OWORD *)v32 = 0uLL;
    if (v6)
    {
      nitro::nitro_function::nitro_function(v6);
      if (*(void *)&v32[8]) {
        nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&v32[8]);
      }
    }
    std::allocate_shared[abi:ne180100]<Espresso::blob_cpu,std::allocator<Espresso::blob_cpu>,std::shared_ptr<Espresso::abstract_context> &,Espresso::compute_path,void>((uint64_t *)v32, (void *)v5 + 13, 0);
    long long v7 = (std::__shared_weak_count *)*((void *)v5 + 12);
    *(_OWORD *)(v5 + 88) = *(_OWORD *)v32;
    if (v7) {
      nitro::nitro_function::nitro_function(v7);
    }
    int v8 = [v4 width];
    int v9 = [v4 height];
    int v10 = [v4 channels];
    uint64_t v36 = 0;
    *(_OWORD *)__p = 0u;
    long long v34 = 0u;
    *(_DWORD *)v32 = v8;
    *(_DWORD *)&v32[4] = v9;
    *(_DWORD *)&v32[8] = v10;
    *(void *)&v32[12] = 0x100000001;
    int v33 = -1;
    uint64_t v11 = *((void *)v5 + 11);
    uint64_t v30 = 0;
    v31 = 0;
    (*(void (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v11 + 16))(v11, v32, &v30);
    if (v31) {
      nitro::nitro_function::nitro_function(v31);
    }
    unint64_t v12 = [v4 channels];
    uint64_t v13 = 4;
    if (v12 <= 2) {
      uint64_t v13 = 1;
    }
    *((void *)v5 + 15) = v13;
    v39[0] = &unk_1EE3AEDD0;
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v4, "channels"));
    v39[1] = v14;
    CGRect v15 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v4, "height"));
    v39[2] = v15;
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v4, "width"));
    v39[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
    v18 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v17;

    v19 = (CFStringRef *)MEMORY[0x1E4F1DC98];
    if (*((void *)v5 + 15) != 4) {
      v19 = (CFStringRef *)MEMORY[0x1E4F1DC00];
    }
    CGColorSpaceRef v20 = CGColorSpaceCreateWithName(*v19);
    *((void *)v5 + 17) = *((void *)v5 + 15);
    *((void *)v5 + 18) = 8;
    *((void *)v5 + 19) = v20;
    v21 = malloc_type_malloc(*((void *)v5 + 17) * [v4 width] * objc_msgSend(v4, "height"), 0x14E4FF2FuLL);
    uint64_t v22 = [v4 height];
    uint64_t v23 = [v4 width];
    uint64_t v24 = *((void *)v5 + 17) * [v4 width];
    *((void *)v5 + 20) = v21;
    *((void *)v5 + 21) = v22;
    *((void *)v5 + 22) = v23;
    *((void *)v5 + 23) = v24;
    *((_DWORD *)v5 + 5) = objc_msgSend(v4, "network_wants_bgr");
    objc_msgSend(v4, "bias_r");
    *((_DWORD *)v5 + 6) = v25;
    objc_msgSend(v4, "bias_g");
    *((_DWORD *)v5 + 7) = v26;
    objc_msgSend(v4, "bias_b");
    *((_DWORD *)v5 + 8) = v27;
    [v4 scale];
    *((_DWORD *)v5 + 2) = v28;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

  return (ETImagePreprocessor *)v5;
}

@end