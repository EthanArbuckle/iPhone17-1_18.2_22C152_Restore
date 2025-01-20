@interface IOKPowerManagerPowerAssertion
- (IOKPowerManagerPowerAssertion)initWithName:(id)a3 assertionTyoe:(id)a4 assertionLevel:(unsigned int)a5;
- (void)dealloc;
@end

@implementation IOKPowerManagerPowerAssertion

- (IOKPowerManagerPowerAssertion)initWithName:(id)a3 assertionTyoe:(id)a4 assertionLevel:(unsigned int)a5
{
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)IOKPowerManagerPowerAssertion;
  v10 = [(IOKPowerManagerPowerAssertion *)&v13 init];
  v11 = v10;
  if (v10 && IOPMAssertionCreateWithName(v9, a5, v8, &v10->_pmAssertionID))
  {

    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  IOPMAssertionRelease(self->_pmAssertionID);
  v3.receiver = self;
  v3.super_class = (Class)IOKPowerManagerPowerAssertion;
  [(IOKPowerManagerPowerAssertion *)&v3 dealloc];
}

@end