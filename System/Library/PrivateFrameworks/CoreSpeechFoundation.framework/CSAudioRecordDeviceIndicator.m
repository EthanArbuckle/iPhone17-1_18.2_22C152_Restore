@interface CSAudioRecordDeviceIndicator
- (BOOL)shouldUseRemoteRecorder;
- (CSAudioRecordContext)recordContext;
- (CSAudioRecordDeviceIndicator)initWithRecordContext:(id)a3 deviceId:(id)a4 shouldUseRemoteRecorder:(BOOL)a5 streamHandleId:(unint64_t)a6;
- (NSString)deviceId;
- (unint64_t)streamHandleId;
- (void)updateDeviceId:(id)a3;
- (void)updateWithLatestRecordContext:(id)a3;
@end

@implementation CSAudioRecordDeviceIndicator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
}

- (unint64_t)streamHandleId
{
  return self->_streamHandleId;
}

- (BOOL)shouldUseRemoteRecorder
{
  return self->_shouldUseRemoteRecorder;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)updateDeviceId:(id)a3
{
}

- (void)updateWithLatestRecordContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (CSAudioRecordContext *)[v4 copy];
  recordContext = self->_recordContext;
  self->_recordContext = v5;

  v7 = [v4 deviceId];

  if (v7)
  {
    if ([v4 isBuiltInVoiceTriggered]
      && +[CSUtils hasRemoteBuiltInMic]
      && self->_shouldUseRemoteRecorder)
    {
      v8 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = [v4 deviceId];
        int v13 = 136315394;
        v14 = "-[CSAudioRecordDeviceIndicator updateWithLatestRecordContext:]";
        __int16 v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Replace deviceId(%{public}@) to nil for VoiceTrigger from Gibraltar.", (uint8_t *)&v13, 0x16u);
      }
      deviceId = self->_deviceId;
      self->_deviceId = 0;
    }
    else
    {
      v12 = [v4 deviceId];
      deviceId = self->_deviceId;
      self->_deviceId = v12;
    }
  }
}

- (CSAudioRecordDeviceIndicator)initWithRecordContext:(id)a3 deviceId:(id)a4 shouldUseRemoteRecorder:(BOOL)a5 streamHandleId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSAudioRecordDeviceIndicator;
  v12 = [(CSAudioRecordDeviceIndicator *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    recordContext = v12->_recordContext;
    v12->_recordContext = (CSAudioRecordContext *)v13;

    uint64_t v15 = [v11 copy];
    deviceId = v12->_deviceId;
    v12->_deviceId = (NSString *)v15;

    v12->_shouldUseRemoteRecorder = a5;
    v12->_streamHandleId = a6;
  }

  return v12;
}

@end