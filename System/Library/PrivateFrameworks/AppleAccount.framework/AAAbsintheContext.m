@interface AAAbsintheContext
- (AAAbsintheContext)init;
- (BOOL)R6XtwiyjL3q2:(id)a3 error:(id *)a4;
- (id)TgBfoO2wtF5L:(id)a3 error:(id *)a4;
- (id)cao1NI5PNJBn:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation AAAbsintheContext

- (AAAbsintheContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)AAAbsintheContext;
  result = [(AAAbsintheContext *)&v3 init];
  if (result) {
    result->_contextRef = 0;
  }
  return result;
}

- (void)dealloc
{
  contextRef = self->_contextRef;
  if (contextRef) {
    IW1PcFszqNK((uint64_t)contextRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)AAAbsintheContext;
  [(AAAbsintheContext *)&v4 dealloc];
}

- (id)TgBfoO2wtF5L:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AAAbsintheContext.m", 46, @"Invalid parameter not satisfying: %@", @"certificateData" object file lineNumber description];
  }
  if (self->_contextRef)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"AAAbsintheContext.m" lineNumber:48 description:@"Proxy already initialized!"];
  }
  id v8 = v7;
  KxmB0CKvgWt([v8 bytes], objc_msgSend(v8, "length"));
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAAbsintheContext TgBfoO2wtF5L:error:](v10);
    }

    if (a4)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v18 = @"AAAbsintheError";
      v13 = [NSNumber numberWithInt:v10];
      v19[0] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      objc_msgSend(v12, "aa_errorWithCode:userInfo:", -4403, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = (id *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:0 length:0 deallocator:&__block_literal_global_26];
  }

  return a4;
}

uint64_t __40__AAAbsintheContext_TgBfoO2wtF5L_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return Be81a395Bf0(a2);
}

- (BOOL)R6XtwiyjL3q2:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"AAAbsintheContext.m", 75, @"Invalid parameter not satisfying: %@", @"sessionInfo" object file lineNumber description];
  }
  contextRef = self->_contextRef;
  id v9 = v7;
  nDYmeMqvWb((uint64_t)contextRef, [v9 bytes], objc_msgSend(v9, "length"));
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AAAbsintheContext R6XtwiyjL3q2:error:](v11);
    }

    if (a4)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      v18 = @"AAAbsintheError";
      v14 = [NSNumber numberWithInt:v11];
      v19[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      objc_msgSend(v13, "aa_errorWithCode:userInfo:", -4403, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11 == 0;
}

- (id)cao1NI5PNJBn:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  contextRef = self->_contextRef;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  t1BoNctgaUu66((uint64_t)contextRef, v7, v8, (uint64_t)&v18);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAAbsintheContext cao1NI5PNJBn:error:](v10);
    }

    if (v18) {
      Be81a395Bf0(v18);
    }
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v19 = @"AAAbsintheError";
      v13 = [NSNumber numberWithInt:v10];
      v20[0] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      objc_msgSend(v12, "aa_errorWithCode:userInfo:", -4403, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v15 = (void *)[v16 initWithBytesNoCopy:v18 length:0 deallocator:&__block_literal_global_48];
  }

  return v15;
}

uint64_t __40__AAAbsintheContext_cao1NI5PNJBn_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return Be81a395Bf0(a2);
}

- (void)TgBfoO2wtF5L:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "Failed to initialize context: %@", v4, v5, v6, v7, 2u);
}

- (void)R6XtwiyjL3q2:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "Failed to establish key: %@", v4, v5, v6, v7, 2u);
}

- (void)cao1NI5PNJBn:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "Failed to generate signature: %@", v4, v5, v6, v7, 2u);
}

@end