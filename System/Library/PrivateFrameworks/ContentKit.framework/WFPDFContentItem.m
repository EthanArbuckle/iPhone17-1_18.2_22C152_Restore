@interface WFPDFContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithPrintFormatters:(id)a3 names:(id)a4;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (void)getPDFFromPrintFormatters:(id)a3 nameIfKnown:(id)a4 matchingInputSize:(BOOL)a5 withMargin:(BOOL)a6 startingAtPage:(int64_t)a7 endingAtPage:(int64_t)a8 completionHandler:(id)a9;
- (void)createImageWithFileType:(id)a3 colorspace:(CGColorSpace *)a4 resolution:(double)a5 completion:(id)a6;
- (void)enumeratePagesInDocument:(id)a3 block:(id)a4;
- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getPDF:(id)a3 matchingInputSize:(BOOL)a4 withMargin:(BOOL)a5 startingAtPage:(int64_t)a6 endingAtPage:(int64_t)a7;
@end

@implementation WFPDFContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d PDFs");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"PDFs", @"PDFs");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"PDF", @"PDF");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9B0];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  v6 = +[WFImageContentItem imageTypes];
  [v5 unionOrderedSet:v6];

  v7 = +[WFObjectType typeWithClassName:@"PDFDocument" frameworkName:@"PDFKit" location:0];
  [v5 addObject:v7];

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (void)getPDFFromPrintFormatters:(id)a3 nameIfKnown:(id)a4 matchingInputSize:(BOOL)a5 withMargin:(BOOL)a6 startingAtPage:(int64_t)a7 endingAtPage:(int64_t)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a9;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke;
  v20[3] = &unk_264288D18;
  BOOL v26 = a5;
  BOOL v27 = a6;
  id v21 = v14;
  id v22 = v15;
  int64_t v24 = a7;
  int64_t v25 = a8;
  id v23 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  dispatch_async(MEMORY[0x263EF83A0], v20);
}

