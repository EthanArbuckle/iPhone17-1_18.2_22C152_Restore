@interface SGQuickResponsesClassScore
- (SGQuickResponsesClassScore)initWithValue:(double)a3 index:(unint64_t)a4;
- (double)value;
- (int64_t)compare:(id)a3;
- (unint64_t)index;
@end

@implementation SGQuickResponsesClassScore

- (unint64_t)index
{
  return self->_index;
}

- (double)value
{
  return self->_value;
}

- (int64_t)compare:(id)a3
{
  [a3 value];
  double value = self->_value;
  int64_t v6 = -1;
  if (value >= v4) {
    int64_t v6 = 1;
  }
  if (value == v4) {
    return 0;
  }
  else {
    return v6;
  }
}

- (SGQuickResponsesClassScore)initWithValue:(double)a3 index:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SGQuickResponsesClassScore;
  result = [(SGQuickResponsesClassScore *)&v7 init];
  if (result)
  {
    result->_double value = a3;
    result->_index = a4;
  }
  return result;
}

@end