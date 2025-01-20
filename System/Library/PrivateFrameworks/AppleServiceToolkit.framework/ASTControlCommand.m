@interface ASTControlCommand
+ (BOOL)supportsSecureCoding;
- (ASTControlCommand)init;
- (ASTControlCommand)initWithCoder:(id)a3;
- (BOOL)allActionsFinished;
- (BOOL)forceSequential;
- (BOOL)haltOnError;
- (BOOL)reset;
- (NSMutableDictionary)actionStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)requestData;
- (id)requestWithData:(id)a3 session:(id)a4 queue:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)performActionsWithSession:(id)a3 queue:(id)a4;
- (void)setActionStorage:(id)a3;
- (void)setForceSequential:(BOOL)a3;
- (void)setHaltOnError:(BOOL)a3;
- (void)updateAction:(id)a3;
@end

@implementation ASTControlCommand

- (ASTControlCommand)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASTControlCommand;
  v2 = [(ASTControlCommand *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    actionStorage = v2->_actionStorage;
    v2->_actionStorage = (NSMutableDictionary *)v3;

    *(_WORD *)&v2->_forceSequential = 0;
  }
  return v2;
}

- (id)requestWithData:(id)a3 session:(id)a4 queue:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v30 = a4;
  queue = a5;
  id v31 = +[ASTRequest request];
  v8 = [v32 objectForKeyedSubscript:@"forceSequential"];

  if (v8)
  {
    v9 = [v32 objectForKeyedSubscript:@"forceSequential"];
    -[ASTControlCommand setForceSequential:](self, "setForceSequential:", [v9 BOOLValue]);
  }
  v10 = [v32 objectForKeyedSubscript:@"haltOnError"];

  if (v10)
  {
    v11 = [v32 objectForKeyedSubscript:@"haltOnError"];
    -[ASTControlCommand setHaltOnError:](self, "setHaltOnError:", [v11 BOOLValue]);
  }
  [v32 objectForKeyedSubscript:@"actions"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v16 = [v15 objectForKeyedSubscript:@"action"];

        if (v16)
        {
          v17 = [ASTAction alloc];
          v18 = [v15 objectForKeyedSubscript:@"action"];
          v19 = [(ASTAction *)v17 initWithAction:v18 data:v15];

          v20 = [(ASTControlCommand *)self actionStorage];
          objc_sync_enter(v20);
          v21 = [(ASTControlCommand *)self actionStorage];
          v22 = [(ASTAction *)v19 identifier];
          [v21 setObject:v19 forKeyedSubscript:v22];

          objc_sync_exit(v20);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  v23 = [(ASTControlCommand *)self actionStorage];
  BOOL v24 = [v23 count] == 0;

  if (v24)
  {
    v27 = ASTLogHandleForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ASTControlCommand requestWithData:session:queue:](v27);
    }

    [v31 setClientStatus:8];
  }
  else
  {
    [v31 setClientStatus:13];
    uint64_t v25 = [(ASTControlCommand *)self requestData];
    [v31 setData:v25];

    v26 = [v30 delegate];
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if (v25)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__ASTControlCommand_requestWithData_session_queue___block_invoke;
      block[3] = &unk_264E7D680;
      block[4] = self;
      id v35 = v30;
      dispatch_async(queue, block);
    }
  }

  return v31;
}

void __51__ASTControlCommand_requestWithData_session_queue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actionStorage];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [*(id *)(a1 + 32) actionStorage];
    objc_super v6 = [v5 allValues];
    objc_msgSend(v7, "session:performActions:sequentially:stopOnError:", v4, v6, objc_msgSend(*(id *)(a1 + 32), "forceSequential"), objc_msgSend(*(id *)(a1 + 32), "haltOnError"));
  }
}

- (void)performActionsWithSession:(id)a3 queue:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [(ASTControlCommand *)self actionStorage];
  objc_sync_enter(v9);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(ASTControlCommand *)self actionStorage];
  v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v15 isFinished] & 1) == 0) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v9);
  if ([v8 count])
  {
    v16 = [v6 delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__ASTControlCommand_performActionsWithSession_queue___block_invoke;
      block[3] = &unk_264E7D6A8;
      id v19 = v6;
      id v20 = v8;
      v21 = self;
      dispatch_async(v7, block);
    }
  }
}

void __53__ASTControlCommand_performActionsWithSession_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "session:performActions:sequentially:stopOnError:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "forceSequential"), objc_msgSend(*(id *)(a1 + 48), "haltOnError"));
}

- (id)requestData
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(ASTControlCommand *)self actionStorage];
  objc_sync_enter(v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ASTControlCommand *)self actionStorage];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryValue];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);
  char v17 = @"actions";
  v18 = v3;
  v11 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  return v11;
}

- (void)updateAction:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(ASTControlCommand *)self actionStorage];
  objc_sync_enter(v4);
  v5 = [(ASTControlCommand *)self actionStorage];
  id v6 = [v7 identifier];
  [v5 setObject:v7 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (BOOL)allActionsFinished
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ASTControlCommand *)self actionStorage];
  objc_sync_enter(v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ASTControlCommand *)self actionStorage];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        if (([*(id *)(*((void *)&v11 + 1) + 8 * i) isFinished] & 1) == 0)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (BOOL)reset
{
  uint64_t v3 = [(ASTControlCommand *)self actionStorage];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(ASTControlCommand *)self setActionStorage:v5];

    [(ASTControlCommand *)self setForceSequential:0];
    [(ASTControlCommand *)self setHaltOnError:0];
  }
  return v4 != 0;
}

- (ASTControlCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTControlCommand *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    BOOL v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"actionStorage"];
    actionStorage = v5->_actionStorage;
    v5->_actionStorage = (NSMutableDictionary *)v10;

    v5->_forceSequential = [v4 decodeBoolForKey:@"forceSequential"];
    v5->_haltOnError = [v4 decodeBoolForKey:@"haltOnError"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ASTControlCommand *)self actionStorage];
  [v5 encodeObject:v4 forKey:@"actionStorage"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ASTControlCommand forceSequential](self, "forceSequential"), @"forceSequential");
  objc_msgSend(v5, "encodeBool:forKey:", -[ASTControlCommand haltOnError](self, "haltOnError"), @"haltOnError");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableDictionary *)self->_actionStorage copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(unsigned char *)(v5 + 8) = self->_forceSequential;
  *(unsigned char *)(v5 + 9) = self->_haltOnError;
  return (id)v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [(ASTControlCommand *)self forceSequential];
  BOOL v7 = [(ASTControlCommand *)self haltOnError];
  uint64_t v8 = [(ASTControlCommand *)self actionStorage];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; forceSequential = %d, haltOnError = %d, actionStorage = %@>",
    v5,
    self,
    v6,
    v7,
  BOOL v9 = v8);

  return v9;
}

- (BOOL)forceSequential
{
  return self->_forceSequential;
}

- (void)setForceSequential:(BOOL)a3
{
  self->_forceSequential = a3;
}

- (BOOL)haltOnError
{
  return self->_haltOnError;
}

- (void)setHaltOnError:(BOOL)a3
{
  self->_haltOnError = a3;
}

- (NSMutableDictionary)actionStorage
{
  return self->_actionStorage;
}

- (void)setActionStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)requestWithData:(os_log_t)log session:queue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "No valid actions on Control command", v1, 2u);
}

@end