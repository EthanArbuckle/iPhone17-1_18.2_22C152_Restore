@interface LCFFeatureConverter
+ (id)fromBiomeLabeledDataFeatureValue:(id)a3;
+ (id)fromFeatureSetToLabeledData:(id)a3;
+ (id)fromFeatureValueToLabeledData:(id)a3;
+ (id)fromLabeledDataBiomeFeatureStore:(id)a3 timestamp:(id)a4;
@end

@implementation LCFFeatureConverter

+ (id)fromBiomeLabeledDataFeatureValue:(id)a3
{
  id v3 = a3;
  if ([v3 hasIntValue])
  {
    v4 = [LCFFeatureValue alloc];
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
    uint64_t v6 = [(LCFFeatureValue *)v4 initWithIntValue:v5];
LABEL_9:
    v12 = (LCFFeatureValue *)v6;
LABEL_10:

    goto LABEL_11;
  }
  if ([v3 hasBoolValue])
  {
    v7 = [LCFFeatureValue alloc];
    v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    uint64_t v6 = [(LCFFeatureValue *)v7 initWithBoolValue:v5];
    goto LABEL_9;
  }
  if ([v3 hasDoubleValue])
  {
    v8 = [LCFFeatureValue alloc];
    v9 = NSNumber;
    [v3 doubleValue];
    v5 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v6 = [(LCFFeatureValue *)v8 initWithDoubleValue:v5];
    goto LABEL_9;
  }
  v10 = [v3 stringValue];

  if (v10)
  {
    v11 = [LCFFeatureValue alloc];
    v5 = [v3 stringValue];
    uint64_t v6 = [(LCFFeatureValue *)v11 initWithStringValue:v5];
    goto LABEL_9;
  }
  v14 = [v3 doubleValuedVectorValue];

  if (v14)
  {
    v15 = [LCFFeatureValue alloc];
    v5 = [v3 doubleValuedVectorValue];
    v16 = [v5 vectorWithDoubles];
    v12 = [(LCFFeatureValue *)v15 initWithDoubleArray:v16];

    goto LABEL_10;
  }
  if ([v3 timeBucketValue])
  {
    v17 = [LCFFeatureValue alloc];
    v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "timeBucketValue"));
    uint64_t v6 = [(LCFFeatureValue *)v17 initWithTimeBucketValue:v5];
    goto LABEL_9;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)fromLabeledDataBiomeFeatureStore:(id)a3 timestamp:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v37 = a4;
  v36 = [v5 itemIdentifier];
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "featureVersion"));
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v7 = [v5 featureVector];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v12 featureName];
        v13 = BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
        v14 = [v12 featureValue];
        v15 = +[LCFFeatureConverter fromBiomeLabeledDataFeatureValue:v14];

        [v6 setValue:v15 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v9);
  }

  if ([v5 hasIsPositiveLabeled])
  {
    v16 = [LCFFeatureValue alloc];
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isPositiveLabeled"));
    v18 = [(LCFFeatureValue *)v16 initWithBoolValue:v17];

    [v6 setValue:v18 forKey:@"_isPositiveLabeled"];
  }
  if ([v5 hasLabelingPolicyVersion])
  {
    v19 = [LCFFeatureValue alloc];
    v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "labelingPolicyVersion"));
    v21 = [(LCFFeatureValue *)v19 initWithIntValue:v20];

    [v6 setValue:v21 forKey:@"_labelingPolicyVersion"];
  }
  v22 = [LCFFeatureValue alloc];
  v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "labelingEvidence"));
  v24 = [(LCFFeatureValue *)v22 initWithIntValue:v23];
  [v6 setValue:v24 forKey:@"_labelingEvidence"];

  v25 = [v5 sharingEventUID];

  if (v25)
  {
    v26 = [LCFFeatureValue alloc];
    v27 = [v5 sharingEventUID];
    v28 = [(LCFFeatureValue *)v26 initWithStringValue:v27];

    [v6 setValue:v28 forKey:@"_sharingEventUID"];
  }
  v29 = [v5 configurationInfo];

  if (v29)
  {
    v30 = [LCFFeatureValue alloc];
    v31 = [v5 configurationInfo];
    v32 = [(LCFFeatureValue *)v30 initWithStringValue:v31];

    [v6 setValue:v32 forKey:@"_configurationInfo"];
  }
  v33 = [[LCFFeatureSet alloc] initWithIdentifier:v36 featureVersion:v35 timestamp:v37 featureValues:v6];

  return v33;
}

+ (id)fromFeatureValueToLabeledData:(id)a3
{
  id v3 = a3;
  v4 = [v3 intValue];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F2A240]);
    id v6 = [v3 intValue];
    v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = 0;
LABEL_5:
    v12 = 0;
LABEL_6:
    v13 = 0;
