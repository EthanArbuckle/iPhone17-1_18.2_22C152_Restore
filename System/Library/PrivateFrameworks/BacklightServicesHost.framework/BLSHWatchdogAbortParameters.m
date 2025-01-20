@interface BLSHWatchdogAbortParameters
- (BLSHWatchdogAbortContext)abortContext;
- (BLSHWatchdogAbortParameters)initWithDelegate:(id)a3 abortContext:(id)a4 isPotentialHang:(BOOL)a5 sleepMonitorAggregateState:(id)a6 sleepImminentSinceScheduled:(BOOL)a7 explanation:(id)a8;
- (BLSHWatchdogDelegate)delegate;
- (BOOL)isPotentialHang;
- (BOOL)sleepImminentSinceScheduled;
- (NSString)explanation;
- (SWSystemSleepMonitorAggregateState)sleepMonitorAggregateState;
- (unint64_t)abortTimestamp;
- (void)setAbortContext:(id)a3;
- (void)setAbortTimestamp:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setIsPotentialHang:(BOOL)a3;
- (void)setSleepImminentSinceScheduled:(BOOL)a3;
- (void)setSleepMonitorAggregateState:(id)a3;
@end

@implementation BLSHWatchdogAbortParameters

- (BLSHWatchdogAbortParameters)initWithDelegate:(id)a3 abortContext:(id)a4 isPotentialHang:(BOOL)a5 sleepMonitorAggregateState:(id)a6 sleepImminentSinceScheduled:(BOOL)a7 explanation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BLSHWatchdogAbortParameters;
  v18 = [(BLSHWatchdogAbortParameters *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v14);
    objc_storeStrong((id *)&v19->_abortContext, a4);
    v19->_isPotentialHang = a5;
    objc_storeStrong((id *)&v19->_sleepMonitorAggregateState, a6);
    v19->_sleepImminentSinceScheduled = a7;
    v19->_abortTimestamp = mach_continuous_time();
    uint64_t v20 = [v17 copy];
    explanation = v19->_explanation;
    v19->_explanation = (NSString *)v20;
  }
  return v19;
}

- (BLSHWatchdogDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSHWatchdogDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLSHWatchdogAbortContext)abortContext
{
  return self->_abortContext;
}

- (void)setAbortContext:(id)a3
{
}

- (BOOL)isPotentialHang
{
  return self->_isPotentialHang;
}

- (void)setIsPotentialHang:(BOOL)a3
{
  self->_isPotentialHang = a3;
}

- (SWSystemSleepMonitorAggregateState)sleepMonitorAggregateState
{
  return self->_sleepMonitorAggregateState;
}

- (void)setSleepMonitorAggregateState:(id)a3
{
}

- (BOOL)sleepImminentSinceScheduled
{
  return self->_sleepImminentSinceScheduled;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  self->_sleepImminentSinceScheduled = a3;
}

- (unint64_t)abortTimestamp
{
  return self->_abortTimestamp;
}

- (void)setAbortTimestamp:(unint64_t)a3
{
  self->_abortTimestamp = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_sleepMonitorAggregateState, 0);
  objc_storeStrong((id *)&self->_abortContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end