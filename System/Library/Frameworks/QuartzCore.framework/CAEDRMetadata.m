@interface CAEDRMetadata
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (CAEDRMetadata)HDR10MetadataWithDisplayInfo:(NSData *)displayData contentInfo:(NSData *)contentData opticalOutputScale:(float)scale;
+ (CAEDRMetadata)HDR10MetadataWithMinLuminance:(float)minNits maxLuminance:(float)maxNits opticalOutputScale:(float)scale;
+ (CAEDRMetadata)HLGMetadata;
+ (CAEDRMetadata)HLGMetadataWithAmbientViewingEnvironment:(NSData *)data;
+ (void)setMetadata:(id)a3 onSurface:(__IOSurface *)a4;
- (BOOL)isEqual:(id)a3;
- (CAEDRMetadata)initWithBT2100HLG;
- (CAEDRMetadata)initWithCoder:(id)a3;
- (CAEDRMetadata)initWithMasteringDisplayMinNits:(float)a3 maxNits:(float)a4 opticalOutputScale:(float)a5;
- (CAEDRMetadata)initWithSEIAmbientViewingEnvironment:(id)a3;
- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4;
- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4 opticalOutputScale:(float)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAEDRMetadata

- (id)description
{
  return (id)[NSString stringWithFormat:@"CAEDRMetadata <%p> display min nits: %f, max nits: %f", self, (float)((float)*((unsigned int *)self->_priv + 5) * 0.0001), (float)((float)*((unsigned int *)self->_priv + 4) * 0.0001)];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  priv = self->_priv;
  uint64_t v6 = *((void *)a3 + 1);
  if (!*((unsigned char *)priv + 40))
  {
    if (!*(unsigned char *)(v6 + 40))
    {
      BOOL v9 = *(void *)priv == *(void *)v6 && *((void *)priv + 1) == *(void *)(v6 + 8);
      BOOL v10 = v9 && *((void *)priv + 2) == *(void *)(v6 + 16);
      if (v10 && *((_DWORD *)priv + 6) == *(_DWORD *)(v6 + 24)) {
        return *((float *)priv + 11) == *(float *)(v6 + 44);
      }
    }
    return 0;
  }
  if (*((unsigned __int8 *)priv + 40) != *(unsigned __int8 *)(v6 + 40)) {
    return 0;
  }
  unint64_t v7 = *((void *)priv + 4);
  if (!(v7 | *(void *)(v6 + 32))) {
    return 1;
  }

  return objc_msgSend((id)v7, "isEqual:");
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {

    free(self->_priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAEDRMetadata;
  [(CAEDRMetadata *)&v4 dealloc];
}

- (CAEDRMetadata)initWithBT2100HLG
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAEDRMetadata;
  v2 = [(CAEDRMetadata *)&v5 init];
  if (v2)
  {
    v3 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x68C4A5DCuLL);
    v2->_priv = v3;
    if (v3)
    {
      *((unsigned char *)v3 + 40) = 1;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (CAEDRMetadata)initWithSEIAmbientViewingEnvironment:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CAEDRMetadata;
  objc_super v4 = [(CAEDRMetadata *)&v9 init];
  if (v4)
  {
    priv = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x83F54FA7uLL);
    v4->_priv = priv;
    if (priv)
    {
      if (a3)
      {
        if ((unint64_t)[a3 length] <= 7)
        {

          if (x_log_hook_p())
          {
            x_log_();
          }
          else
          {
            v8 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_184668000, v8, OS_LOG_TYPE_ERROR, "SEI ambient viewing environment info must be 8 bytes", buf, 2u);
            }
          }
          return 0;
        }
        uint64_t v6 = [a3 copy];
        priv = v4->_priv;
        *((void *)priv + 4) = v6;
      }
      *((unsigned char *)priv + 40) = 1;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (CAEDRMetadata)initWithMasteringDisplayMinNits:(float)a3 maxNits:(float)a4 opticalOutputScale:(float)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CAEDRMetadata;
  uint64_t v6 = [(CAEDRMetadata *)&v11 init];
  if (v6)
  {
    unint64_t v7 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x7AB30AD5uLL);
    v6->_priv = v7;
    if (v7)
    {
      *((uint32x2_t *)v7 + 2) = vcvt_u32_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(a3), LODWORD(a4)), (float32x2_t)vdup_n_s32(0x461C4000u)));
      *((float *)v7 + 11) = a5;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4 opticalOutputScale:(float)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CAEDRMetadata;
  v8 = [(CAEDRMetadata *)&v27 init];
  if (v8)
  {
    priv = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x9D86E492uLL);
    v8->_priv = priv;
    if (!priv)
    {

      return 0;
    }
    if (a3)
    {
      if ((unint64_t)[a3 length] <= 0x17)
      {

        if (x_log_hook_p()) {
          goto LABEL_32;
        }
        v24 = x_log_category_api;
        if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_WORD *)buf = 0;
        v25 = "SEI mastering display color volume info must be 24 bytes";
        goto LABEL_43;
      }
      BOOL v10 = (unsigned __int16 *)[a3 bytes];
      unsigned int v11 = bswap32(*v10) >> 16;
      if (v11 >= 0xC350) {
        LOWORD(v11) = -15536;
      }
      priv = v8->_priv;
      *(_WORD *)priv = v11;
      unsigned int v12 = bswap32(v10[1]) >> 16;
      if (v12 >= 0xC350) {
        LOWORD(v12) = -15536;
      }
      *((_WORD *)priv + 1) = v12;
      unsigned int v13 = bswap32(v10[2]) >> 16;
      if (v13 >= 0xC350) {
        LOWORD(v13) = -15536;
      }
      *((_WORD *)priv + 2) = v13;
      unsigned int v14 = bswap32(v10[3]) >> 16;
      if (v14 >= 0xC350) {
        LOWORD(v14) = -15536;
      }
      *((_WORD *)priv + 3) = v14;
      unsigned int v15 = bswap32(v10[4]) >> 16;
      if (v15 >= 0xC350) {
        LOWORD(v15) = -15536;
      }
      *((_WORD *)priv + 4) = v15;
      unsigned int v16 = bswap32(v10[5]) >> 16;
      if (v16 >= 0xC350) {
        LOWORD(v16) = -15536;
      }
      *((_WORD *)priv + 5) = v16;
      unsigned int v17 = bswap32(v10[6]) >> 16;
      if (v17 >= 0xC350) {
        LOWORD(v17) = -15536;
      }
      *((_WORD *)priv + 6) = v17;
      unsigned int v18 = bswap32(v10[7]) >> 16;
      if (v18 >= 0xC350) {
        LOWORD(v18) = -15536;
      }
      *((_WORD *)priv + 7) = v18;
      unsigned int v19 = bswap32(*((_DWORD *)v10 + 4));
      if (v19 >= 0x5F5E100) {
        unsigned int v19 = 100000000;
      }
      *((_DWORD *)priv + 4) = v19;
      unsigned int v20 = bswap32(*((_DWORD *)v10 + 5));
      if (v20 >= 0x5F5E100) {
        unsigned int v20 = 100000000;
      }
      *((_DWORD *)priv + 5) = v20;
    }
    if (a4)
    {
      if ((unint64_t)[a4 length] <= 3)
      {

        if (x_log_hook_p())
        {
LABEL_32:
          x_log_();
          return 0;
        }
        v24 = x_log_category_api;
        if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_WORD *)buf = 0;
        v25 = "SEI content light level info must be 4 bytes";
LABEL_43:
        _os_log_impl(&dword_184668000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
        return 0;
      }
      v21 = (unsigned __int16 *)[a4 bytes];
      unsigned int v22 = bswap32(*v21) >> 16;
      if (v22 >= 0x2710) {
        LOWORD(v22) = 10000;
      }
      priv = v8->_priv;
      *((_WORD *)priv + 12) = v22;
      unsigned int v23 = bswap32(v21[1]) >> 16;
      if (v23 >= 0x2710) {
        LOWORD(v23) = 10000;
      }
      *((_WORD *)priv + 13) = v23;
    }
    *((float *)priv + 11) = a5;
  }
  return v8;
}

