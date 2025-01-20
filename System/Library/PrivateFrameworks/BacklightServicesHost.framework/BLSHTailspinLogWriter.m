@interface BLSHTailspinLogWriter
+ (BOOL)isTailspinAvailable;
- (BLSHTailspinLogWriter)initWithReason:(id)a3;
- (id)_tailspinFilesDirectory;
- (void)_finish:(BOOL)a3;
- (void)writeTailspinLogWithCompletion:(id)a3;
@end

@implementation BLSHTailspinLogWriter

- (BLSHTailspinLogWriter)initWithReason:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHTailspinLogWriter;
  v5 = [(BLSHTailspinLogWriter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    if (initWithReason__onceToken != -1) {
      dispatch_once(&initWithReason__onceToken, &__block_literal_global_19);
    }
  }

  return v5;
}

void __40__BLSHTailspinLogWriter_initWithReason___block_invoke()
{
  v2 = dispatch_get_global_queue(25, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.backlightservices.tailspinLogWriter", 0, v2);
  v1 = (void *)__queue;
  __queue = (uint64_t)v0;
}

- (id)_tailspinFilesDirectory
{
  return (id)[@"/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:*MEMORY[0x263F29928]];
}

+ (BOOL)isTailspinAvailable
{
  if (isTailspinAvailable_onceToken != -1) {
    dispatch_once(&isTailspinAvailable_onceToken, &__block_literal_global_64);
  }
  return isTailspinAvailable___tailspinAvailable;
}

void __44__BLSHTailspinLogWriter_isTailspinAvailable__block_invoke()
{
  isTailspinAvailable___tailspinAvailable = dlopen_preflight("/usr/lib/libtailspin.dylib");
  if ((isTailspinAvailable___tailspinAvailable & 1) == 0)
  {
    dispatch_queue_t v0 = bls_diagnostics_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_INFO, "dlopen_preflight failed - libtailspin is not available", v1, 2u);
    }
  }
}

- (void)writeTailspinLogWithCompletion:(id)a3
{
  v41[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_completion)
  {
    v32 = [NSString stringWithFormat:@"can't call writeTailspinLogWithCompletion while we have a tailspin in flight"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHTailspinLogWriter *)a2 writeTailspinLogWithCompletion:(uint64_t)v32];
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD51E3CLL);
  }
  uint64_t v6 = v5;
  if (!v5)
  {
    v33 = [NSString stringWithFormat:@"BLSHTailspinLogWriter requires a completion"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHTailspinLogWriter *)a2 writeTailspinLogWithCompletion:(uint64_t)v33];
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD51E94);
  }
  v7 = (void *)[v5 copy];
  id completion = self->_completion;
  self->_id completion = v7;

  objc_super v9 = [MEMORY[0x263EFF910] date];
  v10 = objc_msgSend(v9, "bls_fileNameString");

  v11 = [NSString stringWithFormat:@"BacklightServices-%@.tailspin", v10];
  v12 = [(BLSHTailspinLogWriter *)self _tailspinFilesDirectory];
  id v13 = [v12 stringByAppendingPathComponent:v11];
  uint64_t v14 = [v13 cStringUsingEncoding:4];
  if (v14)
  {
    v15 = (const char *)v14;
    id v16 = objc_alloc_init(MEMORY[0x263F08850]);
    id v39 = 0;
    char v17 = [v16 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v18 = v39;
    if ((v17 & 1) == 0)
    {
      v19 = bls_diagnostics_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(BLSHTailspinLogWriter *)(uint64_t)v12 writeTailspinLogWithCompletion:v19];
      }
    }
    v35 = v18;
    int v20 = open(v15, 1538, 432);
    if (v20 < 0)
    {
      v25 = bls_diagnostics_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(BLSHTailspinLogWriter *)(uint64_t)v13 writeTailspinLogWithCompletion:v25];
      }

      [(BLSHTailspinLogWriter *)self _finish:0];
      goto LABEL_23;
    }
    id v34 = v16;
    p_isa = self->_reason;
    unint64_t v22 = [(NSString *)p_isa length];
    if (v22)
    {
      if (v22 < 0x8D)
      {
LABEL_20:
        uint64_t v26 = *MEMORY[0x263F8C848];
        v40[0] = *MEMORY[0x263F8C830];
        v40[1] = v26;
        v41[0] = p_isa;
        v41[1] = MEMORY[0x263EFFA80];
        v27 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        v28 = bls_diagnostics_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_DEFAULT, "dumping tailspin", buf, 2u);
        }

        v29 = self->_reason;
        id v36 = v13;
        v37 = v29;
        v30 = v29;
        v31 = self;
        tailspin_dump_output_with_options();

        id v16 = v34;
LABEL_23:

        goto LABEL_24;
      }
      v23 = [(NSString *)p_isa substringToIndex:139];
    }
    else
    {
      v23 = @"BLS Watchdog";
    }

    p_isa = &v23->isa;
    goto LABEL_20;
  }
  v24 = bls_diagnostics_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:]((uint64_t)v13, v24);
  }

  [(BLSHTailspinLogWriter *)self _finish:0];
LABEL_24:
}

void __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = *(id *)(a1 + 32);
  id v5 = bls_diagnostics_log();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEFAULT, "Wrote tailspin file to path %{public}@ for reason \"%{public}@\"", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke_cold_1(a1, v6);
  }

  close(*(_DWORD *)(a1 + 56));
  [v4 _finish:a2];
}

- (void)_finish:(BOOL)a3
{
}

void __33__BLSHTailspinLogWriter__finish___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)writeTailspinLogWithCompletion:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  int v9 = @"BLSHTailspinLogWriter.m";
  __int16 v10 = 1024;
  int v11 = 66;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)writeTailspinLogWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "Could not get filepath for %@", (uint8_t *)&v2, 0xCu);
}

- (void)writeTailspinLogWithCompletion:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "Failed to open file descriptor for diagnostics:%d, %{public}@", (uint8_t *)v3, 0x12u);
}

- (void)writeTailspinLogWithCompletion:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "failed to create dir %@:%@", (uint8_t *)&v3, 0x16u);
}

- (void)writeTailspinLogWithCompletion:(uint64_t)a3 .cold.5(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(a1);
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  int v9 = @"BLSHTailspinLogWriter.m";
  __int16 v10 = 1024;
  int v11 = 65;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

void __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "Failed to write tailspin file to path %{public}@ for reason \"%{public}@\"", (uint8_t *)&v4, 0x16u);
}

@end