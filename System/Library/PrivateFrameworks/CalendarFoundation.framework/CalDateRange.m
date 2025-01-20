@interface CalDateRange
+ (BOOL)range:(id)a3 intersectsRange:(id)a4;
+ (BOOL)range:(id)a3 intersectsRange:(id)a4 allowSinglePointIntersection:(BOOL)a5;
+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5;
+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5 allowSinglePointIntersection:(BOOL)a6;
+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6;
+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6 allowSinglePointIntersection:(BOOL)a7;
+ (BOOL)supportsSecureCoding;
+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 components:(id)a5 calendar:(id)a6;
+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 duration:(double)a5;
+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 multiplier:(unint64_t)a5;
+ (id)rangeWithRange:(id)a3;
+ (id)rangeWithStartDate:(id)a3 duration:(double)a4;
+ (id)rangeWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)containsDate:(id)a3;
- (BOOL)containsRange:(id)a3;
- (BOOL)intersectsRange:(id)a3;
- (BOOL)intersectsRange:(id)a3 allowSinglePointIntersection:(BOOL)a4;
- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4 allowSinglePointIntersection:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CalDateRange)initWithCoder:(id)a3;
- (CalDateRange)initWithStartDate:(id)a3 duration:(double)a4;
- (CalDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (double)duration;
- (id)_calculateMidnightsInCalendar:(id)a3;
- (id)briefDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)intersectionWithRange:(id)a3;
- (id)midnightsForRangeInTimeZoneString:(id)a3;
- (id)midpoint;
- (id)subtractRange:(id)a3;
- (id)unionRange:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDate:(id)a3 duration:(double)a4;
- (void)setStartDate:(id)a3 endDate:(id)a4;
@end

@implementation CalDateRange

+ (id)rangeWithStartDate:(id)a3 duration:(double)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v5 duration:a4];

  return v6;
}

- (CalDateRange)initWithStartDate:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7 = [v6 dateByAddingTimeInterval:a4];
  v8 = [(CalDateRange *)self initWithStartDate:v6 endDate:v7];

  return v8;
}

- (CalDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CalDateRange *)self init];
  v9 = v8;
  if (v8) {
    [(CalDateRange *)v8 setStartDate:v6 endDate:v7];
  }

  return v9;
}

- (void)setStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  [(CalDateRange *)self setStartDate:a3];
  [(CalDateRange *)self setEndDate:v6];
}

