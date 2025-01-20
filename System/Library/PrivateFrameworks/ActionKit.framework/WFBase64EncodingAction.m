@interface WFBase64EncodingAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)base64EncodedStringItemFromFile:(id)a3 lineBreakMode:(id)a4;
- (id)inputContentClasses;
- (id)itemFromBase64EncodedString:(id)a3 nameIfKnown:(id)a4;
- (id)outputContentClasses;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFBase64EncodingAction

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFBase64EncodingAction;
  BOOL v7 = [(WFBase64EncodingAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFEncodeMode"]) {
    [(WFBase64EncodingAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (id)outputContentClasses
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [(WFBase64EncodingAction *)self parameterStateForKey:@"WFEncodeMode"];
  v3 = [v2 value];
  int v4 = [v3 isEqualToString:@"Encode"];

  uint64_t v5 = objc_opt_class();
  if (v4)
  {
    v13[0] = v5;
    id v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = v13;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v11 = v5;
    uint64_t v12 = objc_opt_class();
    id v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = &v11;
    uint64_t v8 = 2;
  }
  objc_super v9 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v11, v12, v13[0]);

  return v9;
}

- (id)inputContentClasses
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [(WFBase64EncodingAction *)self parameterStateForKey:@"WFEncodeMode"];
  v3 = [v2 value];
  int v4 = [v3 isEqualToString:@"Decode"];

  uint64_t v5 = objc_opt_class();
  if (v4)
  {
    v13[0] = v5;
    id v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = v13;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v11 = v5;
    uint64_t v12 = objc_opt_class();
    id v6 = (void *)MEMORY[0x263EFF8C0];
    BOOL v7 = &v11;
    uint64_t v8 = 2;
  }
  objc_super v9 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v11, v12, v13[0]);

  return v9;
}

- (id)itemFromBase64EncodedString:(id)a3 nameIfKnown:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithBase64EncodedString:v7 options:1];

  if (v8)
  {
    objc_super v9 = [MEMORY[0x263F33870] fileWithData:v8 ofType:0 proposedFilename:v5];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)base64EncodedStringItemFromFile:(id)a3 lineBreakMode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"Every 64 Characters"])
  {
    uint64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"Every 76 Characters"])
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v5 mappedData];
  objc_super v9 = [v8 base64EncodedStringWithOptions:v7];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F33908];
    uint64_t v11 = [v5 wfName];
    uint64_t v12 = [v10 object:v9 named:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBase64EncodingAction *)self parameterValueForKey:@"WFEncodeMode" ofClass:objc_opt_class()];
  int v6 = [v5 isEqualToString:@"Encode"];
  uint64_t v7 = objc_opt_class();
  if (v6)
  {
    uint64_t v8 = [(WFBase64EncodingAction *)self parameterValueForKey:@"WFBase64LineBreakMode" ofClass:v7];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E5AA28;
    v13[4] = self;
    id v14 = v8;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E5E840;
    v12[4] = self;
    id v9 = v8;
    [v4 transformFileRepresentationsForType:0 usingBlock:v13 completionHandler:v12];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_3;
    v11[3] = &unk_264E5CE40;
    v11[4] = self;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_4;
    v10[3] = &unk_264E5E840;
    v10[4] = self;
    [v4 transformObjectRepresentationsForClass:v7 usingBlock:v11 completionHandler:v10];
  }
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = a4;
  id v9 = [v6 base64EncodedStringItemFromFile:a2 lineBreakMode:v7];
  ((void (**)(void, id, void))a4)[2](v8, v9, 0);
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = a5;
  id v9 = [*(id *)(a1 + 32) itemFromBase64EncodedString:a2 nameIfKnown:a3];
  if (v9)
  {
    v8[2](v8, v9, 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F870B8];
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v12 = WFLocalizedString(@"The base64 data passed to Base64 Encode is invalid.");
    v16[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v14 = [v10 errorWithDomain:v11 code:6 userInfo:v13];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v14);
  }
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end