@interface AFSpeechLatticeMitigatorResult
+ (BOOL)supportsSecureCoding;
- (AFSpeechLatticeMitigatorResult)initWithCoder:(id)a3;
- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5;
- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7;
- (NSString)version;
- (float)calibrationOffset;
- (float)calibrationScale;
- (float)score;
- (float)threshold;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechLatticeMitigatorResult

- (void).cxx_destruct
{
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

- (id)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"version";
  v3 = (void *)[(NSString *)self->_version copy];
  v11[0] = v3;
  v10[1] = @"score";
  *(float *)&double v4 = self->_score;
  v5 = [MEMORY[0x1E4F28ED0] numberWithFloat:v4];
  v11[1] = v5;
  v10[2] = @"threshold";
  *(float *)&double v6 = self->_threshold;
  v7 = [MEMORY[0x1E4F28ED0] numberWithFloat:v6];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v13 = [(AFSpeechLatticeMitigatorResult *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    version = v13->_version;
    v13->_version = (NSString *)v14;

    v13->_score = a4;
    v13->_threshold = a5;
    v13->_calibrationScale = a6;
    v13->_calibrationOffset = a7;
  }

  return v13;
}

- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v9 = [(AFSpeechLatticeMitigatorResult *)&v15 init];
  if (v9)
  {
    LODWORD(v12) = 1.0;
    *(float *)&double v10 = a4;
    *(float *)&double v11 = a5;
    v13 = [(AFSpeechLatticeMitigatorResult *)v9 initWithResults:v8 score:v10 threshold:v11 calibrationScale:v12 calibrationOffset:0.0];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (AFSpeechLatticeMitigatorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v5 = [(AFSpeechLatticeMitigatorResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    [v4 decodeFloatForKey:@"_score"];
    v5->_score = v8;
    [v4 decodeFloatForKey:@"_threshold"];
    v5->_threshold = v9;
    [v4 decodeFloatForKey:@"_calibrationScale"];
    v5->_calibrationScale = v10;
    [v4 decodeFloatForKey:@"_calibrationOffset"];
    v5->_calibrationOffset = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v9 = a3;
  [v9 encodeObject:version forKey:@"_version"];
  *(float *)&double v5 = self->_score;
  [v9 encodeFloat:@"_score" forKey:v5];
  *(float *)&double v6 = self->_threshold;
  [v9 encodeFloat:@"_threshold" forKey:v6];
  *(float *)&double v7 = self->_calibrationScale;
  [v9 encodeFloat:@"_calibrationScale" forKey:v7];
  *(float *)&double v8 = self->_calibrationOffset;
  [v9 encodeFloat:@"_calibrationOffset" forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end