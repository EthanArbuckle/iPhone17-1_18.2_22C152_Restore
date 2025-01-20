@interface JEHLSRollItem
- (BOOL)containsOverallPosition:(unint64_t)a3;
- (JEHLSRollItem)initWithStartOverallPosition:(unint64_t)a3 duration:(unint64_t)a4 metricsData:(id)a5;
- (unint64_t)duration;
- (unint64_t)endOverallPosition;
- (void)setDuration:(unint64_t)a3;
@end

@implementation JEHLSRollItem

- (JEHLSRollItem)initWithStartOverallPosition:(unint64_t)a3 duration:(unint64_t)a4 metricsData:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)JEHLSRollItem;
  v6 = [(JEHLSItem *)&v9 initWithStartOverallPosition:a3 metricsData:a5];
  v7 = v6;
  if (v6) {
    [(JEHLSRollItem *)v6 setDuration:a4];
  }
  return v7;
}

- (unint64_t)endOverallPosition
{
  unint64_t v3 = [(JEHLSItem *)self startOverallPosition];
  return [(JEHLSRollItem *)self duration] + v3;
}

- (BOOL)containsOverallPosition:(unint64_t)a3
{
  return [(JEHLSItem *)self startOverallPosition] <= a3
      && [(JEHLSRollItem *)self endOverallPosition] > a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

@end