@interface WFGetCurrentLocationAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetCurrentLocationAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to access your current location?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "locationLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFGetCurrentLocationAction *)self parameterValueForKey:@"Accuracy" ofClass:objc_opt_class()];
  WFCLLocationAccuracyFromWFLocationAccuracy();
  double v6 = v5;
  v7 = (void *)MEMORY[0x263F86CC8];
  v8 = [(WFGetCurrentLocationAction *)self workflow];
  uint64_t v9 = [v8 environment];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__WFGetCurrentLocationAction_runAsynchronouslyWithInput___block_invoke;
  v10[3] = &unk_264E56670;
  v10[4] = self;
  [v7 determineLocationWithWorkflowEnvironment:v9 desiredAccuracy:v10 completion:v6];
}

void __57__WFGetCurrentLocationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x263F337C8];
    v8 = [MEMORY[0x263F337E8] locationLocation];
    uint64_t v9 = [v7 itemWithObject:v5 origin:v8 disclosureLevel:1];

    v10 = [*(id *)(a1 + 32) output];
    [v10 addItem:v9];
  }
  v11 = *(void **)(a1 + 32);
  id v12 = v6;
  v13 = [v12 domain];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  v14 = (void *)getkCLErrorDomainSymbolLoc_ptr;
  uint64_t v28 = getkCLErrorDomainSymbolLoc_ptr;
  if (!getkCLErrorDomainSymbolLoc_ptr)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __getkCLErrorDomainSymbolLoc_block_invoke;
    v24[3] = &unk_264E5EC88;
    v24[4] = &v25;
    __getkCLErrorDomainSymbolLoc_block_invoke(v24);
    v14 = (void *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v14)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    v23 = [NSString stringWithUTF8String:"NSString *getkCLErrorDomain(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFGetCurrentLocationAction.m", 19, @"%s", dlerror());

    __break(1u);
  }
  if (![v13 isEqualToString:*v14])
  {

    goto LABEL_10;
  }
  BOOL v15 = [v12 code] == 2;

  if (!v15)
  {
LABEL_10:
    id v21 = v12;
    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x263F087E8];
  v17 = [v12 domain];
  uint64_t v18 = [v12 code];
  uint64_t v25 = *MEMORY[0x263F08320];
  v19 = WFLocalizedString(@"Get Current Location failed because a network error occurred.");
  v24[0] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v25 count:1];
  id v21 = [v16 errorWithDomain:v17 code:v18 userInfo:v20];

LABEL_11:
  [v11 finishRunningWithError:v21];
}

@end