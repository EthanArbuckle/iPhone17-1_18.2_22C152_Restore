@interface MTLTargetDeviceArchitecture
- (MTLTargetDeviceArchVersion)version;
- (MTLTargetDeviceArchitecture)init;
- (unint64_t)driverVersion;
- (unsigned)cpuType;
- (unsigned)subType;
- (unsigned)versionCombined;
- (void)setCpuType:(unsigned int)a3;
- (void)setDriverVersion:(unint64_t)a3;
- (void)setSubType:(unsigned int)a3;
- (void)setVersion:(MTLTargetDeviceArchVersion)a3;
@end

@implementation MTLTargetDeviceArchitecture

- (void)setVersion:(MTLTargetDeviceArchVersion)a3
{
  self->_version = a3;
}

- (void)setSubType:(unsigned int)a3
{
  self->_subType = a3;
}

- (void)setDriverVersion:(unint64_t)a3
{
  self->_driverVersion = a3;
}

- (void)setCpuType:(unsigned int)a3
{
  self->_cpuType = a3;
}

- (MTLTargetDeviceArchitecture)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLTargetDeviceArchitecture;
  result = [(MTLTargetDeviceArchitecture *)&v3 init];
  if (result) {
    result->_version = 0;
  }
  return result;
}

- (unsigned)cpuType
{
  return self->_cpuType;
}

- (unsigned)subType
{
  return self->_subType;
}

- (unsigned)versionCombined
{
  return (self->_version.major << 16) | (self->_version.minor << 8) | self->_version.update;
}

- (unint64_t)driverVersion
{
  return self->_driverVersion;
}

- (MTLTargetDeviceArchVersion)version
{
  return self->_version;
}

@end