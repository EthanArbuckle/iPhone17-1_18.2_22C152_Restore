@interface MTKTextureLoaderMDL
- (BOOL)determineFormatFromChannelEncoding:(int64_t)a3 channelCount:(unint64_t)a4 error:(id *)a5;
- (MTKTextureLoaderMDL)initWithMDLTexture:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (void)dealloc;
@end

@implementation MTKTextureLoaderMDL

- (MTKTextureLoaderMDL)initWithMDLTexture:(id)a3 options:(id)a4 error:(id *)a5
{
  v20.receiver = self;
  v20.super_class = (Class)MTKTextureLoaderMDL;
  v8 = [(MTKTextureLoaderData *)&v20 init];
  if (v8)
  {
    *((void *)v8 + 10) = a3;
    [a3 dimensions];
    [v8 setWidth:v9];
    [v8 setDepth:1];
    [v8 setNumArrayElements:1];
    if ([a3 isCube])
    {
      [v8 setNumFaces:6];
      [v8 setTextureType:5];
      [a3 dimensions];
      int v11 = v10 / 6;
    }
    else
    {
      [v8 setNumFaces:1];
      [v8 setTextureType:2];
      [a3 dimensions];
      int v11 = v12;
    }
    [v8 setHeight:v11];
    unint64_t v13 = [a3 mipLevelCount];
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    [v8 setNumMipmapLevels:v14];
    if (!objc_msgSend(v8, "determineFormatFromChannelEncoding:channelCount:error:", objc_msgSend(a3, "channelEncoding"), objc_msgSend(a3, "channelCount"), a5))goto LABEL_12; {
    [v8 pixelFormat];
    }
    MTLPixelFormatGetInfoForDevice();
    *((void *)v8 + 17) = v19;
    *(_OWORD *)(v8 + 104) = v17;
    *(_OWORD *)(v8 + 120) = v18;
    *(_OWORD *)(v8 + 88) = v16;
    [v8 setImageOrigin:@"MTKTextureLoaderOriginTopLeft"];
    if ([a4 objectForKey:@"MTKTextureLoaderOptionCubeLayout"])
    {
      if (a5) {
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Creating cube maps from 2D textures is not supported for MDL textures");
      }
LABEL_12:

      return 0;
    }
  }
  return (MTKTextureLoaderMDL *)v8;
}

- (void)dealloc
{
  self->_texture = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderMDL;
  [(MTKTextureLoaderData *)&v3 dealloc];
}

- (BOOL)determineFormatFromChannelEncoding:(int64_t)a3 channelCount:(unint64_t)a4 error:(id *)a5
{
  if (a3 <= 2)
  {
    if (a3 == 1)
    {
      switch(a4)
      {
        case 4uLL:
          uint64_t v6 = 70;
          goto LABEL_39;
        case 2uLL:
          uint64_t v6 = 30;
          goto LABEL_39;
        case 1uLL:
          uint64_t v6 = 10;
          goto LABEL_39;
      }
    }
    else
    {
      if (a3 != 2) {
        goto LABEL_25;
      }
      switch(a4)
      {
        case 4uLL:
          uint64_t v6 = 110;
          goto LABEL_39;
        case 2uLL:
          uint64_t v6 = 60;
          goto LABEL_39;
        case 1uLL:
          uint64_t v6 = 20;
          goto LABEL_39;
      }
    }
LABEL_27:
    if (a5)
    {
      v7 = @"Textures must have 1, 2, or 4 channels";
      goto LABEL_29;
    }
    return 0;
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    if (!a5) {
      return 0;
    }
    v7 = @"Textures must use 8 or 16 bits per channel";
LABEL_29:
    v8 = (void *)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v7);
    BOOL result = 0;
    *a5 = v8;
    return result;
  }
  if (a3 == 258)
  {
    switch(a4)
    {
      case 4uLL:
        uint64_t v6 = 115;
        goto LABEL_39;
      case 2uLL:
        uint64_t v6 = 65;
        goto LABEL_39;
      case 1uLL:
        uint64_t v6 = 25;
        goto LABEL_39;
    }
    goto LABEL_27;
  }
  if (a3 != 260)
  {
LABEL_25:
    if (!a5) {
      return 0;
    }
    v7 = @"Could not determine format from MDLTexture";
    goto LABEL_29;
  }
  if (a4 == 4)
  {
    uint64_t v6 = 125;
    goto LABEL_39;
  }
  if (a4 == 2)
  {
    uint64_t v6 = 105;
    goto LABEL_39;
  }
  if (a4 != 1) {
    goto LABEL_27;
  }
  uint64_t v6 = 55;
LABEL_39:
  [(MTKTextureLoaderData *)self setPixelFormat:v6];
  return 1;
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  unint64_t v13 = [(MTKTextureLoaderData *)self width];
  if (v13 >> a5 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13 >> a5;
  }
  unint64_t v15 = [(MTKTextureLoaderData *)self height] >> a5;
  if (v15 <= 1) {
    unint64_t v15 = 1;
  }
  unint64_t v16 = self->_pixelFormatInfo.type.normal.pixelBytes * v14;
  *a7 = v16;
  *a8 = v16 * v15;
  long long v17 = [(MDLTexture *)self->_texture texelDataWithTopLeftOriginAtMipLevel:a5 create:1];
  unint64_t v18 = *a8 * a4;

  return [(NSData *)v17 subdataWithRange:v18];
}

@end