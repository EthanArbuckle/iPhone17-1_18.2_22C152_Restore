@interface PKImageCompare
+ ($1D51C095076032EFA7EEE424D0344599)compareImage:(SEL)a3 toMasterImage:(CGImage *)a4 filename:(CGImage *)a5 differenceImageOutputPath:(id)a6 diffWhite:(id)a7 stdDevThreshhold:(BOOL)a8;
+ (BOOL)saveImage:(CGImage *)a3 toPath:(id)a4;
+ (id)filterImage:(CGImage *)a3;
+ (id)stringFromSize:(CGSize)a3;
@end

@implementation PKImageCompare

+ (id)filterImage:(CGImage *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:a3];
  v4 = [v3 imageByApplyingGaussianBlurWithSigma:2.0];

  return v4;
}

+ ($1D51C095076032EFA7EEE424D0344599)compareImage:(SEL)a3 toMasterImage:(CGImage *)a4 filename:(CGImage *)a5 differenceImageOutputPath:(id)a6 diffWhite:(id)a7 stdDevThreshhold:(BOOL)a8
{
  BOOL v10 = a8;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a6;
  id v17 = a7;
  id v18 = v16;
  if (!a5)
  {
    NSLog(&cfstr_NoValidMasterI.isa);
    if (a4) {
      goto LABEL_10;
    }
LABEL_9:
    NSLog(&cfstr_NoValidTestIma.isa);
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_9;
  }
  unsigned int v33 = 0;
  double Width = (double)CGImageGetWidth(a5);
  double Height = (double)CGImageGetHeight(a5);
  double v21 = (double)CGImageGetWidth(a4);
  double v22 = (double)CGImageGetHeight(a4);
  if (Width == v21 && Height == v22)
  {
    CGImageRef v28 = createDiffImageIfImageComparisonFails(a4, a5, v10, &v39, &v38, &v36, &v34, (int *)&v33, a9);
    v29 = v28;
    if (v33)
    {
      if (v33 == 2)
      {
        NSLog(&cfstr_EncounteredErr_0.isa);
      }
      else if (v33 == 1)
      {
        NSLog(&cfstr_EncounteredErr.isa);
      }
      else
      {
        NSLog(&cfstr_EncounteredErr_1.isa, v33);
      }
    }
    else
    {
      if (!v28)
      {
        NSLog(&cfstr_ImagesWereIden.isa);
        BOOL v26 = 0;
        goto LABEL_23;
      }
      NSLog(&cfstr_MismatchExceed.isa, 0, *(void *)&v36.f64[0], v34.i64[0], *(void *)&v36.f64[1], v34.i64[1], (void)v37, (void)v35, *((void *)&v37 + 1), *((void *)&v35 + 1), v39.u32[0], v38.u32[0], v39.u32[1], v38.u32[1], v39.u32[2], v38.u32[2], v39.u32[3], v38.u32[3]);
      if (v17)
      {
        if ([a2 saveImage:v29 toPath:v17]) {
          NSLog(&cfstr_WroteDiffImage.isa, v17);
        }
        else {
          NSLog(&cfstr_ErrorWritingDi.isa, v17);
        }
      }
    }
    BOOL v26 = 1;
LABEL_23:
    int32x4_t v30 = v38;
    *(int32x4_t *)retstr->var0 = v39;
    *(int32x4_t *)retstr->var1 = v30;
    long long v31 = v37;
    *(float64x2_t *)retstr->var2 = v36;
    *(_OWORD *)&retstr->var2[2] = v31;
    long long v32 = v35;
    *(int64x2_t *)retstr->var3 = v34;
    *(_OWORD *)&retstr->var3[2] = v32;
    retstr->var4 = v29;
    *(void *)&retstr->var5 = 0;
    goto LABEL_11;
  }
  v24 = +[PKImageCompare stringFromSize:v21];
  v25 = +[PKImageCompare stringFromSize:](PKImageCompare, "stringFromSize:", Width, Height);
  NSLog(&cfstr_ImageSizeMisma.isa, 0, v24, v25);

LABEL_10:
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)retstr->var1 = 0u;
  *(_OWORD *)retstr->var2 = xmmword_1C482C1A0;
  *(_OWORD *)&retstr->var2[2] = unk_1C482C1B0;
  *(_OWORD *)retstr->var3 = xmmword_1C482C1A0;
  *(_OWORD *)&retstr->var3[2] = unk_1C482C1B0;
  BOOL v26 = 1;
LABEL_11:
  retstr->var5 = v26;

  return result;
}

+ (BOOL)saveImage:(CGImage *)a3 toPath:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  CFURLRef v5 = (const __CFURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:a4];
  v6 = [(id)*MEMORY[0x1E4F44460] identifier];
  v7 = CGImageDestinationCreateWithURL(v5, v6, 1uLL, 0);

  if (!v7) {
    return 0;
  }
  Mutable = CGImageMetadataCreateMutable();
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F2FD40];
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F2FD70];
  v11 = [NSNumber numberWithInt:1];
  CGImageMetadataSetValueMatchingImageProperty(Mutable, v9, v10, v11);

  v20[0] = *MEMORY[0x1E4F2FCA0];
  v12 = [NSNumber numberWithInt:1];
  v20[1] = v9;
  v21[0] = v12;
  uint64_t v18 = v20[0];
  v13 = [NSNumber numberWithInt:1];
  v19 = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[1] = v14;
  CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  if (Mutable)
  {
    CGImageDestinationAddImageAndMetadata(v7, a3, Mutable, v15);
    CFRelease(Mutable);
    BOOL v16 = CGImageDestinationFinalize(v7);
    CFRelease(v7);
  }
  else
  {
    NSLog(&cfstr_ErrorInvalidMu.isa);
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)stringFromSize:(CGSize)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%f x %f", *(void *)&a3.width, *(void *)&a3.height);
}

@end