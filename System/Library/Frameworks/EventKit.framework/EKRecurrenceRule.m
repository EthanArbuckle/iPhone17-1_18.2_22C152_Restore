@interface EKRecurrenceRule
+ (Class)frozenClass;
+ (EKRecurrenceRule)recurrenceRuleWithType:(int64_t)a3 interval:(unint64_t)a4 end:(id)a5;
+ (id)_acceptableStartDateRangeForDailyRecurrenceWithCurrentStartDate:(id)a3;
+ (id)_acceptableStartDateRangeForMonthlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4;
+ (id)_acceptableStartDateRangeForWeeklyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4;
+ (id)_acceptableStartDateRangeForYearlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4;
+ (id)adjustDateIntoUTC:(id)a3 dateOnly:(BOOL)a4 floating:(BOOL)a5;
+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5;
+ (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3;
+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
+ (int)_calDayOfWeekFromEKWeekday:(int64_t)a3;
+ (int64_t)_ekWeekdayFromCalDayOfWeek:(int)a3;
+ (int64_t)daysTypeForDayArray:(id)a3;
- (BOOL)dirtyStateMayAffectExceptionDates;
- (BOOL)hasDuplicateMonthsOfYear;
- (BOOL)isAnyDayRule;
- (BOOL)isEqualToRecurrenceRule:(id)a3;
- (BOOL)isPinnedToEndOfFrequency;
- (BOOL)isSimpleRule;
- (BOOL)isWeekdayRule;
- (BOOL)isWeekendRule;
- (BOOL)mayOccurAfterDate:(id)a3;
- (BOOL)newStartDateIsInvalid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5;
- (BOOL)newStartDateIsValid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5;
- (BOOL)recurrenceEndHasChanges;
- (BOOL)shouldPinMonthDays;
- (BOOL)usesEndDate;
- (EKRecurrenceEnd)recurrenceEnd;
- (EKRecurrenceFrequency)frequency;
- (EKRecurrenceRule)init;
- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval daysOfTheWeek:(NSArray *)days daysOfTheMonth:(NSArray *)monthDays monthsOfTheYear:(NSArray *)months weeksOfTheYear:(NSArray *)weeksOfTheYear daysOfTheYear:(NSArray *)daysOfTheYear setPositions:(NSArray *)setPositions end:(EKRecurrenceEnd *)end;
- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval end:(EKRecurrenceEnd *)end;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)setPositions;
- (NSArray)weeksOfTheYear;
- (NSDate)cachedEndDate;
- (NSDateComponents)dateComponents;
- (NSInteger)firstDayOfTheWeek;
- (NSInteger)interval;
- (NSString)UUID;
- (NSString)calendarIdentifier;
- (id)_acceptableStartDateRangeWithCurrentStartDate:(id)a3 calendar:(id)a4;
- (id)_recurrenceHelper;
- (id)cachedEndDateTimeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)endDate;
- (id)humanReadableDescriptionWithStartDate:(id)a3;
- (id)humanReadableDescriptionWithStartDate:(id)a3 isConcise:(BOOL)a4;
- (id)specifier;
- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4;
- (int)firstDayOfTheWeekRaw;
- (int)frequencyRaw;
- (unint64_t)count;
- (void)_resetInternalStateWithForce:(BOOL)a3;
- (void)_updateSpecifierIfNeeded;
- (void)frequency;
- (void)invalidateCachedEndDate;
- (void)rollback;
- (void)setCachedEndDate:(id)a3;
- (void)setCachedEndDateTimeZone:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDaysOfTheMonth:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)setDaysOfTheYear:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFirstDayOfTheWeek:(unint64_t)a3;
- (void)setFirstDayOfTheWeekRaw:(int)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setFrequencyRaw:(int)a3;
- (void)setInterval:(unint64_t)a3;
- (void)setMonthsOfTheYear:(id)a3;
- (void)setRecurrenceEnd:(EKRecurrenceEnd *)recurrenceEnd;
- (void)setSetPositions:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setUUID:(id)a3;
- (void)setWeeksOfTheYear:(id)a3;
@end

@implementation EKRecurrenceRule

id __33__EKRecurrenceRule_recurrenceEnd__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) endDate];
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v2)
  {
    v4 = [[EKRecurrenceEnd alloc] initWithEndDate:v2];
  }
  else
  {
    v5 = (void *)v3;
    if (!v3) {
      goto LABEL_6;
    }
    v4 = [[EKRecurrenceEnd alloc] initWithOccurrenceCount:v3];
  }
  v5 = v4;
LABEL_6:

  return v5;
}

- (EKRecurrenceEnd)recurrenceEnd
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__EKRecurrenceRule_recurrenceEnd__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKObject *)self cachedValueForKey:@"recurrenceEnd" populateBlock:v4];

  return (EKRecurrenceEnd *)v2;
}

- (id)endDate
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57200]];
}

- (unint64_t)count
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571F8]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSArray)weeksOfTheYear
{
  v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  unint64_t v3 = [v2 weeksOfTheYear];

  return (NSArray *)v3;
}

- (NSArray)setPositions
{
  v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  unint64_t v3 = [v2 setPositions];

  return (NSArray *)v3;
}

- (NSArray)monthsOfTheYear
{
  v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  unint64_t v3 = [v2 monthsOfTheYear];

  return (NSArray *)v3;
}

- (NSInteger)interval
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57218]];
  NSInteger v3 = [v2 integerValue];

  return v3;
}

