@interface MDLTexture
+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions;
+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions roughness:(float)roughness;
+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names;
+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names bundle:(NSBundle *)bundleOrNil;
+ (MDLTexture)textureNamed:(NSString *)name;
+ (MDLTexture)textureNamed:(NSString *)name assetResolver:(id)resolver;
+ (MDLTexture)textureNamed:(NSString *)name bundle:(NSBundle *)bundleOrNil;
+ (MDLTexture)textureWithData:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
+ (MDLTexture)textureWithURL:(id)a3;
+ (MDLTexture)textureWithURL:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
+ (id)_textureCubeWithSingleImageNamed:(id)a3 bundle:(id)a4;
+ (id)textureFromResource:(id)a3;
+ (id)textureResourceNamed:(id)a3 assetResolver:(id)a4;
- (BOOL)hasAlphaValues;
- (BOOL)isCube;
- (BOOL)writeToURL:(NSURL *)URL;
- (BOOL)writeToURL:(NSURL *)URL level:(NSUInteger)level;
- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type;
- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type level:(NSUInteger)level;
- (CGImageRef)imageFromTexture;
- (CGImageRef)imageFromTextureAtLevel:(NSUInteger)level;
- (MDLTexture)init;
- (MDLTexture)initWithData:(NSData *)pixelData topLeftOrigin:(BOOL)topLeftOrigin name:(NSString *)name dimensions:(vector_int2)dimensions rowStride:(NSInteger)rowStride channelCount:(NSUInteger)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding isCube:(BOOL)isCube;
- (MDLTextureChannelEncoding)channelEncoding;
- (MDLTextureData)textureData;
- (NSData)texelDataWithBottomLeftOrigin;
- (NSData)texelDataWithBottomLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create;
- (NSData)texelDataWithTopLeftOrigin;
- (NSData)texelDataWithTopLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create;
- (NSInteger)rowStride;
- (NSString)name;
- (NSUInteger)channelCount;
- (NSUInteger)mipLevelCount;
- (id)allocateDataAtLevel:(int64_t)a3;
- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4;
- (id)texelDataWithTopLeftOrigin:(unint64_t)a3;
- (vector_int2)dimensions;
- (void)clearTexelData;
- (void)loadDataWithBottomLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5;
- (void)loadDataWithTopLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5;
- (void)setHasAlphaValues:(BOOL)hasAlphaValues;
- (void)setIsCube:(BOOL)isCube;
- (void)setName:(id)a3;
- (void)setTexelDataWithBottomLeftOrigin:(id)a3 atMipLevel:(int64_t)a4;
- (void)setTexelDataWithTopLeftOrigin:(id)a3 atMipLevel:(int64_t)a4;
@end

@implementation MDLTexture

- (void)clearTexelData
{
  for (uint64_t i = 0; i != 14; ++i)
  {
    v4 = (Class *)((char *)&self->super.isa + i * 8);
    v5 = self->_topLeftOriginData[i];
    self->_topLeftOriginData[i] = 0;

    v4[2] = 0;
    v6 = self->_bottomLeftOriginData[i];
    v4[53] = 0;

    v4[18] = 0;
  }
}

- (vector_int2)dimensions
{
  return *(vector_int2 *)self->_anon_118;
}

- (NSInteger)rowStride
{
  return *(void *)&self->_anon_118[8];
}

- (NSUInteger)channelCount
{
  return self->_textureData.channelCount;
}

- (MDLTextureData)textureData
{
  return &self->_textureData;
}

- (BOOL)isCube
{
  return self->_anon_118[16];
}

- (void)setIsCube:(BOOL)isCube
{
  self->_anon_118[16] = isCube;
}

- (BOOL)hasAlphaValues
{
  if (self->_textureData.channelCount < 4
    || (*(void *)self->_anon_118 ? (BOOL v3 = HIDWORD(*(void *)self->_anon_118) == 0) : (BOOL v3 = 1), v3))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = *(NSData **)&self->_anon_118[8];
    if (v4)
    {
      v6 = self->_topLeftOriginData[0];
      if (v6 || (v4 = self->_bottomLeftOriginData[0]) != 0)
      {
        if (self->_alphaValuesSet)
        {
          LOBYTE(v4) = self->_hasAlphaValues;
        }
        else
        {
          v7 = v6;
          uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
          if (!v10)
          {
            v11 = self->_bottomLeftOriginData[0];
            uint64_t v10 = objc_msgSend_bytes(v11, v12, v13);
          }
          uint64_t v14 = *(void *)self->_anon_118;
          if (SHIDWORD(v14) < 1)
          {
            LOBYTE(v4) = 0;
          }
          else
          {
            uint64_t v15 = 0;
            do
            {
              if ((int)v14 < 1)
              {
                LOBYTE(v4) = 0;
              }
              else
              {
                uint64_t v16 = 0;
                do
                {
                  unsigned int v17 = HIBYTE(*(_DWORD *)(v10 + 4 * v16));
                  LOBYTE(v4) = v17 != 255;
                  ++v16;
                }
                while (v16 < (int)v14 && v17 >= 0xFF);
              }
              if (++v15 >= (unint64_t)HIDWORD(v14)) {
                break;
              }
              v10 += *(void *)&self->_anon_118[8];
            }
            while ((v4 & 1) == 0);
          }
          self->_hasAlphaValues = (char)v4;
          self->_alphaValuesSet = 1;
        }
      }
    }
  }
  return (char)v4;
}

- (void)setHasAlphaValues:(BOOL)hasAlphaValues
{
  self->_alphaValuesSet = 1;
  self->_hasAlphaValues = hasAlphaValues;
}

