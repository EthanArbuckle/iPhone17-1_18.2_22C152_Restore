@interface ATXReservoirSampler
+ (double)_standardUniformDistribution;
+ (id)sampleWeightedArray:(id)a3;
+ (id)sampleWeightedArray:(id)a3 numToSample:(unint64_t)a4;
@end

@implementation ATXReservoirSampler

+ (id)sampleWeightedArray:(id)a3
{
  v3 = objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_2);
  id v4 = (id)[v3 sortedArrayUsingComparator:&__block_literal_global_6];
  v5 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_9);

  return v5;
}

id __43__ATXReservoirSampler_sampleWeightedArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 doubleValue];
  if (v4 >= 0.001)
  {
    double v8 = v4;
    +[ATXReservoirSampler _standardUniformDistribution];
    long double v10 = log(v9 + 0.001);
    v11 = (void *)MEMORY[0x1E4F93BB8];
    long double v12 = v10 / v8;
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    v13 = [NSNumber numberWithDouble:(double)v12];
    v7 = [v11 tupleWithFirst:v6 second:v13];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F93BB8];
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    v7 = [v5 tupleWithFirst:v6 second:&unk_1F2718F18];
  }

  return v7;
}

uint64_t __43__ATXReservoirSampler_sampleWeightedArray___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 second];
  v6 = [v4 second];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __43__ATXReservoirSampler_sampleWeightedArray___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 first];
}

+ (id)sampleWeightedArray:(id)a3 numToSample:(unint64_t)a4
{
  v5 = [a1 sampleWeightedArray:a3];
  unint64_t v6 = [v5 count];
  if (v6 >= a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = v6;
  }
  double v8 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);

  return v8;
}

+ (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

@end