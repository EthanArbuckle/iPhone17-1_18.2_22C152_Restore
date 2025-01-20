@interface HMDCameraClipOperation
+ (id)logCategory;
+ (id)shortDescription;
+ (unint64_t)cameraClipOperationType;
- (HMBLocalZone)localZone;
- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4;
- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 dataSource:(id)a5;
- (HMDCameraClipOperationDataSource)dataSource;
- (HMDCameraRecordingUploadOperationEvent)uploadOperationEvent;
- (NSArray)attributeDescriptions;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSString)logIdentifier;
- (NSString)shortDescription;
- (NSUUID)clipModelID;
- (double)executionDuration;
- (double)queuedDuration;
- (id)fetchClipModel;
- (id)updateClipModel:(id)a3;
- (void)_markEndDateAndSubmitUploadOperationEvent;
- (void)cancelWithError:(id)a3;
- (void)finish;
- (void)main;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HMDCameraClipOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uploadOperationEvent, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_clipModelID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (HMDCameraClipOperationDataSource)dataSource
{
  return (HMDCameraClipOperationDataSource *)objc_getProperty(self, a2, 368, 1);
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 360, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (HMDCameraRecordingUploadOperationEvent)uploadOperationEvent
{
  return (HMDCameraRecordingUploadOperationEvent *)objc_getProperty(self, a2, 336, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 328, 1);
}

- (NSUUID)clipModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSArray)attributeDescriptions
{
  v23[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setMinimumFractionDigits:3];
  [v3 setMaximumFractionDigits:3];
  [v3 setNotANumberSymbol:@"0.000"];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCameraClipOperation *)self logIdentifier];
  v21 = (void *)[v4 initWithName:@"ID" value:v22];
  v23[0] = v21;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = [(HMDCameraClipOperation *)self creationDate];
  v7 = (void *)[v5 initWithName:@"Created" value:v6];
  v23[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = NSNumber;
  [(HMDCameraClipOperation *)self queuedDuration];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)[v8 initWithName:@"Queued Duration" value:v10 options:0 formatter:v3];
  v23[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMFOperation *)self isExecuting];
  v13 = HMFBooleanToString();
  v14 = (void *)[v12 initWithName:@"Executing" value:v13];
  v23[3] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = NSNumber;
  [(HMDCameraClipOperation *)self executionDuration];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)[v15 initWithName:@"Execution Duration" value:v17 options:0 formatter:v3];
  v23[4] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

  return (NSArray *)v19;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (void)_markEndDateAndSubmitUploadOperationEvent
{
  id v3 = [(HMDCameraClipOperation *)self endDate];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    [(HMDCameraClipOperation *)self setEndDate:v4];
  }
  [(HMDCameraClipOperation *)self executionDuration];
  double v6 = v5;
  v7 = [(HMDCameraClipOperation *)self uploadOperationEvent];
  [v7 setRunTime:v6];

  id v8 = [(HMFOperation *)self error];
  v9 = [(HMDCameraClipOperation *)self uploadOperationEvent];
  [v9 setError:v8];

  id v11 = [(HMDCameraClipOperation *)self dataSource];
  v10 = [(HMDCameraClipOperation *)self uploadOperationEvent];
  [v11 submitOperationEvent:v10];
}

- (double)executionDuration
{
  id v3 = [(HMDCameraClipOperation *)self startDate];
  if (v3)
  {
    id v4 = [(HMDCameraClipOperation *)self endDate];
    double v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x263EFF910] date];
    }
    id v8 = v6;

    [v8 timeIntervalSinceDate:v3];
    double v7 = v9;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)updateClipModel:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 videoStreamingAsset];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F49318]);
    double v7 = [(HMDCameraClipOperation *)self shortDescription];
    id v8 = (void *)[v6 initWithLabel:v7];

    [v8 setDisallowsCellularAccessForMirrorOutput:1];
    [v8 setQualityOfService:-1];
    double v9 = [(HMDCameraClipOperation *)self localZone];
    v10 = [MEMORY[0x263EFFA08] setWithObject:v4];
    id v11 = [v9 addModels:v10 options:v8];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      v16 = [v4 debugDescription];
      int v20 = 138543618;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Aborting save of clip model because no video streaming asset was found: %@", (uint8_t *)&v20, 0x16u);
    }
    v17 = (void *)MEMORY[0x263F58190];
    v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    id v11 = [v17 futureWithError:v18];
  }
  return v11;
}

