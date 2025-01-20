@interface NLv4EmbeddingTensor
- (NLv4EmbeddingTensor)init;
- (NSArray)values;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setValues:(id)a3;
@end

@implementation NLv4EmbeddingTensor

- (void).cxx_destruct
{
}

- (void)setValues:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->_values copy];
    v6 = (void *)v4[1];
    v4[1] = v5;
  }
  return v4;
}

- (NLv4EmbeddingTensor)init
{
  v6.receiver = self;
  v6.super_class = (Class)NLv4EmbeddingTensor;
  v2 = [(NLv4EmbeddingTensor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    values = v2->_values;
    v2->_values = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

@end