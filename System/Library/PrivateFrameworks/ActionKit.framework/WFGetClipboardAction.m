@interface WFGetClipboardAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetClipboardAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(objc_class *)getUIPasteboardClass_43226() generalPasteboard];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__WFGetClipboardAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_264E5E840;
  v5[4] = self;
  [MEMORY[0x263F337B0] generateCollectionFromPasteboard:v4 completionHandler:v5];
}

void __51__WFGetClipboardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end