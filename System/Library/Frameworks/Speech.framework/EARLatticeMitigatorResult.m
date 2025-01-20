@interface EARLatticeMitigatorResult
+ (BOOL)supportsSecureCoding;
- (BOOL)processed;
- (EARLatticeMitigatorResult)initWithCoder:(id)a3;
- (EARLatticeMitigatorResult)initWithLatticeMitigatorResult:(id)a3;
- (NSString)version;
- (float)calibrationOffset;
- (float)calibrationScale;
- (float)score;
- (float)threshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARLatticeMitigatorResult

- (void).cxx_destruct
{
}

- (BOOL)processed
{
  return self->_processed;
}

- (float)calibrationOffset
{
  return self->_calibrationOffset;
}

- (float)calibrationScale
{
  return self->_calibrationScale;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)score
{
  return self->_score;
}

- (NSString)version
{
  return self->_version;
}

- (EARLatticeMitigatorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARLatticeMitigatorResult;
  v5 = [(EARLatticeMitigatorResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    [v4 decodeFloatForKey:@"score"];
    v5->_score = v8;
    [v4 decodeFloatForKey:@"threshold"];
    v5->_threshold = v9;
    [v4 decodeFloatForKey:@"calibrationScale"];
    v5->_calibrationScale = v10;
    [v4 decodeFloatForKey:@"calibrationOffset"];
    v5->_calibrationOffset = v11;
    v5->_processed = [v4 decodeBoolForKey:@"processed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v9 = a3;
  [v9 encodeObject:version forKey:@"version"];
  *(float *)&double v5 = self->_score;
  [v9 encodeFloat:@"score" forKey:v5];
  *(float *)&double v6 = self->_threshold;
  [v9 encodeFloat:@"threshold" forKey:v6];
  *(float *)&double v7 = self->_calibrationScale;
  [v9 encodeFloat:@"calibrationScale" forKey:v7];
  *(float *)&double v8 = self->_calibrationOffset;
  [v9 encodeFloat:@"calibrationOffset" forKey:v8];
  [v9 encodeBool:self->_processed forKey:@"processed"];
}

- (EARLatticeMitigatorResult)initWithLatticeMitigatorResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)EARLatticeMitigatorResult;
    double v5 = [(EARLatticeMitigatorResult *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 version];
      version = v5->_version;
      v5->_version = (NSString *)v6;

      [v4 score];
      v5->_score = v8;
      [v4 threshold];
      v5->_threshold = v9;
      [v4 calibrationScale];
      v5->_calibrationScale = v10;
      [v4 calibrationOffset];
      v5->_calibrationOffset = v11;
      v5->_processed = [v4 processed];
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end