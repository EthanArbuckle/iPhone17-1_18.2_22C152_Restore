@interface BMDSLGraphValidator
+ (NSSet)genericValidKeyPaths;
+ (NSSet)legacyValidKeyPaths;
+ (id)currentProcessValidator;
+ (id)passthroughValidator;
+ (void)setCurrentProcessValidator:(id)a3;
- (BMDSLGraphValidator)init;
- (BMDSLGraphValidator)initWithValidKeyPaths:(id)a3 allowedOperations:(id)a4 allowedStreamTypes:(id)a5 eventStreamClassMapping:(id)a6;
- (BOOL)isExecutionAllowedForGraph:(id)a3;
- (BOOL)isStreamTypeAllowed:(unint64_t)a3;
- (BOOL)passthrough;
- (Class)eventClassForString:(id)a3;
- (NSDictionary)eventStreamClassMapping;
- (NSSet)allowedOperations;
- (NSSet)allowedStreamTypes;
- (NSSet)validKeyPaths;
@end

@implementation BMDSLGraphValidator

+ (id)currentProcessValidator
{
  id v2 = (id)_currentProcessValidator;
  if (!v2)
  {
    id v2 = +[BMDSLGraphValidator passthroughValidator];
  }
  return v2;
}

- (BOOL)passthrough
{
  return self->_passthrough;
}

- (BOOL)isStreamTypeAllowed:(unint64_t)a3
{
  allowedStreamTypes = self->_allowedStreamTypes;
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  LOBYTE(allowedStreamTypes) = [(NSSet *)allowedStreamTypes containsObject:v4];

  return (char)allowedStreamTypes;
}

- (NSSet)validKeyPaths
{
  return self->_validKeyPaths;
}

+ (id)passthroughValidator
{
  id v2 = objc_alloc_init(BMDSLGraphValidator);
  v2->_passthrough = 1;
  return v2;
}

+ (void)setCurrentProcessValidator:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BMDSLGraphValidator_setCurrentProcessValidator___block_invoke;
  block[3] = &unk_1E6021660;
  id v7 = v3;
  uint64_t v4 = setCurrentProcessValidator__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&setCurrentProcessValidator__onceToken, block);
  }
}

void __50__BMDSLGraphValidator_setCurrentProcessValidator___block_invoke(uint64_t a1)
{
}

- (BMDSLGraphValidator)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [(BMDSLGraphValidator *)self initWithValidKeyPaths:v3 allowedOperations:v3 allowedStreamTypes:v3 eventStreamClassMapping:MEMORY[0x1E4F1CC08]];

  return v4;
}

- (BMDSLGraphValidator)initWithValidKeyPaths:(id)a3 allowedOperations:(id)a4 allowedStreamTypes:(id)a5 eventStreamClassMapping:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BMDSLGraphValidator;
  v14 = [(BMDSLGraphValidator *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    validKeyPaths = v14->_validKeyPaths;
    v14->_validKeyPaths = (NSSet *)v15;

    uint64_t v17 = [v11 copy];
    allowedOperations = v14->_allowedOperations;
    v14->_allowedOperations = (NSSet *)v17;

    uint64_t v19 = [v12 copy];
    allowedStreamTypes = v14->_allowedStreamTypes;
    v14->_allowedStreamTypes = (NSSet *)v19;

    uint64_t v21 = [v13 copy];
    eventStreamClassMapping = v14->_eventStreamClassMapping;
    v14->_eventStreamClassMapping = (NSDictionary *)v21;
  }
  return v14;
}

- (BOOL)isExecutionAllowedForGraph:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3EB4FF0]();
  if ([(BMDSLGraphValidator *)self passthrough])
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BMDSLGraphValidator isExecutionAllowedForGraph:]();
    }
LABEL_4:
    BOOL v7 = 1;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
    if ([v6 count])
    {
      while (1)
      {
        v8 = [v6 firstObject];
        [v6 removeObjectAtIndex:0];
        v9 = [v8 name];
        if (!v9 || ![(NSSet *)self->_allowedOperations containsObject:v9]) {
          break;
        }
        id v10 = [v8 upstreams];
        [v6 addObjectsFromArray:v10];

        if (![v6 count]) {
          goto LABEL_4;
        }
      }
      id v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[BMDSLGraphValidator isExecutionAllowedForGraph:]();
      }
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (Class)eventClassForString:(id)a3
{
  id v4 = (NSString *)a3;
  if ([(BMDSLGraphValidator *)self passthrough])
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BMDSLGraphValidator eventClassForString:]();
    }

    v6 = NSClassFromString(v4);
  }
  else
  {
    BOOL v7 = [(BMDSLGraphValidator *)self eventStreamClassMapping];
    uint64_t v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      v9 = [(BMDSLGraphValidator *)self eventStreamClassMapping];
      v6 = [v9 objectForKeyedSubscript:v4];
    }
    else
    {
      id v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BMDSLGraphValidator eventClassForString:]();
      }

      v6 = 0;
    }
  }

  return (Class)v6;
}

+ (NSSet)genericValidKeyPaths
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F0B36928];
  return (NSSet *)v2;
}

+ (NSSet)legacyValidKeyPaths
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F0B36940];
  return (NSSet *)v2;
}

- (NSSet)allowedOperations
{
  return self->_allowedOperations;
}

- (NSSet)allowedStreamTypes
{
  return self->_allowedStreamTypes;
}

- (NSDictionary)eventStreamClassMapping
{
  return self->_eventStreamClassMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamClassMapping, 0);
  objc_storeStrong((id *)&self->_allowedStreamTypes, 0);
  objc_storeStrong((id *)&self->_allowedOperations, 0);
  objc_storeStrong((id *)&self->_validKeyPaths, 0);
}

- (void)isExecutionAllowedForGraph:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B3086000, v0, v1, "BMDSLGraphValidator allowing execution by passthrough for graph %@", v2, v3, v4, v5, v6);
}

- (void)isExecutionAllowedForGraph:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B3086000, v0, v1, "Encountered non-allowed operation %@ when checking validity of %@");
}

- (void)eventClassForString:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B3086000, v0, v1, "BMDSLGraphValidator looking up event class by passthrough for class string %@", v2, v3, v4, v5, v6);
}

- (void)eventClassForString:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B3086000, v0, OS_LOG_TYPE_ERROR, "BMDSLGraphValidator failed to find a valid class for event class string: %{public}@", v1, 0xCu);
}

@end