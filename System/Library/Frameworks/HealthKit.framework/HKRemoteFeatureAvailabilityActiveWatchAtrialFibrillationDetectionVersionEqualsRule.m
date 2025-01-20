@interface HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule
+ (id)ruleIdentifier;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)targetVersion;
- (BOOL)evaluate;
- (void)processUserInfo:(id)a3;
- (void)setTargetVersion:(id *)a3;
@end

@implementation HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule

+ (id)ruleIdentifier
{
  return @"WatchAtrialFibrillationDetectionVersionEquals";
}

- (void)processUserInfo:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"AtrialFibrillationDetectionVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    HKSemanticVersionFromString(&v7, v4);
    long long v5 = v7;
    uint64_t v6 = v8;
    [(HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule *)self setTargetVersion:&v5];
  }
}

- (BOOL)evaluate
{
  v3 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  v4 = v3;
  if (v3)
  {
    [v3 watchAtrialFibrillationDetectionVersion];
  }
  else
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
  }
  if (HKSemanticVersionIsUnknown(&v18))
  {
    BOOL v5 = 0;
LABEL_15:

    return v5;
  }
  uint64_t v6 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
  long long v7 = v6;
  if (v6)
  {
    [v6 watchAtrialFibrillationDetectionVersion];
  }
  else
  {
    long long v16 = 0uLL;
    uint64_t v17 = 0;
  }
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  BOOL v8 = HKSemanticVersionsEqual(&v16, &v14);

  if (!v8)
  {
    [(HKRemoteFeatureAvailabilityActiveWatchAtrialFibrillationDetectionVersionEqualsRule *)self targetVersion];
    v9 = [(HKRemoteFeatureAvailabilityBaseRule *)self dataSource];
    v4 = v9;
    if (v9)
    {
      [v9 watchAtrialFibrillationDetectionVersion];
    }
    else
    {
      long long v11 = 0uLL;
      uint64_t v12 = 0;
    }
    BOOL v5 = HKSemanticVersionCompare(&v13, &v11) == 0;
    goto LABEL_15;
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