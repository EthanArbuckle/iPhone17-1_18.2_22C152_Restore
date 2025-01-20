@interface CALNSnoozeCategory
+ (id)snoozeCategories;
+ (id)snoozeCategoryForEventWithStartDate:(id)a3 endDate:(id)a4 now:(id)a5 isAllDay:(BOOL)a6;
- (CALNSnoozeCategory)initWithSuffix:(id)a3 timedExpirationInterval:(double)a4 leeway:(double)a5 relativeToEnd:(BOOL)a6 validForAllDay:(BOOL)a7 actions:(id)a8;
- (NSArray)actions;
- (NSString)suffix;
- (double)leeway;
- (id)expirationDateForEventWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5;
@end

@implementation CALNSnoozeCategory

- (CALNSnoozeCategory)initWithSuffix:(id)a3 timedExpirationInterval:(double)a4 leeway:(double)a5 relativeToEnd:(BOOL)a6 validForAllDay:(BOOL)a7 actions:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CALNSnoozeCategory;
  v17 = [(CALNSnoozeCategory *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_suffix, a3);
    v18->_timedExpirationInterval = a4;
    v18->_leeway = a5;
    v18->_relativeToEnd = a6;
    v18->_validForAllDay = a7;
    objc_storeStrong((id *)&v18->_actions, a8);
  }

  return v18;
}

- (id)expirationDateForEventWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a5 || (double timedExpirationInterval = self->_timedExpirationInterval, timedExpirationInterval == -1000000000.0))
  {
    v12 = 0;
  }
  else
  {
    double v13 = -timedExpirationInterval;
    if (!self->_relativeToEnd) {
      id v9 = v8;
    }
    v12 = [v9 dateByAddingTimeInterval:v13];
  }

  return v12;
}

+ (id)snoozeCategoryForEventWithStartDate:(id)a3 endDate:(id)a4 now:(id)a5 isAllDay:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [a1 snoozeCategories];
  [v10 timeIntervalSinceDate:v12];
  double v15 = v14;
  [v11 timeIntervalSinceDate:v12];
  double v17 = v16;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        if (v6)
        {
          if (*(unsigned char *)(v23 + 17)) {
            goto LABEL_17;
          }
        }
        else
        {
          double v24 = *(double *)(v23 + 8);
          if (v24 == -1000000000.0 || (*(unsigned char *)(v23 + 16) ? (BOOL v25 = v17 <= v24) : (BOOL v25 = v15 <= v24), !v25))
          {
LABEL_17:
            id v26 = (id)v23;
            goto LABEL_18;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v26 = 0;
LABEL_18:

  return v26;
}

+ (id)snoozeCategories
{
  if (snoozeCategories_onceToken != -1) {
    dispatch_once(&snoozeCategories_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)snoozeCategories_categories;
  return v2;
}

void __38__CALNSnoozeCategory_snoozeCategories__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = [CALNSnoozeCategory alloc];
  v1 = [(CALNSnoozeCategory *)v0 initWithSuffix:&stru_26D3B3198 timedExpirationInterval:0 leeway:1 relativeToEnd:MEMORY[0x263EFFA68] validForAllDay:-1000000000.0 actions:0.0];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  v3 = (void *)snoozeCategories_categories;
  snoozeCategories_categories = v2;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSArray)actions
{
  return self->_actions;
}

- (double)leeway
{
  return self->_leeway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

@end