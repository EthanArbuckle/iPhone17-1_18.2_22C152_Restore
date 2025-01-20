@interface BWEspressoInferenceContext
+ (void)initialize;
- (BOOL)isPrepared;
- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3;
- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3 shareIntermediateBuffer:(BOOL)a4;
- (id)description;
- (int)configureIntermediateBufferSharingForPlanPostbuild:(void *)a3;
- (int)configureIntermediateBufferSharingForPlanPrebuild:(void *)a3;
- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3;
- (int)executionTarget;
- (int)prepareForInference;
- (void)dealloc;
- (void)espressoContext;
@end

@implementation BWEspressoInferenceContext

- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3 shareIntermediateBuffer:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWEspressoInferenceContext;
  result = [(BWEspressoInferenceContext *)&v7 init];
  if (result)
  {
    result->_executionTarget = a3;
    result->_shareIntermediateBuffer = a4;
  }
  return result;
}

- (BWEspressoInferenceContext)initWithExecutionTarget:(int)a3
{
  return [(BWEspressoInferenceContext *)self initWithExecutionTarget:*(void *)&a3 shareIntermediateBuffer:0];
}

- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3
{
  if (!self->_shareIntermediateBuffer || self->_executionTarget != 3) {
    return 0;
  }
  sharedBufferNetworksPath = self->_sharedBufferNetworksPath;
  if (!sharedBufferNetworksPath)
  {
LABEL_6:
    if (a3)
    {
      if (!self->_rootIntermediateBufferPlan
        || ([a3 UTF8String], !espresso_will_share_intermediate_buffer_with_existing_plan()))
      {
        v6 = (NSString *)a3;
        int result = 0;
        self->_sharedBufferNetworksPath = v6;
        return result;
      }
      goto LABEL_11;
    }
    return 0;
  }
  [(NSString *)sharedBufferNetworksPath UTF8String];
  if (!espresso_will_share_intermediate_buffer_with_existing_plan())
  {

    self->_sharedBufferNetworksPath = 0;
    goto LABEL_6;
  }
LABEL_11:
  fig_log_get_emitter();
  FigDebugAssert3();
  return -31702;
}

- (int)prepareForInference
{
  if ([(BWEspressoInferenceContext *)self isPrepared]) {
    return 0;
  }
  unsigned int executionTarget = self->_executionTarget;
  if (executionTarget < 2 || executionTarget == 3)
  {
    context = (void *)espresso_create_context();
    self->_espressoContext = context;
  }
  else
  {
    context = self->_espressoContext;
  }
  if (context) {
    return 0;
  }
  else {
    return -31702;
  }
}

- (BOOL)isPrepared
{
  return self->_espressoContext != 0;
}

- (void)espressoContext
{
  return self->_espressoContext;
}

+ (void)initialize
{
}

- (void)dealloc
{
  if (self->_espressoContext) {
    espresso_context_destroy();
  }

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceContext;
  [(BWEspressoInferenceContext *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> executionTarget %lu prepared %d", objc_opt_class(), self, self->_executionTarget, -[BWEspressoInferenceContext isPrepared](self, "isPrepared")];
}

- (int)configureIntermediateBufferSharingForPlanPrebuild:(void *)a3
{
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  if (!self->_shareIntermediateBuffer || self->_executionTarget != 3 || !self->_rootIntermediateBufferPlan) {
    return 0;
  }
  int result = espresso_plan_share_intermediate_buffer();
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
  return result;
}

- (int)configureIntermediateBufferSharingForPlanPostbuild:(void *)a3
{
  if (self->_shareIntermediateBuffer && self->_executionTarget == 3 && !self->_rootIntermediateBufferPlan)
  {
    self->_rootIntermediateBufferPlan = a3;
    sharedBufferNetworksPath = self->_sharedBufferNetworksPath;
    if (sharedBufferNetworksPath)
    {
      [(NSString *)sharedBufferNetworksPath UTF8String];
      LODWORD(sharedBufferNetworksPath) = espresso_will_share_intermediate_buffer_with_existing_plan();
      if (sharedBufferNetworksPath)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        LODWORD(sharedBufferNetworksPath) = -31702;
      }
    }
  }
  else
  {
    LODWORD(sharedBufferNetworksPath) = 0;
  }
  return (int)sharedBufferNetworksPath;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

@end