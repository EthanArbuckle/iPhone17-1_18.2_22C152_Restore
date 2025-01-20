@interface _CUTextureLink
- (id)bufferAllocator;
- (id)namedTexture;
- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5;
- (id)provideTextureInfo;
- (void)dealloc;
- (void)setBufferAllocator:(id)a3;
- (void)setNamedTexture:(id)a3;
@end

@implementation _CUTextureLink

- (void)setNamedTexture:(id)a3
{
  if (self->_namedTexture != a3) {
    self->_namedTexture = (CUINamedTexture *)a3;
  }
}

- (id)namedTexture
{
  return self->_namedTexture;
}

- (id)bufferAllocator
{
  return self->_bufferAllocator;
}

- (void)setBufferAllocator:(id)a3
{
  if (self->_bufferAllocator != a3) {
    self->_bufferAllocator = (TXRBufferAllocator *)a3;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUTextureLink;
  [(_CUTextureLink *)&v3 dealloc];
}

- (id)provideTextureInfo
{
  id v2 = objc_msgSend(-[_CUTextureLink namedTexture](self, "namedTexture"), "_rendition");
  return [v2 provideTextureInfo];
}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  id v9 = objc_msgSend(-[_CUTextureLink namedTexture](self, "namedTexture"), "_rendition");
  id v10 = [(_CUTextureLink *)self bufferAllocator];
  return [v9 provideImageInfoAtLevel:a3 element:a4 face:a5 withBufferAllocator:v10];
}

@end