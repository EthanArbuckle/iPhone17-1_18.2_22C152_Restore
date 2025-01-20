@interface ASTRequest
+ (BOOL)isEstimatedTimeRemainingFeatureEnabled;
+ (id)request;
+ (id)stringFromClientStatus:(int64_t)a3;
- (ASTErrorStatus)error;
- (ASTRequest)init;
- (NSDictionary)data;
- (NSNumber)currentTest;
- (NSNumber)estimatedTimeRemaining;
- (NSNumber)progress;
- (id)completion;
- (id)description;
- (id)generatePayload;
- (int64_t)clientStatus;
- (void)setClientStatus:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setCurrentTest:(id)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setEstimatedTimeRemaining:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation ASTRequest

- (ASTRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)ASTRequest;
  v2 = [(ASTRequest *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_clientStatus = 1;
    v4 = objc_alloc_init(ASTErrorStatus);
    error = v3->_error;
    v3->_error = v4;

    data = v3->_data;
    v3->_data = 0;

    currentTest = v3->_currentTest;
    v3->_currentTest = 0;

    progress = v3->_progress;
    v3->_progress = 0;

    estimatedTimeRemaining = v3->_estimatedTimeRemaining;
    v3->_estimatedTimeRemaining = 0;

    id completion = v3->_completion;
    v3->_id completion = 0;
  }
  return v3;
}

+ (id)request
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (BOOL)isEstimatedTimeRemainingFeatureEnabled
{
  if (isEstimatedTimeRemainingFeatureEnabled_onceToken != -1) {
    dispatch_once(&isEstimatedTimeRemainingFeatureEnabled_onceToken, &__block_literal_global_0);
  }
  return isEstimatedTimeRemainingFeatureEnabled_isEnabled;
}

void __52__ASTRequest_isEstimatedTimeRemainingFeatureEnabled__block_invoke()
{
  if (+[ASTEnvironment isInternalBuild])
  {
    v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AppleServiceToolkit"];
    isEstimatedTimeRemainingFeatureEnabled_isEnabled = [v0 BOOLForKey:@"EnableEstimatedTimeRemaining"];
  }
}

- (id)generatePayload
{
  v27[6] = *MEMORY[0x263EF8340];
  if (+[ASTRequest isEstimatedTimeRemainingFeatureEnabled])
  {
    v26[0] = @"clientStatus";
    uint64_t v3 = +[ASTRequest stringFromClientStatus:[(ASTRequest *)self clientStatus]];
    v27[0] = v3;
    v26[1] = @"currentTest";
    v4 = [(ASTRequest *)self currentTest];
    uint64_t v5 = (uint64_t)v4;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x263EFF9D0] null];
    }
    v27[1] = v5;
    v26[2] = @"progress";
    v6 = [(ASTRequest *)self progress];
    v7 = v6;
    if (!v6)
    {
      v7 = [MEMORY[0x263EFF9D0] null];
    }
    v27[2] = v7;
    v26[3] = @"estimatedTimeRemaining";
    v8 = [(ASTRequest *)self estimatedTimeRemaining];
    v9 = v8;
    if (!v8)
    {
      v9 = [MEMORY[0x263EFF9D0] null];
    }
    v27[3] = v9;
    v26[4] = @"data";
    v10 = [(ASTRequest *)self data];
    v11 = v10;
    if (!v10)
    {
      v11 = [MEMORY[0x263EFF9D0] null];
    }
    v27[4] = v11;
    v26[5] = @"status";
    objc_super v12 = [(ASTRequest *)self error];
    v13 = [v12 dictionary];
    v27[5] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

    if (!v10) {
    if (!v8)
    }

    v16 = v22;
    v15 = v23;
    if (!v6) {
LABEL_25:
    }
  }
  else
  {
    v24[0] = @"clientStatus";
    v15 = +[ASTRequest stringFromClientStatus:[(ASTRequest *)self clientStatus]];
    v25[0] = v15;
    v24[1] = @"currentTest";
    v4 = [(ASTRequest *)self currentTest];
    v16 = v4;
    if (!v4)
    {
      v16 = [MEMORY[0x263EFF9D0] null];
    }
    v25[1] = v16;
    v24[2] = @"progress";
    v6 = [(ASTRequest *)self progress];
    v7 = v6;
    if (!v6)
    {
      v7 = [MEMORY[0x263EFF9D0] null];
    }
    v25[2] = v7;
    v24[3] = @"data";
    v17 = [(ASTRequest *)self data];
    v18 = v17;
    if (!v17)
    {
      v18 = [MEMORY[0x263EFF9D0] null];
    }
    v25[3] = v18;
    v24[4] = @"status";
    v19 = [(ASTRequest *)self error];
    v20 = [v19 dictionary];
    v25[4] = v20;
    v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

    if (!v17) {
    if (!v6)
    }
      goto LABEL_25;
  }

  if (!v4) {

  }
  return v14;
}

- (void)setClientStatus:(int64_t)a3
{
  self->_clientStatus = a3;
  [(ASTSealablePayload *)self setSealed:0];
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);

  [(ASTSealablePayload *)self setSealed:0];
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);

  [(ASTSealablePayload *)self setSealed:0];
}

- (void)setCurrentTest:(id)a3
{
  objc_storeStrong((id *)&self->_currentTest, a3);

  [(ASTSealablePayload *)self setSealed:0];
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);

  [(ASTSealablePayload *)self setSealed:0];
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, a3);

  [(ASTSealablePayload *)self setSealed:0];
}

- (id)description
{
  if ([(ASTSealablePayload *)self isSealed])
  {
    v12.receiver = self;
    v12.super_class = (Class)ASTRequest;
    uint64_t v3 = [(ASTSealablePayload *)&v12 description];
  }
  else
  {
    BOOL v4 = +[ASTRequest isEstimatedTimeRemainingFeatureEnabled];
    uint64_t v5 = NSString;
    v6 = +[ASTRequest stringFromClientStatus:[(ASTRequest *)self clientStatus]];
    v7 = [(ASTRequest *)self currentTest];
    uint64_t v8 = [(ASTRequest *)self progress];
    v9 = (void *)v8;
    if (v4)
    {
      v10 = [(ASTRequest *)self estimatedTimeRemaining];
      uint64_t v3 = [v5 stringWithFormat:@"Client Status: %@, Current Test: %@, Progress: %@, Estimated Time Remaining: %@", v6, v7, v9, v10];
    }
    else
    {
      uint64_t v3 = [v5 stringWithFormat:@"Client Status: %@, Current Test: %@, Progress: %@", v6, v7, v8];
    }
  }

  return v3;
}

+ (id)stringFromClientStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF) {
    return &stru_26F0AC800;
  }
  else {
    return off_264E7D768[a3];
  }
}

- (int64_t)clientStatus
{
  return self->_clientStatus;
}

- (ASTErrorStatus)error
{
  return self->_error;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSNumber)currentTest
{
  return self->_currentTest;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end