- (EKRecurrenceFrequency)frequency
{
  uint64_t v2 = [(EKRecurrenceRule *)self frequencyRaw];
  EKRecurrenceFrequency result = (unint64_t)(v2 - 1);
  if (result >= 4)
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      [(EKRecurrenceRule *)v2 frequency];
    }
    return 0;
  }
  return result;
}

- (int)frequencyRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57210]];
  int v3 = [v2 integerValue];

  return v3;
}

- (NSInteger)firstDayOfTheWeek
{
  NSInteger result = objc_msgSend((id)objc_opt_class(), "_ekWeekdayFromCalDayOfWeek:", -[EKRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  if (!result) {
    return 2;
  }
  return result;
}

- (int)firstDayOfTheWeekRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57208]];
  int v3 = [v2 intValue];

  return v3;
}

- (NSArray)daysOfTheYear
{
  uint64_t v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  int v3 = [v2 daysOfTheYear];

  return (NSArray *)v3;
}

- (NSArray)daysOfTheWeek
{
  uint64_t v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  int v3 = [v2 daysOfTheWeek];

  return (NSArray *)v3;
}

- (NSArray)daysOfTheMonth
{
  uint64_t v2 = [(EKRecurrenceRule *)self _recurrenceHelper];
  int v3 = [v2 daysOfTheMonth];

  return (NSArray *)v3;
}

- (id)_recurrenceHelper
{
  recurrenceHelper = self->_recurrenceHelper;
  if (!recurrenceHelper)
  {
    v4 = [EKRecurrenceHelper alloc];
    uint64_t v5 = [(EKRecurrenceRule *)self specifier];
    uint64_t v6 = [(EKRecurrenceHelper *)v4 initWithSpecifier:v5];
    uint64_t v7 = self->_recurrenceHelper;
    self->_recurrenceHelper = v6;

    recurrenceHelper = self->_recurrenceHelper;
  }

  return recurrenceHelper;
}

- (id)specifier
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57228]];
}

+ (int64_t)_ekWeekdayFromCalDayOfWeek:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 8) {
    return qword_1A4F8FCC0[a3];
  }
  uint64_t v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKRecurrenceRule _ekWeekdayFromCalDayOfWeek:](v3, v5, v6, v7, v8, v9, v10, v11);
  }
  return 0;
}

- (void).cxx_destruct
{
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)knownSingleValueKeysForComparison_keys;

  return v2;
}

void __53__EKRecurrenceRule_knownSingleValueKeysForComparison__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57218];
  v5[0] = *MEMORY[0x1E4F57210];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57200];
  v5[2] = *MEMORY[0x1E4F57208];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F57228];
  v5[4] = *MEMORY[0x1E4F571F8];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v4 = (void *)knownSingleValueKeysForComparison_keys;
  knownSingleValueKeysForComparison_keys = v3;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken, &__block_literal_global_7);
  }
  uint64_t v2 = (void *)knownIdentityKeysForComparison_keys;

  return v2;
}

void __50__EKRecurrenceRule_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownIdentityKeysForComparison_keys;
  knownIdentityKeysForComparison_keys = v0;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys;

  return v2;
}

void __45__EKRecurrenceRule_knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57220];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipWeakKeys_keys;
  knownRelationshipWeakKeys_keys = v0;
}

+ (EKRecurrenceRule)recurrenceRuleWithType:(int64_t)a3 interval:(unint64_t)a4 end:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initRecurrenceWithFrequency:a3 interval:a4 end:v8];

  return (EKRecurrenceRule *)v9;
}

- (EKRecurrenceRule)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKRecurrenceRule;
  uint64_t v2 = [(EKObject *)&v5 init];
  if (v2)
  {
    uint64_t v3 = EKUUIDString();
    [(EKRecurrenceRule *)v2 setUUID:v3];

    [(EKRecurrenceRule *)v2 setFrequency:1];
    [(EKRecurrenceRule *)v2 setInterval:1];
    [(EKRecurrenceRule *)v2 setFirstDayOfTheWeek:0];
    [(EKObject *)v2 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
  }
  return v2;
}

- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval daysOfTheWeek:(NSArray *)days daysOfTheMonth:(NSArray *)monthDays monthsOfTheYear:(NSArray *)months weeksOfTheYear:(NSArray *)weeksOfTheYear daysOfTheYear:(NSArray *)daysOfTheYear setPositions:(NSArray *)setPositions end:(EKRecurrenceEnd *)end
{
  v17 = days;
  v18 = monthDays;
  v19 = months;
  v20 = weeksOfTheYear;
  v21 = daysOfTheYear;
  v22 = setPositions;
  v23 = end;
  v24 = [(EKRecurrenceRule *)self init];
  if (v24)
  {
    if (interval <= 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Interval must be greater than 0"];
    }
    [(EKRecurrenceRule *)v24 setFrequency:type];
    [(EKRecurrenceRule *)v24 setInterval:interval];
    [(EKRecurrenceRule *)v24 setRecurrenceEnd:v23];
    [(EKRecurrenceRule *)v24 setDaysOfTheWeek:v17];
    [(EKRecurrenceRule *)v24 setDaysOfTheMonth:v18];
    [(EKRecurrenceRule *)v24 setSetPositions:v22];
    [(EKRecurrenceRule *)v24 setMonthsOfTheYear:v19];
    [(EKRecurrenceRule *)v24 setDaysOfTheYear:v21];
    [(EKRecurrenceRule *)v24 setWeeksOfTheYear:v20];
  }

  return v24;
}

