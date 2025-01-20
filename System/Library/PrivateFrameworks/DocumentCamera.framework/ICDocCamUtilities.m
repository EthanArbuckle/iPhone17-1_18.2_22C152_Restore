@interface ICDocCamUtilities
+ (BOOL)shouldPerformCustomAnimationForTransitionCoordinator:(id)a3 window:(id)a4;
+ (CGAffineTransform)transformForOrientation:(SEL)a3 newSize:(id)a4;
+ (CGSize)aspectFillSize:(CGSize)a3 targetSize:(CGSize)a4;
+ (CGSize)aspectFitSize:(CGSize)a3 targetSize:(CGSize)a4;
+ (id)buttonFromCopyingValuesFromButton:(id)a3;
+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 interpolationQuality:(int)a5;
+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 transform:(CGAffineTransform *)a5 drawTransposed:(BOOL)a6 interpolationQuality:(int)a7;
+ (void)prepareForRotationIfNecessaryWithShutterButton:(id)a3 coodinator:(id)a4;
@end

@implementation ICDocCamUtilities

+ (void)prepareForRotationIfNecessaryWithShutterButton:(id)a3 coodinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v9 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:coodinator:](v9);
  }

  if (!v8)
  {
LABEL_7:
    v10 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:coodinator:](v10);
    }
  }
LABEL_10:
  v11 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v11 userInterfaceIdiom])
  {
  }
  else
  {
    int v12 = [v8 isAnimated];

    if (v12)
    {
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x3032000000;
      v46[3] = __Block_byref_object_copy__8;
      v46[4] = __Block_byref_object_dispose__8;
      id v47 = 0;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__8;
      v44[4] = __Block_byref_object_dispose__8;
      id v45 = 0;
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x3032000000;
      v42[3] = __Block_byref_object_copy__8;
      v42[4] = __Block_byref_object_dispose__8;
      id v43 = 0;
      v13 = [v6 window];
      v14 = [v6 window];
      [v14 frame];
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;

      int v23 = [a1 shouldPerformCustomAnimationForTransitionCoordinator:v8 window:v13];
      char v24 = v23;
      if (v23)
      {
        v25 = (void *)MEMORY[0x263F1CB60];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke;
        v32[3] = &unk_2642AA7A0;
        uint64_t v37 = v16;
        uint64_t v38 = v18;
        uint64_t v39 = v20;
        uint64_t v40 = v22;
        v34 = v42;
        v35 = v44;
        v36 = v46;
        id v41 = a1;
        id v33 = v6;
        [v25 performWithoutAnimation:v32];
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_2;
      v27[3] = &unk_2642AA7C8;
      char v31 = v24;
      id v28 = v6;
      v30 = v42;
      id v26 = v13;
      id v29 = v26;
      [v8 animateAlongsideTransition:0 completion:v27];

      _Block_object_dispose(v42, 8);
      _Block_object_dispose(v44, 8);

      _Block_object_dispose(v46, 8);
    }
  }
}

uint64_t __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1CBC8]), "initWithFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = objc_alloc_init(ICDocCamNonRotatableViewController);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  double v8 = *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 72);
  double v10 = *(double *)(a1 + 80);
  double v11 = *(double *)(a1 + 88);
  int v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) view];
  objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setRootViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v13 = [*(id *)(a1 + 96) buttonFromCopyingValuesFromButton:*(void *)(a1 + 32)];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) view];
  [v16 addSubview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) makeKeyAndVisible];
  uint64_t v17 = *(void **)(a1 + 32);

  return [v17 setHidden:1];
}

void __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setHidden:0];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_3;
    v4[3] = &unk_2642A9650;
    long long v3 = *(_OWORD *)(a1 + 40);
    id v2 = (id)v3;
    long long v5 = v3;
    dc_dispatchMainAfterDelay(v4, 0.0);
  }
}

uint64_t __79__ICDocCamUtilities_prepareForRotationIfNecessaryWithShutterButton_coodinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeFromSuperview];
  id v2 = *(void **)(a1 + 32);

  return [v2 makeKeyAndVisible];
}

+ (id)buttonFromCopyingValuesFromButton:(id)a3
{
  id v3 = a3;
  v4 = [ICDocCamShutterButton alloc];
  [v3 frame];
  long long v5 = -[ICDocCamShutterButton initWithFrame:](v4, "initWithFrame:");
  [(ICDocCamShutterButton *)v5 setUserInteractionEnabled:0];
  uint64_t v6 = [v3 isPseudoDisabled];

  [(ICDocCamShutterButton *)v5 setPseudoDisabled:v6];

  return v5;
}

+ (BOOL)shouldPerformCustomAnimationForTransitionCoordinator:(id)a3 window:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F1C358];
  id v7 = a4;
  int v8 = objc_msgSend(v6, "dc_isRTL");
  double v9 = [v7 windowScene];

  uint64_t v10 = [v9 interfaceOrientation];
  if (v5) {
    [v5 targetTransform];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  double v11 = DCTSDRotationFromTransform((uint64_t)v17);
  BOOL v12 = v11 != 1.57079633;
  if (fabs(v11 + -1.57079633) < 0.00000157079632) {
    BOOL v12 = 0;
  }
  if ((v8 | v12) != 1) {
    goto LABEL_11;
  }
  BOOL v13 = v11 != -1.57079633;
  if (fabs(v11 + 1.57079633) < 0.00000157079632) {
    BOOL v13 = 0;
  }
  if (!v8 || v13)
  {
    if (!v8) {
      LOBYTE(v12) = v13;
    }
    if (v12)
    {
      BOOL v15 = 0;
      goto LABEL_13;
    }
    unint64_t v14 = v10 - 3;
  }
  else
  {
LABEL_11:
    unint64_t v14 = v10 - 1;
  }
  BOOL v15 = v14 < 2;
LABEL_13:

  return v15;
}

