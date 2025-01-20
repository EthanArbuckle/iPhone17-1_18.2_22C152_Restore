@interface HKWorkout(HKDataMetadataSubsampleSection)
- (id)fixedAggregateValuesWithDisplayTypeController:()HKDataMetadataSubsampleSection unitController:;
- (id)subExertionSamplePredicate;
- (id)subSampleSectionTitle;
- (uint64_t)subSamplePredicate;
@end

@implementation HKWorkout(HKDataMetadataSubsampleSection)

- (id)fixedAggregateValuesWithDisplayTypeController:()HKDataMetadataSubsampleSection unitController:
{
  v62[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  v46 = v51 = a1;
  v8 = objc_msgSend(a1, "statisticsForType:");
  v9 = [v8 sumQuantity];

  v10 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  v47 = v9;
  [v9 doubleValueForUnit:v10];
  double v12 = v11;

  if (v12 > 0.00000011920929)
  {
    v13 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:10];
    v14 = [v6 displayTypeWithIdentifier:&unk_1F3C22888];
    v15 = [v7 unitForDisplayType:v14];
    v16 = [v7 localizedDisplayNameForDisplayType:v14];
    v17 = objc_msgSend(v14, "hk_numberFormatterForUnit:", v15);
    [v47 doubleValueForUnit:v15];
    v18 = objc_msgSend(NSNumber, "numberWithDouble:");
    v19 = [v17 stringFromNumber:v18 displayType:v14 unitController:v7];

    v20 = HKFormatValueAndUnit(v19, v16);
    [v52 setObject:v20 forKey:v13];
  }
  v55 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B0]];
  v62[0] = v55;
  v53 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
  v62[1] = v53;
  v48 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D8]];
  v62[2] = v48;
  v21 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
  v62[3] = v21;
  v22 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E8]];
  v62[4] = v22;
  v23 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7A8]];
  v62[5] = v23;
  v24 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C8]];
  v62[6] = v24;
  v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7D0]];
  v62[7] = v25;
  v26 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7C0]];
  v62[8] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v28 = v27;
  v29 = v51;
  uint64_t v56 = [v28 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v58;
    id v49 = v28;
    id v50 = v7;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v58 != v54) {
          objc_enumerationMutation(v28);
        }
        v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v32 = [v29 statisticsForType:v31];
        if (v32)
        {
          v33 = [v6 displayTypeForObjectType:v31];
          v34 = [v7 unitForDisplayType:v33];
          uint64_t v35 = [v31 aggregationStyle];
          if (v35 != 1)
          {
            if (!v35)
            {
              v36 = [v32 sumQuantity];
LABEL_13:
              v37 = v36;
              [v36 doubleValueForUnit:v34];
              double v39 = v38;

              if (v39 > 0.00000011920929)
              {
                v40 = [v33 presentation];
                v41 = [NSNumber numberWithDouble:v39];
                [v40 adjustedValueForDaemonValue:v41];
                v43 = id v42 = v6;
                v44 = HKFormattedStringFromValueForContext(v43, v33, v7, 0, 0, 1);

                id v6 = v42;
                id v28 = v49;

                v29 = v51;
                [v52 setObject:v44 forKey:v31];

                id v7 = v50;
              }
            }

            goto LABEL_16;
          }
          v36 = [v32 averageQuantity];
          goto LABEL_13;
        }
LABEL_16:
      }
      uint64_t v56 = [v28 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v56);
  }

  return v52;
}

- (uint64_t)subSamplePredicate
{
  return [MEMORY[0x1E4F2B3C0] predicateForObjectsFromWorkout:a1];
}

- (id)subExertionSamplePredicate
{
  v1 = (void *)MEMORY[0x1E4F2B3C0];
  v2 = [a1 UUID];
  v3 = [v1 predicateForObjectWithUUID:v2];

  return v3;
}

- (id)subSampleSectionTitle
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v1 = [v0 localizedStringForKey:@"RELATED_SAMPLES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v1;
}

@end