- (id)allocateDataAtLevel:(int64_t)a3
{
  v3.i32[0] = 0;
  v4.i32[1] = HIDWORD(*(void *)self->_anon_118);
  v4.i32[0] = 1;
  int32x2_t v5 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v3, *(int32x2_t *)self->_anon_118), 0), v4, *(int8x8_t *)self->_anon_118);
  int8x8_t v6 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v3, vdup_lane_s32(v5, 1)), 0), (int8x8_t)(v5.u32[0] | 0x100000000), (int8x8_t)v5);
  if (v6.i32[0] >> a3 <= 1) {
    int v7 = 1;
  }
  else {
    int v7 = v6.i32[0] >> a3;
  }
  if (v6.i32[1] >> a3 <= 1) {
    int v8 = 1;
  }
  else {
    int v8 = v6.i32[1] >> a3;
  }
  int channelCount = self->_textureData.channelCount;
  int v10 = (int)sub_20B1B8320(self->_channelEncoding) / 8;
  id v11 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v13 = objc_msgSend_initWithLength_(v11, v12, v10 * channelCount * v8 * v7);

  return v13;
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  unsigned int v4 = a3;
  int8x8_t v6 = objc_msgSend_allocateDataAtLevel_(self, a2, a3, a4);
  int channelCount = self->_textureData.channelCount;
  int v10 = sub_20B1B8320(self->_channelEncoding) & 0xFFFFFFF8;
  if (channelCount == 4 && v10 == 8)
  {
    v11.i32[0] = 0;
    int v13 = 1;
    v14.i32[1] = HIDWORD(*(void *)self->_anon_118);
    v14.i32[0] = 1;
    int32x2_t v15 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v11, *(int32x2_t *)self->_anon_118), 0), v14, *(int8x8_t *)self->_anon_118);
    int8x8_t v16 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v11, vdup_lane_s32(v15, 1)), 0), (int8x8_t)(v15.u32[0] | 0x100000000), (int8x8_t)v15);
    if (v16.i32[0] >> v4 <= 1) {
      int v17 = 1;
    }
    else {
      int v17 = v16.i32[0] >> v4;
    }
    if (v16.i32[1] >> v4 <= 1) {
      int v18 = 1;
    }
    else {
      int v18 = v16.i32[1] >> v4;
    }
    uint64_t v19 = v4;
    while ((int)v19 >= 1)
    {
      v13 *= 2;
      v20 = &self->super.isa + v19;
      Class v21 = v20[38];
      if (v21)
      {
        v30 = v21;
        uint64_t v33 = objc_msgSend_bytes(v30, v31, v32);
        id v34 = v6;
        v37 = (_DWORD *)objc_msgSend_bytes(v34, v35, v36);
        int v38 = 0;
        do
        {
          v39 = (_DWORD *)v33;
          int v40 = v17;
          do
          {
            *v37++ = *v39;
            v39 += v13;
            --v40;
          }
          while (v40);
          ++v38;
          v33 += 4 * v13 * v17 * v13;
        }
        while (v38 != v18);
        break;
      }
      --v19;
      if (v20[52])
      {
        uint64_t v22 = objc_msgSend_bytes(0, v8, v9);
        id v23 = v6;
        v26 = (_DWORD *)objc_msgSend_bytes(v23, v24, v25);
        int v27 = 0;
        do
        {
          v28 = (_DWORD *)v22;
          int v29 = v17;
          do
          {
            *v26++ = *v28;
            v28 += v13;
            --v29;
          }
          while (v29);
          ++v27;
          v22 += 4 * v13 * v17 * v13;
        }
        while (v27 != v18);
        break;
      }
    }
  }

  return v6;
}

- (MDLTexture)init
{
  v9.receiver = self;
  v9.super_class = (Class)MDLTexture;
  v2 = [(MDLTexture *)&v9 init];
  int32x2_t v5 = v2;
  if (v2)
  {
    objc_msgSend_clearTexelData(v2, v3, v4);
    name = v5->_name;
    v5->_name = (NSString *)&stru_26BF51EF0;

    int v7 = v5;
  }

  return v5;
}

- (MDLTexture)initWithData:(NSData *)pixelData topLeftOrigin:(BOOL)topLeftOrigin name:(NSString *)name dimensions:(vector_int2)dimensions rowStride:(NSInteger)rowStride channelCount:(NSUInteger)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding isCube:(BOOL)isCube
{
  int v11 = channelCount;
  BOOL v15 = topLeftOrigin;
  int v17 = pixelData;
  int v18 = name;
  v40.receiver = self;
  v40.super_class = (Class)MDLTexture;
  uint64_t v19 = [(MDLTexture *)&v40 init];
  uint64_t v22 = v19;
  if (v19)
  {
    objc_msgSend_clearTexelData(v19, v20, v21);
    if (v18)
    {
      uint64_t v24 = objc_msgSend_stringWithString_(NSString, v23, (uint64_t)v18);
      uint64_t v25 = v22->_name;
      v22->_name = (NSString *)v24;
    }
    else
    {
      uint64_t v25 = v22->_name;
      v22->_name = (NSString *)&stru_26BF51EF0;
    }

    v26 = v17;
    int v27 = v26;
    if (v15)
    {
      v28 = v22->_topLeftOriginData[0];
      v22->_topLeftOriginData[0] = v26;

      int v29 = v27;
      uint64_t v32 = objc_msgSend_bytes(v29, v30, v31);
      uint64_t v33 = 16;
    }
    else
    {
      id v34 = v22->_bottomLeftOriginData[0];
      v22->_bottomLeftOriginData[0] = v26;

      v35 = v27;
      uint64_t v32 = objc_msgSend_bytes(v35, v36, v37);
      uint64_t v33 = 144;
    }
    *(Class *)((char *)&v22->super.isa + v33) = (Class)v32;
    *(vector_int2 *)v22->_anon_118 = dimensions;
    *(void *)&v22->_anon_118[8] = rowStride;
    v22->_textureData.int channelCount = v11;
    v22->_channelEncoding = channelEncoding;
    v22->_anon_118[16] = isCube;
    int v38 = v22;
  }

  return v22;
}

- (NSUInteger)mipLevelCount
{
  for (NSUInteger result = 0; result != 14; ++result)
  {
    uint64_t v4 = &self->super.isa + result;
    if (!v4[39] && !v4[53]) {
      break;
    }
  }
  return result;
}

