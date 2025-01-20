@interface ASTResponse
+ (id)_stringToCommand;
+ (id)responseWithDictionary:(id)a3;
+ (id)stringFromCommand:(int64_t)a3;
- (ASTResponse)init;
- (ASTResponse)initWithDictionary:(id)a3;
- (BOOL)validateResponse:(id)a3 key:(id)a4 expectedClass:(Class)a5;
- (BOOL)validateTestId:(id)a3 command:(int64_t)a4;
- (NSDictionary)data;
- (NSDictionary)stringToCommand;
- (NSNumber)progress;
- (NSNumber)testId;
- (NSString)commandString;
- (id)description;
- (id)validateData:(id)a3 command:(int64_t)a4;
- (int64_t)command;
- (void)setCommandString:(id)a3;
- (void)setStringToCommand:(id)a3;
@end

@implementation ASTResponse

- (ASTResponse)init
{
  return [(ASTResponse *)self initWithDictionary:MEMORY[0x263EFFA78]];
}

- (ASTResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)ASTResponse;
  v5 = [(ASTResponse *)&v52 init];
  if (v5)
  {
    if ([(ASTResponse *)v5 validateResponse:v4 key:@"statusResponse" expectedClass:objc_opt_class()])
    {
      v6 = [v4 objectForKeyedSubscript:@"statusResponse"];
    }
    else
    {
      v7 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ASTResponse initWithDictionary:].cold.4(v7, v8, v9, v10, v11, v12, v13, v14);
      }

      v6 = 0;
      v5 = 0;
    }
    v15 = +[ASTResponse _stringToCommand];
    if (v5
      && -[ASTResponse validateResponse:key:expectedClass:](v5, "validateResponse:key:expectedClass:", v6, @"command", objc_opt_class())&& ([v6 objectForKeyedSubscript:@"command"], v16 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v15, "objectForKeyedSubscript:", v16), v17 = objc_claimAutoreleasedReturnValue(), v17, v16, v17))
    {
      uint64_t v18 = [v6 objectForKeyedSubscript:@"command"];
      commandString = v5->_commandString;
      v5->_commandString = (NSString *)v18;

      v20 = [v6 objectForKeyedSubscript:@"command"];
      v21 = [v15 objectForKeyedSubscript:v20];
      v5->_command = [v21 integerValue];

      v22 = [v6 objectForKeyedSubscript:@"data"];
      uint64_t v23 = [(ASTResponse *)v5 validateData:v22 command:v5->_command];
      data = v5->_data;
      v5->_data = (NSDictionary *)v23;

      if (v5->_data)
      {
        if ([(ASTResponse *)v5 validateResponse:v6 key:@"testId" expectedClass:objc_opt_class()])
        {
          uint64_t v25 = [v6 objectForKeyedSubscript:@"testId"];
          testId = v5->_testId;
          v5->_testId = (NSNumber *)v25;
        }
        if ([(ASTResponse *)v5 validateTestId:v5->_testId command:v5->_command])
        {
          if (![(ASTResponse *)v5 validateResponse:v6 key:@"progress" expectedClass:objc_opt_class()])
          {
LABEL_20:

            goto LABEL_21;
          }
          uint64_t v27 = [v6 objectForKeyedSubscript:@"progress"];
          progress = v5->_progress;
          v5->_progress = (NSNumber *)v27;
LABEL_19:

          goto LABEL_20;
        }
        v29 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ASTResponse initWithDictionary:](v29, v45, v46, v47, v48, v49, v50, v51);
        }
      }
      else
      {
        v29 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[ASTResponse initWithDictionary:](v29, v38, v39, v40, v41, v42, v43, v44);
        }
      }
    }
    else
    {
      v29 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ASTResponse initWithDictionary:](v29, v30, v31, v32, v33, v34, v35, v36);
      }
    }

    progress = v5;
    v5 = 0;
    goto LABEL_19;
  }
LABEL_21:

  return v5;
}

+ (id)responseWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

+ (id)_stringToCommand
{
  return &unk_26F0B5AA0;
}

+ (id)stringFromCommand:(int64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASTResponse_stringFromCommand___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringFromCommand__onceToken != -1) {
    dispatch_once(&stringFromCommand__onceToken, block);
  }
  id v4 = (void *)stringFromCommand___stringFromCommand;
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];
  v7 = v6;
  if (!v6) {
    v6 = @"Unknown";
  }
  uint64_t v8 = v6;

  return v8;
}

void __33__ASTResponse_stringFromCommand___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) _stringToCommand];
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v12);
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [v2 copy];
  uint64_t v11 = (void *)stringFromCommand___stringFromCommand;
  stringFromCommand___stringFromCommand = v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(ASTResponse *)self commandString];
  uint64_t v5 = [(ASTResponse *)self data];
  uint64_t v6 = [(ASTResponse *)self testId];
  v7 = [(ASTResponse *)self progress];
  uint64_t v8 = [v3 stringWithFormat:@"Command: %@, Data: %@, TestId: %@, Progress: %@", v4, v5, v6, v7];

  return v8;
}

- (BOOL)validateResponse:(id)a3 key:(id)a4 expectedClass:(Class)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [v6 objectForKeyedSubscript:v7],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) != 0))
  {
    long long v12 = [v6 objectForKeyedSubscript:v7];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      long long v14 = [v6 objectForKeyedSubscript:v7];
      BOOL v15 = [v14 length] != 0;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)validateTestId:(id)a3 command:(int64_t)a4
{
  if (a3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (unint64_t)(a4 - 5) >= 0xFFFFFFFFFFFFFFFELL;
  }
  BOOL v5 = !v4;
  if (v4)
  {
    id v6 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ASTResponse validateTestId:command:]();
    }
  }
  return v5;
}

