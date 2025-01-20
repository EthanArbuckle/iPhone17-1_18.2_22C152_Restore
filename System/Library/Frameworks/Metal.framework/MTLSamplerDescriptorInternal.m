@interface MTLSamplerDescriptorInternal
- (BOOL)forceResourceIndex;
- (BOOL)forceSeamsOnCubemapFiltering;
- (BOOL)isEqual:(id)a3;
- (BOOL)lodAverage;
- (BOOL)normalizedCoordinates;
- (BOOL)supportArgumentBuffers;
- (MTLSamplerDescriptorInternal)init;
- (const)descriptorPrivate;
- (float)lodBias;
- (float)lodMaxClamp;
- (float)lodMinClamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)label;
- (unint64_t)borderColor;
- (unint64_t)borderColorSPI;
- (unint64_t)compareFunction;
- (unint64_t)hash;
- (unint64_t)magFilter;
- (unint64_t)maxAnisotropy;
- (unint64_t)minFilter;
- (unint64_t)mipFilter;
- (unint64_t)pixelFormat;
- (unint64_t)rAddressMode;
- (unint64_t)resourceIndex;
- (unint64_t)sAddressMode;
- (unint64_t)tAddressMode;
- (unsigned)customBorderColorValue_0;
- (unsigned)customBorderColorValue_1;
- (unsigned)customBorderColorValue_2;
- (unsigned)customBorderColorValue_3;
- (void)dealloc;
- (void)setBorderColor:(unint64_t)a3;
- (void)setBorderColorSPI:(unint64_t)a3;
- (void)setCompareFunction:(unint64_t)a3;
- (void)setCustomBorderColorValue_0:(unsigned int)a3;
- (void)setCustomBorderColorValue_1:(unsigned int)a3;
- (void)setCustomBorderColorValue_2:(unsigned int)a3;
- (void)setCustomBorderColorValue_3:(unsigned int)a3;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setForceSeamsOnCubemapFiltering:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLodAverage:(BOOL)a3;
- (void)setLodBias:(float)a3;
- (void)setLodMaxClamp:(float)a3;
- (void)setLodMinClamp:(float)a3;
- (void)setMagFilter:(unint64_t)a3;
- (void)setMaxAnisotropy:(unint64_t)a3;
- (void)setMinFilter:(unint64_t)a3;
- (void)setMipFilter:(unint64_t)a3;
- (void)setNormalizedCoordinates:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRAddressMode:(unint64_t)a3;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setSAddressMode:(unint64_t)a3;
- (void)setSupportArgumentBuffers:(BOOL)a3;
- (void)setTAddressMode:(unint64_t)a3;
@end

@implementation MTLSamplerDescriptorInternal

- (unint64_t)mipFilter
{
  return ((unint64_t)self->_private.var0.miscHash >> 4) & 3;
}

- (unint64_t)minFilter
{
  return self->_private.var0.miscHash & 3;
}

- (unint64_t)magFilter
{
  return ((unint64_t)self->_private.var0.miscHash >> 2) & 3;
}

- (unint64_t)tAddressMode
{
  return ((unint64_t)self->_private.var0.miscHash >> 9) & 7;
}

- (unint64_t)sAddressMode
{
  return ((unint64_t)self->_private.var0.miscHash >> 6) & 7;
}

- (unint64_t)rAddressMode
{
  return ((unint64_t)self->_private.var0.miscHash >> 12) & 7;
}

- (id)label
{
  return self->_private.label;
}

- (unint64_t)compareFunction
{
  return ((unint64_t)self->_private.var0.miscHash >> 19) & 7;
}

- (unint64_t)borderColor
{
  return HIWORD(self->_private.var0.miscHash) & 3;
}

- (unint64_t)pixelFormat
{
  return self->_private.pixelFormat;
}

- (unint64_t)maxAnisotropy
{
  return self->_private.maxAnisotropy;
}

- (float)lodMinClamp
{
  return self->_private.var1.lodMinClamp;
}

- (float)lodMaxClamp
{
  return self->_private.var2.lodMaxClamp;
}

- (BOOL)normalizedCoordinates
{
  return *((unsigned __int8 *)&self->_private.var0.var0 + 1) >> 7;
}

