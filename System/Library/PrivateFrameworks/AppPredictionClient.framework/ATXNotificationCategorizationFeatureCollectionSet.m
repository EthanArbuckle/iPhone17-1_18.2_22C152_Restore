@interface ATXNotificationCategorizationFeatureCollectionSet
+ (BOOL)supportsSecureCoding;
- (ATXNotificationCategorizationFeatureCollectionSet)initWithBundleID:(id)a3 notificationDeliveryUrgency:(int64_t)a4 contactRelationships:(unint64_t)a5 relationshipsFromMegadome:(id)a6 dayOfWeek:(unint64_t)a7 timeOfDay:(int)a8 locationSemantic:(int)a9 appModeAffinityScore:(double)a10 contactModeAffinityScore:(double)a11 notificationModeAffinityScore:(double)a12 appCategoryScoreInMode:(double)a13 urgencyScore:(double)a14 importanceScore:(double)a15 bucketizedLengthOfNotificationBody:(unint64_t)a16 currentMode:(unint64_t)a17 timeToLaunchApp:(unint64_t)a18 historicalVolumeByCountAndPercentage:(id)a19 modeConditionedHistoricalVolumeByCountAndPercentage:(id)a20 historicalResolutionByPercentage:(id)a21 modeConditionedHistoricalResolutionByPercentage:(id)a22;
- (ATXNotificationCategorizationFeatureCollectionSet)initWithCoder:(id)a3;
- (ATXNotificationResolutionByPercentage)historicalResolutionByPercentage;
- (ATXNotificationResolutionByPercentage)modeConditionedHistoricalResolutionByPercentage;
- (ATXNotificationVolumeByCountAndPercentage)historicalVolumeByCountAndPercentage;
- (ATXNotificationVolumeByCountAndPercentage)modeConditionedHistoricalVolumeByCountAndPercentage;
- (NSArray)relationshipsFromMegadome;
- (NSString)bundleID;
- (double)appCategoryScoreInMode;
- (double)appModeAffinityScore;
- (double)contactModeAffinityScore;
- (double)importanceScore;
- (double)notificationModeAffinityScore;
- (double)urgencyScore;
- (int)locationSemantic;
- (int)timeOfDay;
- (int64_t)notificationDeliveryUrgency;
- (unint64_t)bucketizedLengthOfNotificationBody;
- (unint64_t)contactRelationships;
- (unint64_t)currentUnifiedMode;
- (unint64_t)dayOfWeek;
- (unint64_t)timeToLaunchApp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNotificationCategorizationFeatureCollectionSet

