@interface DNDModeAssertionLifetime
+ (BOOL)supportsSecureCoding;
+ (id)_secureCodingLifetimeClasses;
+ (id)lifetimeForUserRequest;
+ (id)lifetimeMatchingScheduleWithIdentifier:(id)a3;
+ (id)lifetimeUntilEndOfCalendarEventWithUniqueID:(id)a3 occurrenceDate:(id)a4;
+ (id)lifetimeUntilEndOfScheduleWithIdentifier:(id)a3;
+ (id)lifetimeWithCalendarEventUniqueID:(id)a3 occurrenceDate:(id)a4;
+ (id)lifetimeWithCurrentLocation;
+ (id)lifetimeWithDateInterval:(id)a3;
+ (id)lifetimeWithDuration:(double)a3;
+ (id)lifetimeWithExplicitRegion:(id)a3;
- (DNDModeAssertionLifetime)initWithCoder:(id)a3;
- (id)_init;
- (unint64_t)lifetimeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionLifetime

+ (id)lifetimeWithDuration:(double)a3
{
  double v4 = fmin(a3, 86400.0);
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = (void *)[v5 initWithStartDate:v6 duration:v4];

  v8 = [a1 lifetimeWithDateInterval:v7];

  return v8;
}

+ (id)lifetimeWithCurrentLocation
{
  return +[DNDModeAssertionCurrentLocationLifetime sharedInstance];
}

+ (id)lifetimeWithDateInterval:(id)a3
{
  id v3 = a3;
  double v4 = [[DNDModeAssertionDateIntervalLifetime alloc] initWithDateInterval:v3];

  return v4;
}

+ (id)lifetimeUntilEndOfCalendarEventWithUniqueID:(id)a3 occurrenceDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DNDModeAssertionCalendarEventLifetime alloc] initWithEventUniqueID:v6 occurrenceDate:v5 onlyDuringEvent:0];

  return v7;
}

+ (id)lifetimeWithCalendarEventUniqueID:(id)a3 occurrenceDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[DNDModeAssertionCalendarEventLifetime alloc] initWithEventUniqueID:v6 occurrenceDate:v5 onlyDuringEvent:1];

  return v7;
}

+ (id)lifetimeMatchingScheduleWithIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = [[DNDModeAssertionScheduleLifetime alloc] initWithScheduleIdentifier:v3 behavior:0];

  return v4;
}

+ (id)lifetimeUntilEndOfScheduleWithIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = [[DNDModeAssertionScheduleLifetime alloc] initWithScheduleIdentifier:v3 behavior:1];

  return v4;
}

+ (id)lifetimeWithExplicitRegion:(id)a3
{
  id v3 = a3;
  double v4 = [[DNDModeAssertionExplicitRegionLifetime alloc] initWithRegion:v3];

  return v4;
}

+ (id)lifetimeForUserRequest
{
  id v2 = [(DNDModeAssertionLifetime *)[DNDModeAssertionUserRequestedLifetime alloc] _init];
  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DNDModeAssertionLifetime;
  return [(DNDModeAssertionLifetime *)&v3 init];
}

- (unint64_t)lifetimeType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionLifetime)initWithCoder:(id)a3
{
  [(DNDModeAssertionLifetime *)self doesNotRecognizeSelector:a2];
  return (DNDModeAssertionLifetime *)[(DNDModeAssertionLifetime *)self _init];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (id)_secureCodingLifetimeClasses
{
  if (_secureCodingLifetimeClasses_onceToken != -1) {
    dispatch_once(&_secureCodingLifetimeClasses_onceToken, &__block_literal_global_4);
  }
  id v2 = (void *)_secureCodingLifetimeClasses_lifetimeClasses;
  return v2;
}

uint64_t __56__DNDModeAssertionLifetime__secureCodingLifetimeClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  uint64_t v6 = _secureCodingLifetimeClasses_lifetimeClasses;
  _secureCodingLifetimeClasses_lifetimeClasses = v5;
  return MEMORY[0x1F41817F8](v5, v6);
}

@end