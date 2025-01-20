@interface FCCCoalescingRule
- (FCCCoalescingRule)initWithEventIdentifier:(id)a3 interval:(double)a4;
- (FCCCoalescingRule)initWithProtobuf:(id)a3;
- (FCCCoalescingRule)initWithTransportData:(id)a3;
- (NSString)description;
- (NSString)eventIdentifier;
- (double)interval;
- (id)protobuf;
- (id)transportData;
- (void)setEventIdentifier:(id)a3;
- (void)setInterval:(double)a3;
@end

@implementation FCCCoalescingRule

- (FCCCoalescingRule)initWithEventIdentifier:(id)a3 interval:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCCCoalescingRule;
  v8 = [(FCCCoalescingRule *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventIdentifier, a3);
    v9->_interval = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCCoalescingRule: eventIdentifier: %@, interval: %.1f", self->_eventIdentifier, *(void *)&self->_interval];
}

- (FCCCoalescingRule)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventIdentifier];
  [v4 interval];
  double v7 = v6;

  v8 = [(FCCCoalescingRule *)self initWithEventIdentifier:v5 interval:v7];
  return v8;
}

- (id)protobuf
{
  v3 = objc_alloc_init(FCCCoalescingRuleProtobuf);
  [(FCCCoalescingRuleProtobuf *)v3 setEventIdentifier:self->_eventIdentifier];
  [(FCCCoalescingRuleProtobuf *)v3 setInterval:self->_interval];
  return v3;
}

- (FCCCoalescingRule)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCCoalescingRuleProtobuf alloc] initWithData:v4];

  double v6 = [(FCCCoalescingRule *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCCoalescingRule *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void).cxx_destruct
{
}

@end