@interface HMDRemoteMessageExceedBudgetLogEvent
+ (id)eventWithBudgetRate:(_HMFRate)a3;
- (HMDRemoteMessageExceedBudgetLogEvent)initWithBudgetRate:(_HMFRate)a3;
- (_HMFRate)budgetRate;
- (void)updateDiagnosticReportSignature:(id)a3;
@end

@implementation HMDRemoteMessageExceedBudgetLogEvent

- (_HMFRate)budgetRate
{
  p_budgetRate = &self->_budgetRate;
  unint64_t value = self->_budgetRate.value;
  double period = p_budgetRate->period;
  result.double period = period;
  result.unint64_t value = value;
  return result;
}

- (HMDRemoteMessageExceedBudgetLogEvent)initWithBudgetRate:(_HMFRate)a3
{
  double period = a3.period;
  unint64_t value = a3.value;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteMessageExceedBudgetLogEvent;
  _HMFRate result = [(HMMLogEvent *)&v6 init];
  if (result)
  {
    result->_budgetRate.unint64_t value = value;
    result->_budgetRate.double period = period;
  }
  return result;
}

+ (id)eventWithBudgetRate:(_HMFRate)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithBudgetRate:", a3.value, *(void *)&a3.period);
  return v3;
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FA8CB8];
  id v5 = a3;
  [v5 setObject:@"Remote Send Threshold" forKeyedSubscript:v4];
  objc_super v6 = NSString;
  uint64_t v7 = [(HMDRemoteMessageExceedBudgetLogEvent *)self budgetRate];
  [(HMDRemoteMessageExceedBudgetLogEvent *)self budgetRate];
  objc_msgSend(v6, "stringWithFormat:", @"%tu,%u", v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FA8CC0]];
}

@end