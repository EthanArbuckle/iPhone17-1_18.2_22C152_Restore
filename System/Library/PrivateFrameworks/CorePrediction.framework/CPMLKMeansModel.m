@interface CPMLKMeansModel
- (id)betweenss;
- (id)centers;
- (id)cluster;
- (id)iter;
- (id)size;
- (id)totalWithinss;
- (id)totss;
- (id)withinss;
@end

@implementation CPMLKMeansModel

- (id)cluster
{
  v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->super._mData + 4);
  if ((unint64_t)(v4 + 6) >= 7)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = [NSNumber numberWithUnsignedLongLong:*((void *)self->super._mData + v5 + 6)];
      [v3 addObject:v6];

      ++v5;
    }
    while (v4 != v5);
  }

  return v3;
}

- (id)centers
{
  id v13 = (id)objc_opt_new();
  mData = self->super._mData;
  uint64_t v12 = mData[2];
  if (v12)
  {
    uint64_t v4 = 0;
    uint64_t v5 = mData[3];
    unint64_t v6 = 8 * (unint64_t)self->super._realBase[3];
    do
    {
      v7 = objc_opt_new();
      unint64_t v8 = v6;
      for (uint64_t i = v5; i; --i)
      {
        v10 = [NSNumber numberWithDouble:*(double *)((char *)self->super._realBase + v8)];
        [v7 addObject:v10];

        v8 += 8;
      }
      [v13 addObject:v7];

      ++v4;
      v6 += 8 * v5;
    }
    while (v4 != v12);
  }

  return v13;
}

- (id)totss
{
  return (id)[NSNumber numberWithDouble:self->super._realBase[2]];
}

- (id)withinss
{
  v3 = objc_opt_new();
  uint64_t v4 = *((void *)self->super._mData + 2);
  if (v4)
  {
    unint64_t v5 = (unint64_t)self->super._realBase[4];
    do
    {
      unint64_t v6 = [NSNumber numberWithDouble:self->super._realBase[v5]];
      [v3 addObject:v6];

      ++v5;
      --v4;
    }
    while (v4);
  }

  return v3;
}

- (id)totalWithinss
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(CPMLKMeansModel *)self withinss];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) doubleValue];
        double v6 = v6 + v8;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }
  v9 = [NSNumber numberWithDouble:v6];

  return v9;
}

- (id)betweenss
{
  uint64_t v3 = [(CPMLKMeansModel *)self totss];
  [v3 doubleValue];
  double v5 = v4;
  double v6 = [(CPMLKMeansModel *)self totalWithinss];
  [v6 doubleValue];
  double v8 = v5 - v7;

  v9 = NSNumber;

  return (id)[v9 numberWithDouble:v8];
}

- (id)size
{
  uint64_t v3 = objc_opt_new();
  mData = self->super._mData;
  uint64_t v5 = mData[2];
  if (v5)
  {
    uint64_t v6 = 8 * mData[5];
    do
    {
      double v7 = [NSNumber numberWithUnsignedLongLong:*(void *)((char *)self->super._mData + v6)];
      [v3 addObject:v7];

      v6 += 8;
      --v5;
    }
    while (v5);
  }

  return v3;
}

- (id)iter
{
  return (id)[NSNumber numberWithUnsignedLongLong:*((void *)self->super._mData + 1)];
}

@end