LABEL_7:
    v14 = (void *)[v7 initWithIntValue:v8 doubleValue:v9 stringValue:v12 BOOLValue:v13 timeBucketValue:0 doubleValuedVectorValue:0];

    goto LABEL_8;
  }
  uint64_t v10 = [v3 doubleValue];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F2A240]);
    id v6 = [v3 doubleValue];
    v7 = v11;
    uint64_t v8 = 0;
    uint64_t v9 = v6;
    goto LABEL_5;
  }
  v16 = [v3 stringValue];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F2A240]);
    id v6 = [v3 stringValue];
    v7 = v17;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    v12 = v6;
    goto LABEL_6;
  }
  v18 = [v3 BOOLValue];

  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263F2A240]);
    id v6 = [v3 BOOLValue];
    v7 = v19;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    v12 = 0;
    v13 = v6;
    goto LABEL_7;
  }
  v20 = [v3 doubleArray];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263F2A240]);
    id v22 = objc_alloc(MEMORY[0x263F2A248]);
    v23 = [v3 doubleArray];
    v24 = (void *)[v22 initWithVectorWithDoubles:v23];
    v14 = (void *)[v21 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:0 doubleValuedVectorValue:v24];
  }
  else
  {
    v14 = [v3 timeBucketValue];

    if (v14)
    {
      v25 = [v3 timeBucketValue];
      uint64_t v26 = [v25 intValue];

      v14 = (void *)[objc_alloc(MEMORY[0x263F2A240]) initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:v26 doubleValuedVectorValue:0];
    }
  }
LABEL_8:

  return v14;
}

+ (id)fromFeatureSetToLabeledData:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v36 = [v3 itemIdentifier];
  v35 = [v3 featureVersion];
  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v4 = [v3 featureValues];
  id v5 = [v4 allKeys];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v6)
  {
    long long v39 = 0;
    long long v40 = 0;
    long long v38 = 0;
    int v37 = 0;
    long long v41 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  long long v39 = 0;
  long long v40 = 0;
  long long v38 = 0;
  int v37 = 0;
  long long v41 = 0;
  uint64_t v8 = *(void *)v45;
  uint64_t v9 = @"_isPositiveLabeled";
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v45 != v8) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      uint64_t v12 = BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString();
      if (v12)
      {
        uint64_t v13 = v12;
        [v3 featureValues];
        v15 = v14 = v9;
        v16 = [v15 objectForKeyedSubscript:v11];
        id v17 = +[LCFFeatureConverter fromFeatureValueToLabeledData:v16];

        uint64_t v9 = v14;
        v18 = (void *)[objc_alloc(MEMORY[0x263F2A230]) initWithFeatureName:v13 featureValue:v17 featureItselfVersion:0 featureFreshnessInHours:0 eventVolumeToComputeFeature:0 timeSpentToComputeFeature:0];
        [v43 addObject:v18];
LABEL_18:

        continue;
      }
      if ([v11 isEqualToString:v9])
      {
        id v19 = [v3 featureValues];
        v20 = [v19 objectForKeyedSubscript:v9];
        uint64_t v21 = [v20 BOOLValue];

        long long v41 = (void *)v21;
      }
      if ([v11 isEqualToString:@"_labelingPolicyVersion"])
      {
        id v22 = [v3 featureValues];
        v23 = [v22 objectForKeyedSubscript:@"_labelingPolicyVersion"];
        uint64_t v24 = [v23 intValue];

        long long v39 = (void *)v24;
      }
      if ([v11 isEqualToString:@"_labelingEvidence"])
      {
        v25 = [v3 featureValues];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"_labelingEvidence"];
        v27 = [v26 intValue];
        int v37 = [v27 intValue];
      }
      if ([v11 isEqualToString:@"_sharingEventUID"])
      {
        v28 = [v3 featureValues];
        v29 = [v28 objectForKeyedSubscript:@"_sharingEventUID"];
        uint64_t v30 = [v29 stringValue];

        long long v38 = (void *)v30;
      }
      if ([v11 isEqualToString:@"_configurationInfo"])
      {
        id v17 = [v3 featureValues];
        v18 = [v17 objectForKeyedSubscript:@"_configurationInfo"];
        uint64_t v31 = [v18 stringValue];

        long long v40 = (void *)v31;
        goto LABEL_18;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  }
  while (v7);
LABEL_23:

  LODWORD(v34) = v37;
  v32 = (void *)[objc_alloc(MEMORY[0x263F2A228]) initWithItemIdentifier:v36 featureVersion:v35 featureVector:v43 deviceIdentifier:0 isPositiveLabeled:v41 labelingPolicyVersion:v39 labelingEvidence:v34 sharingEventUID:v38 configurationInfo:v40];

  return v32;
}

@end