- (id)fetchClipModel
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraClipOperation *)self localZone];
  id v4 = [(HMDCameraClipOperation *)self clipModelID];
  id v17 = 0;
  double v5 = [v3 fetchModelWithModelID:v4 ofType:objc_opt_class() error:&v17];
  id v6 = v17;

  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:v5];
LABEL_7:
    v14 = (void *)v7;
    goto LABEL_8;
  }
  id v8 = (void *)MEMORY[0x230FBD990]();
  double v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [(HMDCameraClipOperation *)v9 clipModelID];
    *(_DWORD *)buf = 138543874;
    v19 = v11;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local clip model with ID %@: %@", buf, 0x20u);
  }
  v13 = (void *)MEMORY[0x263F58190];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F58190] futureWithError:v6];
    goto LABEL_7;
  }
  v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
  v14 = [v13 futureWithError:v16];

LABEL_8:
  return v14;
}

- (void)cancelWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCameraClipOperation;
  [(HMFOperation *)&v10 cancelWithError:v4];
  double v5 = (void *)MEMORY[0x230FBD990]([(HMDCameraClipOperation *)self _markEndDateAndSubmitUploadOperationEvent]);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    [(HMDCameraClipOperation *)v6 executionDuration];
    *(_DWORD *)buf = 138543618;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation canceled after %.2fs", buf, 0x16u);
  }
}

- (void)finish
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipOperation;
  [(HMFOperation *)&v8 finish];
  id v3 = (void *)MEMORY[0x230FBD990]([(HMDCameraClipOperation *)self _markEndDateAndSubmitUploadOperationEvent]);
  id v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    [(HMDCameraClipOperation *)v4 executionDuration];
    *(_DWORD *)buf = 138543618;
    objc_super v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Operation finished in %.2fs", buf, 0x16u);
  }
}

- (void)main
{
  id v3 = [(HMDCameraClipOperation *)self startDate];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    [(HMDCameraClipOperation *)self setStartDate:v4];
  }
}

- (double)queuedDuration
{
  id v3 = [(HMDCameraClipOperation *)self startDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF910] date];
  }
  id v6 = v5;

  uint64_t v7 = [(HMDCameraClipOperation *)self creationDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  uint64_t v12 = v11;
  if (!v11)
  {
LABEL_9:
    v29 = (HMDCameraClipOperation *)_HMFPreconditionFailure();
    return [(HMDCameraClipOperation *)v29 initWithClipModelID:v31 localZone:v32];
  }
  [v11 operationTimeout];
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraClipOperation;
  uint64_t v13 = [(HMFOperation *)&v35 initWithTimeout:sel_initWithTimeout_];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clipModelID, a3);
    objc_storeStrong((id *)&v14->_localZone, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    creationDate = v14->_creationDate;
    v14->_creationDate = (NSDate *)v15;

    id v17 = [[HMDCameraRecordingUploadOperationEvent alloc] initWithClipModelID:v9 operation:v14];
    uploadOperationEvent = v14->_uploadOperationEvent;
    v14->_uploadOperationEvent = v17;

    v33 = NSString;
    v34 = [(HMDCameraClipOperation *)v14 name];
    v19 = [v34 componentsSeparatedByString:@"-"];
    __int16 v20 = [v19 lastObject];
    v21 = [(HMDCameraClipOperation *)v14 clipModelID];
    [v21 UUIDString];
    v23 = id v22 = v10;
    uint64_t v24 = [v23 componentsSeparatedByString:@"-"];
    v25 = [v24 lastObject];
    uint64_t v26 = [v33 stringWithFormat:@"%@/%@", v20, v25];
    logIdentifier = v14->_logIdentifier;
    v14->_logIdentifier = (NSString *)v26;

    id v10 = v22;
  }

  return v14;
}

- (HMDCameraClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = objc_alloc_init(HMDCameraClipOperationDataSource);
  id v9 = [(HMDCameraClipOperation *)self initWithClipModelID:v7 localZone:v6 dataSource:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_46837 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_46837, &__block_literal_global_46838);
  }
  v2 = (void *)logCategory__hmf_once_v5_46839;
  return v2;
}

void __37__HMDCameraClipOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_46839;
  logCategory__hmf_once_v5_46839 = v0;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (unint64_t)cameraClipOperationType
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end