+ (CGSize)aspectFillSize:(CGSize)a3 targetSize:(CGSize)a4
{
  double v4 = a4.width / a3.width;
  double v5 = a4.height / a3.height;
  if (v4 <= v5) {
    double v4 = v5;
  }
  double v6 = a3.width * v4;
  double v7 = a3.height * v4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)aspectFitSize:(CGSize)a3 targetSize:(CGSize)a4
{
  double v4 = a4.width / a3.width;
  double v5 = a4.height / a3.height;
  if (v4 >= v5) {
    double v4 = v5;
  }
  double v6 = a3.width * v4;
  double v7 = a3.height * v4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 interpolationQuality:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  BOOL v10 = (([v9 imageOrientation] - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
  +[ICDocCamUtilities transformForOrientation:newSize:](ICDocCamUtilities, "transformForOrientation:newSize:", v9, width, height);
  double v11 = objc_msgSend(a1, "resizedImage:newSize:transform:drawTransposed:interpolationQuality:", v9, &v13, v10, v5, width, height);

  return v11;
}

+ (id)resizedImage:(id)a3 newSize:(CGSize)a4 transform:(CGAffineTransform *)a5 drawTransposed:(BOOL)a6 interpolationQuality:(int)a7
{
  BOOL v8 = a6;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  v33.origin.double x = 0.0;
  v33.origin.double y = 0.0;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectIntegral(v33);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double v15 = v34.size.width;
  double v16 = v34.size.height;
  id v17 = v12;
  uint64_t v18 = (CGImage *)[v17 CGImage];

  size_t BitsPerComponent = CGImageGetBitsPerComponent(v18);
  ColorSpace = CGImageGetColorSpace(v18);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(v18);
  uint64_t v22 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, BitsPerComponent, 0, ColorSpace, BitmapInfo);
  long long v23 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v31.c = v23;
  *(_OWORD *)&v31.tdouble x = *(_OWORD *)&a5->tx;
  CGContextConcatCTM(v22, &v31);
  CGContextSetInterpolationQuality(v22, (CGInterpolationQuality)a7);
  if (v8) {
    double v24 = v15;
  }
  else {
    double v24 = v16;
  }
  if (v8) {
    double v25 = v16;
  }
  else {
    double v25 = v15;
  }
  if (v8) {
    double v26 = 0.0;
  }
  else {
    double v26 = x;
  }
  if (v8) {
    double v27 = 0.0;
  }
  else {
    double v27 = y;
  }
  CGContextDrawImage(v22, *(CGRect *)(&v24 - 3), v18);
  Image = CGBitmapContextCreateImage(v22);
  id v29 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image];
  CGContextRelease(v22);
  CGImageRelease(Image);

  return v29;
}

+ (CGAffineTransform)transformForOrientation:(SEL)a3 newSize:(id)a4
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a4;
  uint64_t v9 = MEMORY[0x263F000D0];
  long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v28 = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v27;
  long long v26 = *(_OWORD *)(v9 + 32);
  *(_OWORD *)&retstr->tdouble x = v26;
  unint64_t v10 = [v8 imageOrientation];
  if (v10 <= 7)
  {
    if (((1 << v10) & 0x22) != 0)
    {
      *(_OWORD *)&v30.a = v28;
      *(_OWORD *)&v30.c = v27;
      *(_OWORD *)&v30.tdouble x = v26;
      CGAffineTransformTranslate(retstr, &v30, width, height);
      long long v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v14;
      *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
      CGFloat v13 = 3.14159265;
    }
    else if (((1 << v10) & 0x44) != 0)
    {
      long long v15 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v30.c = v15;
      *(_OWORD *)&v30.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v30, width, 0.0);
      long long v16 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v16;
      *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
      CGFloat v13 = 1.57079633;
    }
    else
    {
      if (((1 << v10) & 0x88) == 0) {
        goto LABEL_9;
      }
      long long v11 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v30.c = v11;
      *(_OWORD *)&v30.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v30, 0.0, height);
      long long v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v29.c = v12;
      *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
      CGFloat v13 = -1.57079633;
    }
    CGAffineTransformRotate(&v30, &v29, v13);
    long long v17 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v30.tx;
  }
LABEL_9:
  uint64_t v18 = [v8 imageOrientation];
  if ((unint64_t)(v18 - 6) < 2)
  {
    long long v21 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v21;
    *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
    CGFloat v20 = height;
    goto LABEL_13;
  }
  if ((unint64_t)(v18 - 4) <= 1)
  {
    long long v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v19;
    *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
    CGFloat v20 = width;
LABEL_13:
    CGAffineTransformTranslate(&v30, &v29, v20, 0.0);
    long long v22 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v22;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v30.tx;
    long long v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v29.c = v23;
    *(_OWORD *)&v29.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v30, &v29, -1.0, 1.0);
    long long v24 = *(_OWORD *)&v30.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v30.a;
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v30.tx;
  }

  return result;
}

+ (void)prepareForRotationIfNecessaryWithShutterButton:(os_log_t)log coodinator:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "coordinator";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

+ (void)prepareForRotationIfNecessaryWithShutterButton:(os_log_t)log coodinator:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "shutterButton";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end