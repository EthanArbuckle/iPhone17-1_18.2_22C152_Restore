@interface VSBlockBasedValueTransformer
- (VSBlockBasedValueTransformer)init;
- (id)reverseTransformationBlock;
- (id)reverseTransformedValue:(id)a3;
- (id)transformationBlock;
- (id)transformedValue:(id)a3;
- (void)setReverseTransformationBlock:(id)a3;
- (void)setTransformationBlock:(id)a3;
@end

@implementation VSBlockBasedValueTransformer

- (VSBlockBasedValueTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSBlockBasedValueTransformer;
  v2 = [(VSBlockBasedValueTransformer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [&__block_literal_global_45 copy];
    id transformationBlock = v2->_transformationBlock;
    v2->_id transformationBlock = (id)v3;
  }
  return v2;
}

id __36__VSBlockBasedValueTransformer_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = [(VSBlockBasedValueTransformer *)self transformationBlock];
  objc_super v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  v5 = [(VSBlockBasedValueTransformer *)self reverseTransformationBlock];
  objc_super v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
}

- (id)reverseTransformationBlock
{
  return self->_reverseTransformationBlock;
}

- (void)setReverseTransformationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformationBlock, 0);

  objc_storeStrong(&self->_transformationBlock, 0);
}

@end