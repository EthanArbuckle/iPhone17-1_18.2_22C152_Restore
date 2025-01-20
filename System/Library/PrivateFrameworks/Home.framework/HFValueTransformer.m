@interface HFValueTransformer
+ (id)identityTransformer;
+ (id)transformerForValueClass:(Class)a3 transformBlock:(id)a4 reverseTransformBlock:(id)a5;
- (Class)valueClass;
- (id)reverseTransformBlock;
- (id)transformBlock;
- (id)transformedValueForValue:(id)a3;
- (id)valueForTransformedValue:(id)a3;
- (void)setReverseTransformBlock:(id)a3;
- (void)setTransformBlock:(id)a3;
- (void)setValueClass:(Class)a3;
@end

@implementation HFValueTransformer

- (id)transformedValueForValue:(id)a3
{
  id v4 = a3;
  if ([(HFValueTransformer *)self valueClass])
  {
    [(HFValueTransformer *)self valueClass];
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v4 = v6;
  }
  v7 = [(HFValueTransformer *)self transformBlock];
  v8 = ((void (**)(void, id))v7)[2](v7, v4);

  return v8;
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

+ (id)transformerForValueClass:(Class)a3 transformBlock:(id)a4 reverseTransformBlock:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HFValueTransformer.m", 25, @"Invalid parameter not satisfying: %@", @"transformBlock" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"HFValueTransformer.m", 26, @"Invalid parameter not satisfying: %@", @"reverseTransformBlock" object file lineNumber description];

LABEL_3:
  v12 = objc_opt_new();
  [v12 setValueClass:a3];
  [v12 setTransformBlock:v9];
  [v12 setReverseTransformBlock:v11];

  return v12;
}

- (void)setValueClass:(Class)a3
{
}

- (void)setTransformBlock:(id)a3
{
}

- (void)setReverseTransformBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformBlock, 0);
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_valueClass, 0);
}

+ (id)identityTransformer
{
  v2 = objc_opt_new();
  [v2 setTransformBlock:&__block_literal_global_186];
  [v2 setReverseTransformBlock:&__block_literal_global_13_8];
  return v2;
}

id __41__HFValueTransformer_identityTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __41__HFValueTransformer_identityTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)valueForTransformedValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HFValueTransformer *)self reverseTransformBlock];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)reverseTransformBlock
{
  return self->_reverseTransformBlock;
}

@end