@interface MTKTextureLoaderKTX
+ (BOOL)isKTXFile:(id)a3;
- (BOOL)parseKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)parseKeyValueBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (MTKTextureLoaderKTX)initWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (unint64_t)determineFormatFromSizedFormat:(unint64_t)a3;
- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6;
- (void)dealloc;
@end

@implementation MTKTextureLoaderKTX

- (MTKTextureLoaderKTX)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  v42.receiver = self;
  v42.super_class = (Class)MTKTextureLoaderKTX;
  v8 = [(MTKTextureLoaderData *)&v42 init];
  if (v8)
  {
    if (!+[MTKTextureLoaderKTX isKTXFile:a3]) {
      -[MTKTextureLoaderKTX initWithData:options:error:]();
    }
    v9 = (unsigned int *)[a3 bytes];
    [v8 setWidth:v9[9]];
    unsigned int v10 = v9[10];
    if (v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    [v8 setHeight:v11];
    unsigned int v12 = v9[11];
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    [v8 setDepth:v13];
    unsigned int v14 = v9[12];
    if (v14 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v14;
    }
    [v8 setNumArrayElements:v15];
    unsigned int v16 = v9[13];
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    [v8 setNumFaces:v17];
    unsigned int v18 = v9[14];
    if (v18 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    [v8 setNumMipmapLevels:v19];
    [v8 setImageOrigin:@"MTKTextureLoaderOriginTopLeft"];
    objc_msgSend(v8, "setPixelFormat:", objc_msgSend(v8, "determineFormatFromType:format:internalFormat:baseInternalFormat:", v9[4], v9[6], v9[7], v9[8]));
    if (![v8 pixelFormat])
    {
      if (!a5)
      {
LABEL_34:

        return 0;
      }
      v25 = @"Could not determine format from KTX header";
      goto LABEL_33;
    }
    [v8 pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    long long v20 = v40[0];
    long long v21 = v40[1];
    long long v22 = v40[2];
    *((void *)v8 + 17) = v41;
    *(_OWORD *)(v8 + 104) = v21;
    *(_OWORD *)(v8 + 120) = v22;
    *(_OWORD *)(v8 + 88) = v20;
    unint64_t v23 = v9[15];
    if ([a3 length] - 64 < v23
      || !objc_msgSend(v8, "parseKeyValueBytes:length:error:", objc_msgSend(a3, "bytes") + 64, v23, a5))
    {
      goto LABEL_34;
    }
    *((void *)v8 + 10) = (id)objc_msgSend(a3, "subdataWithRange:", v23 + 64, objc_msgSend(a3, "length") - v23 - 64);
    [v8 setTextureType:0];
    if ((unint64_t)[v8 height] >= 2) {
      [v8 setTextureType:2];
    }
    if ((unint64_t)[v8 depth] >= 2) {
      [v8 setTextureType:7];
    }
    if ([v8 numFaces] == 6) {
      [v8 setTextureType:5];
    }
    if ((unint64_t)[v8 numArrayElements] >= 2)
    {
      if ([v8 textureType])
      {
        if ([v8 textureType] == 2)
        {
          uint64_t v24 = 3;
        }
        else
        {
          if ([v8 textureType] != 5) {
            goto LABEL_40;
          }
          uint64_t v24 = 6;
        }
      }
      else
      {
        uint64_t v24 = 1;
      }
      [v8 setTextureType:v24];
    }
LABEL_40:
    if ((unint64_t)([v8 pixelFormat] - 203) <= 0xF && objc_msgSend(v8, "numArrayElements"))
    {
      uint64_t v27 = 0;
      while (![v8 numFaces])
      {
LABEL_55:
        if (++v27 >= (unint64_t)[v8 numArrayElements]) {
          goto LABEL_59;
        }
      }
      uint64_t v28 = 0;
      while (![v8 numMipmapLevels])
      {
LABEL_54:
        if (++v28 >= (unint64_t)[v8 numFaces]) {
          goto LABEL_55;
        }
      }
      uint64_t v29 = 0;
      while (![v8 depth])
      {
LABEL_53:
        if (++v29 >= (unint64_t)[v8 numMipmapLevels]) {
          goto LABEL_54;
        }
      }
      uint64_t v30 = 0;
      while (1)
      {
        *(void *)&v40[0] = 0;
        uint64_t v43 = 0;
        uint64_t v31 = [v8 getDataForArrayElement:v27 face:v28 level:v29 depthPlane:v30 bytesPerRow:v40 bytesPerImage:&v43];
        if (!v31) {
          break;
        }
        int64_t v32 = +[MTKTextureLoaderASTCHelper isASTCHDRData:v31 is3DBlocks:0 error:0];
        if (v32 == -1) {
          break;
        }
        if (v32 == 1)
        {
          uint64_t v33 = [v8 pixelFormat];
          if ((unint64_t)(v33 - 203) >= 0x10) {
            -[MTKTextureLoaderKTX initWithData:options:error:]();
          }
          [v8 setPixelFormat:v33 + 18];
          break;
        }
        if (++v30 >= (unint64_t)[v8 depth]) {
          goto LABEL_53;
        }
      }
    }
LABEL_59:
    int v34 = *((_DWORD *)v8 + 24);
    uint64_t v35 = [a4 objectForKey:@"MTKTextureLoaderOptionOrigin"];
    if ((v34 & 0x400) != 0 && v35)
    {
      if (!a5) {
        goto LABEL_34;
      }
      v25 = @"Vertical flip is not supported for block texture formats";
      goto LABEL_33;
    }
    if (!v35
      || [v8 textureType] == 2
      || [v8 textureType] == 3
      || [v8 textureType] == 5)
    {
      if ([a4 objectForKey:@"MTKTextureLoaderOptionCubeLayout"])
      {
        if (!a5) {
          goto LABEL_34;
        }
        v25 = @"Creating cube maps from 2D textures is not supported for KTX files";
        goto LABEL_33;
      }
      if (!_mtkLinkedOnOrAfter(1))
      {
        v8[144] = 1;
        return (MTKTextureLoaderKTX *)v8;
      }
      v36 = (void *)[a4 objectForKey:@"MTKTextureLoaderOptionSRGB"];
      if (!v36) {
        goto LABEL_80;
      }
      v37 = v36;
      if ([v36 BOOLValue])
      {
        uint64_t v38 = selectSRGBFormat([v8 pixelFormat]);
      }
      else
      {
        if ([v37 BOOLValue]) {
          goto LABEL_80;
        }
        uint64_t v38 = selectRGBPixelFormat([v8 pixelFormat]);
      }
      [v8 setPixelFormat:v38];
LABEL_80:
      v39 = (void *)[a4 objectForKey:@"MTKTextureLoaderOptionPackedRowStride"];
      if (v39) {
        v8[144] = [v39 BOOLValue];
      }
      else {
        v8[144] = 0;
      }
      return (MTKTextureLoaderKTX *)v8;
    }
    if (!a5) {
      goto LABEL_34;
    }
    v25 = @"Vertical flip is only supported for 2D, 2D array, and cube map textures";
LABEL_33:
    *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v25);
    goto LABEL_34;
  }
  return (MTKTextureLoaderKTX *)v8;
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  unsigned int v10 = [(NSData *)self->_imageData bytes];
  NSUInteger v11 = [(NSData *)self->_imageData length];
  unint64_t v39 = [(MTKTextureLoaderData *)self width];
  unint64_t v38 = [(MTKTextureLoaderData *)self height];
  if ([(MTKTextureLoaderData *)self numMipmapLevels])
  {
    uint64_t v37 = 0;
    unsigned int v12 = &v10[v11];
    uint64_t v33 = &v10[v11];
    while (1)
    {
      if ((self->_pixelFormatInfo.flags & 0x400) != 0)
      {
        unint64_t v13 = (v39 + self->_pixelFormatInfo.type.compressed.blockWidth - 1)
            / self->_pixelFormatInfo.type.compressed.blockWidth
            * self->_pixelFormatInfo.type.normal.pixelBytes;
        unint64_t v14 = (v38 + self->_pixelFormatInfo.type.normal.pixelBytesRender - 1)
            / self->_pixelFormatInfo.type.normal.pixelBytesRender;
      }
      else
      {
        unint64_t v13 = self->_packedRowStride
            ? self->_pixelFormatInfo.type.normal.pixelBytes * v39
            : (self->_pixelFormatInfo.type.normal.pixelBytes * v39 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v14 = v38;
      }
      unint64_t v15 = v13 * v14;
      unint64_t v16 = (unint64_t)(v10 + 4);
      if ([(MTKTextureLoaderData *)self numArrayElements]) {
        break;
      }
LABEL_35:
      if (v39 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v39 >> 1;
      }
      uint64_t v26 = v38 >> 1;
      if (v38 <= 1) {
        uint64_t v26 = 1;
      }
      unint64_t v38 = v26;
      unint64_t v39 = v25;
      unsigned int v10 = (char *)((v16 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      if ([(MTKTextureLoaderData *)self numMipmapLevels] <= ++v37) {
        return 0;
      }
    }
    unint64_t v29 = v13;
    uint64_t v17 = 0;
    while (![(MTKTextureLoaderData *)self numFaces])
    {
LABEL_34:
      if ([(MTKTextureLoaderData *)self numArrayElements] <= ++v17) {
        goto LABEL_35;
      }
    }
    uint64_t v18 = 0;
    BOOL v20 = v37 == a5 && v17 == a3;
    BOOL v32 = v20;
    while (![(MTKTextureLoaderData *)self depth])
    {
LABEL_31:
      if ([(MTKTextureLoaderData *)self textureType] == 5) {
        unint64_t v16 = (v16 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
      if ([(MTKTextureLoaderData *)self numFaces] <= ++v18) {
        goto LABEL_34;
      }
    }
    unint64_t v21 = 0;
    BOOL v22 = v18 == a4 && v32;
    unint64_t v23 = (unint64_t)&v33[-v16];
    while (v16 >= (unint64_t)v12 || v23 >= v15)
    {
      if (a6 == v21 && v22)
      {
        *a7 = v29;
        *a8 = v15;
        uint64_t v28 = (void *)MEMORY[0x263EFF8F8];
        return (id)[v28 dataWithBytesNoCopy:v16 length:v15 freeWhenDone:0];
      }
      v16 += v15;
      ++v21;
      v23 -= v15;
      if ([(MTKTextureLoaderData *)self depth] <= v21) {
        goto LABEL_31;
      }
    }
  }
  return 0;
}

+ (BOOL)isKTXFile:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ((unint64_t)[a3 length] < 0x40) {
    return 0;
  }
  uint64_t v5 = [a3 bytes];
  return *(void *)v5 == gKTXFileIdentifier && *(_DWORD *)(v5 + 8) == (unint64_t)dword_26787FFE0;
}

- (BOOL)parseKeyValueBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5 = &a3[a4];
  v6 = &a3[a4 - 4];
  if (v6 <= a3)
  {
LABEL_11:
    LOBYTE(v18) = 1;
  }
  else
  {
    v8 = a3;
    while (1)
    {
      unsigned int v12 = *(_DWORD *)v8;
      unsigned int v10 = v8 + 4;
      size_t v11 = v12;
      if (v5 - v10 < (unint64_t)v12) {
        break;
      }
      size_t v13 = strnlen(v10, v11);
      if (!v13 || v11 <= v13) {
        break;
      }
      size_t v15 = v13;
      size_t v16 = v11 - v13;
      uint64_t v17 = [NSString stringWithCString:v10 encoding:4];
      BOOL v18 = -[MTKTextureLoaderKTX parseKey:value:error:](self, "parseKey:value:error:", v17, [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v10[v15 + 1] length:v16 freeWhenDone:0], a5);
      if (!v18) {
        return v18;
      }
      v8 = (const char *)((unint64_t)&v10[v11 + 3] & 0xFFFFFFFFFFFFFFFCLL);
      if (v6 <= v8) {
        goto LABEL_11;
      }
    }
    LOBYTE(v18) = 0;
  }
  return v18;
}

- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  if (a5 == a4 && (v7 & 1) == 0)
  {
    if ((int)a4 <= 33318)
    {
      int v14 = 6403;
      unint64_t v15 = 12;
      if (a3 != 5120) {
        unint64_t v15 = 0;
      }
      if (a3 == 5121) {
        unint64_t v15 = 10;
      }
      uint64_t v16 = 70;
      if (a3 != 5121) {
        uint64_t v16 = 0;
      }
      unint64_t v17 = 80;
      if (a3 != 5121) {
        unint64_t v17 = 0;
      }
      if (a4 != 32993) {
        unint64_t v17 = 0;
      }
      if (a4 == 6408) {
        unint64_t v17 = v16;
      }
    }
    else
    {
      if ((int)a4 <= 36243)
      {
        unint64_t v8 = 30;
        if (a3 != 5121) {
          unint64_t v8 = 0;
        }
        uint64_t v9 = 34;
        if (a3 != 5120) {
          uint64_t v9 = 0;
        }
        unint64_t v10 = 33;
        if (a3 != 5121) {
          unint64_t v10 = v9;
        }
        if (a4 != 33320) {
          unint64_t v10 = 0;
        }
        if (a4 == 33319) {
          return v8;
        }
        else {
          return v10;
        }
      }
      int v14 = 36244;
      unint64_t v15 = 14;
      if (a3 != 5120) {
        unint64_t v15 = 0;
      }
      if (a3 == 5121) {
        unint64_t v15 = 13;
      }
      uint64_t v18 = 91;
      if (a3 != 33640) {
        uint64_t v18 = 0;
      }
      if (a4 == 36249) {
        unint64_t v17 = v18;
      }
      else {
        unint64_t v17 = 0;
      }
    }
    if (a4 == v14) {
      return v15;
    }
    else {
      return v17;
    }
  }
  if (a5 != a4 || ((v7 ^ 1) & 1) != 0) {
    return [(MTKTextureLoaderKTX *)self determineFormatFromSizedFormat:a5];
  }
  if (a5 <= a4)
  {
    switch(a4)
    {
      case 0x8DBBu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 140;
        break;
      case 0x8DBCu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 141;
        break;
      case 0x8DBDu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 142;
        break;
      case 0x8DBEu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 143;
        break;
      default:
        JUMPOUT(0);
    }
LABEL_62:
    if (v12) {
      return v13;
    }
    else {
      return 0;
    }
  }
  else
  {
    switch(a4)
    {
      case 0x8E8Cu:
        BOOL v12 = a6 == 6408;
        unint64_t v13 = 152;
        goto LABEL_62;
      case 0x8E8Du:
        BOOL v12 = a6 == 6408;
        unint64_t v13 = 153;
        goto LABEL_62;
      case 0x8E8Eu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 150;
        goto LABEL_62;
      case 0x8E8Fu:
        BOOL v12 = a6 == 6407;
        unint64_t v13 = 151;
        goto LABEL_62;
      default:
        unint64_t result = 0;
        break;
    }
  }
  return result;
}

- (unint64_t)determineFormatFromSizedFormat:(unint64_t)a3
{
  char v4 = _mtkLinkedBefore(1);
  uint64_t v5 = 0;
  while (determineFormatFromSizedFormat__ktxFormats[v5] != a3)
  {
    if (++v5 == 105) {
      return 0;
    }
  }
  if (v5 == 1) {
    char v7 = v4;
  }
  else {
    char v7 = 0;
  }
  if (v7) {
    return 71;
  }
  else {
    return determineFormatFromSizedFormat__mtlFormats[v5];
  }
}

- (void)dealloc
{
  self->_imageData = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoaderKTX;
  [(MTKTextureLoaderData *)&v3 dealloc];
}

- (BOOL)parseKey:(id)a3 value:(id)a4 error:(id *)a5
{
  if (objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "isEqualToString:", @"ktxorientation")
    && _mtkLinkedOnOrAfter(0))
  {
    unint64_t v8 = (void *)[[NSString alloc] initWithData:a4 encoding:4];
    if ([v8 hasPrefix:@"S=r,T=d"])
    {
      uint64_t v9 = &MTKTextureLoaderOriginTopLeft;
    }
    else
    {
      if (([v8 hasPrefix:@"S=r,T=u"] & 1) == 0)
      {
        BOOL v10 = 0;
        if (a5) {
          *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Unsupported image orientation");
        }
        goto LABEL_9;
      }
      uint64_t v9 = &MTKTextureLoaderOriginBottomLeft;
    }
    [(MTKTextureLoaderData *)self setImageOrigin:*v9];
    BOOL v10 = 1;
LABEL_9:

    return v10;
  }
  return 1;
}

- (void)initWithData:options:error:.cold.1()
{
}

- (void)initWithData:options:error:.cold.2()
{
}

@end