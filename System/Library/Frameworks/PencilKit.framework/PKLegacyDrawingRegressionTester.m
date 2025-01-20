@interface PKLegacyDrawingRegressionTester
+ (CGImage)createFilteredImageFromImage:(id)a3 context:(id)a4 filterRadius:(double)a5;
+ (double)compareImage:(CGImage *)a3 with:(CGImage *)a4 drawing:(id)a5;
+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4;
+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4 debugImagesDirectory:(id)a5;
+ (double)maxStdDevErrorFromResult:(id *)a3;
+ (id)regressionTestDrawingPathForFile:(id)a3 forClass:(Class)a4;
+ (id)regressionTestImagePathForFile:(id)a3 forClass:(Class)a4;
@end

@implementation PKLegacyDrawingRegressionTester

+ (double)maxStdDevErrorFromResult:(id *)a3
{
  uint64_t v3 = 0;
  double result = 0.0;
  do
  {
    if (result < a3->var3[v3]) {
      double result = a3->var3[v3];
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

+ (CGImage)createFilteredImageFromImage:(id)a3 context:(id)a4 filterRadius:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 CGImage];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:v9];
  v11 = [v10 imageByApplyingGaussianBlurWithSigma:a5];
  [v11 extent];
  v12 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v11);

  return v12;
}

+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4
{
  [a1 compareLegacyDrawingImage:a3 toConvertedDrawing:a4 debugImagesDirectory:0];
  return result;
}

+ (double)compareLegacyDrawingImage:(id)a3 toConvertedDrawing:(id)a4 debugImagesDirectory:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v52 = a4;
  id v48 = a5;
  [v7 size];
  double v9 = v8 * 0.0009765625;
  double v10 = floor(v8 * 0.0009765625);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  if (v10 < v9 + -0.001)
  {
    v11 = (void *)MEMORY[0x1C8784520]();
    memset(&v58, 0, sizeof(v58));
    CGFloat v12 = v10 / v9;
    CGAffineTransformMakeScale(&v58, v12, v12);
    v13 = (void *)MEMORY[0x1E4F1E050];
    id v14 = v7;
    v15 = objc_msgSend(v13, "imageWithCGImage:", objc_msgSend(v14, "CGImage"));
    CGAffineTransform v53 = v58;
    v16 = [v15 imageByApplyingTransform:&v53];

    [v14 size];
    double v18 = v17;
    [v14 size];
    v20 = (CGImage *)objc_msgSend(v51, "createCGImage:fromRect:", v16, 0.0, 0.0, v12 * v18, v12 * v19);
    id v7 = (id)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v20];

    CGImageRelease(v20);
    double v9 = v10;
  }
  memset(&v76, 0, sizeof(v76));
  [v7 size];
  if (v52) {
    objc_msgSend(v52, "_transformForImageWithSize:");
  }
  else {
    memset(&v76, 0, sizeof(v76));
  }
  CGAffineTransform v58 = v76;
  if (!CGAffineTransformIsIdentity(&v58) || v10 < v9)
  {
    v21 = (void *)MEMORY[0x1C8784520]();
    v22 = (void *)MEMORY[0x1E4F1E050];
    id v23 = v7;
    v24 = objc_msgSend(v22, "imageWithCGImage:", objc_msgSend(v23, "CGImage"));
    CGAffineTransform v58 = v76;
    v25 = [v24 imageByApplyingTransform:&v58];

    [v52 _orientedDrawingSize];
    v28 = (CGImage *)objc_msgSend(v51, "createCGImage:fromRect:", v25, 0.0, 0.0, floor(v9 * v26), floor(v9 * v27));
    id v7 = (id)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v28];

    CGImageRelease(v28);
  }
  [v7 size];
  double v30 = v29;
  [v52 _orientedDrawingSize];
  v50 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", v31, v32, v30 / v31);
  dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__38;
  v74 = __Block_byref_object_dispose__38;
  id v75 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __101__PKLegacyDrawingRegressionTester_compareLegacyDrawingImage_toConvertedDrawing_debugImagesDirectory___block_invoke;
  v67[3] = &unk_1E64C72E0;
  v69 = &v70;
  v34 = v33;
  v68 = v34;
  [(PKImageRenderer *)v50 renderDrawing:v52 completion:v67];
  dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v35 = [v52 strokes];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v77 count:16];
  double v37 = 4.0;
  if (v36)
  {
    uint64_t v38 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v64 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [*(id *)(*((void *)&v63 + 1) + 8 * i) ink];
        v41 = [v40 identifier];
        char v42 = [v41 isEqualToString:@"com.apple.ink.pencil"];

        if (v42)
        {
          double v37 = 5.0;
          goto LABEL_19;
        }
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v77 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  v43 = (CGImage *)[a1 createFilteredImageFromImage:v7 context:v51 filterRadius:v37];
  v44 = (CGImage *)[a1 createFilteredImageFromImage:v71[5] context:v51 filterRadius:v37];
  long long v61 = 0u;
  *(_OWORD *)image = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  memset(&v58, 0, sizeof(v58));
  +[PKImageCompare compareImage:v44 toMasterImage:v43 filename:0 differenceImageOutputPath:0 diffWhite:1 stdDevThreshhold:0.0];
  if (image[0]) {
    CGImageRelease(image[0]);
  }
  CGImageRelease(v43);
  CGImageRelease(v44);
  long long v55 = v60;
  long long v56 = v61;
  long long v57 = *(_OWORD *)image;
  CGAffineTransform v53 = v58;
  long long v54 = v59;
  [a1 maxStdDevErrorFromResult:&v53];
  double v46 = v45;

  _Block_object_dispose(&v70, 8);
  return v46;
}

