@interface CRPowerAssertion
- (CRPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4;
- (void)dealloc;
@end

@implementation CRPowerAssertion

- (CRPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRPowerAssertion;
  v4 = [(CRPowerAssertion *)&v6 init];
  if (v4) {
    v4->_powerAssertion = (void *)CPPowerAssertionCreate();
  }
  return v4;
}

- (void)dealloc
{
  powerAssertion = self->_powerAssertion;
  if (powerAssertion) {
    CFRelease(powerAssertion);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRPowerAssertion;
  [(CRPowerAssertion *)&v4 dealloc];
}

@end