- (void)setStartDate:(id)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (id)midnightsForRangeInTimeZoneString:(id)a3
{
  id v4 = a3;
  if (midnightsForRangeInTimeZoneString__onceToken != -1) {
    dispatch_once(&midnightsForRangeInTimeZoneString__onceToken, &__block_literal_global_26);
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_2;
  v48[3] = &unk_1E56CEB98;
  id v5 = v4;
  id v49 = v5;
  id v6 = (void *)MEMORY[0x192FD8850](v48);
  id v7 = (id)midnightsForRangeInTimeZoneString___rangeToCache;
  objc_sync_enter(v7);
  if (([(id)midnightsForRangeInTimeZoneString___rangeToCache containsRange:self] & 1) == 0)
  {
    if ([(CalDateRange *)self containsRange:midnightsForRangeInTimeZoneString___rangeToCache])
    {
      uint64_t v8 = +[CalDateRange rangeWithRange:self];
      v9 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
      midnightsForRangeInTimeZoneString___rangeToCache = v8;
    }
    else
    {
      v10 = [(CalDateRange *)self endDate];
      v11 = [(id)midnightsForRangeInTimeZoneString___rangeToCache endDate];
      int v12 = [v10 CalIsAfterDate:v11];

      [(CalDateRange *)self duration];
      v9 = +[CalDateRange rangeByExpandingRange:self direction:v12 ^ 1u duration:fmax(v13, 126144000.0)];
      uint64_t v14 = [(id)midnightsForRangeInTimeZoneString___rangeToCache unionRange:v9];
      v15 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
      midnightsForRangeInTimeZoneString___rangeToCache = v14;
    }
  }
  objc_sync_exit(v7);

  id v16 = (id)midnightsForRangeInTimeZoneString___rangeToCache;
  v17 = (void *)midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_3;
  v45[3] = &unk_1E56CEBC0;
  id v18 = v6;
  id v47 = v18;
  id v19 = v16;
  id v46 = v19;
  v20 = [v17 CALsafeObjectForKey:v5 calculatedWithBlock:v45];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_4;
  v43[3] = &unk_1E56CEC08;
  id v21 = v20;
  id v44 = v21;
  v22 = (uint64_t (**)(void, void))MEMORY[0x192FD8850](v43);
  v23 = [(CalDateRange *)self startDate];
  int v24 = [v21 containsObject:v23];

  if (!v24)
  {
    v27 = [(CalDateRange *)self startDate];
    unint64_t v26 = ((uint64_t (**)(void, void *))v22)[2](v22, v27);

    if (v26 < [v21 count])
    {
      v28 = [(CalDateRange *)self startDate];
      v29 = [v21 objectAtIndex:v26];
      int v30 = [v28 isBeforeDate:v29];

      if (!v30) {
        goto LABEL_14;
      }
      if (v26)
      {
        --v26;
        goto LABEL_14;
      }
    }
    uint64_t v39 = (*((void (**)(id, CalDateRange *))v18 + 2))(v18, self);
    goto LABEL_25;
  }
  v25 = [(CalDateRange *)self startDate];
  unint64_t v26 = [v21 indexOfObject:v25];

LABEL_14:
  v31 = [(CalDateRange *)self startDate];
  v32 = [(CalDateRange *)self endDate];
  int v33 = [v31 isEqualToDate:v32];

  if (v33)
  {
    unint64_t v34 = v26 + 1;
  }
  else
  {
    v35 = [(CalDateRange *)self endDate];
    int v36 = [v21 containsObject:v35];

    [(CalDateRange *)self endDate];
    if (v36) {
      v37 = {;
    }
      uint64_t v38 = [v21 indexOfObject:v37];
    }
    else {
      v37 = {;
    }
      uint64_t v38 = ((uint64_t (**)(void, void *))v22)[2](v22, v37);
    }
    unint64_t v34 = v38;
  }
  if (v34 < v26 || v34 > [v21 count])
  {
    v40 = [(CalDateRange *)self briefDescription];
    NSLog(&cfstr_GotABadRangeTo.isa, v5, v40);

    v41 = 0;
    goto LABEL_26;
  }
  uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithOrderedSet:range:copyItems:", v21, v26, v34 - v26, 0);
LABEL_25:
  v41 = (void *)v39;
LABEL_26:

  return v41;
}

void __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings;
  midnightsForRangeInTimeZoneString__midnightsForTimeZoneStrings = (uint64_t)v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v3 = [v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v4 = (void *)midnightsForRangeInTimeZoneString___calendar;
  midnightsForRangeInTimeZoneString___calendar = v3;

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v5 dateByAddingTimeInterval:-63072000.0];

  id v6 = [[CalDateRange alloc] initWithStartDate:v8 duration:126144000.0];
  id v7 = (void *)midnightsForRangeInTimeZoneString___rangeToCache;
  midnightsForRangeInTimeZoneString___rangeToCache = (uint64_t)v6;
}

- (BOOL)containsRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CalDateRange *)self startDate];
    id v6 = [v4 startDate];
    if ([v5 CalIsBeforeOrSameAsDate:v6])
    {
      id v7 = [(CalDateRange *)self endDate];
      id v8 = [v4 endDate];
      char v9 = [v7 CalIsAfterOrSameAsDate:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

id __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)midnightsForRangeInTimeZoneString___calendar;
  objc_sync_enter(v4);
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:*(void *)(a1 + 32)];
  if (v5) {
    [(id)midnightsForRangeInTimeZoneString___calendar setTimeZone:v5];
  }
  id v6 = [v3 _calculateMidnightsInCalendar:midnightsForRangeInTimeZoneString___calendar];

  objc_sync_exit(v4);

  return v6;
}

