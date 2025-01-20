@interface HMDCameraRecordingUploadOperationEvent
- (BOOL)didCausePreviousClipToFinalizeDueToDurationLimit;
- (HMDCameraRecordingUploadOperationEvent)initWithClipModelID:(id)a3 operation:(id)a4;
- (NSUUID)clipModelID;
- (double)runTime;
- (double)totalClipDuration;
- (id)attributeDescriptions;
- (unint64_t)operationType;
- (unint64_t)retryCount;
- (unint64_t)runTimeInMilliseconds;
- (unint64_t)startTimestamp;
- (unint64_t)totalClipDurationMilliseconds;
- (void)setDidCausePreviousClipToFinalizeDueToDurationLimit:(BOOL)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setRunTime:(double)a3;
- (void)setTotalClipDuration:(double)a3;
@end

@implementation HMDCameraRecordingUploadOperationEvent

- (void).cxx_destruct
{
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setTotalClipDuration:(double)a3
{
  self->_totalClipDuration = a3;
}

- (double)totalClipDuration
{
  return self->_totalClipDuration;
}

- (void)setDidCausePreviousClipToFinalizeDueToDurationLimit:(BOOL)a3
{
  self->_didCausePreviousClipToFinalizeDueToDurationLimit = a3;
}

- (BOOL)didCausePreviousClipToFinalizeDueToDurationLimit
{
  return self->_didCausePreviousClipToFinalizeDueToDurationLimit;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setRunTime:(double)a3
{
  self->_runTime = a3;
}

- (double)runTime
{
  return self->_runTime;
}

- (unint64_t)totalClipDurationMilliseconds
{
  [(HMDCameraRecordingUploadOperationEvent *)self totalClipDuration];
  return (unint64_t)(v2 * 1000.0);
}

- (unint64_t)runTimeInMilliseconds
{
  [(HMDCameraRecordingUploadOperationEvent *)self runTime];
  return (unint64_t)(v2 * 1000.0);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (void *)[v4 initWithName:@"uploadMetricClass" value:v6];
  [v3 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = NSNumber;
  [(HMDCameraRecordingUploadOperationEvent *)self runTime];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)[v8 initWithName:@"runTime" value:v10];
  [v3 addObject:v11];

  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCameraRecordingUploadOperationEvent *)self clipModelID];
  v14 = (void *)[v12 initWithName:@"clipModelID" value:v13];
  [v3 addObject:v14];

  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingUploadOperationEvent didCausePreviousClipToFinalizeDueToDurationLimit](self, "didCausePreviousClipToFinalizeDueToDurationLimit"));
  v17 = (void *)[v15 initWithName:@"didCausePreviousClipToFinalizeDueToDurationLimit" value:v16];
  [v3 addObject:v17];

  id v18 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMMLogEvent *)self error];
  v20 = (void *)[v18 initWithName:@"error" value:v19];
  [v3 addObject:v20];

  id v21 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingUploadOperationEvent retryCount](self, "retryCount"));
  v23 = (void *)[v21 initWithName:@"retryCount" value:v22];
  [v3 addObject:v23];

  return v3;
}

- (HMDCameraRecordingUploadOperationEvent)initWithClipModelID:(id)a3 operation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingUploadOperationEvent;
  v9 = [(HMMLogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clipModelID, a3);
    v10->_operationType = [(id)objc_opt_class() cameraClipOperationType];
  }

  return v10;
}

@end