@interface IMRuntimeTestRun
- (BOOL)hasSucceeded;
- (IMRuntimeTest)test;
- (IMRuntimeTestRun)initWithTest:(id)a3;
- (void)recordFailureWithDescription:(id)a3 inFile:(id)a4 atLine:(unint64_t)a5 expected:(BOOL)a6;
- (void)setSucceeded:(BOOL)a3;
@end

@implementation IMRuntimeTestRun

- (IMRuntimeTestRun)initWithTest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRuntimeTestRun;
  v6 = [(IMRuntimeTestRun *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_test, a3);
  }

  return v7;
}

- (void)recordFailureWithDescription:(id)a3 inFile:(id)a4 atLine:(unint64_t)a5 expected:(BOOL)a6
{
}

- (IMRuntimeTest)test
{
  return (IMRuntimeTest *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)hasSucceeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (void).cxx_destruct
{
}

@end