- (id)validateData:(id)a3 command:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  id v8 = (id)MEMORY[0x263EFFA78];
  switch(a4)
  {
    case 2:
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v9 = ASTLogHandleForCategory(1);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        goto LABEL_58;
      }
      if (-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, @"imageName", objc_opt_class())|| -[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, @"action", objc_opt_class())&& -[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, @"viewTitle", objc_opt_class())&& -[ASTResponse validateResponse:key:expectedClass:](self,
             "validateResponse:key:expectedClass:",
             v7,
             @"suiteName",
             objc_opt_class()))
      {
        goto LABEL_39;
      }
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ASTResponse validateData:command:]();
      }
      goto LABEL_66;
    case 3:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v8, @"predicates", v8, @"parameters", v8, @"specifications", 0);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v10 = [v8 allKeys];
          uint64_t v11 = (void *)[v10 copy];

          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
                if ([(ASTResponse *)self validateResponse:v7 key:v16 expectedClass:objc_opt_class()])
                {
                  uint64_t v17 = [v7 objectForKeyedSubscript:v16];
                  [v8 setObject:v17 forKeyedSubscript:v16];
                }
                else
                {
                  uint64_t v17 = ASTLogHandleForCategory(1);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v27 = v16;
                    _os_log_impl(&dword_23CA80000, v17, OS_LOG_TYPE_DEFAULT, "Warning: statusResponse is missing %@ key. Defaulting to empty dictionary.", buf, 0xCu);
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
            }
            while (v13);
          }

          goto LABEL_68;
        }
      }
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      goto LABEL_58;
    case 5:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(ASTResponse *)self validateResponse:v7 key:@"propertyItems" expectedClass:objc_opt_class()])
          {
            goto LABEL_39;
          }
          uint64_t v9 = ASTLogHandleForCategory(1);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[ASTResponse validateData:command:].cold.5();
          }
          goto LABEL_66;
        }
      }
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      goto LABEL_58;
    case 6:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_39;
        }
      }
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_58;
      }
      goto LABEL_66;
    case 10:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(ASTResponse *)self validateResponse:v7 key:@"actions" expectedClass:objc_opt_class()])
          {
            goto LABEL_39;
          }
          uint64_t v9 = ASTLogHandleForCategory(1);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[ASTResponse validateData:command:].cold.8();
          }
          goto LABEL_66;
        }
      }
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      goto LABEL_58;
    case 11:
    case 12:
      if (!v6) {
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
      goto LABEL_39;
    case 13:
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v9 = ASTLogHandleForCategory(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
LABEL_58:
        }
          -[ASTResponse validateData:command:]();
        goto LABEL_66;
      }
      if (![(ASTResponse *)self validateResponse:v7 key:@"instructionId" expectedClass:objc_opt_class()]|| ![(ASTResponse *)self validateResponse:v7 key:@"type" expectedClass:objc_opt_class()])
      {
        goto LABEL_64;
      }
      uint64_t v18 = [v7 objectForKeyedSubscript:@"type"];
      char v19 = [v18 isEqualToString:@"Alert"];
      if ((v19 & 1) == 0)
      {
        a4 = [v7 objectForKeyedSubscript:@"type"];
        if (([(id)a4 isEqualToString:@"Query"] & 1) == 0)
        {

          goto LABEL_64;
        }
      }
      BOOL v20 = [(ASTResponse *)self validateResponse:v7 key:@"reference" expectedClass:objc_opt_class()];
      if (v19)
      {

        if (!v20) {
          goto LABEL_64;
        }
LABEL_39:
        id v8 = v7;
        goto LABEL_68;
      }

      if (v20) {
        goto LABEL_39;
      }
LABEL_64:
      uint64_t v9 = ASTLogHandleForCategory(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ASTResponse validateData:command:]0();
      }
LABEL_66:

LABEL_67:
      id v8 = 0;
LABEL_68:

      return v8;
    default:
      goto LABEL_68;
  }
}

- (int64_t)command
{
  return self->_command;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)testId
{
  return self->_testId;
}

- (NSDictionary)stringToCommand
{
  return self->_stringToCommand;
}

- (void)setStringToCommand:(id)a3
{
}

- (NSString)commandString
{
  return self->_commandString;
}

- (void)setCommandString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandString, 0);
  objc_storeStrong((id *)&self->_stringToCommand, 0);
  objc_storeStrong((id *)&self->_testId, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateTestId:command:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "testId key missing from statusResponse", v2, v3, v4, v5, v6);
}

- (void)validateData:command:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "data key missing or invalid from statusResponse", v2, v3, v4, v5, v6);
}

- (void)validateData:command:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "imageName or action, viewTitle, and suiteName keys missing from data", v2, v3, v4, v5, v6);
}

- (void)validateData:command:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "propertyItems key missing from data", v2, v3, v4, v5, v6);
}

- (void)validateData:command:.cold.8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "actions key missing from data", v2, v3, v4, v5, v6);
}

- (void)validateData:command:.cold.10()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23CA80000, v0, v1, "instructionId or type and reference keys are missing or contain invalid data", v2, v3, v4, v5, v6);
}

@end