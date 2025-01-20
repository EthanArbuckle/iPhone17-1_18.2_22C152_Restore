@interface CSUtils(Statistics)
+ (id)distributionDictionary:()Statistics;
@end

@implementation CSUtils(Statistics)

+ (id)distributionDictionary:()Statistics
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA60];
    v33[0] = @"Max";
    v33[1] = @"Min";
    v34[0] = &unk_1F23C4478;
    v34[1] = &unk_1F23C4478;
    v33[2] = @"P95";
    v33[3] = @"Median";
    v34[2] = &unk_1F23C4478;
    v34[3] = &unk_1F23C4478;
    v33[4] = @"Avg";
    v33[5] = @"Std";
    v34[4] = &unk_1F23C4478;
    v34[5] = &unk_1F23C4478;
    v33[6] = @"Num";
    v34[6] = &unk_1F23C4478;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];
    v6 = [v4 dictionaryWithDictionary:v5];

    unint64_t v7 = [v3 count];
    if (v7)
    {
      v8 = [NSNumber numberWithUnsignedInteger:v7];
      [v6 setObject:v8 forKeyedSubscript:@"Num"];

      v9 = (void *)MEMORY[0x1E4F28C68];
      v10 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
      v32 = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v12 = [v9 expressionForFunction:@"average:" arguments:v11];

      v13 = [v12 expressionValueWithObject:0 context:0];
      [v6 setObject:v13 forKeyedSubscript:@"Avg"];

      v14 = (void *)MEMORY[0x1E4F28C68];
      v15 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
      v31 = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      v17 = [v14 expressionForFunction:@"stddev:" arguments:v16];

      v18 = [v17 expressionValueWithObject:0 context:0];
      [v6 setObject:v18 forKeyedSubscript:@"Std"];

      [v3 sortUsingComparator:&__block_literal_global];
      v19 = [v3 objectAtIndexedSubscript:v7 >> 1];
      [v19 doubleValue];
      double v21 = v20;

      if ((v7 & 1) == 0)
      {
        v22 = [v3 objectAtIndexedSubscript:(v7 >> 1) - 1];
        [v22 doubleValue];
        double v24 = v23;

        double v21 = (v21 + v24) * 0.5;
      }
      v25 = [NSNumber numberWithDouble:v21];
      [v6 setObject:v25 forKeyedSubscript:@"Median"];

      v26 = [v3 objectAtIndexedSubscript:0];
      [v6 setObject:v26 forKeyedSubscript:@"Min"];

      v27 = [v3 objectAtIndexedSubscript:v7 - 1];
      [v6 setObject:v27 forKeyedSubscript:@"Max"];

      v28 = [v3 objectAtIndexedSubscript:vcvtmd_u64_f64((double)v7 * 0.95)];
      [v6 setObject:v28 forKeyedSubscript:@"P95"];

      unint64_t v7 = v6;
    }
  }
  else
  {
    v29 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "+[CSUtils(Statistics) distributionDictionary:]";
      _os_log_impl(&dword_1C9338000, v29, OS_LOG_TYPE_DEFAULT, "%s input dictionary is nil", buf, 0xCu);
    }
    unint64_t v7 = 0;
  }

  return (id)v7;
}

@end