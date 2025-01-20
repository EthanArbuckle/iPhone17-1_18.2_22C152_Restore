@interface WFImageCropAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
+ (id)imageByCroppingImage:(id)a3 toRect:(CGRect)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageCropAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

+ (id)imageByCroppingImage:(id)a3 toRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  memset(&v33, 0, sizeof(v33));
  int v9 = [v8 orientation];
  switch(v9)
  {
    case 3:
      CGAffineTransformMakeRotation(&v30, -3.14159265);
      [v8 sizeInPoints];
      double v15 = -v14;
      [v8 sizeInPoints];
      double v11 = -v16;
      v12 = &v30;
      double v13 = v15;
      goto LABEL_7;
    case 6:
      CGAffineTransformMakeRotation(&v31, -1.57079633);
      [v8 sizeInPoints];
      double v13 = -v17;
      v12 = &v31;
      double v11 = 0.0;
      goto LABEL_7;
    case 8:
      CGAffineTransformMakeRotation(&v32, 1.57079633);
      [v8 sizeInPoints];
      double v11 = -v10;
      v12 = &v32;
      double v13 = 0.0;
LABEL_7:
      CGAffineTransformTranslate(&v33, v12, v13, v11);
      goto LABEL_9;
  }
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v33.c = v18;
  *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
LABEL_9:
  [v8 scale];
  CGFloat v20 = v19;
  [v8 scale];
  CGAffineTransform v28 = v33;
  CGAffineTransformScale(&v29, &v28, v20, v21);
  CGAffineTransform v33 = v29;
  v22 = (CGImage *)[v8 CGImage];
  CGAffineTransform v29 = v33;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectApplyAffineTransform(v35, &v29);
  v23 = CGImageCreateWithImageInRect(v22, v36);
  v24 = (void *)MEMORY[0x263F85308];
  [v8 scale];
  v26 = objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v8, "orientation"), v25);
  CGImageRelease(v23);

  return v26;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    id v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCropPosition" ofClass:objc_opt_class()];
    int v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCropWidth" ofClass:objc_opt_class()];
    [v9 floatValue];
    double v11 = fmax(v10, 0.0);

    v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCropHeight" ofClass:objc_opt_class()];
    [v12 floatValue];
    double v14 = fmax(v13, 0.0);

    double v15 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCropX" ofClass:objc_opt_class()];
    [v15 floatValue];
    double v17 = fmax(v16, 0.0);

    long long v18 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCropY" ofClass:objc_opt_class()];
    [v18 floatValue];
    double v20 = fmax(v19, 0.0);

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_2;
    v24[3] = &unk_264E58278;
    double v27 = v11;
    double v28 = v14;
    double v29 = v17;
    double v30 = v20;
    uint64_t v21 = *(void *)(a1 + 32);
    id v25 = v8;
    uint64_t v26 = v21;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_6;
    v23[3] = &unk_264E5E840;
    v23[4] = v21;
    id v22 = v8;
    [v6 transformItemsUsingBlock:v24 completionHandler:v23];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_3;
  v12[3] = &unk_264E58250;
  id v16 = v6;
  id v7 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v17 = *(_OWORD *)(a1 + 48);
  long long v18 = v8;
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v5;
  id v10 = v5;
  id v11 = v6;
  [v10 getFileRepresentation:v12 forType:0];
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    if (![a1[4] isEqualToString:@"Center"]
      && ![a1[4] isEqualToString:@"Top Right"]
      && ![a1[4] isEqualToString:@"Bottom Left"]
      && ![a1[4] isEqualToString:@"Bottom Right"])
    {
      [a1[4] isEqualToString:@"Custom"];
    }
    id v5 = a1[7];
    id v4 = a1[6];
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_4(double *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a3;
  id v14 = a2;
  objc_msgSend((id)objc_opt_class(), "imageByCroppingImage:toRect:", v14, a1[5], a1[6], a1[7], a1[8]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "drawInContext:inRect:", v13, a4, a5, a6, a7);
}

void __48__WFImageCropAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F337C8];
    long long v8 = *(void **)(a1 + 32);
    id v9 = a3;
    id v10 = [v8 attributionSet];
    id v11 = [v7 itemWithFile:v13 attributionSet:v10];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v9);
  }
  else
  {
    v12 = *(void (**)(uint64_t, void, id))(v6 + 16);
    id v10 = a3;
    v12(v6, 0, v10);
  }
}

@end