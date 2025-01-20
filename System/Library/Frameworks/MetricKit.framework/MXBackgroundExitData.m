@interface MXBackgroundExitData
+ (BOOL)supportsSecureCoding;
- (MXBackgroundExitData)initWithCoder:(id)a3;
- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9 cumulativeSuspendedWithLockedFileExitCount:(id)a10 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a11;
- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 memoryPressureExitCount:(id)a6 badAccessExitCount:(id)a7 abnormalExitCount:(id)a8 illegalInstructionExitCount:(id)a9 appWatchDogExitCount:(id)a10 cumulativeSuspendedWithLockedFileExitCount:(id)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a12;
- (MXBackgroundExitData)initWithNormalAppExitCount:(unint64_t)a3 memoryResourceLimitExitCount:(unint64_t)a4 cpuResourceLimitExitCount:(unint64_t)a5 memoryPressureExitCount:(unint64_t)a6 badAccessExitCount:(unint64_t)a7 abnormalExitCount:(unint64_t)a8 illegalInstructionExitCount:(unint64_t)a9 appWatchDogExitCount:(unint64_t)a10 cumulativeSuspendedWithLockedFileExitCount:(unint64_t)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(unint64_t)a12 cumulativeBackgroundURLSessionCompletionTimeoutExitCount:(unint64_t)a13 cumulativeBackgroundFetchCompletionTimeoutExitCount:(unint64_t)a14;
- (NSUInteger)cumulativeAbnormalExitCount;
- (NSUInteger)cumulativeAppWatchdogExitCount;
- (NSUInteger)cumulativeBackgroundTaskAssertionTimeoutExitCount;
- (NSUInteger)cumulativeBadAccessExitCount;
- (NSUInteger)cumulativeCPUResourceLimitExitCount;
- (NSUInteger)cumulativeIllegalInstructionExitCount;
- (NSUInteger)cumulativeMemoryPressureExitCount;
- (NSUInteger)cumulativeMemoryResourceLimitExitCount;
- (NSUInteger)cumulativeNormalAppExitCount;
- (NSUInteger)cumulativeSuspendedWithLockedFileExitCount;
- (id)toDictionary;
- (unint64_t)cumulativeBackgroundFetchCompletionTimeoutExitCount;
- (unint64_t)cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXBackgroundExitData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t cumulativeNormalAppExitCount = self->_cumulativeNormalAppExitCount;
  id v5 = a3;
  [v5 encodeInteger:cumulativeNormalAppExitCount forKey:@"cumulativeNormalAppExitCount"];
  [v5 encodeInteger:self->_cumulativeMemoryResourceLimitExitCount forKey:@"cumulativeMemoryResourceLimitExitCount"];
  [v5 encodeInteger:self->_cumulativeCPUResourceLimitExitCount forKey:@"cumulativeCPUResourceLimitExitCount"];
  [v5 encodeInteger:self->_cumulativeMemoryPressureExitCount forKey:@"cumulativeMemoryPressureExitCount"];
  [v5 encodeInteger:self->_cumulativeBadAccessExitCount forKey:@"cumulativeBadAccessExitCount"];
  [v5 encodeInteger:self->_cumulativeAbnormalExitCount forKey:@"cumulativeAbnormalExitCount"];
  [v5 encodeInteger:self->_cumulativeIllegalInstructionExitCount forKey:@"cumulativeIllegalInstructionExitCount"];
  [v5 encodeInteger:self->_cumulativeAppWatchdogExitCount forKey:@"cumulativeAppWatchdogExitCount"];
  [v5 encodeInteger:self->_cumulativeSuspendedWithLockedFileExitCount forKey:@"cumulativeSuspendedWithLockedFileExitCount"];
  [v5 encodeInteger:self->_cumulativeBackgroundTaskAssertionTimeoutExitCount forKey:@"cumulativeBackgroundTaskAssertionTimeoutExitCount"];
  [v5 encodeInteger:self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount forKey:@"cumulativeBackgroundURLSessionCompletionTimeoutExitCount"];
  [v5 encodeInteger:self->_cumulativeBackgroundFetchCompletionTimeoutExitCount forKey:@"cumulativeBackgroundFetchCompletionTimeoutExitCount"];
}

