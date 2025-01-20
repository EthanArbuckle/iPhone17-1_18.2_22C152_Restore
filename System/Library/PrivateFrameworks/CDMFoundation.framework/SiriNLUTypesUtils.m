@interface SiriNLUTypesUtils
+ (BOOL)isSdaAskRepeat:(id)a3;
+ (BOOL)isTopSdaAskRepeat:(id)a3;
+ (id)createResponse:(id)a3 statusCode:(int)a4;
@end

@implementation SiriNLUTypesUtils

+ (BOOL)isSdaAskRepeat:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a3, "prompted", 0);
  v4 = [v3 target];
  v5 = [v4 identifiers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) value];
        char v11 = [v10 isEqual:@"SystemPrompted_SystemAskedUserToRepeat"];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

+ (BOOL)isTopSdaAskRepeat:(id)a3
{
  v4 = [a3 turnContext];
  v5 = [v4 nlContext];
  uint64_t v6 = [v5 systemDialogActs];

  if (v6 && [v6 count])
  {
    uint64_t v7 = [v6 objectAtIndex:0];
    char v8 = [a1 isSdaAskRepeat:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)createResponse:(id)a3 statusCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = (objc_class *)MEMORY[0x263F71D20];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setCode:v4];
  id v8 = objc_alloc_init(MEMORY[0x263F71CB0]);
  [v8 setRequestId:v6];

  [v8 setResponseStatus:v7];
  return v8;
}

@end