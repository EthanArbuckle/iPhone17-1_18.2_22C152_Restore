@interface WFExtractArchiveAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)localizedKeywordsWithContext:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFExtractArchiveAction

- (id)localizedKeywordsWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFExtractArchiveAction;
  v3 = [(WFExtractArchiveAction *)&v8 localizedKeywordsWithContext:a3];
  v4 = WFSupportedArchiveFormats();
  v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_29453);
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

id __55__WFExtractArchiveAction_localizedKeywordsWithContext___block_invoke()
{
  v0 = WFArchiveFormatFileExtension();
  v1 = [@"." stringByAppendingString:v0];

  return v1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E59DC8;
  v4[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke_2;
  v3[3] = &unk_264E5E840;
  v3[4] = self;
  [a3 transformFirstFileRepresentationForType:0 usingBlock:v4 completionHandler:v3];
}

void __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v7 = a4;
  if (a2)
  {
    id v8 = a3;
    v9 = WFExtractArchiveFile();
    id v10 = 0;
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = v8;
    }
    ((void (**)(id, void *, id))v7)[2](v7, v9, v12);
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    id v11 = a3;
    [v13 finishRunningWithError:v11];
  }
}

void __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end