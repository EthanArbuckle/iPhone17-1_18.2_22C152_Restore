@interface GKOnboardingMetricsHandler
- (GKOnboardingMetricsHandler)initWithReporter:(id)a3 refApp:(id)a4;
- (GKReporter)reporter;
- (NSString)refApp;
- (double)analyticsStartTime;
- (void)onboardingDidBegin;
- (void)onboardingDidEnd;
- (void)reportEventForOnboardingFlowAction:(unint64_t)a3;
- (void)setAnalyticsStartTime:(double)a3;
- (void)setRefApp:(id)a3;
- (void)setReporter:(id)a3;
@end

@implementation GKOnboardingMetricsHandler

- (GKOnboardingMetricsHandler)initWithReporter:(id)a3 refApp:(id)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKOnboardingMetricsHandler;
  v6 = [(GKOnboardingMetricsHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    [(GKOnboardingMetricsHandler *)v6 setReporter:v5];
  }

  return v7;
}

- (void)onboardingDidBegin
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKOnboardingMetricsHandler *)self setAnalyticsStartTime:Current];
}

- (void)onboardingDidEnd
{
  id v7 = [(GKOnboardingMetricsHandler *)self reporter];
  uint64_t v3 = *MEMORY[0x1E4F635B0];
  [(GKOnboardingMetricsHandler *)self analyticsStartTime];
  double v5 = v4;
  v6 = [(GKOnboardingMetricsHandler *)self refApp];
  [v7 reportOnboardingEventForType:v3 withStartTimestamp:v6 refApp:v5];
}

- (void)reportEventForOnboardingFlowAction:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = (void *)*MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    id v7 = NSNumber;
    v8 = v6;
    objc_super v9 = [v7 numberWithUnsignedInteger:a3];
    int v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "Onboarding flow finished with action %@", (uint8_t *)&v14, 0xCu);
  }
  v10 = [(GKOnboardingMetricsHandler *)self reporter];
  uint64_t v11 = *MEMORY[0x1E4F63568];
  [v10 reportEvent:*MEMORY[0x1E4F63568] type:*MEMORY[0x1E4F635A0]];

  if (a3 <= 9)
  {
    v12 = (void *)qword_1E5F65C88[a3];
    v13 = [(GKOnboardingMetricsHandler *)self reporter];
    [v13 reportEvent:v11 type:*v12];
  }
}

- (double)analyticsStartTime
{
  return self->_analyticsStartTime;
}

- (void)setAnalyticsStartTime:(double)a3
{
  self->_analyticsStartTime = a3;
}

- (GKReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (NSString)refApp
{
  return self->_refApp;
}

- (void)setRefApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refApp, 0);

  objc_storeStrong((id *)&self->_reporter, 0);
}

@end