+ (id)_textureCubeWithSingleImageNamed:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v54 = a4;
  v55 = v6;
  sub_20B1B8BF4(v6, v54);
  CFURLRef v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend_fileURLWithPath_(NSURL, v7, (uint64_t)v6),
        (CFURLRef v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v9 = CGImageSourceCreateWithURL(v8, 0);
    int v10 = v9;
    if (v9)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
      if (ImageAtIndex)
      {

        __int32 Width = CGImageGetWidth(ImageAtIndex);
        int Height = CGImageGetHeight(ImageAtIndex);
        cf = ImageAtIndex;
        if (Height <= Width)
        {
          id v35 = objc_alloc((Class)a1);
          isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v35, v36, 0, 1, v6, 4 * Height, 4, 1, COERCE_DOUBLE(__PAIR64__(Width, Height)), 1);
          size_t v37 = 0;
          if (Height < 0) {
            int v38 = 1;
          }
          else {
            int v38 = Height;
          }
          while (CGImageSourceGetCount(v10) > v37)
          {
            if (v37) {
              v39 = CGImageSourceCreateImageAtIndex(v10, v37, 0);
            }
            else {
              v39 = (CGImage *)CFRetain(cf);
            }
            objc_super v40 = v39;
            if (v38 >> v37 <= 1) {
              size_t v41 = 1;
            }
            else {
              size_t v41 = (v38 >> v37);
            }
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(isCube, v43, v37, 1);
            id v44 = objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend_bytes(v44, v45, v46);
            v48 = CGBitmapContextCreate(v47, v41, (6 * v41), 8uLL, (4 * v41), DeviceRGB, 1u);
            CFRelease(DeviceRGB);

            CGContextSetBlendMode(v48, kCGBlendModeCopy);
            int v49 = 0;
            int v50 = 5 * v41;
            int v51 = 6;
            do
            {
              v60.origin.x = (double)v49;
              v60.origin.y = 0.0;
              v60.size.width = (double)(int)v41;
              v60.size.height = (double)(int)v41;
              v52 = CGImageCreateWithImageInRect(v40, v60);
              v61.origin.y = (float)v50;
              v61.origin.x = 0.0;
              v61.size.width = (double)(int)v41;
              v61.size.height = (double)(int)v41;
              CGContextDrawImage(v48, v61, v52);
              CGImageRelease(v52);
              v49 += v41;
              v50 -= v41;
              --v51;
            }
            while (v51);
            CGContextRelease(v48);
            CGImageRelease(v40);
            ++v37;
          }
        }
        else
        {
          id v14 = objc_alloc((Class)a1);
          isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v14, v15, 0, 1, v6, 4 * Width, 4, 1, 1);
          v16.i32[0] = 0;
          size_t v17 = 0;
          v18.i32[0] = Width;
          int32x2_t v19 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v16, v18), 0), (int8x8_t)__PAIR64__(Height, 1), (int8x8_t)__PAIR64__(Height, Width));
          int8x8_t v20 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v16, vdup_lane_s32(v19, 1)), 0), (int8x8_t)(v19.u32[0] | 0x100000000), (int8x8_t)v19);
          int v21 = v20.i32[1];
          int v22 = v20.i32[0];
          while (CGImageSourceGetCount(v10) > v17)
          {
            if (v17) {
              id v23 = CGImageSourceCreateImageAtIndex(v10, v17, 0);
            }
            else {
              id v23 = (CGImage *)CFRetain(cf);
            }
            uint64_t v24 = v23;
            if (v22 >> v17 <= 1) {
              size_t v25 = 1;
            }
            else {
              size_t v25 = (v22 >> v17);
            }
            if (v21 >> v17 <= 1) {
              size_t v26 = 1;
            }
            else {
              size_t v26 = (v21 >> v17);
            }
            int v27 = CGColorSpaceCreateDeviceRGB();
            objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(isCube, v28, v17, 1);
            id v29 = objc_claimAutoreleasedReturnValue();
            uint64_t v32 = objc_msgSend_bytes(v29, v30, v31);
            uint64_t v33 = CGBitmapContextCreate(v32, v25, v26, 8uLL, (4 * v25), v27, 1u);
            CFRelease(v27);

            CGContextSetBlendMode(v33, kCGBlendModeCopy);
            v59.size.width = (double)(int)v25;
            v59.size.height = (double)(int)v26;
            v59.origin.x = 0.0;
            v59.origin.y = 0.0;
            CGContextDrawImage(v33, v59, v24);
            CGContextRelease(v33);
            CFRelease(v24);
            ++v17;
          }
        }
        id v34 = isCube;
        CFRelease(cf);
        CFRelease(v10);
        goto LABEL_34;
      }
      CFRelease(v10);
    }
  }

  id v34 = 0;
LABEL_34:

  return v34;
}

+ (MDLTexture)textureWithURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  CFURLRef v5 = v4;
  if (v4
    && (id v6 = CGImageSourceCreateWithURL(v4, 0), (v7 = v6) != 0)
    && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0), CFRelease(v7), ImageAtIndex))
  {
    int Width = CGImageGetWidth(ImageAtIndex);
    int Height = CGImageGetHeight(ImageAtIndex);
    id v11 = objc_alloc(MEMORY[0x263EFF990]);
    size_t v12 = 4 * Width;
    id v14 = objc_msgSend_initWithLength_(v11, v13, Height * v12);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v16 = v14;
    int32x2_t v19 = objc_msgSend_bytes(v16, v17, v18);
    int8x8_t v20 = CGBitmapContextCreate(v19, Width, Height, 8uLL, v12, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    CGContextSetBlendMode(v20, kCGBlendModeCopy);
    v27.size.width = (double)Width;
    v27.size.height = (double)Height;
    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    CGContextDrawImage(v20, v27, ImageAtIndex);
    CGContextRelease(v20);
    CFRelease(ImageAtIndex);
    id v21 = objc_alloc((Class)a1);
    char v25 = 0;
    isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v21, v22, (uint64_t)v16, 1, 0, v12, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v25);
  }
  else
  {
    isCube = 0;
  }

  return (MDLTexture *)isCube;
}

