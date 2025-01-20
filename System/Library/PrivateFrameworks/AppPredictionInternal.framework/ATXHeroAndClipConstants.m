@interface ATXHeroAndClipConstants
+ (id)sharedInstance;
- (ATXHeroAndClipConstants)init;
- (double)appClipsFeedbackHistogramHalfLifeInDays;
- (double)appClipsHighConfidenceScoreThreshold;
- (double)appClipsMediumConfidenceScoreThreshold;
- (double)appClipsOverallEngagementThreshold;
- (double)appClipsOverallMinRejects;
- (double)appClipsPerAppClipEngagementThreshold;
- (double)appClipsPerAppClipEngagementThresholdNoDecay;
- (double)appClipsPerAppClipMinRejects;
- (double)appClipsPerAppClipMinRejectsNoDecay;
- (double)heroAppEngagementThreshold;
- (double)heroAppMinRefreshInterval;
- (double)heroAppMinimumRejects;
- (double)heroAppPredictionExpirationInterval;
- (double)heroAppTileMaxErrorDistance;
- (double)heroAppWorstCaseLocationAccuracy;
- (id)appClipsErrorDomain;
- (id)appClipsModelVersion;
- (id)appClipsNotificationCategoryIdentifier;
- (id)appClipsNotificationId;
- (id)appClipsNotificationLockscreenIdentifier;
- (id)defaultHeroPOICategory;
- (id)heroAppPredictionsKey;
- (int)heroAppIndexNotSet;
- (int64_t)appClipsDecodeErrorCode;
- (int64_t)appClipsLaunchErrorCode;
- (unint64_t)appClipSessionLogNegativeSamplesPerDay;
- (unint64_t)appClipSessionLogPositiveSamplesPerDay;
- (unint64_t)appClipShadowLogSamplesPerDay;
- (unint64_t)appShadowLogSamplesPerDay;
- (unint64_t)heroAppSessionLogNegativeSamplesPerDay;
- (unint64_t)heroAppSessionLogPositiveSamplesPerDay;
@end

@implementation ATXHeroAndClipConstants

- (ATXHeroAndClipConstants)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXHeroAndClipConstants;
  v2 = [(ATXHeroAndClipConstants *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4AF08] dictionaryWithLegacyPathForClass:objc_opt_class()];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v3];
    uint64_t v5 = [v4 abGroupContents];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_26 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_26, &__block_literal_global_145);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_34;
  return v2;
}

void __41__ATXHeroAndClipConstants_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_34;
  sharedInstance__pasExprOnceResult_34 = v1;
}

- (double)appClipsOverallEngagementThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsOverallEngagementThreshold"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.1;
  }

  return v5;
}

- (double)appClipsOverallMinRejects
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsOverallMinRejects"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 9.9;
  }

  return v5;
}

- (double)appClipsPerAppClipEngagementThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsPerAppClipEngagementThreshold"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.3;
  }

  return v5;
}

- (double)appClipsPerAppClipMinRejects
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsPerAppClipMinRejects"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.9;
  }

  return v5;
}

- (double)appClipsMediumConfidenceScoreThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsMediumConfidenceScoreThreshold"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.1;
  }

  return v5;
}

- (double)appClipsHighConfidenceScoreThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsHighConfidenceScoreThreshold"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)appClipsFeedbackHistogramHalfLifeInDays
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsFeedbackHistogramHalfLifeInDays"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 14.0;
  }

  return v5;
}

- (id)appClipsModelVersion
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsModelVersion"];
  Class v3 = NSClassFromString(&cfstr_Nsstring.isa);
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  v6 = v5;

  if (v6) {
    v7 = v6;
  }
  else {
    v7 = @"1.0";
  }
  objc_super v8 = v7;

  return v8;
}

- (id)appClipsErrorDomain
{
  return @"com.apple.proactive.clips";
}

- (id)appClipsNotificationId
{
  return @"com.apple.proactive.notification.appClips";
}

- (id)appClipsNotificationCategoryIdentifier
{
  return @"appClipsCategory";
}

- (id)appClipsNotificationLockscreenIdentifier
{
  return @"appClipsLockscreen";
}

- (int64_t)appClipsDecodeErrorCode
{
  return -1;
}

- (int64_t)appClipsLaunchErrorCode
{
  return 0;
}

- (double)appClipsPerAppClipMinRejectsNoDecay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsPerAppClipMinRejectsNoDecay"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 4.99;
  }

  return v5;
}

- (double)appClipsPerAppClipEngagementThresholdNoDecay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipsPerAppClipEngagementThresholdNoDecay"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.011;
  }

  return v5;
}

- (double)heroAppEngagementThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppEngagementThreshold"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.2;
  }

  return v5;
}

- (double)heroAppMinimumRejects
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppMinimumRejects"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.6;
  }

  return v5;
}

- (double)heroAppWorstCaseLocationAccuracy
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppWorstCaseLocationAccuracy"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 45.0;
  }

  return v5;
}

- (double)heroAppTileMaxErrorDistance
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppTileMaxErrorDistance"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 25.0;
  }

  return v5;
}

- (double)heroAppMinRefreshInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppMinRefreshInterval"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 5.0;
  }

  return v5;
}

- (double)heroAppPredictionExpirationInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppPredictionExpirationInterval"];
  Class v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1500.0;
  }

  return v5;
}

- (id)heroAppPredictionsKey
{
  return @"ATXHeroAppPredictionsKey";
}

- (int)heroAppIndexNotSet
{
  return 0x7FFF;
}

- (unint64_t)heroAppSessionLogPositiveSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppSessionLogPositiveSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (unint64_t)heroAppSessionLogNegativeSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HeroAppSessionLogNegativeSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (unint64_t)appClipSessionLogPositiveSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipSessionLogPositiveSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (unint64_t)appClipSessionLogNegativeSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipSessionLogNegativeSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (unint64_t)appShadowLogSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppShadowLogSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (unint64_t)appClipShadowLogSamplesPerDay
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"AppClipShadowLogSamplesPerDay"];
  Class v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (id)defaultHeroPOICategory
{
  return @"ATXDefaultHeroPOICategory";
}

- (void).cxx_destruct
{
}

@end