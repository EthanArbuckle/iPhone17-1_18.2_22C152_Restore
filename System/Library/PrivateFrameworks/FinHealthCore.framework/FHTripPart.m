@interface FHTripPart
- (CLPlacemark)mainLocation;
- (FHTripPart)initWithPPTripPart:(id)a3;
- (NSArray)eventIdentifiers;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (unint64_t)tripMode;
- (void)setEndDate:(id)a3;
- (void)setEventIdentifiers:(id)a3;
- (void)setMainLocation:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTripMode:(unint64_t)a3;
@end

@implementation FHTripPart

- (FHTripPart)initWithPPTripPart:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHTripPart;
  v5 = [(FHTripPart *)&v11 init];
  if (v5)
  {
    v6 = [v4 eventIdentifiers];
    [(FHTripPart *)v5 setEventIdentifiers:v6];

    v7 = [v4 mainLocation];
    [(FHTripPart *)v5 setMainLocation:v7];

    unsigned int v8 = [v4 tripMode];
    if (v8 >= 3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = v8;
    }
    [(FHTripPart *)v5 setTripMode:v9];
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"eventIdentifiers", self->_eventIdentifiers];
  [v3 appendFormat:@"%@: '%@'; ", @"mainLocation", self->_mainLocation];
  [v3 appendFormat:@"%@: '%lu'; ", @"tripMode", self->_tripMode];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (CLPlacemark)mainLocation
{
  return self->_mainLocation;
}

- (void)setMainLocation:(id)a3
{
}

- (unint64_t)tripMode
{
  return self->_tripMode;
}

- (void)setTripMode:(unint64_t)a3
{
  self->_tripMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
}

@end