- (id)_calculateMidnightsInCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(CalDateRange *)self startDate];
  id v6 = [v4 startOfDayForDate:v5];

  id v7 = [(CalDateRange *)self endDate];
  id v8 = [v4 startOfDayForDate:v7];

  char v9 = [(CalDateRange *)self endDate];
  LODWORD(v7) = [v8 isEqualToDate:v9];

  if (v7)
  {
    uint64_t v10 = [v8 dateByAddingDays:-1 inCalendar:v4];

    id v8 = (void *)v10;
  }
  v11 = [MEMORY[0x1E4F1CA70] orderedSet];
  [v11 addObject:v6];
  int v12 = [MEMORY[0x1E4F1C9D8] CalComponentForDays:1];
  double v13 = [v11 lastObject];
  uint64_t v14 = [v13 compare:v8];

  if (v14 == -1)
  {
    uint64_t v15 = 1;
    do
    {
      [v12 setDay:v15];
      id v16 = [v4 dateByAddingComponents:v12 toDate:v6 options:0];
      v17 = [v4 startOfDayForDate:v16];
      char v18 = [v16 isEqualToDate:v17];

      if ((v18 & 1) == 0)
      {
        id v19 = [v16 dateByAddingTimeInterval:21600.0];
        uint64_t v20 = [v4 startOfDayForDate:v19];

        id v16 = (void *)v20;
      }
      [v11 addObject:v16];

      id v21 = [v11 lastObject];
      uint64_t v22 = [v21 compare:v8];

      ++v15;
    }
    while (v22 == -1);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (id)rangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v6 endDate:v5];

  return v7;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(CalDateRange *)self startDate];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v4 descriptionWithLocale:v5];
  id v7 = [(CalDateRange *)self endDate];
  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v9 = [v7 descriptionWithLocale:v8];
  uint64_t v10 = [v3 stringWithFormat:@"%@ - %@", v6, v9];

  return (NSString *)v10;
}

- (double)duration
{
  id v3 = [(CalDateRange *)self endDate];
  id v4 = [(CalDateRange *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

+ (id)rangeWithRange:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  double v5 = [v3 startDate];
  double v6 = [v3 endDate];

  id v7 = [v4 rangeWithStartDate:v5 endDate:v6];

  return v7;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(CalDateRange *)self startDate];
    if ([v4 CalIsAfterOrSameAsDate:v5])
    {
      double v6 = [(CalDateRange *)self endDate];
      char v7 = [v4 CalIsBeforeDate:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [(CalDateRange *)self startDate];
    char v7 = [v5 startDate];
    if ([v6 isEqual:v7])
    {
      id v8 = [(CalDateRange *)self endDate];
      char v9 = [v5 endDate];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4 = a3;
  id v5 = [(CalDateRange *)self startDate];
  double v6 = [(CalDateRange *)self endDate];
  char v7 = [v4 startDate];
  id v8 = [v4 endDate];

  BOOL v9 = +[CalDateRange rangesIntersectWithStartDate1:v5 endDate1:v6 startDate2:v7 endDate2:v8];
  return v9;
}

- (BOOL)intersectsRange:(id)a3 allowSinglePointIntersection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [v6 startDate];
  id v8 = [v6 endDate];

  LOBYTE(v4) = [(CalDateRange *)self intersectsRangeWithStartDate:v7 endDate:v8 allowSinglePointIntersection:v4];
  return v4;
}

- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4 allowSinglePointIntersection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [(CalDateRange *)self startDate];
  v11 = [(CalDateRange *)self endDate];
  LOBYTE(v5) = +[CalDateRange rangesIntersectWithStartDate1:v10 endDate1:v11 startDate2:v9 endDate2:v8 allowSinglePointIntersection:v5];

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(CalDateRange *)self startDate];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CalDateRange *)self endDate];
  unint64_t v6 = 3 * [v5 hash] + 2 * v4;

  return v6;
}

