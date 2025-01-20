@interface CIPhotoEffect3D
+ (id)customAttributes;
- (CIImage)inputDepthMap;
- (CIImage)inputImage;
- (CIPhotoEffect3D)init;
- (NSNumber)inputGrainAmount;
- (NSNumber)inputScale;
- (NSNumber)inputThreshold;
- (id)_CIPhotoEffectDepthBlend;
- (id)applyCubeWithName:(id)a3 toImage:(id)a4;
- (id)backgroundCubeName;
- (id)backgroundCubePath;
- (id)cubeColorSpaceName;
- (id)cubeName;
- (id)cubePath;
- (id)outputImage;
- (int)_defaultVersion;
- (int)_maxVersion;
- (int)_maxVersionBG;
- (void)setDefaults;
- (void)setInputDepthMap:(id)a3;
- (void)setInputGrainAmount:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputThreshold:(id)a3;
@end

@implementation CIPhotoEffect3D

- (void)setInputThreshold:(id)a3
{
}

- (void)setInputScale:(id)a3
{
}

- (void)setInputImage:(id)a3
{
}

- (void)setInputDepthMap:(id)a3
{
}

- (void)setDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect3D;
  [(CIFilter *)&v3 setDefaults];
  -[CIPhotoEffect3D setValue:forKey:](self, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPhotoEffect3D _defaultVersion](self, "_defaultVersion")), @"__inputVersion");
}

- (CIPhotoEffect3D)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIPhotoEffect3D;
  v2 = [(CIPhotoEffect3D *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    -[CIPhotoEffect3D setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPhotoEffect3D _defaultVersion](v2, "_defaultVersion")), @"__inputVersion");
  }
  return v3;
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
  v9[5] = @"CICategoryBuiltIn";
  v9[6] = @"CICategoryXMPSerializable";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v11[1] = @"10";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.11";
  v10[3] = @"inputThreshold";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4A9690;
  v8[1] = &unk_1EE4A96A0;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A9690;
  v8[3] = &unk_1EE4A96A0;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeIdentity";
  v8[4] = &unk_1EE4A96B0;
  v8[5] = &unk_1EE4A96C0;
  v7[6] = @"CIAttributeType";
  v8[6] = @"CIAttributeTypeScalar";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  v10[4] = @"inputGrainAmount";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeMax";
  v6[0] = &unk_1EE4A9690;
  v6[1] = &unk_1EE4A96A0;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A9690;
  v6[3] = &unk_1EE4A96A0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A9690;
  v6[5] = &unk_1EE4A9690;
  v5[6] = @"CIAttributeType";
  v6[6] = @"CIAttributeTypeScalar";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  v10[5] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4A9690;
  v4[1] = &unk_1EE4A96D0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A9690;
  v4[3] = &unk_1EE4A96D0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A96A0;
  v4[5] = &unk_1EE4A96A0;
  v3[6] = @"CIAttributeType";
  v4[6] = @"CIAttributeTypeScalar";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (void)setInputGrainAmount:(id)a3
{
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputGrainAmount
{
  return self->inputGrainAmount;
}

- (CIImage)inputDepthMap
{
  return self->inputDepthMap;
}

- (id)backgroundCubePath
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [(CIPhotoEffect3D *)self backgroundCubeName];

  return (id)[v3 pathForResource:v4 ofType:@"scube"];
}

- (id)cubePath
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [(CIPhotoEffect3D *)self cubeName];

  return (id)[v3 pathForResource:v4 ofType:@"scube"];
}

- (id)cubeName
{
  uint64_t v3 = objc_msgSend((id)-[CIPhotoEffect3D valueForKey:](self, "valueForKey:", @"__inputVersion"), "intValue");
  if ((int)v3 >= [(CIPhotoEffect3D *)self _maxVersion]) {
    uint64_t v3 = [(CIPhotoEffect3D *)self _maxVersion];
  }
  id v4 = (objc_class *)objc_opt_class();
  id result = NSStringFromClass(v4);
  if ((int)v3 >= 1) {
    return (id)[NSString stringWithFormat:@"%@.%d", result, v3];
  }
  return result;
}

- (id)backgroundCubeName
{
  uint64_t v3 = objc_msgSend((id)-[CIPhotoEffect3D valueForKey:](self, "valueForKey:", @"__inputVersion"), "intValue");
  if ((int)v3 >= [(CIPhotoEffect3D *)self _maxVersionBG]) {
    uint64_t v3 = [(CIPhotoEffect3D *)self _maxVersionBG];
  }
  id v4 = (objc_class *)objc_opt_class();
  id result = (id)[NSString stringWithFormat:@"%@BG", NSStringFromClass(v4)];
  if ((int)v3 >= 1) {
    return (id)[NSString stringWithFormat:@"%@.%d", result, v3];
  }
  return result;
}

- (int)_maxVersionBG
{
  return 1;
}

- (int)_defaultVersion
{
  return 0;
}