+ (MDLTexture)textureWithURL:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v7 = a3;
  CFURLRef v8 = [MDLMemoryMappedData alloc];
  int v10 = objc_msgSend_initWithURL_offset_length_(v8, v9, (uint64_t)v7, a4, a5);
  objc_msgSend_dataNoCopy(v10, v11, v12);
  CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  CFDataRef v14 = v13;
  if (!v13) {
    goto LABEL_5;
  }
  BOOL v15 = CGImageSourceCreateWithData(v13, 0);
  isCube = v15;
  if (!v15) {
    goto LABEL_6;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
  CFRelease(isCube);
  if (ImageAtIndex)
  {
    int Width = CGImageGetWidth(ImageAtIndex);
    int Height = CGImageGetHeight(ImageAtIndex);
    id v20 = objc_alloc(MEMORY[0x263EFF990]);
    size_t v21 = 4 * Width;
    id v33 = (id)objc_msgSend_initWithLength_(v20, v22, Height * v21);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v24 = v33;
    CGRect v27 = objc_msgSend_bytes(v24, v25, v26);
    v28 = CGBitmapContextCreate(v27, Width, Height, 8uLL, v21, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    CGContextSetBlendMode(v28, kCGBlendModeCopy);
    v36.size.width = (double)Width;
    v36.size.height = (double)Height;
    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    CGContextDrawImage(v28, v36, ImageAtIndex);
    CGContextRelease(v28);
    CFRelease(ImageAtIndex);
    id v29 = objc_alloc((Class)a1);
    char v32 = 0;
    isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v29, v30, (uint64_t)v24, 1, 0, v21, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v32);
  }
  else
  {
LABEL_5:
    isCube = 0;
  }
LABEL_6:

  return (MDLTexture *)isCube;
}

+ (MDLTexture)textureWithData:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v8 = a3;
  objc_super v9 = (void *)MEMORY[0x263EFF8F8];
  id v10 = v8;
  uint64_t v13 = objc_msgSend_bytes(v10, v11, v12);
  objc_msgSend_dataWithBytes_length_(v9, v14, v13 + a4, a5);
  CFDataRef v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v16 = CGImageSourceCreateWithData(v15, 0);
  isCube = v16;
  if (v16)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
    CFRelease(isCube);
    if (ImageAtIndex)
    {
      v30 = (objc_class *)a1;
      int Width = CGImageGetWidth(ImageAtIndex);
      int Height = CGImageGetHeight(ImageAtIndex);
      size_t v21 = malloc_type_malloc(Height * (uint64_t)(4 * Width), 0xA58C4EA5uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      id v23 = CGBitmapContextCreate(v21, Width, Height, 8uLL, 4 * Width, DeviceRGB, 1u);
      CFRelease(DeviceRGB);
      CGContextSetBlendMode(v23, kCGBlendModeCopy);
      v32.size.width = (double)Width;
      v32.size.height = (double)Height;
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      CGContextDrawImage(v23, v32, ImageAtIndex);
      CGContextRelease(v23);
      id v24 = objc_alloc(MEMORY[0x263EFF990]);
      uint64_t v26 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v24, v25, (uint64_t)v21, Height * (uint64_t)(4 * Width), 1);
      CFRelease(ImageAtIndex);
      id v27 = [v30 alloc];
      isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v27, v28, (uint64_t)v26, 1, 0, 4 * Width, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), 0);
    }
    else
    {
      isCube = 0;
    }
  }

  return (MDLTexture *)isCube;
}

+ (id)textureResourceNamed:(id)a3 assetResolver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = objc_msgSend_resolveAssetNamed_(v6, v7, (uint64_t)v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    v48[0] = 0;
    v48[1] = 0;
    uint64_t v49 = 0;
    id v10 = v5;
    uint64_t v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
    sub_20B07F8E0(&v42, v13);
    pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathInner();
    *(_OWORD *)v48 = v46;
    uint64_t v49 = v47;
    uint64_t v47 = 0;
    long long v46 = 0uLL;
    if (v45 < 0) {
      operator delete(__p);
    }
    if (v43 < 0) {
      operator delete(v42);
    }
    if (v49 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)v48);
    }
    else {
    CFDataRef v15 = objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)v48[0]);
    }
    uint64_t v18 = objc_msgSend_pathExtension(v15, v16, v17);
    size_t v21 = objc_msgSend_lowercaseString(v18, v19, v20);

    if ((objc_msgSend_isEqualToString_(v21, v22, @"jpg") & 1) == 0
      && (objc_msgSend_isEqualToString_(v21, v23, @"png") & 1) == 0
      && (objc_msgSend_isEqualToString_(v21, v23, @"jpeg") & 1) == 0)
    {
      NSLog(&cfstr_WarningUnsuppo.isa, v21);
    }
    id v24 = objc_msgSend_resolveInsideArchiveWithAssetNamed_(v9, v23, (uint64_t)v10);
    uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0);
    uint64_t v29 = objc_msgSend_longValue(v26, v27, v28);

    uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v24, v30, 1);
    uint64_t v34 = objc_msgSend_longValue(v31, v32, v33);

    id v35 = [MDLMemoryMappedData alloc];
    size_t v37 = objc_msgSend_initWithURL_offset_length_(v35, v36, (uint64_t)v8, v29, v34);
    objc_super v40 = objc_msgSend_dataNoCopy(v37, v38, v39);

    if (SHIBYTE(v49) < 0) {
      operator delete(v48[0]);
    }
  }
  else
  {
    NSLog(&cfstr_NeedsMdlassetL.isa);
    objc_super v40 = 0;
  }

  return v40;
}

+ (MDLTexture)textureNamed:(NSString *)name assetResolver:(id)resolver
{
  id v5 = name;
  id v6 = resolver;
  id v8 = objc_msgSend_resolveAssetNamed_(v6, v7, (uint64_t)v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    v52[0] = 0;
    v52[1] = 0;
    uint64_t v53 = 0;
    id v11 = v5;
    CFDataRef v14 = (char *)objc_msgSend_UTF8String(v11, v12, v13);
    sub_20B07F8E0(&v46, v14);
    pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathInner();
    *(_OWORD *)v52 = v50;
    uint64_t v53 = v51;
    uint64_t v51 = 0;
    long long v50 = 0uLL;
    if (v49 < 0) {
      operator delete(__p);
    }
    if (v47 < 0) {
      operator delete(v46);
    }
    if (v53 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)v52);
    }
    else {
    id v16 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)v52[0]);
    }
    int32x2_t v19 = objc_msgSend_pathExtension(v16, v17, v18);
    int v22 = objc_msgSend_lowercaseString(v19, v20, v21);

    if ((objc_msgSend_isEqualToString_(v22, v23, @"jpg") & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v24, @"png") & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v24, @"jpeg") & 1) == 0)
    {
      NSLog(&cfstr_WarningUnsuppo.isa, v22);
    }
    char v25 = objc_msgSend_resolveInsideArchiveWithAssetNamed_(v10, v24, (uint64_t)v11);
    id v27 = v25;
    if (v25)
    {
      uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, 0);
      uint64_t v31 = objc_msgSend_longValue(v28, v29, v30);

      uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v27, v32, 1);
      uint64_t v36 = objc_msgSend_longValue(v33, v34, v35);

      uint64_t v39 = objc_msgSend_data(v10, v37, v38);

      if (v39)
      {
        v42 = objc_msgSend_data(v10, v40, v41);
        id v44 = objc_msgSend_textureWithData_offset_size_(MDLTexture, v43, (uint64_t)v42, v31, v36);
      }
      else
      {
        id v44 = objc_msgSend_textureWithURL_offset_size_(MDLTexture, v40, (uint64_t)v8, v31, v36);
      }
    }
    else
    {
      id v44 = 0;
    }

    if (SHIBYTE(v53) < 0) {
      operator delete(v52[0]);
    }
  }
  else
  {
    id v44 = objc_msgSend_textureWithURL_(MDLTexture, v9, (uint64_t)v8);
  }

  return (MDLTexture *)v44;
}

