@interface VCCaptionsReceiver
- (VCCaptionsReceiver)initWithDelegate:(id)a3;
- (VCCaptionsReceiverDelegate)delegate;
- (VCCaptionsTranscription)currentTranscription;
- (void)dealloc;
- (void)setCurrentTranscription:(id)a3;
@end

@implementation VCCaptionsReceiver

- (VCCaptionsReceiver)initWithDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCCaptionsReceiver;
  v4 = [(VCCaptionsReceiver *)&v7 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak(&v4->_delegate, a3);
    VCCaptionsDecoder_Create(&v5->_captionsDecoder);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VCCaptionsDecoder_Destroy((uint64_t *)&self->_captionsDecoder);
  [(VCCaptionsReceiver *)self setCurrentTranscription:0];
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsReceiver;
  [(VCCaptionsReceiver *)&v3 dealloc];
}

- (VCCaptionsReceiverDelegate)delegate
{
  return (VCCaptionsReceiverDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCCaptionsTranscription)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
}

@end