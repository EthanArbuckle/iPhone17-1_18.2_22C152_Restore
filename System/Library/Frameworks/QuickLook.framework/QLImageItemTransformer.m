@interface QLImageItemTransformer
+ (id)allowedOutputClasses;
+ (id)animatableContentTypes;
- (double)_maximumDimension;
- (id)_contentsFromCGImageSource:(CGImageSource *)a3 context:(id)a4 scale:(double)a5;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLImageItemTransformer

+ (id)allowedOutputClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  CGImageSourceRef v8 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v8)
  {
    CGImageSourceRef v9 = v8;
    v10 = [(QLImageItemTransformer *)self _contentsFromCGImageSource:v8 context:v7 scale:1.0];
    CFRelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  id v8 = a4;
  CGImageSourceRef v9 = [v8 bitmapFormat];

  if (v9)
  {
    v10 = [v8 bitmapFormat];
    uint64_t v11 = [v10 colorSpace];
    if (v11)
    {
      v12 = (CGColorSpace *)v11;
      v13 = CGDataProviderCreateWithCFData(v7);
      v14 = CGImageCreate([v10 width], objc_msgSend(v10, "height"), objc_msgSend(v10, "bitsPerComponent"), objc_msgSend(v10, "bitsPerPixel"), objc_msgSend(v10, "bytesPerRow"), v12, objc_msgSend(v10, "bitmapInfo"), v13, 0, 0, kCGRenderingIntentDefault);
      CFRelease(v13);
    }
    else
    {
      v14 = 0;
    }
    v17 = [MEMORY[0x263F827E8] imageWithCGImage:v14 scale:0 orientation:1.0];
    CGImageRelease(v14);
  }
  else
  {
    CGImageSourceRef v15 = CGImageSourceCreateWithData(v7, 0);
    if (v15)
    {
      CGImageSourceRef v16 = v15;
      v17 = [(QLImageItemTransformer *)self _contentsFromCGImageSource:v15 context:v8 scale:1.0];
      CFRelease(v16);
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)_contentsFromCGImageSource:(CGImageSource *)a3 context:(id)a4 scale:(double)a5
{
  v58[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  size_t Count = CGImageSourceGetCount(a3);
  v10 = [v8 contentType];

  if (v10)
  {
    v10 = (void *)MEMORY[0x263F1D920];
    v12 = [v8 contentType];
    v13 = [v10 typeWithIdentifier:v12];

    v14 = [(id)objc_opt_class() animatableContentTypes];
    LODWORD(v10) = _QLContentTypeConformsToContentTypeInSet();
  }
  if (Count >= 2
    && (double Helper_x8__OBJC_CLASS___PFImageMetadata = gotLoadHelper_x8__OBJC_CLASS___PFImageMetadata(v11),
        (v10 & (objc_msgSend(*(id *)(v16 + 3848), "imageSourceIsMonoski:", a3, Helper_x8__OBJC_CLASS___PFImageMetadata) ^ 1)) == 1))
  {
    v17 = [[QLAnimatedImage alloc] initWithImageSource:a3];
  }
  else
  {
    uint64_t v57 = *MEMORY[0x263F0F620];
    uint64_t v18 = MEMORY[0x263EFFA88];
    v58[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v19 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(a3, 0, v19);
    v21 = [(__CFDictionary *)v20 objectForKeyedSubscript:*MEMORY[0x263F0F4F8]];
    [v21 floatValue];
    float v23 = v22;

    v24 = [(__CFDictionary *)v20 objectForKeyedSubscript:*MEMORY[0x263F0F4F0]];
    [v24 floatValue];
    float v26 = v25;

    v27 = [(__CFDictionary *)v20 objectForKeyedSubscript:*MEMORY[0x263F0F4C8]];
    v28 = v27;
    if (v27) {
      unsigned int v29 = [v27 unsignedIntValue] - 2;
    }
    else {
      unsigned int v29 = -1;
    }
    if (v23 >= v26) {
      float v30 = v26;
    }
    else {
      float v30 = v23;
    }
    double v31 = v30;
    [(QLImageItemTransformer *)self _maximumDimension];
    double v33 = v32;
    uint64_t v34 = [v8 viewDynamicRange];
    if (v33 <= v31 * 0.5)
    {
      [(QLImageItemTransformer *)self _maximumDimension];
      v42 = QLScaledPlatformImageFromImageSource();
      v43 = (void *)MEMORY[0x263F827E8];
      uint64_t v44 = [v42 CGImage];
      [v42 scale];
      double v46 = v45;
      unsigned int v47 = [v42 orientation] - 2;
      if (v47 > 6) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = qword_218043918[v47];
      }
      v17 = [v43 imageWithCGImage:v44 scale:v48 orientation:v46];
    }
    else
    {
      uint64_t v35 = v34;
      if (_os_feature_enabled_impl() && v35)
      {
        uint64_t v36 = *MEMORY[0x263F0F5C0];
        v55[0] = *MEMORY[0x263F0F650];
        v55[1] = v36;
        uint64_t v37 = *MEMORY[0x263F0F5D0];
        v56[0] = v18;
        v56[1] = v37;
        v55[2] = *MEMORY[0x263F0F5C8];
        v56[2] = &unk_26C913300;
        v38 = NSDictionary;
        v39 = v56;
        v40 = v55;
        uint64_t v41 = 3;
      }
      else
      {
        uint64_t v53 = *MEMORY[0x263F0F650];
        uint64_t v54 = v18;
        v38 = NSDictionary;
        v39 = &v54;
        v40 = &v53;
        uint64_t v41 = 1;
      }
      CFDictionaryRef v49 = [v38 dictionaryWithObjects:v39 forKeys:v40 count:v41];

      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, v49);
      uint64_t v51 = 0;
      if (v29 <= 6) {
        uint64_t v51 = qword_218043918[v29];
      }
      v17 = [MEMORY[0x263F827E8] imageWithCGImage:ImageAtIndex scale:v51 orientation:a5];
      if (ImageAtIndex) {
        CFRelease(ImageAtIndex);
      }
      CFDictionaryRef v19 = v49;
    }
  }

  return v17;
}

- (double)_maximumDimension
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  CFDataRef v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = v8;

  if (v4 <= v6) {
    double v10 = v6;
  }
  else {
    double v10 = v4;
  }
  return v10 * v9 * 3.0;
}

+ (id)animatableContentTypes
{
  if (animatableContentTypes_onceToken != -1) {
    dispatch_once(&animatableContentTypes_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)animatableContentTypes_animatableContentTypes;

  return v2;
}

void __48__QLImageItemTransformer_animatableContentTypes__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1D920] typeWithIdentifier:@"public.heics"];
  uint64_t v1 = *MEMORY[0x263F1DAD0];
  uint64_t v2 = *MEMORY[0x263F1DC08];
  uint64_t v3 = *MEMORY[0x263F1DD78];
  uint64_t v4 = *MEMORY[0x263F1DAE8];
  double v8 = (void *)v0;
  if (v0) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v1, v2, v3, v4, v0, 0);
  }
  else {
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v1, v2, v3, v4, 0, v7);
  }
  double v6 = (void *)animatableContentTypes_animatableContentTypes;
  animatableContentTypes_animatableContentTypes = v5;
}

@end