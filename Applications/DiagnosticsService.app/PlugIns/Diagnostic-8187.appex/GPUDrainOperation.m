@interface GPUDrainOperation
- (GPUDrainOperation)initWithIterationDelay:(id)a3;
- (NSNumber)iterationDelay;
- (Renderer)renderer;
- (void)cancel;
- (void)main;
- (void)setIterationDelay:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation GPUDrainOperation

- (GPUDrainOperation)initWithIterationDelay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GPUDrainOperation;
  v6 = [(GPUDrainOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iterationDelay, a3);
  }

  return v7;
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)GPUDrainOperation;
  [(DrainOperation *)&v2 cancel];
}

- (void)main
{
  v3 = -[Renderer initWithSize:]([Renderer alloc], "initWithSize:", 1365.0, 720.0);
  renderer = self->_renderer;
  self->_renderer = v3;

  id v5 = self->_renderer;
  if (v5 && [(Renderer *)v5 hasRenderDevice])
  {
    v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting metal rendering", v8, 2u);
    }

    while (1)
    {
      [(Renderer *)self->_renderer render];
      if ([(NSNumber *)self->_iterationDelay unsignedIntValue]) {
        usleep(1000 * [(NSNumber *)self->_iterationDelay unsignedIntValue]);
      }
      if ([(DrainOperation *)self isFinished]) {
        break;
      }
      [(DrainOperation *)self waitIfPaused];
    }
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000D0BC(v7);
    }
  }
}

- (NSNumber)iterationDelay
{
  return self->_iterationDelay;
}

- (void)setIterationDelay:(id)a3
{
}

- (Renderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_iterationDelay, 0);
}

@end