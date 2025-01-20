@interface CSMyriadPHashFactors
- (CSMyriadPHashFactors)initWithHash:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7;
- (unint64_t)absTime;
- (unsigned)confidence;
- (unsigned)frac;
- (unsigned)goodness;
- (unsigned)hashValue;
@end

@implementation CSMyriadPHashFactors

- (unsigned)frac
{
  return self->_frac;
}

- (unint64_t)absTime
{
  return self->_absTime;
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (unsigned)goodness
{
  return self->_goodness;
}

- (unsigned)hashValue
{
  return self->_hashValue;
}

- (CSMyriadPHashFactors)initWithHash:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CSMyriadPHashFactors;
  result = [(CSMyriadPHashFactors *)&v13 init];
  if (result)
  {
    result->_hashValue = a3;
    result->_goodness = a4;
    result->_confidence = a5;
    result->_absTime = a6;
    result->_frac = a7;
  }
  return result;
}

@end