+ (id)textureFromResource:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  id v5 = CGImageSourceCreateWithData(v4, 0);
  id v6 = v5;
  if (v5 && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0), CFRelease(v6), ImageAtIndex))
  {
    int Width = CGImageGetWidth(ImageAtIndex);
    int Height = CGImageGetHeight(ImageAtIndex);
    id v10 = objc_alloc(MEMORY[0x263EFF990]);
    size_t v11 = 4 * Width;
    uint64_t v13 = objc_msgSend_initWithLength_(v10, v12, Height * v11);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v15 = v13;
    uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);
    int32x2_t v19 = CGBitmapContextCreate(v18, Width, Height, 8uLL, v11, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    CGContextSetBlendMode(v19, kCGBlendModeCopy);
    v26.size.width = (double)Width;
    v26.size.height = (double)Height;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    CGContextDrawImage(v19, v26, ImageAtIndex);
    CGContextRelease(v19);
    CFRelease(ImageAtIndex);
    id v20 = objc_alloc((Class)a1);
    char v24 = 0;
    isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v20, v21, (uint64_t)v15, 1, 0, v11, 4, 1, COERCE_DOUBLE(__PAIR64__(Height, Width)), v24);
  }
  else
  {
    isCube = 0;
  }

  return isCube;
}

+ (MDLTexture)textureNamed:(NSString *)name bundle:(NSBundle *)bundleOrNil
{
  id v6 = name;
  id v9 = bundleOrNil;
  if (v6 && objc_msgSend_length(v6, v7, v8))
  {
    if (!v9)
    {
      objc_msgSend_mainBundle(MEMORY[0x263F086E0], v10, v11);
      id v9 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = sub_20B1B8BF4(v6, v9);
    if (v13)
    {
      CFDataRef v14 = objc_msgSend_textureWithURL_(a1, v12, (uint64_t)v13);
    }
    else
    {
      CFDataRef v14 = 0;
    }
  }
  else
  {
    CFDataRef v14 = 0;
  }

  return (MDLTexture *)v14;
}

+ (MDLTexture)textureNamed:(NSString *)name
{
  int32x2_t v3 = objc_msgSend_textureNamed_bundle_(a1, a2, (uint64_t)name, 0);

  return (MDLTexture *)v3;
}

+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names bundle:(NSBundle *)bundleOrNil
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = names;
  id v7 = bundleOrNil;
  if (objc_msgSend_count(v6, v8, v9) == 1)
  {
    uint64_t v12 = objc_msgSend_firstObject(v6, v10, v11);
    isCube = objc_msgSend__textureCubeWithSingleImageNamed_bundle_(a1, v13, (uint64_t)v12, v7);
  }
  else
  {
    uint64_t v15 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    *(_OWORD *)image = 0u;
    do
    {
      id v16 = objc_msgSend_objectAtIndexedSubscript_(v6, v10, v15);
      sub_20B1B8BF4(v16, v7);
      CFURLRef v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        int32x2_t v19 = NSURL;
        id v20 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, v15);
        objc_msgSend_fileURLWithPath_(v19, v21, (uint64_t)v20);
        CFURLRef v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      }
      int v22 = CGImageSourceCreateWithURL(v17, 0);
      id v23 = v22;
      if (v22)
      {
        image[v15] = CGImageSourceCreateImageAtIndex(v22, 0, 0);
        CFRelease(v23);
      }

      ++v15;
    }
    while (v15 != 6);
    char v24 = image[0];
    int Width = CGImageGetWidth(image[0]);
    int Height = CGImageGetHeight(v24);
    id v27 = objc_alloc(MEMORY[0x263EFF990]);
    size_t v28 = 4 * Width;
    id v47 = (id)objc_msgSend_initWithLength_(v27, v29, v28 * 6 * Height);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v31 = v47;
    uint64_t v34 = objc_msgSend_bytes(v31, v32, v33);
    uint64_t v35 = CGBitmapContextCreate(v34, Width, 6 * Height, 8uLL, v28, DeviceRGB, 1u);
    CFRelease(DeviceRGB);
    long long v46 = (objc_class *)a1;
    CGContextSetBlendMode(v35, kCGBlendModeCopy);
    uint64_t v36 = 0;
    LODWORD(v37) = Width;
    HIDWORD(v37) = 6 * Height;
    double v45 = v37;
    double v38 = (double)Width;
    int v39 = 30 * Height;
    do
    {
      v53.origin.y = (double)(v39 / 6);
      v53.origin.x = 0.0;
      v53.size.width = v38;
      v53.size.height = (double)Height;
      CGContextDrawImage(v35, v53, image[v36]);
      v39 -= 6 * Height;
      ++v36;
    }
    while (v36 != 6);
    CGContextRelease(v35);
    for (uint64_t i = 0; i != 6; ++i)
    {
      CGImageRef v41 = image[i];
      if (v41)
      {
        CFRelease(v41);
        image[i] = 0;
      }
    }
    id v42 = [v46 alloc];
    isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v42, v43, (uint64_t)v31, 1, 0, v28, 4, 1, v45, 1);
  }

  return (MDLTexture *)isCube;
}

+ (MDLTexture)textureCubeWithImagesNamed:(NSArray *)names
{
  int32x2_t v3 = names;
  id v6 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v4, v5);
  uint64_t v8 = objc_msgSend_textureCubeWithImagesNamed_bundle_(MDLTexture, v7, (uint64_t)v3, v6);

  return (MDLTexture *)v8;
}