- (BOOL)lodAverage
{
  return (BYTE2(self->_private.var0.miscHash) >> 2) & 1;
}

- (float)lodBias
{
  return self->_private.var3.lodBias;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (BOOL)supportArgumentBuffers
{
  return (BYTE2(self->_private.var0.miscHash) >> 6) & 1;
}

- (BOOL)forceSeamsOnCubemapFiltering
{
  return HIBYTE(self->_private.var0.miscHash) & 1;
}

- (void)setTAddressMode:(unint64_t)a3
{
  self->_private.var0.miscHash = self->_private.var0.miscHash & 0xFFFFF1FF | ((a3 & 7) << 9);
}

- (void)setSAddressMode:(unint64_t)a3
{
  self->_private.var0.miscHash = self->_private.var0.miscHash & 0xFFFFFE3F | ((a3 & 7) << 6);
}

- (void)setRAddressMode:(unint64_t)a3
{
  self->_private.var0.miscHash = self->_private.var0.miscHash & 0xFFFF8FFF | ((a3 & 7) << 12);
}

- (void)setCompareFunction:(unint64_t)a3
{
  self->_private.var0.miscHash = self->_private.var0.miscHash & 0xFFC7FFFF | ((a3 & 7) << 19);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLSamplerDescriptorInternal;
  [(MTLSamplerDescriptorInternal *)&v3 dealloc];
}

- (void)setNormalizedCoordinates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_private.var0.miscHash = self->_private.var0.miscHash & 0xFFFF7FFF | v3;
}

- (MTLSamplerDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLSamplerDescriptorInternal;
  result = [(MTLSamplerDescriptorInternal *)&v4 init];
  if (result)
  {
    unsigned int miscHash = result->_private.var0.miscHash;
    *(void *)&result->_private.var1.lodMinClampHash = 0x7F7FFFFF00000000;
    result->_private.var3.lodBiasHash = 0;
    result->_private.maxAnisotropy = 1;
    result->_private.label = 0;
    result->_private.resourceIndex = 0;
    *(void *)result->_private.customBorderColorValue = 0;
    *(void *)&result->_private.customBorderColorValue[2] = 0;
    result->_private.pixelFormat = 0;
    result->_private.var0.unsigned int miscHash = miscHash & 0xFE000000 | 0x8000;
  }
  return result;
}

- (void)setMipFilter:(unint64_t)a3
{
  if (!_MTLIsInternalBuild()) {
    goto LABEL_7;
  }
  if (-[MTLSamplerDescriptorInternal setMipFilter:]::onceToken != -1) {
    dispatch_once(&-[MTLSamplerDescriptorInternal setMipFilter:]::onceToken, &__block_literal_global_188);
  }
  if (a3 == 2 && -[MTLSamplerDescriptorInternal setMipFilter:]::forceMipFilterLinearToNearest) {
    int v5 = 16;
  }
  else {
LABEL_7:
  }
    int v5 = 16 * (a3 & 3);
  self->_private.var0.unsigned int miscHash = self->_private.var0.miscHash & 0xFFFFFFCF | v5;
}

- (void)setMinFilter:(unint64_t)a3
{
  if (!_MTLIsInternalBuild()) {
    goto LABEL_7;
  }
  if (-[MTLSamplerDescriptorInternal setMinFilter:]::onceToken != -1) {
    dispatch_once(&-[MTLSamplerDescriptorInternal setMinFilter:]::onceToken, &__block_literal_global_13);
  }
  if (a3 == 1 && -[MTLSamplerDescriptorInternal setMinFilter:]::forceMinFilterLinearToNearest) {
    unsigned int v5 = self->_private.var0.miscHash & 0xFFFFFFFC;
  }
  else {
LABEL_7:
  }
    unsigned int v5 = self->_private.var0.miscHash & 0xFFFFFFFC | a3 & 3;
  self->_private.var0.unsigned int miscHash = v5;
}