- (id)subtractRange:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  BOOL v5 = +[CalDateRange rangeWithRange:v4];
  BOOL v6 = [(CalDateRange *)self isEqual:v5];

  if (v6)
  {
LABEL_3:
    char v7 = objc_alloc_init(CalDisjointDateRange);
    goto LABEL_9;
  }
  if (![(CalDateRange *)self intersectsRange:v4])
  {
LABEL_8:
    v17 = [MEMORY[0x1E4F1CAD0] setWithObject:self];
    char v7 = +[CalDisjointDateRange disjointRangeWithDistinctRanges:v17];

    goto LABEL_9;
  }
  id v8 = [(CalDateRange *)self startDate];
  id v9 = [v4 startDate];
  int v10 = [v8 CalIsBeforeDate:v9];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CA80] set];
    int v12 = [(CalDateRange *)self startDate];
    double v13 = [v4 startDate];
    uint64_t v14 = +[CalDateRange rangeWithStartDate:v12 endDate:v13];
    [v11 addObject:v14];

    uint64_t v15 = [(CalDateRange *)self endDate];
    id v16 = [v4 endDate];
    LODWORD(v13) = [v15 isAfterDate:v16];

    if (!v13) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v19 = [(CalDateRange *)self startDate];
  uint64_t v20 = [v4 startDate];
  if ([v19 CalIsAfterDate:v20])
  {

LABEL_15:
    int v24 = [(CalDateRange *)self endDate];
    v25 = [v4 endDate];
    int v26 = [v24 isAfterDate:v25];

    if (!v26) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F1CA80] set];
LABEL_17:
    v27 = [v4 endDate];
    v28 = [(CalDateRange *)self endDate];
    v29 = +[CalDateRange rangeWithStartDate:v27 endDate:v28];
    [v11 addObject:v29];

LABEL_18:
    char v7 = +[CalDisjointDateRange disjointRangeWithDistinctRanges:v11];

    goto LABEL_9;
  }
  id v21 = [(CalDateRange *)self startDate];
  uint64_t v22 = [v4 startDate];
  int v23 = [v21 isEqualToDate:v22];

  if (v23) {
    goto LABEL_15;
  }
  char v7 = 0;
LABEL_9:

  return v7;
}

- (id)unionRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(CalDateRange *)self copy];
  BOOL v6 = (void *)[v4 copy];

  if (v6)
  {
    char v7 = [v6 startDate];
    id v8 = [v5 startDate];
    int v9 = [v7 CalIsBeforeDate:v8];

    if (v9)
    {
      int v10 = [v6 startDate];
      [v5 setStartDate:v10];
    }
    v11 = [v6 endDate];
    int v12 = [v5 endDate];
    int v13 = [v11 CalIsAfterDate:v12];

    if (v13)
    {
      uint64_t v14 = [v6 endDate];
      [v5 setEndDate:v14];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CalDateRange *)self startDate];
  BOOL v6 = [(CalDateRange *)self endDate];
  char v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  return v7;
}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 multiplier:(unint64_t)a5
{
  id v8 = [a1 rangeWithRange:a3];
  [v8 duration];
  if (a5 < 2) {
    goto LABEL_6;
  }
  if (a4 == 2)
  {
    double v13 = (v9 * (double)a5 - v9) * 0.5;
    uint64_t v14 = [v8 startDate];
    v11 = [v14 dateByAddingTimeInterval:-v13];

    uint64_t v15 = [v8 endDate];
    id v16 = [v15 dateByAddingTimeInterval:v13];

    int v12 = [a1 rangeWithStartDate:v11 endDate:v16];

    goto LABEL_9;
  }
  if (a4 == 1)
  {
    double v17 = -((double)a5 * v9);
    char v18 = [v8 endDate];
    v11 = [v18 dateByAddingTimeInterval:v17];

    id v19 = [v8 endDate];
    int v12 = [a1 rangeWithStartDate:v11 endDate:v19];

    goto LABEL_9;
  }
  if (a4)
  {
LABEL_6:
    int v12 = 0;
    goto LABEL_10;
  }
  double v10 = v9 * (double)a5;
  v11 = [v8 startDate];
  int v12 = [a1 rangeWithStartDate:v11 duration:v10];
LABEL_9:

LABEL_10:

  return v12;
}

