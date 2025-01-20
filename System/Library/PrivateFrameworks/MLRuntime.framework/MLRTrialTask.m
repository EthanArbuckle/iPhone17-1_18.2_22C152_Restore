@interface MLRTrialTask
- (MLRTrialTask)initWithTriClient:(id)a3;
- (MLRTrialTask)initWithTrialTask:(id)a3;
- (TRIClient)triClient;
- (id)description;
@end

@implementation MLRTrialTask

- (MLRTrialTask)initWithTriClient:(id)a3
{
  id v5 = a3;
  if (!objc_opt_class())
  {
    v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLRTrialTask initWithTriClient:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }
  if (!v5)
  {
    v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLRTrialTask initWithTriClient:](v9, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_10:

    v8 = 0;
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)MLRTrialTask;
  v6 = [(MLRTrialTask *)&v25 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_triClient, a3);
  }
  self = v7;
  v8 = self;
LABEL_11:

  return v8;
}

- (MLRTrialTask)initWithTrialTask:(id)a3
{
  id v4 = a3;
  if (!objc_opt_class())
  {
    v8 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLRTrialTask initWithTriClient:](v8, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_9;
  }
  id v5 = (void *)MEMORY[0x263F80E20];
  uint64_t v6 = [v4 projectId];
  v7 = [v4 evaluationState];
  v8 = [v5 clientWithProjectId:v6 factorsState:v7];

  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLRTrialTask initWithTrialTask:](v4, v17);
    }

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  self = [(MLRTrialTask *)self initWithTriClient:v8];
  v9 = self;
LABEL_10:

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@(%@)\n", v5, self->_triClient];

  return v6;
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void).cxx_destruct
{
}

- (void)initWithTriClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTriClient:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTrialTask:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 evaluationState];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21C376000, a2, OS_LOG_TYPE_ERROR, "Fail to initialize TRIClient with factoryState=%@.", (uint8_t *)&v4, 0xCu);
}

@end