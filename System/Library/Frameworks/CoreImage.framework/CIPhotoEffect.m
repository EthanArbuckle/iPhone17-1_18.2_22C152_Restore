@interface CIPhotoEffect
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIPhotoEffect)init;
- (NSNumber)inputExtrapolate;
- (id)cubeColorSpaceName;
- (id)cubeName;
- (id)cubePath;
- (id)outputImage;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
- (void)setInputExtrapolate:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPhotoEffect

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryInterlaced";
  v5[3] = @"CICategoryNonSquarePixels";
  v5[4] = @"CICategoryStillImage";
  v5[5] = @"CICategoryHighDynamicRange";
  v5[6] = @"CICategoryBuiltIn";
  v5[7] = @"CICategoryXMPSerializable";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
  v7[1] = @"7";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.9";
  v6[3] = @"inputExtrapolate";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeMin";
  v4[0] = MEMORY[0x1E4F1CC28];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeType";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = @"CIAttributeTypeBoolean";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (void)setInputExtrapolate:(id)a3
{
}

- (void)setInputImage:(id)a3
{
}

- (void)setDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect;
  [(CIFilter *)&v3 setDefaults];
  -[CIPhotoEffect setValue:forKey:](self, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPhotoEffect _defaultVersion](self, "_defaultVersion")), @"__inputVersion");
}

- (CIPhotoEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIPhotoEffect;
  v2 = [(CIPhotoEffect *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    -[CIPhotoEffect setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPhotoEffect _defaultVersion](v2, "_defaultVersion")), @"__inputVersion");
  }
  return v3;
}

- (id)cubeName
{
  uint64_t v3 = objc_msgSend((id)-[CIPhotoEffect valueForKey:](self, "valueForKey:", @"__inputVersion"), "intValue");
  if ((int)v3 >= [(CIPhotoEffect *)self _maxVersion]) {
    uint64_t v3 = [(CIPhotoEffect *)self _maxVersion];
  }
  v4 = (objc_class *)objc_opt_class();
  id result = NSStringFromClass(v4);
  if ((int)v3 >= 1) {
    return (id)[NSString stringWithFormat:@"%@.%d", result, v3];
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (id)cubePath
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [(CIPhotoEffect *)self cubeName];

  return (id)[v3 pathForResource:v4 ofType:@"scube"];
}

- (int)_defaultVersion
{
  return 0;
}

- (id)cubeColorSpaceName
{
  return (id)*MEMORY[0x1E4F1DC98];
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  if (-[CIPhotoEffect outputImage]::once != -1) {
    dispatch_once(&-[CIPhotoEffect outputImage]::once, &__block_literal_global_52);
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CIPhotoEffect_outputImage__block_invoke_22;
  v5[3] = &unk_1E5771C38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)-[CIPhotoEffect outputImage]::isolationQueue, v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __28__CIPhotoEffect_outputImage__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  -[CIPhotoEffect outputImage]::isolationQueue = (uint64_t)dispatch_queue_create("com.apple.coreimage.photoEffectsIsolation", v0);
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  -[CIPhotoEffect outputImage]::cubes = (uint64_t)result;
  return result;
}

uint64_t __28__CIPhotoEffect_outputImage__block_invoke_22(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cubeName];
  uint64_t v3 = (CIFilter *)[(id)-[CIPhotoEffect outputImage]::cubes objectForKey:v2];
  if (!v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", v2, @"scube"));
    uint64_t v5 = (int)cbrt((double)((unint64_t)[v4 length] >> 2));
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v3 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIColorCubeWithColorSpace", @"inputCubeData", v4, @"inputColorSpace", DeviceRGB, @"inputCubeDimension", [NSNumber numberWithInt:v5], 0);
    CGColorSpaceRelease(DeviceRGB);
    [(id)-[CIPhotoEffect outputImage]::cubes setObject:v3 forKey:v2];
  }
  [(CIFilter *)v3 setValue:*(void *)(*(void *)(a1 + 32) + 80) forKey:@"inputImage"];
  [(CIFilter *)v3 setValue:*(void *)(*(void *)(a1 + 32) + 88) forKey:@"inputExtrapolate"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(CIFilter *)v3 outputImage];

  return [(CIFilter *)v3 setValue:0 forKey:@"inputImage"];
}

- (int)_maxVersion
{
  return 0;
}

@end