- (id)_CIPhotoEffectDepthBlend
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_photoEffectDepthBlend];
}

- (id)cubeColorSpaceName
{
  return (id)*MEMORY[0x1E4F1DB90];
}

- (id)applyCubeWithName:(id)a3 toImage:(id)a4
{
  if (-[CIPhotoEffect3D applyCubeWithName:toImage:]::once != -1) {
    dispatch_once(&-[CIPhotoEffect3D applyCubeWithName:toImage:]::once, &__block_literal_global_53);
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke_44;
  v9[3] = &unk_1E5772880;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  void v9[7] = &v10;
  dispatch_sync((dispatch_queue_t)-[CIPhotoEffect3D applyCubeWithName:toImage:]::isolationQueue, v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

id __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  -[CIPhotoEffect3D applyCubeWithName:toImage:]::isolationQueue = (uint64_t)dispatch_queue_create("com.apple.coreimage.photoEffects3DIsolation", v0);
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  -[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes = (uint64_t)result;
  return result;
}

uint64_t __45__CIPhotoEffect3D_applyCubeWithName_toImage___block_invoke_44(void *a1)
{
  v2 = (CIFilter *)[(id)-[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes objectForKey:a1[4]];
  if (!v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a1[4], @"scube"));
    uint64_t v4 = (int)cbrt((double)((unint64_t)[v3 length] >> 2));
    objc_super v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    v2 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIColorCube", @"inputCubeData", v3, @"inputCubeDimension", [NSNumber numberWithInt:v4], 0);
    CGColorSpaceRelease(v5);
    [(id)-[CIPhotoEffect3D applyCubeWithName:toImage:]::cubes setObject:v2 forKey:a1[4]];
  }
  [(CIFilter *)v2 setValue:a1[6] forKey:@"inputImage"];
  *(void *)(*(void *)(a1[7] + 8) + 40) = [(CIFilter *)v2 outputImage];

  return [(CIFilter *)v2 setValue:0 forKey:@"inputImage"];
}

- (id)outputImage
{
  v39[4] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  double width = v40.size.width;
  double height = v40.size.height;
  if (CGRectIsEmpty(v40)) {
    return 0;
  }
  id v6 = [(CIPhotoEffect3D *)self cubeName];
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  inputImage = self->inputImage;
  if (v7)
  {
    inputImage = [(CIImage *)inputImage imageByColorMatchingWorkingSpaceToColorSpace:v7];
    id v9 = (id)objc_msgSend(-[CIPhotoEffect3D applyCubeWithName:toImage:](self, "applyCubeWithName:toImage:", v6, inputImage), "imageByColorMatchingColorSpaceToWorkingSpace:", v7);
  }
  else
  {
    id v9 = [(CIPhotoEffect3D *)self applyCubeWithName:v6 toImage:inputImage];
  }
  objc_super v5 = v9;
  [(CIImage *)self->inputDepthMap extent];
  double v10 = v41.size.width;
  double v11 = v41.size.height;
  if (!CGRectIsEmpty(v41))
  {
    id v12 = [(CIPhotoEffect3D *)self applyCubeWithName:[(CIPhotoEffect3D *)self backgroundCubeName] toImage:inputImage];
    uint64_t v13 = (uint64_t)v12;
    if (v7) {
      uint64_t v13 = [v12 imageByColorMatchingColorSpaceToWorkingSpace:v7];
    }
    inputDepthMap = self->inputDepthMap;
    if (width != v10 || height != v11)
    {
      float v16 = width;
      float v17 = v10;
      float v18 = v16 / v17;
      float v19 = height;
      float v20 = v11;
      CGAffineTransformMakeScale(&v36, v18, (float)(v19 / v20));
      inputDepthMap = [(CIImage *)inputDepthMap imageByApplyingTransform:&v36];
    }
    id v21 = [(CIPhotoEffect3D *)self _CIPhotoEffectDepthBlend];
    [v5 extent];
    v39[0] = v5;
    v39[1] = v13;
    inputThreshold = self->inputThreshold;
    v39[2] = inputDepthMap;
    v39[3] = inputThreshold;
    objc_super v5 = objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 4), v23, v24, v25, v26);
    [(NSNumber *)self->inputGrainAmount floatValue];
    float v28 = v27;
    [(NSNumber *)self->inputScale floatValue];
    float v30 = v28 * v29;
    if (fabsf(v30) < 0.001)
    {
      v37[0] = @"inputAmount";
      v31 = NSNumber;
      [(NSNumber *)self->inputScale floatValue];
      *(float *)&double v33 = v30 * v32;
      uint64_t v34 = [v31 numberWithFloat:v33];
      v37[1] = @"inputISO";
      v38[0] = v34;
      v38[1] = &unk_1EE4AAC70;
      objc_super v5 = objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
    }
  }
  CGColorSpaceRelease(v7);
  return v5;
}

- (int)_maxVersion
{
  return 0;
}

@end