- (BOOL)isValid
{
  id v3 = [(CalDateRange *)self startDate];
  if (v3)
  {
    id v4 = [(CalDateRange *)self endDate];
    if (v4)
    {
      BOOL v5 = [(CalDateRange *)self startDate];
      BOOL v6 = [(CalDateRange *)self endDate];
      char v7 = [v5 CalIsBeforeDate:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)intersectionWithRange:(id)a3
{
  id v4 = a3;
  if ([(CalDateRange *)self intersectsRange:v4])
  {
    BOOL v5 = [(CalDateRange *)self startDate];
    BOOL v6 = [v4 startDate];
    char v7 = [v5 laterDate:v6];
    id v8 = [(CalDateRange *)self endDate];
    double v9 = [v4 endDate];
    double v10 = [v8 earlierDate:v9];
    v11 = +[CalDateRange rangeWithStartDate:v7 endDate:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)midpoint
{
  id v3 = [(CalDateRange *)self startDate];
  [(CalDateRange *)self duration];
  BOOL v5 = [v3 dateByAddingTimeInterval:v4 * 0.5];

  return v5;
}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 duration:(double)a5
{
  id v8 = [a1 rangeWithRange:a3];
  [v8 duration];
  if (v9 >= a5)
  {
    int v12 = [a1 rangeWithRange:v8];
    goto LABEL_11;
  }
  if (a4 == 2)
  {
    double v13 = [v8 startDate];
    uint64_t v14 = [v13 dateByAddingTimeInterval:-(a5 * 0.5)];

    uint64_t v15 = [v8 endDate];
    id v16 = [v15 dateByAddingTimeInterval:a5 * 0.5];

    int v12 = [a1 rangeWithStartDate:v14 endDate:v16];

LABEL_9:
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    double v17 = [v8 startDate];
    uint64_t v14 = [v17 dateByAddingTimeInterval:-a5];

    char v18 = [v8 endDate];
    int v12 = [a1 rangeWithStartDate:v14 endDate:v18];

    goto LABEL_9;
  }
  if (a4)
  {
    int v12 = 0;
  }
  else
  {
    double v10 = [v8 startDate];
    [v8 duration];
    int v12 = [a1 rangeWithStartDate:v10 duration:v11 + a5];
  }
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"start"];
  [v5 encodeObject:self->_endDate forKey:@"end"];
}

+ (id)rangeByExpandingRange:(id)a3 direction:(int64_t)a4 components:(id)a5 calendar:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  switch(a4)
  {
    case 2:
      double v13 = [v9 startDate];
      int v12 = [v11 CalDateBySubtractingComponents:v10 fromDate:v13];

      goto LABEL_6;
    case 1:
      id v16 = [v9 startDate];
      int v12 = [v11 CalDateBySubtractingComponents:v10 fromDate:v16];

      uint64_t v15 = [v9 endDate];
      goto LABEL_8;
    case 0:
      int v12 = [v9 startDate];
LABEL_6:
      uint64_t v14 = [v9 endDate];
      uint64_t v15 = [v11 dateByAddingComponents:v10 toDate:v14 options:0];

LABEL_8:
      double v17 = +[CalDateRange rangeWithStartDate:v12 endDate:v15];

      goto LABEL_10;
  }
  double v17 = 0;
LABEL_10:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalDateRange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
  BOOL v6 = (NSDate *)[v5 copy];
  startDate = self->_startDate;
  self->_startDate = v6;

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"end"];

  id v9 = (NSDate *)[v8 copy];
  endDate = self->_endDate;
  self->_endDate = v9;

  return self;
}

- (void)setDuration:(double)a3
{
  id v6 = [(CalDateRange *)self startDate];
  id v5 = [v6 dateByAddingTimeInterval:a3];
  [(CalDateRange *)self setEndDate:v5];
}

- (void)setStartDate:(id)a3 duration:(double)a4
{
  [(CalDateRange *)self setStartDate:a3];

  [(CalDateRange *)self setDuration:a4];
}

+ (BOOL)range:(id)a3 intersectsRange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v6 startDate];
  id v8 = [v6 endDate];

  id v9 = [v5 startDate];
  id v10 = [v5 endDate];

  BOOL v11 = +[CalDateRange rangesIntersectWithStartDate1:v7 endDate1:v8 startDate2:v9 endDate2:v10];
  return v11;
}

+ (BOOL)range:(id)a3 intersectsRange:(id)a4 allowSinglePointIntersection:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 startDate];
  id v10 = [v8 endDate];

  BOOL v11 = [v7 startDate];
  int v12 = [v7 endDate];

  LOBYTE(v5) = +[CalDateRange rangesIntersectWithStartDate1:v9 endDate1:v10 startDate2:v11 endDate2:v12 allowSinglePointIntersection:v5];
  return v5;
}

