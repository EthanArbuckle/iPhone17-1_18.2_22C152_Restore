@interface MTKTextureLoaderPVR
+ (BOOL)isPVRFile:(id)a3;
- (BOOL)determineFormat:(unsigned int)a3 options:(id)a4;
- (MTKTextureLoaderPVR)initWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (void)dealloc;
- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9;
@end

@implementation MTKTextureLoaderPVR

+ (BOOL)isPVRFile:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ((unint64_t)[a3 length] < 0x34) {
    return 0;
  }
  int v7 = 0;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  [a3 getBytes:v5 length:52];
  return HIDWORD(v6) == 559044176;
}

- (MTKTextureLoaderPVR)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  v23.receiver = self;
  v23.super_class = (Class)MTKTextureLoaderPVR;
  v8 = [(MTKTextureLoaderData *)&v23 init];
  if (v8)
  {
    v8->_imageData = (NSData *)a3;
    if (!+[MTKTextureLoaderPVR isPVRFile:a3]) {
      -[MTKTextureLoaderPVR initWithData:options:error:]();
    }
    v9 = [(NSData *)v8->_imageData bytes];
    v10 = v9;
    unsigned int v11 = v9[4];
    v8->_pvrFormat = v11;
    unsigned int v12 = v9[12];
    if (v12 <= 1) {
      unsigned int v12 = 1;
    }
    v8->_unsigned int numSurfaces = v12;
    [(MTKTextureLoaderData *)v8 setWidth:v9[2]];
    [(MTKTextureLoaderData *)v8 setHeight:v10[1]];
    [(MTKTextureLoaderData *)v8 setNumMipmapLevels:v10[3] + 1];
    [(MTKTextureLoaderData *)v8 setNumFaces:1];
    [(MTKTextureLoaderData *)v8 setImageOrigin:@"MTKTextureLoaderOriginTopLeft"];
    if ([(MTKTextureLoaderPVR *)v8 determineFormat:v8->_pvrFormat options:a4])
    {
      [(MTKTextureLoaderData *)v8 pixelFormat];
      MTLPixelFormatGetInfoForDevice();
      v8->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v22;
      *(_OWORD *)&v8->_pixelFormatInfo.castClass = v20;
      *(_OWORD *)&v8->_pixelFormatInfo.type.compressed.blockWidth = v21;
      *(_OWORD *)&v8->_pixelFormatInfo.name = v19;
      unsigned int flags = v8->_pixelFormatInfo.flags;
      uint64_t v14 = [a4 objectForKey:@"MTKTextureLoaderOptionOrigin"];
      uint64_t v15 = v14;
      if ((flags & 0x400) == 0 || !v14)
      {
        if ((v11 & 0x1000) != 0)
        {
          [(MTKTextureLoaderData *)v8 setTextureType:5];
          [(MTKTextureLoaderData *)v8 setNumFaces:6];
          unsigned int numSurfaces = v8->_numSurfaces;
          v8->_unsigned int numSurfaces = numSurfaces / 6;
          if (numSurfaces >= 0xC)
          {
            if (!a5) {
              goto LABEL_13;
            }
            v16 = @"Metal does not support texture cube arrays";
            goto LABEL_12;
          }
        }
        else if ((v11 & 0x4000) != 0)
        {
          [(MTKTextureLoaderData *)v8 setTextureType:7];
          [(MTKTextureLoaderData *)v8 setDepth:v8->_numSurfaces];
        }
        else if (v8->_numSurfaces >= 2)
        {
          [(MTKTextureLoaderData *)v8 setTextureType:3];
          [(MTKTextureLoaderData *)v8 setNumArrayElements:v8->_numSurfaces];
        }
        if (!v15
          || [(MTKTextureLoaderData *)v8 textureType] == 2
          || [(MTKTextureLoaderData *)v8 textureType] == 3
          || [(MTKTextureLoaderData *)v8 textureType] == 5)
        {
          if (![a4 objectForKey:@"MTKTextureLoaderOptionCubeLayout"]) {
            return v8;
          }
          if (!a5) {
            goto LABEL_13;
          }
          v16 = @"Creating cube maps from 2D textures is not supported for PVR files";
        }
        else
        {
          if (!a5) {
            goto LABEL_13;
          }
          v16 = @"Vertical flip is only supported for 2D, 2D array, and cube map textures";
        }
LABEL_12:
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v16);
        goto LABEL_13;
      }
      if (a5)
      {
        v16 = @"Vertical flip is not supported for compressed PVR textures";
        goto LABEL_12;
      }
    }
    else if (a5)
    {
      v16 = @"Could not determine format from PVR header";
      goto LABEL_12;
    }
