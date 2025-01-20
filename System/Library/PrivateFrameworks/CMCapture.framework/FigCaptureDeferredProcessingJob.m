@interface FigCaptureDeferredProcessingJob
+ (BOOL)isPotentiallyRecoverableError:(int)a3;
- (BOOL)isInteractiveQoS;
- (FigCaptureDeferredPhotoProcessorRequest)processorRequest;
- (FigCaptureDeferredProcessingJob)initWithProcessorRequest:(id)a3 delegate:(id)a4 error:(int *)a5;
- (NSString)masterPortType;
- (id)container;
- (int)numberOfPhotosDelivered;
- (int64_t)durationNS;
- (int64_t)prepareGraphNS;
- (int64_t)startNS;
- (void)completedWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)failedWithError:(int)a3;
- (void)setDurationNS:(int64_t)a3;
- (void)setInteractiveQoS:(BOOL)a3;
- (void)setNumberOfPhotosDelivered:(int)a3;
- (void)setPrepareGraphNS:(int64_t)a3;
- (void)setStartNS:(int64_t)a3;
- (void)start;
@end

@implementation FigCaptureDeferredProcessingJob

- (id)container
{
  return self->_container;
}

- (FigCaptureDeferredProcessingJob)initWithProcessorRequest:(id)a3 delegate:(id)a4 error:(int *)a5
{
  int v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureDeferredProcessingJob;
  v8 = [(FigCaptureDeferredProcessingJob *)&v12 init];
  if (v8)
  {
    v8->_weakDelegateReference = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:a4];
    v8->_processorRequest = (FigCaptureDeferredPhotoProcessorRequest *)a3;
    v9 = -[BWDeferredProcessingContainerManager createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:](+[BWDeferredProcessingContainerManager sharedInstance](BWDeferredProcessingContainerManager, "sharedInstance"), "createProcessingContainerWithApplicationID:captureRequestIdentifier:openForPeeking:err:", [a3 applicationID], objc_msgSend(a3, "captureRequestIdentifier"), 0, &v13);
    v8->_container = v9;
    if (!v13)
    {
      if (-[BWPhotoManifest descriptorForIdentifier:](-[BWDeferredProcessingContainer photoManifest](v9, "photoManifest"), "descriptorForIdentifier:", [a3 photoIdentifier]))
      {
        v8->_masterPortType = [(BWStillImageCaptureSettings *)[(BWDeferredContainer *)v8->_container captureSettings] masterPortType];
      }
      else
      {
        int v13 = -16136;
      }
    }
  }
  int v10 = v13;
  if (a5) {
    *a5 = v13;
  }
  if (v10)
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  [+[BWDeferredProcessingContainerManager sharedInstance] releaseProcessingContainer:self->_container];

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredProcessingJob;
  [(FigCaptureDeferredProcessingJob *)&v3 dealloc];
}

- (void)start
{
  self->_startNS = FigGetUpTimeNanoseconds();
}

- (void)completedWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_durationNS = FigGetUpTimeNanoseconds() - self->_startNS;
  id v5 = [(FigWeakReference *)self->_weakDelegateReference referencedObject];
  [v5 job:self completedWithSampleBuffer:a3];
}

+ (BOOL)isPotentiallyRecoverableError:(int)a3
{
  BOOL result = 0;
  BOOL v4 = (a3 + 16829) > 9 || ((1 << (a3 - 67)) & 0x2EF) == 0;
  if (v4 && ((a3 + 16140) > 0xA || ((1 << (a3 + 12)) & 0x751) == 0)) {
    return 1;
  }
  return result;
}

- (void)failedWithError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[BWDeferredProcessingContainer maxProcessingCount](BWDeferredProcessingContainer, "maxProcessingCount")&& (unsigned int v5 = [(BWDeferredProcessingContainer *)self->_container processingCount], v5 == +[BWDeferredProcessingContainer maxProcessingCount]))
  {
    if (dword_1EB4C4F30)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v3 = 4294951156;
  }
  else if (+[FigCaptureDeferredProcessingJob isPotentiallyRecoverableError:v3])
  {
    if (dword_1EB4C4F30)
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v3 = 4294950471;
  }
  self->_durationNS = FigGetUpTimeNanoseconds() - self->_startNS;
  objc_msgSend(-[FigWeakReference referencedObject](self->_weakDelegateReference, "referencedObject"), "job:failedWithError:", self, v3);
}

- (int64_t)durationNS
{
  return self->_durationNS;
}

- (void)setDurationNS:(int64_t)a3
{
  self->_durationNS = a3;
}

- (NSString)masterPortType
{
  return self->_masterPortType;
}

- (BOOL)isInteractiveQoS
{
  return self->_interactiveQoS;
}

- (void)setInteractiveQoS:(BOOL)a3
{
  self->_interactiveQoS = a3;
}

- (int)numberOfPhotosDelivered
{
  return self->_numberOfPhotosDelivered;
}

- (void)setNumberOfPhotosDelivered:(int)a3
{
  self->_numberOfPhotosDelivered = a3;
}

- (FigCaptureDeferredPhotoProcessorRequest)processorRequest
{
  return self->_processorRequest;
}

- (int64_t)startNS
{
  return self->_startNS;
}

- (void)setStartNS:(int64_t)a3
{
  self->_startNS = a3;
}

- (int64_t)prepareGraphNS
{
  return self->_prepareGraphNS;
}

- (void)setPrepareGraphNS:(int64_t)a3
{
  self->_prepareGraphNS = a3;
}

@end