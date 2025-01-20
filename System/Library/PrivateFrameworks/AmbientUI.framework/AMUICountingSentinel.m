@interface AMUICountingSentinel
- (NSString)description;
- (void)_addToCounter:(int64_t)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)decrement;
- (void)increment;
- (void)performWhenCountAtZero:(uint64_t)a1;
@end

@implementation AMUICountingSentinel

- (void)increment
{
  if (a1) {
    return (void *)[a1 _addToCounter:1];
  }
  return a1;
}

- (void)decrement
{
  if (a1) {
    return (void *)[a1 _addToCounter:-1];
  }
  return a1;
}

- (void)performWhenCountAtZero:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    id v9 = v3;
    if (*(void *)(a1 + 8))
    {
      v4 = *(void **)(a1 + 16);
      if (!v4)
      {
        uint64_t v5 = [MEMORY[0x263EFF980] array];
        v6 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v5;

        v4 = *(void **)(a1 + 16);
      }
      v7 = (void *)[v9 copy];
      v8 = (void *)MEMORY[0x24C5614A0]();
      [v4 addObject:v8];
    }
    else
    {
      v3[2](v3);
    }
    v3 = (void (**)(void))v9;
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__AMUICountingSentinel_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_265224858;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __53__AMUICountingSentinel_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 8) withName:@"counter"];
  id result = (id)[*(id *)(*(void *)(a1 + 40) + 16) count];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"deferredBlocks"];
  }
  return result;
}

- (void)_addToCounter:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t counter = self->_counter;
  self->_int64_t counter = (counter + a3) & ~((counter + a3) >> 63);
  if (counter) {
    BOOL v4 = counter + a3 <= 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    v6 = (void *)[(NSMutableArray *)self->_deferredBlocks copy];
    [(NSMutableArray *)self->_deferredBlocks removeAllObjects];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
}

@end