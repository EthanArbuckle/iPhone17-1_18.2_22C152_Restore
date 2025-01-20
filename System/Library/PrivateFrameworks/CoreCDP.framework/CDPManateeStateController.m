@interface CDPManateeStateController
- (BOOL)_checkCircleStateWithError:(id *)a3;
- (BOOL)isManateeAvailable:(id *)a3;
- (CDPManateeStateController)init;
- (CDPManateeStateController)initWithContext:(id)a3;
- (CDPManateeStateController)initWithContext:(id)a3 circleProxy:(id)a4;
@end

@implementation CDPManateeStateController

- (CDPManateeStateController)init
{
  v3 = +[CDPContext contextForPrimaryAccount];
  v4 = [(CDPManateeStateController *)self initWithContext:v3];

  return v4;
}

- (CDPManateeStateController)initWithContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CDPManateeStateController initWithContext:](v5);
    }

    id v4 = +[CDPContext contextForPrimaryAccount];
  }
  v6 = [[CDPCircleProxyImpl alloc] initWithContext:v4];
  v7 = [(CDPManateeStateController *)self initWithContext:v4 circleProxy:v6];

  return v7;
}

- (CDPManateeStateController)initWithContext:(id)a3 circleProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDPManateeStateController;
  v9 = [(CDPManateeStateController *)&v18 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CDPManateeStateController initWithContext:circleProxy:](a2);
    }
    goto LABEL_11;
  }

  v11 = +[CDPContext preflightContext:v7];
  if (!v11)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CDPManateeStateController initWithContext:circleProxy:]((uint64_t)p_isa, a2);
    }
    goto LABEL_11;
  }
  v12 = v11;
  objc_storeStrong(p_isa + 2, v11);

  id v13 = v8;
  if (!v13)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CDPManateeStateController initWithContext:circleProxy:]((uint64_t)p_isa, a2);
    }
LABEL_11:

    v15 = 0;
    goto LABEL_12;
  }
  v14 = v13;
  objc_storeStrong(p_isa + 1, a4);

  v15 = p_isa;
LABEL_12:

  return v15;
}

- (BOOL)isManateeAvailable:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CDPContext *)self->_context altDSID];
    *(_DWORD *)buf = 141558274;
    uint64_t v20 = 1752392040;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "CDPManateeStateController: Trying to determine manatee availability for altDSID: %{mask.hash}@", buf, 0x16u);
  }
  context = self->_context;
  id v18 = 0;
  BOOL v8 = [(CDPContext *)context isiCDPEligibleWithError:&v18];
  id v9 = v18;
  id v10 = v9;
  if (v8)
  {
    id v17 = v9;
    BOOL v11 = [(CDPManateeStateController *)self _checkCircleStateWithError:&v17];
    id v12 = v17;

    if (v11)
    {
      BOOL v13 = 1;
LABEL_16:
      id v10 = v12;
      goto LABEL_17;
    }
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPManateeStateController isManateeAvailable:]((uint64_t)v12, v15);
    }

    if (!a3)
    {
      BOOL v13 = 0;
      goto LABEL_16;
    }
    id v10 = v12;
    goto LABEL_14;
  }
  v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CDPManateeStateController isManateeAvailable:]((uint64_t)v10, v14);
  }

  if (a3)
  {
LABEL_14:
    id v10 = v10;
    BOOL v13 = 0;
    *a3 = v10;
    goto LABEL_17;
  }
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)_checkCircleStateWithError:(id *)a3
{
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "CDPManateeStateController: Checking security eligibility state...", buf, 2u);
  }

  circleProxy = self->_circleProxy;
  id v11 = 0;
  uint64_t v7 = [(CDPDCircleProxy *)circleProxy cachedCliqueStatus:&v11];
  id v8 = v11;
  if (v7 == 1)
  {
    BOOL v9 = self->_circleProxy != 0;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:underlyingError:", -5403, v8);
    BOOL v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
}

- (void)initWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

- (void)initWithContext:(const char *)a1 circleProxy:.cold.1(const char *a1)
{
  id v2 = (id)objc_opt_class();
  v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v4, v5, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v6, v7, v8, v9, v10);
}

- (void)initWithContext:(uint64_t)a1 circleProxy:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v5, v6, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v7, v8, v9, v10, v11);
}

- (void)initWithContext:(uint64_t)a1 circleProxy:(const char *)a2 .cold.3(uint64_t a1, const char *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_2182AE000, v5, v6, "[%{public}@ %{public}@]: Value for '%{public}s' was nil, failing init", v7, v8, v9, v10, v11);
}

- (void)isManateeAvailable:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "CDPManateeStateController: Manatee not available due to circle failure with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)isManateeAvailable:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "CDPManateeStateController: Manatee not available due to iCDP eligibility issue: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end