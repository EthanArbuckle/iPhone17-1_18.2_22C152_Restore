@interface HMDCameraRecordingFragmentAnalyzedEvent
- (BOOL)isSuccess;
- (HMDCameraRecordingFragmentAnalyzedEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5;
- (NSUUID)clipModelID;
- (id)attributeDescriptions;
- (int)recordingReason;
- (void)setClipModelID:(id)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setRecordingReason:(int)a3;
@end

@implementation HMDCameraRecordingFragmentAnalyzedEvent

- (void).cxx_destruct
{
}

- (void)setRecordingReason:(int)a3
{
  self->_recordingReason = a3;
}

- (int)recordingReason
{
  return self->_recordingReason;
}

- (void)setClipModelID:(id)a3
{
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (id)attributeDescriptions
{
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingFragmentAnalyzedEvent;
  v3 = [(HMDCameraRecordingLogEvent *)&v12 attributeDescriptions];
  v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingFragmentAnalyzedEvent isSuccess](self, "isSuccess"));
  v7 = (void *)[v5 initWithName:@"isSuccess" value:v6];
  [v4 addObject:v7];

  uint64_t v8 = [(HMDCameraRecordingFragmentAnalyzedEvent *)self recordingReason];
  if ((v8 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6A0CD80[(v8 - 1)];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"recordingReason" value:v9];
  [v4 addObject:v10];

  return v4;
}

- (HMDCameraRecordingFragmentAnalyzedEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCameraRecordingFragmentAnalyzedEvent;
  return [(HMDCameraRecordingLogEvent *)&v6 initWithSessionID:a3 cameraID:a4 sequenceNumber:a5];
}

@end