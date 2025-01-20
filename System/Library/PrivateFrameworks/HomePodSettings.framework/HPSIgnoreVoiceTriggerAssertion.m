@interface HPSIgnoreVoiceTriggerAssertion
+ (NSString)label;
- (HPSAssertion)assertion;
- (HPSIgnoreVoiceTriggerAssertion)initWithIdentifier:(id)a3;
- (HPSIgnoreVoiceTriggerAssertion)initWithIdentifier:(id)a3 connectionProvider:(id)a4;
- (NSString)identifier;
- (void)dealloc;
- (void)invalidateWithCompletion:(id)a3;
- (void)setAssertion:(id)a3;
@end

@implementation HPSIgnoreVoiceTriggerAssertion

- (HPSIgnoreVoiceTriggerAssertion)initWithIdentifier:(id)a3
{
  return [(HPSIgnoreVoiceTriggerAssertion *)self initWithIdentifier:a3 connectionProvider:0];
}

- (HPSIgnoreVoiceTriggerAssertion)initWithIdentifier:(id)a3 connectionProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPSIgnoreVoiceTriggerAssertion;
  v8 = [(HPSIgnoreVoiceTriggerAssertion *)&v12 init];
  if (v8)
  {
    v9 = [[HPSAssertion alloc] initWithIdentifier:v6 assertionType:0 connectionProvider:v7];
    assertion = v8->_assertion;
    v8->_assertion = v9;
  }
  return v8;
}

+ (NSString)label
{
  return (NSString *)@"IgnoreVoiceTrigger";
}

- (NSString)identifier
{
  v2 = [(HPSIgnoreVoiceTriggerAssertion *)self assertion];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HPSIgnoreVoiceTriggerAssertion *)self assertion];
  [v5 invalidateWithCompletion:v4];
}

- (void)dealloc
{
  v3 = [(HPSIgnoreVoiceTriggerAssertion *)self assertion];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HPSIgnoreVoiceTriggerAssertion;
  [(HPSIgnoreVoiceTriggerAssertion *)&v4 dealloc];
}

- (HPSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end