- (EKRecurrenceRule)initRecurrenceWithFrequency:(EKRecurrenceFrequency)type interval:(NSInteger)interval end:(EKRecurrenceEnd *)end
{
  return [(EKRecurrenceRule *)self initRecurrenceWithFrequency:type interval:interval daysOfTheWeek:0 daysOfTheMonth:0 monthsOfTheYear:0 weeksOfTheYear:0 daysOfTheYear:0 setPositions:0 end:end];
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(EKRecurrenceRule *)self stringValueAsDateOnly:0 isFloating:0];
  uint64_t v6 = [v3 stringWithFormat:@"%@ <%p> RRULE %@", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v9.receiver = self;
    v9.super_class = (Class)EKRecurrenceRule;
    return [(EKObject *)&v9 copyWithZone:a3];
  }
  else
  {
    objc_super v5 = objc_alloc_init(EKRecurrenceRule);
    [(EKRecurrenceRule *)v5 setFrequency:[(EKRecurrenceRule *)self frequency]];
    [(EKRecurrenceRule *)v5 setInterval:[(EKRecurrenceRule *)self interval]];
    uint64_t v6 = [(EKRecurrenceRule *)self recurrenceEnd];
    [(EKRecurrenceRule *)v5 setRecurrenceEnd:v6];

    uint64_t v7 = [(EKRecurrenceRule *)self specifier];
    [(EKRecurrenceRule *)v5 setSpecifier:v7];

    [(EKRecurrenceRule *)v5 setFirstDayOfTheWeekRaw:[(EKRecurrenceRule *)self firstDayOfTheWeekRaw]];
  }
  return v5;
}

- (NSDateComponents)dateComponents
{
  uint64_t v3 = objc_opt_new();
  unsigned int v4 = [(EKRecurrenceRule *)self interval];
  if ((int)v4 >= 1)
  {
    switch([(EKRecurrenceRule *)self frequency])
    {
      case EKRecurrenceFrequencyDaily:
        uint64_t v5 = v4;
        goto LABEL_6;
      case EKRecurrenceFrequencyWeekly:
        uint64_t v5 = (int)(7 * v4);
LABEL_6:
        [v3 setDay:v5];
        break;
      case EKRecurrenceFrequencyMonthly:
        [v3 setMonth:v4];
        break;
      case EKRecurrenceFrequencyYearly:
        [v3 setYear:v4];
        break;
      default:
        id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Encountered illegal value for EKRecurrenceFrequency" userInfo:0];
        objc_exception_throw(v7);
    }
  }

  return (NSDateComponents *)v3;
}

- (NSString)calendarIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F1C318];
}

- (void)setFrequencyRaw:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57210]];
}

- (void)setFrequency:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    uint64_t v3 = (a3 + 1);
  }
  else {
    uint64_t v3 = 0;
  }
  [(EKRecurrenceRule *)self setFrequencyRaw:v3];
}

- (void)setInterval:(unint64_t)a3
{
  if ((int)a3 <= 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"EKRecurrenceRule.m" lineNumber:276 description:@"Interval must be greater than or equal to 1"];
  }
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v7 forKey:*MEMORY[0x1E4F57218]];
}

- (void)setEndDate:(id)a3
{
}

- (void)setCount:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F571F8]];
}

- (void)setRecurrenceEnd:(EKRecurrenceEnd *)recurrenceEnd
{
  uint64_t v10 = recurrenceEnd;
  id v4 = [(EKRecurrenceRule *)self recurrenceEnd];
  BOOL v5 = [(EKRecurrenceEnd *)v10 isEqual:v4];

  uint64_t v6 = v10;
  if (!v5)
  {
    id v7 = (void *)[(EKRecurrenceEnd *)v10 copy];
    [(EKObject *)self setCachedValue:v7 forKey:@"recurrenceEnd"];

    if (v10)
    {
      if (![(EKRecurrenceEnd *)v10 usesEndDate])
      {
        [(EKRecurrenceRule *)self setEndDate:0];
        uint64_t v9 = [(EKRecurrenceEnd *)v10 occurrenceCount];
        goto LABEL_8;
      }
      id v8 = [(EKRecurrenceEnd *)v10 endDate];
      [(EKRecurrenceRule *)self setEndDate:v8];
    }
    else
    {
      [(EKRecurrenceRule *)self setEndDate:0];
    }
    uint64_t v9 = 0;
LABEL_8:
    [(EKRecurrenceRule *)self setCount:v9];
    uint64_t v6 = v10;
  }
}

- (BOOL)recurrenceEndHasChanges
{
  if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F57200]]) {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F571F8];

  return [(EKObject *)self _hasChangesForKey:v4];
}

- (NSDate)cachedEndDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571E8]];
}

- (void)setCachedEndDate:(id)a3
{
}

- (id)cachedEndDateTimeZone
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571F0]];
}

- (void)setCachedEndDateTimeZone:(id)a3
{
}

- (void)invalidateCachedEndDate
{
  [(EKRecurrenceRule *)self setCachedEndDate:0];

  [(EKRecurrenceRule *)self setCachedEndDateTimeZone:0];
}

- (void)setFirstDayOfTheWeekRaw:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57208]];
}

