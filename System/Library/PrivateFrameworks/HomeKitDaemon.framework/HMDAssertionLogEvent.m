@interface HMDAssertionLogEvent
- (HMDAssertionLogEvent)initWithReason:(id)a3;
- (NSString)reason;
- (id)description;
- (void)updateDiagnosticReportSignature:(id)a3;
@end

@implementation HMDAssertionLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)description
{
  return objc_getProperty(self, a2, 40, 1);
}

- (HMDAssertionLogEvent)initWithReason:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAssertionLogEvent;
  v5 = [(HMMLogEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [[NSString alloc] initWithFormat:v4 arguments:&v12];
    description = v5->_description;
    v5->_description = (NSString *)v8;
  }
  return v5;
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAssertionLogEvent *)self reason];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F7C190]];

  id v6 = [(HMDAssertionLogEvent *)self description];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F7C170]];
}

@end