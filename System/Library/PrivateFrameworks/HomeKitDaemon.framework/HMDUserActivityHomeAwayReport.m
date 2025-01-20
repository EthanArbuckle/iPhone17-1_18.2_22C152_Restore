@interface HMDUserActivityHomeAwayReport
- (BOOL)isAtHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotAtHome;
- (HMDDevice)sourceDevice;
- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6;
- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdatedTimeStamp:(id)a8;
- (id)copyReportWithChangedTimestamp:(id)a3;
- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4;
- (id)initFromMessagePayload:(id)a3 withUser:(id)a4 sourceDevice:(id)a5;
- (id)serializedRemoteMessagePayload;
- (unint64_t)contributorType;
- (unint64_t)state;
- (void)setSourceDevice:(id)a3;
@end

@implementation HMDUserActivityHomeAwayReport

- (void).cxx_destruct
{
}

- (void)setSourceDevice:(id)a3
{
}

- (HMDDevice)sourceDevice
{
  return self->_sourceDevice;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)isNotAtHome
{
  return [(HMDUserActivityHomeAwayReport *)self state] == 3;
}

- (BOOL)isAtHome
{
  return [(HMDUserActivityHomeAwayReport *)self state] == 2;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  v7 = [HMDUserActivityHomeAwayReport alloc];
  v8 = [(HMDUserActivityReport *)self user];
  unint64_t v9 = [(HMDUserActivityHomeAwayReport *)self state];
  v10 = [(HMDUserActivityHomeAwayReport *)self sourceDevice];
  v11 = [(HMDUserActivityReport *)self changedTimestamp];
  v12 = [(HMDUserActivityHomeAwayReport *)v7 initWithUser:v8 state:v9 fromDevice:v10 reason:a4 changedTimestamp:v11 lastUpdatedTimeStamp:v6];

  return v12;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [HMDUserActivityHomeAwayReport alloc];
  id v6 = [(HMDUserActivityReport *)self user];
  unint64_t v7 = [(HMDUserActivityHomeAwayReport *)self state];
  v8 = [(HMDUserActivityHomeAwayReport *)self sourceDevice];
  unint64_t v9 = [(HMDUserActivityReport *)self reason];
  v10 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
  v11 = [(HMDUserActivityHomeAwayReport *)v5 initWithUser:v6 state:v7 fromDevice:v8 reason:v9 changedTimestamp:v4 lastUpdatedTimeStamp:v10];

  return v11;
}

- (id)serializedRemoteMessagePayload
{
  v8.receiver = self;
  v8.super_class = (Class)HMDUserActivityHomeAwayReport;
  v3 = [(HMDUserActivityReport *)&v8 serializedRemoteMessagePayload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityHomeAwayReport state](self, "state"));
  [v4 setObject:v5 forKeyedSubscript:@"HAS.HA.S"];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (unint64_t)contributorType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)HMDUserActivityHomeAwayReport,
        [(HMDUserActivityReport *)&v10 isEqual:v6]))
  {
    unint64_t v7 = [(HMDUserActivityHomeAwayReport *)self state];
    BOOL v8 = v7 == [v6 state];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4 sourceDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v8, "hmf_numberForKey:", @"HAS.HA.S");
  if (v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDUserActivityHomeAwayReport;
    id v12 = [(HMDUserActivityReport *)&v15 initFromMessagePayload:v8 withUser:v9];
    if (v12)
    {
      *((void *)v12 + 5) = [v11 unsignedIntValue];
      objc_storeStrong((id *)v12 + 6, a5);
    }
    self = (HMDUserActivityHomeAwayReport *)v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdatedTimeStamp:(id)a8
{
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDUserActivityHomeAwayReport;
  v16 = [(HMDUserActivityReport *)&v19 initWithUser:a3 withReason:a6 changedTimestamp:a7 lastUpdateTimestamp:a8];
  v17 = v16;
  if (v16)
  {
    v16->_state = a4;
    objc_storeStrong((id *)&v16->_sourceDevice, a5);
  }

  return v17;
}

- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6
{
  return [(HMDUserActivityHomeAwayReport *)self initWithUser:a3 state:a4 fromDevice:a5 reason:a6 changedTimestamp:0 lastUpdatedTimeStamp:0];
}

@end