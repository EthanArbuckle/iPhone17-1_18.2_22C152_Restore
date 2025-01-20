@interface WFImageCombineAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageCombineAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFImageCombineAction *)self parameterValueForKey:@"WFImageCombineMode" ofClass:objc_opt_class()];
  char v6 = [v5 isEqualToString:@"Horizontally"];

  v7 = [(WFImageCombineAction *)self parameterValueForKey:@"WFImageCombineMode" ofClass:objc_opt_class()];
  char v8 = [v7 isEqualToString:@"In a Grid"];

  v9 = [(WFImageCombineAction *)self parameterValueForKey:@"WFImageCombineMode" ofClass:objc_opt_class()];
  char v10 = [v9 isEqualToString:@"Vertically"];

  v11 = [(WFImageCombineAction *)self parameterValueForKey:@"WFImageCombineSpacing" ofClass:objc_opt_class()];
  [v11 doubleValue];
  uint64_t v13 = v12;

  v14 = [v4 collectionByFilteringItemsWithBlock:&__block_literal_global_26445 excludedItems:0];
  unint64_t v15 = [v14 numberOfItems];

  v16 = [v4 collectionByFilteringItemsWithBlock:&__block_literal_global_184 excludedItems:0];
  unint64_t v17 = [v16 numberOfItems];

  v18 = (void *)MEMORY[0x263F1DB40];
  if (v15 < v17) {
    v18 = (void *)MEMORY[0x263F1DC08];
  }
  v19 = [MEMORY[0x263F852B8] typeWithUTType:*v18];
  char v20 = v8 | v6;
  uint64_t v21 = objc_opt_class();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_3;
  v23[3] = &unk_264E59818;
  char v26 = v8;
  char v27 = v20;
  uint64_t v25 = v13;
  char v28 = v10;
  v23[4] = self;
  id v24 = v19;
  id v22 = v19;
  [v4 generateCollectionByCoercingToItemClass:v21 completionHandler:v23];
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  v90[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v65 = a3;
  id v66 = a4;
  if ([v7 numberOfItems])
  {
    uint64_t v8 = [v7 numberOfItems];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v9 = [v7 items];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v84 objects:v88 count:16];
    double v12 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v13 = v11;
    double v14 = *MEMORY[0x263F001B0];
    double v15 = v11;
    double v16 = *MEMORY[0x263F001B0];
    if (v10)
    {
      uint64_t v17 = *(void *)v85;
      double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
      double v14 = *MEMORY[0x263F001B0];
      double v15 = v13;
      double v16 = *MEMORY[0x263F001B0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v85 != v17) {
            objc_enumerationMutation(v9);
          }
          v19 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          if (*(unsigned char *)(a1 + 56))
          {
            BOOL v20 = v15 == v11 && v16 == v12;
            [*(id *)(*((void *)&v84 + 1) + 8 * i) size];
            if (v20)
            {
              double v15 = v22;
              double v16 = v21;
            }
            else
            {
              if (v16 >= v21) {
                double v16 = v21;
              }
              [v19 size];
              if (v15 >= v27) {
                double v15 = v27;
              }
            }
          }
          else
          {
            BOOL v23 = *(unsigned char *)(a1 + 57) == 0;
            [*(id *)(*((void *)&v84 + 1) + 8 * i) size];
            double v25 = v24;
            if (v23)
            {
              [v19 size];
              if (v13 == 0.0) {
                double v29 = 0.0;
              }
              else {
                double v29 = *(double *)(a1 + 48);
              }
              double v14 = fmax(v14, v25);
              double v13 = v13 + v28 + v29;
            }
            else
            {
              if (v14 == 0.0) {
                double v26 = 0.0;
              }
              else {
                double v26 = *(double *)(a1 + 48);
              }
              [v19 size];
              double v14 = v14 + v25 + v26;
              double v13 = fmax(v13, v30);
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v84 objects:v88 count:16];
      }
      while (v10);
    }

    if (*(unsigned char *)(a1 + 56))
    {
      BOOL v31 = *(unsigned char *)(a1 + 57) == 0;
      unint64_t v32 = [v7 numberOfItems];
      uint64_t v33 = v32;
      unint64_t v34 = vcvtpd_u64_f64(sqrt((double)v8));
      if (v31)
      {
        unint64_t v45 = [v7 numberOfItems];
        double v37 = ceil((double)v33 / (double)v34);
        if (v45 >= v34) {
          unint64_t v46 = v34;
        }
        else {
          unint64_t v46 = v45;
        }
        double v38 = (double)v46;
      }
      else
      {
        if (v32 >= v34) {
          unint64_t v35 = v34;
        }
        else {
          unint64_t v35 = v32;
        }
        uint64_t v36 = [v7 numberOfItems];
        double v37 = (double)v35;
        double v38 = ceil((double)v36 / (double)v34);
      }
      double v47 = *(double *)(a1 + 48);
      double v14 = -(v47 - v37 * (v16 + v47));
      double v13 = -(v47 - v38 * (v15 + v47));
    }
    if (v14 == v12 && v13 == v11)
    {
      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
    else
    {
      v48 = (void *)MEMORY[0x263F339A0];
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      v51 = [v50 stringByAppendingPathExtension:@"raw"];
      v52 = [v48 createTemporaryFileWithFilename:v51];

      id v53 = v52;
      int v54 = open((const char *)[v53 fileSystemRepresentation], 514, 420);
      int v55 = v54;
      if (v54 == -1
        || ftruncate(v54, (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0))) == -1
        || (v56 = mmap(0, (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0)), 3, 1, v55, 0),
            v56 == (void *)-1))
      {
        v62 = *(void **)(a1 + 32);
        v63 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
        [v62 finishRunningWithError:v63];
      }
      else
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        size_t v64 = vcvtd_n_u64_f64(v14, 2uLL);
        v58 = CGBitmapContextCreate(v56, (unint64_t)v14, (unint64_t)v13, 8uLL, v64, DeviceRGB, 1u);
        CGContextTranslateCTM(v58, 0.0, v13);
        CGContextScaleCTM(v58, 1.0, -1.0);
        v82[0] = 0;
        v82[1] = v82;
        v82[2] = 0x3010000000;
        v82[3] = &unk_23C7915D1;
        long long v83 = *MEMORY[0x263F00148];
        v59 = [v7 items];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_4;
        v79[3] = &unk_264E597C8;
        char v80 = *(unsigned char *)(a1 + 56);
        v79[4] = v82;
        v79[5] = v58;
        *(double *)&v79[6] = v16;
        *(double *)&v79[7] = v15;
        __int16 v81 = *(_WORD *)(a1 + 57);
        v79[8] = *(void *)(a1 + 48);
        *(double *)&v79[9] = v14;
        *(double *)&v79[10] = v13;
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_7;
        v67[3] = &unk_264E597F0;
        v71 = v58;
        v72 = v56;
        unint64_t v73 = (unint64_t)(v13 * (double)(unint64_t)(v14 * 4.0));
        double v74 = v14;
        double v75 = v13;
        size_t v76 = v64;
        v77 = DeviceRGB;
        id v68 = *(id *)(a1 + 40);
        int v78 = v55;
        id v60 = v53;
        uint64_t v61 = *(void *)(a1 + 32);
        id v69 = v60;
        uint64_t v70 = v61;
        objc_msgSend(v59, "if_enumerateAsynchronouslyInSequence:completionHandler:", v79, v67);

        _Block_object_dispose(v82, 8);
      }
    }
  }
  else
  {
    v39 = *(void **)(a1 + 32);
    v40 = (void *)MEMORY[0x263F087E8];
    v89[0] = *MEMORY[0x263F08338];
    v41 = WFLocalizedString(@"Cannot run Combine Images");
    v90[0] = v41;
    v89[1] = *MEMORY[0x263F08320];
    v42 = WFLocalizedString(@"No images were provided to combine.");
    v90[1] = v42;
    v43 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
    v44 = [v40 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v43];
    [v39 finishRunningWithError:v44];
  }
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 32);
  long long v13 = v7;
  v10[2] = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_5;
  v10[3] = &unk_264E597A0;
  char v16 = *(unsigned char *)(a1 + 88);
  __int16 v17 = *(_WORD *)(a1 + 89);
  uint64_t v14 = *(void *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 72);
  id v11 = v6;
  id v8 = v6;
  id v9 = a2;
  [v9 getObjectRepresentations:v10 forClass:objc_opt_class()];
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(CGContext **)(a1 + 56);
  id v5 = a3;
  CGContextRelease(v4);
  id v6 = CGDataProviderCreateWithData(0, *(const void **)(a1 + 64), *(void *)(a1 + 72), 0);
  long long v7 = CGImageCreate((unint64_t)*(double *)(a1 + 80), (unint64_t)*(double *)(a1 + 88), 8uLL, 0x20uLL, *(void *)(a1 + 96), *(CGColorSpaceRef *)(a1 + 104), 1u, v6, 0, 0, kCGRenderingIntentDefault);
  id v8 = (void *)MEMORY[0x263F339A0];
  id v9 = [MEMORY[0x263F33870] proposedFilenameForFile:0 ofType:*(void *)(a1 + 32)];
  CFURLRef url = [v8 proposedTemporaryFileURLForFilename:v9];

  uint64_t v10 = [*(id *)(a1 + 32) utType];
  id v11 = [v10 identifier];
  long long v12 = CGImageDestinationCreateWithURL(url, v11, 1uLL, 0);

  CGImageDestinationAddImage(v12, v7, 0);
  CGImageDestinationFinalize(v12);
  if (v12) {
    CFRelease(v12);
  }
  CGDataProviderRelease(v6);
  CGImageRelease(v7);
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 104));
  munmap(*(void **)(a1 + 64), *(void *)(a1 + 72));
  close(*(_DWORD *)(a1 + 112));
  long long v13 = [MEMORY[0x263F08850] defaultManager];
  [v13 removeItemAtURL:*(void *)(a1 + 40) error:0];

  uint64_t v14 = [*(id *)(a1 + 48) output];
  long long v15 = [MEMORY[0x263F33870] fileWithURL:url options:1 ofType:*(void *)(a1 + 32)];
  [v14 addFile:v15];

  [*(id *)(a1 + 48) finishRunningWithError:v5];
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  char v16 = __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_6;
  __int16 v17 = &unk_264E59778;
  char v22 = *(unsigned char *)(a1 + 96);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 40);
  long long v19 = v6;
  __int16 v23 = *(_WORD *)(a1 + 97);
  uint64_t v20 = *(void *)(a1 + 72);
  long long v21 = *(_OWORD *)(a1 + 80);
  id v7 = a4;
  [a2 enumerateObjectsUsingBlock:&v14];
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t, void *), void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
}

