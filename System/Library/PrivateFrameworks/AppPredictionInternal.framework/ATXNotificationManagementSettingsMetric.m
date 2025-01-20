@interface ATXNotificationManagementSettingsMetric
- (BOOL)hasOfferedDigest;
- (BOOL)hasSetupDigest;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (unint64_t)numConfiguredModes;
- (unint64_t)numDailyDigests;
- (unint64_t)numDigestApps;
- (void)setHasOfferedDigest:(BOOL)a3;
- (void)setHasSetupDigest:(BOOL)a3;
- (void)setNumConfiguredModes:(unint64_t)a3;
- (void)setNumDailyDigests:(unint64_t)a3;
- (void)setNumDigestApps:(unint64_t)a3;
@end

@implementation ATXNotificationManagementSettingsMetric

- (id)metricName
{
  return @"com.apple.NotificationManagement.Settings";
}

- (id)coreAnalyticsDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"numDailyDigests";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numDailyDigests](self, "numDailyDigests"));
  v11[0] = v3;
  v10[1] = @"numDigestApps";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numDigestApps](self, "numDigestApps"));
  v11[1] = v4;
  v10[2] = @"numConfiguredModes";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNotificationManagementSettingsMetric numConfiguredModes](self, "numConfiguredModes"));
  v11[2] = v5;
  v10[3] = @"hasOfferedDigest";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXNotificationManagementSettingsMetric hasOfferedDigest](self, "hasOfferedDigest"));
  v11[3] = v6;
  v10[4] = @"hasSetupDigest";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXNotificationManagementSettingsMetric hasSetupDigest](self, "hasSetupDigest"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"ATXNotificationManagementSettingsMetric numDailyDigests:%lu\nnumDigestApps:%lu\nnumConfiguredModes:%lu\nhasOfferedDigest:%d\nhasSetupDigest:%d", -[ATXNotificationManagementSettingsMetric numDailyDigests](self, "numDailyDigests"), -[ATXNotificationManagementSettingsMetric numDigestApps](self, "numDigestApps"), -[ATXNotificationManagementSettingsMetric numConfiguredModes](self, "numConfiguredModes"), -[ATXNotificationManagementSettingsMetric hasOfferedDigest](self, "hasOfferedDigest"), -[ATXNotificationManagementSettingsMetric hasSetupDigest](self, "hasSetupDigest"));
}

- (unint64_t)numDailyDigests
{
  return self->_numDailyDigests;
}

- (void)setNumDailyDigests:(unint64_t)a3
{
  self->_numDailyDigests = a3;
}

- (unint64_t)numDigestApps
{
  return self->_numDigestApps;
}

- (void)setNumDigestApps:(unint64_t)a3
{
  self->_numDigestApps = a3;
}

- (unint64_t)numConfiguredModes
{
  return self->_numConfiguredModes;
}

- (void)setNumConfiguredModes:(unint64_t)a3
{
  self->_numConfiguredModes = a3;
}

- (BOOL)hasOfferedDigest
{
  return self->_hasOfferedDigest;
}

- (void)setHasOfferedDigest:(BOOL)a3
{
  self->_hasOfferedDigest = a3;
}

- (BOOL)hasSetupDigest
{
  return self->_hasSetupDigest;
}

- (void)setHasSetupDigest:(BOOL)a3
{
  self->_hasSetupDigest = a3;
}

@end