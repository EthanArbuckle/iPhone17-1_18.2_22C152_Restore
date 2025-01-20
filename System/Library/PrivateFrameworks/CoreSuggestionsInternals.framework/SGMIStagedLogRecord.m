@interface SGMIStagedLogRecord
- (BOOL)isLogged;
- (SGMIMetricsMailIntelligenceForMessage)log;
- (SGMIStagedLogRecord)initWithLog:(id)a3 isLogged:(BOOL)a4;
@end

@implementation SGMIStagedLogRecord

- (void).cxx_destruct
{
}

- (BOOL)isLogged
{
  return self->_isLogged;
}

- (SGMIMetricsMailIntelligenceForMessage)log
{
  return (SGMIMetricsMailIntelligenceForMessage *)objc_getProperty(self, a2, 16, 1);
}

- (SGMIStagedLogRecord)initWithLog:(id)a3 isLogged:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGMIStagedLogRecord;
  v8 = [(SGMIStagedLogRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_log, a3);
    v9->_isLogged = a4;
  }

  return v9;
}

@end