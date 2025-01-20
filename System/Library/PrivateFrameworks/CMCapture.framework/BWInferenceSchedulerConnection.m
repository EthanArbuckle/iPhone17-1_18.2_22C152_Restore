@interface BWInferenceSchedulerConnection
- (BWInferenceSchedulerConnection)init;
- (BWInferenceSchedulerConnection)initWithInferenceTargetQueue:(id)a3 scalingTargetQueue:(id)a4 submissionTargetQueue:(id)a5 completionTargetQueue:(id)a6;
- (BWInferenceSchedulerFramebuffer)framebuffer;
- (BWInferenceSchedulerResourceCoordinator)coordinator;
- (OS_dispatch_group)coordinationGroup;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)inferenceQueue;
- (OS_dispatch_queue)scalingQueue;
- (OS_dispatch_queue)submissionQueue;
- (unint64_t)identifier;
- (void)dealloc;
- (void)setFramebuffer:(id)a3;
@end

@implementation BWInferenceSchedulerConnection

- (BWInferenceSchedulerConnection)initWithInferenceTargetQueue:(id)a3 scalingTargetQueue:(id)a4 submissionTargetQueue:(id)a5 completionTargetQueue:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)BWInferenceSchedulerConnection;
  v10 = [(BWInferenceSchedulerConnection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_identifier = atomic_fetch_add(&nextIdentifier, 1uLL);
    v10->_coordinator = objc_alloc_init(BWInferenceSchedulerResourceCoordinator);
    v11->_inferenceQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.inference", 0, (dispatch_queue_t)a3);
    v11->_scalingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.scaling", 0, (dispatch_queue_t)a4);
    v11->_submissionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.submission", 0, (dispatch_queue_t)a5);
    v11->_completionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.submission", 0, (dispatch_queue_t)a6);
    v11->_coordinationGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v11;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (OS_dispatch_group)coordinationGroup
{
  return self->_coordinationGroup;
}

- (BWInferenceSchedulerFramebuffer)framebuffer
{
  return self->_framebuffer;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setFramebuffer:(id)a3
{
}

- (BWInferenceSchedulerResourceCoordinator)coordinator
{
  return self->_coordinator;
}

- (BWInferenceSchedulerConnection)init
{
  return [(BWInferenceSchedulerConnection *)self initWithInferenceTargetQueue:0 scalingTargetQueue:0 submissionTargetQueue:0 completionTargetQueue:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerConnection;
  [(BWInferenceSchedulerConnection *)&v3 dealloc];
}

- (OS_dispatch_queue)inferenceQueue
{
  return self->_inferenceQueue;
}

- (OS_dispatch_queue)scalingQueue
{
  return self->_scalingQueue;
}

- (OS_dispatch_queue)submissionQueue
{
  return self->_submissionQueue;
}

@end