@interface WFFormatFileSizeAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFFormatFileSizeAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFFileSizeFormat" ofClass:objc_opt_class()];
    if ([v8 isEqualToString:@"Automatic"])
    {
      uint64_t v9 = 1;
    }
    else
    {
      v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFFileSizeIncludeUnits" ofClass:objc_opt_class()];
      uint64_t v9 = [v10 BOOLValue];
    }
    id v11 = objc_alloc_init(MEMORY[0x263F086F0]);
    [v11 setCountStyle:2];
    id v12 = v8;
    if ([v12 isEqualToString:@"Automatic"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"Bytes"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"KB"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"MB"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"GB"])
    {
      uint64_t v13 = 8;
    }
    else if ([v12 isEqualToString:@"TB"])
    {
      uint64_t v13 = 16;
    }
    else if ([v12 isEqualToString:@"PB"])
    {
      uint64_t v13 = 32;
    }
    else if ([v12 isEqualToString:@"EB"])
    {
      uint64_t v13 = 64;
    }
    else if ([v12 isEqualToString:@"ZB"])
    {
      uint64_t v13 = 128;
    }
    else if ([v12 isEqualToString:@"YB or Higher"])
    {
      uint64_t v13 = 65280;
    }
    else
    {
      uint64_t v13 = 0;
    }

    [v11 setAllowedUnits:v13];
    [v11 setIncludesUnit:v9];
    v14 = [v6 items];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_264E5A948;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v11;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_4;
    v16[3] = &unk_264E5E8E8;
    v16[4] = v18;
    id v15 = v11;
    objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v16);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_264E5A920;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v13 = v6;
  v11[4] = v7;
  id v12 = v8;
  id v9 = v6;
  id v10 = a2;
  [v10 getObjectRepresentation:v11 forClass:objc_opt_class()];
}

uint64_t __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    v3 = [*(id *)(a1 + 32) output];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "stringFromByteCount:", objc_msgSend(v5, "longLongValue"));
    [v3 addObject:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end