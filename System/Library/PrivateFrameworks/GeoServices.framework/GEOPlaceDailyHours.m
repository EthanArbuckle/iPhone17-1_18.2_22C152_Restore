@interface GEOPlaceDailyHours
+ (id)dailyHours:(id)a3 forDays:(_NSRange)a4;
+ (id)getPlaceDailyHoursForWeekday:(int64_t)a3 placeDailyHours:(id)a4;
- (NSArray)openIntervals;
- (_NSRange)dayOfWeekRange;
- (id)description;
@end

@implementation GEOPlaceDailyHours

+ (id)dailyHours:(id)a3 forDays:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 3, a3);
    v10[1] = location;
    v10[2] = length;
  }

  return v10;
}

+ (id)getPlaceDailyHoursForWeekday:(int64_t)a3 placeDailyHours:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = v5;
  if (a3 < 1)
  {
    id v18 = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      unint64_t v11 = a3 + 7;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unint64_t v14 = objc_msgSend(v13, "dayOfWeekRange", (void)v20);
          if ((a3 < v14 || a3 - v14 >= v15) && (v11 < v14 || v11 - v14 >= v15)) {
            continue;
          }
          id v18 = v13;
          goto LABEL_23;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v18 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v18 = 0;
    }
LABEL_23:
  }

  return v18;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromRange(self->_dayOfWeekRange);
  [v3 appendFormat:@"<%@: %p Days: %@ Hours: { ", v5, self, v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_openIntervals;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = (objc_class *)objc_opt_class();
        unint64_t v14 = NSStringFromClass(v13);
        unint64_t v15 = [v12 startDate];
        v16 = [v12 endDate];
        [v3 appendFormat:@"<%@: %p Start: %@ End: %@>, ", v14, v12, v15, v16, (void)v18];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [v3 appendString:@" }>"];

  return v3;
}

- (_NSRange)dayOfWeekRange
{
  NSUInteger length = self->_dayOfWeekRange.length;
  NSUInteger location = self->_dayOfWeekRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)openIntervals
{
  return self->_openIntervals;
}

- (void).cxx_destruct
{
}

@end