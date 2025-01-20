@interface PortraitEffetcPrewarm
- (id)getFaceFeatures:(float)a3;
- (void)run:(id)a3 withContext:(id)a4 withFaceScales:(id)a5 withProxyRendering:(BOOL)a6;
@end

@implementation PortraitEffetcPrewarm

- (id)getFaceFeatures:(float)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [&off_7DFD8 objectAtIndexedSubscript:0];
  id v23 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v5;
        uint64_t v6 = *(void *)(*((void *)&v29 + 1) + 8 * v5);
        [v4 setObject:objc_alloc_init((Class)NSMutableArray) forKey:v6];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = objc_msgSend(objc_msgSend(&off_7DFD8, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", v6);
        id v8 = [v7 countByEnumeratingWithState:&v25 objects:v38 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            v11 = 0;
            do
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v11);
              id v13 = [v4 objectForKeyedSubscript:v6];
              v36[0] = @"x";
              objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:"), "floatValue");
              *(float *)&double v15 = v14 * a3;
              v16 = +[NSNumber numberWithFloat:v15];
              v36[1] = @"y";
              v37[0] = v16;
              objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:"), "floatValue");
              *(float *)&double v18 = v17 * a3;
              v37[1] = +[NSNumber numberWithFloat:v18];
              objc_msgSend(v13, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v25 objects:v38 count:16];
          }
          while (v9);
        }
        uint64_t v5 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v23);
  }
  [v4 setValue:&off_7A860 forKey:@"orientation"];
  [v4 setValue:&off_7A0C0 forKey:@"faceJunkinessIndex"];
  [v4 setValue:&off_7A0D0 forKey:@"faceOrientationIndex"];
  v34[0] = @"h";
  double v19 = a3;
  v35[0] = +[NSNumber numberWithDouble:v19 * 0.36];
  v34[1] = @"w";
  v35[1] = +[NSNumber numberWithDouble:v19 * 0.48];
  v35[2] = &off_7A0E0;
  v34[2] = @"x";
  v34[3] = @"y";
  v35[3] = &off_7A0E0;
  objc_msgSend(v4, "setValue:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4), @"faceBoundingBox");
  id v33 = v4;
  return +[NSArray arrayWithObjects:&v33 count:1];
}

