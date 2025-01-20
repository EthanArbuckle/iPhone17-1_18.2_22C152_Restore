@interface HMDCameraRecordingClipNotificationEvent
- (HMDCameraRecordingClipNotificationEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5 recordingEventTriggers:(unint64_t)a6;
- (id)attributeDescriptions;
- (unint64_t)recordingEventTriggers;
@end

@implementation HMDCameraRecordingClipNotificationEvent

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (id)attributeDescriptions
{
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingClipNotificationEvent;
  v3 = [(HMDCameraRecordingLogEvent *)&v9 attributeDescriptions];
  v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingClipNotificationEvent recordingEventTriggers](self, "recordingEventTriggers"));
  v7 = (void *)[v5 initWithName:@"recordingEventTriggers" value:v6];
  [v4 addObject:v7];

  return v4;
}

- (HMDCameraRecordingClipNotificationEvent)initWithSessionID:(id)a3 cameraID:(id)a4 sequenceNumber:(unint64_t)a5 recordingEventTriggers:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraRecordingClipNotificationEvent;
  result = [(HMDCameraRecordingLogEvent *)&v8 initWithSessionID:a3 cameraID:a4 sequenceNumber:a5];
  if (result) {
    result->_recordingEventTriggers = a6;
  }
  return result;
}

@end