- (void)loadDataWithTopLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5
{
  if (a3 <= 13)
  {
    topLeftOriginData = self->_topLeftOriginData;
    if (self->_topLeftOriginData[a3]) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !a4;
    }
    if (!v8)
    {
      uint64_t v9 = objc_msgSend_generateDataAtLevel_selector_(self, a2, a3, a5);
      id v10 = topLeftOriginData[a3];
      topLeftOriginData[a3] = (NSData *)v9;

      uint64_t v11 = topLeftOriginData[a3];
      self->_textureData.topLeftBytesForMip[a3] = (char *)objc_msgSend_bytes(v11, v12, v13);
    }
  }
}

- (void)loadDataWithBottomLeftOriginAtMipLevel:(int64_t)a3 create:(BOOL)a4 selector:(SEL)a5
{
  if (a3 <= 13)
  {
    bottomLeftOriginData = self->_bottomLeftOriginData;
    if (self->_bottomLeftOriginData[a3]) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !a4;
    }
    if (!v8)
    {
      uint64_t v9 = objc_msgSend_generateDataAtLevel_selector_(self, a2, a3, a5);
      id v10 = bottomLeftOriginData[a3];
      bottomLeftOriginData[a3] = (NSData *)v9;

      uint64_t v11 = bottomLeftOriginData[a3];
      self->_textureData.bottomLeftBytesForMip[a3] = (char *)objc_msgSend_bytes(v11, v12, v13);
    }
  }
}

- (NSData)texelDataWithTopLeftOrigin
{
  return (NSData *)objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(self, a2, 0, self->_selfCreating);
}

- (id)texelDataWithTopLeftOrigin:(unint64_t)a3
{
  return (id)objc_msgSend_texelDataWithTopLeftOriginAtMipLevel_create_(self, a2, a3, self->_selfCreating);
}

- (NSData)texelDataWithBottomLeftOrigin
{
  return (NSData *)MEMORY[0x270F9A6D0](self, sel_texelDataWithBottomLeftOriginAtMipLevel_create_, 0);
}

- (NSData)texelDataWithTopLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create
{
  topLeftOriginData = self->_topLeftOriginData;
  if (!self->_topLeftOriginData[level])
  {
    id v7 = &self->super.isa + level;
    Class v8 = v7[53];
    if (v8)
    {
      v4.i32[0] = 0;
      v9.i32[1] = HIDWORD(*(void *)self->_anon_118);
      v9.i32[0] = 1;
      int32x2_t v10 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->_anon_118), 0), v9, *(int8x8_t *)self->_anon_118);
      double v20 = COERCE_DOUBLE(vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v10, 1)), 0), (int8x8_t)(v10.u32[0] | 0x100000000), (int8x8_t)v10), vneg_s32(vdup_n_s32(level))), (int32x2_t)0x100000001));
      int channelCount = self->_textureData.channelCount;
      int v12 = sub_20B1B8320(self->_channelEncoding);
      uint64_t v13 = sub_20B1BA648(v8, v12 / 8 * channelCount * LODWORD(v20), v20);
      CFDataRef v14 = topLeftOriginData[level];
      topLeftOriginData[level] = (NSData *)v13;

      uint64_t v15 = topLeftOriginData[level];
      v7[2] = (Class)objc_msgSend_bytes(v15, v16, v17);
    }
    else
    {
      objc_msgSend_loadDataWithTopLeftOriginAtMipLevel_create_selector_(self, a2, level, create, a2);
    }
  }
  uint64_t v18 = topLeftOriginData[level];

  return v18;
}

- (NSData)texelDataWithBottomLeftOriginAtMipLevel:(NSInteger)level create:(BOOL)create
{
  bottomLeftOriginData = self->_bottomLeftOriginData;
  if (!self->_bottomLeftOriginData[level])
  {
    topLeftOriginData = self->_topLeftOriginData;
    int8x8_t v9 = self->_topLeftOriginData[level];
    if (v9)
    {
      v4.i32[0] = 0;
      v10.i32[1] = HIDWORD(*(void *)self->_anon_118);
      v10.i32[0] = 1;
      int32x2_t v11 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->_anon_118), 0), v10, *(int8x8_t *)self->_anon_118);
      double v21 = COERCE_DOUBLE(vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v11, 1)), 0), (int8x8_t)(v11.u32[0] | 0x100000000), (int8x8_t)v11), vneg_s32(vdup_n_s32(level))), (int32x2_t)0x100000001));
      int channelCount = self->_textureData.channelCount;
      int v13 = sub_20B1B8320(self->_channelEncoding);
      uint64_t v14 = sub_20B1BA648(v9, v13 / 8 * channelCount * LODWORD(v21), v21);
      uint64_t v15 = bottomLeftOriginData[level];
      bottomLeftOriginData[level] = (NSData *)v14;

      id v16 = topLeftOriginData[level];
      self->_textureData.bottomLeftBytesForMip[level] = (char *)objc_msgSend_bytes(v16, v17, v18);
    }
    else
    {
      objc_msgSend_loadDataWithBottomLeftOriginAtMipLevel_create_selector_(self, a2, level, create, a2);
    }
  }
  int32x2_t v19 = bottomLeftOriginData[level];

  return v19;
}

- (void)setTexelDataWithBottomLeftOrigin:(id)a3 atMipLevel:(int64_t)a4
{
  id v12 = a3;
  id v7 = (id *)(&self->super.isa + a4);
  objc_storeStrong(v7 + 53, a3);
  id v8 = v7[53];
  v7[18] = (id)objc_msgSend_bytes(v8, v9, v10);
  id v11 = v7[39];
  v7[39] = 0;

  v7[2] = 0;
}

- (void)setTexelDataWithTopLeftOrigin:(id)a3 atMipLevel:(int64_t)a4
{
  id v6 = (objc_class *)a3;
  id v7 = &self->super.isa + a4;
  Class v8 = v7[53];
  v7[53] = 0;

  v7[18] = 0;
  Class v9 = v7[39];
  v7[39] = v6;
  uint64_t v10 = v6;

  id v11 = v10;
  uint64_t v14 = objc_msgSend_bytes(v11, v12, v13);

  v7[2] = (Class)v14;
}

