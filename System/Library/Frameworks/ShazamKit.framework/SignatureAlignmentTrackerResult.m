@interface SignatureAlignmentTrackerResult
- (SignatureAlignmentTrackerResult)initWithQueryStart:(double)a3 queryEnd:(double)a4 referenceStart:(double)a5 referenceEnd:(double)a6 confidence:(float)a7;
- (double)queryEnd;
- (double)queryStart;
- (double)referenceEnd;
- (double)referenceStart;
- (float)confidence;
@end

@implementation SignatureAlignmentTrackerResult

- (SignatureAlignmentTrackerResult)initWithQueryStart:(double)a3 queryEnd:(double)a4 referenceStart:(double)a5 referenceEnd:(double)a6 confidence:(float)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SignatureAlignmentTrackerResult;
  result = [(SignatureAlignmentTrackerResult *)&v13 init];
  if (result)
  {
    result->_queryStart = a3;
    result->_queryEnd = a4;
    result->_referenceStart = a5;
    result->_referenceEnd = a6;
    result->_confidence = a7;
  }
  return result;
}

- (double)queryStart
{
  return self->_queryStart;
}

- (double)queryEnd
{
  return self->_queryEnd;
}

- (double)referenceStart
{
  return self->_referenceStart;
}

- (double)referenceEnd
{
  return self->_referenceEnd;
}

- (float)confidence
{
  return self->_confidence;
}

@end