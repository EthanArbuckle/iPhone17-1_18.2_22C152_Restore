@interface IXSPowerAssertion
- (IXSPowerAssertion)initWithAssertionName:(id)a3 details:(id)a4;
- (NSString)assertionName;
- (id)description;
- (unsigned)assertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation IXSPowerAssertion

- (IXSPowerAssertion)initWithAssertionName:(id)a3 details:(id)a4
{
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v17.receiver = self;
  v17.super_class = (Class)IXSPowerAssertion;
  v8 = [(IXSPowerAssertion *)&v17 init];
  if (v8)
  {
    v9 = (NSString *)[(__CFString *)v6 copy];
    assertionName = v8->_assertionName;
    v8->_assertionName = v9;

    IOPMAssertionID AssertionID = 0;
    IOReturn v11 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v6, v7, 0, 0, 0.0, 0, &AssertionID);
    v12 = sub_100004B28((uint64_t)off_100109BB8);
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10008B18C((uint64_t)v6, v11, v13);
      }

      IOPMAssertionID v14 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[IXSPowerAssertion initWithAssertionName:details:]";
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Acquired power assertion %@", buf, 0x16u);
      }

      IOPMAssertionID v14 = AssertionID;
    }
    v8->_assertion = v14;
  }

  return v8;
}

- (void)invalidate
{
  IOPMAssertionID assertion = self->_assertion;
  if (assertion)
  {
    IOReturn v4 = IOPMAssertionRelease(assertion);
    if (v4)
    {
      IOReturn v5 = v4;
      v6 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        v10 = "-[IXSPowerAssertion invalidate]";
        __int16 v11 = 1024;
        LODWORD(v12) = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: IOPMAssertionRelease returned %d", (uint8_t *)&v9, 0x12u);
      }
    }
    v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      assertionName = self->_assertionName;
      int v9 = 136315394;
      v10 = "-[IXSPowerAssertion invalidate]";
      __int16 v11 = 2112;
      v12 = assertionName;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Released power assertion %@", (uint8_t *)&v9, 0x16u);
    }

    self->_IOPMAssertionID assertion = 0;
  }
}

- (void)dealloc
{
  [(IXSPowerAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IXSPowerAssertion;
  [(IXSPowerAssertion *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  IOReturn v5 = (void *)v4;
  uint64_t v6 = 89;
  if (!self->_assertion) {
    uint64_t v6 = 78;
  }
  v7 = +[NSString stringWithFormat:@"<%@<%p> %@ valid:%c>", v4, self, self->_assertionName, v6];

  return v7;
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (NSString)assertionName
{
  return self->_assertionName;
}

- (void).cxx_destruct
{
}

@end