void __101__PKLegacyDrawingRegressionTester_compareLegacyDrawingImage_toConvertedDrawing_debugImagesDirectory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (double)compareImage:(CGImage *)a3 with:(CGImage *)a4 drawing:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = v8;
  if (v8)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v10 = [v8 strokes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
    double v12 = 4.0;
    if (v11)
    {
      uint64_t v13 = v11;
      double v27 = a3;
      v28 = a4;
      uint64_t v14 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "ink", v27, v28);
          double v17 = [v16 identifier];
          char v18 = [v17 isEqualToString:@"com.apple.ink.pencil"];

          if (v18)
          {
            double v12 = 5.0;
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_12:
      a3 = v27;
      a4 = v28;
    }
  }
  else
  {
    double v12 = 4.0;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  v20 = [MEMORY[0x1E4FB1818] imageWithCGImage:a3];
  v21 = (CGImage *)[a1 createFilteredImageFromImage:v20 context:v19 filterRadius:v12];

  v22 = [MEMORY[0x1E4FB1818] imageWithCGImage:a4];
  id v23 = (CGImage *)[a1 createFilteredImageFromImage:v22 context:v19 filterRadius:v12];

  long long v35 = 0u;
  *(_OWORD *)image = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  +[PKImageCompare compareImage:v23 toMasterImage:v21 filename:0 differenceImageOutputPath:0 diffWhite:1 stdDevThreshhold:0.0];
  CGImageRelease(v21);
  CGImageRelease(v23);
  v29[4] = v34;
  v29[5] = v35;
  v29[6] = *(_OWORD *)image;
  v29[0] = v30;
  v29[1] = v31;
  v29[2] = v32;
  v29[3] = v33;
  [a1 maxStdDevErrorFromResult:v29];
  double v25 = v24;

  return v25;
}

+ (id)regressionTestDrawingPathForFile:(id)a3 forClass:(Class)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:a4];
  id v7 = [v6 resourcePath];
  id v8 = [v7 stringByAppendingPathComponent:v5];
  double v9 = [v8 stringByAppendingPathExtension:@"data"];

  double v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v11 = [v10 fileExistsAtPath:v9];

  if (v11)
  {
    id v12 = v9;
  }
  else
  {
    uint64_t v13 = [v7 stringByAppendingPathComponent:v5];
    id v12 = [v13 stringByAppendingPathExtension:@"drawing"];
  }

  return v12;
}

+ (id)regressionTestImagePathForFile:(id)a3 forClass:(Class)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:a4];
  id v7 = [v6 resourcePath];
  id v8 = [v7 stringByAppendingPathComponent:@"RegressionTestImages"];
  uint64_t v9 = [v8 stringByAppendingPathComponent:v5];
  double v10 = [(id)v9 stringByAppendingPathExtension:@"png"];

  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v9) = [v11 fileExistsAtPath:v10];

  if ((v9 & 1) == 0)
  {
    id v12 = [v7 stringByAppendingPathComponent:v5];
    uint64_t v13 = [v12 stringByAppendingPathExtension:@"png"];

    double v10 = (void *)v13;
  }

  return v10;
}

@end