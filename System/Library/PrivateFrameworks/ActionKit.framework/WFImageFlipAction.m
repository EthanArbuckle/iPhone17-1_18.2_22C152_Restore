@interface WFImageFlipAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageFlipAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFImageFlipAction *)self parameterValueForKey:@"WFImageFlipDirection" ofClass:objc_opt_class()];
  uint64_t v6 = [v5 isEqualToString:@"Horizontal"] ^ 1;
  uint64_t v7 = objc_opt_class();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E58440;
  v8[4] = self;
  v8[5] = v6;
  [v4 generateCollectionByCoercingToItemClass:v7 completionHandler:v8];
}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &__block_descriptor_40_e43_v24__0__WFContentItem_8___v_____NSError__16l;
    v9[4] = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_5;
    v8[3] = &unk_264E5E840;
    v8[4] = *(void *)(a1 + 32);
    [v6 transformItemsUsingBlock:v9 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_264E59498;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a2 getFileRepresentation:v8 forType:0];
}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __48__WFImageFlipAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, id a3, double a4, double a5, CGFloat a6, CGFloat a7)
{
  id v11 = a3;
  id v20 = a2;
  v12 = (CGContext *)[v11 CGContext];
  v13 = v12;
  if (*(void *)(a1 + 32))
  {
    CGContextTranslateCTM(v12, 0.0, a7);
    CGFloat v14 = 1.0;
    CGFloat v15 = -1.0;
  }
  else
  {
    CGContextTranslateCTM(v12, a6, 0.0);
    CGFloat v14 = -1.0;
    CGFloat v15 = 1.0;
  }
  CGContextScaleCTM(v13, v14, v15);
  double v16 = *MEMORY[0x263F00148];
  double v17 = *(double *)(MEMORY[0x263F00148] + 8);
  [v20 sizeInPoints];
  objc_msgSend(v20, "drawInContext:inRect:", v11, v16, v17, v18, v19);
}

@end