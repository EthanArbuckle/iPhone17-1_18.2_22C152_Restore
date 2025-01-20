@interface MLLazyUnionBatchProvider
- (MLBatchProvider)first;
- (MLBatchProvider)second;
- (MLLazyUnionBatchProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4 error:(id *)a5;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation MLLazyUnionBatchProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);

  objc_storeStrong((id *)&self->_first, 0);
}

- (void)setSecond:(id)a3
{
}

- (MLBatchProvider)second
{
  return self->_second;
}

- (void)setFirst:(id)a3
{
}

- (MLBatchProvider)first
{
  return self->_first;
}

- (id)featuresAtIndex:(int64_t)a3
{
  v5 = -[MLBatchProvider featuresAtIndex:](self->_first, "featuresAtIndex:");
  v6 = [(MLBatchProvider *)self->_second featuresAtIndex:a3];
  v7 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v5 addedToFeaturesProvidedBy:v6];

  return v7;
}

- (int64_t)count
{
  return [(MLBatchProvider *)self->_first count];
}

- (MLLazyUnionBatchProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 count];
  if (v11 == [v10 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)MLLazyUnionBatchProvider;
    v12 = [(MLLazyUnionBatchProvider *)&v17 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_first, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    a5 = (id *)&self->super.isa;
  }
  else if (a5)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "count"));
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "count"));
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Cannot merge batch of size %@ with batch of size %@", v14, v15];

    a5 = 0;
  }

  return (MLLazyUnionBatchProvider *)a5;
}

@end