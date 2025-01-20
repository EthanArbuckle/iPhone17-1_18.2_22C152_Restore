@interface IXSTerminationAssertion
- (BOOL)acquireAssertion:(id *)a3;
- (OS_dispatch_semaphore)waitForAssertionSemaphore;
- (RBSTerminationAssertion)termAssertion;
- (id)_terminationAssertionForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6;
- (id)initForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setTermAssertion:(id)a3;
@end

@implementation IXSTerminationAssertion

- (void)setTermAssertion:(id)a3
{
  v5 = (RBSTerminationAssertion *)a3;
  termAssertion = self->_termAssertion;
  if (v5 && termAssertion == v5)
  {
    v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10008FD6C();
    }
  }
  else
  {
    if (termAssertion) {
      [(RBSTerminationAssertion *)termAssertion invalidate];
    }
    objc_storeStrong((id *)&self->_termAssertion, a3);
  }
}

- (id)_terminationAssertionForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:v10];

  [v12 setMaximumTerminationResistance:v7];
  v13 = +[RBSProcessPredicate predicateMatchingBundleIdentifiers:v11];

  id v14 = [objc_alloc((Class)RBSTerminationAssertion) initWithPredicate:v13 context:v12];
  v15 = v14;
  if (v14)
  {
    [v14 addObserver:self];
    id v16 = 0;
  }
  else
  {
    v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10008FDEC();
    }

    v19 = sub_10003DAE4((uint64_t)"-[IXSTerminationAssertion _terminationAssertionForBundleIDs:description:terminationResistance:error:]", 52, @"IXErrorDomain", 0x13uLL, 0, 0, @"Failed to create termination assertion for predicate %@", v18, (uint64_t)v13);
    id v16 = v19;
    if (a6)
    {
      id v16 = v19;
      *a6 = v16;
    }
  }

  return v15;
}

- (id)initForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)IXSTerminationAssertion;
  id v12 = [(IXSTerminationAssertion *)&v24 init];
  v13 = v12;
  if (v12)
  {
    id v23 = 0;
    uint64_t v14 = [(IXSTerminationAssertion *)v12 _terminationAssertionForBundleIDs:v10 description:v11 terminationResistance:v7 error:&v23];
    id v15 = v23;
    termAssertion = v13->_termAssertion;
    v13->_termAssertion = (RBSTerminationAssertion *)v14;

    if (v13->_termAssertion)
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      waitForAssertionSemaphore = v13->_waitForAssertionSemaphore;
      v13->_waitForAssertionSemaphore = (OS_dispatch_semaphore *)v17;

      if (v13->_termAssertion)
      {
        v19 = v13;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v20 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10008FE70(v20);
    }

    sub_10003DAE4((uint64_t)"-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]", 76, @"IXErrorDomain", 1uLL, 0, 0, @"%s failed in init", v21, (uint64_t)"-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    id v15 = v15;
    v19 = 0;
    *a6 = v15;
  }
  else
  {
    v19 = 0;
  }
LABEL_11:

  return v19;
}

- (BOOL)acquireAssertion:(id *)a3
{
  v5 = [(IXSTerminationAssertion *)self termAssertion];
  id v14 = 0;
  unsigned __int8 v6 = [v5 acquireWithError:&v14];
  id v7 = v14;

  if (v6)
  {
    v8 = [(IXSTerminationAssertion *)self waitForAssertionSemaphore];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10008FF0C(self, (uint64_t)v7, v9);
    }

    id v10 = [(IXSTerminationAssertion *)self termAssertion];
    id v12 = sub_10003DAE4((uint64_t)"-[IXSTerminationAssertion acquireAssertion:]", 94, @"IXErrorDomain", 0x13uLL, v7, 0, @"Failed to acquire termination assertion %@", v11, (uint64_t)v10);

    if (a3)
    {
      id v7 = v12;
      *a3 = v7;
    }
    else
    {
      id v7 = v12;
    }
  }

  return v6;
}

- (void)invalidate
{
}

- (void)dealloc
{
  [(IXSTerminationAssertion *)self setTermAssertion:0];
  v3.receiver = self;
  v3.super_class = (Class)IXSTerminationAssertion;
  [(IXSTerminationAssertion *)&v3 dealloc];
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10008FFBC();
  }

  v5 = [(IXSTerminationAssertion *)self termAssertion];

  if (v5)
  {
    unsigned __int8 v6 = [(IXSTerminationAssertion *)self waitForAssertionSemaphore];
    dispatch_semaphore_signal(v6);
  }
  else
  {
    unsigned __int8 v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[IXSTerminationAssertion assertionTargetProcessDidExit:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: We didn't have a termination assertion that we're tracking, so not acting on the callback from RBS", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (OS_dispatch_semaphore)waitForAssertionSemaphore
{
  return self->_waitForAssertionSemaphore;
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termAssertion, 0);

  objc_storeStrong((id *)&self->_waitForAssertionSemaphore, 0);
}

@end