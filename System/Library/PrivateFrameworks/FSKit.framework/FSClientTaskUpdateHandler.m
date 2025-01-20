@interface FSClientTaskUpdateHandler
- (id)taskHandler;
- (void)setTaskHandler:(id)a3;
- (void)taskStatusUpdate:(id)a3;
@end

@implementation FSClientTaskUpdateHandler

- (void)taskStatusUpdate:(id)a3
{
  id v4 = a3;
  v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSClientTaskUpdateHandler taskStatusUpdate:](v4);
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = (void (**)(void *, id, void))_Block_copy(v6->_taskHandler);
  objc_sync_exit(v6);

  if (v7) {
    v7[2](v7, v4, 0);
  }
  v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSClientTaskUpdateHandler taskStatusUpdate:](v4);
  }
}

- (id)taskHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTaskHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)taskStatusUpdate:(void *)a1 .cold.1(void *a1)
{
  v2 = [a1 taskID];
  [a1 taskState];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_24DDB2000, v3, v4, "%s:end:taskID(%@):taskState(%d)", v5, v6, v7, v8, 2u);
}

- (void)taskStatusUpdate:(void *)a1 .cold.2(void *a1)
{
  v2 = [a1 taskID];
  [a1 taskState];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_24DDB2000, v3, v4, "%s:start:taskID(%@):taskState(%d)", v5, v6, v7, v8, 2u);
}

@end