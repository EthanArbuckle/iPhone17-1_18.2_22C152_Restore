@interface GKShuffledDistribution
- (GKShuffledDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5;
- (GKShuffledDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5 delta:(int64_t)a6;
- (float)uniformDistance;
- (int64_t)nextInt;
- (void)dealloc;
- (void)setUniformDistance:(float)a3;
@end

@implementation GKShuffledDistribution

- (float)uniformDistance
{
  return self->_uniformDistance;
}

- (void)setUniformDistance:(float)a3
{
  self->_uniformDistance = fminf(fmaxf(a3, 0.0), 1.0);
  NSInteger v4 = [(GKRandomDistribution *)self highestValue];
  self->_delta = (uint64_t)(float)(self->_uniformDistance
                                * (float)(v4 - [(GKRandomDistribution *)self lowestValue] + 1));
}

- (GKShuffledDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GKShuffledDistribution;
  result = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](&v9, sel_initWithRandomSource_lowestValue_highestValue_, a3);
  if (result)
  {
    result->_uniformDistance = 1.0;
    float v8 = (float)(a5 - a4 + 1);
    result->_delta = (uint64_t)v8;
    result->_lastInt = a4 - (uint64_t)v8;
    result->_nextIntsCapacity = 0;
    result->_nextInts = 0;
  }
  return result;
}

- (GKShuffledDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5 delta:(int64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)GKShuffledDistribution;
  result = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](&v10, sel_initWithRandomSource_lowestValue_highestValue_, a3);
  if (result)
  {
    result->_delta = a6;
    result->_uniformDistance = (float)a6 / (float)(a5 - a4 + 1);
    result->_lastInt = a4 - a6;
    result->_nextIntsCapacity = 0;
    result->_nextInts = 0;
  }
  return result;
}

- (void)dealloc
{
  nextInts = self->_nextInts;
  if (nextInts) {
    free(nextInts);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKShuffledDistribution;
  [(GKShuffledDistribution *)&v4 dealloc];
}

- (int64_t)nextInt
{
  if (self->_uniformDistance >= 0.95)
  {
    int64_t nextIntsCount = self->_nextIntsCount;
    if (nextIntsCount)
    {
      nextInts = self->_nextInts;
LABEL_18:
      self->_int64_t nextIntsCount = nextIntsCount - 1;
      int64_t result = nextInts[nextIntsCount - 1];
      goto LABEL_19;
    }
    int64_t nextIntsCount = self->_nextIntsCapacity;
    if (nextIntsCount)
    {
      if (nextIntsCount > 0) {
        goto LABEL_10;
      }
    }
    else
    {
      NSInteger v12 = [(GKRandomDistribution *)self highestValue];
      int64_t v13 = v12 - [(GKRandomDistribution *)self lowestValue] + 1;
      self->_nextIntsCapacity = v13;
      v14 = (int64_t *)malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
      self->_nextInts = v14;
      bzero(v14, self->_nextIntsCapacity);
      int64_t nextIntsCount = self->_nextIntsCapacity;
      if (nextIntsCount > 0)
      {
LABEL_10:
        uint64_t v7 = 0;
        do
        {
          int64_t v9 = v7 + 1;
          uint64_t v10 = [(GKRandom *)self->super._source nextIntWithUpperBound:v7 + 1];
          uint64_t v11 = v10;
          if (v7 != v10) {
            self->_nextInts[v7] = self->_nextInts[v10];
          }
          NSInteger v8 = [(GKRandomDistribution *)self lowestValue];
          nextInts = self->_nextInts;
          nextInts[v11] = v8 + v7;
          int64_t nextIntsCount = self->_nextIntsCapacity;
          ++v7;
        }
        while (v9 < nextIntsCount);
        goto LABEL_16;
      }
    }
    nextInts = self->_nextInts;
LABEL_16:
    v15 = &nextInts[nextIntsCount];
    if (*(v15 - 1) == self->_lastInt)
    {
      *(v15 - 1) = *nextInts;
      int64_t *nextInts = self->_lastInt;
      int64_t nextIntsCount = self->_nextIntsCapacity;
    }
    goto LABEL_18;
  }
  do
  {
    v16.receiver = self;
    v16.super_class = (Class)GKShuffledDistribution;
    int64_t result = [(GKRandomDistribution *)&v16 nextInt];
    int64_t v4 = self->_lastInt - result;
    if (v4 < 0) {
      int64_t v4 = result - self->_lastInt;
    }
  }
  while (v4 < self->_delta);
LABEL_19:
  self->_lastInt = result;
  return result;
}

@end