@interface VCPEspressoModel
- (BOOL)buildModelWithConfig:(id)a3 error:(id *)a4;
- (BOOL)prepareModelWithFile:(id)a3 engine:(int)a4 config:(id)a5 error:(id *)a6;
- (BOOL)updateModelWithConfig:(id)a3 error:(id *)a4;
- (id)initModelWithName:(id)a3 andConfig:(id)a4;
- (int)loadModel:(id)a3;
- (void)dealloc;
- (void)freeModel;
@end

@implementation VCPEspressoModel

- (id)initModelWithName:(id)a3 andConfig:(id)a4
{
  id v6 = a4;
  v7 = [a3 stringByAppendingFormat:@".espresso.net"];
  v16.receiver = self;
  v16.super_class = (Class)VCPEspressoModel;
  v8 = [(VCPEspressoModel *)&v16 init];
  v9 = v8;
  if (v8)
  {
    id v15 = 0;
    BOOL v10 = [(VCPEspressoModel *)v8 prepareModelWithFile:v7 engine:10007 config:v6 error:&v15];
    id v11 = v15;
    if (v10) {
      v12 = v9;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    id v11 = 0;
  }
  v13 = v12;

  return v13;
}

- (int)loadModel:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v5 = [v4 resourceURL];

  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3 relativeToURL:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 path];
    [v8 UTF8String];
    int v9 = espresso_plan_add_network();
  }
  else
  {
    int v9 = -1;
  }

  return v9;
}

- (BOOL)prepareModelWithFile:(id)a3 engine:(int)a4 config:(id)a5 error:(id *)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = (OS_dispatch_queue *)dispatch_queue_create("callback queue", 0);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = v11;

  context = (void *)espresso_create_context();
  self->_context = context;
  if (context)
  {
    plan = (void *)espresso_create_plan();
    self->_plan = plan;
    if (plan)
    {
      if ([(VCPEspressoModel *)self loadModel:v9])
      {
        if (a6)
        {
          id v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          objc_super v16 = [NSString stringWithFormat:@"%@ Load Error", v9];
          v26 = v16;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          v18 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
LABEL_14:
          *a6 = v18;

          LOBYTE(a6) = 0;
        }
      }
      else if ([(VCPEspressoModel *)self buildModelWithConfig:v10 error:a6])
      {
        LOBYTE(a6) = 1;
      }
      else if (a6)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        objc_super v16 = [NSString stringWithFormat:@"Build Model Error"];
        v24 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        v18 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
        goto LABEL_14;
      }
    }
    else if (a6)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      objc_super v16 = [NSString stringWithFormat:@"Create Plan Error"];
      v28 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v18 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
      goto LABEL_14;
    }
  }
  else if (a6)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    objc_super v16 = [NSString stringWithFormat:@"Create Context Error"];
    v30[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v18 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
    goto LABEL_14;
  }

  return (char)a6;
}

- (BOOL)buildModelWithConfig:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5
    && ([v5 UTF8String], espresso_network_select_configuration()))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"Select Configuration Error"];
      v16[0] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v10 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
LABEL_8:
      *a4 = v10;

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    if (!espresso_plan_build())
    {
      LOBYTE(a4) = 1;
      goto LABEL_10;
    }
    if (a4)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"Build Plan Error"];
      v14 = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v10 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
      goto LABEL_8;
    }
  }
LABEL_10:

  return (char)a4;
}

- (BOOL)updateModelWithConfig:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (espresso_plan_build_clean())
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"Clean Plan Error"];
      v12[0] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a4 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = [(VCPEspressoModel *)self buildModelWithConfig:v6 error:a4];
  }

  return (char)a4;
}

- (void)freeModel
{
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_context)
  {
    espresso_context_destroy();
  }
}

- (void)dealloc
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_context) {
    espresso_context_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPEspressoModel;
  [(VCPEspressoModel *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end