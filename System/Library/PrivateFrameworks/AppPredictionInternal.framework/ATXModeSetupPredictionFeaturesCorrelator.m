@interface ATXModeSetupPredictionFeaturesCorrelator
- (ATXModeSetupPredictionFeaturesCorrelator)initWithMode:(unint64_t)a3 features:(id)a4;
- (BOOL)isDigestCurrentlyEnabled;
- (id)featureVector;
- (unint64_t)globalPosterConfigurationsCount;
- (void)createFeatureVectorWithModeSetupPredictionFeatures;
@end

@implementation ATXModeSetupPredictionFeaturesCorrelator

- (ATXModeSetupPredictionFeaturesCorrelator)initWithMode:(unint64_t)a3 features:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXModeSetupPredictionFeaturesCorrelator;
  v8 = [(ATXModeSetupPredictionFeaturesCorrelator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    objc_storeStrong((id *)&v8->_modeSetupPredictionFeatures, a4);
  }

  return v9;
}

- (void)createFeatureVectorWithModeSetupPredictionFeatures
{
  v42 = [[ATXAppSessionInterruptionsProvider alloc] initWithLastNDays:7];
  v3 = objc_opt_new();
  v4 = [[ATXModeInferredDurationAndCountProvider alloc] initWithLastNDays:7];
  v5 = [[ATXNotificationsEventProvider alloc] initWithLastNDays:7];
  v6 = [[ATXAppLaunchProvider alloc] initWithLastNDays:7];
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setIsDigestCurrentlyEnabled:[(ATXModeSetupPredictionFeaturesCorrelator *)self isDigestCurrentlyEnabled]];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "globalAllPagesFolderCount"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalAllPagesFolderCount:v7];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "globalAllPagesWidgetCount"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalAllPagesWidgetCount:v8];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "homePageFolderCountBucket"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setHomePageFolderCountBucket:v9];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "homePageWidgetCountBucket"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setHomePageWidgetCountBucket:v10];

  objc_super v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppLaunchProvider globalAppLaunchCountWithinLastNDays](v6, "globalAppLaunchCountWithinLastNDays"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalAppLaunchCountWithinLastNDays:v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppLaunchProvider globalAppLaunchCountWithinLast1Day](v6, "globalAppLaunchCountWithinLast1Day"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalAppLaunchCountWithinLast1Day:v12];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppLaunchProvider modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:](v6, "modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDaysForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:v13];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppLaunchProvider modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:](v6, "modeAppLaunchCountBasedOnGlobalPriorsWithinLast1DayForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:v14];

  v15 = NSNumber;
  [(ATXModeInferredDurationAndCountProvider *)v4 modeInferredDurationInLastNDaysForMode:self->_mode];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInferredDurationInLastNDays:v16];

  v17 = NSNumber;
  [(ATXModeInferredDurationAndCountProvider *)v4 modeInferredDurationInLast1DayForMode:self->_mode];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInferredDurationInLast1Day:v18];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeInferredDurationAndCountProvider modeInferredCountInLastNDaysForMode:](v4, "modeInferredCountInLastNDaysForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInferredCountInLastNDays:v19];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeInferredDurationAndCountProvider modeInferredCountInLast1DayForMode:](v4, "modeInferredCountInLast1DayForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInferredCountInLast1Day:v20];

  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsClearedWithinLastNDaysForMode:](v5, "modeCountOfNotificationsClearedWithinLastNDaysForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeCountOfNotificationsClearedWithinLastNDays:v21];

  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsClearedWithinLast1DayForMode:](v5, "modeCountOfNotificationsClearedWithinLast1DayForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeCountOfNotificationsClearedWithinLast1Day:v22];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsClearedWithinLastNDays](v5, "globalCountOfNotificationsClearedWithinLastNDays"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalCountOfNotificationsClearedWithinLastNDays:v23];

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsClearedWithinLast1Day](v5, "globalCountOfNotificationsClearedWithinLast1Day"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalCountOfNotificationsClearedWithinLast1Day:v24];

  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsReceivedWithinLastNDaysForMode:](v5, "modeCountOfNotificationsReceivedWithinLastNDaysForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeCountOfNotificationsReceivedWithinLastNDays:v25];

  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider modeCountOfNotificationsReceivedWithinLast1DayForMode:](v5, "modeCountOfNotificationsReceivedWithinLast1DayForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeCountOfNotificationsReceivedWithinLast1Day:v26];

  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsReceivedWithinLastNDays](v5, "globalCountOfNotificationsReceivedWithinLastNDays"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalCountOfNotificationsReceivedWithinLastNDays:v27];

  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationsEventProvider globalCountOfNotificationsReceivedWithinLast1Day](v5, "globalCountOfNotificationsReceivedWithinLast1Day"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalCountOfNotificationsReceivedWithinLast1Day:v28];

  v29 = NSNumber;
  [(ATXAppLaunchProvider *)v6 modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDaysForMode:self->_mode];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:v30];

  v31 = NSNumber;
  [(ATXAppLaunchProvider *)v6 modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1DayForMode:self->_mode];
  v32 = objc_msgSend(v31, "numberWithDouble:");
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:v32];

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeSetupPredictionFeaturesCorrelator globalPosterConfigurationsCount](self, "globalPosterConfigurationsCount"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalPosterConfigurationsCount:v33];

  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider globalInterruptedAppSessionsCountWithinLastNDays](v42, "globalInterruptedAppSessionsCountWithinLastNDays"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalInterruptedAppSessionsCountWithinLastNDays:v34];

  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider globalInterruptedAppSessionsCountWithinLast1Day](v42, "globalInterruptedAppSessionsCountWithinLast1Day"));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setGlobalInterruptedAppSessionsCountWithinLast1Day:v35];

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeInterruptedAppSessionsCountWithinLastNDaysForMode:](v42, "modeInterruptedAppSessionsCountWithinLastNDaysForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInterruptedAppSessionsCountWithinLastNDays:v36];

  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeInterruptedAppSessionsCountWithinLast1DayForMode:](v42, "modeInterruptedAppSessionsCountWithinLast1DayForMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeInterruptedAppSessionsCountWithinLast1Day:v37];

  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:](v42, "modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:v38];

  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:](v42, "modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:v39];

  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:](v42, "modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:v40];

  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppSessionInterruptionsProvider modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:](v42, "modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:", self->_mode));
  [(ATXModeSetupPredictionFeatures *)self->_modeSetupPredictionFeatures setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:v41];
}

- (unint64_t)globalPosterConfigurationsCount
{
  v2 = +[ATXPosterConfigurationCache sharedInstance];
  v3 = [v2 configurations];

  if ((unint64_t)[v3 count] <= 0xA) {
    unint64_t v4 = [v3 count];
  }
  else {
    unint64_t v4 = 10;
  }

  return v4;
}

- (BOOL)isDigestCurrentlyEnabled
{
  v2 = objc_opt_new();
  char v3 = [v2 digestSetupComplete];

  return v3;
}

- (id)featureVector
{
  [(ATXModeSetupPredictionFeaturesCorrelator *)self createFeatureVectorWithModeSetupPredictionFeatures];
  modeSetupPredictionFeatures = self->_modeSetupPredictionFeatures;
  return [(ATXModeSetupPredictionFeatures *)modeSetupPredictionFeatures jsonRepresentation];
}

- (void).cxx_destruct
{
}

@end