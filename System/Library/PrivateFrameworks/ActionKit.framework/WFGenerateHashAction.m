@interface WFGenerateHashAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGenerateHashAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGenerateHashAction *)self parameterValueForKey:@"WFHashType" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"SHA1"])
  {
    uint64_t v6 = MEMORY[0x263EF8038];
    size_t v7 = 20;
  }
  else if ([v5 isEqualToString:@"SHA256"])
  {
    uint64_t v6 = MEMORY[0x263EF8058];
    size_t v7 = 32;
  }
  else
  {
    int v8 = [v5 isEqualToString:@"SHA512"];
    if (v8) {
      uint64_t v6 = MEMORY[0x263EF8090];
    }
    else {
      uint64_t v6 = MEMORY[0x263EF8018];
    }
    if (v8) {
      size_t v7 = 64;
    }
    else {
      size_t v7 = 16;
    }
  }
  v9 = malloc_type_malloc(v7, 0xF28AFB92uLL);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &__block_descriptor_56_e62_v32__0__WFFileRepresentation_8__NSError_16___v_____NSError__24l;
  v11[4] = v6;
  v11[5] = v9;
  v11[6] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke_2;
  v10[3] = &unk_264E56528;
  v10[4] = self;
  v10[5] = v9;
  [v4 transformFileRepresentationsForType:0 usingBlock:v11 completionHandler:v10];
}

void __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  int v8 = a4;
  v9 = [v17 mappedData];
  v10 = objc_opt_new();
  v11 = (void (*)(uint64_t, uint64_t, void))a1[4];
  id v12 = v9;
  v11([v12 bytes], objc_msgSend(v12, "length"), a1[5]);
  if (a1[6])
  {
    unint64_t v13 = 0;
    do
      objc_msgSend(v10, "appendFormat:", @"%02x", *(unsigned __int8 *)(a1[5] + v13++));
    while (a1[6] > v13);
  }
  v14 = (void *)MEMORY[0x263F33908];
  v15 = [v17 wfName];
  v16 = [v14 object:v10 named:v15];
  v8[2](v8, v16, v7);
}

void __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  id v7 = a3;
  id v6 = a2;
  free(v5);
  [*(id *)(a1 + 32) setOutput:v6];

  [*(id *)(a1 + 32) finishRunningWithError:v7];
}

@end