- (MXBackgroundExitData)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXBackgroundExitData;
  id v5 = [(MXBackgroundExitData *)&v7 init];
  if (v5)
  {
    v5->_unint64_t cumulativeNormalAppExitCount = [v4 decodeIntegerForKey:@"cumulativeNormalAppExitCount"];
    v5->_cumulativeMemoryResourceLimitExitCount = [v4 decodeIntegerForKey:@"cumulativeMemoryResourceLimitExitCount"];
    v5->_cumulativeCPUResourceLimitExitCount = [v4 decodeIntegerForKey:@"cumulativeCPUResourceLimitExitCount"];
    v5->_cumulativeMemoryPressureExitCount = [v4 decodeIntegerForKey:@"cumulativeMemoryPressureExitCount"];
    v5->_cumulativeBadAccessExitCount = [v4 decodeIntegerForKey:@"cumulativeBadAccessExitCount"];
    v5->_cumulativeAbnormalExitCount = [v4 decodeIntegerForKey:@"cumulativeAbnormalExitCount"];
    v5->_cumulativeIllegalInstructionExitCount = [v4 decodeIntegerForKey:@"cumulativeIllegalInstructionExitCount"];
    v5->_cumulativeAppWatchdogExitCount = [v4 decodeIntegerForKey:@"cumulativeAppWatchdogExitCount"];
    v5->_cumulativeSuspendedWithLockedFileExitCount = [v4 decodeIntegerForKey:@"cumulativeSuspendedWithLockedFileExitCount"];
    v5->_cumulativeBackgroundTaskAssertionTimeoutExitCount = [v4 decodeIntegerForKey:@"cumulativeBackgroundTaskAssertionTimeoutExitCount"];
    v5->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount = [v4 decodeIntegerForKey:@"cumulativeBackgroundURLSessionCompletionTimeoutExitCount"];
    v5->_cumulativeBackgroundFetchCompletionTimeoutExitCount = [v4 decodeIntegerForKey:@"cumulativeBackgroundFetchCompletionTimeoutExitCount"];
  }

  return v5;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9 cumulativeSuspendedWithLockedFileExitCount:(id)a10 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a11
{
  id v17 = a3;
  id v29 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)MXBackgroundExitData;
  v25 = [(MXBackgroundExitData *)&v31 init];
  v30 = v17;
  if (!v25) {
    goto LABEL_12;
  }
  v26 = 0;
  if (!v17)
  {
LABEL_13:
    v27 = v29;
    goto LABEL_14;
  }
  v27 = v29;
  if (v29 && v18 && v19 && v20 && v21 && v22 && v23 && v24)
  {
    v25->_unint64_t cumulativeNormalAppExitCount = [v30 unsignedIntegerValue];
    v25->_cumulativeMemoryResourceLimitExitCount = [v29 unsignedIntegerValue];
    v25->_cumulativeCPUResourceLimitExitCount = [v18 unsignedIntegerValue];
    v25->_cumulativeBadAccessExitCount = [v19 unsignedIntegerValue];
    v25->_cumulativeAbnormalExitCount = [v20 unsignedIntegerValue];
    v25->_cumulativeIllegalInstructionExitCount = [v21 unsignedIntegerValue];
    v25->_cumulativeAppWatchdogExitCount = [v22 unsignedIntegerValue];
    v25->_cumulativeSuspendedWithLockedFileExitCount = [v23 unsignedIntegerValue];
    v25->_cumulativeBackgroundTaskAssertionTimeoutExitCount = [v24 unsignedIntegerValue];
LABEL_12:
    v26 = v25;
    goto LABEL_13;
  }
LABEL_14:

  return v26;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 memoryPressureExitCount:(id)a6 badAccessExitCount:(id)a7 abnormalExitCount:(id)a8 illegalInstructionExitCount:(id)a9 appWatchDogExitCount:(id)a10 cumulativeSuspendedWithLockedFileExitCount:(id)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(id)a12
{
  id v30 = a3;
  id v29 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)MXBackgroundExitData;
  v26 = [(MXBackgroundExitData *)&v31 init];
  if (!v26) {
    goto LABEL_13;
  }
  v27 = 0;
  if (v19 && v30 && v29 && v18 && v20 && v21 && v22 && v23 && v24 && v25)
  {
    v26->_unint64_t cumulativeNormalAppExitCount = [v30 unsignedIntegerValue];
    v26->_cumulativeMemoryResourceLimitExitCount = [v29 unsignedIntegerValue];
    v26->_cumulativeCPUResourceLimitExitCount = [v18 unsignedIntegerValue];
    v26->_cumulativeMemoryPressureExitCount = [v19 unsignedIntegerValue];
    v26->_cumulativeBadAccessExitCount = [v20 unsignedIntegerValue];
    v26->_cumulativeAbnormalExitCount = [v21 unsignedIntegerValue];
    v26->_cumulativeIllegalInstructionExitCount = [v22 unsignedIntegerValue];
    v26->_cumulativeAppWatchdogExitCount = [v23 unsignedIntegerValue];
    v26->_cumulativeSuspendedWithLockedFileExitCount = [v24 unsignedIntegerValue];
    v26->_cumulativeBackgroundTaskAssertionTimeoutExitCount = [v25 unsignedIntegerValue];
LABEL_13:
    v27 = v26;
  }

  return v27;
}

