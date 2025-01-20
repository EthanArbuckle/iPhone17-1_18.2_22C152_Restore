@interface ATXAppSessionEventMetric
- (ATXAppSessionEventMetric)initWithDimensions:(id)a3 bundleId:(id)a4 interruptingAppBundleId:(id)a5 duration:(double)a6;
- (NSNumber)appCategory;
- (NSNumber)interruptingAppCategory;
- (NSString)appBundleId;
- (NSString)interruptingAppBundleId;
- (double)appSessionDuration;
- (id)coreAnalyticsDictionary;
- (id)metricName;
@end

@implementation ATXAppSessionEventMetric

- (id)metricName
{
  return @"com.apple.ModeActivity.AppSession.event";
}

- (ATXAppSessionEventMetric)initWithDimensions:(id)a3 bundleId:(id)a4 interruptingAppBundleId:(id)a5 duration:(double)a6
{
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXAppSessionEventMetric;
  v13 = [(_ATXCoreAnalyticsMetric *)&v21 initWithDimensions:a3];
  v14 = v13;
  if (v13)
  {
    p_appBundleId = &v13->_appBundleId;
    objc_storeStrong((id *)&v13->_appBundleId, a4);
    objc_storeStrong((id *)&v14->_interruptingAppBundleId, a5);
    if (*p_appBundleId)
    {
      uint64_t v16 = +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:");
      appCategory = v14->_appCategory;
      v14->_appCategory = (NSNumber *)v16;
    }
    if (v14->_interruptingAppBundleId)
    {
      uint64_t v18 = +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:");
      interruptingAppCategory = v14->_interruptingAppCategory;
      v14->_interruptingAppCategory = (NSNumber *)v18;
    }
    v14->_appSessionDuration = a6;
  }

  return v14;
}

- (id)coreAnalyticsDictionary
{
  v16[5] = *MEMORY[0x1E4F143B8];
  v15[0] = @"appBundleId";
  v3 = [(ATXAppSessionEventMetric *)self appBundleId];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v4;
  v15[1] = @"appCategory";
  v5 = [(ATXAppSessionEventMetric *)self appCategory];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v6;
  v15[2] = @"interruptingAppBundleId";
  v7 = [(ATXAppSessionEventMetric *)self interruptingAppBundleId];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v8;
  v15[3] = @"interruptingAppCategory";
  v9 = [(ATXAppSessionEventMetric *)self interruptingAppCategory];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v10;
  v15[4] = @"duration";
  id v11 = NSNumber;
  [(ATXAppSessionEventMetric *)self appSessionDuration];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  v16[4] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];

  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v3)
  }

  return v13;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSNumber)appCategory
{
  return self->_appCategory;
}

- (NSString)interruptingAppBundleId
{
  return self->_interruptingAppBundleId;
}

- (NSNumber)interruptingAppCategory
{
  return self->_interruptingAppCategory;
}

- (double)appSessionDuration
{
  return self->_appSessionDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingAppCategory, 0);
  objc_storeStrong((id *)&self->_interruptingAppBundleId, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end