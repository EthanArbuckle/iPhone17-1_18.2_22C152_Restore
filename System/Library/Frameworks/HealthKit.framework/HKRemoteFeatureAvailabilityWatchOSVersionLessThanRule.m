@interface HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule
+ (id)ruleIdentifier;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)targetVersion;
- (BOOL)evaluate;
- (void)processUserInfo:(id)a3;
- (void)setTargetVersion:(id *)a3;
@end

@implementation HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule

+ (id)ruleIdentifier
{
  return @"WatchOSVersionLessThan";
}

- (void)processUserInfo:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"OperatingSystemVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    HKNSOperatingSystemVersionFromString(v4, (uint64_t *)&v10);
    long long v8 = v10;
    uint64_t v9 = v11;
    v5 = &v8;
  }
  else
  {
    long long v6 = HKNSOperatingSystemVersionUnknown;
    uint64_t v7 = 0;
    v5 = &v6;
  }
  -[HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule setTargetVersion:](self, "setTargetVersion:", v5, v6, v7);
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v4 = v3;
  if (v3) {
    [v3 watchOSVersion];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  if (HKNSOperatingSystemVersionIsUnknown(v12))
  {
    BOOL v5 = 0;
LABEL_12:

    return v5;
  }
  [(HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule *)self targetVersion];
  BOOL IsUnknown = HKNSOperatingSystemVersionIsUnknown(v11);

  if (!IsUnknown)
  {
    [(HKRemoteFeatureAvailabilityWatchOSVersionLessThanRule *)self targetVersion];
    uint64_t v7 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
    v4 = v7;
    if (v7) {
      [v7 watchOSVersion];
    }
    else {
      memset(v9, 0, sizeof(v9));
    }
    BOOL v5 = HKNSOperatingSystemVersionCompare(v10, v9) == 1;
    goto LABEL_12;
  }
  return 0;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)targetVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)&self->var2;
  return self;
}

- (void)setTargetVersion:(id *)a3
{
  int64_t var2 = a3->var2;
  *(_OWORD *)&self->_targetVersion.majorVersion = *(_OWORD *)&a3->var0;
  self->_targetVersion.patchVersion = var2;
}

@end