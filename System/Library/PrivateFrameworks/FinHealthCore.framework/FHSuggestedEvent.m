@interface FHSuggestedEvent
- (FHSuggestedEvent)initWithPPSuggestedEvent:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventIdentifier;
- (NSString)title;
- (id)description;
- (void)setEndDate:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FHSuggestedEvent

- (FHSuggestedEvent)initWithPPSuggestedEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHSuggestedEvent;
  v5 = [(FHSuggestedEvent *)&v11 init];
  if (v5)
  {
    v6 = [v4 title];
    [(FHSuggestedEvent *)v5 setTitle:v6];

    v7 = [v4 startDate];
    [(FHSuggestedEvent *)v5 setStartDate:v7];

    v8 = [v4 endDate];
    [(FHSuggestedEvent *)v5 setEndDate:v8];

    v9 = [v4 eventIdentifier];
    [(FHSuggestedEvent *)v5 setEventIdentifier:v9];
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"title", self->_title];
  [v3 appendFormat:@"%@: '%@'; ", @"startDate", self->_startDate];
  [v3 appendFormat:@"%@: '%@'; ", @"endDate", self->_endDate];
  [v3 appendFormat:@"%@: '%@'; ", @"eventIdentifier", self->_eventIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
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

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end