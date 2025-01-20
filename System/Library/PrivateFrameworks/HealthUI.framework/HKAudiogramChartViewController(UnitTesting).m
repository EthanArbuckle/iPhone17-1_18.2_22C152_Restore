@interface HKAudiogramChartViewController(UnitTesting)
+ (BOOL)testChartPointCreation:()UnitTesting leftEarSeries:expectedChartPoints:failureMessage:;
@end

@implementation HKAudiogramChartViewController(UnitTesting)

+ (BOOL)testChartPointCreation:()UnitTesting leftEarSeries:expectedChartPoints:failureMessage:
{
  BOOL v7 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = +[HKAudiogramChartPoint chartPointsFromSensitivityPoints:a3 isLeftEar:v7];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v11 setNumberStyle:1];
  v12 = [v9 componentsSeparatedByString:@";"];
  uint64_t v13 = [v12 count];
  if (v13 != [v10 count])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Expected point count doesn't match actual point count: %ld != %ld", objc_msgSend(v12, "count"), objc_msgSend(v10, "count"));
    BOOL v37 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v14)
  {
    BOOL v37 = 1;
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  v41 = a6;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v46;
  v42 = v12;
  id v43 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      v20 = [v19 componentsSeparatedByString:@","];
      if ([v20 count] != 2)
      {
        [NSString stringWithFormat:@"Point does not have two coordinates: '%@'", v19, v39, v40];
LABEL_18:
        id *v41 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v37 = 0;
        v12 = v42;
        id v9 = v43;
        goto LABEL_19;
      }
      v21 = [v20 objectAtIndexedSubscript:0];
      v22 = [v11 numberFromString:v21];
      [v22 doubleValue];
      double v24 = v23;

      v25 = [v20 objectAtIndexedSubscript:1];
      v26 = [v11 numberFromString:v25];
      [v26 doubleValue];
      double v28 = v27;

      v29 = [v10 objectAtIndexedSubscript:v16 + i];
      v30 = [v29 xValueAsGenericType];
      [v30 doubleValue];
      double v32 = v31;

      v33 = [v10 objectAtIndexedSubscript:v16 + i];
      v34 = [v33 yValue];
      [v34 doubleValue];
      double v36 = v35;

      if (vabdd_f64(v24, v32) > 0.000001)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"X value mismatch (slot %ld): %lg != %lg", v16 + i, *(void *)&v24, *(void *)&v32);
        goto LABEL_18;
      }
      if (vabdd_f64(v28, v36) > 0.000001)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Y value mismatch (slot %ld: %lg != %lg"), v16 + i, *(void *)&v28, *(void *)&v36;
        goto LABEL_18;
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    v16 += i;
    BOOL v37 = 1;
    v12 = v42;
    id v9 = v43;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:
  return v37;
}

@end