+ (int)_calDayOfWeekFromEKWeekday:(int64_t)a3
{
  if ((unint64_t)a3 < 8) {
    return dword_1A4F8FD00[a3];
  }
  BOOL v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKRecurrenceRule _calDayOfWeekFromEKWeekday:](a3, v5, v6, v7, v8, v9, v10, v11);
  }
  return 7;
}

- (void)setFirstDayOfTheWeek:(unint64_t)a3
{
  if ((int)a3 >= 8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"EKRecurrenceRule.m", 428, @"Invalid parameter not satisfying: %@", @"(int)firstDay <= EKWeekdaySaturday" object file lineNumber description];
  }
  uint64_t v5 = [(id)objc_opt_class() _calDayOfWeekFromEKWeekday:a3];

  [(EKRecurrenceRule *)self setFirstDayOfTheWeekRaw:v5];
}

- (void)setSpecifier:(id)a3
{
}

- (void)setDaysOfTheWeek:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setDaysOfTheWeek:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)setDaysOfTheMonth:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setDaysOfTheMonth:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)setDaysOfTheYear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setDaysOfTheYear:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)setWeeksOfTheYear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setWeeksOfTheYear:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)setMonthsOfTheYear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setMonthsOfTheYear:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)setSetPositions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self _recurrenceHelper];
  [v5 setSetPositions:v4];

  [(EKRecurrenceRule *)self _updateSpecifierIfNeeded];
}

- (void)_updateSpecifierIfNeeded
{
  if ([(EKRecurrenceHelper *)self->_recurrenceHelper isDirty])
  {
    id v3 = [(EKRecurrenceHelper *)self->_recurrenceHelper specifier];
    [(EKRecurrenceRule *)self setSpecifier:v3];
  }
}

- (void)_resetInternalStateWithForce:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKRecurrenceRule;
  [(EKObject *)&v5 _resetInternalStateWithForce:a3];
  [(EKObject *)self clearCachedValueForKey:@"recurrenceEnd"];
  recurrenceHelper = self->_recurrenceHelper;
  self->_recurrenceHelper = 0;
}

- (void)rollback
{
  v4.receiver = self;
  v4.super_class = (Class)EKRecurrenceRule;
  [(EKObject *)&v4 rollback];
  recurrenceHelper = self->_recurrenceHelper;
  self->_recurrenceHelper = 0;
}

