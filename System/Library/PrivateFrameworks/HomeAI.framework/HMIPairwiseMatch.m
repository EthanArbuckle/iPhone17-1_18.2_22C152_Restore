@interface HMIPairwiseMatch
- (HMIPairwiseMatch)initWithFirstIndex:(unint64_t)a3 secondIndex:(unint64_t)a4 score:(float)a5;
- (float)score;
- (unint64_t)firstIndex;
- (unint64_t)secondIndex;
@end

@implementation HMIPairwiseMatch

- (HMIPairwiseMatch)initWithFirstIndex:(unint64_t)a3 secondIndex:(unint64_t)a4 score:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMIPairwiseMatch;
  result = [(HMIPairwiseMatch *)&v9 init];
  if (result)
  {
    result->_firstIndex = a3;
    result->_secondIndex = a4;
    result->_score = a5;
  }
  return result;
}

- (unint64_t)firstIndex
{
  return self->_firstIndex;
}

- (unint64_t)secondIndex
{
  return self->_secondIndex;
}

- (float)score
{
  return self->_score;
}

@end