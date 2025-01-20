@interface VSReverseValueTransformer
+ (id)reverseValueTransformerWithValueTransformer:(id)a3;
- (NSValueTransformer)valueTransformer;
- (VSReverseValueTransformer)init;
- (VSReverseValueTransformer)initWithValueTransformer:(id)a3;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
- (void)setValueTransformer:(id)a3;
@end

@implementation VSReverseValueTransformer

+ (id)reverseValueTransformerWithValueTransformer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      [v4 raise:v5, @"Unexpectedly, valueTransformer was %@, instead of VSReverseValueTransformer.", v7 format];
    }
    v8 = [v3 valueTransformer];
LABEL_18:
    v9 = (VSCompoundValueTransformer *)v8;
    if (v8) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [[VSReverseValueTransformer alloc] initWithValueTransformer:v3];
    goto LABEL_18;
  }
  v9 = objc_alloc_init(VSCompoundValueTransformer);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v11 raise:v12, @"Unexpectedly, valueTransformer was %@, instead of VSCompoundValueTransformer.", v14 format];
  }
  v15 = [v3 valueTransformers];
  v16 = [v15 reverseObjectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = +[VSReverseValueTransformer reverseValueTransformerWithValueTransformer:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v10 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  [(VSCompoundValueTransformer *)v9 setValueTransformers:v10];
  if (!v9) {
LABEL_19:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
LABEL_20:

  return v9;
}

- (VSReverseValueTransformer)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSReverseValueTransformer)initWithValueTransformer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSReverseValueTransformer;
  v6 = [(VSReverseValueTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_valueTransformer, a3);
  }

  return v7;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  id v5 = [(VSReverseValueTransformer *)self valueTransformer];
  v6 = [v5 reverseTransformedValue:v4];

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  id v5 = [(VSReverseValueTransformer *)self valueTransformer];
  v6 = [v5 transformedValue:v4];

  return v6;
}

- (NSValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (void)setValueTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end