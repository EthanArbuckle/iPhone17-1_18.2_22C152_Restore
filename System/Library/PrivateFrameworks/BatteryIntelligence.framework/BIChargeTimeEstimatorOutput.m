@interface BIChargeTimeEstimatorOutput
+ (BOOL)supportsSecureCoding;
- (BIChargeTimeEstimatorOutput)initWithCoder:(id)a3;
- (double)confidenceScore;
- (double)estimate;
- (id)description;
- (int64_t)additionalInformation;
- (int64_t)endSOC;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInformation:(int64_t)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setEndSOC:(int64_t)a3;
- (void)setEstimate:(double)a3;
@end

@implementation BIChargeTimeEstimatorOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double estimate = self->_estimate;
  id v5 = a3;
  [v5 encodeDouble:@"estimate" forKey:estimate];
  [v5 encodeInteger:self->_endSOC forKey:@"endSOC"];
  [v5 encodeDouble:@"confidenceScore" forKey:self->_confidenceScore];
  [v5 encodeInteger:self->_additionalInformation forKey:@"additionalInformation"];
}

- (BIChargeTimeEstimatorOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BIChargeTimeEstimatorOutput;
  id v5 = [(BIChargeTimeEstimatorOutput *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"estimate"];
    v5->_double estimate = v6;
    v5->_endSOC = [v4 decodeIntegerForKey:@"endSOC"];
    [v4 decodeDoubleForKey:@"confidenceScore"];
    v5->_confidenceScore = v7;
    v5->_additionalInformation = [v4 decodeIntegerForKey:@"additionalInformation"];
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ChargeTimeEstimatorOutput: estimate: %.02f, endSOC: %ld, confidenceScore: %.02f, additionalInformation: %ld>", *(void *)&self->_estimate, self->_endSOC, *(void *)&self->_confidenceScore, self->_additionalInformation];
}

- (double)estimate
{
  return self->_estimate;
}

- (void)setEstimate:(double)a3
{
  self->_double estimate = a3;
}

- (int64_t)endSOC
{
  return self->_endSOC;
}

- (void)setEndSOC:(int64_t)a3
{
  self->_endSOC = a3;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  self->_confidenceScore = a3;
}

- (int64_t)additionalInformation
{
  return self->_additionalInformation;
}

- (void)setAdditionalInformation:(int64_t)a3
{
  self->_additionalInformation = a3;
}

@end