@interface VCVideoStreamSendGroupConfig
- (VCSessionUplinkVideoStreamController)uplinkVideoStreamController;
- (int)captureSource;
- (void)dealloc;
- (void)setCaptureSource:(int)a3;
- (void)setUplinkVideoStreamController:(id)a3;
@end

@implementation VCVideoStreamSendGroupConfig

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamSendGroupConfig;
  [(VCMediaStreamSendGroupConfig *)&v3 dealloc];
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (VCSessionUplinkVideoStreamController)uplinkVideoStreamController
{
  return self->_uplinkVideoStreamController;
}

- (void)setUplinkVideoStreamController:(id)a3
{
}

@end