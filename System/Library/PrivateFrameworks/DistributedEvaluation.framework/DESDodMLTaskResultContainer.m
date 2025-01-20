@interface DESDodMLTaskResultContainer
+ (BOOL)supportsSecureCoding;
- (DESDodMLTaskResultContainer)initWithCoder:(id)a3;
- (DESDodMLTaskResultContainer)initWithJSONResult:(id)a3 binaryResultURL:(id)a4 sandboxExtension:(id)a5 duration:(double)a6;
- (NSDictionary)JSONResult;
- (NSString)sandboxExtension;
- (NSURL)binaryResultURL;
- (double)duration;
- (id)description;
- (id)taskResultWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DESDodMLTaskResultContainer

- (DESDodMLTaskResultContainer)initWithJSONResult:(id)a3 binaryResultURL:(id)a4 sandboxExtension:(id)a5 duration:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DESDodMLTaskResultContainer;
  v14 = [(DESDodMLTaskResultContainer *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_JSONResult, a3);
    objc_storeStrong((id *)&v15->_binaryResultURL, a4);
    objc_storeStrong((id *)&v15->_sandboxExtension, a5);
    v15->_duration = a6;
  }

  return v15;
}

- (id)taskResultWithError:(id *)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  p_binaryResultURL = &self->_binaryResultURL;
  if (!self->_binaryResultURL)
  {
    v14 = [[DESInternalDodMLTaskResult alloc] initWithJSONResult:self->_JSONResult binaryResult:0 deferred:0 deferralURL:0 duration:self->_duration];
    goto LABEL_17;
  }
  p_sandboxExtension = &self->_sandboxExtension;
  if (self->_sandboxExtension)
  {
    v7 = [DESSandBoxManager alloc];
    v27 = *p_sandboxExtension;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    v9 = [(DESSandBoxManager *)v7 initWithExtensions:v8];

    id v24 = 0;
    BOOL v10 = [(DESSandBoxManager *)v9 consumeExtensionsWithError:&v24];
    id v11 = v24;
    if (v10)
    {
      id v12 = [[DESMMappedFile alloc] initWithURL:*p_binaryResultURL];
      if (v12)
      {
        id v13 = v12;
        v14 = [[DESDodMLMMappedTaskResult alloc] initWithJSONResult:self->_JSONResult sandboxManager:v9 mmappedFile:v12 duration:self->_duration];
        if (!a3) {
          goto LABEL_16;
        }
      }
      else
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v26 = @"Fail to mmap file.";
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        uint64_t v22 = [v20 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:7003 userInfo:v21];

        v23 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[DESDodMLTaskResultContainer taskResultWithError:]();
        }

        v14 = 0;
        id v13 = 0;
        id v11 = (id)v22;
        if (!a3) {
          goto LABEL_16;
        }
      }
    }
    else
    {
      v18 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[DESDodMLTaskResultContainer taskResultWithError:]();
      }

      v14 = 0;
      id v13 = 0;
      if (!a3) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Missing  sandboxExtension.";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v11 = [v15 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:7002 userInfo:v16];

    objc_super v17 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DESDodMLTaskResultContainer taskResultWithError:](v17);
    }

    v14 = 0;
    id v13 = 0;
    v9 = 0;
    if (!a3) {
      goto LABEL_16;
    }
  }
  *a3 = v11;
LABEL_16:

LABEL_17:

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(binaryResultURL=%@, JSONResult=%@, sandboxExtension=%@, duration=%.1f)", v5, self->_binaryResultURL, self->_JSONResult, self->_sandboxExtension, *(void *)&self->_duration];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  JSONResult = self->_JSONResult;
  id v8 = v4;
  if (JSONResult)
  {
    [v4 encodeObject:JSONResult forKey:@"JSONResult"];
    id v4 = v8;
  }
  binaryResultURL = self->_binaryResultURL;
  if (binaryResultURL)
  {
    [v8 encodeObject:binaryResultURL forKey:@"BinaryResultURL"];
    id v4 = v8;
  }
  sandboxExtension = self->_sandboxExtension;
  if (sandboxExtension)
  {
    [v8 encodeObject:sandboxExtension forKey:@"SandboxExtension"];
    id v4 = v8;
  }
  [v4 encodeDouble:@"Duration" forKey:self->_duration];
}

- (DESDodMLTaskResultContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  BOOL v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  id v11 = 0;
  if ([v4 containsValueForKey:@"JSONResult"])
  {
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"JSONResult"];
  }
  if ([v4 containsValueForKey:@"BinaryResultURL"])
  {
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BinaryResultURL"];
  }
  else
  {
    id v12 = 0;
  }
  if ([v4 containsValueForKey:@"SandboxExtension"])
  {
    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SandboxExtension"];
  }
  else
  {
    id v13 = 0;
  }
  [v4 decodeDoubleForKey:@"Duration"];
  v14 = -[DESDodMLTaskResultContainer initWithJSONResult:binaryResultURL:sandboxExtension:duration:](self, "initWithJSONResult:binaryResultURL:sandboxExtension:duration:", v11, v12, v13);

  return v14;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSURL)binaryResultURL
{
  return self->_binaryResultURL;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_binaryResultURL, 0);

  objc_storeStrong((id *)&self->_JSONResult, 0);
}

- (void)taskResultWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Missing sandboxExtension.", v1, 2u);
}

- (void)taskResultWithError:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Fail to mmap file=%@ with errror=%@.");
}

- (void)taskResultWithError:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Fail to consume sandbox extension=%@ with errror=%@.");
}

@end