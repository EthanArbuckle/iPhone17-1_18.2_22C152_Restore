@interface ATXGroupHistogramEntry
- (ATXGroupHistogramEntry)initWithScore:(double)a3;
- (double)score;
- (int)count;
- (void)addScore:(double)a3;
@end

@implementation ATXGroupHistogramEntry

- (ATXGroupHistogramEntry)initWithScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXGroupHistogramEntry;
  result = [(ATXGroupHistogramEntry *)&v5 init];
  if (result)
  {
    result->_score = a3;
    result->_count = 1;
  }
  return result;
}

- (void)addScore:(double)a3
{
  self->_score = self->_score + a3;
  ++self->_count;
}

- (int)count
{
  return self->_count;
}

- (double)score
{
  return self->_score;
}

@end