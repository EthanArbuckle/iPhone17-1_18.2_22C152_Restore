@interface WFMakeImageFromPDFPageAction
- (CGColorSpace)selectedColorspace;
- (double)selectedResolution;
- (id)parameterSummary;
- (id)selectedFileType;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMakeImageFromPDFPageAction

- (double)selectedResolution
{
  v2 = [(WFMakeImageFromPDFPageAction *)self parameterValueForKey:@"WFMakeImageFromPDFPageResolution" ofClass:objc_opt_class()];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (CGColorSpace)selectedColorspace
{
  v2 = [(WFMakeImageFromPDFPageAction *)self parameterValueForKey:@"WFMakeImageFromPDFPageColorspace" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"RGB"])
  {
    float v3 = (const __CFString **)MEMORY[0x263F002D8];
LABEL_5:
    CFStringRef v4 = *v3;
    goto LABEL_9;
  }
  if ([v2 isEqualToString:@"CMYK"])
  {
    float v3 = (const __CFString **)MEMORY[0x263F00240];
    goto LABEL_5;
  }
  if ([v2 isEqualToString:@"Gray"]) {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263F00250];
  }
  else {
    CFStringRef v4 = 0;
  }
LABEL_9:
  v5 = CGColorSpaceCreateWithName(v4);

  return v5;
}

- (id)selectedFileType
{
  v2 = [(WFMakeImageFromPDFPageAction *)self parameterValueForKey:@"WFMakeImageFromPDFPageImageFormat" ofClass:objc_opt_class()];
  float v3 = [MEMORY[0x263F852B8] typeWithString:v2];

  return v3;
}

- (id)parameterSummary
{
  id v2 = objc_alloc(MEMORY[0x263F86888]);
  float v3 = WFLocalizedStringResourceWithKey(@"Make ${WFMakeImageFromPDFPageImageFormat} from ${WFInput}", @"Make ${WFMakeImageFromPDFPageImageFormat} from ${WFInput}");
  CFStringRef v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [v6 items];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_264E5B0A8;
    uint64_t v11 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_3;
    v9[3] = &unk_264E5EEE8;
    v9[4] = v11;
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v10, v9);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v10 = v6;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [*(id *)(a1 + 32) selectedFileType];
    uint64_t v9 = [*(id *)(a1 + 32) selectedColorspace];
    [*(id *)(a1 + 32) selectedResolution];
    objc_msgSend(v10, "createImageWithFileType:colorspace:resolution:completion:", v8, v9, v7);
  }
  else
  {

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v18 = a3;
  id obj = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
              v17 = [*(id *)(a1 + 32) output];
              [v17 addFile:v16];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v18];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFMakeImageFromPDFPageAction;
  [(WFMakeImageFromPDFPageAction *)&v4 initializeParameters];
  float v3 = [(WFMakeImageFromPDFPageAction *)self parameterForKey:@"WFMakeImageFromPDFPageColorspace"];
  [v3 setAction:self];
}

@end