void __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v30 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  int v1 = *(unsigned __int8 *)(a1 + 72);
  v2 = objc_alloc_init(WFPageRenderer);
  [(WFPageRenderer *)v2 setIncludeMargin:*(unsigned __int8 *)(a1 + 73)];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v48 count:16];
  char v5 = v1 != 0;
  if (v4)
  {
    uint64_t v6 = *(void *)v39;
    v32 = v43;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        getUIPrintFormatterClass_16465();
        if (objc_opt_isKindOfClass())
        {
          v9 = [(WFPageRenderer *)v2 renderer];
          v10 = [(WFPageRenderer *)v2 renderer];
          objc_msgSend(v9, "addPrintFormatter:startingAtPageAtIndex:", v8, objc_msgSend(v10, "numberOfPages"));

          if (*(unsigned char *)(a1 + 73))
          {
            getUIViewPrintFormatterClass_16466();
            if (objc_opt_isKindOfClass())
            {
              v11 = [v8 view];
              uint64_t v44 = 0;
              v45 = &v44;
              uint64_t v46 = 0x2050000000;
              v12 = (void *)getWKWebViewClass_softClass_16467;
              uint64_t v47 = getWKWebViewClass_softClass_16467;
              if (!getWKWebViewClass_softClass_16467)
              {
                v42[0] = MEMORY[0x263EF8330];
                v42[1] = 3221225472;
                v43[0] = __getWKWebViewClass_block_invoke_16468;
                v43[1] = &unk_26428AC60;
                v43[2] = &v44;
                __getWKWebViewClass_block_invoke_16468((uint64_t)v42);
                v12 = (void *)v45[3];
              }
              id v13 = v12;
              _Block_object_dispose(&v44, 8);
              char isKindOfClass = objc_opt_isKindOfClass();

              v5 &= isKindOfClass ^ 1;
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v4);
  }

  if (v5)
  {
    id v15 = [(WFPageRenderer *)v2 renderer];
    BOOL v16 = [v15 numberOfPages] > 0;

    double v17 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (v16)
    {
      uint64_t v19 = 0;
      do
      {
        -[WFPageRenderer sizeForPageAtIndex:](v2, "sizeForPageAtIndex:", v19, v30, v32);
        if (v20 >= v17) {
          double v17 = v20;
        }
        if (v21 >= v18) {
          double v18 = v21;
        }
        id v22 = [(WFPageRenderer *)v2 renderer];
        uint64_t v23 = [v22 numberOfPages];

        ++v19;
      }
      while (v19 < v23);
    }
    -[WFPageRenderer setMatchInputSize:](v2, "setMatchInputSize:", 1, v30);
    -[WFPageRenderer setInputSize:](v2, "setInputSize:", v17, v18);
  }
  int64_t v24 = +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", *(void *)(a1 + 40), v30, v30);
  int64_t v25 = +[WFTemporaryFileManager createTemporaryFileWithFilename:v24];

  uint64_t v26 = *(void *)(a1 + 56) - 1;
  uint64_t v27 = *(void *)(a1 + 64) - 1;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  v34[3] = &unk_26428A9D8;
  id v35 = v25;
  id v36 = v31;
  id v37 = *(id *)(a1 + 48);
  id v28 = v31;
  id v29 = v25;
  [(WFPageRenderer *)v2 renderToPDF:v29 startingAtPage:v26 endingAtPage:v27 completionHandler:v34];
}

void __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke_2(void *a1)
{
  id v2 = +[WFFileRepresentation fileWithURL:a1[4] options:1 ofType:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

+ (id)itemWithPrintFormatters:(id)a3 names:(id)a4
{
  id v6 = a4;
  v7 = (void (*)(void))getUIPrintFormatterClass_16465;
  id v8 = a3;
  v7();
  v9 = objc_opt_new();
  v10 = [a1 itemWithObject:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__WFPDFContentItem_itemWithPrintFormatters_names___block_invoke;
  v14[3] = &unk_26428AD10;
  id v15 = v6;
  id v11 = v6;
  v12 = objc_msgSend(v8, "if_map:", v14);

  [v10 setObjectRepresentations:v12 forClass:getUIPrintFormatterClass_16465()];
  return v10;
}

id __50__WFPDFContentItem_itemWithPrintFormatters_names___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  v7 = +[WFObjectRepresentation object:v5 named:v6];

  return v7;
}

- (void)enumeratePagesInDocument:(id)a3 block:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ([v8 pageCount])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [v8 pageAtIndex:v6];
      v5[2](v5, v7);

      ++v6;
    }
    while (v6 < [v8 pageCount]);
  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v27[3] = &unk_264288D90;
    id v29 = v8;
    v27[4] = self;
    id v28 = v9;
    [(WFContentItem *)self getObjectRepresentation:v27 forClass:getPDFDocumentClass()];

    id v13 = v29;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v24[3] = &unk_264288D90;
    id v26 = v8;
    v24[4] = self;
    id v25 = v9;
    [(WFContentItem *)self getObjectRepresentation:v24 forClass:getPDFDocumentClass()];

    id v13 = v26;
  }
  else
  {
    v10 = NSStringFromClass(a5);
    int v11 = [@"UIPrintFormatter" isEqualToString:v10];

    if (v11)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
      v20[3] = &unk_26428AAB0;
      id v21 = v9;
      id v22 = self;
      id v23 = v8;
      v12 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
      [(WFContentItem *)self getFileRepresentation:v20 forType:v12];

      id v13 = v21;
    }
    else
    {
      id v14 = NSStringFromClass(a5);
      int v15 = [@"PDFDocument" isEqualToString:v14];

      if (!v15)
      {
        double v17 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
        (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);

        goto LABEL_10;
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
      v18[3] = &unk_264289E40;
      v18[4] = self;
      id v19 = v8;
      BOOL v16 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
      [(WFContentItem *)self getFileRepresentation:v18 forType:v16];

      id v13 = v19;
    }
  }

LABEL_10:
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    int v15 = &unk_264288D68;
    id v9 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v10 = v8;
    id v17 = v10;
    [v9 enumeratePagesInDocument:v6 block:&v12];
    if (v10)
    {
      int v11 = +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v10, v12, v13, v14, v15, v16);
    }
    else
    {
      int v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    int v15 = &unk_264288D68;
    id v9 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v10 = v8;
    id v17 = v10;
    [v9 enumeratePagesInDocument:v6 block:&v12];
    if (v10)
    {
      int v11 = +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v10, v12, v13, v14, v15, v16);
    }
    else
    {
      int v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = +[WFWebResource webResourceWithFile:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
  v6[3] = &unk_264288DB8;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v3, 0, v4, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 representationType];
    id v6 = objc_alloc(getPDFDocumentClass());
    if (v5)
    {
      id v7 = [v4 fileURL];
      uint64_t v8 = [v6 initWithURL:v7];
    }
    else
    {
      id v7 = [v4 data];
      uint64_t v8 = [v6 initWithData:v7];
    }
    id v9 = (void *)v8;

    uint64_t v10 = *(void *)(a1 + 40);
    if (v9)
    {
      int v11 = [*(id *)(a1 + 32) name];
      uint64_t v12 = +[WFObjectRepresentation object:v9 named:v11];
      id v16 = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v13, 0);
    }
    else
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F07F70];
      uint64_t v17 = *MEMORY[0x263F08320];
      int v11 = WFLocalizedString(@"The PDF was corrupt or could not be read.");
      v18[0] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v13 = [v14 errorWithDomain:v15 code:259 userInfo:v12];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 viewPrintFormatter];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) name];
    id v9 = +[WFObjectRepresentation object:v6 named:v8];
    v11[0] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v10, 0);
  }
  else
  {
    (*(void (**)(void, void, id))(v7 + 16))(*(void *)(a1 + 40), 0, v5);
  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 attributedString];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089B8]);
    id v5 = [*(id *)(a1 + 32) dictionary];
    id v6 = [v5 objectForKey:@"WFCoercionOptionPDFPageHeaderText"];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
        [v4 appendAttributedString:v7];
      }
    }

    uint64_t v8 = [v14 attributedString];
    [v4 appendAttributedString:v8];

    id v9 = [*(id *)(a1 + 32) dictionary];
    uint64_t v10 = [v9 objectForKey:@"WFCoercionOptionPDFPageFooterText"];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v10];
        [v4 appendAttributedString:v11];
      }
    }

    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = (void *)[v4 copy];
    [v12 addObject:v13];
  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 string];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v5 = [*(id *)(a1 + 32) dictionary];
    id v6 = [v5 objectForKey:@"WFCoercionOptionPDFPageHeaderText"];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 appendString:v6];
      }
    }

    uint64_t v7 = [v12 string];
    [v4 appendString:v7];

    uint64_t v8 = [*(id *)(a1 + 32) dictionary];
    id v9 = [v8 objectForKey:@"WFCoercionOptionPDFPageFooterText"];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 appendString:v9];
      }
    }

    uint64_t v10 = *(void **)(a1 + 40);
    int v11 = (void *)[v4 copy];
    [v10 addObject:v11];
  }
}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 conformsToUTType:*MEMORY[0x263F1DBF0]])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__WFPDFContentItem_generateFileRepresentations_options_forType___block_invoke;
    v12[3] = &unk_26428AA60;
    id v13 = v7;
    [(WFPDFContentItem *)self getPDF:v12 matchingInputSize:1 withMargin:1 startingAtPage:1 endingAtPage:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    id v9 = +[WFImageContentItem imageTypes];
    int v10 = [v8 conformsToTypes:v9];

    if (v10)
    {
      [(WFPDFContentItem *)self createImageWithFileType:v8 colorspace:0 resolution:v7 completion:300.0];
    }
    else
    {
      int v11 = [(id)objc_opt_class() badCoercionErrorForType:v8];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

void __64__WFPDFContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a3;
    id v7 = a2;
    id v8 = [v5 arrayWithObjects:v10 count:1];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void, id))(v3 + 16);
    id v7 = a3;
    v9(v3, 0, v7);
    id v8 = 0;
  }
}

