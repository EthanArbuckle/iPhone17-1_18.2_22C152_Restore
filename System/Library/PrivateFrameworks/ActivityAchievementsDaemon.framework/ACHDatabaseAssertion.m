@interface ACHDatabaseAssertion
+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 error:(id *)a5;
+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 timeout:(double)a5 error:(id *)a6;
- (ACHDatabaseAssertion)initWithHDAssertion:(id)a3;
- (HDAssertion)assertion;
- (void)dealloc;
- (void)invalidate;
- (void)setAssertion:(id)a3;
@end

@implementation ACHDatabaseAssertion

+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 error:(id *)a5
{
  return +[ACHDatabaseAssertion assertionWithDatabase:a3 identifier:a4 timeout:a5 error:15.0];
}

+ (id)assertionWithDatabase:(id)a3 identifier:(id)a4 timeout:(double)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v16 = 0;
  v10 = [a3 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v16 error:a5];
  id v11 = v16;
  if (v10)
  {
    v12 = [[ACHDatabaseAssertion alloc] initWithHDAssertion:v10];
  }
  else
  {
    v13 = ACHLogDatabase();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = v9;
      __int16 v19 = 2048;
      double v20 = a5;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion for %{public}@ with %lf second timeout with error %{public}@", buf, 0x20u);
    }

    id v14 = v11;
    if (v14)
    {
      if (a6) {
        *a6 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v12 = 0;
  }

  return v12;
}

- (ACHDatabaseAssertion)initWithHDAssertion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHDatabaseAssertion;
  v6 = [(ACHDatabaseAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assertion, a3);
  }

  return v7;
}

- (void)invalidate
{
  id v2 = [(ACHDatabaseAssertion *)self assertion];
  [v2 invalidate];
}

- (void)dealloc
{
  [(ACHDatabaseAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ACHDatabaseAssertion;
  [(ACHDatabaseAssertion *)&v3 dealloc];
}

- (HDAssertion)assertion
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