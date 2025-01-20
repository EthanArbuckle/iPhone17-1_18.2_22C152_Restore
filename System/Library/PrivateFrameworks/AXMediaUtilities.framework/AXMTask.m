@interface AXMTask
- (BOOL)isComplete;
- (id)taskCompleteBlock;
- (void)markAsComplete:(BOOL)a3;
- (void)setComplete:(BOOL)a3;
- (void)setTaskCompleteBlock:(id)a3;
@end

@implementation AXMTask

- (void)markAsComplete:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_complete)
  {
    v5 = AXMediaLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AXMTask markAsComplete:]();
    }
  }
  self->_complete = 1;
  v6 = [(AXMTask *)self taskCompleteBlock];
  ((void (**)(void, AXMTask *, BOOL))v6)[2](v6, self, v3);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (id)taskCompleteBlock
{
  return self->_taskCompleteBlock;
}

- (void)setTaskCompleteBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)markAsComplete:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Task should not be complete if being marked as complete", v2, v3, v4, v5, v6);
}

@end