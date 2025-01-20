@interface HMMTRAccessoryServerDiagnosticsEvent
- (HMMTRAccessoryServerDiagnosticsEvent)initWithValues:(id)a3;
- (NSArray)values;
@end

@implementation HMMTRAccessoryServerDiagnosticsEvent

- (void).cxx_destruct
{
}

- (NSArray)values
{
  return self->_values;
}

- (HMMTRAccessoryServerDiagnosticsEvent)initWithValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRAccessoryServerDiagnosticsEvent;
  v6 = [(HMMTRAccessoryServerDiagnosticsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_values, a3);
  }

  return v7;
}

@end