@interface CSSpeechStartDetectedMetaData
- (CSSpeechStartDetectedMetaData)initWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (NSString)deviceId;
- (int64_t)audioRecordType;
- (unint64_t)hostTime;
@end

@implementation CSSpeechStartDetectedMetaData

- (void).cxx_destruct
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (CSSpeechStartDetectedMetaData)initWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CSSpeechStartDetectedMetaData;
  v10 = [(CSSpeechStartDetectedMetaData *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_hostTime = a3;
    v10->_audioRecordType = a4;
    objc_storeStrong((id *)&v10->_deviceId, a5);
  }

  return v11;
}

@end