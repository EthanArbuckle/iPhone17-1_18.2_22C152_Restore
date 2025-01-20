@interface _CDPSimpleModelParameterManagerTuningValue
+ (BOOL)supportsSecureCoding;
- (_CDPSimpleModelParameterManagerTuningValue)initWithCoder:(id)a3;
- (_CDPSimpleModelParameterManagerTuningValue)initWithLambda:(float)a3 w0:(float)a4 threshold:(float)a5 score:(float)a6;
- (float)lambda;
- (float)score;
- (float)threshold;
- (float)w0;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CDPSimpleModelParameterManagerTuningValue

- (_CDPSimpleModelParameterManagerTuningValue)initWithLambda:(float)a3 w0:(float)a4 threshold:(float)a5 score:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_CDPSimpleModelParameterManagerTuningValue;
  result = [(_CDPSimpleModelParameterManagerTuningValue *)&v11 init];
  result->_lambda = a3;
  result->_w0 = a4;
  result->_threshold = a5;
  result->_score = a6;
  return result;
}

- (_CDPSimpleModelParameterManagerTuningValue)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"lambda"];
  int v6 = v5;
  [v4 decodeFloatForKey:@"w0"];
  int v8 = v7;
  [v4 decodeFloatForKey:@"threshold"];
  int v10 = v9;
  [v4 decodeFloatForKey:@"score"];
  int v12 = v11;

  LODWORD(v13) = v6;
  LODWORD(v14) = v8;
  LODWORD(v15) = v10;
  LODWORD(v16) = v12;
  return [(_CDPSimpleModelParameterManagerTuningValue *)self initWithLambda:v13 w0:v14 threshold:v15 score:v16];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%p: lambda=%g, w0=%g, t=%g, s=%g>", self, self->_lambda, self->_w0, self->_threshold, self->_score];
}

- (void)encodeWithCoder:(id)a3
{
  float lambda = self->_lambda;
  id v9 = a3;
  *(float *)&double v5 = lambda;
  [v9 encodeFloat:@"lambda" forKey:v5];
  *(float *)&double v6 = self->_w0;
  [v9 encodeFloat:@"w0" forKey:v6];
  *(float *)&double v7 = self->_threshold;
  [v9 encodeFloat:@"threshold" forKey:v7];
  *(float *)&double v8 = self->_score;
  [v9 encodeFloat:@"score" forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)lambda
{
  return self->_lambda;
}

- (float)w0
{
  return self->_w0;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)score
{
  return self->_score;
}

@end