- (void)setMagFilter:(unint64_t)a3
{
  if (!_MTLIsInternalBuild()) {
    goto LABEL_7;
  }
  if (-[MTLSamplerDescriptorInternal setMagFilter:]::onceToken != -1) {
    dispatch_once(&-[MTLSamplerDescriptorInternal setMagFilter:]::onceToken, &__block_literal_global_185);
  }
  if (a3 == 1 && -[MTLSamplerDescriptorInternal setMagFilter:]::forceMagFilterLinearToNearest) {
    unsigned int v5 = self->_private.var0.miscHash & 0xFFFFFFF3;
  }
  else {
LABEL_7:
  }
    unsigned int v5 = self->_private.var0.miscHash & 0xFFFFFFF3 | (4 * (a3 & 3));
  self->_private.var0.unsigned int miscHash = v5;
}

- (void)setMaxAnisotropy:(unint64_t)a3
{
  if (_MTLIsInternalBuild())
  {
    if (-[MTLSamplerDescriptorInternal setMaxAnisotropy:]::onceToken != -1) {
      dispatch_once(&-[MTLSamplerDescriptorInternal setMaxAnisotropy:]::onceToken, &__block_literal_global_191);
    }
    if (-[MTLSamplerDescriptorInternal setMaxAnisotropy:]::maxAnisotropyCap >= a3) {
      uint64_t v5 = a3;
    }
    else {
      uint64_t v5 = -[MTLSamplerDescriptorInternal setMaxAnisotropy:]::maxAnisotropyCap;
    }
    if (-[MTLSamplerDescriptorInternal setMaxAnisotropy:]::maxAnisotropyCap) {
      a3 = v5;
    }
  }
  self->_private.maxAnisotropy = a3;
}

- (void)setSupportArgumentBuffers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_private.var0.unsigned int miscHash = self->_private.var0.miscHash & 0xFFBFFFFF | v3;
}

