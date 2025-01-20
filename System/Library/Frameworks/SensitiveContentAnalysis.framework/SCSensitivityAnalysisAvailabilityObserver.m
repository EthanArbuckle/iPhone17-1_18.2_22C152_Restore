@interface SCSensitivityAnalysisAvailabilityObserver
- (SCSensitivityAnalysisAvailabilityObserver)initWithSubscription:(id)a3;
- (void)cancel;
@end

@implementation SCSensitivityAnalysisAvailabilityObserver

- (SCSensitivityAnalysisAvailabilityObserver)initWithSubscription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSensitivityAnalysisAvailabilityObserver;
  v6 = [(SCSensitivityAnalysisAvailabilityObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscription, a3);
  }

  return v7;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end