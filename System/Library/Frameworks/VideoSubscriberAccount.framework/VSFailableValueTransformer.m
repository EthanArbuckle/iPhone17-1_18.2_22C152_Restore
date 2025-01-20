@interface VSFailableValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (NSValueTransformer)objectValueTransformer;
- (id)transformedValue:(id)a3;
- (void)setObjectValueTransformer:(id)a3;
@end

@implementation VSFailableValueTransformer

- (NSValueTransformer)objectValueTransformer
{
  v2 = self->_objectValueTransformer;
  if (!v2) {
    v2 = (NSValueTransformer *)objc_alloc_init(MEMORY[0x1E4F29248]);
  }

  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E4F1CA00];
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        [v7 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, value was %@, instead of VSFailable.", v9 format];
      }
      id v10 = v6;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __47__VSFailableValueTransformer_transformedValue___block_invoke;
      v18[3] = &unk_1E6BD3558;
      v18[4] = self;
      v18[5] = &v19;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__VSFailableValueTransformer_transformedValue___block_invoke_2;
      v15[3] = &unk_1E6BD3580;
      v17 = &v19;
      id v11 = v10;
      id v16 = v11;
      [v11 unwrapObject:v18 error:v15];
    }
    v12 = (void *)v20[5];
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __47__VSFailableValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 objectValueTransformer];
  uint64_t v5 = [v8 transformedValue:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __47__VSFailableValueTransformer_transformedValue___block_invoke_2(uint64_t a1)
{
}

- (void)setObjectValueTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end