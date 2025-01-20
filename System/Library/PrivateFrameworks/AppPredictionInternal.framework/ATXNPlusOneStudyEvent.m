@interface ATXNPlusOneStudyEvent
- (ATXNPlusOneStudyAppLaunchCounts)appLaunchCounts;
- (BOOL)appPushNotificationEnabled;
- (BOOL)widgetExistsOnScreen;
- (NSString)appBundleId;
- (NSString)extensionBundleId;
- (NSString)widgetKind;
- (double)appLaunchPopularity;
- (id)coreAnalyticsEvent;
- (int64_t)suggestionCountInfoHeuristicHigh;
- (int64_t)suggestionCountInfoHeuristicLow;
- (int64_t)suggestionCountInfoHeuristicMed;
- (int64_t)suggestionCountRelevantShortcut;
- (int64_t)suggestionCountShortcutConversionHigh;
- (int64_t)suggestionCountShortcutConversionLow;
- (int64_t)suggestionCountShortcutConversionMed;
- (unint64_t)appScreenTimeCategory;
- (void)setAppBundleId:(id)a3;
- (void)setAppLaunchCounts:(id)a3;
- (void)setAppLaunchPopularity:(double)a3;
- (void)setAppPushNotificationEnabled:(BOOL)a3;
- (void)setAppScreenTimeCategory:(unint64_t)a3;
- (void)setExtensionBundleId:(id)a3;
- (void)setSuggestionCountInfoHeuristicHigh:(int64_t)a3;
- (void)setSuggestionCountInfoHeuristicLow:(int64_t)a3;
- (void)setSuggestionCountInfoHeuristicMed:(int64_t)a3;
- (void)setSuggestionCountRelevantShortcut:(int64_t)a3;
- (void)setSuggestionCountShortcutConversionHigh:(int64_t)a3;
- (void)setSuggestionCountShortcutConversionLow:(int64_t)a3;
- (void)setSuggestionCountShortcutConversionMed:(int64_t)a3;
- (void)setWidgetExistsOnScreen:(BOOL)a3;
- (void)setWidgetKind:(id)a3;
@end

@implementation ATXNPlusOneStudyEvent

- (id)coreAnalyticsEvent
{
  v35[18] = *MEMORY[0x1E4F143B8];
  v34[0] = @"extensionBundleId";
  v33 = [(ATXNPlusOneStudyEvent *)self extensionBundleId];
  v35[0] = v33;
  v34[1] = @"widgetKind";
  v32 = [(ATXNPlusOneStudyEvent *)self widgetKind];
  v35[1] = v32;
  v34[2] = @"widgetExistsOnScreen";
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXNPlusOneStudyEvent widgetExistsOnScreen](self, "widgetExistsOnScreen"));
  v35[2] = v31;
  v34[3] = @"appPushNotificationEnabled";
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXNPlusOneStudyEvent appPushNotificationEnabled](self, "appPushNotificationEnabled"));
  v35[3] = v30;
  v34[4] = @"appLaunchPopularity";
  v3 = NSNumber;
  [(ATXNPlusOneStudyEvent *)self appLaunchPopularity];
  v29 = objc_msgSend(v3, "numberWithDouble:");
  v35[4] = v29;
  v34[5] = @"appScreenTimeCategory";
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXNPlusOneStudyEvent appScreenTimeCategory](self, "appScreenTimeCategory"));
  v35[5] = v28;
  v34[6] = @"numAppLaunchPastDay";
  v4 = NSNumber;
  v27 = [(ATXNPlusOneStudyEvent *)self appLaunchCounts];
  v26 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v27, "numAppLaunchPastDay"));
  v35[6] = v26;
  v34[7] = @"numAppLaunchPast3Day";
  v5 = NSNumber;
  v25 = [(ATXNPlusOneStudyEvent *)self appLaunchCounts];
  v24 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v25, "numAppLaunchPast3Day"));
  v35[7] = v24;
  v34[8] = @"numAppLaunchPast7Day";
  v6 = NSNumber;
  v23 = [(ATXNPlusOneStudyEvent *)self appLaunchCounts];
  v22 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v23, "numAppLaunchPast7Day"));
  v35[8] = v22;
  v34[9] = @"numAppLaunchPast14Day";
  v7 = NSNumber;
  v21 = [(ATXNPlusOneStudyEvent *)self appLaunchCounts];
  v20 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v21, "numAppLaunchPast14Day"));
  v35[9] = v20;
  v34[10] = @"numAppLaunchPast28Day";
  v8 = NSNumber;
  v9 = [(ATXNPlusOneStudyEvent *)self appLaunchCounts];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "numAppLaunchPast28Day"));
  v35[10] = v10;
  v34[11] = @"suggestionCountInfoHeuristic";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicHigh](self, "suggestionCountInfoHeuristicHigh"));
  v35[11] = v11;
  v34[12] = @"suggestionCountInfoHeuristicMED";
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicMed](self, "suggestionCountInfoHeuristicMed"));
  v35[12] = v12;
  v34[13] = @"suggestionCountInfoHeuristicLOW";
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicLow](self, "suggestionCountInfoHeuristicLow"));
  v35[13] = v13;
  v34[14] = @"suggestionCountRelevantShortcut";
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountRelevantShortcut](self, "suggestionCountRelevantShortcut"));
  v35[14] = v14;
  v34[15] = @"suggestionCountShortcutConversion";
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionHigh](self, "suggestionCountShortcutConversionHigh"));
  v35[15] = v15;
  v34[16] = @"suggestionCountShortcutConversionMED";
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionMed](self, "suggestionCountShortcutConversionMed"));
  v35[16] = v16;
  v34[17] = @"suggestionCountShortcutConversionLOW";
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionLow](self, "suggestionCountShortcutConversionLow"));
  v35[17] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:18];

  return v18;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (BOOL)widgetExistsOnScreen
{
  return self->_widgetExistsOnScreen;
}

