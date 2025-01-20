@interface UIImage(Conversion)
+ (CGImageSource)avt_animatedImageWithDataRepresentation:()Conversion ofType:;
+ (id)animatedImageWithAPNGRepresentation:()Conversion;
+ (id)animatedImageWithHEICRepresentation:()Conversion;
+ (uint64_t)animatedImageWithHEICSRepresentation:()Conversion;
- (__CFData)avt_dataRepresentationForTypeIdentifier:()Conversion;
- (float)frameDelayInSeconds;
- (id)APNGRepresentation;
- (id)HEICRepresentation;
- (uint64_t)HEICSRepresentation;
- (uint64_t)copyByReorderingImagesWithFirstImageAtTime:()Conversion;
@end

@implementation UIImage(Conversion)

+ (id)animatedImageWithHEICRepresentation:()Conversion
{
  v4 = (void *)*MEMORY[0x263F1DAE8];
  id v5 = a3;
  v6 = [v4 identifier];
  v7 = objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", v5, v6);

  return v7;
}

+ (uint64_t)animatedImageWithHEICSRepresentation:()Conversion
{
  return objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", a3, @"public.heics");
}

+ (id)animatedImageWithAPNGRepresentation:()Conversion
{
  v4 = (void *)*MEMORY[0x263F1DC08];
  id v5 = a3;
  v6 = [v4 identifier];
  v7 = objc_msgSend(a1, "avt_animatedImageWithDataRepresentation:ofType:", v5, v6);

  return v7;
}

+ (CGImageSource)avt_animatedImageWithDataRepresentation:()Conversion ofType:
{
  id v5 = a4;
  v6 = CGImageSourceCreateWithData(a3, 0);
  v7 = v6;
  if (v6)
  {
    size_t Count = CGImageSourceGetCount(v6);
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
    if (Count)
    {
      for (size_t i = 0; i != Count; ++i)
      {
        CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, i, 0);
        if (ImageAtIndex)
        {
          v12 = ImageAtIndex;
          v13 = [MEMORY[0x263F1C6B0] imageWithCGImage:ImageAtIndex];
          [v9 addObject:v13];

          CGImageRelease(v12);
        }
        else
        {
          NSLog(&cfstr_AvatarkitAnima.isa, i);
        }
      }
    }
    float valuePtr = 0.016667;
    CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    if (!v14) {
      goto LABEL_18;
    }
    CFDictionaryRef v15 = v14;
    v16 = [(id)*MEMORY[0x263F1DC08] identifier];
    int v17 = [v5 isEqualToString:v16];

    if (v17)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x263F0F4E0]);
      v19 = (const void *)*MEMORY[0x263F0F070];
      goto LABEL_15;
    }
    v20 = [(id)*MEMORY[0x263F1DAE8] identifier];
    int v21 = [v5 isEqualToString:v20];

    if (v21)
    {
      float valuePtr = 0.066667;
    }
    else if ([v5 isEqualToString:@"public.heics"])
    {
      CFDictionaryRef v22 = CGImageSourceCopyProperties(v7, 0);
      CFDictionaryRef v23 = (const __CFDictionary *)CFDictionaryGetValue(v22, (const void *)*MEMORY[0x263F0F430]);
      CFRelease(v22);
      v19 = (const void *)*MEMORY[0x263F0F448];
      CFDictionaryRef Value = v23;
LABEL_15:
      CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(Value, v19);
      if (v24) {
        CFNumberGetValue(v24, kCFNumberFloatType, &valuePtr);
      }
    }
    CFRelease(v15);
LABEL_18:
    CFRelease(v7);
    float v25 = 1.0 / valuePtr;
    unint64_t v26 = [v9 count];
    v7 = [MEMORY[0x263F1C6B0] animatedImageWithImages:v9 duration:(double)v26 / v25];
  }
  return v7;
}

- (float)frameDelayInSeconds
{
  v2 = [a1 images];
  double v3 = (double)(unint64_t)[v2 count];
  [a1 duration];
  double v5 = v3 / v4;

  return 1.0 / v5;
}

- (id)HEICRepresentation
{
  v2 = [(id)*MEMORY[0x263F1DAE8] identifier];
  double v3 = objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", v2);

  return v3;
}

- (uint64_t)HEICSRepresentation
{
  return objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", @"public.heics");
}

- (id)APNGRepresentation
{
  v2 = [(id)*MEMORY[0x263F1DC08] identifier];
  double v3 = objc_msgSend(a1, "avt_dataRepresentationForTypeIdentifier:", v2);

  return v3;
}

