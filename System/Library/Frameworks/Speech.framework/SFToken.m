@interface SFToken
- (NSString)text;
- (SFToken)initWithText:(id)a3 confidence:(double)a4 startTime:(double)a5 duration:(double)a6;
- (double)confidence;
- (double)duration;
- (double)startTime;
@end

@implementation SFToken

- (void).cxx_destruct
{
}

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)text
{
  return self->_text;
}

- (SFToken)initWithText:(id)a3 confidence:(double)a4 startTime:(double)a5 duration:(double)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFToken;
  v12 = [(SFToken *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    v13->_confidence = a4;
    v13->_startTime = a5;
    v13->_duration = a6;
  }

  return v13;
}

@end