- (ATXNotificationCategorizationFeatureCollectionSet)initWithBundleID:(id)a3 notificationDeliveryUrgency:(int64_t)a4 contactRelationships:(unint64_t)a5 relationshipsFromMegadome:(id)a6 dayOfWeek:(unint64_t)a7 timeOfDay:(int)a8 locationSemantic:(int)a9 appModeAffinityScore:(double)a10 contactModeAffinityScore:(double)a11 notificationModeAffinityScore:(double)a12 appCategoryScoreInMode:(double)a13 urgencyScore:(double)a14 importanceScore:(double)a15 bucketizedLengthOfNotificationBody:(unint64_t)a16 currentMode:(unint64_t)a17 timeToLaunchApp:(unint64_t)a18 historicalVolumeByCountAndPercentage:(id)a19 modeConditionedHistoricalVolumeByCountAndPercentage:(id)a20 historicalResolutionByPercentage:(id)a21 modeConditionedHistoricalResolutionByPercentage:(id)a22
{
  id v45 = a3;
  id v44 = a6;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v43 = a22;
  v46.receiver = self;
  v46.super_class = (Class)ATXNotificationCategorizationFeatureCollectionSet;
  v35 = [(ATXNotificationCategorizationFeatureCollectionSet *)&v46 init];
  if (v35)
  {
    uint64_t v36 = [v45 copy];
    bundleID = v35->_bundleID;
    v35->_bundleID = (NSString *)v36;

    v35->_notificationDeliveryUrgency = a4;
    v35->_contactRelationships = a5;
    uint64_t v38 = [v44 copy];
    relationshipsFromMegadome = v35->_relationshipsFromMegadome;
    v35->_relationshipsFromMegadome = (NSArray *)v38;

    v35->_dayOfWeek = a7;
    v35->_timeOfDay = a8;
    v35->_locationSemantic = a9;
    v35->_appModeAffinityScore = a10;
    v35->_contactModeAffinityScore = a11;
    v35->_notificationModeAffinityScore = a12;
    v35->_appCategoryScoreInMode = a13;
    v35->_urgencyScore = a14;
    v35->_importanceScore = a15;
    v35->_bucketizedLengthOfNotificationBody = a16;
    v35->_currentUnifiedMode = a17;
    v35->_timeToLaunchApp = a18;
    objc_storeStrong((id *)&v35->_historicalVolumeByCountAndPercentage, a19);
    objc_storeStrong((id *)&v35->_modeConditionedHistoricalVolumeByCountAndPercentage, a20);
    objc_storeStrong((id *)&v35->_historicalResolutionByPercentage, a21);
    objc_storeStrong((id *)&v35->_modeConditionedHistoricalResolutionByPercentage, a22);
  }

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeInteger:self->_notificationDeliveryUrgency forKey:@"notificationDeliveryUrgency"];
  [v5 encodeInteger:self->_contactRelationships forKey:@"contactRelationships"];
  [v5 encodeObject:self->_relationshipsFromMegadome forKey:@"relationshipsFromMegadome"];
  [v5 encodeInteger:self->_dayOfWeek forKey:@"dayOfWeek"];
  [v5 encodeInt32:self->_timeOfDay forKey:@"timeOfDay"];
  [v5 encodeInt32:self->_locationSemantic forKey:@"locationSemantic"];
  [v5 encodeDouble:@"appModeAffinityScore" forKey:self->_appModeAffinityScore];
  [v5 encodeDouble:@"contactModeAffinityScore" forKey:self->_contactModeAffinityScore];
  [v5 encodeDouble:@"notificationModeAffinityScore" forKey:self->_notificationModeAffinityScore];
  [v5 encodeDouble:@"appCategoryScoreInMode" forKey:self->_appCategoryScoreInMode];
  [v5 encodeDouble:@"urgencyScore" forKey:self->_urgencyScore];
  [v5 encodeDouble:@"importanceScore" forKey:self->_importanceScore];
  [v5 encodeInteger:self->_bucketizedLengthOfNotificationBody forKey:@"bucketizedLengthOfNotificationBody"];
  [v5 encodeInteger:self->_currentUnifiedMode forKey:@"currentUnifiedMode"];
  [v5 encodeInteger:self->_timeToLaunchApp forKey:@"timeToLaunchApp"];
  [v5 encodeObject:self->_historicalVolumeByCountAndPercentage forKey:@"historicalVolumeByCountAndPercentage"];
  [v5 encodeObject:self->_modeConditionedHistoricalVolumeByCountAndPercentage forKey:@"modeConditionedHistoricalVolumeByCountAndPercentage"];
  [v5 encodeObject:self->_historicalResolutionByPercentage forKey:@"historicalResolutionByPercentage"];
  [v5 encodeObject:self->_modeConditionedHistoricalResolutionByPercentage forKey:@"modeConditionedHistoricalResolutionByPercentage"];
}

