@interface BWMetalInferenceContext
- (BWMetalInferenceContext)initWithScheduler:(id)a3 priority:(unsigned int)a4;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (void)dealloc;
@end

@implementation BWMetalInferenceContext

- (MTLDevice)device
{
  return self->_device;
}

- (BWMetalInferenceContext)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BWMetalInferenceContext;
  v6 = [(BWMetalInferenceContext *)&v11 init];
  if (v6)
  {
    v7 = (MTLDevice *)(id)[MEMORY[0x1E4F55F60] metalDevice];
    v6->_device = v7;
    v8 = (MTLCommandQueue *)[(MTLDevice *)v7 newCommandQueue];
    v6->_commandQueue = v8;
    v6->_commandQueueSPI = v8;
    if (a3)
    {
      -[MTLCommandQueue setSubmissionQueue:](v8, "setSubmissionQueue:", [a3 metalSubmissionQueue]);
      -[MTLCommandQueueSPI setCompletionQueue:](v6->_commandQueueSPI, "setCompletionQueue:", [a3 metalCompletionQueue]);
    }
    if (a4 - 13 >= 2 && a4)
    {
      if (a4 == 39) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 4;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    [(MTLCommandQueueSPI *)v6->_commandQueueSPI setGPUPriority:v9];
  }
  return v6;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetalInferenceContext;
  [(BWMetalInferenceContext *)&v3 dealloc];
}

@end