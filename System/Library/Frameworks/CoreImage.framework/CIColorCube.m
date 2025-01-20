@interface CIColorCube
+ (id)customAttributes;
- (BOOL)_checkInputs;
- (CIImage)inputImage;
- (NSData)inputCubeData;
- (NSNumber)inputCubeDimension;
- (NSNumber)inputExtrapolate;
- (id)_kernel;
- (id)_kernelOpaque;
- (id)_kernelOpaqueExtend;
- (id)cubeImage;
- (id)outputImage;
- (void)dealloc;
- (void)setInputCubeData:(id)a3;
- (void)setInputCubeDimension:(id)a3;
- (void)setInputExtrapolate:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIColorCube

- (void)dealloc
{
  self->_cubeImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIColorCube;
  [(CIFilter *)&v3 dealloc];
}

- (void)setInputCubeData:(id)a3
{
  self->_cubeImage = 0;
  v5 = self->inputCubeData;
  self->inputCubeData = (NSData *)a3;
}

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryColorEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryInterlaced";
  v9[3] = @"CICategoryNonSquarePixels";
  v9[4] = @"CICategoryStillImage";
  v9[5] = @"CICategoryHighDynamicRange";
  v9[6] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v11[1] = @"5";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputCubeDimension";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4AA508;
  v8[1] = &unk_1EE4AA520;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeIdentity";
  v8[2] = &unk_1EE4AA508;
  v8[3] = &unk_1EE4AA508;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeCount";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputCubeData";
  v5[0] = @"CIAttributeDefault";
  if (defaultCube(void)::onceToken != -1) {
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  }
  v5[1] = @"CIAttributeIdentity";
  v6[0] = defaultCube(void)::data;
  v6[1] = defaultCube(void)::data;
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v10[5] = @"inputExtrapolate";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeMin";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = @"CIAttributeTypeBoolean";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorcube];
}

- (id)_kernelOpaque
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorcubeopaque];
}

- (id)_kernelOpaqueExtend
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorcubeopaque_extend];
}

- (id)cubeImage
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id result = self->_cubeImage;
  if (!result)
  {
    int v4 = [(NSNumber *)self->inputCubeDimension intValue];
    int v5 = [(NSData *)self->inputCubeData length];
    int v6 = v4;
    size_t v7 = 4 * v4;
    size_t v8 = 16 * v4;
    if (v4 * (uint64_t)v4 * v8 == v5)
    {
      inputCubeData = (NSData *)[MEMORY[0x1E4F1CA58] dataWithLength:(uint64_t)v5 >> 2];
      v10 = (void *)[(NSData *)inputCubeData mutableBytes];
      src.data = (void *)[(NSData *)self->inputCubeData bytes];
      src.height = (v6 * v6);
      src.width = 4 * v6;
      src.rowBytes = v8;
      dest.data = v10;
      dest.height = src.height;
      dest.width = src.width;
      dest.rowBytes = v7;
      vImageConvert_PlanarFtoPlanar8(&src, &dest, 1.0, 0.0, 0);
    }
    else
    {
      inputCubeData = self->inputCubeData;
    }
    uint64_t v11 = [(NSData *)inputCubeData bytes];
    if ([(NSData *)inputCubeData length])
    {
      unint64_t v12 = 0;
      uint64_t v13 = v11 + 3;
      char v14 = 1;
      do
      {
        v14 &= ~*(unsigned char *)(v13 + v12) == 0;
        v12 += 4;
      }
      while ([(NSData *)inputCubeData length] > v12);
    }
    v22[0] = @"kCIImageProviderContentDigest";
    v22[1] = @"kCIImageProviderName";
    v23[0] = inputCubeData;
    v23[1] = @"CIColorCube";
    v22[2] = @"CIImageFlipped";
    v22[3] = @"CIImageClampToEdge";
    uint64_t v15 = MEMORY[0x1E4F1CC38];
    v23[2] = MEMORY[0x1E4F1CC28];
    v23[3] = MEMORY[0x1E4F1CC38];
    v22[4] = @"kCIImageCacheHint";
    v23[4] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
    v20[0] = @"kCIImageProviderContentDigest";
    v20[1] = @"kCIImageProviderName";
    v21[0] = inputCubeData;
    v21[1] = @"CIColorCube";
    v20[2] = @"CIImageFlipped";
    v20[3] = @"CIImageClampToEdge";
    v21[2] = MEMORY[0x1E4F1CC28];
    v21[3] = v15;
    v20[4] = @"kCIImageCacheHint";
    v20[5] = @"kCIImageAlphaOne";
    v21[4] = v15;
    v21[5] = v15;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
    v16 = [CIImage alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __24__CIColorCube_cubeImage__block_invoke;
    v17[3] = &unk_1E5771180;
    v17[4] = inputCubeData;
    v17[5] = v7;
    id result = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](v16, "initWithImageProvider:width:height:format:colorSpace:options:", v17);
    self->_cubeImage = (CIImage *)result;
  }
  return result;
}

