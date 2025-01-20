@interface EspressoModel
- (BOOL)buildModelWithConfiguration:(const char *)a3;
- (BOOL)initContextWithFile:(id)a3 engine:(int)a4 configuration:(const char *)a5 usePreCompiled:(BOOL)a6;
- (BOOL)switchUsage:(int64_t)a3;
- (EspressoModel)initWithModelName:(id)a3 configuration:(const char *)a4;
- (EspressoModel)initWithModelName:(id)a3 usage:(int64_t)a4;
- (id)initMPSWithModelName:(id)a3 usage:(int64_t)a4;
- (int)loadModel:(id)a3 from:(id)a4;
- (int64_t)usage;
- (void)dealloc;
- (void)freeContext;
- (void)setUsage:(int64_t)a3;
@end

@implementation EspressoModel

- (EspressoModel)initWithModelName:(id)a3 usage:(int64_t)a4
{
  v4 = self;
  if (a4 == -1)
  {
    v5 = 0;
  }
  else
  {
    self->_usage = a4;
    v4 = [(EspressoModel *)self initWithModelName:a3 configuration:getConfigurationName(a4)];
    v5 = v4;
  }

  return v5;
}

- (EspressoModel)initWithModelName:(id)a3 configuration:(const char *)a4
{
  v6 = [a3 stringByAppendingFormat:@".espresso.net"];
  v11.receiver = self;
  v11.super_class = (Class)EspressoModel;
  v7 = [(EspressoModel *)&v11 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  if (![(EspressoModel *)v7 initContextWithFile:v6 engine:10007 configuration:a4 usePreCompiled:1])
  {
    [(EspressoModel *)v8 freeContext];
    NSLog(&cfstr_UsingAneRuntim.isa);
    if (![(EspressoModel *)v8 initContextWithFile:v6 engine:10007 configuration:a4 usePreCompiled:0])
    {
      NSLog(&cfstr_EpsressomodelC.isa, v6, a4);
LABEL_6:
      v9 = 0;
      goto LABEL_7;
    }
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)initMPSWithModelName:(id)a3 usage:(int64_t)a4
{
  self->_usage = a4;
  v6 = [a3 stringByAppendingFormat:@".espresso.net"];
  v10.receiver = self;
  v10.super_class = (Class)EspressoModel;
  v7 = [(EspressoModel *)&v10 init];
  if (v7
    && [(EspressoModel *)v7 initContextWithFile:v6 engine:5 configuration:getConfigurationName(a4) usePreCompiled:0])
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)initContextWithFile:(id)a3 engine:(int)a4 configuration:(const char *)a5 usePreCompiled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  objc_super v11 = (OS_dispatch_queue *)dispatch_queue_create("callback queue", 0);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = v11;

  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    NSLog(&cfstr_EpsressomodelE.isa);
LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    NSLog(&cfstr_EspressomodelE.isa);
    goto LABEL_12;
  }
  if (v6) {
    v15 = @"Networks";
  }
  else {
    v15 = @"NetworksOrig";
  }
  if ([(EspressoModel *)self loadModel:v10 from:v15]) {
    goto LABEL_12;
  }
  if (![(EspressoModel *)self buildModelWithConfiguration:a5])
  {
    NSLog(&cfstr_EspressomodelB.isa, v10, a5);
    goto LABEL_12;
  }
  self->_engine = a4;
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void)freeContext
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_context) {
    espresso_context_destroy();
  }
  self->_context = 0;
  self->_plan = 0;
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;
}

- (BOOL)buildModelWithConfiguration:(const char *)a3
{
  if (a3 && espresso_network_select_configuration())
  {
    NSLog(&cfstr_ErrorInvalidCo.isa);
    return 0;
  }
  if (espresso_plan_build())
  {
    NSLog(&cfstr_PlanBuildFaile.isa);
    return 0;
  }
  return 1;
}

- (int)loadModel:(id)a3 from:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 pathForResource:v7 ofType:0 inDirectory:v6];

  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v10, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding"));
    int v11 = espresso_plan_add_network();
  }
  else
  {
    int v11 = -1;
  }

  return v11;
}

- (void)dealloc
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_context) {
    espresso_context_destroy();
  }
  self->_context = 0;
  self->_plan = 0;
  v3.receiver = self;
  v3.super_class = (Class)EspressoModel;
  [(EspressoModel *)&v3 dealloc];
}

- (BOOL)switchUsage:(int64_t)a3
{
  if (a3 == -1) {
    return 0;
  }
  if (self->_usage == a3) {
    return 1;
  }
  if (espresso_plan_build_clean())
  {
    NSLog(&cfstr_FailedToCleanP.isa);
    return 0;
  }
  self->_usage = a3;
  ConfigurationName = getConfigurationName(a3);
  return [(EspressoModel *)self buildModelWithConfiguration:ConfigurationName];
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
}

@end