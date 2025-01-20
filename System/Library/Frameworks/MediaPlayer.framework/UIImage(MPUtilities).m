@interface UIImage(MPUtilities)
- (id)imageWithEtchedBorderOfColor:()MPUtilities radius:;
- (id)imageWithRoundedCornersOfRadius:()MPUtilities;
- (id)imageWithShadow:()MPUtilities;
- (uint64_t)initWithContentsOfExactFilePath:()MPUtilities;
@end

@implementation UIImage(MPUtilities)

- (uint64_t)initWithContentsOfExactFilePath:()MPUtilities
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    if (initWithContentsOfExactFilePath__onceToken != -1) {
      dispatch_once(&initWithContentsOfExactFilePath__onceToken, &__block_literal_global_368);
    }
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:1 error:0];
    v8 = v7;
    if (v7)
    {
      if (initWithContentsOfExactFilePath__deviceSupportsASTC)
      {
        id v9 = v7;
        v10 = (unsigned __int16 *)[v9 bytes];
        if ((unint64_t)[v9 length] < 4
          || (*v10 == 55551 ? (BOOL v11 = *((unsigned __int8 *)v10 + 2) == 255) : (BOOL v11 = 0), !v11))
        {
          uint64_t v12 = *MEMORY[0x1E4F2FF48];
          v24[0] = *MEMORY[0x1E4F2FF08];
          v24[1] = v12;
          v25[0] = MEMORY[0x1E4F1CC28];
          v25[1] = MEMORY[0x1E4F1CC38];
          CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
          v14 = CGImageSourceCreateWithData((CFDataRef)v9, v13);
          if (v14)
          {
            v15 = v14;
            if (CGImageSourceGetCount(v14)) {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, v13);
            }
            else {
              ImageAtIndex = 0;
            }
            CFRelease(v15);
          }
          else
          {
            ImageAtIndex = 0;
          }
          v17 = (void *)[a1 initWithCGImage:ImageAtIndex];
          CGImageRelease(ImageAtIndex);

          goto LABEL_23;
        }
        double v18 = *MEMORY[0x1E4F1DB30];
        double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v20 = 1.0;
        v21 = a1;
        id v22 = v9;
      }
      else
      {
        double v18 = *MEMORY[0x1E4F1DB30];
        double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v20 = 1.0;
        v21 = a1;
        id v22 = v8;
      }
      v17 = objc_msgSend(v21, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v22, 0, 0, v18, v19, v20);
    }
    else
    {

      v17 = 0;
    }
LABEL_23:
    a1 = v17;

    uint64_t v6 = (uint64_t)a1;
    goto LABEL_24;
  }
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:1 error:0];
  uint64_t v6 = [MEMORY[0x1E4FB1818] imageWithData:v5];

LABEL_24:
  return v6;
}

- (id)imageWithRoundedCornersOfRadius:()MPUtilities
{
  id v4 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [a1 size];
  v5 = objc_msgSend(v4, "initWithSize:");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__UIImage_MPUtilities__imageWithRoundedCornersOfRadius___block_invoke;
  v8[3] = &unk_1E57EDB00;
  v8[4] = a1;
  *(double *)&v8[5] = a2;
  uint64_t v6 = [v5 imageWithActions:v8];

  return v6;
}

- (id)imageWithShadow:()MPUtilities
{
  id v4 = a3;
  id v5 = a1;
  [v4 shadowOffset];
  uint64_t v7 = v6;
  double v9 = v8;
  double v10 = -v8;
  [v4 shadowBlurRadius];
  double v12 = v11;
  [v5 scale];
  double v14 = v13;
  [v5 size];
  double v17 = v16 + v12 * 2.0;
  double v18 = fabs(v9);
  if (v9 <= 0.0) {
    double v18 = 0.0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __40__UIImage_MPUtilities__imageWithShadow___block_invoke;
  v24[3] = &unk_1E57EDAD8;
  double v27 = v12;
  double v28 = v14;
  uint64_t v29 = v7;
  double v30 = v10;
  double v19 = v15 + v18 + v12 * 2.0;
  id v25 = v4;
  id v26 = v5;
  id v20 = v5;
  id v21 = v4;
  id v22 = MPCreateImageWithDrawing(v24, v17, v19, v14);

  return v22;
}

- (id)imageWithEtchedBorderOfColor:()MPUtilities radius:
{
  id v6 = a4;
  [a1 size];
  double v9 = v8 + a2 * 2.0;
  BOOL v10 = a2 <= 0.0;
  if (a2 <= 0.0) {
    double v11 = v7;
  }
  else {
    double v11 = v7 + a2 * 2.0;
  }
  if (v10) {
    double v12 = v8;
  }
  else {
    double v12 = v9;
  }
  [a1 scale];
  double v14 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__UIImage_MPUtilities__imageWithEtchedBorderOfColor_radius___block_invoke;
  v18[3] = &unk_1E57EDAB0;
  v18[4] = a1;
  id v19 = v6;
  id v15 = v6;
  double v16 = MPCreateImageWithDrawing(v18, v11, v12, v14);

  return v16;
}

@end