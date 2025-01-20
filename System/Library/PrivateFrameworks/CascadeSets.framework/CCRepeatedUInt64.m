@interface CCRepeatedUInt64
- (void)enumerateUInt64ValuesWithBlock:(id)a3;
@end

@implementation CCRepeatedUInt64

- (void)enumerateUInt64ValuesWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(CCRepeatedFieldValue *)self values];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, [*(id *)(*((void *)&v10 + 1) + 8 * v9++) unsignedLongLongValue]);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end