- (BOOL)writeToURL:(NSURL *)URL
{
  return MEMORY[0x270F9A6D0](self, sel_writeToURL_level_, URL);
}

- (BOOL)writeToURL:(NSURL *)URL level:(NSUInteger)level
{
  id v6 = URL;
  Class v9 = objc_msgSend_pathExtension(v6, v7, v8);
  id v12 = objc_msgSend_lowercaseString(v9, v10, v11);

  if ((objc_msgSend_isEqualToString_(v12, v13, @"jpeg") & 1) != 0
    || (objc_msgSend_isEqualToString_(v12, v14, @"jpg") & 1) != 0)
  {
    uint64_t v15 = (void *)MEMORY[0x263F01A80];
LABEL_8:
    char v16 = objc_msgSend_writeToURL_type_(self, v14, (uint64_t)v6, *v15);
    goto LABEL_9;
  }
  if ((objc_msgSend_isEqualToString_(v12, v14, @"gif") & 1) != 0
    || (objc_msgSend_isEqualToString_(v12, v14, @"tiff") & 1) != 0
    || objc_msgSend_isEqualToString_(v12, v14, @"tif"))
  {
    uint64_t v15 = (void *)MEMORY[0x263F01B40];
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v12, v14, @"exr")) {
    char v16 = objc_msgSend_writeToURL_type_(self, v19, (uint64_t)v6, @"com.ilm.openexr-image");
  }
  else {
    char v16 = objc_msgSend_writeToURL_type_level_(self, v19, (uint64_t)v6, *MEMORY[0x263F01AE0], level);
  }
LABEL_9:
  BOOL v17 = v16;

  return v17;
}

- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type
{
  return objc_msgSend_writeToURL_type_level_(self, a2, (uint64_t)nsurl, type, 0);
}

- (BOOL)writeToURL:(NSURL *)nsurl type:(CFStringRef)type level:(NSUInteger)level
{
  uint64_t v8 = nsurl;
  uint64_t v10 = (CGImage *)objc_msgSend_imageFromTextureAtLevel_(self, v9, level);
  if (v10)
  {
    CFURLRef v11 = v8;
    id v12 = CGImageDestinationCreateWithURL(v11, type, 1uLL, 0);
    uint64_t v13 = v12;
    if (v12)
    {
      CGImageDestinationAddImage(v12, v10, 0);
      LOBYTE(v10) = CGImageDestinationFinalize(v13);
      CFRelease(v13);
      if (v11) {
        CFRelease(v11);
      }
    }
    else
    {
      if (v11) {
        CFRelease(v11);
      }
      LOBYTE(v10) = 0;
    }
  }

  return (char)v10;
}

- (CGImageRef)imageFromTexture
{
  return (CGImageRef)objc_msgSend_imageFromTextureAtLevel_(self, a2, 0);
}

- (CGImageRef)imageFromTextureAtLevel:(NSUInteger)level
{
  char v3 = level;
  uint64_t v5 = objc_msgSend_texelDataWithTopLeftOrigin_(self, a2, level);
  uint64_t v8 = v5;
  int channelCount = self->_textureData.channelCount;
  if (!channelCount) {
    goto LABEL_29;
  }
  BOOL v10 = channelCount > 4 || v5 == 0;
  if (v10 || !objc_msgSend_length(v5, v6, v7)) {
    goto LABEL_29;
  }
  if (self->_textureData.channelCount < 2)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    uint32_t v13 = 0;
    int64_t channelEncoding = self->_channelEncoding;
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceRGB();
    int64_t channelEncoding = self->_channelEncoding;
    if (channelEncoding == 1) {
      uint32_t v13 = 16385;
    }
    else {
      uint32_t v13 = 1;
    }
  }
  if (channelEncoding != 770)
  {
    if (channelEncoding == 260)
    {
      int v14 = 8448;
      goto LABEL_17;
    }
    if (channelEncoding != 258) {
      goto LABEL_18;
    }
  }
  int v14 = 4352;
LABEL_17:
  v13 |= v14;
LABEL_18:
  int v17 = sub_20B1B8320(channelEncoding);
  v18.i32[0] = 0;
  v19.i32[1] = HIDWORD(*(void *)self->_anon_118);
  v19.i32[0] = 1;
  int32x2_t v20 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v18, *(int32x2_t *)self->_anon_118), 0), v19, *(int8x8_t *)self->_anon_118);
  int8x8_t v21 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v18, vdup_lane_s32(v20, 1)), 0), (int8x8_t)(v20.u32[0] | 0x100000000), (int8x8_t)v20);
  if (v21.i32[0] >> v3 <= 1) {
    size_t v22 = 1;
  }
  else {
    size_t v22 = (v21.i32[0] >> v3);
  }
  if (v21.i32[1] >> v3 <= 1) {
    size_t v23 = 1;
  }
  else {
    size_t v23 = (v21.i32[1] >> v3);
  }
  int v24 = self->_textureData.channelCount;
  if (objc_msgSend_length(v8, v15, v16) != v22 * (v24 * v17 / 8) * v23)
  {
    CGColorSpaceRelease(DeviceGray);
LABEL_29:
    CGImageRef Image = 0;
    goto LABEL_30;
  }
  id v25 = v8;
  size_t v28 = objc_msgSend_bytes(v25, v26, v27);
  uint64_t v29 = CGBitmapContextCreate(v28, v22, v23, v17, (uint64_t)(int)(v22 * v17 * self->_textureData.channelCount+ ((int)v22 * v17 * self->_textureData.channelCount < 0 ? 7 : 0)) >> 3, DeviceGray, v13);
  CGImageRef Image = CGBitmapContextCreateImage(v29);
  CGColorSpaceRelease(DeviceGray);
  if (v29) {
    CGContextRelease(v29);
  }
  CFAutorelease(Image);
LABEL_30:

  return Image;
}

