@interface WFGetPlaylistAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFGetPlaylistAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(WFGetPlaylistAction *)self parameterValueForKey:@"WFPlaylistName" ofClass:objc_opt_class()];
  v6 = WFPlaylistsMatchingDescriptor(v5);
  v7 = [v6 firstObject];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = objc_msgSend(v7, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        v14 = [(WFGetPlaylistAction *)self output];
        [v14 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

@end