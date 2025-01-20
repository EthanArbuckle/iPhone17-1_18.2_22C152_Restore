@interface BPSAggregations
+ (id)approxPercentile;
+ (id)approxPercentileWithDigestCapacity:(unint64_t)a3;
+ (id)approximateDistinctCount;
+ (id)avg;
+ (id)count;
+ (id)max;
+ (id)min;
+ (id)sum;
@end

@implementation BPSAggregations

+ (id)min
{
  v2 = [[BPSAggregator alloc] initWithAccumulator:0 closure:&__block_literal_global_6];
  return v2;
}

id __22__BPSAggregations_min__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = NSNumber;
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    if (v8 < *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    id v10 = [v6 numberWithFloat:v9];
  }
  else
  {
    id v10 = v4;
  }
  v11 = v10;

  return v11;
}

+ (id)max
{
  v2 = [[BPSAggregator alloc] initWithAccumulator:0 closure:&__block_literal_global_19];
  return v2;
}

id __22__BPSAggregations_max__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = NSNumber;
    [a2 floatValue];
    float v8 = v7;
    [v5 floatValue];
    if (v8 >= *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    id v10 = [v6 numberWithFloat:v9];
  }
  else
  {
    id v10 = v4;
  }
  v11 = v10;

  return v11;
}

+ (id)count
{
  v2 = [[BPSAggregator alloc] initWithAccumulator:&unk_1F040EE38 closure:&__block_literal_global_21];
  return v2;
}

uint64_t __24__BPSAggregations_count__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue] + 1;
  return [v2 numberWithInteger:v3];
}

+ (id)sum
{
  v2 = [[BPSAggregator alloc] initWithAccumulator:&unk_1F040EE38 closure:&__block_literal_global_24];
  return v2;
}

uint64_t __22__BPSAggregations_sum__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 floatValue];
  float v7 = v6;
  [v5 floatValue];
  float v9 = v8;

  *(float *)&double v10 = v7 + v9;
  return [v4 numberWithFloat:v10];
}

+ (id)avg
{
  v2 = [[BPSTuple alloc] initWithFirst:&unk_1F040EE38 second:&unk_1F040EE38];
  uint64_t v3 = [[BPSAggregator alloc] initWithAccumulator:v2 closure:&__block_literal_global_28];

  return v3;
}

BPSTuple *__22__BPSAggregations_avg__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  float v6 = [v5 first];
  [v6 floatValue];
  float v8 = v7;

  float v9 = [v5 second];

  uint64_t v10 = [v9 integerValue];
  [v4 floatValue];
  float v12 = v11;

  float v13 = v12 + (float)((float)v10++ * v8);
  float v14 = v13 / (float)v10;
  v15 = [BPSTuple alloc];
  *(float *)&double v16 = v14;
  v17 = [NSNumber numberWithFloat:v16];
  v18 = [NSNumber numberWithInteger:v10];
  v19 = [(BPSTuple *)v15 initWithFirst:v17 second:v18];

  return v19;
}

+ (id)approxPercentile
{
  v2 = [BPSAggregator alloc];
  uint64_t v3 = [[BPSApproxPercentileDigest alloc] initWithCapacity:50];
  id v4 = [(BPSAggregator *)v2 initWithAccumulator:v3 closure:&__block_literal_global_31];

  return v4;
}

id __35__BPSAggregations_approxPercentile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 floatValue];
  objc_msgSend(v4, "addValue:");
  return v4;
}

+ (id)approxPercentileWithDigestCapacity:(unint64_t)a3
{
  id v4 = [BPSAggregator alloc];
  id v5 = [[BPSApproxPercentileDigest alloc] initWithCapacity:a3];
  float v6 = [(BPSAggregator *)v4 initWithAccumulator:v5 closure:&__block_literal_global_34];

  return v6;
}

id __54__BPSAggregations_approxPercentileWithDigestCapacity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 floatValue];
  objc_msgSend(v4, "addValue:");
  return v4;
}

+ (id)approximateDistinctCount
{
  v2 = [BPSAggregator alloc];
  uint64_t v3 = objc_alloc_init(BPSApproximateDistinctCount);
  id v4 = [(BPSAggregator *)v2 initWithAccumulator:v3 closure:&__block_literal_global_37];

  return v4;
}

id __43__BPSAggregations_approximateDistinctCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  objc_msgSend(v4, "addValue:", objc_msgSend(a3, "unsignedLongValue"));
  return v4;
}

@end