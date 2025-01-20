@interface HMMIntervalMapper
+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3;
+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3;
- (id)intervalForValue:(unint64_t)a3;
- (id)intervalIndexForValue:(unint64_t)a3;
@end

@implementation HMMIntervalMapper

- (id)intervalForValue:(unint64_t)a3
{
  return 0;
}

- (id)intervalIndexForValue:(unint64_t)a3
{
  return 0;
}

+ (id)unsignedClosedOpenFixedIntervalMapper:(id)a3
{
  id v3 = a3;
  v4 = [[UnsignedFixedIntervalMapper alloc] initWithBins:v3 intervalCreationBlock:&__block_literal_global_99 valueComparisonBlock:&__block_literal_global_101];

  return v4;
}

BOOL __59__HMMIntervalMapper_unsignedClosedOpenFixedIntervalMapper___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  return [a3 unsignedIntValue] > a2;
}

id __59__HMMIntervalMapper_unsignedClosedOpenFixedIntervalMapper___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HMMInterval closedOpenIntervalFromStart:a2 toEnd:a3];
}

+ (id)unsignedOpenClosedFixedIntervalMapper:(id)a3
{
  id v3 = a3;
  v4 = [[UnsignedFixedIntervalMapper alloc] initWithBins:v3 intervalCreationBlock:&__block_literal_global valueComparisonBlock:&__block_literal_global_96];

  return v4;
}

BOOL __59__HMMIntervalMapper_unsignedOpenClosedFixedIntervalMapper___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  return [a3 unsignedIntValue] >= a2;
}

id __59__HMMIntervalMapper_unsignedOpenClosedFixedIntervalMapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = +[HMMInterval positiveInfinityEnd];
  int v7 = [v4 isEqual:v6];

  if (v7) {
    +[HMMInterval openOpenIntervalFromStart:v5 toEnd:v4];
  }
  else {
  v8 = +[HMMInterval openClosedIntervalFromStart:v5 toEnd:v4];
  }

  return v8;
}

@end