@interface GCVirtualController
+ (GCVirtualController)virtualControllerWithConfiguration:(GCVirtualControllerConfiguration *)configuration;
- (GCController)controller;
- (GCVirtualController)initWithConfiguration:(GCVirtualControllerConfiguration *)configuration;
- (void)connectWithReplyHandler:(void *)reply;
- (void)disconnect;
- (void)setPosition:(CGPoint)position forDirectionPadElement:(NSString *)element;
- (void)setValue:(CGFloat)value forButtonElement:(NSString *)element;
- (void)updateConfigurationForElement:(NSString *)element configuration:(void *)config;
@end

@implementation GCVirtualController

+ (GCVirtualController)virtualControllerWithConfiguration:(GCVirtualControllerConfiguration *)configuration
{
  v3 = configuration;
  v4 = [[GCVirtualController alloc] initWithConfiguration:v3];

  return v4;
}

- (GCVirtualController)initWithConfiguration:(GCVirtualControllerConfiguration *)configuration
{
  v4 = configuration;
  v15.receiver = self;
  v15.super_class = (Class)GCVirtualController;
  v5 = [(GCVirtualController *)&v15 init];
  v6 = VirtualControllerBundle();
  v7 = v6;
  if (!v6)
  {
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSLocalizedFailureReasonErrorKey;
    v19[0] = @"Virtual game controller initialization failed.";
    v19[1] = @"Failed to load the VirtualGameController helper bundle.";
    v18[2] = NSLocalizedRecoverySuggestionErrorKey;
    v19[2] = @"Check the system log for more information.";
    impl = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    uint64_t v12 = 1;
LABEL_7:
    uint64_t v13 = +[NSError gc_VirtualControllerError:userInfo:]((uint64_t)&off_26D2BBDF8, v12, impl);
    error = v5->_error;
    v5->_error = (NSError *)v13;

    goto LABEL_4;
  }
  v8 = (objc_class *)[v6 classNamed:@"_GCVirtualControllerImpl"];
  if (!v8)
  {
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSLocalizedFailureReasonErrorKey;
    v17[0] = @"Virtual game controller initialization failed.";
    v17[1] = @"Failed to load implementation from the VirtualGameController helper bundle.";
    impl = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v12 = 2;
    goto LABEL_7;
  }
  uint64_t v9 = [[v8 alloc] initWithConfiguration:v4];
  impl = v5->_impl;
  v5->_impl = (_GCVirtualControllerImpl *)v9;
LABEL_4:

  return v5;
}

- (void)connectWithReplyHandler:(void *)reply
{
  v4 = reply;
  if (self->_error)
  {
    if (v4) {
      v4 = (uint64_t (**)(void))v4[2](v4);
    }
  }
  else
  {
    v4 = (uint64_t (**)(void))[(_GCVirtualControllerImpl *)self->_impl connectWithReplyHandler:v4];
  }

  MEMORY[0x270F9A790](v4);
}

- (void)disconnect
{
}

- (GCController)controller
{
  return (GCController *)[(_GCVirtualControllerImpl *)self->_impl controller];
}

- (void)updateConfigurationForElement:(NSString *)element configuration:(void *)config
{
}

- (void)setValue:(CGFloat)value forButtonElement:(NSString *)element
{
}

- (void)setPosition:(CGPoint)position forDirectionPadElement:(NSString *)element
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_impl, 0);
}

@end