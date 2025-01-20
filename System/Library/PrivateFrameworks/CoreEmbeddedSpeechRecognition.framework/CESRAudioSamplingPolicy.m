@interface CESRAudioSamplingPolicy
- (BOOL)isMatchedSamplingDimension:(id)a3;
- (CESRAudioSamplingPolicy)initWithRuleDimension:(id)a3 samplingRate:(id)a4 numDimension:(int64_t)a5;
- (CESRSamplingDimension)ruleDimension;
- (NSNumber)samplingRate;
- (id)description;
- (int64_t)numDimension;
@end

@implementation CESRAudioSamplingPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingRate, 0);

  objc_storeStrong((id *)&self->_ruleDimension, 0);
}

- (int64_t)numDimension
{
  return self->_numDimension;
}

- (NSNumber)samplingRate
{
  return self->_samplingRate;
}

- (CESRSamplingDimension)ruleDimension
{
  return self->_ruleDimension;
}

- (id)description
{
  v3 = NSString;
  v4 = [(CESRAudioSamplingPolicy *)self ruleDimension];
  v5 = [(CESRAudioSamplingPolicy *)self samplingRate];
  [v5 floatValue];
  v7 = [v3 stringWithFormat:@"< ruleDimension=%@, samplingRate=%.2f, numDimension=%zd >", v4, v6, -[CESRAudioSamplingPolicy numDimension](self, "numDimension")];

  return v7;
}

- (BOOL)isMatchedSamplingDimension:(id)a3
{
  return [(CESRSamplingDimension *)self->_ruleDimension matches:a3];
}

- (CESRAudioSamplingPolicy)initWithRuleDimension:(id)a3 samplingRate:(id)a4 numDimension:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CESRAudioSamplingPolicy;
  v11 = [(CESRAudioSamplingPolicy *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ruleDimension, a3);
    objc_storeStrong((id *)&v12->_samplingRate, a4);
    v12->_numDimension = a5;
  }

  return v12;
}

@end