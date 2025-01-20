@interface WFGenerateMachineReadableCodeAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGenerateMachineReadableCodeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = @"Low";
  v14[1] = @"Medium";
  v15[0] = @"L";
  v15[1] = @"M";
  v14[2] = @"Quartile";
  v14[3] = @"High";
  v15[2] = @"Q";
  v15[3] = @"H";
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v15 forKeys:v14 count:4];
  v7 = [(WFGenerateMachineReadableCodeAction *)self parameterValueForKey:@"WFQRErrorCorrectionLevel" ofClass:objc_opt_class()];
  v8 = [v6 objectForKey:v7];
  uint64_t v9 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke;
  v12[3] = &unk_264E5CE40;
  id v13 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke_2;
  v11[3] = &unk_264E5E840;
  v11[4] = self;
  id v10 = v8;
  [v5 transformObjectRepresentationsForClass:v9 usingBlock:v12 completionHandler:v11];
}

void __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = a5;
  id v10 = a4;
  id v11 = +[WFMachineReadableCodeContentItem qrCodeItemWithString:a2 errorCorrectionLevel:v8];
  ((void (**)(void, id, id))a5)[2](v9, v11, v10);
}

void __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end