@interface CSUTokenEmbedding
- (MLMultiArray)embedding;
- (void)setEmbedding:(id)a3;
@end

@implementation CSUTokenEmbedding

- (MLMultiArray)embedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEmbedding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end