- (void)createImageWithFileType:(id)a3 colorspace:(CGColorSpace *)a4 resolution:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__WFPDFContentItem_createImageWithFileType_colorspace_resolution_completion___block_invoke;
  v17[3] = &unk_264288D40;
  id v18 = v10;
  id v19 = v11;
  double v20 = a5;
  id v21 = a4;
  v17[4] = self;
  id v12 = (void *)MEMORY[0x263F852B8];
  uint64_t v13 = *MEMORY[0x263F1DBF0];
  id v14 = v10;
  id v15 = v11;
  id v16 = [v12 typeWithUTType:v13];
  [(WFContentItem *)self getFileRepresentation:v17 forType:v16];
}

void __77__WFPDFContentItem_createImageWithFileType_colorspace_resolution_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_3:
    v7();
    goto LABEL_16;
  }
  if (![v5 representationType])
  {
    CFDataRef v34 = [v6 data];
    id v35 = CGDataProviderCreateWithCFData(v34);

    id v9 = CGPDFDocumentCreateWithProvider(v35);
    CGDataProviderRelease(v35);
    if (v9) {
      goto LABEL_6;
    }
LABEL_18:
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  CFURLRef v8 = [v6 fileURL];
  id v9 = CGPDFDocumentCreateWithURL(v8);

  if (!v9) {
    goto LABEL_18;
  }
LABEL_6:
  id v36 = v6;
  long long v39 = objc_opt_new();
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v9);
  if (NumberOfPages)
  {
    size_t v11 = NumberOfPages;
    size_t v12 = 1;
    unint64_t v13 = 0x263F85000uLL;
    size_t v37 = NumberOfPages;
    long long v38 = v9;
    do
    {
      Page = CGPDFDocumentGetPage(v9, v12);
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      CGFloat width = BoxRect.size.width;
      CGFloat height = BoxRect.size.height;
      id v19 = objc_msgSend(objc_alloc(*(Class *)(v13 + 392)), "initWithSize:opaque:scale:colorspace:hdrCapable:", 0, *(void *)(a1 + 64), 1, BoxRect.size.width, BoxRect.size.height, *(double *)(a1 + 56) / 72.0);
      double v20 = v19;
      if (v19)
      {
        id v21 = (CGContext *)[v19 CGContext];
        CGContextSetRGBFillColor(v21, 1.0, 1.0, 1.0, 1.0);
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        CGContextFillRect(v21, v42);
        CGContextSetInterpolationQuality(v21, kCGInterpolationHigh);
        CGContextSetRenderingIntent(v21, kCGRenderingIntentDefault);
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        CGFloat v22 = CGRectGetHeight(v43);
        CGContextTranslateCTM(v21, 0.0, v22);
        CGContextScaleCTM(v21, 1.0, -1.0);
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFMediaBox, v44, 0, 1);
        CGContextConcatCTM(v21, &transform);
        CGContextDrawPDFPage(v21, Page);
        CGImageRef Image = CGBitmapContextCreateImage(v21);
        if (Image)
        {
          int64_t v24 = Image;
          if (v11 == 1)
          {
            id v25 = [*(id *)(a1 + 32) name];
          }
          else
          {
            id v26 = NSString;
            uint64_t v27 = [*(id *)(a1 + 32) name];
            id v25 = [v26 stringWithFormat:@"%@-%lu", v27, v12];
          }
          id v28 = +[WFFileRepresentation proposedFilenameForFile:v25 ofType:*(void *)(a1 + 40)];
          CFURLRef v29 = +[WFTemporaryFileManager createTemporaryFileWithFilename:v28];
          uint64_t v30 = [*(id *)(a1 + 40) utType];
          v31 = [v30 identifier];
          v32 = CGImageDestinationCreateWithURL(v29, v31, 1uLL, 0);

          CGImageDestinationAddImage(v32, v24, 0);
          CGImageDestinationFinalize(v32);
          CFRelease(v32);
          CFRelease(v24);
          v33 = +[WFFileRepresentation fileWithURL:v29 options:1];
          [v39 addObject:v33];

          size_t v11 = v37;
          id v9 = v38;
          unint64_t v13 = 0x263F85000;
        }
      }

      ++v12;
    }
    while (v12 <= v11);
  }
  CGPDFDocumentRelease(v9);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v6 = v36;
LABEL_16:
}

- (void)getPDF:(id)a3 matchingInputSize:(BOOL)a4 withMargin:(BOOL)a5 startingAtPage:(int64_t)a6 endingAtPage:(int64_t)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  size_t v12 = (uint64_t (*)(void))getUIPrintFormatterClass_16465;
  id v13 = a3;
  id v16 = [(WFContentItem *)self objectsForClass:v12()];
  id v14 = objc_opt_class();
  id v15 = [(WFContentItem *)self name];
  [v14 getPDFFromPrintFormatters:v16 nameIfKnown:v15 matchingInputSize:v10 withMargin:v9 startingAtPage:a6 endingAtPage:a7 completionHandler:v13];
}

@end