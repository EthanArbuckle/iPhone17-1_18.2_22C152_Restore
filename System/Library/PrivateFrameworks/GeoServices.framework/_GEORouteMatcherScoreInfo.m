@interface _GEORouteMatcherScoreInfo
+ (id)doNotMatchToThisSegmentWithType:(uint64_t)a1;
+ (id)ignoredWithType:(uint64_t)a1;
+ (id)infoWithType:(uint64_t)a3 score:(uint64_t)a4 weight:;
- (id)_typeString;
- (id)debugDescription;
@end

@implementation _GEORouteMatcherScoreInfo

+ (id)infoWithType:(uint64_t)a3 score:(uint64_t)a4 weight:
{
  self;
  uint64_t v7 = objc_opt_new();
  *(void *)(v7 + 8) = a4;
  *(double *)(v7 + 16) = a1;
  *(double *)(v7 + 24) = a2;

  return (id)v7;
}

+ (id)ignoredWithType:(uint64_t)a1
{
  self;

  return +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](0.0, 0.0, (uint64_t)_GEORouteMatcherScoreInfo, a2);
}

+ (id)doNotMatchToThisSegmentWithType:(uint64_t)a1
{
  self;

  return +[_GEORouteMatcherScoreInfo infoWithType:score:weight:](-10000.0, 10000.0, (uint64_t)_GEORouteMatcherScoreInfo, a2);
}

- (id)_typeString
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 6) {
    return @"None";
  }
  else {
    return off_1E53EB5F8[v2];
  }
}

- (id)debugDescription
{
  unint64_t v2 = NSString;
  if (self)
  {
    double rawScore = self->_rawScore;
    double weight = self->_weight;
    double v5 = rawScore * weight;
  }
  else
  {
    double rawScore = MEMORY[0x10];
    double weight = MEMORY[0x18];
    double v5 = 0.0;
  }
  v6 = [(_GEORouteMatcherScoreInfo *)self _typeString];
  uint64_t v7 = [v2 stringWithFormat:@"Score: %0.2f | Raw: %0.2f | Weight: %0.2f | (%@)", *(void *)&v5, *(void *)&rawScore, *(void *)&weight, v6];

  return v7;
}

@end