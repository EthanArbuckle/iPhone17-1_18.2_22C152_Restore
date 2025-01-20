@interface _DASLimitsUtilities
+ (int64_t)bitmaskForLimitationName:(id)a3;
@end

@implementation _DASLimitsUtilities

+ (int64_t)bitmaskForLimitationName:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Configuration";
  v9[1] = @"ActivityRate";
  v10[0] = &unk_1F0E6EC80;
  v10[1] = &unk_1F0E6EC98;
  v9[2] = @"ProcessRate";
  v9[3] = @"Runtime";
  v10[2] = &unk_1F0E6ECB0;
  v10[3] = &unk_1F0E6ECC8;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v10 forKeys:v9 count:4];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int64_t v7 = 1 << [v6 unsignedIntegerValue];
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

@end