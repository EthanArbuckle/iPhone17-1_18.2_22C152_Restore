@interface WFURLEncodeAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFURLEncodeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFURLEncodeAction *)self parameterValueForKey:@"WFEncodeMode" ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_264E5CE40;
  id v10 = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E5E840;
  v8[4] = self;
  id v7 = v5;
  [v4 transformObjectRepresentationsForClass:v6 usingBlock:v9 completionHandler:v8];
}

void __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v15 = a2;
  if (v15)
  {
    v8 = *(void **)(a1 + 32);
    v9 = a5;
    id v10 = a4;
    if ([v8 isEqualToString:@"Decode"])
    {
      id v11 = [v15 stringByRemovingPercentEncoding];
      if (!v11) {
        id v11 = v15;
      }
    }
    else
    {
      v13 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
      v14 = (void *)[v13 mutableCopy];

      [v14 removeCharactersInString:@"?&="];
      id v11 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v14];
    }
    ((void (*)(void *, id, void *))v9[2])(v9, v11, v10);
  }
  else
  {
    v12 = (void (*)(void *, void, id))a5[2];
    id v10 = a5;
    id v11 = a4;
    v12(v10, 0, v11);
  }
}

void __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end