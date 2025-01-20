@interface __FEDebugLogRootNode
- (BOOL)_isTransparent;
- (id)description;
@end

@implementation __FEDebugLogRootNode

- (BOOL)_isTransparent
{
  return 1;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->super._childMessages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "description", (void)v13);
        [v3 appendString:v10];

        v11 = [(NSMutableArray *)self->super._childMessages lastObject];

        if (v9 != v11) {
          [v3 appendString:@"\n"];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

@end