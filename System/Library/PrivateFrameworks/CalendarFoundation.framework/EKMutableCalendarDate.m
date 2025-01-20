@interface EKMutableCalendarDate
- (id)copyWithZone:(_NSZone *)a3;
- (void)addComponents:(id)a3;
- (void)addDays:(int64_t)a3;
- (void)addHours:(int64_t)a3;
- (void)addMinutes:(int64_t)a3;
- (void)addMonths:(int64_t)a3;
- (void)addSeconds:(int64_t)a3;
- (void)addYears:(int64_t)a3;
@end

@implementation EKMutableCalendarDate

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [EKCalendarDate alloc];
  date = self->super._date;
  components = self->super._components;
  calendar = self->super._calendar;

  return [(EKCalendarDate *)v4 initWithDate:date components:components calendar:calendar];
}

- (void)addYears:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingYears:a3 inCalendar:self->super._calendar];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addMonths:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingMonths:a3 inCalendar:self->super._calendar];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addDays:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingDays:a3 inCalendar:self->super._calendar];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addHours:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingHours:a3 inCalendar:self->super._calendar];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addMinutes:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingMinutes:a3 inCalendar:self->super._calendar];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addSeconds:(int64_t)a3
{
  v5 = [(EKCalendarDate *)self date];
  v6 = [v5 dateByAddingTimeInterval:(double)a3];
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

- (void)addComponents:(id)a3
{
  calendar = self->super._calendar;
  id v5 = a3;
  v6 = [(EKCalendarDate *)self date];
  v7 = [(NSCalendar *)calendar dateByAddingComponents:v5 toDate:v6 options:0];

  date = self->super._date;
  self->super._date = v7;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;
}

@end