- (void)setLodAverage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_private.var0.unsigned int miscHash = self->_private.var0.miscHash & 0xFFFBFFFF | v3;
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = @"label is not a NSString.";
    unint64_t v12 = 1;
    uint64_t v13 = 621;
  }
  else
  {
    v11 = @"label must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 618;
  }
  MTLReportFailure(v12, "-[MTLSamplerDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)[a3 copy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    p_private = &self->_private;
    unsigned int v8 = *(_DWORD *)(v5 + 16) & 0xFFFFFFFC | p_private->var0.miscHash & 3;
    *(_DWORD *)(v5 + 16) = v8;
    unsigned int v9 = v8 & 0xFFFFFFF3 | (4 * ((p_private->var0.miscHash >> 2) & 3));
    *(_DWORD *)(v5 + 16) = v9;
    unsigned int v10 = v9 & 0xFFFFFFCF | (16 * ((p_private->var0.miscHash >> 4) & 3));
    *(_DWORD *)(v5 + 16) = v10;
    *(void *)(v5 + 32) = p_private->maxAnisotropy;
    unsigned int v11 = v10 & 0xFFFFFE3F | (((p_private->var0.miscHash >> 6) & 7) << 6);
    *(_DWORD *)(v5 + 16) = v11;
    unsigned int v12 = v11 & 0xFFFFF1FF | (((p_private->var0.miscHash >> 9) & 7) << 9);
    *(_DWORD *)(v5 + 16) = v12;
    unsigned int v13 = v12 & 0xFFFF8FFF | (((p_private->var0.miscHash >> 12) & 7) << 12);
    *(_DWORD *)(v5 + 16) = v13;
    unsigned int v14 = v13 & 0xFFFF7FFF | (((p_private->var0.miscHash >> 15) & 1) << 15);
    *(_DWORD *)(v5 + 16) = v14;
    unsigned int v15 = v14 & 0xFFFCFFFF | ((HIWORD(p_private->var0.miscHash) & 3) << 16);
    *(_DWORD *)(v5 + 16) = v15;
    *(_DWORD *)(v5 + 20) = p_private->var1.lodMinClampHash;
    *(_DWORD *)(v5 + 24) = p_private->var2.lodMaxClampHash;
    *(_DWORD *)(v5 + 28) = p_private->var3.lodBiasHash;
    unsigned int v16 = v15 & 0xFFFBFFFF | (((p_private->var0.miscHash >> 18) & 1) << 18);
    *(_DWORD *)(v5 + 16) = v16;
    unsigned int v17 = v16 & 0xFFC7FFFF | (((p_private->var0.miscHash >> 19) & 7) << 19);
    *(_DWORD *)(v5 + 16) = v17;
    unsigned int v18 = v17 & 0xFFBFFFFF | (((p_private->var0.miscHash >> 22) & 1) << 22);
    *(_DWORD *)(v5 + 16) = v18;
    *(_DWORD *)(v5 + 56) = p_private->customBorderColorValue[0];
    *(_DWORD *)(v5 + 60) = p_private->customBorderColorValue[1];
    *(_DWORD *)(v5 + 64) = p_private->customBorderColorValue[2];
    *(_DWORD *)(v5 + 68) = p_private->customBorderColorValue[3];
    unsigned int v19 = v18 & 0xFEFFFFFF | ((HIBYTE(p_private->var0.miscHash) & 1) << 24);
    *(_DWORD *)(v5 + 16) = v19;
    *(_DWORD *)(v5 + 16) = v19 & 0xFF7FFFFF | (((p_private->var0.miscHash >> 23) & 1) << 23);
    label = p_private->label;
    v6[6] = p_private->resourceIndex;
    v6[5] = [(NSString *)label copyWithZone:a3];
    v6[9] = p_private->pixelFormat;
  }
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  v28[69] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = NSString;
  v27.receiver = self;
  v27.super_class = (Class)MTLSamplerDescriptorInternal;
  id v6 = [(MTLSamplerDescriptorInternal *)&v27 description];
  v28[0] = v4;
  v28[1] = @"label =";
  p_private = &self->_private;
  label = (__CFString *)p_private->label;
  if (!label) {
    label = @"<none>";
  }
  v28[2] = label;
  v28[3] = v4;
  v28[4] = @"minFilter =";
  unint64_t miscHash = p_private->var0.miscHash;
  if ((p_private->var0.miscHash & 3) == 3) {
    unsigned int v10 = @"Unknown";
  }
  else {
    unsigned int v10 = off_1E5220CF0[miscHash & 3];
  }
  v28[5] = v10;
  v28[6] = v4;
  v28[7] = @"magFilter =";
  uint64_t v11 = (miscHash >> 2) & 3;
  if (v11 == 3) {
    unsigned int v12 = @"Unknown";
  }
  else {
    unsigned int v12 = off_1E5220CF0[v11];
  }
  v28[8] = v12;
  v28[9] = v4;
  v28[10] = @"mipFilter =";
  unsigned int v13 = (miscHash >> 4) & 3;
  if (v13 == 3) {
    unsigned int v14 = @"Unknown";
  }
  else {
    unsigned int v14 = off_1E5220D08[v13];
  }
  v28[11] = v14;
  v28[12] = v4;
  v28[13] = @"maxAnisotropy =";
  v28[14] = [NSNumber numberWithUnsignedInteger:p_private->maxAnisotropy];
  v28[15] = v4;
  v28[16] = @"sAddressMode =";
  unint64_t v15 = p_private->var0.miscHash;
  uint64_t v16 = (v15 >> 6) & 7;
  if (v16 == 7) {
    unsigned int v17 = @"Unknown";
  }
  else {
    unsigned int v17 = off_1E5220D20[v16];
  }
  v28[17] = v17;
  v28[18] = v4;
  v28[19] = @"tAddressMode =";
  uint64_t v18 = (v15 >> 9) & 7;
  if (v18 == 7) {
    unsigned int v19 = @"Unknown";
  }
  else {
    unsigned int v19 = off_1E5220D20[v18];
  }
  v28[20] = v19;
  v28[21] = v4;
  v28[22] = @"rAddressMode =";
  uint64_t v20 = (v15 >> 12) & 7;
  if (v20 == 7) {
    v21 = @"Unknown";
  }
  else {
    v21 = off_1E5220D20[v20];
  }
  v28[23] = v21;
  v28[24] = v4;
  v28[25] = @"normalizedCoordinates =";
  v28[26] = [NSNumber numberWithUnsignedInt:(v15 >> 15) & 1];
  v28[27] = v4;
  v28[28] = @"borderColor =";
  uint64_t v22 = HIWORD(p_private->var0.miscHash) & 3;
  if (v22 == 3) {
    v23 = @"Unknown";
  }
  else {
    v23 = off_1E5220D58[v22];
  }
  v28[29] = v23;
  v28[30] = v4;
  v28[31] = @"borderColorcustomValue0 =";
  v28[32] = [NSNumber numberWithUnsignedInt:p_private->customBorderColorValue[0]];
  v28[33] = v4;
  v28[34] = @"borderColorcustomValue1 =";
  v28[35] = [NSNumber numberWithUnsignedInt:p_private->customBorderColorValue[1]];
  v28[36] = v4;
  v28[37] = @"borderColorcustomValue2 =";
  v28[38] = [NSNumber numberWithUnsignedInt:p_private->customBorderColorValue[2]];
  v28[39] = v4;
  v28[40] = @"borderColorcustomValue3 =";
  v28[41] = [NSNumber numberWithUnsignedInt:p_private->customBorderColorValue[3]];
  v28[42] = v4;
  v28[43] = @"forceSeamsOnCubemapFiltering =";
  v28[44] = [NSNumber numberWithUnsignedInt:HIBYTE(p_private->var0.miscHash) & 1];
  v28[45] = v4;
  v28[46] = @"lodMinClamp =";
  LODWORD(v24) = p_private->var1.lodMinClampHash;
  v28[47] = [NSNumber numberWithFloat:v24];
  v28[48] = v4;
  v28[49] = @"lodMaxClamp =";
  LODWORD(v25) = p_private->var2.lodMaxClampHash;
  v28[50] = [NSNumber numberWithFloat:v25];
  v28[51] = v4;
  v28[52] = @"lodAverage =";
  v28[53] = [NSNumber numberWithUnsignedInt:(p_private->var0.miscHash >> 18) & 1];
  v28[54] = v4;
  v28[55] = @"compareFunction =";
  v28[56] = MTLCompareFunctionString(((unint64_t)p_private->var0.miscHash >> 19) & 7);
  v28[57] = v4;
  v28[58] = @"supportArgumentBuffers =";
  v28[59] = [NSNumber numberWithUnsignedInt:(p_private->var0.miscHash >> 22) & 1];
  v28[60] = v4;
  v28[61] = @"forceResourceIndex =";
  v28[62] = [NSNumber numberWithUnsignedInt:(p_private->var0.miscHash >> 23) & 1];
  v28[63] = v4;
  v28[64] = @"resourceIndex =";
  v28[65] = [NSNumber numberWithUnsignedLongLong:p_private->resourceIndex];
  v28[66] = v4;
  v28[67] = @"pixelFormat =";
  v28[68] = [NSString stringWithUTF8String:MTLPixelFormatGetName(p_private->pixelFormat)];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 69), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLSamplerDescriptorInternal *)self formattedDescription:0];
}

