@interface MUImageDownsamplingUtilities
+ (BOOL)_flattenEXIFOrientationOfImage:(id)a3 toDestination:(id)a4;
+ (CGImageSource)_newImageSourceWithSourceContent:(id)a3;
+ (CGSize)_sizeFittingArea:(double)a3 withSize:(CGSize)a4;
+ (double)_maxDimensionOfSize:(CGSize)a3 fittingToArea:(double)a4;
+ (id)_flattenEXIFOrientation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceContent:(id)a5 withContentType:(id)a6;
+ (id)_flattenRotation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceImage:(id)a5;
+ (id)_preferredFileDisplayNameForSourceContent:(id)a3;
+ (id)_sourceContentType:(id)a3;
+ (id)_uniqueTemporaryDirectory;
+ (void)_shouldFlattenEXIFOrientation:(BOOL *)a3 andDownsample:(BOOL *)a4 sourceContent:(id)a5;
@end

@implementation MUImageDownsamplingUtilities

+ (id)_sourceContentType:(id)a3
{
  v3 = (CGImageSource *)[a1 _newImageSourceWithSourceContent:a3];
  if (v3)
  {
    v4 = v3;
    v5 = CGImageSourceGetType(v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (CGImageSource)_newImageSourceWithSourceContent:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    CGImageSourceRef v6 = CGImageSourceCreateWithData(v3, 0);
  }
  else {
    CGImageSourceRef v6 = CGImageSourceCreateWithURL(v3, 0);
  }
  v7 = v6;

  return v7;
}

+ (void)_shouldFlattenEXIFOrientation:(BOOL *)a3 andDownsample:(BOOL *)a4 sourceContent:(id)a5
{
  id v8 = a5;
  if (a3) {
    *a3 = 0;
  }
  id v22 = v8;
  if (a4) {
    *a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v22;
    v10 = v9;
    if (a3 && [v9 imageOrientation]) {
      *a3 = 1;
    }
    if (a4)
    {
      [v10 size];
      double v12 = v11;
      [v10 size];
      if (v12 * v13 > maxImageArea()) {
        *a4 = 1;
      }
    }
  }
  else
  {
    v14 = (CGImageSource *)[a1 _newImageSourceWithSourceContent:v22];
    if (v14)
    {
      v15 = v14;
      if (a3)
      {
        CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
        v17 = [(__CFDictionary *)v16 valueForKey:*MEMORY[0x263F0F4C8]];
        if ([v17 longLongValue] >= 2) {
          *a3 = 1;
        }
      }
      if (a4)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
        if (ImageAtIndex)
        {
          v19 = ImageAtIndex;
          size_t Width = CGImageGetWidth(ImageAtIndex);
          double v21 = (double)(CGImageGetHeight(v19) * Width);
          if (maxImageArea() < v21) {
            *a4 = 1;
          }
          CGImageRelease(v19);
        }
      }
      CFRelease(v15);
    }
  }
}

+ (id)_flattenEXIFOrientation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceContent:(id)a5 withContentType:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  v40[4] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  double v12 = [a1 _uniqueTemporaryDirectory];
  if (!v12)
  {
    CFDictionaryRef v16 = 0;
    goto LABEL_26;
  }
  BOOL v37 = v8;
  uint64_t v13 = [a1 _preferredFileDisplayNameForSourceContent:v10];
  v14 = [v11 preferredFilenameExtension];
  v38 = (void *)v13;
  v15 = [v12 URLByAppendingPathComponent:v13];
  CFDictionaryRef v16 = v15;
  if (v14)
  {
    uint64_t v17 = [v15 URLByAppendingPathExtension:v14];

    CFDictionaryRef v16 = (void *)v17;
  }
  v18 = [v11 identifier];
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    v20 = [a1 _sourceContentType:v10];
  }
  double v21 = v20;

  CGImageDestinationRef v22 = CGImageDestinationCreateWithURL((CFURLRef)v16, v21, 1uLL, 0);
  if (v22)
  {
    CGImageDestinationRef v23 = v22;
    if (!v21 || (v24 = (CGImageSource *)[a1 _newImageSourceWithSourceContent:v10]) == 0)
    {
LABEL_24:
      CFRelease(v23);
      goto LABEL_25;
    }
    isrc = v24;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v24, 0, 0);
    if (ImageAtIndex)
    {
      v26 = ImageAtIndex;
      double Width = (double)CGImageGetWidth(ImageAtIndex);
      double Height = (double)CGImageGetHeight(v26);
      CGImageRelease(v26);
      if (v7)
      {
LABEL_13:
        objc_msgSend(a1, "_maxDimensionOfSize:fittingToArea:", Width, Height, maxImageArea());
LABEL_19:
        v39[0] = *MEMORY[0x263F0EFE0];
        v30 = [NSNumber numberWithDouble:v29];
        uint64_t v31 = *MEMORY[0x263F0F600];
        v40[0] = v30;
        v40[1] = MEMORY[0x263EFFA80];
        uint64_t v32 = *MEMORY[0x263F0F650];
        v39[1] = v31;
        v39[2] = v32;
        v39[3] = *MEMORY[0x263F0F5F8];
        v40[2] = MEMORY[0x263EFFA88];
        v40[3] = MEMORY[0x263EFFA88];
        v33 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];

        if (v37)
        {
          v34 = (void *)[v33 mutableCopy];
          [v34 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F0F5B8]];

          v33 = v34;
        }
        CGImageDestinationAddImageFromSource(v23, isrc, 0, (CFDictionaryRef)v33);
        if (!CGImageDestinationFinalize(v23))
        {

          NSLog(&cfstr_DownsampleImag.isa, v21, 0);
          CFDictionaryRef v16 = 0;
        }
        CFRelease(isrc);

        goto LABEL_24;
      }
    }
    else
    {
      double Width = 1.0;
      double Height = 1.0;
      if (v7) {
        goto LABEL_13;
      }
    }
    if (Width >= Height) {
      double v29 = Width;
    }
    else {
      double v29 = Height;
    }
    goto LABEL_19;
  }

  NSLog(&cfstr_DownsampleImag_0.isa, v21, 0);
  CFDictionaryRef v16 = 0;
