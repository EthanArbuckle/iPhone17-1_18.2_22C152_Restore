@interface HKWorkoutEvent(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableWorkoutEvent)codableRepresentationForSync;
@end

@implementation HKWorkoutEvent(HDCodingSupport)

- (HDCodableWorkoutEvent)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableWorkoutEvent);
  -[HDCodableWorkoutEvent setType:](v2, "setType:", [a1 type]);
  v3 = [a1 dateInterval];
  v4 = [v3 startDate];
  [v4 timeIntervalSinceReferenceDate];
  -[HDCodableWorkoutEvent setDate:](v2, "setDate:");

  v5 = [a1 dateInterval];
  [v5 duration];
  -[HDCodableWorkoutEvent setDuration:](v2, "setDuration:");

  v6 = [a1 metadata];
  v7 = objc_msgSend(v6, "hk_codableMetadata");
  [(HDCodableWorkoutEvent *)v2 setMetadataDictionary:v7];

  v8 = [a1 metadata];
  v9 = [v8 objectForKey:*MEMORY[0x1E4F2A1E8]];

  if (v9) {
    -[HDCodableWorkoutEvent setSwimmingStrokeStyle:](v2, "setSwimmingStrokeStyle:", [v9 longLongValue]);
  }

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 hasType])
    {
      v6 = (void *)MEMORY[0x1E4F1CA60];
      v7 = [v5 metadataDictionary];
      v8 = objc_msgSend(v6, "hk_dictionaryWithCodableMetadata:", v7);

      double v9 = 0.0;
      if ([v5 hasDuration])
      {
        [v5 duration];
        double v9 = v10;
      }
      if ([v5 hasSwimmingStrokeStyle])
      {
        v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "swimmingStrokeStyle"));
        [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2A1E8]];
      }
      uint64_t v12 = [v5 type];
      id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
      v14 = [v5 decodedDateIntervalStartDate];
      v15 = (void *)[v13 initWithStartDate:v14 duration:v9];
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
      v17 = [a1 _unvalidatedWorkoutEventWithType:v12 dateInterval:v15 metadata:v16];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end