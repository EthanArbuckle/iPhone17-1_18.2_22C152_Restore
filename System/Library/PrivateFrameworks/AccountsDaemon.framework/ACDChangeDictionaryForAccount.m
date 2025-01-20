@interface ACDChangeDictionaryForAccount
@end

@implementation ACDChangeDictionaryForAccount

void ___ACDChangeDictionaryForAccount_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = ___ACDChangeDictionaryForAccount_block_invoke_2;
  v10 = &unk_264321490;
  id v4 = v3;
  id v11 = v4;
  id v12 = *(id *)(a1 + 32);
  v5 = ___ACDChangeDictionaryForAccount_block_invoke_2((uint64_t)&v7);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v4, v7, v8);
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8);
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v4];
  }
}

__CFString *___ACDChangeDictionaryForAccount_block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB148]])
  {
    v2 = [*(id *)(a1 + 40) trackedEnabledDataclasses];
LABEL_5:
    id v3 = v2;
    id v4 = (__CFString *)[v2 copy];

    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB158]])
  {
    v2 = [*(id *)(a1 + 40) trackedProvisionedDataclasses];
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB120]])
  {
    v5 = NSNumber;
    uint64_t v6 = [*(id *)(a1 + 40) isActive];
LABEL_8:
    uint64_t v7 = [v5 numberWithBool:v6];
LABEL_13:
    id v4 = (__CFString *)v7;
    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB140]])
  {
    uint64_t v7 = [*(id *)(a1 + 40) creationDate];
    goto LABEL_13;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB150]])
  {
    uint64_t v7 = [*(id *)(a1 + 40) parentAccount];
    goto LABEL_13;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB160]])
  {
    v5 = NSNumber;
    uint64_t v6 = [*(id *)(a1 + 40) isVisible];
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263EFB168]])
  {
    v5 = NSNumber;
    uint64_t v6 = [*(id *)(a1 + 40) isWarmingUp];
    goto LABEL_8;
  }
  NSSelectorFromString(*(NSString **)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [*(id *)(a1 + 40) valueForKey:*(void *)(a1 + 32)];
    goto LABEL_13;
  }
  id v4 = @"<failed>";
LABEL_14:

  return v4;
}

void ___ACDChangeDictionaryForAccount_block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  if (v3)
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v5];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

@end