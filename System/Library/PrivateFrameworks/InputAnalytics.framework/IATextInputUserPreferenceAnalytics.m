@interface IATextInputUserPreferenceAnalytics
- (IATextInputUserPreferenceAnalytics)init;
- (IATextInputUserPreferenceAnalytics)initWithEventHandler:(id)a3;
- (void)reportStateForUserPreference:(int64_t)a3;
- (void)reportStateForUserPreferences:(id)a3;
@end

@implementation IATextInputUserPreferenceAnalytics

- (IATextInputUserPreferenceAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)IATextInputUserPreferenceAnalytics;
  return [(IATextInputUserPreferenceAnalytics *)&v3 init];
}

- (IATextInputUserPreferenceAnalytics)initWithEventHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IATextInputUserPreferenceAnalytics;
  return [(IATextInputUserPreferenceAnalytics *)&v4 init];
}

- (void)reportStateForUserPreference:(int64_t)a3
{
  objc_super v3 = sub_252A05AEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_252A12128(v3);
  }
}

- (void)reportStateForUserPreferences:(id)a3
{
  objc_super v3 = sub_252A05AEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_252A1216C(v3);
  }
}

@end