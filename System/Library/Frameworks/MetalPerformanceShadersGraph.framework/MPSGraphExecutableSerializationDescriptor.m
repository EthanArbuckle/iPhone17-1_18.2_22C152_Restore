@interface MPSGraphExecutableSerializationDescriptor
+ (void)validateMinimumDeploymentTargetVersion:(optional<MPSGraphOperatingSystemVersion> *)a3 forPlatform:(unint64_t)a4;
- (BOOL)append;
- (MPSGraphDeploymentPlatform)deploymentPlatform;
- (MPSGraphExecutableSerializationDescriptor)init;
- (MPSGraphOperatingSystemVersion)getDeploymentTargetAsOSVersion;
- (NSString)minimumDeploymentTarget;
- (optional<MPSGraphOperatingSystemVersion>)getUserSetMinimumDeploymentTarget;
- (void)setAppend:(BOOL)append;
- (void)setDeploymentPlatform:(MPSGraphDeploymentPlatform)deploymentPlatform;
- (void)setMinimumDeploymentTarget:(NSString *)minimumDeploymentTarget;
@end

@implementation MPSGraphExecutableSerializationDescriptor

- (MPSGraphExecutableSerializationDescriptor)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPSGraphExecutableSerializationDescriptor;
  v2 = [(MPSGraphExecutableSerializationDescriptor *)&v8 init];
  int active_platform = dyld_get_active_platform();
  if (active_platform != 1)
  {
    if ((active_platform & 0xFFFFFFFB) == 2)
    {
      uint64_t v4 = 1;
      goto LABEL_11;
    }
    if (active_platform == 3)
    {
      uint64_t v4 = 2;
      goto LABEL_11;
    }
    if (active_platform == 11)
    {
      uint64_t v4 = 3;
      goto LABEL_11;
    }
    if (MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
      uint64_t v4 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v4 = 0;
LABEL_11:
  v2->_deploymentPlatform = v4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E8EBF208, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E8EBF208))
  {
    getMPSGraphBuildSDKVersion(void)::$_0::operator()();
    __cxa_guard_release(&qword_1E8EBF208);
  }
  MPSGraphOperatingSystemVersion v9 = *(MPSGraphOperatingSystemVersion *)byte_1E8EBF270;
  uint64_t v5 = MPSGraphOperatingSystemVersion::asString(&v9);
  minimumDeploymentTarget = v2->_minimumDeploymentTarget;
  v2->_minimumDeploymentTarget = (NSString *)v5;

  v2->_userSetMinimumDeploymentTarget = 0;
  return v2;
}

- (MPSGraphOperatingSystemVersion)getDeploymentTargetAsOSVersion
{
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(retstr, self->_minimumDeploymentTarget);
  return result;
}

- (void)setMinimumDeploymentTarget:(NSString *)minimumDeploymentTarget
{
  v7 = minimumDeploymentTarget;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSString *)v7 copy];
  v6 = v4->_minimumDeploymentTarget;
  v4->_minimumDeploymentTarget = (NSString *)v5;

  v4->_userSetMinimumDeploymentTarget = 1;
  objc_sync_exit(v4);
}

- (NSString)minimumDeploymentTarget
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_minimumDeploymentTarget;
  objc_sync_exit(v2);

  return v3;
}

- (optional<MPSGraphOperatingSystemVersion>)getUserSetMinimumDeploymentTarget
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_userSetMinimumDeploymentTarget)
  {
    [(MPSGraphExecutableSerializationDescriptor *)v4 getDeploymentTargetAsOSVersion];
    *(_OWORD *)&retstr->var0.var0 = v6;
    retstr->var0.var1.var2 = v7;
    retstr->var1 = 1;
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
  }
  objc_sync_exit(v4);

  return result;
}

+ (void)validateMinimumDeploymentTargetVersion:(optional<MPSGraphOperatingSystemVersion> *)a3 forPlatform:(unint64_t)a4
{
  if (a3->var1)
  {
    int64_t var0 = a3->var0.var1.var0;
    int64_t var1 = a3->var0.var1.var1;
    int64_t var2 = a3->var0.var1.var2;
    switch(a4)
    {
      case 0uLL:
        if (var0 <= 14
          && (var0 != 14 || var1 <= 0 && (var1 || var2 < 0))
          && MTLReportFailureTypeEnabled())
        {
          goto LABEL_11;
        }
        break;
      case 1uLL:
        if (var0 <= 17
          && (var0 != 17 || var1 <= 0 && (var1 || var2 < 0))
          && MTLReportFailureTypeEnabled())
        {
          goto LABEL_11;
        }
        break;
      case 2uLL:
        if (var0 <= 17
          && (var0 != 17 || var1 <= 0 && (var1 || var2 < 0))
          && MTLReportFailureTypeEnabled())
        {
          goto LABEL_11;
        }
        break;
      case 3uLL:
        if (var0 <= 1
          && (var0 != 1 || var1 <= 1 && (var1 != 1 || var2 < 0))
          && MTLReportFailureTypeEnabled())
        {
LABEL_11:
          MTLReportFailure();
        }
        break;
      default:
        return;
    }
  }
}

- (BOOL)append
{
  return self->_append;
}

- (void)setAppend:(BOOL)append
{
  self->_append = append;
}

- (MPSGraphDeploymentPlatform)deploymentPlatform
{
  return self->_deploymentPlatform;
}

- (void)setDeploymentPlatform:(MPSGraphDeploymentPlatform)deploymentPlatform
{
  self->_deploymentPlatform = deploymentPlatform;
}

- (void).cxx_destruct
{
}

@end