LABEL_25:

LABEL_26:
  return v16;
}

+ (id)_flattenRotation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceImage:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [v7 size];
  if (v5)
  {
    double v10 = maxImageArea();
    [v7 size];
    objc_msgSend(a1, "_sizeFittingArea:withSize:", v10, v11, v12);
  }
  double v13 = v8;
  double v14 = v9;
  v15 = [MEMORY[0x263F1C688] defaultFormat];
  [v15 setScale:1.0];
  CFDictionaryRef v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v15, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__MUImageDownsamplingUtilities__flattenRotation_withDownsampling_sourceImage___block_invoke;
  v20[3] = &unk_2649C2CC8;
  id v21 = v7;
  double v22 = v13;
  double v23 = v14;
  id v17 = v7;
  v18 = [v16 imageWithActions:v20];

  return v18;
}

uint64_t __78__MUImageDownsamplingUtilities__flattenRotation_withDownsampling_sourceImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

+ (BOOL)_flattenEXIFOrientationOfImage:(id)a3 toDestination:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFURLRef v7 = (const __CFURL *)a4;
  double v8 = [a1 _sourceContentType:v6];
  CGImageDestinationRef v9 = CGImageDestinationCreateWithURL(v7, v8, 1uLL, 0);
  if (v9)
  {
    double v10 = v9;
    double v11 = (CGImageSource *)[a1 _newImageSourceWithSourceContent:v6];
    if (v11)
    {
      double v12 = v11;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
      if (ImageAtIndex)
      {
        double v14 = ImageAtIndex;
        double Width = (double)CGImageGetWidth(ImageAtIndex);
        double Height = (double)CGImageGetHeight(v14);
        CGImageRelease(v14);
      }
      else
      {
        double Height = 1.0;
        double Width = 1.0;
      }
      if (Width >= Height) {
        double v18 = Width;
      }
      else {
        double v18 = Height;
      }
      uint64_t v19 = *MEMORY[0x263F0F5B8];
      v25[0] = MEMORY[0x263EFFA88];
      uint64_t v20 = *MEMORY[0x263F0EFE0];
      v24[0] = v19;
      v24[1] = v20;
      id v21 = [NSNumber numberWithDouble:v18];
      v24[2] = *MEMORY[0x263F0F600];
      v25[1] = v21;
      v25[2] = MEMORY[0x263EFFA80];
      CFDictionaryRef v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

      CGImageDestinationAddImageFromSource(v10, v12, 0, v22);
      BOOL v17 = CGImageDestinationFinalize(v10);
      if (!v17) {
        NSLog(&cfstr_DownsampleImag.isa, v8, v7);
      }
      CFRelease(v12);
    }
    else
    {
      BOOL v17 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (id)_uniqueTemporaryDirectory
{
  v2 = NSTemporaryDirectory();
  CFDataRef v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];

  if (v4)
  {
    uint64_t v5 = [v2 stringByAppendingPathComponent:v4];

    v2 = (void *)v5;
  }
  id v6 = [MEMORY[0x263F08C38] UUID];
  CFURLRef v7 = [v6 UUIDString];
  double v8 = [v2 stringByAppendingPathComponent:v7];

  CGImageDestinationRef v9 = [MEMORY[0x263F08850] defaultManager];
  id v14 = 0;
  [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v10 = v14;
  double v11 = v10;
  if (v10)
  {
    NSLog(&cfstr_FailedToCreate_2.isa, v10);
    double v12 = 0;
  }
  else
  {
    double v12 = [NSURL fileURLWithPath:v8];
  }

  return v12;
}

+ (id)_preferredFileDisplayNameForSourceContent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 lastPathComponent];
    uint64_t v5 = [v4 stringByDeletingPathExtension];

    id v6 = [v5 _stringByTrimmingDotDirectories];
  }
  else
  {
    id v6 = 0;
  }
  if (![v6 length])
  {
    CFURLRef v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];

    id v6 = (void *)v8;
  }

  return v6;
}

+ (CGSize)_sizeFittingArea:(double)a3 withSize:(CGSize)a4
{
  if (a4.width * a4.height > a3)
  {
    a4.double height = sqrt(a3 / (a4.width / a4.height));
    a4.double width = a3 / a4.height;
  }
  double width = a4.width;
  double height = a4.height;
  result.double height = height;
  result.double width = width;
  return result;
}

+ (double)_maxDimensionOfSize:(CGSize)a3 fittingToArea:(double)a4
{
  objc_msgSend(a1, "_sizeFittingArea:withSize:", a4, a3.width, a3.height);
  if (v4 < v5) {
    double v4 = v5;
  }
  return floor(v4);
}

@end