- (CAEDRMetadata)initWithSEIMasteringDisplayData:(id)a3 contentLightLevelData:(id)a4
{
  LODWORD(v4) = 1120403456;
  return [(CAEDRMetadata *)self initWithSEIMasteringDisplayData:a3 contentLightLevelData:a4 opticalOutputScale:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_super v5 = malloc_type_malloc(0x30uLL, 0xAC14F77CuLL);
    v4[1] = v5;
    priv = self->_priv;
    long long v8 = *((_OWORD *)priv + 1);
    long long v7 = *((_OWORD *)priv + 2);
    *objc_super v5 = *(_OWORD *)priv;
    v5[1] = v8;
    v5[2] = v7;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
  {
    priv = self->_priv;
    if (priv)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:priv length:48];
      if (v5)
      {
        [a3 encodeObject:v5 forKey:@"CA_EDR_Metadata"];
      }
    }
  }
}

- (CAEDRMetadata)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAEDRMetadata;
  double v4 = [(CAEDRMetadata *)&v8 init];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"CA_EDR_Metadata"];
    if ([v5 length] == 48)
    {
      uint64_t v6 = (_CAEDRMetadataPrivate *)malloc_type_calloc(1uLL, 0x30uLL, 0x72436645uLL);
      v4->_priv = v6;
      [v5 getBytes:v6 length:48];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (void)setMetadata:(id)a3 onSurface:(__IOSurface *)a4
{
  if (!a4) {
    return;
  }
  if (!a3)
  {
    IOSurfaceRemoveValue(a4, @"isHLG");
LABEL_9:
    IOSurfaceRemoveValue(a4, (CFStringRef)*MEMORY[0x1E4F249F0]);
    goto LABEL_10;
  }
  if (*(unsigned char *)(*((void *)a3 + 1) + 40)) {
    IOSurfaceSetValue(a4, @"isHLG", (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  }
  else {
    IOSurfaceRemoveValue(a4, @"isHLG");
  }
  uint64_t v6 = *(const void **)(*((void *)a3 + 1) + 32);
  if (!v6) {
    goto LABEL_9;
  }
  IOSurfaceSetValue(a4, (CFStringRef)*MEMORY[0x1E4F249F0], v6);
LABEL_10:
  PixelFormat = (CA::Render *)IOSurfaceGetPixelFormat(a4);
  if (CA::Render::fourcc_compressed_of_type(PixelFormat, 0, 0) == 1380411457)
  {
    if (a3 && (uint64_t v9 = *((void *)a3 + 1), !*(unsigned char *)(v9 + 40)))
    {
      LODWORD(v8) = *(_DWORD *)(v9 + 44);
      IOSurfaceSetValue(a4, @"SDRBrightnessInNits", (CFTypeRef)[NSNumber numberWithFloat:v8]);
    }
    else
    {
      IOSurfaceRemoveValue(a4, @"SDRBrightnessInNits");
    }
  }
  IOSurfaceSetBulkAttachments2();
}

+ (BOOL)isAvailable
{
  if (CADeviceHasHardwareAcceleratedHDR::once[0] != -1) {
    dispatch_once(CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_132);
  }
  if (CADeviceHasHardwareAcceleratedHDR::has_capability) {
    return 1;
  }
  if (CADeviceIsVirtualized::once != -1) {
    dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
  }
  return CADeviceIsVirtualized::is_virtualized != 0;
}

+ (CAEDRMetadata)HLGMetadata
{
  if (CADeviceHasHardwareAcceleratedHDR::once[0] != -1) {
    dispatch_once(CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_132);
  }
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once != -1) {
      dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
    }
    if (!CADeviceIsVirtualized::is_virtualized) {
      return 0;
    }
  }
  v2 = [[CAEDRMetadata alloc] initWithBT2100HLG];

  return v2;
}

+ (CAEDRMetadata)HLGMetadataWithAmbientViewingEnvironment:(NSData *)data
{
  if (CADeviceHasHardwareAcceleratedHDR::once[0] != -1) {
    dispatch_once(CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_132);
  }
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once != -1) {
      dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
    }
    if (!CADeviceIsVirtualized::is_virtualized) {
      return 0;
    }
  }
  double v4 = [[CAEDRMetadata alloc] initWithSEIAmbientViewingEnvironment:data];

  return v4;
}

