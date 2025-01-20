@interface VCPCNNEspressoContext
+ (BOOL)supportGPU;
+ (void)createContextPreferred;
+ (void)createContextWithForceCPU;
+ (void)createContextWithMPSGraph;
+ (void)sharedContextPreferred:(BOOL)a3;
+ (void)sharedContextWithForceCPU:(BOOL)a3;
+ (void)sharedContextWithMPSGraph:(BOOL)a3;
- (VCPCNNEspressoContext)initWithForceCPU:(BOOL)a3 forceNNGraph:(BOOL)a4 shared:(BOOL)a5;
- (void)dealloc;
- (void)espressoContext;
@end

@implementation VCPCNNEspressoContext

+ (BOOL)supportGPU
{
  return SocType() - 247 < 0xA;
}

+ (void)createContextWithForceCPU
{
  context = (void *)espresso_create_context();
  int v3 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v3 >= 7)
    {
      v4 = VCPLogInstance();
      os_log_type_t v5 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = 0;
        v6 = "[VCPCNNEspressoContext] created CPU context";
        v7 = (uint8_t *)&v10;
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v4, v5, v6, v7, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v3 >= 3)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = 0;
      v6 = "[VCPCNNEspressoContext] Failed to CPU context";
      v7 = (uint8_t *)&v9;
      goto LABEL_8;
    }
LABEL_9:
  }
  return context;
}

+ (void)createContextWithMPSGraph
{
  context = (void *)espresso_create_context();
  int v4 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v4 >= 7)
    {
      os_log_type_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] created MPSGraph context", buf, 2u);
      }
    }
  }
  else
  {
    if (v4 >= 4)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create MPSGraph context, fall back to CPU context", v8, 2u);
      }
    }
    return (void *)[a1 createContextWithForceCPU];
  }
  return context;
}

+ (void)createContextPreferred
{
  context = (void *)espresso_create_context();
  int v4 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v4 >= 7)
    {
      os_log_type_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] created preferred context", buf, 2u);
      }
    }
  }
  else
  {
    if (v4 >= 5)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v10 = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create ANE context, fall back to MPS context", v10, 2u);
      }
    }
    context = (void *)espresso_create_context();
    if (!context)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v9 = 0;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create MPS context, fall back to CPU context", v9, 2u);
        }
      }
      return (void *)[a1 createContextWithForceCPU];
    }
  }
  return context;
}

+ (void)sharedContextWithForceCPU:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCPCNNEspressoContext_sharedContextWithForceCPU___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextWithForceCPU:]::onceToken != -1) {
      dispatch_once(&+[VCPCNNEspressoContext sharedContextWithForceCPU:]::onceToken, block);
    }
  }
  return (void *)+[VCPCNNEspressoContext sharedContextWithForceCPU:]::espressoContext;
}

void __51__VCPCNNEspressoContext_sharedContextWithForceCPU___block_invoke(uint64_t a1)
{
  +[VCPCNNEspressoContext sharedContextWithForceCPU:]::espressoContext = [*(id *)(a1 + 32) createContextWithForceCPU];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v1 = VCPLogInstance();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing CPU context", v2, 2u);
    }
  }
}

+ (void)sharedContextWithMPSGraph:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCPCNNEspressoContext_sharedContextWithMPSGraph___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::onceToken != -1) {
      dispatch_once(&+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::onceToken, block);
    }
  }
  return (void *)+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::espressoContext;
}

void __51__VCPCNNEspressoContext_sharedContextWithMPSGraph___block_invoke(uint64_t a1)
{
  +[VCPCNNEspressoContext sharedContextWithMPSGraph:]::espressoContext = [*(id *)(a1 + 32) createContextWithMPSGraph];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v1 = VCPLogInstance();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing MPSGraph context", v2, 2u);
    }
  }
}

+ (void)sharedContextPreferred:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCPCNNEspressoContext_sharedContextPreferred___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextPreferred:]::onceToken != -1) {
      dispatch_once(&+[VCPCNNEspressoContext sharedContextPreferred:]::onceToken, block);
    }
  }
  return (void *)+[VCPCNNEspressoContext sharedContextPreferred:]::espressoContext;
}

void __48__VCPCNNEspressoContext_sharedContextPreferred___block_invoke(uint64_t a1)
{
  +[VCPCNNEspressoContext sharedContextPreferred:]::espressoContext = [*(id *)(a1 + 32) createContextPreferred];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v1 = VCPLogInstance();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1BBEDA000, v1, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing preferred context", v2, 2u);
    }
  }
}

- (VCPCNNEspressoContext)initWithForceCPU:(BOOL)a3 forceNNGraph:(BOOL)a4 shared:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPCNNEspressoContext;
  v8 = [(VCPCNNEspressoContext *)&v13 init];
  if (v8)
  {
    if (v5)
    {
      if (v7)
      {
        uint64_t v9 = [(id)objc_opt_class() sharedContextWithForceCPU:1];
      }
      else if (v6)
      {
        uint64_t v9 = [(id)objc_opt_class() sharedContextWithMPSGraph:1];
      }
      else
      {
        uint64_t v9 = [(id)objc_opt_class() sharedContextPreferred:1];
      }
    }
    else if (v7)
    {
      uint64_t v9 = [(id)objc_opt_class() createContextWithForceCPU];
    }
    else if (v6)
    {
      uint64_t v9 = [(id)objc_opt_class() createContextWithMPSGraph];
    }
    else
    {
      uint64_t v9 = [(id)objc_opt_class() createContextPreferred];
    }
    v8->_espressoContext = (void *)v9;
  }
  else
  {
    uint64_t v9 = MEMORY[8];
  }
  if (v9) {
    __int16 v10 = v8;
  }
  else {
    __int16 v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void)dealloc
{
  espressoContext = self->_espressoContext;
  if (!espressoContext)
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_18;
    }
    BOOL v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "[VCPCNNEspressoContext] No valid context; skip dealloc";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (espressoContext == (void *)[(id)objc_opt_class() sharedContextWithForceCPU:0]
    || (int v4 = self->_espressoContext, v4 == (void *)[(id)objc_opt_class() sharedContextWithMPSGraph:0])
    || (BOOL v5 = self->_espressoContext, v5 == (void *)[(id)objc_opt_class() sharedContextPreferred:0]))
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_18;
    }
    BOOL v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "[VCPCNNEspressoContext] dealloc shared context; keep alive";
LABEL_16:
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, v8, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    BOOL v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] dealloc context;", buf, 2u);
    }
  }
  espresso_context_destroy();
LABEL_18:
  v9.receiver = self;
  v9.super_class = (Class)VCPCNNEspressoContext;
  [(VCPCNNEspressoContext *)&v9 dealloc];
}

- (void)espressoContext
{
  return self->_espressoContext;
}

@end