- (MXBackgroundExitData)initWithNormalAppExitCount:(unint64_t)a3 memoryResourceLimitExitCount:(unint64_t)a4 cpuResourceLimitExitCount:(unint64_t)a5 memoryPressureExitCount:(unint64_t)a6 badAccessExitCount:(unint64_t)a7 abnormalExitCount:(unint64_t)a8 illegalInstructionExitCount:(unint64_t)a9 appWatchDogExitCount:(unint64_t)a10 cumulativeSuspendedWithLockedFileExitCount:(unint64_t)a11 cumulativeBackgroundTaskAssertionTimeoutExitCount:(unint64_t)a12 cumulativeBackgroundURLSessionCompletionTimeoutExitCount:(unint64_t)a13 cumulativeBackgroundFetchCompletionTimeoutExitCount:(unint64_t)a14
{
  v21.receiver = self;
  v21.super_class = (Class)MXBackgroundExitData;
  result = [(MXBackgroundExitData *)&v21 init];
  if (result)
  {
    result->_unint64_t cumulativeNormalAppExitCount = a3;
    result->_cumulativeMemoryResourceLimitExitCount = a4;
    result->_cumulativeCPUResourceLimitExitCount = a5;
    result->_cumulativeMemoryPressureExitCount = a6;
    result->_cumulativeBadAccessExitCount = a7;
    result->_cumulativeAbnormalExitCount = a8;
    result->_cumulativeIllegalInstructionExitCount = a9;
    result->_cumulativeAppWatchdogExitCount = a10;
    result->_cumulativeSuspendedWithLockedFileExitCount = a11;
    result->_cumulativeBackgroundTaskAssertionTimeoutExitCount = a12;
    result->_cumulativeBackgroundFetchCompletionTimeoutExitCount = a14;
    result->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount = a13;
  }
  return result;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_cumulativeNormalAppExitCount)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v4 forKey:@"cumulativeNormalAppExitCount"];
  }
  if (self->_cumulativeMemoryResourceLimitExitCount)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v5 forKey:@"cumulativeMemoryResourceLimitExitCount"];
  }
  if (self->_cumulativeCPUResourceLimitExitCount)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v6 forKey:@"cumulativeCPUResourceLimitExitCount"];
  }
  if (self->_cumulativeMemoryPressureExitCount)
  {
    objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v7 forKey:@"cumulativeMemoryPressureExitCount"];
  }
  if (self->_cumulativeBadAccessExitCount)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v8 forKey:@"cumulativeBadAccessExitCount"];
  }
  if (self->_cumulativeAbnormalExitCount)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v9 forKey:@"cumulativeAbnormalExitCount"];
  }
  if (self->_cumulativeIllegalInstructionExitCount)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v10 forKey:@"cumulativeIllegalInstructionExitCount"];
  }
  if (self->_cumulativeAppWatchdogExitCount)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v11 forKey:@"cumulativeAppWatchdogExitCount"];
  }
  if (self->_cumulativeSuspendedWithLockedFileExitCount)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v12 forKey:@"cumulativeSuspendedWithLockedFileExitCount"];
  }
  if (self->_cumulativeBackgroundTaskAssertionTimeoutExitCount)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v13 forKey:@"cumulativeBackgroundTaskAssertionTimeoutExitCount"];
  }
  if (self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v14 forKey:@"cumulativeBackgroundURLSessionCompletionTimeoutExitCount"];
  }
  if (self->_cumulativeBackgroundFetchCompletionTimeoutExitCount)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v15 forKey:@"cumulativeBackgroundFetchCompletionTimeoutExitCount"];
  }

  return v3;
}

- (NSUInteger)cumulativeNormalAppExitCount
{
  return self->_cumulativeNormalAppExitCount;
}

- (NSUInteger)cumulativeMemoryResourceLimitExitCount
{
  return self->_cumulativeMemoryResourceLimitExitCount;
}

- (NSUInteger)cumulativeCPUResourceLimitExitCount
{
  return self->_cumulativeCPUResourceLimitExitCount;
}

- (NSUInteger)cumulativeMemoryPressureExitCount
{
  return self->_cumulativeMemoryPressureExitCount;
}

- (NSUInteger)cumulativeBadAccessExitCount
{
  return self->_cumulativeBadAccessExitCount;
}

- (NSUInteger)cumulativeAbnormalExitCount
{
  return self->_cumulativeAbnormalExitCount;
}

- (NSUInteger)cumulativeIllegalInstructionExitCount
{
  return self->_cumulativeIllegalInstructionExitCount;
}

- (NSUInteger)cumulativeAppWatchdogExitCount
{
  return self->_cumulativeAppWatchdogExitCount;
}

- (NSUInteger)cumulativeSuspendedWithLockedFileExitCount
{
  return self->_cumulativeSuspendedWithLockedFileExitCount;
}

- (NSUInteger)cumulativeBackgroundTaskAssertionTimeoutExitCount
{
  return self->_cumulativeBackgroundTaskAssertionTimeoutExitCount;
}

- (unint64_t)cumulativeBackgroundFetchCompletionTimeoutExitCount
{
  return self->_cumulativeBackgroundFetchCompletionTimeoutExitCount;
}

- (unint64_t)cumulativeBackgroundURLSessionCompletionTimeoutExitCount
{
  return self->_cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
}

@end