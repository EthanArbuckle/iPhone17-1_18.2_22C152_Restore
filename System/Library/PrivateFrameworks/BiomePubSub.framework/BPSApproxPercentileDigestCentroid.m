@interface BPSApproxPercentileDigestCentroid
- (BOOL)isEqual:(id)a3;
- (BPSApproxPercentileDigestCentroid)initWithMeanAndWeight:(float)a3 weight:(unsigned int)a4;
- (float)mean;
- (unint64_t)hash;
- (unsigned)weight;
- (void)setMean:(float)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation BPSApproxPercentileDigestCentroid

- (BPSApproxPercentileDigestCentroid)initWithMeanAndWeight:(float)a3 weight:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BPSApproxPercentileDigestCentroid;
  result = [(BPSApproxPercentileDigestCentroid *)&v7 init];
  if (result)
  {
    result->_mean = a3;
    result->_weight = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(BPSApproxPercentileDigestCentroid *)self mean];
    float v7 = v6;
    [v5 mean];
    float v9 = v8;
    unsigned int v10 = [(BPSApproxPercentileDigestCentroid *)self weight];
    int v11 = [v5 weight];

    BOOL v13 = v7 == v9 && v10 == v11;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_weight ^ LODWORD(self->_mean);
}

- (float)mean
{
  return self->_mean;
}

- (void)setMean:(float)a3
{
  self->_mean = a3;
}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

@end