uint64_t __45__MTLSamplerDescriptorInternal_setMinFilter___block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_FORCE_MIN_FILTER_LINEAR_TO_NEAREST", 0);
  -[MTLSamplerDescriptorInternal setMinFilter:]::forceMinFilterLinearToNearest = result != 0;
  return result;
}

uint64_t __45__MTLSamplerDescriptorInternal_setMagFilter___block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_FORCE_MAG_FILTER_LINEAR_TO_NEAREST", 0);
  -[MTLSamplerDescriptorInternal setMagFilter:]::forceMagFilterLinearToNearest = result != 0;
  return result;
}

uint64_t __45__MTLSamplerDescriptorInternal_setMipFilter___block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_FORCE_MIP_FILTER_LINEAR_TO_NEAREST", 0);
  -[MTLSamplerDescriptorInternal setMipFilter:]::forceMipFilterLinearToNearest = result != 0;
  return result;
}

uint64_t __49__MTLSamplerDescriptorInternal_setMaxAnisotropy___block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_CAP_MAX_ANISOTROPY", 0);
  -[MTLSamplerDescriptorInternal setMaxAnisotropy:]::maxAnisotropyCap = result;
  return result;
}

- (void)setBorderColor:(unint64_t)a3
{
  self->_private.var0.unint64_t miscHash = self->_private.var0.miscHash & 0xFFFCFFFF | ((a3 & 3) << 16);
}

