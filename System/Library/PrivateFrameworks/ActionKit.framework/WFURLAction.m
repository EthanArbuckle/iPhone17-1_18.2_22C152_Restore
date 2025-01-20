@interface WFURLAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFURLAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(WFURLAction *)self parameterValueForKey:@"WFURLActionURL" ofClass:objc_opt_class()];
  if ([v5 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(MEMORY[0x263F337C8], "itemWithObject:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
          if (v11)
          {
            v12 = [(WFURLAction *)self output];
            [v12 addItem:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

@end