@interface GLKTextureInfo
- (BOOL)containsMipmaps;
- (BOOL)lossyCompressedSource;
- (GLKTextureInfo)initWithTexture:(id)a3 textureName:(unsigned int)a4;
- (GLKTextureInfo)initWithTextureTXR:(id)a3 textureName:(unsigned int)a4;
- (GLKTextureInfoAlphaState)alphaState;
- (GLKTextureInfoOrigin)textureOrigin;
- (GLenum)target;
- (GLuint)arrayLength;
- (GLuint)depth;
- (GLuint)height;
- (GLuint)mimapLevelCount;
- (GLuint)name;
- (GLuint)width;
- (id)description;
- (void)dealloc;
@end

@implementation GLKTextureInfo

- (GLKTextureInfo)initWithTexture:(id)a3 textureName:(unsigned int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)GLKTextureInfo;
  v6 = [(GLKTextureInfo *)&v15 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->name = a4;
  v6->target = [a3 bindTarget];
  v7->width = [a3 width];
  v7->unsigned int height = [a3 height];
  v7->depth = 1;
  if ([a3 hasAlpha])
  {
    if ([a3 hasPremultipliedAlpha]) {
      int v8 = 2;
    }
    else {
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 0;
  }
  v7->alphaState = v8;
  if ([a3 orientation] == 1)
  {
    int v9 = 1;
  }
  else
  {
    if ([a3 orientation] != 4)
    {
      v7->textureOrigin = 0;
      goto LABEL_13;
    }
    int v9 = 2;
  }
  v7->textureOrigin = v9;
LABEL_13:
  v7->containsMipmaps = [a3 isMipmapped];
  v7->arrayLength = 1;
  unsigned int v10 = [a3 numMipMapLevels];
  v7->mimapLevelCount = v10;
  if (v10 == 1 && [a3 requestIssuedForMipmapGeneration])
  {
    unsigned int height = v7->height;
    if (v7->width > height) {
      unsigned int height = v7->width;
    }
    if (height)
    {
      int v12 = -1;
      do
      {
        ++v12;
        BOOL v13 = height > 1;
        height >>= 1;
      }
      while (v13);
    }
    else
    {
      int v12 = -1;
    }
    v7->mimapLevelCount = v12;
  }
  return v7;
}

- (GLKTextureInfo)initWithTextureTXR:(id)a3 textureName:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GLKTextureInfo;
  v6 = [(GLKTextureInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->name = a4;
    v6->target = [a3 target];
    v7->width = [a3 width];
    v7->unsigned int height = [a3 height];
    v7->depth = [a3 depth];
    v7->lossyCompressedSource = [a3 lossyCompressedSource];
    v7->alphaState = [a3 hasAlpha];
    v7->textureOrigin = 0;
    v7->containsMipmaps = [a3 mipmapLevelCount] > 1;
    v7->arrayLength = [a3 arrayLength];
    v7->mimapLevelCount = [a3 mipmapLevelCount];
  }
  return v7;
}

- (id)description
{
  if ([(GLKTextureInfo *)self target] == 3553)
  {
    v3 = @"GL_TEXTURE_2D";
  }
  else if ([(GLKTextureInfo *)self target] == 34067)
  {
    v3 = @"GL_TEXTURE_CUBE_MAP";
  }
  else
  {
    v3 = @"Unknown / Invalid";
  }
  if ([(GLKTextureInfo *)self alphaState])
  {
    if ([(GLKTextureInfo *)self alphaState] == GLKTextureInfoAlphaStateNonPremultiplied)
    {
      v4 = @"GLKTextureInfoAlphaStateNonPremultiplied";
    }
    else if ([(GLKTextureInfo *)self alphaState] == GLKTextureInfoAlphaStatePremultiplied)
    {
      v4 = @"GLKTextureInfoAlphaStatePremultiplied";
    }
    else
    {
      v4 = @"Unknown / Invalid";
    }
  }
  else
  {
    v4 = @"GLKTextureInfoAlphaStateNone";
  }
  if ([(GLKTextureInfo *)self textureOrigin])
  {
    if ([(GLKTextureInfo *)self textureOrigin] == GLKTextureInfoOriginTopLeft)
    {
      v5 = @"GLKTextureInfoOriginTopLeft";
    }
    else if ([(GLKTextureInfo *)self textureOrigin] == GLKTextureInfoOriginBottomLeft)
    {
      v5 = @"GLKTextureInfoOriginBottomLeft";
    }
    else
    {
      v5 = @"Unknown / Invaid";
    }
  }
  else
  {
    v5 = @"GLKTextureInfoOriginUnknown";
  }
  v7.receiver = self;
  v7.super_class = (Class)GLKTextureInfo;
  return (id)[NSString stringWithFormat:@"%@ \nname=%d, \ntarget=%@, \nwidth=%d, \nheight=%d, \nalphaState=%@, \ntextureOrigin=%@, \ncontainsMipmaps=%d", -[GLKTextureInfo description](&v7, sel_description), -[GLKTextureInfo name](self, "name"), v3, -[GLKTextureInfo width](self, "width"), -[GLKTextureInfo height](self, "height"), v4, v5, -[GLKTextureInfo containsMipmaps](self, "containsMipmaps")];
}

- (BOOL)lossyCompressedSource
{
  return self->lossyCompressedSource;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GLKTextureInfo;
  [(GLKTextureInfo *)&v2 dealloc];
}

- (GLuint)name
{
  return self->name;
}

- (GLenum)target
{
  return self->target;
}

- (GLuint)width
{
  return self->width;
}

- (GLuint)height
{
  return self->height;
}

- (GLuint)depth
{
  return self->depth;
}

- (GLKTextureInfoAlphaState)alphaState
{
  return self->alphaState;
}

- (GLKTextureInfoOrigin)textureOrigin
{
  return self->textureOrigin;
}

- (BOOL)containsMipmaps
{
  return self->containsMipmaps;
}

- (GLuint)mimapLevelCount
{
  return self->mimapLevelCount;
}

- (GLuint)arrayLength
{
  return self->arrayLength;
}

@end