uint64_t __24__CIColorCube_cubeImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = [*(id *)(a1 + 32) bytes];
  if (a7)
  {
    uint64_t v13 = 0;
    char v14 = (unsigned char *)(a2 + 1);
    do
    {
      if (a6)
      {
        uint64_t v15 = (unsigned char *)(result + 1 + *(void *)(a1 + 40) * v13);
        v16 = v14;
        uint64_t v17 = a6;
        do
        {
          v16[1] = *(v15 - 1);
          unsigned char *v16 = *v15;
          *(v16 - 1) = v15[1];
          v16[2] = v15[2];
          v15 += 4;
          v16 += 4;
          --v17;
        }
        while (v17);
      }
      ++v13;
      v14 += a3;
    }
    while (v13 != a7);
  }
  return result;
}

- (BOOL)_checkInputs
{
  int v3 = [(NSNumber *)self->inputCubeDimension intValue];
  if ((v3 - 65) > 0xFFFFFFC0)
  {
    int v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (4 * v4 * v4 * v4);
      if ([(NSData *)self->inputCubeData length] == 4 * v5
        || [(NSData *)self->inputCubeData length] == v5)
      {
        return 1;
      }
      NSLog(&cfstr_CicolorcubeInp_1.isa);
    }
    else
    {
      NSLog(&cfstr_CicolorcubeInp_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_CicolorcubeInp.isa, 64);
  }
  return 0;
}

- (id)outputImage
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || ![(CIColorCube *)self _checkInputs]) {
    return 0;
  }
  int v3 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  int v4 = [(NSNumber *)self->inputCubeDimension intValue];
  uint64_t v5 = +[CIVector vectorWithX:(double)v4 + -1.0 Y:1.0 / ((double)v4 + -1.0) Z:1.0 / (double)v4 W:1.0 / (double)(v4 * v4)];
  id v6 = [(CIColorCube *)self cubeImage];
  if ([v6 isOpaque]) {
    id v7 = [(CIColorCube *)self _kernelOpaque];
  }
  else {
    id v7 = [(CIColorCube *)self _kernel];
  }
  id v9 = v7;
  if ([(NSNumber *)self->inputExtrapolate BOOLValue])
  {
    if ([v6 isOpaque]) {
      id v9 = [(CIColorCube *)self _kernelOpaqueExtend];
    }
    else {
      id v9 = 0;
    }
  }
  [(CIImage *)v3 extent];
  v14[0] = v3;
  v14[1] = v6;
  v14[2] = v5;
  return (id)objc_msgSend((id)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 3), v10, v11, v12, v13), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputCubeDimension
{
  return self->inputCubeDimension;
}

- (void)setInputCubeDimension:(id)a3
{
}

- (NSData)inputCubeData
{
  return self->inputCubeData;
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
}

@end