- (void)run:(id)a3 withContext:(id)a4 withFaceScales:(id)a5 withProxyRendering:(BOOL)a6
{
  if (a4)
  {
    BOOL v48 = a6;
    CVPixelBufferRef pixelBufferOut = 0;
    CFStringRef v9 = kCVPixelBufferIOSurfacePropertiesKey;
    CFStringRef v84 = kCVPixelBufferIOSurfacePropertiesKey;
    v85 = &__NSDictionary0__struct;
    CVPixelBufferCreate(0, 0x7E0uLL, 0x5E8uLL, 0x34323066u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1], &pixelBufferOut);
    CFStringRef name = kCGColorSpaceDisplayP3;
    CGColorSpaceRef v10 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    CIImageOption v82 = kCIImageColorSpace;
    CGColorSpaceRef v83 = v10;
    CGColorSpaceRef v49 = v10;
    v11 = +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", pixelBufferOut, +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1]);
    CVPixelBufferRef texture = 0;
    CFStringRef v80 = v9;
    v81 = &__NSDictionary0__struct;
    CVPixelBufferCreate(0, 0x300uLL, 0x240uLL, 0x4C303068u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1], &texture);
    CGColorSpaceRef v12 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearGray);
    CIImageOption v78 = kCIImageColorSpace;
    CGColorSpaceRef v79 = v12;
    CGColorSpaceRef v13 = v12;
    float v14 = +[CIImage imageWithCVPixelBuffer:options:](CIImage, "imageWithCVPixelBuffer:options:", texture, +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1]);
    double v15 = +[CIFilter filterWithName:a3];
    v16 = [(CIFilter *)v15 inputKeys];
    [(CIFilter *)v15 setValue:v11 forKey:kCIInputImageKey];
    if (v48) {
      [(CIFilter *)v15 setValue:&off_7A878, @"inputRenderProxy", kCGColorSpaceDisplayP3 forKey];
    }
    [(CIFilter *)v15 setValue:&off_79E50, @"inputStrength", name forKey];
    if (v14)
    {
      CFStringRef v17 = v9;
      if ([(NSArray *)v16 containsObject:@"inputDisparity"]) {
        [(CIFilter *)v15 setValue:v14 forKey:@"inputDisparity"];
      }
      CVPixelBufferRef v61 = 0;
      if ([(NSArray *)v16 containsObject:@"inputDepthMap"])
      {
        CFStringRef v76 = v9;
        v77 = &__NSDictionary0__struct;
        CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1], &v61);
        double v18 = +[CIImage imageWithCVPixelBuffer:v61];
        if (v18) {
          [(CIFilter *)v15 setValue:v18 forKey:@"inputDepthMap"];
        }
      }
      CVPixelBufferRef v60 = 0;
      if ([(NSArray *)v16 containsObject:@"inputBlurMap"])
      {
        CFStringRef v74 = v9;
        v75 = &__NSDictionary0__struct;
        CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1], &v60);
        double v19 = +[CIImage imageWithCVPixelBuffer:v60];
        if (v19) {
          [(CIFilter *)v15 setValue:v19 forKey:@"inputBlurMap"];
        }
      }
    }
    else
    {
      CVPixelBufferRef v60 = 0;
      CVPixelBufferRef v61 = 0;
      CFStringRef v17 = v9;
    }
    CVPixelBufferRef v59 = 0;
    if ([(NSArray *)v16 containsObject:@"inputMatte"])
    {
      CFStringRef v72 = v17;
      v73 = &__NSDictionary0__struct;
      CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1], &v59);
      v20 = +[CIImage imageWithCVPixelBuffer:v59];
      if (v20) {
        [(CIFilter *)v15 setValue:v20 forKey:@"inputMatte"];
      }
    }
    CVPixelBufferRef v58 = 0;
    if ([(NSArray *)v16 containsObject:@"inputFaceMask"])
    {
      CFStringRef v70 = v17;
      v71 = &__NSDictionary0__struct;
      CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1], &v58);
      v21 = +[CIImage imageWithCVPixelBuffer:v58];
      if (v21) {
        [(CIFilter *)v15 setValue:v21 forKey:@"inputFaceMask"];
      }
    }
    CVPixelBufferRef v57 = 0;
    if ([(NSArray *)v16 containsObject:@"inputTeethMask"])
    {
      CFStringRef v68 = v17;
      v69 = &__NSDictionary0__struct;
      CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1], &v57);
      uint64_t v22 = +[CIImage imageWithCVPixelBuffer:v57];
      if (v22) {
        [(CIFilter *)v15 setValue:v22 forKey:@"inputTeethMask"];
      }
    }
    CVPixelBufferRef v56 = 0;
    if ([(NSArray *)v16 containsObject:@"inputHairMask"])
    {
      CFStringRef v66 = v17;
      v67 = &__NSDictionary0__struct;
      CVPixelBufferCreate(0, 0x3F0uLL, 0x2F4uLL, 0x4C303038u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1], &v56);
      id v23 = +[CIImage imageWithCVPixelBuffer:v56];
      if (v23) {
        [(CIFilter *)v15 setValue:v23 forKey:@"inputHairMask"];
      }
    }
    uint64_t v24 = [(CIFilter *)v15 outputImage];

    if (v24)
    {
      space = CGColorSpaceCreateWithName(namea);
      [(CIImage *)v24 extent];
      CFStringRef v25 = v17;
      size_t v27 = (unint64_t)v26;
      [(CIImage *)v24 extent];
      size_t v29 = (unint64_t)v28;
      CVPixelBufferRef v64 = 0;
      v86[0] = kCVPixelBufferWidthKey;
      v87[0] = +[NSNumber numberWithUnsignedLong:v27];
      v86[1] = kCVPixelBufferHeightKey;
      long long v30 = +[NSNumber numberWithUnsignedLong:v29];
      v86[2] = v25;
      v87[1] = v30;
      v87[2] = &__NSDictionary0__struct;
      CVPixelBufferCreate(0, v27, v29, 0x34323066u, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:3], &v64);
      CVPixelBufferRef v31 = v64;
      id v32 = [objc_alloc((Class)CIRenderDestination) initWithPixelBuffer:v64];
      [v32 setColorSpace:space];
      [(CIImage *)v24 extent];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v41 = [a5 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v53;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v53 != v43) {
              objc_enumerationMutation(a5);
            }
            [*(id *)(*((void *)&v52 + 1) + 8 * i) floatValue];
            -[CIFilter setValue:forKey:](v15, "setValue:forKey:", -[PortraitEffetcPrewarm getFaceFeatures:](self, "getFaceFeatures:"), @"inputFaceLandmarkArray");
            objc_msgSend(a4, "prepareRender:fromRect:toDestination:atPoint:error:", -[CIFilter outputImage](v15, "outputImage"), v32, 0, v34, v36, v38, v40, 0.0, 0.0);
          }
          id v42 = [a5 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v42);
      }

      CGColorSpaceRelease(space);
      CFRelease(v31);
      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRelease(texture);
      CVPixelBufferRelease(v61);
      CVPixelBufferRelease(v60);
      CVPixelBufferRelease(v59);
      CVPixelBufferRelease(v58);
      CVPixelBufferRelease(v57);
      CVPixelBufferRelease(v56);
    }
  }
}

@end