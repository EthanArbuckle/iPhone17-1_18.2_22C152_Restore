@interface BWTiledEspressoInferenceConfiguration
- (BOOL)forceSynchronousInference;
- (BWTiledEspressoInferenceConfiguration)initWithInferenceType:(int)a3 metalCommandQueue:(id)a4;
- (MTLCommandQueue)metalCommandQueue;
- (void)dealloc;
- (void)setForceSynchronousInference:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
@end

@implementation BWTiledEspressoInferenceConfiguration

- (void)setMetalCommandQueue:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (BWTiledEspressoInferenceConfiguration)initWithInferenceType:(int)a3 metalCommandQueue:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWTiledEspressoInferenceConfiguration;
  v5 = [(BWInferenceConfiguration *)&v7 initWithInferenceType:*(void *)&a3];
  if (v5) {
    v5->_metalCommandQueue = (MTLCommandQueue *)a4;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

- (BOOL)forceSynchronousInference
{
  return self->_forceSynchronousInference;
}

- (void)setForceSynchronousInference:(BOOL)a3
{
  self->_forceSynchronousInference = a3;
}

@end