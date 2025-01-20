@interface FCCPercentageOfDayRule
- (FCCPercentageOfDayRule)initWithMinimumDayDuration:(double)a3 percentOfDay:(double)a4;
- (FCCPercentageOfDayRule)initWithProtobuf:(id)a3;
- (FCCPercentageOfDayRule)initWithTransportData:(id)a3;
- (NSString)description;
- (double)minimumDayDuration;
- (double)percentOfDay;
- (id)protobuf;
- (id)transportData;
@end

@implementation FCCPercentageOfDayRule

- (FCCPercentageOfDayRule)initWithMinimumDayDuration:(double)a3 percentOfDay:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FCCPercentageOfDayRule;
  result = [(FCCPercentageOfDayRule *)&v7 init];
  if (result)
  {
    result->_minimumDayDuration = a3;
    result->_percentOfDay = a4;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCPercentageOfDayRule: minimumDayDuration: %.1f, percentOfDay: %.1f", *(void *)&self->_minimumDayDuration, *(void *)&self->_percentOfDay];
}

- (FCCPercentageOfDayRule)initWithProtobuf:(id)a3
{
  id v4 = a3;
  [v4 minimumDayDuration];
  double v6 = v5;
  [v4 percentOfDay];
  double v8 = v7;

  return [(FCCPercentageOfDayRule *)self initWithMinimumDayDuration:v6 percentOfDay:v8];
}

- (id)protobuf
{
  v3 = objc_alloc_init(FCCPercentageOfDayRuleProtobuf);
  [(FCCPercentageOfDayRuleProtobuf *)v3 setMinimumDayDuration:self->_minimumDayDuration];
  [(FCCPercentageOfDayRuleProtobuf *)v3 setPercentOfDay:self->_percentOfDay];
  return v3;
}

- (FCCPercentageOfDayRule)initWithTransportData:(id)a3
{
  id v4 = a3;
  double v5 = [[FCCPercentageOfDayRuleProtobuf alloc] initWithData:v4];

  double v6 = [(FCCPercentageOfDayRule *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCPercentageOfDayRule *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (double)minimumDayDuration
{
  return self->_minimumDayDuration;
}

- (double)percentOfDay
{
  return self->_percentOfDay;
}

@end