- (__CFData)avt_dataRepresentationForTypeIdentifier:()Conversion
{
  v83[3] = *MEMORY[0x263EF8340];
  double v4 = a3;
  Mutable = CFDataCreateMutable(0, 0);
  [a1 frameDelayInSeconds];
  int v7 = v6;
  v8 = [(id)*MEMORY[0x263F1DC08] identifier];
  int v9 = [(__CFString *)v4 isEqualToString:v8];

  if (v9)
  {
    v56 = Mutable;
    v82[0] = *MEMORY[0x263F0F4E0];
    uint64_t v11 = v82[0];
    uint64_t v12 = *MEMORY[0x263F0F070];
    v80[0] = *MEMORY[0x263F0F068];
    v80[1] = v12;
    v81[0] = &unk_26C00C448;
    LODWORD(v10) = v7;
    v13 = [NSNumber numberWithFloat:v10];
    v81[1] = v13;
    CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
    v83[0] = v14;
    v82[1] = *MEMORY[0x263F0F1A0];
    CFDictionaryRef v15 = NSNumber;
    [a1 scale];
    int v17 = [v15 numberWithDouble:v16 * 72.0];
    v83[1] = v17;
    v82[2] = *MEMORY[0x263F0F198];
    v18 = NSNumber;
    [a1 scale];
    v20 = [v18 numberWithDouble:v19 * 72.0];
    v83[2] = v20;
    CFDictionaryRef v21 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];

    uint64_t v78 = v11;
    v76[0] = *MEMORY[0x263F0F058];
    LODWORD(v22) = v7;
    CFDictionaryRef v23 = [NSNumber numberWithFloat:v22];
    v77[0] = v23;
    v76[1] = *MEMORY[0x263F0EFE8];
    LODWORD(v24) = 1.0;
    float v25 = [NSNumber numberWithFloat:v24];
    v77[1] = v25;
    unint64_t v26 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    v79 = v26;
    v27 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];

LABEL_5:
    Mutable = v56;
    goto LABEL_7;
  }
  if ([(__CFString *)v4 isEqualToString:@"public.heics"])
  {
    v56 = Mutable;
    [a1 size];
    double v29 = v28;
    double v31 = v30;
    v74[0] = *MEMORY[0x263F0F430];
    uint64_t v32 = v74[0];
    uint64_t v72 = *MEMORY[0x263F0F448];
    LODWORD(v28) = v7;
    v33 = [NSNumber numberWithFloat:v28];
    v73 = v33;
    v34 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    v75[0] = v34;
    v74[1] = *MEMORY[0x263F0F420];
    v35 = NSNumber;
    [a1 scale];
    v37 = [v35 numberWithDouble:v29 * v36];
    v75[1] = v37;
    v74[2] = *MEMORY[0x263F0F418];
    v38 = NSNumber;
    [a1 scale];
    v40 = [v38 numberWithDouble:v31 * v39];
    v75[2] = v40;
    CFDictionaryRef v21 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];

    uint64_t v70 = v32;
    uint64_t v68 = *MEMORY[0x263F0F428];
    LODWORD(v41) = v7;
    CFDictionaryRef v23 = [NSNumber numberWithFloat:v41];
    v69 = v23;
    float v25 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    v71 = v25;
    v27 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    goto LABEL_5;
  }
  CFDictionaryRef v21 = (const __CFDictionary *)MEMORY[0x263EFFA78];
  v27 = (void *)MEMORY[0x263EFFA78];
LABEL_7:
  v42 = [a1 images];
  unint64_t v43 = [v42 count];
  unint64_t v44 = v43;
  if (v43 <= 1) {
    size_t v45 = 1;
  }
  else {
    size_t v45 = v43;
  }
  v46 = CGImageDestinationCreateWithData(Mutable, v4, v45, 0);
  CGImageDestinationSetProperties(v46, v21);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v63 = __63__UIImage_Conversion__avt_dataRepresentationForTypeIdentifier___block_invoke;
  v64 = &unk_26401FC08;
  v66 = v46;
  id v47 = v27;
  id v65 = v47;
  if (v44)
  {
    CFDictionaryRef v57 = v21;
    v48 = v4;
    v49 = Mutable;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v50 = v42;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(v50);
          }
          v63((uint64_t)v62, *(id *)(*((void *)&v58 + 1) + 8 * i));
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v52);
    }

    Mutable = v49;
    double v4 = v48;
    CFDictionaryRef v21 = v57;
  }
  else
  {
    v63((uint64_t)v62, a1);
  }
  CGImageDestinationFinalize(v46);
  if (v46) {
    CFRelease(v46);
  }

  return Mutable;
}

- (uint64_t)copyByReorderingImagesWithFirstImageAtTime:()Conversion
{
  double v4 = [a1 images];
  if (a2 > 0.0)
  {
    [a1 frameDelayInSeconds];
    unint64_t v6 = vcvtmd_s64_f64(a2 / v5);
    int v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);
    v8 = objc_msgSend(v4, "subarrayWithRange:", v6, objc_msgSend(v4, "count") - v6);
    uint64_t v9 = [v8 arrayByAddingObjectsFromArray:v7];

    double v4 = (void *)v9;
  }
  double v10 = (void *)MEMORY[0x263F1C6B0];
  [a1 duration];
  uint64_t v11 = objc_msgSend(v10, "animatedImageWithImages:duration:", v4);

  return v11;
}

@end