- (ATXNotificationCategorizationFeatureCollectionSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATXNotificationCategorizationFeatureCollectionSet;
  id v5 = [(ATXNotificationCategorizationFeatureCollectionSet *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_notificationDeliveryUrgency = [v4 decodeIntegerForKey:@"notificationDeliveryUrgency"];
    v5->_contactRelationships = [v4 decodeIntegerForKey:@"contactRelationships"];
    v8 = (void *)MEMORY[0x1AD0D3C30]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"relationshipsFromMegadome"];
    relationshipsFromMegadome = v5->_relationshipsFromMegadome;
    v5->_relationshipsFromMegadome = (NSArray *)v12;

    v5->_dayOfWeek = [v4 decodeIntegerForKey:@"dayOfWeek"];
    v5->_timeOfDay = [v4 decodeInt32ForKey:@"timeOfDay"];
    v5->_locationSemantic = [v4 decodeInt32ForKey:@"locationSemantic"];
    [v4 decodeDoubleForKey:@"appModeAffinityScore"];
    v5->_appModeAffinityScore = v14;
    [v4 decodeDoubleForKey:@"contactModeAffinityScore"];
    v5->_contactModeAffinityScore = v15;
    [v4 decodeDoubleForKey:@"notificationModeAffinityScore"];
    v5->_notificationModeAffinityScore = v16;
    [v4 decodeDoubleForKey:@"appCategoryScoreInMode"];
    v5->_appCategoryScoreInMode = v17;
    [v4 decodeDoubleForKey:@"urgencyScore"];
    v5->_urgencyScore = v18;
    [v4 decodeDoubleForKey:@"importanceScore"];
    v5->_importanceScore = v19;
    v5->_bucketizedLengthOfNotificationBody = [v4 decodeIntegerForKey:@"bucketizedLengthOfNotificationBody"];
    v5->_currentUnifiedMode = [v4 decodeIntegerForKey:@"currentUnifiedMode"];
    v5->_timeToLaunchApp = [v4 decodeIntegerForKey:@"timeToLaunchApp"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historicalVolumeByCountAndPercentage"];
    historicalVolumeByCountAndPercentage = v5->_historicalVolumeByCountAndPercentage;
    v5->_historicalVolumeByCountAndPercentage = (ATXNotificationVolumeByCountAndPercentage *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeConditionedHistoricalVolumeByCountAndPercentage"];
    modeConditionedHistoricalVolumeByCountAndPercentage = v5->_modeConditionedHistoricalVolumeByCountAndPercentage;
    v5->_modeConditionedHistoricalVolumeByCountAndPercentage = (ATXNotificationVolumeByCountAndPercentage *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historicalResolutionByPercentage"];
    historicalResolutionByPercentage = v5->_historicalResolutionByPercentage;
    v5->_historicalResolutionByPercentage = (ATXNotificationResolutionByPercentage *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeConditionedHistoricalResolutionByPercentage"];
    modeConditionedHistoricalResolutionByPercentage = v5->_modeConditionedHistoricalResolutionByPercentage;
    v5->_modeConditionedHistoricalResolutionByPercentage = (ATXNotificationResolutionByPercentage *)v26;
  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int64_t)notificationDeliveryUrgency
{
  return self->_notificationDeliveryUrgency;
}

- (unint64_t)contactRelationships
{
  return self->_contactRelationships;
}

- (NSArray)relationshipsFromMegadome
{
  return self->_relationshipsFromMegadome;
}

- (unint64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
}

- (int)locationSemantic
{
  return self->_locationSemantic;
}

- (double)appModeAffinityScore
{
  return self->_appModeAffinityScore;
}

- (double)contactModeAffinityScore
{
  return self->_contactModeAffinityScore;
}

- (double)notificationModeAffinityScore
{
  return self->_notificationModeAffinityScore;
}

- (double)appCategoryScoreInMode
{
  return self->_appCategoryScoreInMode;
}

- (double)urgencyScore
{
  return self->_urgencyScore;
}

- (double)importanceScore
{
  return self->_importanceScore;
}

- (unint64_t)bucketizedLengthOfNotificationBody
{
  return self->_bucketizedLengthOfNotificationBody;
}

- (unint64_t)currentUnifiedMode
{
  return self->_currentUnifiedMode;
}

- (unint64_t)timeToLaunchApp
{
  return self->_timeToLaunchApp;
}

- (ATXNotificationVolumeByCountAndPercentage)historicalVolumeByCountAndPercentage
{
  return self->_historicalVolumeByCountAndPercentage;
}

- (ATXNotificationVolumeByCountAndPercentage)modeConditionedHistoricalVolumeByCountAndPercentage
{
  return self->_modeConditionedHistoricalVolumeByCountAndPercentage;
}

- (ATXNotificationResolutionByPercentage)historicalResolutionByPercentage
{
  return self->_historicalResolutionByPercentage;
}

- (ATXNotificationResolutionByPercentage)modeConditionedHistoricalResolutionByPercentage
{
  return self->_modeConditionedHistoricalResolutionByPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConditionedHistoricalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_historicalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_modeConditionedHistoricalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_historicalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_relationshipsFromMegadome, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end