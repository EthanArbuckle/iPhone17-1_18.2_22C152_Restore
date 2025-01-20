@interface WFImageRotateAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)isProgressIndeterminate;
- (void)rotateImage:(id)a3 byDegrees:(double)a4 completion:(id)a5;
- (void)rotateMovie:(id)a3 byDegrees:(double)a4 completion:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageRotateAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)rotateMovie:(id)a3 byDegrees:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__WFImageRotateAction_rotateMovie_byDegrees_completion___block_invoke;
  v13[3] = &unk_264E594C0;
  id v9 = v8;
  id v15 = v9;
  double v16 = a4;
  id v10 = v7;
  id v14 = v10;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v11 = (void *)getAVMutableMovieClass_softClass;
  uint64_t v21 = getAVMutableMovieClass_softClass;
  if (!getAVMutableMovieClass_softClass)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __getAVMutableMovieClass_block_invoke;
    v17[3] = &unk_264E5EC88;
    v17[4] = &v18;
    __getAVMutableMovieClass_block_invoke((uint64_t)v17);
    v11 = (void *)v19[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v18, 8);
  [v10 getObjectRepresentation:v13 forClass:objc_opt_class()];
}

void __56__WFImageRotateAction_rotateMovie_byDegrees_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:

    return;
  }
  if ([v7 hasProtectedContent])
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = 0;
LABEL_7:
    id v14 = WFImageRotateError(v11);
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v14);
LABEL_18:

    goto LABEL_19;
  }
  id v12 = [v7 availableVideoDynamicRanges];
  int v13 = [v12 containsObject:&unk_26F075648];

  if (v13)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  t1.a = 0.0;
  *(void *)&t1.b = &t1;
  *(void *)&t1.c = 0x2020000000;
  id v15 = (void *)getAVMediaTypeVideoSymbolLoc_ptr;
  *(void *)&t1.d = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    *(void *)&t2.a = MEMORY[0x263EF8330];
    *(void *)&t2.b = 3221225472;
    *(void *)&t2.c = __getAVMediaTypeVideoSymbolLoc_block_invoke;
    *(void *)&t2.d = &unk_264E5EC88;
    *(void *)&t2.tCGFloat x = &t1;
    double v16 = AVFoundationLibrary_24179();
    v17 = dlsym(v16, "AVMediaTypeVideo");
    *(void *)(*(void *)(*(void *)&t2.tx + 8) + 24) = v17;
    getAVMediaTypeVideoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&t2.tx + 8) + 24);
    id v15 = *(void **)(*(void *)&t1.b + 24);
  }
  _Block_object_dispose(&t1, 8);
  if (v15)
  {
    uint64_t v18 = [v7 tracksWithMediaType:*v15];
    id v14 = [v18 firstObject];

    if (v14) {
      [v14 preferredTransform];
    }
    else {
      memset(&v37[1], 0, sizeof(CGAffineTransform));
    }
    double v19 = *(double *)(a1 + 48);
    [v14 naturalSize];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGAffineTransform v38 = v37[1];
    CGAffineTransform t2 = v37[1];
    CGFloat y = 0.0;
    if (CGAffineTransformIsIdentity(&t2))
    {
      CGFloat height = v23;
      CGFloat width = v21;
      CGFloat x = 0.0;
    }
    else
    {
      CGAffineTransform t2 = v37[1];
      v44.origin.CGFloat x = 0.0;
      v44.origin.CGFloat y = 0.0;
      v44.size.CGFloat width = v21;
      v44.size.CGFloat height = v23;
      CGRect v45 = CGRectApplyAffineTransform(v44, &t2);
      CGFloat x = v45.origin.x;
      CGFloat y = v45.origin.y;
      CGFloat width = v45.size.width;
      CGFloat height = v45.size.height;
    }
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v46);
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v47);
    CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
    CGAffineTransform t1 = v38;
    CGAffineTransformConcat(&v38, &t1, &t2);
    CGAffineTransformMakeRotation(&v41, v19 / 180.0 * 3.14159265);
    CGAffineTransform v40 = v38;
    CGAffineTransformConcat(&t1, &v40, &v41);
    CGAffineTransform v38 = t1;
    v48.origin.CGFloat x = 0.0;
    v48.origin.CGFloat y = 0.0;
    v48.size.CGFloat width = v21;
    v48.size.CGFloat height = v23;
    CGRect v49 = CGRectApplyAffineTransform(v48, &t1);
    CGAffineTransformMakeTranslation(&v40, v49.size.width * 0.5, v49.size.height * 0.5);
    CGAffineTransform v39 = v38;
    CGAffineTransformConcat(&t1, &v39, &v40);
    CGAffineTransform v38 = t1;
    v37[0] = t1;
    [v14 setPreferredTransform:v37];
    v30 = (void *)MEMORY[0x263F336D8];
    v31 = [*(id *)(a1 + 32) name];
    v32 = [*(id *)(a1 + 32) attributionSet];
    v33 = [v30 itemWithObject:v7 named:v31 attributionSet:v32];

    v34 = [*(id *)(a1 + 32) preferredFileType];
    [v33 getFileRepresentation:*(void *)(a1 + 40) forType:v34];

    goto LABEL_18;
  }
  v35 = [MEMORY[0x263F08690] currentHandler];
  v36 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
  objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"WFImageRotateAction.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)rotateImage:(id)a3 byDegrees:(double)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a3)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke;
    v9[3] = &unk_264E59498;
    double v11 = a4;
    id v10 = v7;
    [a3 getFileRepresentation:v9 forType:0];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = WFMetadataRotateImage();
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    WFImageSizeFromFile();
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v9 = *MEMORY[0x263F00148];
    CGFloat v10 = *(double *)(MEMORY[0x263F00148] + 8);
    CGAffineTransformMakeRotation(&v11, *(double *)(a1 + 40) / 180.0 * 3.14159265);
    v12.origin.CGFloat x = v9;
    v12.origin.CGFloat y = v10;
    v12.size.CGFloat width = v6;
    v12.size.CGFloat height = v8;
    CGRectApplyAffineTransform(v12, &v11);
    WFAsyncTransformedImageFromImage();
  }
}

