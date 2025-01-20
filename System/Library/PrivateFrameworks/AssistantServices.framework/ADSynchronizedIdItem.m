@interface ADSynchronizedIdItem
+ (id)alignToMidnight:(id)a3;
+ (id)calendar;
- (ADSynchronizedIdItem)initWithBMHomeSeed:(id)a3;
- (ADSynchronizedIdItem)initWithBMUserAggregationId:(id)a3;
- (ADSynchronizedIdItem)initWithBMUserSeed:(id)a3;
- (ADSynchronizedIdItem)initWithValue:(id)a3 andEffectiveFrom:(id)a4 andValidityDays:(unsigned int)a5 andCreatedOn:(id)a6 andAdoptedOn:(id)a7 andSwitchedCount:(unsigned int)a8;
- (NSDate)adoptedOn;
- (NSDate)createdOn;
- (NSDate)effectiveFrom;
- (NSDate)expirationDate;
- (NSUUID)value;
- (id)description;
- (id)initAndAdopt:(id)a3;
- (id)initAndAdopt:(id)a3 andSwitchedCount:(unsigned int)a4;
- (id)selectEarliest:(id)a3;
- (id)toBMSiriHomeSeedWithHomeIdentifier:(id)a3;
- (id)toBMSiriUserAggregationId;
- (id)toBMSiriUserSeed;
- (int64_t)_expirationDaysFrom:(id)a3 withCalendar:(id)a4;
- (int64_t)expirationDaysFrom:(id)a3;
- (int64_t)timelinePosition;
- (int64_t)timelinePositionWithTime:(id)a3;
- (int64_t)timelinePositionWithToday:(id)a3 withCalendar:(id)a4;
- (unsigned)switchedCount;
- (unsigned)validityDays;
@end

@implementation ADSynchronizedIdItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adoptedOn, 0);
  objc_storeStrong((id *)&self->_createdOn, 0);
  objc_storeStrong((id *)&self->_effectiveFrom, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (unsigned)switchedCount
{
  return self->_switchedCount;
}

- (NSDate)adoptedOn
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)createdOn
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)validityDays
{
  return self->_validityDays;
}

- (NSDate)effectiveFrom
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)value
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)toBMSiriHomeSeedWithHomeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)BMSiriHomeSeed);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  v8 = +[NSNumber numberWithInt:self->_validityDays];
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  v11 = +[NSNumber numberWithInt:self->_switchedCount];
  id v12 = [v5 initWithHomeIdentifier:v4 seed:value effectiveFrom:effectiveFrom validityDays:v8 createdOn:createdOn adoptedOn:adoptedOn switchedCount:v11];

  return v12;
}

- (id)toBMSiriUserAggregationId
{
  id v3 = objc_alloc((Class)BMSiriUserAggregationId);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  v6 = +[NSNumber numberWithInt:self->_validityDays];
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  v9 = +[NSNumber numberWithInt:self->_switchedCount];
  id v10 = [v3 initWithAggregationId:value effectiveFrom:effectiveFrom validityDays:v6 createdOn:createdOn adoptedOn:adoptedOn switchedCount:v9];

  return v10;
}

- (id)toBMSiriUserSeed
{
  id v3 = objc_alloc((Class)BMSiriUserSeed);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  v6 = +[NSNumber numberWithInt:self->_validityDays];
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  v9 = +[NSNumber numberWithInt:self->_switchedCount];
  id v10 = [v3 initWithSeed:value effectiveFrom:effectiveFrom validityDays:v6 createdOn:createdOn adoptedOn:adoptedOn switchedCount:v9];

  return v10;
}

- (int64_t)timelinePositionWithToday:(id)a3 withCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(NSDate *)self->_effectiveFrom compare:v6] == (id)1) {
    int64_t v8 = 2;
  }
  else {
    int64_t v8 = [(ADSynchronizedIdItem *)self _expirationDaysFrom:v6 withCalendar:v7] > 0;
  }

  return v8;
}

- (int64_t)timelinePositionWithTime:(id)a3
{
  id v4 = +[ADSynchronizedIdItem alignToMidnight:a3];
  id v5 = +[ADSynchronizedIdItem calendar];
  int64_t v6 = [(ADSynchronizedIdItem *)self timelinePositionWithToday:v4 withCalendar:v5];

  return v6;
}

- (int64_t)timelinePosition
{
  id v3 = +[NSDate now];
  int64_t v4 = [(ADSynchronizedIdItem *)self timelinePositionWithTime:v3];

  return v4;
}

