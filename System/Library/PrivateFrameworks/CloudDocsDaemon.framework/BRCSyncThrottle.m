@interface BRCSyncThrottle
- (BOOL)_validateThrottleParams:(id)a3;
- (BOOL)matchesItem:(id)a3 nsecsToRetry:(unint64_t *)a4 now:(unint64_t)a5;
- (BRCSyncThrottle)initWithName:(id)a3 andParameters:(id)a4;
- (NSPredicate)predicate;
- (void)setPredicate:(id)a3;
@end

@implementation BRCSyncThrottle

- (BOOL)matchesItem:(id)a3 nsecsToRetry:(unint64_t *)a4 now:(unint64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(NSPredicate *)self->_predicate evaluateWithObject:v8];
  if (v9)
  {
    v10 = [v8 clientZone];
    v11 = [v8 itemID];
    *a4 = -[BRCThrottle nsecsToNextRetry:now:increment:](self, "nsecsToNextRetry:now:increment:", [v10 throttleHashWithItemID:v11], a5, 1);
  }
  return v9;
}

- (BOOL)_validateThrottleParams:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[BRCSyncThrottle _validateThrottleParams:]();
    }
    goto LABEL_12;
  }
  v4 = [v3 objectForKeyedSubscript:@"platforms"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRCSyncThrottle _validateThrottleParams:]();
    }
    goto LABEL_11;
  }
  v5 = BRPlatform();
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(BRCSyncThrottle *)(uint64_t)v3 _validateThrottleParams:v9];
    }
LABEL_11:

LABEL_12:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (BRCSyncThrottle)initWithName:(id)a3 andParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BRCSyncThrottle *)self _validateThrottleParams:v7])
  {
    v14.receiver = self;
    v14.super_class = (Class)BRCSyncThrottle;
    id v8 = [(BRCThrottle *)&v14 initWithName:v6 andParameters:v7];
    if (v8)
    {
      BOOL v9 = [v7 objectForKeyedSubscript:@"predicate"];
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:v9];
        predicate = v8->_predicate;
        v8->_predicate = (NSPredicate *)v10;
      }
    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_validateThrottleParams:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = BRPlatform();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] throttle dict %@ isn't for our platform %@%@", (uint8_t *)&v7, 0x20u);
}

- (void)_validateThrottleParams:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Platforms %@ isn't an array%@");
}

- (void)_validateThrottleParams:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Throttle %@ isn't a dictionary%@");
}

@end