- (BOOL)dirtyStateMayAffectExceptionDates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EKObject *)self changeSet];
  id v3 = [v2 changedKeys];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F571F8];
    uint64_t v9 = *MEMORY[0x1E4F57200];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqualToString:", v8, (void)v14) & 1) == 0
          && ![v11 isEqualToString:v9])
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)mayOccurAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKRecurrenceRule *)self recurrenceEnd];
  uint64_t v6 = [v5 endDate];

  if (v6 && [v6 compare:v4] == -1)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v7 = [(EKRecurrenceRule *)self recurrenceEnd];
    uint64_t v8 = [v7 occurrenceCount];

    if (v8)
    {
      uint64_t v9 = [(EKRecurrenceRule *)self cachedEndDate];
      uint64_t v10 = v9;
      if (v9) {
        BOOL v11 = [v9 compare:v4] != -1;
      }
      else {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isPinnedToEndOfFrequency
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(EKRecurrenceRule *)self frequency] != EKRecurrenceFrequencyMonthly) {
    goto LABEL_18;
  }
  id v3 = [(EKRecurrenceRule *)self setPositions];
  if ([v3 count] != 1)
  {
LABEL_17:

    goto LABEL_18;
  }
  id v4 = [(EKRecurrenceRule *)self setPositions];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  if ([v5 integerValue] != -1)
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v6 = [(EKRecurrenceRule *)self daysOfTheMonth];
  if ((unint64_t)[v6 count] < 2)
  {

    goto LABEL_16;
  }
  uint64_t v7 = [(EKRecurrenceRule *)self daysOfTheMonth];
  unint64_t v8 = [v7 count];

  if (v8 <= 4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [&unk_1EF953060 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
LABEL_8:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(&unk_1EF953060);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        long long v14 = [(EKRecurrenceRule *)self daysOfTheMonth];
        LOBYTE(v13) = [v13 isEqualToArray:v14];

        if (v13) {
          return 1;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [&unk_1EF953060 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
LABEL_18:
  if ([(EKRecurrenceRule *)self frequency] != EKRecurrenceFrequencyYearly) {
    return 0;
  }
  long long v15 = [(EKRecurrenceRule *)self setPositions];
  if ([v15 count] != 1)
  {
LABEL_22:

    return 0;
  }
  long long v16 = [(EKRecurrenceRule *)self setPositions];
  long long v17 = [v16 objectAtIndexedSubscript:0];
  if ([v17 integerValue] != -1)
  {

    goto LABEL_22;
  }
  uint64_t v19 = [(EKRecurrenceRule *)self daysOfTheMonth];
  char v20 = [&unk_1EF953090 isEqualToArray:v19];

  return (v20 & 1) != 0;
}

- (BOOL)isWeekdayRule
{
  uint64_t v2 = [(EKRecurrenceRule *)self daysOfTheWeek];
  id v3 = [v2 valueForKey:@"dayOfTheWeek"];

  LOBYTE(v2) = [v3 isEqualToArray:&unk_1EF9530A8];
  return (char)v2;
}

- (BOOL)isWeekendRule
{
  uint64_t v2 = [(EKRecurrenceRule *)self daysOfTheWeek];
  id v3 = [v2 valueForKey:@"dayOfTheWeek"];

  LOBYTE(v2) = [v3 isEqualToArray:&unk_1EF9530C0];
  return (char)v2;
}

- (BOOL)isAnyDayRule
{
  uint64_t v2 = [(EKRecurrenceRule *)self daysOfTheWeek];
  id v3 = [v2 valueForKey:@"dayOfTheWeek"];

  LOBYTE(v2) = [v3 isEqualToArray:&unk_1EF9530D8];
  return (char)v2;
}

- (BOOL)isSimpleRule
{
  if ([(EKRecurrenceRule *)self frequency] == EKRecurrenceFrequencyDaily) {
    return 1;
  }
  EKRecurrenceFrequency v6 = [(EKRecurrenceRule *)self frequency];
  if (v6 == EKRecurrenceFrequencyWeekly)
  {
    uint64_t v2 = [(EKRecurrenceRule *)self daysOfTheWeek];
    if ((unint64_t)[v2 count] < 2)
    {
      BOOL v7 = 1;
LABEL_14:

      return v7;
    }
  }
  EKRecurrenceFrequency v8 = [(EKRecurrenceRule *)self frequency];
  if (v8 != EKRecurrenceFrequencyMonthly
    || ([(EKRecurrenceRule *)self daysOfTheWeek],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 count]))
  {
    int v9 = 0;
    BOOL v7 = 0;
    if ([(EKRecurrenceRule *)self frequency] != EKRecurrenceFrequencyYearly) {
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v10 = [(EKRecurrenceRule *)self daysOfTheWeek];
    if ([v10 count])
    {

      BOOL v7 = 0;
      if (!v9) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v12 = [(EKRecurrenceRule *)self monthsOfTheYear];
    if (![v12 count])
    {
      v13 = [(EKRecurrenceRule *)self weeksOfTheYear];
      if (![v13 count])
      {
        long long v14 = [(EKRecurrenceRule *)self daysOfTheYear];
        long long v15 = v13;
        BOOL v7 = (unint64_t)[v14 count] < 2;

        if ((v9 & 1) == 0)
        {
LABEL_11:
          if (v8 != EKRecurrenceFrequencyMonthly) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    BOOL v7 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v4 = [(EKRecurrenceRule *)self daysOfTheMonth];
  if ((unint64_t)[v4 count] > 1)
  {
    if ([(EKRecurrenceRule *)self frequency] != EKRecurrenceFrequencyYearly)
    {

      BOOL v7 = 0;
LABEL_12:

      goto LABEL_13;
    }
    int v9 = 1;
    goto LABEL_8;
  }

  BOOL v7 = 1;
LABEL_13:
  if (v6 == EKRecurrenceFrequencyWeekly) {
    goto LABEL_14;
  }
  return v7;
}

+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Encountered illegal value for  EKRecurrenceFrequency" userInfo:0];
    objc_exception_throw(v4);
  }
  return off_1E5B96928[a3];
}

+ (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return &stru_1EF932508;
  }
  else {
    return off_1E5B96948[a3 - 1];
  }
}

+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = (objc_class *)MEMORY[0x1E4F28C10];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setFormatterBehavior:1040];
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  [v9 setTimeZone:v10];

  uint64_t v11 = @"yyyyMMdd'T'HHmmss'Z'";
  if (v5) {
    uint64_t v11 = @"yyyyMMdd'T'HHmmss";
  }
  if (v6) {
    uint64_t v12 = @"yyyyMMdd";
  }
  else {
    uint64_t v12 = v11;
  }
  [v9 setDateFormat:v12];
  v13 = [v9 stringFromDate:v8];

  return v13;
}

+ (id)adjustDateIntoUTC:(id)a3 dateOnly:(BOOL)a4 floating:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (a4 || v5)
  {
    id v8 = (void *)MEMORY[0x1E4F57708];
    id v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v10 = [v8 dateInFloatingTimeZoneFromDate:v7 inTimeZone:v9];

    id v7 = (id)v10;
  }

  return v7;
}

- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [MEMORY[0x1E4F28E78] string];
  id v8 = +[EKRecurrenceRule iCalendarValueFromRecurrenceType:[(EKRecurrenceRule *)self frequency]];
  [v7 appendFormat:@"FREQ=%@", v8];

  objc_msgSend(v7, "appendFormat:", @";INTERVAL=%lu", -[EKRecurrenceRule interval](self, "interval"));
  id v9 = [(EKRecurrenceRule *)self recurrenceEnd];

  if (v9)
  {
    uint64_t v10 = [(EKRecurrenceRule *)self recurrenceEnd];
    int v11 = [v10 usesEndDate];

    uint64_t v12 = [(EKRecurrenceRule *)self recurrenceEnd];
    v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 endDate];

      long long v15 = [(id)objc_opt_class() adjustDateIntoUTC:v14 dateOnly:v5 floating:v4];
      long long v16 = +[EKRecurrenceRule iCalendarValueFromDate:v15 isDateOnly:v5 isFloating:v4];
      [v7 appendFormat:@";UNTIL=%@", v16];

      v13 = (void *)v14;
    }
    else
    {
      objc_msgSend(v7, "appendFormat:", @";COUNT=%lu", objc_msgSend(v12, "occurrenceCount"));
    }
  }
  long long v17 = [(EKRecurrenceRule *)self monthsOfTheYear];
  unint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [(EKRecurrenceRule *)self monthsOfTheYear];
    char v20 = [v19 objectAtIndex:0];
    [v7 appendFormat:@";BYMONTH=%@", v20];

    if (v18 != 1)
    {
      unsigned int v21 = 2;
      uint64_t v22 = 1;
      do
      {
        long long v23 = [(EKRecurrenceRule *)self monthsOfTheYear];
        long long v24 = [v23 objectAtIndex:v22];
        [v7 appendFormat:@",%@", v24];

        uint64_t v22 = v21;
        BOOL v25 = v18 > v21++;
      }
      while (v25);
    }
  }
  uint64_t v26 = [(EKRecurrenceRule *)self daysOfTheMonth];
  unint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = [(EKRecurrenceRule *)self daysOfTheMonth];
    v29 = [v28 objectAtIndex:0];
    [v7 appendFormat:@";BYMONTHDAY=%@", v29];

    if (v27 != 1)
    {
      unsigned int v30 = 2;
      uint64_t v31 = 1;
      do
      {
        v32 = [(EKRecurrenceRule *)self daysOfTheMonth];
        v33 = [v32 objectAtIndex:v31];
        [v7 appendFormat:@",%@", v33];

        uint64_t v31 = v30;
        BOOL v25 = v27 > v30++;
      }
      while (v25);
    }
  }
  v34 = [(EKRecurrenceRule *)self daysOfTheYear];
  unint64_t v35 = [v34 count];

  if (v35)
  {
    v36 = [(EKRecurrenceRule *)self daysOfTheYear];
    v37 = [v36 objectAtIndex:0];
    [v7 appendFormat:@";BYYEARDAY=%@", v37];

    if (v35 != 1)
    {
      unsigned int v38 = 2;
      uint64_t v39 = 1;
      do
      {
        v40 = [(EKRecurrenceRule *)self daysOfTheYear];
        v41 = [v40 objectAtIndex:v39];
        [v7 appendFormat:@",%@", v41];

        uint64_t v39 = v38;
        BOOL v25 = v35 > v38++;
      }
      while (v25);
    }
  }
  v42 = [(EKRecurrenceRule *)self weeksOfTheYear];
  unint64_t v43 = [v42 count];

  if (v43)
  {
    v44 = [(EKRecurrenceRule *)self weeksOfTheYear];
    v45 = [v44 objectAtIndex:0];
    [v7 appendFormat:@";BYWEEKNO=%@", v45];

    if (v43 != 1)
    {
      unsigned int v46 = 2;
      uint64_t v47 = 1;
      do
      {
        v48 = [(EKRecurrenceRule *)self weeksOfTheYear];
        v49 = [v48 objectAtIndex:v47];
        [v7 appendFormat:@",%@", v49];

        uint64_t v47 = v46;
        BOOL v25 = v43 > v46++;
      }
      while (v25);
    }
  }
  v50 = [(EKRecurrenceRule *)self daysOfTheWeek];
  unint64_t v51 = [v50 count];

  if (v51)
  {
    v52 = [(EKRecurrenceRule *)self daysOfTheWeek];
    v53 = [v52 objectAtIndex:0];

    v54 = [v53 iCalendarDescription];
    [v7 appendFormat:@";BYDAY=%@", v54];

    if (v51 != 1)
    {
      unsigned int v55 = 2;
      uint64_t v56 = 1;
      do
      {
        v57 = [(EKRecurrenceRule *)self daysOfTheWeek];
        v58 = [v57 objectAtIndex:v56];

        v59 = [v58 iCalendarDescription];
        [v7 appendFormat:@",%@", v59];

        uint64_t v56 = v55;
        BOOL v25 = v51 > v55++;
      }
      while (v25);
    }
  }
  v60 = [(EKRecurrenceRule *)self setPositions];
  unint64_t v61 = [v60 count];

  if (v61)
  {
    v62 = [(EKRecurrenceRule *)self setPositions];
    v63 = [v62 objectAtIndex:0];
    [v7 appendFormat:@";BYSETPOS=%@", v63];

    if (v61 != 1)
    {
      unsigned int v64 = 2;
      uint64_t v65 = 1;
      do
      {
        v66 = [(EKRecurrenceRule *)self setPositions];
        v67 = [v66 objectAtIndex:v65];
        [v7 appendFormat:@",%@", v67];

        uint64_t v65 = v64;
        BOOL v25 = v61 > v64++;
      }
      while (v25);
    }
  }
  if ([(EKRecurrenceRule *)self frequency] == EKRecurrenceFrequencyWeekly
    && [(EKRecurrenceRule *)self interval] >= 2)
  {
    v68 = [(EKRecurrenceRule *)self daysOfTheWeek];
    uint64_t v69 = [v68 count];

    if (v69)
    {
      v70 = objc_msgSend(&unk_1EF9530F0, "objectAtIndexedSubscript:", -[EKRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek") - 1);
      [v7 appendFormat:@";WKST=%@", v70];
    }
  }
  v71 = [NSString stringWithString:v7];

  return v71;
}

- (id)humanReadableDescriptionWithStartDate:(id)a3
{
  return [(EKRecurrenceRule *)self humanReadableDescriptionWithStartDate:a3 isConcise:1];
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int64_t v10 = +[EKRecurrenceDayOfWeek icsWeekDayFromDayOfTheWeek:](EKRecurrenceDayOfWeek, "icsWeekDayFromDayOfTheWeek:", [v9 dayOfTheWeek]);
        id v11 = objc_alloc(MEMORY[0x1E4FB7EF8]);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "weekNumber"));
        v13 = (void *)[v11 initWithWeekday:v10 number:v12];
        [v4 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  int64_t v14 = [MEMORY[0x1E4F577A8] daysTypeForDayArray:v4];
  return v14;
}

