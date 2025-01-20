@interface JEHLSItem
+ (id)comparator;
- (JEHLSItem)initWithStartOverallPosition:(unint64_t)a3 metricsData:(id)a4;
- (NSArray)eventData;
- (int64_t)compare:(id)a3;
- (unint64_t)startOverallPosition;
- (unint64_t)startPosition;
- (void)setEventData:(id)a3;
- (void)setStartOverallPosition:(unint64_t)a3;
- (void)setStartPosition:(unint64_t)a3;
@end

@implementation JEHLSItem

- (JEHLSItem)initWithStartOverallPosition:(unint64_t)a3 metricsData:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)JEHLSItem;
  v7 = [(JEHLSItem *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(JEHLSItem *)v7 setStartOverallPosition:a3];
    [(JEHLSItem *)v8 setEventData:v6];
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(JEHLSItem *)self startOverallPosition];
  if (v5 == [v4 startOverallPosition])
  {
    int64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = [(JEHLSItem *)self startOverallPosition];
    if (v7 < [v4 startOverallPosition]) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

+ (id)comparator
{
  return &__block_literal_global_0;
}

uint64_t __23__JEHLSItem_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 startOverallPosition];
  if (v6 == [v5 startOverallPosition])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [v4 startOverallPosition];
    if (v8 < [v5 startOverallPosition]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (unint64_t)startOverallPosition
{
  return self->_startOverallPosition;
}

- (void)setStartOverallPosition:(unint64_t)a3
{
  self->_startOverallPosition = a3;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end