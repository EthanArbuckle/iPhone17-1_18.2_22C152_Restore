@interface COConditionBundle
- (BOOL)isRunnable:(id *)a3;
- (BOOL)loadAndReturnError:(id *)a3;
- (COConditionBundle)initWithURL:(id)a3;
- (Class)classNamed:(id)a3;
- (Class)classNamed:(id)a3 error:(id *)a4;
- (id)conditions;
- (void)conditions;
@end

@implementation COConditionBundle

- (COConditionBundle)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COConditionBundle;
  return [(COConditionBundle *)&v4 initWithURL:a3];
}

- (BOOL)loadAndReturnError:(id *)a3
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[COConditionBundle loadAndReturnError:](self);
  }
  id v14 = 0;
  BOOL v5 = [(COConditionBundle *)self isRunnable:&v14];
  id v6 = v14;
  v7 = v6;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)COConditionBundle;
    id v13 = v6;
    unsigned __int8 v8 = [(COConditionBundle *)&v12 loadAndReturnError:&v13];
    id v9 = v13;

    if (v8)
    {
      BOOL v10 = 1;
      goto LABEL_14;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionBundle loadAndReturnError:](self);
    }
    v7 = v9;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[COConditionBundle loadAndReturnError:](self);
  }
  if (a3)
  {
    id v9 = v7;
    BOOL v10 = 0;
    *a3 = v9;
  }
  else
  {
    BOOL v10 = 0;
    id v9 = v7;
  }
LABEL_14:

  return v10;
}

- (id)conditions
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned int outCount = 0;
  if ([(COConditionBundle *)self isLoaded])
  {
    v3 = [MEMORY[0x263EFF980] array];
    id v4 = [(COConditionBundle *)self executablePath];
    BOOL v5 = objc_copyClassNamesForImage((const char *)[v4 UTF8String], &outCount);
    id v6 = v5;
    if (outCount)
    {
      unint64_t v7 = 0;
      unsigned __int8 v8 = 0;
      id v9 = 0;
      BOOL v10 = &_os_log_internal;
      do
      {
        v11 = v8;

        unsigned __int8 v8 = [NSString stringWithUTF8String:v6[v7]];

        id v19 = 0;
        objc_super v12 = [(COConditionBundle *)self classNamed:v8 error:&v19];
        id v9 = v19;
        BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9)
        {
          if (v13)
          {
            id v14 = [(COConditionBundle *)self bundlePath];
            *(_DWORD *)buf = 138412802;
            v22 = v14;
            __int16 v23 = 2112;
            v24 = v8;
            __int16 v25 = 2112;
            id v26 = v9;
            _os_log_debug_impl(&dword_22CE75000, v10, OS_LOG_TYPE_DEBUG, "Bundle: %@ skipping Class: %@ - %@", buf, 0x20u);
          }
        }
        else
        {
          if (v13)
          {
            [(COConditionBundle *)self bundlePath];
            v15 = id v18 = v4;
            *(_DWORD *)buf = 138412546;
            v22 = v15;
            __int16 v23 = 2112;
            v24 = v8;
            _os_log_debug_impl(&dword_22CE75000, v10, OS_LOG_TYPE_DEBUG, "Bundle: %@ found COCondition Class: %@", buf, 0x16u);

            id v4 = v18;
          }
          [v3 addObject:v12];
        }
        ++v7;
      }
      while (v7 < outCount);
    }
    else if (!v5)
    {
LABEL_17:
      id v16 = v3;

      goto LABEL_18;
    }
    free(v6);
    goto LABEL_17;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[COConditionBundle conditions]();
  }
  id v16 = 0;
LABEL_18:

  return v16;
}

- (Class)classNamed:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  if (v6)
  {
    v22.receiver = self;
    v22.super_class = (Class)COConditionBundle;
    unint64_t v7 = [(COConditionBundle *)&v22 classNamed:v6];
  }
  else
  {
    unint64_t v7 = (objc_class *)[(COConditionBundle *)self principalClass];
  }
  unsigned __int8 v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = @"principalClass";
      }
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Class: %@ not found", buf, 0xCu);
    }
    else if (v6)
    {
      id v14 = v6;
    }
    else
    {
      id v14 = @"principalClass";
    }
    createConditionInducerError((uint64_t)"-[COConditionBundle classNamed:error:]", 104, 1, 0, @"Class: %@ not found", v11, v12, v13, (uint64_t)v14);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v10 = &stru_26E04D128;
    if (!a4)
    {
LABEL_22:
      unsigned __int8 v8 = 0;
      goto LABEL_24;
    }