LABEL_13:

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderPVR;
  [(MTKTextureLoaderData *)&v3 dealloc];
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  v13 = [(NSData *)self->_imageData bytes];
  NSUInteger v14 = [(NSData *)self->_imageData length];
  id result = [(MTKTextureLoaderData *)self depth];
  if (result)
  {
    v32 = a8;
    unint64_t v16 = 0;
    NSUInteger v17 = v14 - 52;
    v18 = v13 + 52;
    while (![(MTKTextureLoaderData *)self numArrayElements])
    {
LABEL_35:
      ++v16;
      unint64_t v31 = [(MTKTextureLoaderData *)self depth];
      id result = 0;
      if (v31 <= v16) {
        return result;
      }
    }
    uint64_t v19 = 0;
    unint64_t v34 = a3;
    unint64_t v35 = a6;
    unint64_t v33 = v16;
    while (1)
    {
      uint64_t v37 = v19;
      if ([(MTKTextureLoaderData *)self numFaces]) {
        break;
      }
LABEL_34:
      uint64_t v19 = v37 + 1;
      a3 = v34;
      a6 = v35;
      unint64_t v16 = v33;
      if ([(MTKTextureLoaderData *)self numArrayElements] <= v37 + 1) {
        goto LABEL_35;
      }
    }
    uint64_t v20 = 0;
    BOOL v22 = v16 == a6 && v19 == a3;
    BOOL v38 = v22;
    while (1)
    {
      unint64_t v23 = [(MTKTextureLoaderData *)self width];
      unint64_t v24 = [(MTKTextureLoaderData *)self height];
      if ([(MTKTextureLoaderData *)self numMipmapLevels]) {
        break;
      }
LABEL_33:
      if ([(MTKTextureLoaderData *)self numFaces] <= ++v20) {
        goto LABEL_34;
      }
    }
    uint64_t v25 = 0;
    BOOL v26 = v20 == a4 && v38;
    while (1)
    {
      uint64_t v43 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v40 = 0;
      if ((self->_pixelFormatInfo.flags & 0x400) != 0)
      {
        [(MTKTextureLoaderPVR *)self determineBlockSize:&v43 blocksWide:&v42 blocksHigh:&v41 bytesPerBlock:&v40 fromFormat:self->_pvrFormat width:v23 andHeight:v24];
        unint64_t v27 = v42 * v40;
        unint64_t v28 = v42 * v40 * v41;
      }
      else
      {
        unint64_t v27 = self->_pixelFormatInfo.type.normal.pixelBytes * v23;
        unint64_t v28 = v27 * v24;
      }
      BOOL v29 = v17 >= v28;
      v17 -= v28;
      if (!v29) {
        return 0;
      }
      if (a5 == v25 && v26) {
        break;
      }
      v18 += v28;
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      else {
        v23 >>= 1;
      }
      if (v24 <= 1) {
        unint64_t v24 = 1;
      }
      else {
        v24 >>= 1;
      }
      if ([(MTKTextureLoaderData *)self numMipmapLevels] <= ++v25) {
        goto LABEL_33;
      }
    }
    *a7 = v27;
    unint64_t *v32 = v28;
    return (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v18);
  }
  return result;
}

- (BOOL)determineFormat:(unsigned int)a3 options:(id)a4
{
  int v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"MTKTextureLoaderOptionSRGB"), "BOOLValue");
  BOOL result = 0;
  uint64_t v8 = 42;
  switch(a3)
  {
    case 0x10u:
      goto LABEL_15;
    case 0x11u:
      uint64_t v8 = 41;
      goto LABEL_15;
    case 0x12u:
    case 0x1Au:
      BOOL v9 = v6 == 0;
      uint64_t v10 = 70;
      goto LABEL_12;
    case 0x13u:
      uint64_t v8 = 40;
      goto LABEL_15;
    case 0x14u:
    case 0x15u:
      return result;
    case 0x16u:
      BOOL v9 = v6 == 0;
      uint64_t v10 = 10;
      goto LABEL_12;
    case 0x17u:
      BOOL v9 = v6 == 0;
      uint64_t v10 = 30;
      goto LABEL_12;
    case 0x18u:
      BOOL v9 = v6 == 0;
      uint64_t v10 = 164;
      goto LABEL_12;
    case 0x19u:
      BOOL v9 = v6 == 0;
      uint64_t v10 = 166;
LABEL_12:
      if (v9) {
        uint64_t v8 = v10;
      }
      else {
        uint64_t v8 = v10 + 1;
      }
      goto LABEL_15;
    case 0x1Bu:
      uint64_t v8 = 1;
      goto LABEL_15;
    default:
      if (a3 == 50)
      {
        uint64_t v8 = 115;
      }
      else
      {
        if (a3 != 53) {
          return result;
        }
        uint64_t v8 = 125;
      }
LABEL_15:
      [(MTKTextureLoaderData *)self setPixelFormat:v8];
      return 1;
  }
}

- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9
{
  unint64_t v9 = (a9 + 3) >> 2;
  unint64_t v10 = 2;
  if (v9 <= 2) {
    unint64_t v9 = 2;
  }
  uint64_t v11 = 3;
  if (a7 == 24)
  {
    uint64_t v11 = 7;
    char v12 = 3;
  }
  else
  {
    char v12 = 2;
  }
  unint64_t v13 = 16;
  if (a7 == 24) {
    unint64_t v13 = 32;
  }
  unint64_t v14 = (v11 + a8) >> v12;
  if (v14 > 2) {
    unint64_t v10 = v14;
  }
  *a4 = v10;
  *a5 = v9;
  *a3 = v13;
  *a6 = 8;
}

- (void)initWithData:options:error:.cold.1()
{
}

@end