- (id)selectEarliest:(id)a3
{
  int64_t v4 = (ADSynchronizedIdItem *)a3;
  createdOn = self->_createdOn;
  int64_t v6 = [(ADSynchronizedIdItem *)v4 createdOn];
  id v7 = [(NSDate *)createdOn compare:v6];

  if (v7 == (id)-1)
  {
    int64_t v8 = self;
  }
  else
  {
    int64_t v8 = v4;
    if (v7 != (id)1)
    {
      value = self->_value;
      id v10 = [(ADSynchronizedIdItem *)v4 value];
      NSComparisonResult v11 = [(NSUUID *)value compare:v10];

      if ((unint64_t)(v11 + 1) >= 2) {
        int64_t v8 = v4;
      }
      else {
        int64_t v8 = self;
      }
    }
  }
  id v12 = v8;

  return v12;
}

- (int64_t)_expirationDaysFrom:(id)a3 withCalendar:(id)a4
{
  uint64_t validityDays = self->_validityDays;
  id v5 = [a4 components:16 fromDate:self->_effectiveFrom toDate:a3 options:0];
  int64_t v6 = validityDays - (void)[v5 day];

  return v6;
}

- (int64_t)expirationDaysFrom:(id)a3
{
  id v4 = a3;
  id v5 = +[ADSynchronizedIdItem calendar];
  int64_t v6 = [(ADSynchronizedIdItem *)self _expirationDaysFrom:v4 withCalendar:v5];

  return v6;
}

- (NSDate)expirationDate
{
  id v3 = +[ADSynchronizedIdItem calendar];
  id v4 = [v3 dateByAddingUnit:16 value:self->_validityDays toDate:self->_effectiveFrom options:0];

  return (NSDate *)v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"effectiveFrom:%@ validityDays:%d createdOn:%@ adoptedOn:%@ switchedCount:%d", self->_effectiveFrom, self->_validityDays, self->_createdOn, self->_adoptedOn, self->_switchedCount];
}

- (id)initAndAdopt:(id)a3 andSwitchedCount:(unsigned int)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ADSynchronizedIdItem;
  id v7 = [(ADSynchronizedIdItem *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [v6 value];
    value = v7->_value;
    v7->_value = (NSUUID *)v8;

    uint64_t v10 = [v6 effectiveFrom];
    effectiveFrom = v7->_effectiveFrom;
    v7->_effectiveFrom = (NSDate *)v10;

    v7->_uint64_t validityDays = [v6 validityDays];
    uint64_t v12 = [v6 createdOn];
    createdOn = v7->_createdOn;
    v7->_createdOn = (NSDate *)v12;

    uint64_t v14 = +[NSDate now];
    adoptedOn = v7->_adoptedOn;
    v7->_adoptedOn = (NSDate *)v14;

    v7->_switchedCount = a4;
  }

  return v7;
}

- (id)initAndAdopt:(id)a3
{
  return [(ADSynchronizedIdItem *)self initAndAdopt:a3 andSwitchedCount:1];
}

- (ADSynchronizedIdItem)initWithValue:(id)a3 andEffectiveFrom:(id)a4 andValidityDays:(unsigned int)a5 andCreatedOn:(id)a6 andAdoptedOn:(id)a7 andSwitchedCount:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ADSynchronizedIdItem;
  v18 = [(ADSynchronizedIdItem *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_value, a3);
    objc_storeStrong((id *)&v19->_effectiveFrom, a4);
    v19->_uint64_t validityDays = a5;
    objc_storeStrong((id *)&v19->_createdOn, a6);
    objc_storeStrong((id *)&v19->_adoptedOn, a7);
    v19->_switchedCount = a8;
  }

  return v19;
}

- (ADSynchronizedIdItem)initWithBMHomeSeed:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADSynchronizedIdItem;
  id v5 = [(ADSynchronizedIdItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 seed];
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = [v4 effectiveFrom];
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_uint64_t validityDays = [v4 validityDays];
    uint64_t v10 = [v4 createdOn];
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = [v4 adoptedOn];
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

- (ADSynchronizedIdItem)initWithBMUserAggregationId:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADSynchronizedIdItem;
  id v5 = [(ADSynchronizedIdItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 aggregationId];
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = [v4 effectiveFrom];
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_uint64_t validityDays = [v4 validityDays];
    uint64_t v10 = [v4 createdOn];
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = [v4 adoptedOn];
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

- (ADSynchronizedIdItem)initWithBMUserSeed:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADSynchronizedIdItem;
  id v5 = [(ADSynchronizedIdItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 seed];
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = [v4 effectiveFrom];
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_uint64_t validityDays = [v4 validityDays];
    uint64_t v10 = [v4 createdOn];
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = [v4 adoptedOn];
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

+ (id)alignToMidnight:(id)a3
{
  id v3 = a3;
  id v4 = +[ADSynchronizedIdItem calendar];
  id v5 = [v4 startOfDayForDate:v3];

  return v5;
}

+ (id)calendar
{
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v3 = +[NSTimeZone timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v3];

  return v2;
}

@end