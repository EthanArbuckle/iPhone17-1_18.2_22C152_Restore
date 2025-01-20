@interface COCondition
+ (id)description;
+ (id)info;
+ (id)profileFriendlyName;
+ (void)info;
- (BOOL)active;
- (BOOL)getBoolProperty:(id)a3 fromDict:(id)a4 withDefault:(BOOL)a5;
- (BOOL)getBoolProperty:(id)a3 withDefault:(BOOL)a4;
- (BOOL)isDestructive;
- (BOOL)isDestructiveFromDict:(id)a3;
- (BOOL)isInternalOnly;
- (BOOL)isInternalOnlyFromDict:(id)a3;
- (BOOL)persistsAfterReboot;
- (BOOL)persistsAfterRebootFromDict:(id)a3;
- (BOOL)setUp;
- (COCondition)init;
- (NSArray)additionalArguments;
- (NSString)identifierName;
- (NSString)userFriendlyName;
- (id)getStringProperty:(id)a3 fromDict:(id)a4 withDefault:(id)a5;
- (id)getStringProperty:(id)a3 withDefault:(id)a4;
- (id)identifierNameFromDict:(id)a3;
- (id)userFriendlyNameFromDict:(id)a3;
- (void)setAdditionalArguments:(id)a3;
@end

@implementation COCondition

- (COCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)COCondition;
  return [(COCondition *)&v3 init];
}

- (BOOL)active
{
  return 0;
}

- (BOOL)setUp
{
  return 0;
}

+ (id)description
{
  return @"Default COCondition description";
}

+ (id)profileFriendlyName
{
  return &stru_26E04D128;
}

+ (id)info
{
  v10[3] = *MEMORY[0x263EF8340];
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [a1 description];
  if (!v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      +[COCondition info]((uint64_t)v4);
    }
    v5 = &stru_26E04D128;
  }
  v10[0] = v4;
  v9[0] = @"ConditionIdentifierName";
  v9[1] = @"ConditionUserFriendlyName";
  v6 = [a1 profileFriendlyName];
  v9[2] = @"ConditionDescription";
  v10[1] = v6;
  v10[2] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (BOOL)getBoolProperty:(id)a3 fromDict:(id)a4 withDefault:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKey:v7];
    v11 = isNSNumber(v10);

    if (v11)
    {
      a5 = [v10 BOOLValue];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[COCondition getBoolProperty:fromDict:withDefault:]((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[COCondition getBoolProperty:fromDict:withDefault:]();
  }

  return a5;
}

- (BOOL)getBoolProperty:(id)a3 withDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 infoDictionary];
    LOBYTE(v4) = [(COCondition *)self getBoolProperty:v6 fromDict:v9 withDefault:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[COCondition getBoolProperty:withDefault:]();
  }

  return v4;
}

- (id)getStringProperty:(id)a3 fromDict:(id)a4 withDefault:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [v8 objectForKey:v7];
    v11 = isNSString(v10);

    uint64_t v12 = v10;
    if (!v11)
    {
      BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      uint64_t v12 = v9;
      if (v13)
      {
        -[COCondition getStringProperty:fromDict:withDefault:]((uint64_t)v7);
        uint64_t v12 = v9;
      }
    }
    id v14 = v12;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COCondition getBoolProperty:fromDict:withDefault:]();
    }
    id v14 = v9;
  }

  return v14;
}

- (id)getStringProperty:(id)a3 withDefault:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 infoDictionary];
    id v11 = [(COCondition *)self getStringProperty:v6 fromDict:v10 withDefault:v7];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[COCondition getBoolProperty:withDefault:]();
    }
    id v11 = v7;
  }

  return v11;
}

- (BOOL)persistsAfterReboot
{
  return [(COCondition *)self getBoolProperty:@"ConditionPersistsAfterReboot" withDefault:1];
}

- (NSString)identifierName
{
  return (NSString *)[(COCondition *)self getStringProperty:@"ConditionIdentifierName" withDefault:0];
}

- (NSString)userFriendlyName
{
  return (NSString *)[(COCondition *)self getStringProperty:@"ConditionUserFriendlyName" withDefault:0];
}

- (BOOL)isDestructive
{
  return [(COCondition *)self getBoolProperty:@"ConditionIsDestructive" withDefault:1];
}

- (BOOL)isInternalOnly
{
  return [(COCondition *)self getBoolProperty:@"ConditionIsInternalOnly" withDefault:1];
}

- (BOOL)persistsAfterRebootFromDict:(id)a3
{
  return [(COCondition *)self getBoolProperty:@"ConditionPersistsAfterReboot" fromDict:a3 withDefault:1];
}

- (id)identifierNameFromDict:(id)a3
{
  return [(COCondition *)self getStringProperty:@"ConditionIdentifierName" fromDict:a3 withDefault:0];
}

- (id)userFriendlyNameFromDict:(id)a3
{
  return [(COCondition *)self getStringProperty:@"ConditionUserFriendlyName" fromDict:a3 withDefault:0];
}

- (BOOL)isDestructiveFromDict:(id)a3
{
  return [(COCondition *)self getBoolProperty:@"ConditionIsDestructive" fromDict:a3 withDefault:1];
}

- (BOOL)isInternalOnlyFromDict:(id)a3
{
  return [(COCondition *)self getBoolProperty:@"ConditionIsInternalOnly" fromDict:a3 withDefault:1];
}

- (NSArray)additionalArguments
{
  return self->_additionalArguments;
}

- (void)setAdditionalArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)info
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Missing description entry for %@. Please make sure you fill out all entries for your condition class. If you believe this to be an error, please file a radar to the Condition Inducers component", (uint8_t *)&v1, 0xCu);
}

- (void)getBoolProperty:fromDict:withDefault:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "Failed to load info dictionary from %@", v3, v4, v5, v6, v7);
}

- (void)getBoolProperty:(uint64_t)a3 fromDict:(uint64_t)a4 withDefault:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getBoolProperty:withDefault:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_3(&dword_22CE75000, &_os_log_internal, v2, "No info.plist bundle for %@?", v3, v4, v5, v6, v7);
}

- (void)getStringProperty:(uint64_t)a1 fromDict:withDefault:.cold.2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  id v5 = (id)objc_opt_class();
  id v1 = v5;
  _os_log_error_impl(&dword_22CE75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Expected an NSString from info plist for string %@ but got %@", (uint8_t *)&v2, 0x16u);
}

@end