- (unint64_t)borderColorSPI
{
  return HIWORD(self->_private.var0.miscHash) & 3;
}

- (void)setBorderColorSPI:(unint64_t)a3
{
  self->_private.var0.unint64_t miscHash = self->_private.var0.miscHash & 0xFFFCFFFF | ((a3 & 3) << 16);
}

- (unsigned)customBorderColorValue_0
{
  return self->_private.customBorderColorValue[0];
}

- (unsigned)customBorderColorValue_1
{
  return self->_private.customBorderColorValue[1];
}

- (unsigned)customBorderColorValue_2
{
  return self->_private.customBorderColorValue[2];
}

- (unsigned)customBorderColorValue_3
{
  return self->_private.customBorderColorValue[3];
}

- (void)setCustomBorderColorValue_0:(unsigned int)a3
{
  self->_private.customBorderColorValue[0] = a3;
}

- (void)setCustomBorderColorValue_1:(unsigned int)a3
{
  self->_private.customBorderColorValue[1] = a3;
}

- (void)setCustomBorderColorValue_2:(unsigned int)a3
{
  self->_private.customBorderColorValue[2] = a3;
}

- (void)setCustomBorderColorValue_3:(unsigned int)a3
{
  self->_private.customBorderColorValue[3] = a3;
}

- (void)setForceSeamsOnCubemapFiltering:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_private.var0.unint64_t miscHash = self->_private.var0.miscHash & 0xFEFFFFFF | v3;
}

- (void)setLodMinClamp:(float)a3
{
  self->_private.var1.lodMinClamp = a3;
}

- (void)setLodMaxClamp:(float)a3
{
  self->_private.var2.lodMaxClamp = a3;
}

- (void)setLodBias:(float)a3
{
  self->_private.var3.lodBias = a3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_private.pixelFormat = a3;
}

- (BOOL)forceResourceIndex
{
  return BYTE2(self->_private.var0.miscHash) >> 7;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_private.var0.unint64_t miscHash = self->_private.var0.miscHash & 0xFF7FFFFF | v3;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)hash
{
  p_private = (int8x8_t *)&self->_private;
  int8x16_t v8 = *(int8x16_t *)&self->_private.var0.var0;
  unint64_t maxAnisotropy = self->_private.maxAnisotropy;
  NSUInteger v4 = [(NSString *)self->_private.label hash];
  int8x8_t v5 = veor_s8(veor_s8(*(int8x8_t *)v8.i8, p_private[5]), veor_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)p_private[5].i8, *(int8x16_t *)p_private[5].i8, 8uLL)));
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  return *(void *)&veor_s8((int8x8_t)v5.u32[0], (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ *(void *)&p_private[4] ^ *(void *)&p_private[7] ^ v4 ^ (maxAnisotropy << 16);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  BOOL result = Class == object_getClass(a3)
        && (p_private = &self->_private, v7 = (float *)((char *)a3 + 16), p_private->var0.miscHash == *(_DWORD *)v7)
        && p_private->var1.lodMinClamp == v7[1]
        && p_private->var2.lodMaxClamp == v7[2]
        && p_private->var3.lodBias == v7[3]
        && p_private->maxAnisotropy == *((void *)v7 + 2)
        && ((label = p_private->label, label == *((NSString **)v7 + 3))
         || -[NSString isEqual:](label, "isEqual:"))
        && p_private->customBorderColorValue[0] == *((_DWORD *)v7 + 10)
        && p_private->customBorderColorValue[1] == *((_DWORD *)v7 + 11)
        && p_private->customBorderColorValue[2] == *((_DWORD *)v7 + 12)
        && p_private->customBorderColorValue[3] == *((_DWORD *)v7 + 13)
        && p_private->pixelFormat == *((void *)v7 + 7)
        && p_private->resourceIndex == *((void *)v7 + 4);
  return result;
}

- (const)descriptorPrivate
{
  return &self->_private;
}

@end