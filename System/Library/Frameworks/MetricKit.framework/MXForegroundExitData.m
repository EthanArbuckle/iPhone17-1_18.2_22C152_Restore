@interface MXForegroundExitData
+ (BOOL)supportsSecureCoding;
- (MXForegroundExitData)initWithCoder:(id)a3;
- (MXForegroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9;
- (MXForegroundExitData)initWithNormalAppExitCount:(unint64_t)a3 withMemoryResourceLimitExitCount:(unint64_t)a4 withCPUResourceLimitExitCount:(unint64_t)a5 withBadAccessExitCount:(unint64_t)a6 withAbnormalExitCount:(unint64_t)a7 withIllegalInstructionExitCount:(unint64_t)a8 withAppWatchDogExitCount:(unint64_t)a9;
- (NSUInteger)cumulativeAbnormalExitCount;
- (NSUInteger)cumulativeAppWatchdogExitCount;
- (NSUInteger)cumulativeBadAccessExitCount;
- (NSUInteger)cumulativeIllegalInstructionExitCount;
- (NSUInteger)cumulativeMemoryResourceLimitExitCount;
- (NSUInteger)cumulativeNormalAppExitCount;
- (id)toDictionary;
- (unint64_t)cumulativeCPUResourceLimitExitCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXForegroundExitData

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
  [v5 encodeInteger:self->_cumulativeBadAccessExitCount forKey:@"cumulativeBadAccessExitCount"];
  [v5 encodeInteger:self->_cumulativeAbnormalExitCount forKey:@"cumulativeAbnormalExitCount"];
  [v5 encodeInteger:self->_cumulativeIllegalInstructionExitCount forKey:@"cumulativeIllegalInstructionExitCount"];
  [v5 encodeInteger:self->_cumulativeAppWatchdogExitCount forKey:@"cumulativeAppWatchdogExitCount"];
}

- (MXForegroundExitData)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXForegroundExitData;
  id v5 = [(MXForegroundExitData *)&v7 init];
  if (v5)
  {
    v5->_unint64_t cumulativeNormalAppExitCount = [v4 decodeIntegerForKey:@"cumulativeNormalAppExitCount"];
    v5->_cumulativeMemoryResourceLimitExitCount = [v4 decodeIntegerForKey:@"cumulativeMemoryResourceLimitExitCount"];
    v5->_cumulativeCPUResourceLimitExitCount = [v4 decodeIntegerForKey:@"cumulativeCPUResourceLimitExitCount"];
    v5->_cumulativeBadAccessExitCount = [v4 decodeIntegerForKey:@"cumulativeBadAccessExitCount"];
    v5->_cumulativeAbnormalExitCount = [v4 decodeIntegerForKey:@"cumulativeAbnormalExitCount"];
    v5->_cumulativeIllegalInstructionExitCount = [v4 decodeIntegerForKey:@"cumulativeIllegalInstructionExitCount"];
    v5->_cumulativeAppWatchdogExitCount = [v4 decodeIntegerForKey:@"cumulativeAppWatchdogExitCount"];
  }

  return v5;
}

- (MXForegroundExitData)initWithNormalAppExitCount:(id)a3 memoryResourceLimitExitCount:(id)a4 cpuResourceLimitExitCount:(id)a5 badAccessExitCount:(id)a6 abnormalExitCount:(id)a7 illegalInstructionExitCount:(id)a8 appWatchDogExitCount:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)MXForegroundExitData;
  v22 = [(MXForegroundExitData *)&v25 init];
  if (!v22) {
    goto LABEL_10;
  }
  v23 = 0;
  if (v15 && v16 && v17 && v18 && v19 && v20 && v21)
  {
    v22->_unint64_t cumulativeNormalAppExitCount = [v15 unsignedIntegerValue];
    v22->_cumulativeMemoryResourceLimitExitCount = [v16 unsignedIntegerValue];
    v22->_cumulativeCPUResourceLimitExitCount = [v17 unsignedIntegerValue];
    v22->_cumulativeBadAccessExitCount = [v18 unsignedIntegerValue];
    v22->_cumulativeAbnormalExitCount = [v19 unsignedIntegerValue];
    v22->_cumulativeIllegalInstructionExitCount = [v20 unsignedIntegerValue];
    v22->_cumulativeAppWatchdogExitCount = [v21 unsignedIntegerValue];
LABEL_10:
    v23 = v22;
  }

  return v23;
}

- (MXForegroundExitData)initWithNormalAppExitCount:(unint64_t)a3 withMemoryResourceLimitExitCount:(unint64_t)a4 withCPUResourceLimitExitCount:(unint64_t)a5 withBadAccessExitCount:(unint64_t)a6 withAbnormalExitCount:(unint64_t)a7 withIllegalInstructionExitCount:(unint64_t)a8 withAppWatchDogExitCount:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)MXForegroundExitData;
  result = [(MXForegroundExitData *)&v16 init];
  if (result)
  {
    result->_unint64_t cumulativeNormalAppExitCount = a3;
    result->_cumulativeMemoryResourceLimitExitCount = a4;
    result->_cumulativeAppWatchdogExitCount = a9;
    result->_cumulativeCPUResourceLimitExitCount = a5;
    result->_cumulativeBadAccessExitCount = a6;
    result->_cumulativeAbnormalExitCount = a7;
    result->_cumulativeIllegalInstructionExitCount = a8;
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
  if (self->_cumulativeBadAccessExitCount)
  {
    objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v7 forKey:@"cumulativeBadAccessExitCount"];
  }
  if (self->_cumulativeAbnormalExitCount)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v8 forKey:@"cumulativeAbnormalExitCount"];
  }
  if (self->_cumulativeIllegalInstructionExitCount)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v9 forKey:@"cumulativeIllegalInstructionExitCount"];
  }
  if (self->_cumulativeAppWatchdogExitCount)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v10 forKey:@"cumulativeAppWatchdogExitCount"];
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

- (unint64_t)cumulativeCPUResourceLimitExitCount
{
  return self->_cumulativeCPUResourceLimitExitCount;
}

@end