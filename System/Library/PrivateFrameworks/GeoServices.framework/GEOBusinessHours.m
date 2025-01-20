@interface GEOBusinessHours
+ (id)prioritizeBusinessHours:(id)a3 compareDate:(id)a4;
+ (void)divideBusinessHoursBasedOnTodaysDate:(id)a3 compareDate:(id)a4 completion:(id)a5;
- (BOOL)isBrandTypeHours;
- (BOOL)pdHoursAreValid;
- (GEOBusinessHours)initWithGEOPDBusinessHours:(id)a3 timeZone:(id)a4;
- (GEOBusinessHours)initWithGEOPDHours:(id)a3 timeZone:(id)a4;
- (NSArray)pdHours;
- (NSArray)placeDailyHours;
- (NSArray)placeDailyNormalizedHours;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)operatingWeekdays;
- (NSString)localizedMessage;
- (unint64_t)hoursType;
- (unsigned)closingSoonThresdholdInSeconds;
- (unsigned)openingSoonThresholdInSeconds;
@end

@implementation GEOBusinessHours

+ (id)prioritizeBusinessHours:(id)a3 compareDate:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__66;
  v29 = __Block_byref_object_dispose__66;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__66;
  v23 = __Block_byref_object_dispose__66;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__GEOBusinessHours_prioritizeBusinessHours_compareDate___block_invoke;
  v18[3] = &unk_1E53E8700;
  v18[4] = &v25;
  v18[5] = &v19;
  v8 = (void *)MEMORY[0x18C120660](v18);
  +[GEOBusinessHours divideBusinessHoursBasedOnTodaysDate:v5 compareDate:v6 completion:v8];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"hoursType" ascending:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:1];
  v31[0] = v9;
  v31[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v12 = [(id)v26[5] sortedArrayUsingDescriptors:v11];
  v13 = (void *)v26[5];
  v26[5] = v12;

  uint64_t v14 = [(id)v20[5] sortedArrayUsingDescriptors:v11];
  v15 = (void *)v20[5];
  v20[5] = v14;

  [v7 addObjectsFromArray:v26[5]];
  [v7 addObjectsFromArray:v20[5]];
  v16 = (void *)[v7 copy];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __56__GEOBusinessHours_prioritizeBusinessHours_compareDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (void)divideBusinessHoursBasedOnTodaysDate:(id)a3 compareDate:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v27 = a5;
  uint64_t v9 = objc_opt_new();
  v28 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "endDate", v27);
        if (!v16 || [v8 compare:v16] != 1)
        {
          switch([v15 hoursType])
          {
            case 0:
              break;
            case 1:
              [v9 addObject:v15];
              break;
            case 2:
              if (![v15 pdHoursAreValid]) {
                break;
              }
              goto LABEL_11;
            case 3:
LABEL_11:
              v17 = [v15 startDate];
              uint64_t v18 = [v8 compare:v17];

              if (v18 != -1) {
                goto LABEL_12;
              }
              break;
            case 4:
              id v22 = v15;
              if (!v22) {
                break;
              }
              v23 = v22;

              v33 = v23;
              uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
              v26 = v27;
              (*((void (**)(id, void *, void))v27 + 2))(v27, v25, MEMORY[0x1E4F1CBF0]);
              id v24 = v28;
              goto LABEL_22;
            default:
LABEL_12:
              uint64_t v19 = [v15 startDate];
              uint64_t v20 = [v8 compare:v19];
              uint64_t v21 = v9;
              if (v20 != 1)
              {
                if ([v8 compare:v19]) {
                  uint64_t v21 = v28;
                }
                else {
                  uint64_t v21 = v9;
                }
              }
              [v21 addObject:v15];

              break;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  v23 = (void *)[v9 copy];
  id v24 = v28;
  uint64_t v25 = (void *)[v28 copy];
  v26 = v27;
  (*((void (**)(id, void *, void *))v27 + 2))(v27, v23, v25);
LABEL_22:
}

- (GEOBusinessHours)initWithGEOPDBusinessHours:(id)a3 timeZone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GEOBusinessHours;
  uint64_t v9 = [(GEOBusinessHours *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hours, a3);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__GEOBusinessHours_initWithGEOPDBusinessHours_timeZone___block_invoke;
    v16[3] = &unk_1E53E8728;
    uint64_t v12 = v10;
    v17 = v12;
    uint64_t v13 = (void *)MEMORY[0x18C120660](v16);
    uint64_t v14 = [(GEOBusinessHours *)v12 pdHours];
    _geoNormalizedAndViewHourModelsForPDHours(v14, v11, v8, [(GEOBusinessHours *)v12 openingSoonThresholdInSeconds], [(GEOBusinessHours *)v12 closingSoonThresdholdInSeconds], v13);
  }
  return v10;
}

void __56__GEOBusinessHours_initWithGEOPDBusinessHours_timeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v6;
}

- (GEOBusinessHours)initWithGEOPDHours:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOBusinessHours;
  id v8 = [(GEOBusinessHours *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__GEOBusinessHours_initWithGEOPDHours_timeZone___block_invoke;
    v13[3] = &unk_1E53E8728;
    id v10 = v8;
    uint64_t v14 = v10;
    id v11 = (void *)MEMORY[0x18C120660](v13);
    _geoNormalizedAndViewHourModelsForPDHours(v6, v9, v7, 0, 0, v11);
    v10->_isBrandTypeHours = 1;
  }
  return v8;
}

void __48__GEOBusinessHours_initWithGEOPDHours_timeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v6;
}

- (unsigned)openingSoonThresholdInSeconds
{
  -[GEOPDBusinessHours hoursThreshold]((id *)&self->_hours->super.super.isa);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = v2[5];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unsigned)closingSoonThresdholdInSeconds
{
  -[GEOPDBusinessHours hoursThreshold]((id *)&self->_hours->super.super.isa);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unsigned int v3 = v2[4];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (unint64_t)hoursType
{
  if (self->_isBrandTypeHours) {
    return 1;
  }
  uint64_t v3 = -[GEOPDBusinessHours hoursType]((uint64_t)self->_hours) - 1;
  if (v3 <= 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)pdHoursAreValid
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "days", (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (NSArray)pdHours
{
  return (NSArray *)-[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
}

- (NSString)localizedMessage
{
  v2 = -[GEOPDBusinessHours message]((id *)&self->_hours->super.super.isa);
  uint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSSet)operatingWeekdays
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__GEOBusinessHours_operatingWeekdays__block_invoke;
  v7[3] = &unk_1E53E8750;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __37__GEOBusinessHours_operatingWeekdays__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 daysCount])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v7 days];
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(v4 + 4 * v3)];
      [v5 addObject:v6];

      ++v3;
    }
    while (v3 < [v7 daysCount]);
  }
}

- (NSDate)startDate
{
  hours = self->_hours;
  if (hours && (unint64_t start = hours->_start) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)start];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  hours = self->_hours;
  if (hours && (unint64_t end = hours->_end) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)end];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSArray)placeDailyHours
{
  return self->_placeDailyHours;
}

- (NSArray)placeDailyNormalizedHours
{
  return self->_placeDailyNormalizedHours;
}

- (BOOL)isBrandTypeHours
{
  return self->_isBrandTypeHours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDailyNormalizedHours, 0);
  objc_storeStrong((id *)&self->_placeDailyHours, 0);

  objc_storeStrong((id *)&self->_hours, 0);
}

@end