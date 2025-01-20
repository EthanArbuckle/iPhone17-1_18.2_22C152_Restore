@interface ATXLockscreenSummaryMetric
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)editingUiExperienced;
- (void)setEditingUiExperienced:(unint64_t)a3;
@end

@implementation ATXLockscreenSummaryMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.Summary";
}

- (id)coreAnalyticsDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"editingUiExperienced";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenSummaryMetric editingUiExperienced](self, "editingUiExperienced"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (unint64_t)editingUiExperienced
{
  return self->_editingUiExperienced;
}

- (void)setEditingUiExperienced:(unint64_t)a3
{
  self->_editingUiExperienced = a3;
}

@end