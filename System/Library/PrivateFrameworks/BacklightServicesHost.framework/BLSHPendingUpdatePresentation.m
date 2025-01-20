@interface BLSHPendingUpdatePresentation
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHPendingUpdatePresentation)initWithPresentation:(id)a3;
- (BOOL)isCompleted;
- (BOOL)isStarted;
- (NSString)description;
- (int64_t)targetBacklightState;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTargetBacklightState:(int64_t)a3;
@end

@implementation BLSHPendingUpdatePresentation

- (BLSHPendingUpdatePresentation)initWithPresentation:(id)a3
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHPendingUpdatePresentation;
  v7 = [(BLSHPendingUpdatePresentation *)&v11 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  if (v6)
  {
    objc_storeStrong((id *)&v7->_presentation, a3);
LABEL_4:

    return v8;
  }
  v10 = [NSString stringWithFormat:@"created BLSHPendingUpdatePresentation with nil presentation"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    [(BLSHPendingUpdatePresentation *)a2 initWithPresentation:(uint64_t)v10];
  }
  [v10 UTF8String];
  result = (BLSHPendingUpdatePresentation *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (int64_t)type
{
  return 2;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdatePresentation isStarted](self, "isStarted"), @"started");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdatePresentation isCompleted](self, "isCompleted"), @"completed");
  [(BLSHPendingUpdatePresentation *)self targetBacklightState];
  id v6 = NSStringFromBLSBacklightState();
  id v7 = (id)[v3 appendObject:v6 withName:@"target"];

  id v8 = (id)[v3 appendObject:self->_presentation withName:@"presentation"];
  v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return (BLSHBacklightEnvironmentPresentation *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)targetBacklightState
{
  return self->_targetBacklightState;
}

- (void)setTargetBacklightState:(int64_t)a3
{
  self->_targetBacklightState = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithPresentation:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  objc_super v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"BLSHPendingUpdatePresentation.m";
  __int16 v16 = 1024;
  int v17 = 19;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end