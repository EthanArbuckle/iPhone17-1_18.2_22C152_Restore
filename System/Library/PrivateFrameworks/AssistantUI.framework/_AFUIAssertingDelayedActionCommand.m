@interface _AFUIAssertingDelayedActionCommand
- (BKSProcessAssertion)assertion;
- (SAUIDelayedActionCommand)command;
- (_AFUIAssertingDelayedActionCommand)initWithCommand:(id)a3 assertion:(id)a4;
@end

@implementation _AFUIAssertingDelayedActionCommand

- (_AFUIAssertingDelayedActionCommand)initWithCommand:(id)a3 assertion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AFUIAssertingDelayedActionCommand;
  v9 = [(_AFUIAssertingDelayedActionCommand *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    objc_storeStrong((id *)&v10->_assertion, a4);
  }

  return v10;
}

- (SAUIDelayedActionCommand)command
{
  return self->_command;
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);

  objc_storeStrong((id *)&self->_command, 0);
}

@end