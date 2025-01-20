@interface ACXPowerAssertion
- (ACXPowerAssertion)initWithName:(id)a3 description:(id)a4 timeoutSeconds:(unint64_t)a5;
- (unsigned)assertion;
- (void)dealloc;
- (void)setAssertion:(unsigned int)a3;
@end

@implementation ACXPowerAssertion

- (ACXPowerAssertion)initWithName:(id)a3 description:(id)a4 timeoutSeconds:(unint64_t)a5
{
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)ACXPowerAssertion;
  v10 = [(ACXPowerAssertion *)&v15 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_8;
  }
  IOPMAssertionID AssertionID = 0;
  [(ACXPowerAssertion *)v10 setAssertion:0];
  if (!IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v8, v9, 0, 0, (double)a5, 0, &AssertionID))
  {
    [(ACXPowerAssertion *)v11 setAssertion:AssertionID];
LABEL_8:
    v12 = v11;
    goto LABEL_9;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)dealloc
{
  if ([(ACXPowerAssertion *)self assertion])
  {
    uint64_t v3 = IOPMAssertionRelease([(ACXPowerAssertion *)self assertion]);
    if (v3)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        uint64_t v4 = v3;
        MOLogWrite();
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)ACXPowerAssertion;
  [(ACXPowerAssertion *)&v5 dealloc];
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(unsigned int)a3
{
  self->_assertion = a3;
}

@end