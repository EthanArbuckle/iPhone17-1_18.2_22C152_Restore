@interface MPSGraphRandomOpDescriptor
+ (MPSGraphRandomOpDescriptor)descriptorWithDistribution:(MPSGraphRandomDistribution)distribution dataType:(MPSDataType)dataType;
- (MPSDataType)dataType;
- (MPSGraphRandomDistribution)distribution;
- (MPSGraphRandomNormalSamplingMethod)samplingMethod;
- (NSInteger)maxInteger;
- (NSInteger)minInteger;
- (float)max;
- (float)mean;
- (float)min;
- (float)standardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDataType:(MPSDataType)dataType;
- (void)setDistribution:(MPSGraphRandomDistribution)distribution;
- (void)setMax:(float)max;
- (void)setMaxInteger:(NSInteger)maxInteger;
- (void)setMean:(float)mean;
- (void)setMin:(float)min;
- (void)setMinInteger:(NSInteger)minInteger;
- (void)setSamplingMethod:(MPSGraphRandomNormalSamplingMethod)samplingMethod;
- (void)setStandardDeviation:(float)standardDeviation;
@end

@implementation MPSGraphRandomOpDescriptor

+ (MPSGraphRandomOpDescriptor)descriptorWithDistribution:(MPSGraphRandomDistribution)distribution dataType:(MPSDataType)dataType
{
  uint64_t v4 = *(void *)&dataType;
  if ((int)dataType <= 268435487)
  {
    if (dataType == MPSDataTypeBFloat16 || dataType == MPSDataTypeFloat16) {
      goto LABEL_10;
    }
  }
  else if (dataType == MPSDataTypeFloat32 || dataType == MPSDataTypeInt32 || dataType == MPSDataTypeInt64)
  {
    goto LABEL_10;
  }
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_10:
  v6 = objc_alloc_init(MPSGraphRandomOpDescriptor);
  [(MPSGraphRandomOpDescriptor *)v6 setDistribution:distribution];
  [(MPSGraphRandomOpDescriptor *)v6 setDataType:v4];
  [(MPSGraphRandomOpDescriptor *)v6 setSamplingMethod:0];
  [(MPSGraphRandomOpDescriptor *)v6 setMin:0.0];
  [(MPSGraphRandomOpDescriptor *)v6 setMinInteger:0];
  [(MPSGraphRandomOpDescriptor *)v6 setMax:0.0];
  [(MPSGraphRandomOpDescriptor *)v6 setMaxInteger:0];
  [(MPSGraphRandomOpDescriptor *)v6 setMean:0.0];
  [(MPSGraphRandomOpDescriptor *)v6 setStandardDeviation:0.0];
  if (distribution)
  {
    if (distribution != MPSGraphRandomDistributionNormal)
    {
      if (distribution != MPSGraphRandomDistributionTruncatedNormal) {
        goto LABEL_19;
      }
      LODWORD(v7) = -2.0;
      [(MPSGraphRandomOpDescriptor *)v6 setMin:v7];
      LODWORD(v8) = 2.0;
      [(MPSGraphRandomOpDescriptor *)v6 setMax:v8];
    }
    if (v4 != 268435472
      && v4 != 268435488
      && v4 != -1879048176
      && MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
    }
    [(MPSGraphRandomOpDescriptor *)v6 setMean:0.0];
    LODWORD(v9) = 1.0;
    [(MPSGraphRandomOpDescriptor *)v6 setStandardDeviation:v9];
  }
  else
  {
    [(MPSGraphRandomOpDescriptor *)v6 setMin:0.0];
    [(MPSGraphRandomOpDescriptor *)v6 setMinInteger:0];
    LODWORD(v10) = 1.0;
    [(MPSGraphRandomOpDescriptor *)v6 setMax:v10];
    [(MPSGraphRandomOpDescriptor *)v6 setMaxInteger:0x40000000];
  }
LABEL_19:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [MPSGraphRandomOpDescriptor alloc];
  [(MPSGraphRandomOpDescriptor *)v4 setDistribution:self->_distribution];
  [(MPSGraphRandomOpDescriptor *)v4 setDataType:self->_dataType];
  *(float *)&double v5 = self->_min;
  [(MPSGraphRandomOpDescriptor *)v4 setMin:v5];
  *(float *)&double v6 = self->_max;
  [(MPSGraphRandomOpDescriptor *)v4 setMax:v6];
  [(MPSGraphRandomOpDescriptor *)v4 setMinInteger:self->_minInteger];
  [(MPSGraphRandomOpDescriptor *)v4 setMaxInteger:self->_maxInteger];
  *(float *)&double v7 = self->_mean;
  [(MPSGraphRandomOpDescriptor *)v4 setMean:v7];
  *(float *)&double v8 = self->_standardDeviation;
  [(MPSGraphRandomOpDescriptor *)v4 setStandardDeviation:v8];
  return v4;
}

- (MPSGraphRandomDistribution)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(MPSGraphRandomDistribution)distribution
{
  self->_distribution = distribution;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_dataType = dataType;
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)min
{
  self->_min = min;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)max
{
  self->_max = max;
}

- (NSInteger)minInteger
{
  return self->_minInteger;
}

- (void)setMinInteger:(NSInteger)minInteger
{
  self->_minInteger = minInteger;
}

- (NSInteger)maxInteger
{
  return self->_maxInteger;
}

- (void)setMaxInteger:(NSInteger)maxInteger
{
  self->_maxInteger = maxInteger;
}

- (float)mean
{
  return self->_mean;
}

- (void)setMean:(float)mean
{
  self->_mean = mean;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(float)standardDeviation
{
  self->_standardDeviation = standardDeviation;
}

- (MPSGraphRandomNormalSamplingMethod)samplingMethod
{
  return self->_samplingMethod;
}

- (void)setSamplingMethod:(MPSGraphRandomNormalSamplingMethod)samplingMethod
{
  self->_samplingMethod = samplingMethod;
}

@end