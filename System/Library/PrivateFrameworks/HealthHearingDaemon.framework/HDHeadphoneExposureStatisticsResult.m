@interface HDHeadphoneExposureStatisticsResult
+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4;
+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 prunedCount:(id)a4;
+ (id)resultForAppendedSamplesDuringStartup;
- (BOOL)eligbleForUserNotification;
- (BOOL)needsRebuildOnNextUnlock;
- (HDHeadphoneAudioExposureBucketCollection)cache;
- (NSNumber)prunedCount;
- (id)_initWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4 prunedCount:(id)a5;
- (id)copyWithEligbleForUserNotificationOverride:(BOOL)a3;
- (void)setNeedsRebuildOnNextUnlock:(BOOL)a3;
@end

@implementation HDHeadphoneExposureStatisticsResult

+ (id)resultForAppendedSamplesDuringStartup
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithCache:0 eligbleForUserNotification:0 prunedCount:0];
  return v2;
}

+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 prunedCount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithCache:v7 eligbleForUserNotification:0 prunedCount:v6];

  return (HDHeadphoneExposureStatisticsResult *)v8;
}

+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HDHeadphoneExposureStatisticsResult.m", 32, @"Invalid parameter not satisfying: %@", @"cache" object file lineNumber description];
  }
  v8 = (void *)[objc_alloc((Class)a1) _initWithCache:v7 eligbleForUserNotification:v4 prunedCount:0];

  return (HDHeadphoneExposureStatisticsResult *)v8;
}

- (id)copyWithEligbleForUserNotificationOverride:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  cache = self->_cache;
  prunedCount = self->_prunedCount;
  return (id)[v5 _initWithCache:cache eligbleForUserNotification:v3 prunedCount:prunedCount];
}

- (id)_initWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4 prunedCount:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDHeadphoneExposureStatisticsResult;
  v11 = [(HDHeadphoneExposureStatisticsResult *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cache, a3);
    v12->_eligbleForUserNotification = a4;
    objc_storeStrong((id *)&v12->_prunedCount, a5);
    v13 = v12;
  }

  return v12;
}

- (HDHeadphoneAudioExposureBucketCollection)cache
{
  return self->_cache;
}

- (BOOL)eligbleForUserNotification
{
  return self->_eligbleForUserNotification;
}

- (NSNumber)prunedCount
{
  return self->_prunedCount;
}

- (BOOL)needsRebuildOnNextUnlock
{
  return self->_needsRebuildOnNextUnlock;
}

- (void)setNeedsRebuildOnNextUnlock:(BOOL)a3
{
  self->_needsRebuildOnNextUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prunedCount, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end