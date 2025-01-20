@interface HMDMemoryLogEvent
- (HMDMemoryLogEvent)init;
- (HMDMemoryLogEvent)initWithReason:(int64_t)a3 currentMemoryUsage:(unint64_t)a4 intervalMaxMemoryUsage:(unint64_t)a5;
- (int64_t)reason;
- (unint64_t)currentMemoryUsage;
- (unint64_t)intervalMaxMemoryUsage;
- (void)updateDiagnosticReportSignature:(id)a3;
@end

@implementation HMDMemoryLogEvent

- (unint64_t)intervalMaxMemoryUsage
{
  return self->_intervalMaxMemoryUsage;
}

- (unint64_t)currentMemoryUsage
{
  return self->_currentMemoryUsage;
}

- (int64_t)reason
{
  return self->_reason;
}

- (HMDMemoryLogEvent)initWithReason:(int64_t)a3 currentMemoryUsage:(unint64_t)a4 intervalMaxMemoryUsage:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMemoryLogEvent;
  result = [(HMMLogEvent *)&v9 init];
  if (result)
  {
    result->_reason = a3;
    result->_currentMemoryUsage = a4;
    result->_intervalMaxMemoryUsage = a5;
  }
  return result;
}

- (HMDMemoryLogEvent)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  id v7 = a3;
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "setDouble:forKey:", @"HMDDiagnosticReporterMemoryEventReportTime");

  if ([(HMDMemoryLogEvent *)self currentMemoryUsage] <= 0x5000000) {
    v5 = @"Memory Usage Warning Threshold";
  }
  else {
    v5 = @"Memory Usage Critical Threshold";
  }
  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F7C190]];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lld,%lld", -[HMDMemoryLogEvent currentMemoryUsage](self, "currentMemoryUsage"), -[HMDMemoryLogEvent intervalMaxMemoryUsage](self, "intervalMaxMemoryUsage"));
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F7C198]];
}

@end