- (void)setWidgetExistsOnScreen:(BOOL)a3
{
  self->_widgetExistsOnScreen = a3;
}

- (BOOL)appPushNotificationEnabled
{
  return self->_appPushNotificationEnabled;
}

- (void)setAppPushNotificationEnabled:(BOOL)a3
{
  self->_appPushNotificationEnabled = a3;
}

- (double)appLaunchPopularity
{
  return self->_appLaunchPopularity;
}

- (void)setAppLaunchPopularity:(double)a3
{
  self->_appLaunchPopularity = a3;
}

- (unint64_t)appScreenTimeCategory
{
  return self->_appScreenTimeCategory;
}

- (void)setAppScreenTimeCategory:(unint64_t)a3
{
  self->_appScreenTimeCategory = a3;
}

- (ATXNPlusOneStudyAppLaunchCounts)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (void)setAppLaunchCounts:(id)a3
{
}

- (int64_t)suggestionCountInfoHeuristicHigh
{
  return self->_suggestionCountInfoHeuristicHigh;
}

- (void)setSuggestionCountInfoHeuristicHigh:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicHigh = a3;
}

- (int64_t)suggestionCountInfoHeuristicMed
{
  return self->_suggestionCountInfoHeuristicMed;
}

- (void)setSuggestionCountInfoHeuristicMed:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicMed = a3;
}

- (int64_t)suggestionCountInfoHeuristicLow
{
  return self->_suggestionCountInfoHeuristicLow;
}

- (void)setSuggestionCountInfoHeuristicLow:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicLow = a3;
}

- (int64_t)suggestionCountRelevantShortcut
{
  return self->_suggestionCountRelevantShortcut;
}

- (void)setSuggestionCountRelevantShortcut:(int64_t)a3
{
  self->_suggestionCountRelevantShortcut = a3;
}

- (int64_t)suggestionCountShortcutConversionHigh
{
  return self->_suggestionCountShortcutConversionHigh;
}

- (void)setSuggestionCountShortcutConversionHigh:(int64_t)a3
{
  self->_suggestionCountShortcutConversionHigh = a3;
}

- (int64_t)suggestionCountShortcutConversionMed
{
  return self->_suggestionCountShortcutConversionMed;
}

- (void)setSuggestionCountShortcutConversionMed:(int64_t)a3
{
  self->_suggestionCountShortcutConversionMed = a3;
}

- (int64_t)suggestionCountShortcutConversionLow
{
  return self->_suggestionCountShortcutConversionLow;
}

- (void)setSuggestionCountShortcutConversionLow:(int64_t)a3
{
  self->_suggestionCountShortcutConversionLow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end