- (id)humanReadableDescriptionWithStartDate:(id)a3 isConcise:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = self;
  id v7 = a3;
  if ([(EKRecurrenceRule *)v6 isPinnedToEndOfFrequency])
  {
    id v8 = [EKRecurrenceRule alloc];
    uint64_t v9 = [(EKRecurrenceRule *)v6 frequency];
    uint64_t v10 = [(EKRecurrenceRule *)v6 interval];
    id v11 = [(EKRecurrenceRule *)v6 recurrenceEnd];
    uint64_t v12 = [(EKRecurrenceRule *)v8 initRecurrenceWithFrequency:v9 interval:v10 end:v11];

    uint64_t v6 = (EKRecurrenceRule *)v12;
  }
  v13 = (void *)MEMORY[0x1E4F577A8];
  int64_t v14 = [(EKRecurrenceRule *)v6 stringValueAsDateOnly:0 isFloating:0];
  long long v15 = [v13 humanReadableDescriptionWithStartDate:v7 ofRecurrenceRuleICSString:v14 isConcise:v4];

  return v15;
}

- (BOOL)hasDuplicateMonthsOfYear
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[&unk_1EF953108 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = [(EKRecurrenceRule *)self monthsOfTheYear];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectAtIndexedSubscript:", (int)(objc_msgSend(v10, "intValue") - 1));
        char v12 = [v11 BOOLValue];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v8, (int)(objc_msgSend(v10, "intValue") - 1));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)newStartDateIsValid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [(EKRecurrenceRule *)self _acceptableStartDateRangeWithCurrentStartDate:a4 calendar:a5];
  LOBYTE(a4) = [v9 containsDate:v8];

  return (char)a4;
}

