@interface SKTextureCache
- (BOOL)hasAlpha;
- (BOOL)isPOT;
- (CGSize)pixelSize;
- (CGSize)size;
- (SKTextureCache)init;
- (_opaque_pthread_mutex_t)getLock;
- (char)pixelData;
- (id).cxx_construct;
- (int)state;
- (int)wrapMode;
- (int64_t)filteringMode;
- (shared_ptr<jet_texture>)backingTexture;
- (unsigned)textureFormat;
- (void)_reset;
- (void)dealloc;
- (void)setBackingTexture:(shared_ptr<jet_texture>)a3;
- (void)setFilteringMode:(int64_t)a3;
- (void)setHasAlpha:(BOOL)a3;
- (void)setIsPOT:(BOOL)a3;
- (void)setPixelData:(char *)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setSize:(CGSize)a3;
- (void)setState:(int)a3;
- (void)setTextureFormat:(unsigned int)a3;
- (void)setWrapMode:(int)a3;
@end

@implementation SKTextureCache

- (SKTextureCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKTextureCache;
  v2 = [(SKTextureCache *)&v6 init];
  v3 = v2;
  if (v2)
  {
    CGSize v4 = (CGSize)*MEMORY[0x263F001B0];
    v2->size = (CGSize)*MEMORY[0x263F001B0];
    v2->pixelSize = v4;
    *(_WORD *)&v2->hasAlpha = 1;
    v2->pixelData = 0;
    v2->state = 0;
    pthread_mutex_init(&v2->lock, 0);
    v3->filteringMode = 1;
    *(void *)&v3->_textureFormat = 3;
  }
  return v3;
}

- (void)dealloc
{
  [(SKTextureCache *)self _reset];
  v3.receiver = self;
  v3.super_class = (Class)SKTextureCache;
  [(SKTextureCache *)&v3 dealloc];
}

- (void)_reset
{
  if (self->_backingTexture.__ptr_)
  {
    cntrl = self->_backingTexture.__cntrl_;
    self->_backingTexture.__ptr_ = 0;
    self->_backingTexture.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  pixelData = self->pixelData;
  if (pixelData)
  {
    free(pixelData);
    self->pixelData = 0;
  }
  self->state = 0;
  CGSize v5 = (CGSize)*MEMORY[0x263F001B0];
  self->size = (CGSize)*MEMORY[0x263F001B0];
  self->pixelSize = v5;
  *(_WORD *)&self->hasAlpha = 1;
  pthread_mutex_init(&self->lock, 0);
  self->filteringMode = 1;
  *(void *)&self->_textureFormat = 3;
}

- (_opaque_pthread_mutex_t)getLock
{
  return &self->lock;
}

- (CGSize)size
{
  double width = self->size.width;
  double height = self->size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (BOOL)isPOT
{
  return self->isPOT;
}

- (void)setIsPOT:(BOOL)a3
{
  self->isPOT = a3;
}

- (BOOL)hasAlpha
{
  return self->hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->hasAlpha = a3;
}

- (char)pixelData
{
  return self->pixelData;
}

- (void)setPixelData:(char *)a3
{
  self->pixelData = a3;
}

- (CGSize)pixelSize
{
  double width = self->pixelSize.width;
  double height = self->pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  self->pixelSize = a3;
}

- (int)state
{
  return self->state;
}

- (void)setState:(int)a3
{
  self->state = a3;
}

- (int64_t)filteringMode
{
  return self->filteringMode;
}

- (void)setFilteringMode:(int64_t)a3
{
  self->filteringMode = a3;
}

- (int)wrapMode
{
  return self->wrapMode;
}

- (void)setWrapMode:(int)a3
{
  self->wrapMode = a3;
}

- (unsigned)textureFormat
{
  return self->_textureFormat;
}

- (void)setTextureFormat:(unsigned int)a3
{
  self->_textureFormat = a3;
}

- (shared_ptr<jet_texture>)backingTexture
{
  cntrl = self->_backingTexture.__cntrl_;
  SKTextureCache *v2 = self->_backingTexture.__ptr_;
  v2[1] = (jet_texture *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_texture *)self;
  return result;
}

- (void)setBackingTexture:(shared_ptr<jet_texture>)a3
{
  CGSize v4 = *(jet_texture **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_backingTexture.__cntrl_;
  self->_backingTexture.__ptr_ = v4;
  self->_backingTexture.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_backingTexture.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  return self;
}

@end