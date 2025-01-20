@interface NSDictionary(TypeSafeAccess)
- (id)dataValueForKey:()TypeSafeAccess;
- (id)stringValueForKey:()TypeSafeAccess;
- (uint64_t)BOOLValueForKey:()TypeSafeAccess;
@end

@implementation NSDictionary(TypeSafeAccess)

- (id)stringValueForKey:()TypeSafeAccess
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(TypeSafeAccess) stringValueForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)dataValueForKey:()TypeSafeAccess
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(TypeSafeAccess) dataValueForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (uint64_t)BOOLValueForKey:()TypeSafeAccess
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];
  if (!v5)
  {
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(TypeSafeAccess) dataValueForKey:]();
    }

    goto LABEL_7;
  }
  uint64_t v6 = [v5 BOOLValue];
LABEL_8:

  return v6;
}

- (void)stringValueForKey:()TypeSafeAccess .cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_4(v0);
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "@\"Querying for string value for key '%@' yielded value of unexpected class '%@'\"", v4, v5, v6, v7, v8);
}

- (void)dataValueForKey:()TypeSafeAccess .cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_4(v0);
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "@\"Querying for data value for key '%@' yielded value of unexpected class '%@'\"", v4, v5, v6, v7, v8);
}

@end