- (BOOL)newStartDateIsInvalid:(id)a3 currentStartDate:(id)a4 calendar:(id)a5
{
  return ![(EKRecurrenceRule *)self newStartDateIsValid:a3 currentStartDate:a4 calendar:a5];
}

+ (id)_acceptableStartDateRangeForDailyRecurrenceWithCurrentStartDate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F576D0];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "distantPast", a3);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v6 = [v3 rangeWithStartDate:v4 endDate:v5];

  return v6;
}

+ (id)_acceptableStartDateRangeForWeeklyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  id v8 = 0;
  double v9 = 0.0;
  int v4 = [a4 rangeOfUnit:0x2000 startDate:&v8 interval:&v9 forDate:a3];
  id v5 = v8;
  uint64_t v6 = 0;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F576D0] rangeWithStartDate:v5 duration:v9];
  }

  return v6;
}

+ (id)_acceptableStartDateRangeForMonthlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  id v8 = 0;
  double v9 = 0.0;
  int v4 = [a4 rangeOfUnit:8 startDate:&v8 interval:&v9 forDate:a3];
  id v5 = v8;
  uint64_t v6 = 0;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F576D0] rangeWithStartDate:v5 duration:v9];
  }

  return v6;
}

+ (id)_acceptableStartDateRangeForYearlyRecurrenceWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  id v8 = 0;
  double v9 = 0.0;
  int v4 = [a4 rangeOfUnit:4 startDate:&v8 interval:&v9 forDate:a3];
  id v5 = v8;
  uint64_t v6 = 0;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F576D0] rangeWithStartDate:v5 duration:v9];
  }

  return v6;
}