+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 startDate];
  BOOL v11 = [v9 endDate];

  LOBYTE(v9) = +[CalDateRange rangesIntersectWithStartDate1:v10 endDate1:v11 startDate2:v8 endDate2:v7];
  return (char)v9;
}

+ (BOOL)range:(id)a3 intersectsRangeWithStartDate:(id)a4 endDate:(id)a5 allowSinglePointIntersection:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v11 startDate];
  double v13 = [v11 endDate];

  LOBYTE(v6) = +[CalDateRange rangesIntersectWithStartDate1:v12 endDate1:v13 startDate2:v10 endDate2:v9 allowSinglePointIntersection:v6];
  return v6;
}

- (BOOL)intersectsRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CalDateRange *)self startDate];
  id v9 = [(CalDateRange *)self endDate];
  BOOL v10 = +[CalDateRange rangesIntersectWithStartDate1:v8 endDate1:v9 startDate2:v7 endDate2:v6];

  return v10;
}

+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6
{
  return +[CalDateRange rangesIntersectWithStartDate1:a3 endDate1:a4 startDate2:a5 endDate2:a6 allowSinglePointIntersection:0];
}

+ (BOOL)rangesIntersectWithStartDate1:(id)a3 endDate1:(id)a4 startDate2:(id)a5 endDate2:(id)a6 allowSinglePointIntersection:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  LOBYTE(v16) = 0;
  if (v11 && v12 && v13 && v14)
  {
    double v17 = [v11 laterDate:v13];
    char v18 = [v12 earlierDate:v15];
    if ([v17 isBeforeDate:v18]) {
      goto LABEL_6;
    }
    int v16 = [v17 isEqualToDate:v18];
    if (!v16 || a7) {
      goto LABEL_7;
    }
    if ((v20 = [v11 isEqualToDate:v12], int v21 = objc_msgSend(v13, "isEqualToDate:", v15), v20)
      && (v21 & 1) != 0
      || (v20 | v21) == 1
      && (([v17 CalIsBeforeDate:v12] & 1) != 0 || (objc_msgSend(v17, "CalIsBeforeDate:", v15) & 1) != 0))
    {
LABEL_6:
      LOBYTE(v16) = 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
LABEL_7:
  }
  return v16;
}

- (id)briefDescription
{
  if (briefDescription_onceToken != -1) {
    dispatch_once(&briefDescription_onceToken, &__block_literal_global_37);
  }
  id v3 = NSString;
  id v4 = [(CalDateRange *)self startDate];
  BOOL v5 = __32__CalDateRange_briefDescription__block_invoke_2((uint64_t)v4, v4);
  id v6 = [(CalDateRange *)self endDate];
  id v7 = __32__CalDateRange_briefDescription__block_invoke_2((uint64_t)v6, v6);
  id v8 = [v3 stringWithFormat:@"%@ - %@", v5, v7];

  return v8;
}

uint64_t __32__CalDateRange_briefDescription__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)briefDescription_dateFormatter;
  briefDescription_dateFormatter = (uint64_t)v0;

  [(id)briefDescription_dateFormatter setDateFormat:@"y'/'M'/'d"];
  briefDescription_cachedBriefStrings = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

id __32__CalDateRange_briefDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)briefDescription_cachedBriefStrings;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CalDateRange_briefDescription__block_invoke_3;
  v7[3] = &unk_1E56CEB70;
  id v8 = v2;
  id v4 = v2;
  BOOL v5 = [v3 CALobjectForKey:v4 calculatedWithBlock:v7];

  return v5;
}

id __32__CalDateRange_briefDescription__block_invoke_3(uint64_t a1)
{
  id v2 = (id)briefDescription_dateFormatter;
  objc_sync_enter(v2);
  id v3 = [(id)briefDescription_dateFormatter stringFromDate:*(void *)(a1 + 32)];
  objc_sync_exit(v2);

  return v3;
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_34);

  return v4;
}

uint64_t __50__CalDateRange_midnightsForRangeInTimeZoneString___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end