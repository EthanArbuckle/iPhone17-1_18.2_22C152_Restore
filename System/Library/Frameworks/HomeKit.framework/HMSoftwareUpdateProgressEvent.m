@interface HMSoftwareUpdateProgressEvent
- (HMSoftwareUpdateProgress)progress;
- (HMSoftwareUpdateProgressEvent)initWithProgress:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5;
- (id)encodedData;
@end

@implementation HMSoftwareUpdateProgressEvent

- (void).cxx_destruct
{
}

- (HMSoftwareUpdateProgress)progress
{
  return (HMSoftwareUpdateProgress *)objc_getProperty(self, a2, 24, 1);
}

- (id)encodedData
{
  v2 = [(HMSoftwareUpdateProgressEvent *)self progress];
  v3 = [v2 protoPayload];
  v4 = [v3 data];

  return v4;
}

- (HMSoftwareUpdateProgressEvent)initWithProgress:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E4F69F48];
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithSource:v11 cachePolicy:1 combineType:2 timestamp:a5];

  v16.receiver = self;
  v16.super_class = (Class)HMSoftwareUpdateProgressEvent;
  v13 = [(HMEEvent *)&v16 initWithSubclassedEventMetadata:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_progress, a3);
  }

  return v14;
}

@end