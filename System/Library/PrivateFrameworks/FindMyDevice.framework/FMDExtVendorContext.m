@interface FMDExtVendorContext
- (BOOL)respondsToSelector:(SEL)a3;
- (FMDExtAccessoryProtocol)accessoryProvider;
- (FMDExtVendorContext)init;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4;
- (void)fetchAllAccessoriesInfo:(id)a3 withCompletion:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5;
- (void)setAccessoryProvider:(id)a3;
@end

@implementation FMDExtVendorContext

- (FMDExtVendorContext)init
{
  v3 = LogCategory_Extensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "Initialized vendor context", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)FMDExtVendorContext;
  return [(FMDExtVendorContext *)&v5 init];
}

- (void)fetchAllAccessoriesInfo:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = LogCategory_Extensions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[FMDExtVendorContext fetchAllAccessoriesInfo:withCompletion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v9 = [(FMDExtVendorContext *)self accessoryProvider];
  if (v9
    && (v10 = (void *)v9,
        [(FMDExtVendorContext *)self accessoryProvider],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = [(FMDExtVendorContext *)self accessoryProvider];
    [v13 fetchAllAccessoriesInfoWithInfo:v6 withCompletion:v7];
  }
  else
  {
    v14 = LogCategory_Extensions();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FMDExtVendorContext fetchAllAccessoriesInfo:withCompletion:](self);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = LogCategory_Extensions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[FMDExtVendorContext connectionStatusForAccessory:withCompletion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v9 = [(FMDExtVendorContext *)self accessoryProvider];
  if (v9
    && (v10 = (void *)v9,
        [(FMDExtVendorContext *)self accessoryProvider],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = [(FMDExtVendorContext *)self accessoryProvider];
    [v13 connectionStatusForAccessory:v6 withCompletion:v7];
  }
  else
  {
    v14 = LogCategory_Extensions();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FMDExtVendorContext connectionStatusForAccessory:withCompletion:](self);
    }

    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "fm_cancelledError");
    v7[2](v7, 0, v13);
  }
}

- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  v11 = LogCategory_Extensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[FMDExtVendorContext getStyleForAccessory:info:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v12 = [(FMDExtVendorContext *)self accessoryProvider];
  if (v12
    && (v13 = (void *)v12,
        [(FMDExtVendorContext *)self accessoryProvider],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v16 = [(FMDExtVendorContext *)self accessoryProvider];
    [v16 getStyleForAccessory:v8 info:v9 withCompletion:v10];
  }
  else
  {
    __int16 v17 = LogCategory_Extensions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FMDExtVendorContext getStyleForAccessory:info:withCompletion:](self);
    }

    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "fm_cancelledError");
    v10[2](v10, 0, v16);
  }
}

- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = LogCategory_Extensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[FMDExtVendorContext safetyAlertForAccessory:info:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "EXTENSION API: %s called for accessory %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v12 = [(FMDExtVendorContext *)self accessoryProvider];
  if (v12
    && (v13 = (void *)v12,
        [(FMDExtVendorContext *)self accessoryProvider],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = objc_opt_respondsToSelector(),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    v16 = [(FMDExtVendorContext *)self accessoryProvider];
    [v16 safetyAlertForAccessory:v8 info:v9 withCompletion:v10];
  }
  else
  {
    __int16 v17 = LogCategory_Extensions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FMDExtVendorContext safetyAlertForAccessory:info:withCompletion:](self);
    }

    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "fm_cancelledError");
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v16);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FMDExtVendorContext;
  if (-[FMDExtVendorContext respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    objc_super v5 = [(FMDExtVendorContext *)self accessoryProvider];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMDExtVendorContext;
  objc_super v5 = -[FMDExtVendorContext methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    id v6 = [(FMDExtVendorContext *)self accessoryProvider];
    objc_super v5 = [v6 methodSignatureForSelector:a3];
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(FMDExtVendorContext *)self accessoryProvider];
  [v4 selector];
  char v6 = objc_opt_respondsToSelector();

  objc_super v7 = LogCategory_Extensions();
  objc_super v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(FMDExtVendorContext *)self accessoryProvider];
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      char v15 = v9;
      _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "VendorCntext forwardInvocation %@ to delegate %@", buf, 0x16u);
    }
    id v10 = [(FMDExtVendorContext *)self accessoryProvider];
    [v4 invokeWithTarget:v10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FMDExtVendorContext forwardInvocation:](v4, v8);
    }

    v11.receiver = self;
    v11.super_class = (Class)FMDExtVendorContext;
    [(FMDExtVendorContext *)&v11 forwardInvocation:v4];
  }
}

- (FMDExtAccessoryProtocol)accessoryProvider
{
  return self->_accessoryProvider;
}

- (void)setAccessoryProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchAllAccessoriesInfo:(void *)a1 withCompletion:.cold.1(void *a1)
{
  v1 = [a1 accessoryProvider];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D0E93000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);
}

- (void)connectionStatusForAccessory:(void *)a1 withCompletion:.cold.1(void *a1)
{
  v1 = [a1 accessoryProvider];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D0E93000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);
}

- (void)getStyleForAccessory:(void *)a1 info:withCompletion:.cold.1(void *a1)
{
  v1 = [a1 accessoryProvider];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D0E93000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);
}

- (void)safetyAlertForAccessory:(void *)a1 info:withCompletion:.cold.1(void *a1)
{
  v1 = [a1 accessoryProvider];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D0E93000, v2, v3, "Accessory provider %@ does not support %s", v4, v5, v6, v7, v8);
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector((SEL)[a1 selector]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "Invocation %@ not supported", (uint8_t *)&v4, 0xCu);
}

@end