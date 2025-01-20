@interface FPSpotlightIndexState
+ (BOOL)supportsSecureCoding;
+ (FPSpotlightIndexState)stateWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FPSpotlightIndexState)init;
- (FPSpotlightIndexState)initWithChangeToken:(id)a3;
- (FPSpotlightIndexState)initWithPage:(id)a3 changeToken:(id)a4;
- (NSData)dataRepresentation;
- (NSData)lastChangeToken;
- (NSData)lastPage;
- (id)description;
- (unint64_t)phase;
- (void)dataRepresentation;
@end

@implementation FPSpotlightIndexState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeToken, 0);

  objc_storeStrong((id *)&self->_lastPage, 0);
}

- (FPSpotlightIndexState)initWithChangeToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPSpotlightIndexState;
  v6 = [(FPSpotlightIndexState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lastChangeToken, a3);
  }

  return v7;
}

- (NSData)dataRepresentation
{
  p_lastChangeToken = &self->_lastChangeToken;
  lastChangeToken = self->_lastChangeToken;
  p_lastPage = &self->_lastPage;
  lastPage = self->_lastPage;
  if (!((unint64_t)lastChangeToken | (unint64_t)lastPage))
  {
    v7 = 0;
    goto LABEL_9;
  }
  if ([(NSData *)lastPage length] <= 0x1F4 && [(NSData *)*p_lastChangeToken length] < 0x401)
  {
    objc_super v9 = objc_opt_new();
    char v12 = 1;
    __int16 v13 = [(NSData *)*p_lastPage length];
    __int16 v14 = [(NSData *)*p_lastChangeToken length];
    [v9 appendBytes:&v12 length:5];
    if (*p_lastPage) {
      -[NSObject appendData:](v9, "appendData:");
    }
    if (*p_lastChangeToken) {
      -[NSObject appendData:](v9, "appendData:");
    }
    if ((unint64_t)[v9 length] < 0x401)
    {
      v7 = v9;
      goto LABEL_8;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"FPSpotlightIndexState.m", 137, @"UNREACHABLE: index state is too large! %@", v9 object file lineNumber description];
  }
  else
  {
    objc_super v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(FPSpotlightIndexState *)(uint64_t *)p_lastPage dataRepresentation];
    }
  }
  v7 = 0;
LABEL_8:

LABEL_9:

  return (NSData *)v7;
}

- (unint64_t)phase
{
  return self->_lastPage == 0;
}

- (NSData)lastChangeToken
{
  return self->_lastChangeToken;
}

+ (FPSpotlightIndexState)stateWithData:(id)a3
{
  id v3 = a3;
  v4 = v3;
  memset(v13, 0, 5);
  if (!v3)
  {
    v6 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)[v3 length] > 4)
  {
    [v4 getBytes:v13 length:5];
    if (LOBYTE(v13[0]) != 1)
    {
      uint64_t v5 = fp_current_or_default_log();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
        +[FPSpotlightIndexState stateWithData:].cold.5();
      }
      goto LABEL_13;
    }
    if (*(_WORD *)((char *)v13 + 1))
    {
      unint64_t v7 = *(unsigned __int16 *)((char *)v13 + 1) + 5;
      if (v7 > [v4 length])
      {
        uint64_t v5 = fp_current_or_default_log();
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
          +[FPSpotlightIndexState stateWithData:].cold.4();
        }
        goto LABEL_13;
      }
      uint64_t v5 = objc_msgSend(v4, "subdataWithRange:", 5, *(unsigned __int16 *)((char *)v13 + 1));
      uint64_t v9 = *(unsigned __int16 *)((char *)v13 + 1) + 5;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v9 = 5;
    }
    if (*(_WORD *)((char *)v13 + 3))
    {
      unint64_t v10 = v9 + *(unsigned __int16 *)((char *)v13 + 3);
      if (v10 > [v4 length])
      {
        v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          +[FPSpotlightIndexState stateWithData:]();
        }

        goto LABEL_13;
      }
      uint64_t v12 = objc_msgSend(v4, "subdataWithRange:", v9, *(unsigned __int16 *)((char *)v13 + 3));
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v5 | v12)
    {
      v6 = [[FPSpotlightIndexState alloc] initWithPage:v5 changeToken:v12];

      goto LABEL_14;
    }
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
      +[FPSpotlightIndexState stateWithData:]((os_log_t)v5);
    }
  }
  else
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      +[FPSpotlightIndexState stateWithData:]((uint64_t)v4, v5);
    }
  }
LABEL_13:
  v6 = 0;
LABEL_14:

LABEL_15:

  return v6;
}

- (FPSpotlightIndexState)initWithPage:(id)a3 changeToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPSpotlightIndexState;
  uint64_t v9 = [(FPSpotlightIndexState *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastPage, a3);
    objc_storeStrong((id *)&v10->_lastChangeToken, a4);
  }

  return v10;
}

- (FPSpotlightIndexState)init
{
  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightIndexState;
  v2 = [(FPSpotlightIndexState *)&v5 init];
  id v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_lastPage, &_NSFileProviderInitialPageSortedByDate);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 lastPage];
    if (v6 == self->_lastPage)
    {
      int v8 = 1;
    }
    else
    {
      id v7 = [v5 lastPage];
      int v8 = [v7 isEqual:self->_lastPage];
    }
    unint64_t v10 = [v5 lastChangeToken];
    if (v10 == self->_lastChangeToken)
    {
      BOOL v9 = v8 != 0;
    }
    else
    {
      v11 = [v5 lastChangeToken];
      char v12 = [v11 isEqual:self->_lastChangeToken];
      if (v8) {
        BOOL v9 = v12;
      }
      else {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(FPSpotlightIndexState *)self phase];
  unint64_t v6 = [(FPSpotlightIndexState *)self phase];
  uint64_t v7 = 16;
  if (!v6) {
    uint64_t v7 = 8;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  BOOL v9 = @"changes";
  if (!v5) {
    BOOL v9 = @"gathering";
  }
  return (id)[v3 stringWithFormat:@"@<%@: %p, %@ from %@>", v4, self, v9, v8];
}

- (NSData)lastPage
{
  return self->_lastPage;
}

+ (void)stateWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_FAULT, "[CRIT] couldn't parse data header: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)stateWithData:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] can't extract pageToken, nor changeToken from provided data", v1, 2u);
}

+ (void)stateWithData:.cold.3()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_6(&dword_1A33AE000, v0, v1, "[CRIT] couldn't read change token of size %u from data: %@");
}

+ (void)stateWithData:.cold.4()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_6(&dword_1A33AE000, v0, v1, "[CRIT] couldn't read page of size %u from data: %@");
}

+ (void)stateWithData:.cold.5()
{
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_6(&dword_1A33AE000, v0, v1, "[CRIT] unexpected data version (%u): %@");
}

- (void)dataRepresentation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] vendor token is too large! page:%@ change:%@", (uint8_t *)&v5, 0x16u);
}

@end