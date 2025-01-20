@interface MTKTextureLoaderPVR3
+ (BOOL)isPVR3File:(id)a3;
- (BOOL)parseMetadataWithError:(id *)a3;
- (MTKTextureLoaderPVR3)initWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (unint64_t)determineFormat:(unint64_t)a3 colorSpace:(unsigned int)a4 channelType:(unsigned int)a5 options:(id)a6;
- (void)dealloc;
- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9;
@end

@implementation MTKTextureLoaderPVR3

+ (BOOL)isPVR3File:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ((unint64_t)[a3 length] < 0x34) {
    return 0;
  }
  int v6 = 0;
  memset(v5, 0, sizeof(v5));
  [a3 getBytes:v5 length:52];
  return LODWORD(v5[0]) == 55727696;
}

- (MTKTextureLoaderPVR3)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  v23.receiver = self;
  v23.super_class = (Class)MTKTextureLoaderPVR3;
  v8 = [(MTKTextureLoaderData *)&v23 init];
  if (!v8) {
    return (MTKTextureLoaderPVR3 *)v8;
  }
  if (!+[MTKTextureLoaderPVR3 isPVR3File:a3]) {
    -[MTKTextureLoaderPVR3 initWithData:options:error:]();
  }
  id v9 = a3;
  *((void *)v8 + 19) = v9;
  uint64_t v10 = [v9 bytes];
  [v8 setWidth:*(unsigned int *)(v10 + 28)];
  [v8 setHeight:*(unsigned int *)(v10 + 24)];
  [v8 setDepth:*(unsigned int *)(v10 + 32)];
  uint64_t v11 = *(unsigned int *)(v10 + 36);
  [v8 setNumFaces:*(unsigned int *)(v10 + 40)];
  [v8 setNumMipmapLevels:*(unsigned int *)(v10 + 44)];
  *((_DWORD *)v8 + 36) = *(_DWORD *)(v10 + 48);
  [v8 setImageOrigin:@"MTKTextureLoaderOriginTopLeft"];
  if (![v8 parseMetadataWithError:a5]) {
    goto LABEL_32;
  }
  *((_DWORD *)v8 + 20) = *(void *)(v10 + 8);
  objc_msgSend(v8, "setPixelFormat:", objc_msgSend(v8, "determineFormat:colorSpace:channelType:options:"));
  if (![v8 pixelFormat])
  {
    if (a5)
    {
      v15 = @"Could not determine format from PVR header";
      goto LABEL_31;
    }
LABEL_32:

    return 0;
  }
  [v8 pixelFormat];
  MTLPixelFormatGetInfoForDevice();
  *((void *)v8 + 17) = v22;
  *(_OWORD *)(v8 + 104) = v20;
  *(_OWORD *)(v8 + 120) = v21;
  *(_OWORD *)(v8 + 88) = v19;
  int v12 = *((_DWORD *)v8 + 24);
  uint64_t v13 = [a4 objectForKey:@"MTKTextureLoaderOptionOrigin"];
  uint64_t v14 = v13;
  if ((v12 & 0x400) != 0 && v13)
  {
    if (a5)
    {
      v15 = @"Vertical flip is not supported for compressed PVR textures";
LABEL_31:
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v15);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v11 >= 2)
  {
    if ((unint64_t)[v8 numFaces] >= 2)
    {
      if (a5)
      {
        v15 = @"Metal does not support texture cube arrays";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if ((unint64_t)[v8 depth] <= 1)
    {
      [v8 setTextureType:3];
      [v8 setNumArrayElements:v11];
      if (v14) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if ((unint64_t)[v8 depth] >= 2)
  {
LABEL_19:
    v16 = v8;
    uint64_t v17 = 7;
    goto LABEL_21;
  }
  if ((unint64_t)[v8 numFaces] < 2)
  {
    v16 = v8;
    uint64_t v17 = 2;
  }
  else
  {
    v16 = v8;
    uint64_t v17 = 5;
  }
LABEL_21:
  [v16 setTextureType:v17];
  if (v14)
  {
LABEL_22:
    if ([v8 textureType] != 2
      && [v8 textureType] != 3
      && [v8 textureType] != 5)
    {
      if (a5)
      {
        v15 = @"Vertical flip is only supported for 2D, 2D array, and cube map textures";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
LABEL_28:
  if ([a4 objectForKey:@"MTKTextureLoaderOptionCubeLayout"])
  {
    if (a5)
    {
      v15 = @"Creating cube maps from 2D textures is not supported for PVR files";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  return (MTKTextureLoaderPVR3 *)v8;
}

- (void)dealloc
{
  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderPVR3;
  [(MTKTextureLoaderData *)&v3 dealloc];
}

- (BOOL)parseMetadataWithError:(id *)a3
{
  if ([(NSData *)self->_imageData length] - 52 >= self->_metaDataSize)
  {
    v8 = [(NSData *)self->_imageData bytes];
    uint64_t metaDataSize = self->_metaDataSize;
    if (metaDataSize >= 0xD)
    {
      unint64_t v10 = (unint64_t)&v8[metaDataSize + 40];
      uint64_t v11 = v8 + 52;
      int v12 = &v8[metaDataSize + 52];
      while (1)
      {
        if (*(_DWORD *)v11 != 55727696)
        {
          if (!a3) {
            return 0;
          }
          v5 = @"Could not parse KTX metadata";
          goto LABEL_4;
        }
        int64_t v13 = *((unsigned int *)v11 + 2);
        uint64_t v14 = v11 + 12;
        if (v12 - (v11 + 12) < v13) {
          break;
        }
        if (*((_DWORD *)v11 + 1) == 3 && v13 == 3)
        {
          if (v11[13]) {
            v16 = @"MTKTextureLoaderOriginBottomLeft";
          }
          else {
            v16 = @"MTKTextureLoaderOriginTopLeft";
          }
          [(MTKTextureLoaderData *)self setImageOrigin:v16];
        }
        uint64_t v11 = &v14[v13];
        if ((unint64_t)&v14[v13] >= v10) {
          return 1;
        }
      }
      if (!a3) {
        return 0;
      }
      v5 = @"KTX metadata size exceeds metadata region size";
      goto LABEL_4;
    }
    return 1;
  }
  else
  {
    if (a3)
    {
      v5 = @"PVR header metadata size too large";
LABEL_4:
      int v6 = (void *)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v5);
      BOOL result = 0;
      *a3 = v6;
      return result;
    }
    return 0;
  }
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  int v12 = [(NSData *)self->_imageData bytes];
  uint64_t metaDataSize = self->_metaDataSize;
  NSUInteger v14 = [(NSData *)self->_imageData length];
  uint64_t v15 = self->_metaDataSize;
  unint64_t v16 = [(MTKTextureLoaderData *)self width];
  unint64_t v17 = [(MTKTextureLoaderData *)self height];
  id result = [(MTKTextureLoaderData *)self numMipmapLevels];
  if (result)
  {
    unint64_t v41 = 0;
    uint64_t v19 = v14 - v15 - 52;
    uint64_t v39 = (uint64_t)v12 + metaDataSize + 52;
    p_pixelFormatInfo = &self->_pixelFormatInfo;
    while (1)
    {
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      if ((p_pixelFormatInfo->flags & 0x400) != 0)
      {
        [(MTKTextureLoaderPVR3 *)self determineBlockSize:&v45 blocksWide:&v44 blocksHigh:&v43 bytesPerBlock:&v42 fromFormat:self->_pvrCompressedFormat width:v16 andHeight:v17];
        unint64_t v21 = v44 * v42;
        unint64_t v22 = v44 * v42 * v43;
      }
      else
      {
        unint64_t v21 = p_pixelFormatInfo->type.normal.pixelBytes * v16;
        unint64_t v22 = v21 * v17;
      }
      if ([(MTKTextureLoaderData *)self numArrayElements]) {
        break;
      }
LABEL_28:
      if (v16 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        v16 >>= 1;
      }
      if (v17 <= 1) {
        unint64_t v17 = 1;
      }
      else {
        v17 >>= 1;
      }
      unint64_t v31 = [(MTKTextureLoaderData *)self numMipmapLevels];
      id result = 0;
      ++v41;
      p_pixelFormatInfo = &self->_pixelFormatInfo;
      if (v31 <= v41) {
        return result;
      }
    }
    unint64_t v35 = v21;
    unint64_t v23 = 0;
    unint64_t v36 = v17;
    while (![(MTKTextureLoaderData *)self numFaces])
    {
LABEL_27:
      ++v23;
      unint64_t v17 = v36;
      if ([(MTKTextureLoaderData *)self numArrayElements] <= v23) {
        goto LABEL_28;
      }
    }
    uint64_t v24 = 0;
    BOOL v26 = v41 == a5 && v23 == a3;
    unint64_t v33 = v16;
    unint64_t v34 = a3;
    BOOL v32 = v26;
    while (![(MTKTextureLoaderData *)self depth])
    {
LABEL_26:
      if ([(MTKTextureLoaderData *)self numFaces] <= ++v24) {
        goto LABEL_27;
      }
    }
    unint64_t v27 = a5;
    uint64_t v28 = 0;
    unint64_t v29 = 0;
    if (v24 != a4) {
      BOOL v26 = 0;
    }
    while (1)
    {
      if (v19 + v28 < v22) {
        return 0;
      }
      if (a6 == v29 && v26) {
        break;
      }
      ++v29;
      v28 -= v22;
      if ([(MTKTextureLoaderData *)self depth] <= v29)
      {
        v39 -= v28;
        v19 += v28;
        a5 = v27;
        unint64_t v16 = v33;
        a3 = v34;
        BOOL v26 = v32;
        goto LABEL_26;
      }
    }
    *a7 = v35;
    *a8 = v22;
    return (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v39 - v28 length:v22 freeWhenDone:0];
  }
  return result;
}

- (unint64_t)determineFormat:(unint64_t)a3 colorSpace:(unsigned int)a4 channelType:(unsigned int)a5 options:(id)a6
{
  int v9 = a4 == 1;
  if ([a6 objectForKey:@"MTKTextureLoaderOptionSRGB"]) {
    int v9 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", @"MTKTextureLoaderOptionSRGB"), "BOOLValue");
  }
  if (!HIDWORD(a3))
  {
    unint64_t result = 150;
    switch((int)a3)
    {
      case 0:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 160;
        goto LABEL_86;
      case 1:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 164;
        goto LABEL_86;
      case 2:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 162;
        goto LABEL_86;
      case 3:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 166;
        goto LABEL_86;
      case 7:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 130;
        goto LABEL_86;
      case 8:
      case 9:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 132;
        goto LABEL_86;
      case 10:
      case 11:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 134;
        goto LABEL_86;
      case 12:
        if (a5 >= 0xC) {
          return 0;
        }
        unint64_t v16 = &unk_2156B26F8;
        return v16[a5];
      case 13:
        if (a5 >= 0xC) {
          return 0;
        }
        unint64_t v16 = &unk_2156B2758;
        return v16[a5];
      case 14:
        return result;
      case 15:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 152;
        goto LABEL_86;
      case 16:
        return 241;
      case 17:
        return 240;
      case 19:
        return 93;
      case 22:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 180;
        goto LABEL_86;
      case 23:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 178;
        goto LABEL_86;
      case 24:
        BOOL v11 = v9 == 0;
        unint64_t v12 = 182;
        goto LABEL_86;
      case 25:
        if (a5 >= 0xC) {
          return 0;
        }
        unint64_t v16 = &unk_2156B27B8;
        return v16[a5];
      case 26:
        if (a5 >= 0xC) {
          return 0;
        }
        unint64_t v16 = &unk_2156B2818;
        return v16[a5];
      case 27:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 204;
        unint64_t v23 = 186;
        goto LABEL_105;
      case 28:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 205;
        unint64_t v23 = 187;
        goto LABEL_105;
      case 29:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 206;
        unint64_t v23 = 188;
        goto LABEL_105;
      case 30:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 207;
        unint64_t v23 = 189;
        goto LABEL_105;
      case 31:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 208;
        unint64_t v23 = 190;
        goto LABEL_105;
      case 32:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 210;
        unint64_t v23 = 192;
        goto LABEL_105;
      case 33:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 211;
        unint64_t v23 = 193;
        goto LABEL_105;
      case 34:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 212;
        unint64_t v23 = 194;
        goto LABEL_105;
      case 35:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 213;
        unint64_t v23 = 195;
        goto LABEL_105;
      case 36:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 214;
        unint64_t v23 = 196;
        goto LABEL_105;
      case 37:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 215;
        unint64_t v23 = 197;
        goto LABEL_105;
      case 38:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 216;
        unint64_t v23 = 198;
        goto LABEL_105;
      case 39:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 217;
        unint64_t v23 = 199;
        goto LABEL_105;
      case 40:
        BOOL v21 = v9 == 0;
        unint64_t v22 = 218;
        unint64_t v23 = 200;
LABEL_105:
        if (v21) {
          unint64_t result = v22;
        }
        else {
          unint64_t result = v23;
        }
        break;
      default:
        return 0;
    }
    return result;
  }
  if ((uint64_t)a3 > 0x105050561726761)
  {
    if ((uint64_t)a3 <= 0x800000000000060)
    {
      if ((uint64_t)a3 > 0x404040472676260)
      {
        if (a3 == 0x404040472676261)
        {
          if (a5 <= 8 && ((1 << a5) & 0x111) != 0) {
            return 42;
          }
        }
        else if (a3 == 0x505050172676261 && a5 <= 8 && ((1 << a5) & 0x111) != 0)
        {
          return 41;
        }
      }
      else if (a3 == 0x105050561726762)
      {
        if (a5 <= 8 && ((1 << a5) & 0x111) != 0) {
          return 43;
        }
      }
      else if (a3 == 0x20A0A0A61626772 && a5 < 0xB)
      {
        unint64_t v16 = &unk_2156B26A0;
        return v16[a5];
      }
      return 0;
    }
    if ((uint64_t)a3 <= 0x808080861726761)
    {
      if (a3 == 0x800000000000061) {
        return 1;
      }
      if (a3 != 0x808080861626772) {
        return 0;
      }
      unint64_t result = 72;
      switch(a5)
      {
        case 0u:
          BOOL v11 = v9 == 0;
          unint64_t v12 = 70;
          goto LABEL_86;
        case 1u:
          return result;
        case 2u:
          unint64_t result = 73;
          break;
        case 3u:
          unint64_t result = 74;
          break;
        default:
          return 0;
      }
    }
    else
    {
      if (a3 != 0x808080861726762)
      {
        if (a3 != 0x1010101061626772)
        {
          if (a3 == 0x2020202061626772)
          {
            uint64_t v13 = a5 - 10;
            if (v13 < 3) {
              return v13 + 123;
            }
          }
          return 0;
        }
        signed int v14 = a5 - 4;
        if (a5 - 4 < 9)
        {
          uint64_t v15 = &unk_2156B2658;
          return v15[v14];
        }
        return 0;
      }
      BOOL v11 = v9 == 0;
      unint64_t v12 = 80;
LABEL_86:
      if (v11) {
        return v12;
      }
      else {
        return v12 + 1;
      }
    }
    return result;
  }
  if ((uint64_t)a3 > 0x101000006771)
  {
    if ((uint64_t)a3 > 0x5060500726761)
    {
      if (a3 == 0x5060500726762)
      {
        if (a5 <= 8 && ((1 << a5) & 0x111) != 0) {
          return 40;
        }
      }
      else if (a3 == 0xA0A0A00626772)
      {
        if (a5 == 12) {
          return 92;
        }
        else {
          return 0;
        }
      }
      return 0;
    }
    if (a3 == 0x101000006772)
    {
      signed int v14 = a5 - 4;
      if (a5 - 4 < 9)
      {
        uint64_t v15 = &unk_2156B2610;
        return v15[v14];
      }
      return 0;
    }
    if (a3 != 0x202000006772) {
      return 0;
    }
    uint64_t v17 = a5 - 10;
    BOOL v18 = v17 >= 3;
    unint64_t v19 = v17 + 103;
    goto LABEL_59;
  }
  if ((uint64_t)a3 > 0x2000000071)
  {
    if (a3 != 0x2000000072)
    {
      if (a3 != 0x80800006772) {
        return 0;
      }
      unint64_t result = 32;
      switch(a5)
      {
        case 0u:
          BOOL v11 = v9 == 0;
          unint64_t v12 = 30;
          goto LABEL_86;
        case 1u:
          return result;
        case 2u:
          unint64_t result = 33;
          break;
        case 3u:
          unint64_t result = 34;
          break;
        default:
          return 0;
      }
      return result;
    }
    uint64_t v20 = a5 - 10;
    BOOL v18 = v20 >= 3;
    unint64_t v19 = v20 + 53;
LABEL_59:
    if (v18) {
      return 0;
    }
    else {
      return v19;
    }
  }
  if (a3 != 0x800000072)
  {
    if (a3 == 0x1000000072)
    {
      signed int v14 = a5 - 4;
      if (a5 - 4 < 9)
      {
        uint64_t v15 = &unk_2156B25C8;
        return v15[v14];
      }
    }
    return 0;
  }
  unint64_t result = 12;
  switch(a5)
  {
    case 0u:
      BOOL v11 = v9 == 0;
      unint64_t v12 = 10;
      goto LABEL_86;
    case 1u:
      return result;
    case 2u:
      unint64_t result = 13;
      break;
    case 3u:
      unint64_t result = 14;
      break;
    default:
      return 0;
  }
  return result;
}

- (void)determineBlockSize:(unint64_t *)a3 blocksWide:(unint64_t *)a4 blocksHigh:(unint64_t *)a5 bytesPerBlock:(unint64_t *)a6 fromFormat:(unsigned int)a7 width:(unint64_t)a8 andHeight:(unint64_t)a9
{
  if (a7 > 1)
  {
    if ((a7 & 0xFFFFFFFE) == 2)
    {
      unint64_t v13 = (a8 + 3) >> 2;
      if (v13 <= 2) {
        unint64_t v13 = 2;
      }
      *a4 = v13;
      unint64_t v14 = (a9 + 3) >> 2;
      if (v14 <= 2) {
        unint64_t v14 = 2;
      }
      *a5 = v14;
      unint64_t pixelBytes = 8;
      unint64_t v12 = 16;
    }
    else
    {
      unint64_t blockWidth = self->_pixelFormatInfo.type.compressed.blockWidth;
      unint64_t pixelBytesRender = self->_pixelFormatInfo.type.normal.pixelBytesRender;
      unint64_t pixelBytes = self->_pixelFormatInfo.type.normal.pixelBytes;
      unint64_t v17 = (a8 - 1 + blockWidth) / blockWidth;
      if (__CFADD__(a8 - 1, blockWidth)) {
        unint64_t v17 = 1;
      }
      *a4 = v17;
      unint64_t v18 = (a9 - 1 + pixelBytesRender) / pixelBytesRender;
      if (__CFADD__(a9 - 1, pixelBytesRender)) {
        unint64_t v18 = 1;
      }
      *a5 = v18;
      unint64_t v12 = pixelBytesRender * blockWidth;
    }
  }
  else
  {
    unint64_t v9 = (a8 + 7) >> 3;
    if (v9 <= 2) {
      unint64_t v9 = 2;
    }
    *a4 = v9;
    unint64_t v10 = (a9 + 3) >> 2;
    if (v10 <= 2) {
      unint64_t v10 = 2;
    }
    *a5 = v10;
    unint64_t pixelBytes = 8;
    unint64_t v12 = 32;
  }
  *a3 = v12;
  *a6 = pixelBytes;
}

- (void)initWithData:options:error:.cold.1()
{
}

@end