- (id)_acceptableStartDateRangeWithCurrentStartDate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(EKRecurrenceRule *)self frequency])
  {
    case EKRecurrenceFrequencyDaily:
      id v8 = [(id)objc_opt_class() _acceptableStartDateRangeForDailyRecurrenceWithCurrentStartDate:v6];
      goto LABEL_6;
    case EKRecurrenceFrequencyWeekly:
      id v8 = [(id)objc_opt_class() _acceptableStartDateRangeForWeeklyRecurrenceWithCurrentStartDate:v6 calendar:v7];
      goto LABEL_6;
    case EKRecurrenceFrequencyMonthly:
      id v8 = [(id)objc_opt_class() _acceptableStartDateRangeForMonthlyRecurrenceWithCurrentStartDate:v6 calendar:v7];
      goto LABEL_6;
    case EKRecurrenceFrequencyYearly:
      id v8 = [(id)objc_opt_class() _acceptableStartDateRangeForYearlyRecurrenceWithCurrentStartDate:v6 calendar:v7];
LABEL_6:
      self = v8;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)isEqualToRecurrenceRule:(id)a3
{
  id v8 = a3;
  EKRecurrenceFrequency v9 = [(EKRecurrenceRule *)self frequency];
  if (v9 != [v8 frequency]
    || (NSInteger v10 = -[EKRecurrenceRule interval](self, "interval"), v10 != [v8 interval])
    || (NSInteger v11 = [(EKRecurrenceRule *)self firstDayOfTheWeek],
        v11 != [v8 firstDayOfTheWeek]))
  {
    char v14 = 0;
    goto LABEL_9;
  }
  char v12 = [(EKRecurrenceRule *)self recurrenceEnd];
  if (v12 || ([v8 recurrenceEnd], (v60 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [(EKRecurrenceRule *)self recurrenceEnd];
    int v4 = [v8 recurrenceEnd];
    if (![v3 isEqual:v4])
    {
      char v14 = 0;
LABEL_76:

      goto LABEL_77;
    }
    int v13 = 1;
  }
  else
  {
    v60 = 0;
    int v13 = 0;
  }
  long long v16 = [(EKRecurrenceRule *)self monthsOfTheYear];
  if (v16 || ([v8 monthsOfTheYear], (v54 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [(EKRecurrenceRule *)self monthsOfTheYear];
    id v6 = [v8 monthsOfTheYear];
    if (![v5 isEqual:v6])
    {
      char v14 = 0;
      goto LABEL_73;
    }
    int v58 = 1;
    int v59 = v13;
  }
  else
  {
    int v58 = 0;
    int v59 = v13;
    v54 = 0;
  }
  long long v17 = [(EKRecurrenceRule *)self daysOfTheMonth];
  if (v17 || ([v8 daysOfTheMonth], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v18 = [(EKRecurrenceRule *)self daysOfTheMonth];
    unsigned int v55 = [v8 daysOfTheMonth];
    uint64_t v56 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      char v14 = 0;
LABEL_68:

      goto LABEL_69;
    }
    int v53 = 1;
  }
  else
  {
    v50 = 0;
    int v53 = 0;
  }
  uint64_t v57 = [(EKRecurrenceRule *)self daysOfTheYear];
  if (v57 || ([v8 daysOfTheYear], (v45 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v19 = [(EKRecurrenceRule *)self daysOfTheYear];
    unint64_t v51 = [v8 daysOfTheYear];
    v52 = v19;
    if (![v19 isEqual:v51])
    {
      char v14 = 0;
LABEL_64:

      goto LABEL_65;
    }
    int v48 = 1;
  }
  else
  {
    v45 = 0;
    int v48 = 0;
  }
  uint64_t v49 = [(EKRecurrenceRule *)self weeksOfTheYear];
  if (v49 || ([v8 weeksOfTheYear], (v40 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v20 = [(EKRecurrenceRule *)self weeksOfTheYear];
    unsigned int v46 = [v8 weeksOfTheYear];
    uint64_t v47 = v20;
    if (![v20 isEqual:v46])
    {
      char v14 = 0;
LABEL_60:

      goto LABEL_61;
    }
    int v43 = 1;
  }
  else
  {
    v40 = 0;
    int v43 = 0;
  }
  uint64_t v44 = [(EKRecurrenceRule *)self daysOfTheWeek];
  if (v44 || ([v8 daysOfTheWeek], (unint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v21 = [(EKRecurrenceRule *)self daysOfTheWeek];
    v41 = [v8 daysOfTheWeek];
    v42 = v21;
    if (![v21 isEqual:v41])
    {
      char v14 = 0;
LABEL_56:

      goto LABEL_57;
    }
    int v38 = 1;
  }
  else
  {
    unint64_t v35 = 0;
    int v38 = 0;
  }
  uint64_t v39 = [(EKRecurrenceRule *)self setPositions];
  if (v39 || ([v8 setPositions], (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = [(EKRecurrenceRule *)self setPositions];
    v36 = [v8 setPositions];
    v37 = v22;
    if (![v22 isEqual:v36])
    {
      char v14 = 0;
      goto LABEL_52;
    }
    int v34 = 1;
  }
  else
  {
    uint64_t v31 = 0;
    int v34 = 0;
  }
  uint64_t v23 = [(EKRecurrenceRule *)self calendarIdentifier];
  if (v23 || ([v8 calendarIdentifier], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v32 = [(EKRecurrenceRule *)self calendarIdentifier];
    [v8 calendarIdentifier];
    long long v24 = v33 = (void *)v23;
    char v14 = objc_msgSend(v32, "isEqual:");

    if (v33)
    {

      if (!v34) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    v29 = (void *)v30;
  }
  else
  {
    v29 = 0;
    char v14 = 1;
  }

  if (v34)
  {
LABEL_52:
  }
LABEL_53:
  BOOL v25 = (void *)v39;
  if (!v39)
  {

    BOOL v25 = 0;
  }

  if (v38) {
    goto LABEL_56;
  }
LABEL_57:
  uint64_t v26 = (void *)v44;
  if (!v44)
  {

    uint64_t v26 = 0;
  }

  if (v43) {
    goto LABEL_60;
  }
LABEL_61:
  unint64_t v27 = (void *)v49;
  if (!v49)
  {

    unint64_t v27 = 0;
  }

  if (v48) {
    goto LABEL_64;
  }
LABEL_65:
  v28 = (void *)v57;
  if (!v57)
  {

    v28 = 0;
  }

  if (v53) {
    goto LABEL_68;
  }
LABEL_69:
  if (!v17) {

  }
  if (v58)
  {
    int v13 = v59;
LABEL_73:

    if (v16) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  int v13 = v59;
  if (!v16) {
LABEL_74:
  }

LABEL_75:
  if (v13) {
    goto LABEL_76;
  }
LABEL_77:
  if (!v12) {

  }
LABEL_9:
  return v14;
}

- (BOOL)shouldPinMonthDays
{
  return self->_shouldPinMonthDays;
}

- (BOOL)usesEndDate
{
  return self->_usesEndDate;
}

- (void)frequency
{
}

+ (void)_ekWeekdayFromCalDayOfWeek:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_calDayOfWeekFromEKWeekday:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end