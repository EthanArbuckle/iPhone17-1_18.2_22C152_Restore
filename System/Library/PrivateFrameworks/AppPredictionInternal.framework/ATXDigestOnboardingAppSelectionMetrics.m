@interface ATXDigestOnboardingAppSelectionMetrics
- (BOOL)addedToDigest;
- (BOOL)wasShownInDigestOnboarding;
- (NSString)bundleId;
- (NSString)sessionUUID;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)avgNumBasicNotifications;
- (unint64_t)avgNumMessageNotfications;
- (unint64_t)avgNumTimeSensitiveNonMessageNotifications;
- (unint64_t)rank;
- (void)setAddedToDigest:(BOOL)a3;
- (void)setAvgNumBasicNotifications:(unint64_t)a3;
- (void)setAvgNumMessageNotfications:(unint64_t)a3;
- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setRank:(unint64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setWasShownInDigestOnboarding:(BOOL)a3;
@end

@implementation ATXDigestOnboardingAppSelectionMetrics

- (id)metricName
{
  return @"com.apple.digestSetupFlowEvent.digestAppSelectionEvent";
}

- (id)coreAnalyticsDictionary
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16[0] = @"sessionUUID";
  uint64_t v3 = [(ATXDigestOnboardingAppSelectionMetrics *)self sessionUUID];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v3;
  v16[1] = @"bundleId";
  v5 = [(ATXDigestOnboardingAppSelectionMetrics *)self bundleId];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"basicNotifications";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumBasicNotifications](self, "avgNumBasicNotifications"));
  v17[2] = v7;
  v16[3] = @"messageNotifications";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumMessageNotfications](self, "avgNumMessageNotfications"));
  v17[3] = v8;
  v16[4] = @"timeSensitiveNotifications";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics avgNumTimeSensitiveNonMessageNotifications](self, "avgNumTimeSensitiveNonMessageNotifications"));
  v17[4] = v9;
  v16[5] = @"rank";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestOnboardingAppSelectionMetrics rank](self, "rank"));
  v17[5] = v10;
  v16[6] = @"addedToDigest";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXDigestOnboardingAppSelectionMetrics addedToDigest](self, "addedToDigest"));
  v17[6] = v11;
  v16[7] = @"wasShownInDigest";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXDigestOnboardingAppSelectionMetrics wasShownInDigestOnboarding](self, "wasShownInDigestOnboarding"));
  v17[7] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:8];

  if (!v5) {
  if (!v4)
  }

  return v13;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (unint64_t)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (void)setAvgNumBasicNotifications:(unint64_t)a3
{
  self->_avgNumBasicNotifications = a3;
}

- (unint64_t)avgNumMessageNotfications
{
  return self->_avgNumMessageNotfications;
}

- (void)setAvgNumMessageNotfications:(unint64_t)a3
{
  self->_avgNumMessageNotfications = a3;
}

- (unint64_t)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unint64_t)a3
{
  self->_avgNumTimeSensitiveNonMessageNotifications = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (void)setAddedToDigest:(BOOL)a3
{
  self->_addedToDigest = a3;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void)setWasShownInDigestOnboarding:(BOOL)a3
{
  self->_wasShownInDigestOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end