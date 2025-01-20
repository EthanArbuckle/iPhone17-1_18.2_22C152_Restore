@interface ADEspressoRunner
- (ADEspressoRunner)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5;
- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3;
- (id)networkVersionString;
- (id)registerDescriptor:(id)a3;
- (int64_t)execute;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4;
- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4;
- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6;
@end

@implementation ADEspressoRunner

- (id)registerDescriptor:(id)a3
{
  v3 = [(ADEspressoRunnerProtocol *)self->_espressoRunner registerDescriptor:a3];

  return v3;
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  return (__CVBuffer *)[(ADEspressoRunnerProtocol *)self->_espressoRunner createAndRegisterPixelBufferForDescriptor:a3];
}

- (void).cxx_destruct
{
}

- (id)networkVersionString
{
  return (id)[(ADEspressoRunnerProtocol *)self->_espressoRunner networkVersionString];
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  return [(ADEspressoRunnerProtocol *)self->_espressoRunner updateFeedbackLoopInputBuffer:a3 inputDescriptor:a4 outputBuffer:a5 outputDescriptor:a6];
}

- (int64_t)execute
{
  return [(ADEspressoRunnerProtocol *)self->_espressoRunner execute];
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  return [(ADEspressoRunnerProtocol *)self->_espressoRunner registerPixelBuffer:a3 forDescriptor:a4];
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  return [(ADEspressoRunnerProtocol *)self->_espressoRunner registerIOSurface:a3 forDescriptor:a4];
}

- (ADEspressoRunner)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoRunner;
  v10 = [(ADEspressoRunner *)&v19 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_10;
  }
  espressoRunner = v10->_espressoRunner;
  v10->_espressoRunner = 0;

  if ([v8 hasSuffix:@".espresso.net"])
  {
    v13 = [[ADEspressoRunnerV1 alloc] initWithPath:v8 forEngine:a4 configurationName:v9];
    v14 = v11->_espressoRunner;
    v11->_espressoRunner = (ADEspressoRunnerProtocol *)v13;
  }
  else if ([v8 hasSuffix:@".bundle"])
  {
    v15 = [[ADEspressoRunnerV2 alloc] initWithPath:v8 forEngine:a4 configurationName:v9];
    v16 = v11->_espressoRunner;
    v11->_espressoRunner = (ADEspressoRunnerProtocol *)v15;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to initialize ADEspressoRunner. Model path extension is not .espresso.net/.bundle (%@)", buf, 0xCu);
  }
  if (v11->_espressoRunner) {
    v17 = v11;
  }
  else {
LABEL_10:
  }
    v17 = 0;

  return v17;
}

@end