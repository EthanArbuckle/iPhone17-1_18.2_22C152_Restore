@interface UIImage(HealthRecordsUI)
- (id)hr_imageWithWhiteBackground:()HealthRecordsUI;
@end

@implementation UIImage(HealthRecordsUI)

- (id)hr_imageWithWhiteBackground:()HealthRecordsUI
{
  v2 = (void *)MEMORY[0x1C8759730]();
  id v3 = a1;
  uint64_t v4 = [v3 CGImage];
  memset(&srcTop, 0, sizeof(srcTop));
  [v3 size];
  double v6 = v5;
  [v3 scale];
  double v8 = v7;
  [v3 size];
  double v10 = v9;
  [v3 scale];
  double v12 = v11;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v32 = 0x2000000008;
  DWORD2(v33) = 4;
  id v13 = [MEMORY[0x1E4FB1618] whiteColor];
  Components = CGColorGetComponents((CGColorRef)[v13 CGColor]);

  if (MEMORY[0x1C875A2B0](&srcTop, &v32, Components, v4, 0))
  {
    free(srcTop.data);
    v15 = 0;
    goto LABEL_8;
  }
  vImagePixelCount v16 = (unint64_t)(v10 * v12);
  vImagePixelCount v17 = (unint64_t)(v6 * v8);
  v18 = malloc_type_calloc(4 * v17 * v16, 1uLL, 0x100004077774924uLL);
  dest.data = v18;
  dest.height = v16;
  dest.width = v17;
  dest.rowBytes = 4 * v17;
  v19 = malloc_type_calloc(4 * v17 * v16, 1uLL, 0x100004077774924uLL);
  v29.data = v19;
  v29.height = v16;
  v29.width = v17;
  v29.rowBytes = 4 * v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__UIImage_HealthRecordsUI__hr_imageWithWhiteBackground___block_invoke;
  aBlock[3] = &__block_descriptor_80_e5_v8__0l;
  vImage_Buffer v26 = srcTop;
  v27 = v18;
  v28 = v19;
  v20 = (void (**)(void))_Block_copy(aBlock);
  *(_DWORD *)color = -1;
  vImage_Error v31 = vImageBufferFill_ARGB8888(&dest, color, 0);
  if (v31 || (vImage_Error v31 = vImageAlphaBlend_ARGB8888(&srcTop, &dest, &v29, 0)) != 0)
  {
    v20[2](v20);
  }
  else
  {
    free(srcTop.data);
    free(v18);
    v22 = (CGImage *)MEMORY[0x1C875A2C0](&v29, &v32, 0, 0, 0, &v31);
    v23 = v22;
    if (!v31)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v22];
      CGImageRelease(v23);
      free(v19);
      goto LABEL_7;
    }
    CGImageRelease(v22);
    free(v19);
  }
  v15 = 0;
LABEL_7:

LABEL_8:
  return v15;
}

@end