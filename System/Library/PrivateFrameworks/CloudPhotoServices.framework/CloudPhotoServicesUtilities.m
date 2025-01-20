@interface CloudPhotoServicesUtilities
+ (CGImageSource)newImageSourceFromImageAtURL:(id)a3;
+ (CGSize)dimensionsForAVAsset:(id)a3;
+ (CGSize)sizeOfImageAtURL:(id)a3 orientationOut:(int *)a4;
+ (void)getDimensionsFromImageProperties:(id)a3 orientationOut:(int *)a4 widthOut:(int *)a5 heightOut:(int *)a6;
@end

@implementation CloudPhotoServicesUtilities

+ (void)getDimensionsFromImageProperties:(id)a3 orientationOut:(int *)a4 widthOut:(int *)a5 heightOut:(int *)a6
{
  id v14 = a3;
  if (a4)
  {
    v9 = [v14 objectForKey:*MEMORY[0x1E4F2FCA0]];
    if (!v9)
    {
      v10 = [v14 objectForKey:*MEMORY[0x1E4F2FD40]];
      if (!v10
        || (v11 = v10,
            [v10 objectForKey:*MEMORY[0x1E4F2FD70]],
            v9 = objc_claimAutoreleasedReturnValue(),
            v11,
            !v9))
      {
        v9 = &unk_1F38C5AF0;
      }
    }
    *a4 = [v9 intValue];
  }
  if (a5)
  {
    v12 = [v14 objectForKey:@"RawPixelWidth"];
    if (!v12)
    {
      v12 = [v14 objectForKey:*MEMORY[0x1E4F2FD00]];
      if (!v12)
      {
        v12 = [v14 objectForKey:*MEMORY[0x1E4F2F8D8]];
      }
    }
    *a5 = [v12 intValue];
  }
  if (a6)
  {
    v13 = [v14 objectForKey:@"RawPixelHeight"];
    if (!v13)
    {
      v13 = [v14 objectForKey:*MEMORY[0x1E4F2FCE8]];
      if (!v13)
      {
        v13 = [v14 objectForKey:*MEMORY[0x1E4F2F8E0]];
      }
    }
    *a6 = [v13 intValue];
  }
}

+ (CGImageSource)newImageSourceFromImageAtURL:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 pathExtension];
  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v4 conformingToType:*MEMORY[0x1E4F44400]];
    v6 = [v5 identifier];

    if (v6)
    {
      uint64_t v10 = *MEMORY[0x1E4F2FF78];
      v11[0] = v6;
      CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      CFDictionaryRef v7 = 0;
    }
  }
  else
  {
    CFDictionaryRef v7 = 0;
    v6 = 0;
  }
  v8 = CGImageSourceCreateWithURL((CFURLRef)v3, v7);

  return v8;
}

+ (CGSize)dimensionsForAVAsset:(id)a3
{
  CGFloat width = *MEMORY[0x1E4F1DB30];
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3)
  {
    v5 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a3];
    if ([v5 count])
    {
      v6 = [v5 objectAtIndex:0];
      [v6 naturalSize];
      double v8 = v7;
      double v10 = v9;
      if (v6) {
        [v6 preferredTransform];
      }
      v14.size.CGFloat width = v10 * 0.0 + 0.0 * v8;
      v14.size.CGFloat height = v14.size.width;
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      CGRect v15 = CGRectStandardize(v14);
      CGFloat width = v15.size.width;
      CGFloat height = v15.size.height;
    }
  }
  double v11 = width;
  double v12 = height;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

+ (CGSize)sizeOfImageAtURL:(id)a3 orientationOut:(int *)a4
{
  v6 = (CGImageSource *)[a1 newImageSourceFromImageAtURL:a3];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v6)
  {
    double v9 = v6;
    CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    if (v10)
    {
      uint64_t v13 = 0;
      [a1 getDimensionsFromImageProperties:v10 orientationOut:a4 widthOut:(char *)&v13 + 4 heightOut:&v13];
      double v7 = (double)SHIDWORD(v13);
      double v8 = (double)(int)v13;
    }
    CFRelease(v9);
  }
  double v11 = v7;
  double v12 = v8;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

@end