LABEL_12:
    id v9 = v9;
    unsigned __int8 v8 = 0;
    *a4 = v9;
    goto LABEL_24;
  }
  if (([(objc_class *)v7 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    if ([(objc_class *)v8 instancesRespondToSelector:sel_setUp])
    {
      BOOL v10 = &stru_26E04D128;
    }
    else
    {
      BOOL v10 = [&stru_26E04D128 stringByAppendingString:@" setUp"];
    }
    if (([(objc_class *)v8 instancesRespondToSelector:sel_tearDown] & 1) == 0)
    {
      uint64_t v15 = [(__CFString *)v10 stringByAppendingString:@" tearDown"];

      BOOL v10 = (__CFString *)v15;
    }
    if (([(objc_class *)v8 instancesRespondToSelector:sel_active] & 1) == 0)
    {
      uint64_t v16 = [(__CFString *)v10 stringByAppendingString:@" active"];

      BOOL v10 = (__CFString *)v16;
    }
    if (![(__CFString *)v10 length])
    {
      id v9 = 0;
      goto LABEL_24;
    }
    createConditionInducerError((uint64_t)"-[COConditionBundle classNamed:error:]", 130, 3, 0, @"Class %@, does not conform to required COConditionProtocol. Missing methods: %@", v17, v18, v19, (uint64_t)v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  id v9 = 0;
  BOOL v10 = &stru_26E04D128;
LABEL_24:
  v20 = v8;

  return v20;
}

- (Class)classNamed:(id)a3
{
  return [(COConditionBundle *)self classNamed:a3 error:0];
}

- (BOOL)isRunnable:(id *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  BOOL v5 = [(COConditionBundle *)self objectForInfoDictionaryKey:@"RequiresRootPrivileges"];
  id v6 = isNSNumber(v5);

  if (!v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionBundle isRunnable:].cold.5(self);
    }

    BOOL v5 = (void *)MEMORY[0x263EFFA88];
  }
  if ([v5 BOOLValue])
  {
    unint64_t v7 = NSUserName();
    char v8 = [v7 isEqualToString:@"root"];

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[COConditionBundle isRunnable:].cold.4(self);
      }
      uint64_t v27 = [(COConditionBundle *)self bundlePath];
      uint64_t v25 = createConditionInducerError((uint64_t)"-[COConditionBundle isRunnable:]", 172, 5, 0, @"%@ must be loaded as root.", v28, v29, v30, (uint64_t)v27);

      id v11 = 0;
      id v9 = 0;
      goto LABEL_33;
    }
  }
  id v9 = [(COConditionBundle *)self objectForInfoDictionaryKey:@"RequiresEntitlements"];
  BOOL v10 = isNSDictionary(v9);

  if (!v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COConditionBundle isRunnable:](self);
    }

    id v9 = (id)MEMORY[0x263EFFA78];
    goto LABEL_13;
  }
  if (v9)
  {
LABEL_13:
    v32 = v5;
    v33 = a3;
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v9;
    uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      uint64_t v15 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v18 = [v9 valueForKey:v17];
          id v34 = 0;
          char v19 = hasEntitlementValue(v17, v18, &v34);
          id v20 = v34;

          if ((v19 & 1) == 0)
          {
            v21 = [v9 valueForKey:v17];
            [v11 setObject:v21 forKeyedSubscript:v17];

            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              [(COConditionBundle *)buf isRunnable:&v40];
            }
          }
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v13);
    }

    BOOL v5 = v32;
    a3 = v33;
    goto LABEL_24;
  }
  id v11 = 0;
LABEL_24:
  if (![v11 count])
  {
    uint64_t v25 = 0;
    BOOL v26 = 1;
    if (!a3) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[COConditionBundle isRunnable:]((uint64_t)v11);
  }
  uint64_t v25 = createConditionInducerError((uint64_t)"-[COConditionBundle isRunnable:]", 202, 5, 0, @"Missing required entitlements: %@", v22, v23, v24, (uint64_t)v11);
LABEL_33:
  BOOL v26 = 0;
  if (a3) {
LABEL_34:
  }
    *a3 = v25;
LABEL_35:

  return v26;
}

- (void)loadAndReturnError:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CE75000, &_os_log_internal, v2, "Failed to load bundle at %@ - %@", v3, v4, v5, v6, v7);
}

- (void)loadAndReturnError:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CE75000, &_os_log_internal, v2, "Bundle %@ is not runable in current environment - %@", v3, v4, v5, v6, v7);
}

- (void)loadAndReturnError:(void *)a1 .cold.3(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [a1 bundlePath];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Loading Bundle %@", (uint8_t *)&v2, 0xCu);
}

- (void)conditions
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Bundle not loaded", v0, 2u);
}

- (void)isRunnable:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Missing required entitlements: %@", (uint8_t *)&v1, 0xCu);
}

- (void)isRunnable:(void *)a3 .cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

- (void)isRunnable:(void *)a1 .cold.3(void *a1)
{
  int v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CE75000, &_os_log_internal, v2, "%@/Info.plist missing key:value '%@':<NSDictionary>'. Assuming no entitlements.", v3, v4, v5, v6, v7);
}

- (void)isRunnable:(void *)a1 .cold.4(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = [a1 bundlePath];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ must be loaded as root.", (uint8_t *)&v2, 0xCu);
}

- (void)isRunnable:(void *)a1 .cold.5(void *a1)
{
  int v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CE75000, &_os_log_internal, v2, "%@/Info.plist missing '%@:<NSNumber>'. Assuming ROOT required.", v3, v4, v5, v6, v7);
}

@end