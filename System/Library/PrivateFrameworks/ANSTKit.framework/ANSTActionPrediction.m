@interface ANSTActionPrediction
- (ANSTActionPrediction)initWithAction:(unint64_t)a3;
- (float)confidence;
- (id)description;
- (unint64_t)action;
- (void)setConfidence:(float)a3;
@end

@implementation ANSTActionPrediction

- (ANSTActionPrediction)initWithAction:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ANSTActionPrediction;
  result = [(ANSTActionPrediction *)&v5 init];
  if (result)
  {
    result->_action = a3;
    result->_confidence = 0.0;
  }
  return result;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (id)description
{
  v3 = NSString;
  v4 = ANSTActionToNSString(self->_action);
  v6 = objc_msgSend_stringWithFormat_(v3, v5, @"(%@, %f)", v4, self->_confidence);

  return v6;
}

- (unint64_t)action
{
  return self->_action;
}

- (float)confidence
{
  return self->_confidence;
}

@end