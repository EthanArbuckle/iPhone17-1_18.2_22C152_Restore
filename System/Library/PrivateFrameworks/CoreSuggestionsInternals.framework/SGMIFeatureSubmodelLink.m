@interface SGMIFeatureSubmodelLink
- (id)initFor:(int64_t)a3 fromUnigram:(int64_t)a4 andBigram:(int64_t)a5;
- (int64_t)bigramFeature;
- (int64_t)submodeledFeature;
- (int64_t)unigramFeature;
@end

@implementation SGMIFeatureSubmodelLink

- (int64_t)bigramFeature
{
  return self->_bigramFeature;
}

- (int64_t)unigramFeature
{
  return self->_unigramFeature;
}

- (int64_t)submodeledFeature
{
  return self->_submodeledFeature;
}

- (id)initFor:(int64_t)a3 fromUnigram:(int64_t)a4 andBigram:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SGMIFeatureSubmodelLink;
  id result = [(SGMIFeatureSubmodelLink *)&v9 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a5;
  }
  return result;
}

@end