void __56__WFImageRotateAction_rotateImage_byDegrees_completion___block_invoke_2(uint64_t a1, void *a2, id a3, double a4, double a5, double a6, double a7)
{
  id v11 = a3;
  id v20 = a2;
  CGRect v12 = (CGContext *)[v11 CGContext];
  CGContextTranslateCTM(v12, a6 * 0.5, a7 * 0.5);
  CGContextRotateCTM(v12, *(CGFloat *)(a1 + 32));
  [v20 sizeInPoints];
  double v14 = v13 * -0.5;
  [v20 sizeInPoints];
  double v16 = v15 * -0.5;
  [v20 sizeInPoints];
  double v18 = v17;
  [v20 sizeInPoints];
  objc_msgSend(v20, "drawInContext:inRect:", v11, v14, v16, v18, v19);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    CGFloat v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageRotateAmount" ofClass:objc_opt_class()];
    [v8 floatValue];
    double v10 = v9;

    uint64_t v11 = [v6 numberOfItems];
    CGRect v12 = [*(id *)(a1 + 32) progress];
    [v12 setTotalUnitCount:v11];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_264E59450;
    uint64_t v15 = *(void *)(a1 + 32);
    double v16 = v10;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_264E5E840;
    void v13[4] = v15;
    [v6 transformItemsUsingBlock:v14 completionHandler:v13];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v13;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
    id v11 = v10;

    if (v8)
    {
      [*(id *)(a1 + 32) rotateImage:v8 byDegrees:v6 completion:*(double *)(a1 + 40)];
      goto LABEL_12;
    }
  }
  else
  {
    id v11 = 0;
  }
  [*(id *)(a1 + 32) rotateMovie:v11 byDegrees:v6 completion:*(double *)(a1 + 40)];
  id v9 = 0;
LABEL_12:
  CGRect v12 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
}

void __50__WFImageRotateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end