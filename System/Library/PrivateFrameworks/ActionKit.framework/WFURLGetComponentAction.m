@interface WFURLGetComponentAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFURLGetComponentAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_264E5D0B0;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_264E5E840;
  v6[4] = self;
  [v4 transformFirstObjectRepresentationForClass:v5 usingBlock:v7 completionHandler:v6];
}

void __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v14 = a2;
  id v8 = a4;
  v9 = a5;
  if (!v14)
  {
    v9[2](v9, 0, v8);
    goto LABEL_21;
  }
  v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFURLComponent" ofClass:objc_opt_class()];
  if ([v10 isEqualToString:@"Scheme"])
  {
    uint64_t v11 = [v14 scheme];
LABEL_19:
    v13 = (void *)v11;
    goto LABEL_20;
  }
  if ([v10 isEqualToString:@"User"])
  {
    uint64_t v11 = [v14 user];
    goto LABEL_19;
  }
  if ([v10 isEqualToString:@"Password"])
  {
    uint64_t v11 = [v14 password];
    goto LABEL_19;
  }
  if ([v10 isEqualToString:@"Host"])
  {
    uint64_t v11 = [v14 host];
    goto LABEL_19;
  }
  if (![v10 isEqualToString:@"Port"])
  {
    if ([v10 isEqualToString:@"Path"])
    {
      uint64_t v11 = [v14 path];
    }
    else if ([v10 isEqualToString:@"Query"])
    {
      uint64_t v11 = [v14 query];
    }
    else
    {
      if (![v10 isEqualToString:@"Fragment"])
      {
        v13 = 0;
        goto LABEL_20;
      }
      uint64_t v11 = [v14 fragment];
    }
    goto LABEL_19;
  }
  v12 = [v14 port];
  v13 = [v12 stringValue];

LABEL_20:
  ((void (**)(id, void *, id))v9)[2](v9, v13, v8);

LABEL_21:
}

void __54__WFURLGetComponentAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end