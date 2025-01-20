@interface VCStreamInputAudio
- (VCStreamInputAudio)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7;
- (void)dealloc;
- (void)registerSampleBufferCallback:(void *)a3 context:(void *)a4;
@end

@implementation VCStreamInputAudio

- (VCStreamInputAudio)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCStreamInputAudio;
  result = [(VCStreamInput *)&v8 initWithStreamInputID:a3 format:a4 delegate:a5 delegateQueue:a6 remoteQueue:a7];
  if (result)
  {
    result->super._receiverQueue = 0;
    result->_sampleBufferDelegateCallback = 0;
    LODWORD(result->_sampleBufferDelegateCallbackContext) = 0;
    result->super._sampleBufferHandler = _VCStreamInputAudio_SampleBufferHandler;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  p_sampleBufferDelegateCallbackContext = &self->_sampleBufferDelegateCallbackContext;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sampleBufferDelegateCallbackContext);
  self->super._receiverQueue = 0;
  self->_sampleBufferDelegateCallback = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)p_sampleBufferDelegateCallbackContext);
  v4.receiver = self;
  v4.super_class = (Class)VCStreamInputAudio;
  [(VCStreamInput *)&v4 dealloc];
}

- (void)registerSampleBufferCallback:(void *)a3 context:(void *)a4
{
  p_sampleBufferDelegateCallbackContext = &self->_sampleBufferDelegateCallbackContext;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sampleBufferDelegateCallbackContext);
  self->super._receiverQueue = (opaqueVCRemoteImageQueue *)a3;
  self->_sampleBufferDelegateCallback = a4;

  os_unfair_lock_unlock((os_unfair_lock_t)p_sampleBufferDelegateCallbackContext);
}

@end