+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions
{
  long long v51 = *(_OWORD *)dimensions.i8;
  id v6 = texture;
  uint64_t v7 = name;
  if (v51 == DWORD1(v51) && (float v8 = log2f((float)(int)v51), 1 << (int)v8 == v51))
  {
    float v9 = v8;
    BOOL v10 = [MDLTexture alloc];
    LODWORD(v11) = v51;
    HIDWORD(v11) = 6 * v51;
    uint64_t isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v10, v12, 0, 1, v7, 4 * (int)v51, 4, 1, v11, 1);
    objc_msgSend_texelDataWithTopLeftOrigin(v6, v14, v15);
    double v45 = v7;
    id v16 = objc_claimAutoreleasedReturnValue();
    int8x8_t v19 = (const char *)objc_msgSend_bytes(v16, v17, v18);

    int v50 = 0;
    uint64_t v47 = 4 * (int)v51 * 6 * (int)v51;
    v48 = (void *)isCube;
    int v20 = 4;
    float32x4_t v46 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      int v21 = v51;
      __p = 0;
      CGRect v53 = 0;
      uint64_t v54 = 0;
      sub_20B1BC214((uint64_t)&__p, 6 * (int)v51 * DWORD1(v51));
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v49 = (int)v51 * DWORD1(v51);
      do
      {
        sub_20B1BBC70(v6, v19, v24++, (float)v50 * (float)(1.0 / v9), *(double *)&v51, v22, v20, (uint64_t)__p + v23);
        v23 += 16 * v49;
      }
      while (v24 != 6);
      id v25 = objc_alloc(MEMORY[0x263EFF990]);
      uint64_t v27 = objc_msgSend_initWithCapacity_(v25, v26, v47);
      size_t v28 = v48;
      objc_msgSend_setLength_(v27, v29, v47);
      id v30 = v27;
      uint64_t v33 = (unsigned char *)objc_msgSend_bytes(v30, v31, v32);
      if (v49)
      {
        uint64_t v35 = 0;
        if ((unint64_t)(6 * (int)v51 * DWORD1(v51)) <= 1) {
          uint64_t v36 = 1;
        }
        else {
          uint64_t v36 = 6 * (int)v51 * DWORD1(v51);
        }
        do
        {
          float32x4_t v37 = vminnmq_f32(vmaxnmq_f32(vmulq_f32(*((float32x4_t *)__p + v35), v46), (float32x4_t)0), v46);
          *uint64_t v33 = (int)v37.f32[0];
          v33[1] = (int)v37.f32[1];
          v33[2] = (int)v37.f32[2];
          v33[3] = -1;
          v33 += 4;
          ++v35;
        }
        while (v36 != v35);
      }
      objc_msgSend_setTexelDataWithTopLeftOrigin_atMipLevel_(v48, v34, (uint64_t)v30, v50);
      if ((int)v51 >= 0) {
        int v38 = v51;
      }
      else {
        int v38 = v51 + 1;
      }
      int v39 = v38 >> 1;
      if ((SDWORD1(v51) & 0x80000000) == 0) {
        int v40 = DWORD1(v51);
      }
      else {
        int v40 = DWORD1(v51) + 1;
      }
      LODWORD(v41) = v39;
      long long v42 = v51;
      if (v51 != 1)
      {
        HIDWORD(v41) = v40 >> 1;
        *(double *)&long long v42 = v41;
      }
      long long v51 = v42;
      if (v21 == 1) {
        int v43 = v50;
      }
      else {
        int v43 = v50 + 1;
      }
      int v50 = v43;
      if (v21 != 1) {
        v20 *= 2;
      }

      if (__p)
      {
        CGRect v53 = __p;
        operator delete(__p);
      }
    }
    while (v21 != 1);
    uint64_t v7 = v45;
  }
  else
  {
    size_t v28 = 0;
  }

  return (MDLTexture *)v28;
}

+ (MDLTexture)irradianceTextureCubeWithTexture:(MDLTexture *)texture name:(NSString *)name dimensions:(vector_int2)dimensions roughness:(float)roughness
{
  float v8 = texture;
  float v9 = name;
  if (dimensions.i32[0] == dimensions.i32[1] && 1 << (int)log2f((float)dimensions.i32[0]) == dimensions.i32[0])
  {
    objc_msgSend_texelDataWithTopLeftOrigin(v8, v10, v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (const char *)objc_msgSend_bytes(v12, v13, v14);

    __p = 0;
    double v41 = 0;
    uint64_t v42 = 0;
    sub_20B1BC214((uint64_t)&__p, 6 * (dimensions.i32[0] * dimensions.i32[0]));
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    LODWORD(v19) = dimensions.i32[0];
    HIDWORD(v19) = 6 * dimensions.i32[0];
    double v38 = v19;
    do
    {
      sub_20B1BBC70(v8, v15, v18++, roughness, *(double *)&dimensions, v16, 1024, (uint64_t)__p + v17);
      v17 += 16 * (dimensions.i32[0] * dimensions.i32[0]);
    }
    while (v18 != 6);
    id v20 = objc_alloc(MEMORY[0x263EFF990]);
    uint64_t v21 = 4 * dimensions.i32[0] * 6 * dimensions.i32[0];
    uint64_t v23 = objc_msgSend_initWithCapacity_(v20, v22, v21);
    objc_msgSend_setLength_(v23, v24, v21);
    id v25 = v23;
    size_t v28 = (unsigned char *)objc_msgSend_bytes(v25, v26, v27);
    if (dimensions.i32[0])
    {
      uint64_t v29 = 0;
      if (6 * (unint64_t)(dimensions.i32[0] * dimensions.i32[0]) <= 1) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = 6 * (dimensions.i32[0] * dimensions.i32[0]);
      }
      uint64_t v31 = 16 * v30;
      float32x4_t v32 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        float32x4_t v33 = vminnmq_f32(vmaxnmq_f32(vmulq_f32(*(float32x4_t *)((char *)__p + v29), v32), (float32x4_t)0), v32);
        unsigned char *v28 = (int)v33.f32[0];
        v28[1] = (int)v33.f32[1];
        v28[2] = (int)v33.f32[2];
        v28[3] = -1;
        v28 += 4;
        v29 += 16;
      }
      while (v31 != v29);
    }
    uint64_t v34 = [MDLTexture alloc];
    uint64_t isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v34, v35, (uint64_t)v25, 1, v9, 4 * dimensions.i32[0], 4, 1, v38, 1);

    if (__p)
    {
      double v41 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t isCube = 0;
  }

  return (MDLTexture *)isCube;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MDLTextureChannelEncoding)channelEncoding
{
  return self->_channelEncoding;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  int32x2_t v4 = &self->_bottomLeftOriginData[13];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -14);
  for (uint64_t i = 0; i != -14; --i)
    objc_storeStrong((id *)&self->_topLeftOriginData[i + 13], 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end