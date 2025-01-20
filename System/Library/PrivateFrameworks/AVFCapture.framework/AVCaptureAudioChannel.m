@interface AVCaptureAudioChannel
+ (void)initialize;
- (AVCaptureAudioChannel)initWithConnection:(id)a3;
- (BOOL)isEnabled;
- (float)averagePowerLevel;
- (float)peakHoldLevel;
- (float)volume;
- (void)dealloc;
- (void)invalidate;
- (void)setEnabled:(BOOL)enabled;
- (void)setVolume:(float)volume;
@end

@implementation AVCaptureAudioChannel

- (void)invalidate
{
  self->_internal->connection = 0;
}

- (AVCaptureAudioChannel)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureAudioChannel;
  v4 = [(AVCaptureAudioChannel *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureAudioChannelInternal);
    v4->_internal = v5;
    if (v5)
    {
      v5->connection = (AVCaptureConnection *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioChannel;
  [(AVCaptureAudioChannel *)&v3 dealloc];
}

+ (void)initialize
{
}

- (float)averagePowerLevel
{
  [(AVCaptureConnection *)self->_internal->connection getAvgAudioLevelForChannel:self];
  return result;
}

- (float)peakHoldLevel
{
  [(AVCaptureConnection *)self->_internal->connection getPeakAudioLevelForChannel:self];
  return result;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)volume
{
  self->_volume = volume;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

@end