void __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 sizeInPixels];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F85188]) initWithCGContext:*(void *)(a1 + 40) scale:1.0];
  if (*(unsigned char *)(a1 + 88))
  {
    CGContextSaveGState(*(CGContextRef *)(a1 + 40));
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    CGFloat v10 = *(double *)(v9 + 32);
    CGFloat v11 = *(double *)(v9 + 40);
    double v12 = *(double *)(a1 + 48);
    double v13 = *(double *)(a1 + 56);
    CGFloat v14 = fmax(v13 / v7, v12 / v5);
    CGAffineTransformMakeScale(&v23, v14, v14);
    double v15 = v7 * v23.c + v23.a * v5;
    double v16 = v7 * v23.d + v23.b * v5;
    v24.origin.x = v10;
    v24.origin.y = v11;
    v24.size.width = v12;
    v24.size.height = v13;
    CGContextClipToRect(*(CGContextRef *)(a1 + 40), v24);
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = v12;
    v25.size.height = v13;
    CGRect v26 = CGRectInset(v25, (v15 - *(double *)(a1 + 48)) * -0.5, (v16 - *(double *)(a1 + 56)) * -0.5);
    objc_msgSend(v3, "drawInContext:inRect:", v8, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
    CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
    double v17 = *(double *)(a1 + 64);
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(a1 + 89))
    {
      *(double *)(v18 + 32) = *(double *)(a1 + 48) + v17 + *(double *)(v18 + 32);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      if (*(double *)(v19 + 32) >= *(double *)(a1 + 72))
      {
        *(void *)(v19 + 32) = 0;
        double v20 = *(double *)(a1 + 56) + *(double *)(a1 + 64);
LABEL_9:
        long long v21 = (double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
LABEL_12:
        *long long v21 = v20 + *v21;
      }
    }
    else
    {
      *(double *)(v18 + 40) = *(double *)(a1 + 56) + v17 + *(double *)(v18 + 40);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
      if (*(double *)(v22 + 40) >= *(double *)(a1 + 80))
      {
        *(void *)(v22 + 40) = 0;
        double v20 = *(double *)(a1 + 48) + *(double *)(a1 + 64);
        long long v21 = (double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
        goto LABEL_12;
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 89))
    {
      objc_msgSend(v3, "drawInContext:inRect:", v8, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5, v7);
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v5
                                                                  + *(double *)(a1 + 64)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 32);
    }
    if (*(unsigned char *)(a1 + 90))
    {
      objc_msgSend(v3, "drawInContext:inRect:", v8, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5, v7);
      double v20 = v7 + *(double *)(a1 + 64);
      goto LABEL_9;
    }
  }
}

uint64_t __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 preferredFileType];
  uint64_t v3 = [v2 conformsToUTType:*MEMORY[0x263F1DC08]];

  return v3;
}

uint64_t __51__WFImageCombineAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 preferredFileType];
  uint64_t v3 = [v2 conformsToUTType:*MEMORY[0x263F1DB40]];

  return v3;
}

@end