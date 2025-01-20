@interface HKExertionUtilities
+ (id)filterSamplesOfExertionTypeCode:(int64_t)a3 fromExertionSamples:(id)a4;
+ (id)mostRelevantSampleFromExertionSamples:(id)a3;
+ (id)mostRelevantValueFromExertionSamples:(id)a3;
@end

@implementation HKExertionUtilities

+ (id)filterSamplesOfExertionTypeCode:(int64_t)a3 fromExertionSamples:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HKExertionUtilities_filterSamplesOfExertionTypeCode_fromExertionSamples___block_invoke;
  v6[3] = &__block_descriptor_40_e26__16__0__HKQuantitySample_8l;
  v6[4] = a3;
  v4 = objc_msgSend(a4, "hk_map:", v6);
  return v4;
}

id __75__HKExertionUtilities_filterSamplesOfExertionTypeCode_fromExertionSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 quantityType];
  uint64_t v5 = [v4 code];
  uint64_t v6 = *(void *)(a1 + 32);

  if (v5 == v6) {
    id v7 = v3;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)mostRelevantValueFromExertionSamples:(id)a3
{
  id v3 = [a1 mostRelevantSampleFromExertionSamples:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = [v3 quantity];
    [v6 _value];
    id v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)mostRelevantSampleFromExertionSamples:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "_creationDate", (void)v15);
        if (objc_msgSend(v11, "hk_isAfterDate:", v4))
        {
          id v12 = v11;

          id v13 = v10;
          v4 = v12;
          id v7 = v13;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);

    if (v7) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
  }
  return v6;
}

@end