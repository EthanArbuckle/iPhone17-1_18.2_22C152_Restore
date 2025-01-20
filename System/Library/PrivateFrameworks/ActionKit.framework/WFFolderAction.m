@interface WFFolderAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFFolderAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = [(WFFolderAction *)self parameterValueForKey:@"WFFolder" ofClass:objc_opt_class()];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(WFFolderAction *)self output];
        [v11 addFileWithOriginAttribution:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

@end