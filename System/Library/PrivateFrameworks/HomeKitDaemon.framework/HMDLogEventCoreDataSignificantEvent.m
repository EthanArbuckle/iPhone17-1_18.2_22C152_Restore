@interface HMDLogEventCoreDataSignificantEvent
- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3;
- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3 author:(unint64_t)a4;
- (NSString)context;
- (NSString)diagnosticReportEventType;
- (NSString)extraContext;
- (unint64_t)reason;
- (void)setContext:(id)a3;
- (void)setExtraContext:(id)a3;
- (void)updateDiagnosticReportSignature:(id)a3;
@end

@implementation HMDLogEventCoreDataSignificantEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setExtraContext:(id)a3
{
}

- (NSString)extraContext
{
  return self->_extraContext;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3 author:(unint64_t)a4
{
  v5 = [(HMDLogEventCoreDataSignificantEvent *)self initWithReason:a3];
  v6 = v5;
  if (a4 - 2 > 9) {
    v7 = @"HMD.Unknown";
  }
  else {
    v7 = off_264A27760[a4 - 2];
  }
  objc_storeStrong((id *)&v5->_context, v7);

  return v6;
}

- (HMDLogEventCoreDataSignificantEvent)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDLogEventCoreDataSignificantEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

- (NSString)diagnosticReportEventType
{
  return (NSString *)@"CoreData";
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(HMDLogEventCoreDataSignificantEvent *)self reason];
  if (v4 > 4) {
    objc_super v5 = @"Unknown";
  }
  else {
    objc_super v5 = off_264A2F248[v4];
  }
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F7C180]];
  v6 = [(HMDLogEventCoreDataSignificantEvent *)self context];
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F7C190]];
  }
  v7 = [(HMDLogEventCoreDataSignificantEvent *)self extraContext];
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F7C170]];
  }
}

@end