+ (CAEDRMetadata)HDR10MetadataWithMinLuminance:(float)minNits maxLuminance:(float)maxNits opticalOutputScale:(float)scale
{
  if (CADeviceHasHardwareAcceleratedHDR::once[0] != -1) {
    dispatch_once(CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_132);
  }
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once != -1) {
      dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
    }
    if (!CADeviceIsVirtualized::is_virtualized) {
      return 0;
    }
  }
  double v8 = [CAEDRMetadata alloc];
  *(float *)&double v9 = minNits;
  *(float *)&double v10 = maxNits;
  *(float *)&double v11 = scale;
  unsigned int v12 = [(CAEDRMetadata *)v8 initWithMasteringDisplayMinNits:v9 maxNits:v10 opticalOutputScale:v11];

  return v12;
}

+ (CAEDRMetadata)HDR10MetadataWithDisplayInfo:(NSData *)displayData contentInfo:(NSData *)contentData opticalOutputScale:(float)scale
{
  if (CADeviceHasHardwareAcceleratedHDR::once[0] != -1) {
    dispatch_once(CADeviceHasHardwareAcceleratedHDR::once, &__block_literal_global_132);
  }
  if (!CADeviceHasHardwareAcceleratedHDR::has_capability)
  {
    if (CADeviceIsVirtualized::once != -1) {
      dispatch_once(&CADeviceIsVirtualized::once, &__block_literal_global_280);
    }
    if (!CADeviceIsVirtualized::is_virtualized) {
      return 0;
    }
  }
  double v8 = [CAEDRMetadata alloc];
  *(float *)&double v9 = scale;
  double v10 = [(CAEDRMetadata *)v8 initWithSEIMasteringDisplayData:displayData contentLightLevelData:contentData opticalOutputScale:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end