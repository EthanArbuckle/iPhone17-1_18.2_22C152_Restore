@interface NSDictionary(SGQuickResponsesConfigDictionary)
- (id)arrayAssertedForKey:()SGQuickResponsesConfigDictionary;
- (id)dictAssertedForKey:()SGQuickResponsesConfigDictionary;
- (id)numberAssertedForKey:()SGQuickResponsesConfigDictionary;
- (id)objectAssertedForKey:()SGQuickResponsesConfigDictionary;
- (id)stringAssertedForKey:()SGQuickResponsesConfigDictionary;
@end

@implementation NSDictionary(SGQuickResponsesConfigDictionary)

- (id)dictAssertedForKey:()SGQuickResponsesConfigDictionary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a dictionary.", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (id)arrayAssertedForKey:()SGQuickResponsesConfigDictionary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not an array.", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (id)stringAssertedForKey:()SGQuickResponsesConfigDictionary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a string.", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (id)numberAssertedForKey:()SGQuickResponsesConfigDictionary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ is not a number.", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (id)objectAssertedForKey:()SGQuickResponsesConfigDictionary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Object for key %@ not found in dictionary.", (uint8_t *)&v7, 0xCu);
  }

  return v5;
}

@end