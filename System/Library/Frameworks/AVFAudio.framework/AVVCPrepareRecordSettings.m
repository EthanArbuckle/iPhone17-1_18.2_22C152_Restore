@interface AVVCPrepareRecordSettings
- (AVVCPrepareRecordSettings)initWithStreamID:(unint64_t)a3 settings:(id)a4 bufferDuration:(double)a5;
- (BOOL)meteringEnabled;
- (NSDictionary)avAudioSettings;
- (double)recordBufferDuration;
- (unint64_t)streamID;
- (unsigned)deviceBufferFrameSize;
- (void)setAvAudioSettings:(id)a3;
- (void)setDeviceBufferFrameSize:(unsigned int)a3;
- (void)setMeteringEnabled:(BOOL)a3;
- (void)setRecordBufferDuration:(double)a3;
- (void)setStreamID:(unint64_t)a3;
@end

@implementation AVVCPrepareRecordSettings

- (void).cxx_destruct
{
}

- (void)setDeviceBufferFrameSize:(unsigned int)a3
{
  self->_deviceBufferFrameSize = a3;
}

- (unsigned)deviceBufferFrameSize
{
  return self->_deviceBufferFrameSize;
}

- (void)setMeteringEnabled:(BOOL)a3
{
  self->_meteringEnabled = a3;
}

- (BOOL)meteringEnabled
{
  return self->_meteringEnabled;
}

- (void)setRecordBufferDuration:(double)a3
{
  self->_recordBufferDuration = a3;
}

- (double)recordBufferDuration
{
  return self->_recordBufferDuration;
}

- (void)setAvAudioSettings:(id)a3
{
}

- (NSDictionary)avAudioSettings
{
  return self->_avAudioSettings;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (AVVCPrepareRecordSettings)initWithStreamID:(unint64_t)a3 settings:(id)a4 bufferDuration:(double)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVVCPrepareRecordSettings;
  v9 = [(AVVCPrepareRecordSettings *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_streamID = a3;
    uint64_t v11 = [v8 copy];
    avAudioSettings = v10->_avAudioSettings;
    v10->_avAudioSettings = (NSDictionary *)v11;

    v10->_recordBufferDuration = a5;
    v10->_deviceBufferFrameSize = 0;
  }

  return v10;
}

@end