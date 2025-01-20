@interface VSCompoundValueTransformer
- (NSArray)valueTransformers;
- (VSCompoundValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
- (void)setValueTransformers:(id)a3;
@end

@implementation VSCompoundValueTransformer

- (VSCompoundValueTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSCompoundValueTransformer;
  v2 = [(VSCompoundValueTransformer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    valueTransformers = v2->_valueTransformers;
    v2->_valueTransformers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)transformedValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VSCompoundValueTransformer;
  v4 = [(VSCompoundValueTransformer *)&v16 transformedValue:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(VSCompoundValueTransformer *)self valueTransformers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) transformedValue:v10];

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(VSCompoundValueTransformer *)self valueTransformers];
  uint64_t v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  uint64_t v8 = v4;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    uint64_t v8 = v4;
    do
    {
      uint64_t v11 = 0;
      long long v12 = v8;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) reverseTransformedValue:v12];

        ++v11;
        long long v12 = v8;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v8;
}

- (NSArray)valueTransformers
{
  return self->_valueTransformers;
}

- (void)setValueTransformers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end