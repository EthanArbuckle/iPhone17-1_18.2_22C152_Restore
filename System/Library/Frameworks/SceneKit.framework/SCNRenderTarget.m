@interface SCNRenderTarget
- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:;
- (BOOL)viewportDependant;
- (NSString)name;
- (SCNRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:;
- (id)ciImage;
- (id)description;
- (id)texture;
- (id)textureForSliceIndex:(unint64_t)a3;
- (int64_t)referenceCount;
- (int64_t)timeStamp;
- (unsigned)renderBufferFormat;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setReferenceCount:(int64_t)a3;
- (void)setTexture:(id)a3;
- (void)setTimeStamp:(int64_t)a3;
@end

@implementation SCNRenderTarget

- (SCNRenderTarget)initWithDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint64_t v6 = v4;
  v9.receiver = self;
  v9.super_class = (Class)SCNRenderTarget;
  result = [(SCNRenderTarget *)&v9 init];
  if (result)
  {
    result->_description = ($70D0A97A2D0AFAF0EE8A7EF308C233C5)*a3;
    *(void *)result->_size = v6;
    result->_arrayLength = a4;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNRenderTarget;
  [(SCNRenderTarget *)&v3 dealloc];
}

- (id)description
{
  id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"Format: %@ ; Size: %gx%g[%d] ; Texture: <%p> ; [rc:%ld/ts:%ld]\n",
                 C3DRenderBufferFormatToString(self->_description.format),
                 COERCE_FLOAT(*(void *)self->_size),
                 COERCE_FLOAT(HIDWORD(*(void *)self->_size)),
                 LOBYTE(self->_arrayLength),
                 self->_texture,
                 self->_referenceCount,
                 self->_timeStamp);
  if (self->_name) {
    return (id)[NSString stringWithFormat:@"Name: %@ ; %@", self->_name, result];
  }
  return result;
}

- (BOOL)viewportDependant
{
  return (*((unsigned __int8 *)&self->_description + 3) >> 2) & 1;
}

- (unsigned)renderBufferFormat
{
  return self->_description.format;
}

- (BOOL)matchesDescription:(id *)a3 size:(unint64_t)a4 arrayLength:
{
  uint32x2_t v5 = (uint32x2_t)vceq_f32(*(float32x2_t *)self->_size, v4);
  BOOL result = (vpmin_u32(v5, v5).u32[0] & 0x80000000) != 0
        && self->_description.format == a3->var0
        && self->_description.sampleCount == a3->var1
        && ((*((unsigned char *)a3 + 3) ^ *((unsigned char *)&self->_description + 3)) & 5) == 0
        && (((*((unsigned char *)a3 + 3) ^ *((unsigned char *)&self->_description + 3)) & 0x30) == 0
          ? (BOOL v6 = self->_description.textureUsage == a3->var2)
          : (BOOL v6 = 0),
            v6)
        && self->_arrayLength == a4;
  return result;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
}

- (void)setTexture:(id)a3
{
  id texture = self->_texture;
  if (texture != a3)
  {

    id v6 = a3;
    self->_id texture = v6;
    if (self->_name) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->_texture setLabel:self->_name];
    }

    self->_ciImage = 0;
  }
}

- (id)textureForSliceIndex:(unint64_t)a3
{
  sliceTextures = self->_sliceTextures;
  if (!sliceTextures)
  {
    id texture = self->_texture;
    if ([texture textureType] != 3 && objc_msgSend(texture, "textureType") != 5) {
      return self->_texture;
    }
    sliceTextures = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(texture, "arrayLength"));
    if ([texture arrayLength])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = objc_msgSend(texture, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(texture, "pixelFormat"), 2, 0, 1, v7, 1);
        [(NSArray *)sliceTextures setObject:v8 atIndexedSubscript:v7];

        ++v7;
      }
      while (v7 < [texture arrayLength]);
    }
    self->_sliceTextures = sliceTextures;
    if (!sliceTextures) {
      -[SCNRenderTarget textureForSliceIndex:]();
    }
  }

  return [(NSArray *)sliceTextures objectAtIndexedSubscript:a3];
}

- (id)ciImage
{
  id result = self->_ciImage;
  if (!result)
  {
    if (self->_texture)
    {
      id result = (id)[objc_alloc(MEMORY[0x263F00650]) initWithMTLTexture:self->_texture options:0];
      self->_ciImage = (CIImage *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)texture
{
  return self->_texture;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(int64_t)a3
{
  self->_referenceCount = a3;
}

- (int64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->_timeStamp = a3;
}

- (void)textureForSliceIndex:.cold.1()
{
  __assert_rtn("-[SCNRenderTarget textureForSliceIndex:]", "SCNRenderTarget.m", 143, "_sliceTextures != nil");
}

@end