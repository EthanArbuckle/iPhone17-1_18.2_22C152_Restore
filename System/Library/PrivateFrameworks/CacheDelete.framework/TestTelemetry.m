@interface TestTelemetry
+ (id)testTelemetryWithInfo:(id)a3;
- (NSMutableArray)removeFailures;
- (NSMutableArray)terminationFailures;
- (OS_dispatch_queue)q;
- (TestTelemetry)initWithInfo:(id)a3;
- (double)remove_threshold;
- (double)termination_threshold;
- (id)description;
- (unint64_t)deletes;
- (unint64_t)files_deleted;
- (void)addDeletes:(unint64_t)a3;
- (void)addRemoveFailure:(id)a3;
- (void)addTerminationFailure:(id)a3;
- (void)setFiles_deleted:(unint64_t)a3;
- (void)setRemoveFailures:(id)a3;
- (void)setRemove_threshold:(double)a3;
- (void)setTerminationFailures:(id)a3;
- (void)setTermination_threshold:(double)a3;
@end

@implementation TestTelemetry

- (TestTelemetry)initWithInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_TEST_TERMINATION_THRESHOLD"];
      uint64_t v9 = evaluateNumberProperty(v8);

      v10 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_TEST_REMOVE_THRESHOLD"];
      uint64_t v11 = evaluateNumberProperty(v10);

      if (v9 | v11
        && ([(id)v9 intValue] || objc_msgSend((id)v11, "intValue")))
      {
        v21.receiver = self;
        v21.super_class = (Class)TestTelemetry;
        v12 = [(TestTelemetry *)&v21 init];
        if (v12)
        {
          if (v9)
          {
            [(id)v9 floatValue];
            v12->_termination_threshold = v13;
          }
          if (v11)
          {
            [(id)v11 floatValue];
            v12->_remove_threshold = v14;
          }
          dispatch_queue_t v15 = dispatch_queue_create("TestTelemetry_add_queue", 0);
          q = v12->_q;
          v12->_q = (OS_dispatch_queue *)v15;
        }
        v17 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = (const char *)v12;
          __int16 v24 = 2112;
          v25 = v5;
          _os_log_impl(&dword_1A63D1000, v17, OS_LOG_TYPE_DEFAULT, "initialized TestTelemetry: %@, info: %@", buf, 0x16u);
        }

        self = v12;
        v18 = self;
      }
      else
      {
        v19 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v5;
          _os_log_error_impl(&dword_1A63D1000, v19, OS_LOG_TYPE_ERROR, "Invalid test parameters: %@", buf, 0xCu);
        }

        v18 = 0;
      }
    }
    else
    {
      uint64_t v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[TestTelemetry initWithInfo:]";
        _os_log_error_impl(&dword_1A63D1000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "[%s] no test parameters in info", buf, 0xCu);
      }
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_removeFailures, 0);
  objc_storeStrong((id *)&self->_terminationFailures, 0);
}

+ (id)testTelemetryWithInfo:(id)a3
{
  id v3 = a3;
  v4 = [[TestTelemetry alloc] initWithInfo:v3];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  [(TestTelemetry *)self termination_threshold];
  uint64_t v5 = v4;
  v6 = [(TestTelemetry *)self terminationFailures];
  [(TestTelemetry *)self remove_threshold];
  uint64_t v8 = v7;
  uint64_t v9 = [(TestTelemetry *)self removeFailures];
  v10 = [v3 stringWithFormat:@"termination threshold: %f -- failures: %@, remove threshold: %f -- failures: %@", v5, v6, v8, v9];

  return v10;
}

- (void)addRemoveFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TestTelemetry *)self removeFailures];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(TestTelemetry *)self setRemoveFailures:v6];
  }
  id v7 = [(TestTelemetry *)self removeFailures];
  [v7 addObject:v4];
}

- (void)addTerminationFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TestTelemetry *)self terminationFailures];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(TestTelemetry *)self setTerminationFailures:v6];
  }
  id v7 = [(TestTelemetry *)self terminationFailures];
  [v7 addObject:v4];
}

- (void)addDeletes:(unint64_t)a3
{
  uint64_t v5 = [(TestTelemetry *)self q];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__TestTelemetry_addDeletes___block_invoke;
  v6[3] = &unk_1E5C51928;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __28__TestTelemetry_addDeletes___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40) + objc_msgSend(v1, "files_deleted");
  return objc_msgSend(v1, "setFiles_deleted:", v2);
}

- (unint64_t)deletes
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(TestTelemetry *)self q];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__TestTelemetry_deletes__block_invoke;
  v6[3] = &unk_1E5C51888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __24__TestTelemetry_deletes__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "files_deleted");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)termination_threshold
{
  return self->_termination_threshold;
}

- (void)setTermination_threshold:(double)a3
{
  self->_termination_threshold = a3;
}

- (double)remove_threshold
{
  return self->_remove_threshold;
}

- (void)setRemove_threshold:(double)a3
{
  self->_remove_threshold = a3;
}

- (NSMutableArray)terminationFailures
{
  return self->_terminationFailures;
}

- (void)setTerminationFailures:(id)a3
{
}

- (NSMutableArray)removeFailures
{
  return self->_removeFailures;
}

- (void)setRemoveFailures:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)files_deleted
{
  return self->_files_deleted;
}

- (void)setFiles_deleted:(unint64_t)a3
{
  self->_files_deleted = a3;
}

@end