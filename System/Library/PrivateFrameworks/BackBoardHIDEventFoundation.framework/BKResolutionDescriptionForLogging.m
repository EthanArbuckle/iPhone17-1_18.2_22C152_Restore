@interface BKResolutionDescriptionForLogging
@end

@implementation BKResolutionDescriptionForLogging

void ___BKResolutionDescriptionForLogging_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___BKResolutionDescriptionForLogging_block_invoke_2;
  v6[3] = &unk_1E6871088;
  id v7 = v3;
  id v8 = v4;
  char v9 = *(unsigned char *)(a1 + 40);
  id v5 = v3;
  [v8 appendProem:0 block:v6];
}

void ___BKResolutionDescriptionForLogging_block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) display];
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) environment];
  id v4 = (id)[v2 appendObject:v3 withName:0 skipIfNil:1];

  if (([v11 _isNullDisplay] & 1) == 0) {
    id v5 = (id)[*(id *)(a1 + 40) appendObject:v11 withName:@"display" skipIfNil:1];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    v6 = [*(id *)(a1 + 32) processDescription];
    if (!v6)
    {
      [*(id *)(a1 + 32) pid];
      v6 = BSProcessDescriptionForPID();
    }
    [*(id *)(a1 + 40) appendString:v6 withName:0 skipIfEmpty:1];
  }
  else
  {
    id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 32), "pid"), @"pid");
  }
  id v8 = *(void **)(a1 + 40);
  char v9 = [*(id *)(a1 + 32) token];
  id v10 = (id)[v8 appendObject:v9 withName:@"token" skipIfNil:1];
}

@end