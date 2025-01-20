@interface CLSHolidayCalendarEventRuleTraits
- (BOOL)containsMePerson;
- (CLSHolidayCalendarEventRuleTraits)init;
- (id)description;
- (unint64_t)locationTrait;
- (unint64_t)numberOfPeople;
- (unint64_t)peopleTrait;
- (void)setContainsMePerson:(BOOL)a3;
- (void)setLocationTrait:(unint64_t)a3;
- (void)setNumberOfPeople:(unint64_t)a3;
- (void)setPeopleTrait:(unint64_t)a3;
@end

@implementation CLSHolidayCalendarEventRuleTraits

- (void)setLocationTrait:(unint64_t)a3
{
  self->_locationTrait = a3;
}

- (unint64_t)locationTrait
{
  return self->_locationTrait;
}

- (void)setPeopleTrait:(unint64_t)a3
{
  self->_peopleTrait = a3;
}

- (unint64_t)peopleTrait
{
  return self->_peopleTrait;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (void)setContainsMePerson:(BOOL)a3
{
  self->_containsMePerson = a3;
}

- (BOOL)containsMePerson
{
  return self->_containsMePerson;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CLSHolidayCalendarEventRuleTraits;
  v4 = [(CLSHolidayCalendarEventRuleTraits *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ location %lu, people %lu, numberOfPeople %lu, containsMe %d", v4, self->_locationTrait, self->_peopleTrait, self->_numberOfPeople, self->_containsMePerson];

  return v5;
}

- (CLSHolidayCalendarEventRuleTraits)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSHolidayCalendarEventRuleTraits;
  result = [(CLSHolidayCalendarEventRuleTraits *)&v3 init];
  if (result)
  {
    result->_containsMePerson = 1;
    result->_peopleTrait = 0;
    result->_locationTrait = 0;
    result->_numberOfPeople = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end