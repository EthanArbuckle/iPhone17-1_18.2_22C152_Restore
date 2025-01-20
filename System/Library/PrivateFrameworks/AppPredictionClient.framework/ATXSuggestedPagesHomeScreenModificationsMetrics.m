@interface ATXSuggestedPagesHomeScreenModificationsMetrics
- (BOOL)isSuggestedWidget;
- (NSString)appBundleId;
- (NSString)eventType;
- (NSString)suggestedPageType;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (NSString)widgetSize;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (id)metricsSourceToStringWithSource:(int)a3;
- (int)source;
- (void)logToCoreAnalytics;
- (void)setAppBundleId:(id)a3;
- (void)setEventType:(id)a3;
- (void)setIsSuggestedWidget:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)setSuggestedPageType:(id)a3;
- (void)setWidgetBundleId:(id)a3;
- (void)setWidgetKind:(id)a3;
- (void)setWidgetSize:(id)a3;
@end

@implementation ATXSuggestedPagesHomeScreenModificationsMetrics

- (id)metricName
{
  return @"com.apple.ModeConfiguration.SuggestedPagesHomeScreenConfiguration";
}

- (id)coreAnalyticsDictionary
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v27[0] = @"suggestedPageType";
  uint64_t v3 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self suggestedPageType];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = @"eventType";
  uint64_t v5 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self eventType];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = @"widgetBundleId";
  uint64_t v7 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetBundleId];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = @"widgetKind";
  uint64_t v9 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetKind];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = @"appBundleId";
  uint64_t v11 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self appBundleId];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = v4;
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = @"widgetSize";
  v13 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetSize];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v14;
  v27[6] = @"isSuggestedWidget";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXSuggestedPagesHomeScreenModificationsMetrics isSuggestedWidget](self, "isSuggestedWidget"));
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"source";
  v17 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self metricsSourceToStringWithSource:[(ATXSuggestedPagesHomeScreenModificationsMetrics *)self source]];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (!v17) {

  }
  if (!v15) {
  if (!v13)
  }

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (!v26) {

  }
  return v25;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self suggestedPageType];
  uint64_t v5 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self eventType];
  v6 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetBundleId];
  uint64_t v7 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetKind];
  v8 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self appBundleId];
  uint64_t v9 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self widgetSize];
  v10 = [v3 stringWithFormat:@"ATXSuggestedPagesHomeScreenModificationsMetrics\nsuggestedPageType:%@\neventType:%@\nwidgetBundleId%@\nwidgetKind:%@\nappBundleId:%@\nwidgetSize:%@\nisSuggestedWidget:%d", v4, v5, v6, v7, v8, v9, -[ATXSuggestedPagesHomeScreenModificationsMetrics isSuggestedWidget](self, "isSuggestedWidget")];

  return v10;
}

- (id)metricsSourceToStringWithSource:(int)a3
{
  if (a3 == 1) {
    return @"HomeScreen";
  }
  else {
    return @"Setup";
  }
}

- (void)logToCoreAnalytics
{
  id v4 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self metricName];
  uint64_t v3 = [(ATXSuggestedPagesHomeScreenModificationsMetrics *)self coreAnalyticsDictionary];
  AnalyticsSendEvent();
}

- (NSString)suggestedPageType
{
  return self->_suggestedPageType;
}

- (void)setSuggestedPageType:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)widgetSize
{
  return self->_widgetSize;
}

- (void)setWidgetSize:(id)a3
{
}

- (BOOL)isSuggestedWidget
{
  return self->_isSuggestedWidget;
}

- (void)setIsSuggestedWidget:(BOOL)a3
{
  self->_isSuggestedWidget = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSize, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_suggestedPageType, 0);
}

@end