@interface HMDCameraRecordingLogEvent
- (HMDCameraRecordingLogEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5;
- (NSUUID)cameraID;
- (NSUUID)ephemeralCameraID;
- (NSUUID)sessionID;
- (id)attributeDescriptions;
- (unint64_t)sequenceNumber;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation HMDCameraRecordingLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (NSUUID)cameraID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCameraRecordingLogEvent *)self cameraID];
  v5 = (void *)[v3 initWithName:@"cameraID" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCameraRecordingLogEvent *)self sessionID];
  v8 = (void *)[v6 initWithName:@"sessionID" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingLogEvent sequenceNumber](self, "sequenceNumber"));
  v11 = (void *)[v9 initWithName:@"sequenceNumber" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (NSUUID)ephemeralCameraID
{
  v2 = [(HMDCameraRecordingLogEvent *)self cameraID];
  id v3 = +[HMDCameraRecordingMetricUUIDUtilities currentEphemeralUUIDWithUUID:v2 rotationScheduleDays:1];

  return (NSUUID *)v3;
}

- (HMDCameraRecordingLogEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingLogEvent;
  v11 = [(HMMLogEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionID, a3);
    objc_storeStrong((id *)&v12->_cameraID, a4);
    v12->_sequenceNumber = a5;
  }

  return v12;
}

@end