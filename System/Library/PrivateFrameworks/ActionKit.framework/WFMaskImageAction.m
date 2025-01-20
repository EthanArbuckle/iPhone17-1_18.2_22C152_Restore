@interface WFMaskImageAction
- (void)maskImageItems:(id)a3 usingType:(id)a4 cornerRadius:(double)a5 customMaskImage:(id)a6 customMaskImageContentAttributionSet:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMaskImageAction

- (void)maskImageItems:(id)a3 usingType:(id)a4 cornerRadius:(double)a5 customMaskImage:(id)a6 customMaskImageContentAttributionSet:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke;
  v19[3] = &unk_264E5CC90;
  double v23 = a5;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_5;
  v18[3] = &unk_264E5E840;
  v18[4] = self;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  [a3 transformItemsUsingBlock:v19 completionHandler:v18];
}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_2;
  v9[3] = &unk_264E5CC68;
  id v14 = v6;
  id v10 = *(id *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  [v7 getFileRepresentation:v9 forType:0];
}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    [a1[4] isEqualToString:@"Icon"];
    v4 = [v3 wfType];
    if (([v4 conformsToUTType:*MEMORY[0x263F1DB40]] & 1) != 0
      || [v4 conformsToUTType:*MEMORY[0x263F1DC60]])
    {
      id v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
    }
    else
    {
      id v5 = 0;
    }
    id v9 = a1[4];
    id v10 = a1[5];
    id v6 = a1[6];
    id v7 = a1[7];
    id v8 = a1[8];
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*((void (**)(void))a1[8] + 2))();
  }
}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_3(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v30 = a2;
  id v13 = a3;
  id v14 = (CGContext *)[v13 CGContext];
  if ([*(id *)(a1 + 32) isEqualToString:@"Rounded Rectangle"])
  {
    Mutable = WFCreateRoundedRectPath(a4, a5, a6, a7, *(double *)(a1 + 48));
LABEL_5:
    CGContextAddPath(v14, Mutable);
    CGContextClip(v14);
    CGPathRelease(Mutable);
LABEL_6:
    objc_msgSend(v30, "drawInContext:inRect:", v13, a4, a5, a6, a7);
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"Ellipse"])
  {
    Mutable = CGPathCreateMutable();
    v32.origin.x = a4;
    v32.origin.y = a5;
    v32.size.width = a6;
    v32.size.height = a7;
    CGPathAddEllipseInRect(Mutable, 0, v32);
    goto LABEL_5;
  }
  if (![*(id *)(a1 + 32) isEqualToString:@"Icon"])
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"Custom Image"])
    {
      [*(id *)(a1 + 40) sizeInPixels];
      double v22 = v21;
      double v24 = v23;
      DeviceGray = CGColorSpaceCreateDeviceGray();
      v26 = CGBitmapContextCreate(0, (unint64_t)v22, (unint64_t)v24, 8uLL, 0, DeviceGray, 0);
      v27 = *(void **)(a1 + 40);
      v28 = (void *)[objc_alloc(MEMORY[0x263F85188]) initWithCGContext:v26 scale:1.0];
      objc_msgSend(v27, "drawInContext:inRect:", v28, 0.0, 0.0, v22, v24);

      Image = CGBitmapContextCreateImage(v26);
      CGContextRelease(v26);
      CGColorSpaceRelease(DeviceGray);
      v33.origin.x = a4;
      v33.origin.y = a5;
      v33.size.width = a6;
      v33.size.height = a7;
      CGContextClipToMask(v14, v33, Image);
    }
    goto LABEL_6;
  }
  [v30 sizeInPixels];
  double v17 = (v16 - *(double *)(a1 + 56)) * 0.5;
  [v30 sizeInPixels];
  v19 = +[WFImageCropAction imageByCroppingImage:toRect:](WFImageCropAction, "imageByCroppingImage:toRect:", v30, v17, (v18 - *(double *)(a1 + 64)) * 0.5, a6, a7);

  id v20 = WFCreateRoundedRectPath(a4, a5, a6, a7, round((a6 * 0.224 + 0.02351) * 10.0) / 10.0);
  CGContextAddPath(v14, v20);
  CGContextClip(v14);
  CGPathRelease(v20);
  id v30 = v19;
  objc_msgSend(v19, "drawInContext:inRect:", v13, a4, a5, a6, a7);
LABEL_7:
}

void __112__WFMaskImageAction_maskImageItems_usingType_cornerRadius_customMaskImage_customMaskImageContentAttributionSet___block_invoke_4(void *a1, void *a2, void *a3)
{
  v17[2] = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    id v6 = (void *)MEMORY[0x263F337A0];
    id v7 = (void *)a1[5];
    id v8 = a3;
    id v9 = a2;
    id v10 = [v7 attributionSet];
    uint64_t v11 = a1[4];
    v17[0] = v10;
    v17[1] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    id v13 = [v6 attributionSetByMergingAttributionSets:v12];
  }
  else
  {
    id v14 = (void *)a1[5];
    id v15 = a3;
    id v16 = a2;
    id v13 = [v14 attributionSet];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    id v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMaskType" ofClass:objc_opt_class()];
    id v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMaskCornerRadius" ofClass:objc_opt_class()];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = fmax(v11, 0.0);
    id v13 = [*(id *)(a1 + 32) parameterValueForKey:@"WFCustomMaskImage" ofClass:objc_opt_class()];
    if ([v8 isEqualToString:@"Custom Image"])
    {
      if ([v13 numberOfItems])
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke_2;
        v28[3] = &unk_264E5CC18;
        v28[4] = *(void *)(a1 + 32);
        id v29 = v6;
        id v30 = v8;
        double v32 = v12;
        id v31 = v13;
        [v31 getObjectRepresentation:v28 forClass:objc_opt_class()];

        id v14 = v29;
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) parameterStateForKey:@"WFCustomMaskImage"];
        id v16 = [v15 variable];

        v27 = v15;
        if (v16)
        {
          double v17 = NSString;
          double v18 = WFLocalizedString(@"The variable “%@” did not include an image to use for masking.");
          v19 = [v15 variable];
          id v20 = [v19 nameIncludingPropertyName];
          double v21 = objc_msgSend(v17, "stringWithFormat:", v18, v20);
        }
        else
        {
          double v21 = WFLocalizedString(@"Make sure to select a variable for the “Image Mask” option in the Mask Image action.");
        }
        double v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F870B8];
        v33[0] = *MEMORY[0x263F08338];
        double v24 = WFLocalizedString(@"No Mask Provided");
        v33[1] = *MEMORY[0x263F08320];
        v34[0] = v24;
        v34[1] = v21;
        v25 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
        v26 = [v22 errorWithDomain:v23 code:5 userInfo:v25];

        [*(id *)(a1 + 32) finishRunningWithError:v26];
        id v14 = v27;
      }
    }
    else
    {
      [*(id *)(a1 + 32) maskImageItems:v6 usingType:v8 cornerRadius:0 customMaskImage:0 customMaskImageContentAttributionSet:v12];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __48__WFMaskImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v12 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    double v10 = *(double *)(a1 + 64);
    double v11 = [*(id *)(a1 + 56) attributionSet];
    [v7 maskImageItems:v8 usingType:v9 cornerRadius:v12 customMaskImage:v11 customMaskImageContentAttributionSet:v10];
  }
  else
  {
    [v7 finishRunningWithError:a4];
  }
}

@end