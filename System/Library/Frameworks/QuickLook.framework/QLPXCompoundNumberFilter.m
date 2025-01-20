@interface QLPXCompoundNumberFilter
- (NSArray)filters;
- (double)updatedOutput;
- (void)setFilters:(id)a3;
@end

@implementation QLPXCompoundNumberFilter

- (double)updatedOutput
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(QLPXNumberFilter *)self input];
  double v4 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(QLPXCompoundNumberFilter *)self filters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __41__QLPXCompoundNumberFilter_updatedOutput__block_invoke;
        v13[3] = &__block_descriptor_40_e35_v16__0___QLPXMutableNumberFilter__8l;
        *(double *)&v13[4] = v4;
        [v10 performChanges:v13];
        [v10 output];
        double v4 = v11;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __41__QLPXCompoundNumberFilter_updatedOutput__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end