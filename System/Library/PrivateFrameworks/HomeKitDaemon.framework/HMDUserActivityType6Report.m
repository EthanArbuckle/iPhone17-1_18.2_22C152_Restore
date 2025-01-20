@interface HMDUserActivityType6Report
- (BOOL)isEqual:(id)a3;
- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6;
- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdateTimestamp:(id)a8;
- (NSDate)stateEnd;
- (id)copyReportWithChangedTimestamp:(id)a3;
- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4;
- (id)initFromMessagePayload:(id)a3 withUser:(id)a4;
- (id)serializedRemoteMessagePayload;
- (unint64_t)contributorType;
- (unint64_t)state;
@end

@implementation HMDUserActivityType6Report

- (void).cxx_destruct
{
}

- (NSDate)stateEnd
{
  return self->_stateEnd;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  v7 = [HMDUserActivityType6Report alloc];
  v8 = [(HMDUserActivityReport *)self user];
  unint64_t v9 = [(HMDUserActivityType6Report *)self state];
  v10 = [(HMDUserActivityType6Report *)self stateEnd];
  v11 = [(HMDUserActivityReport *)self changedTimestamp];
  v12 = [(HMDUserActivityType6Report *)v7 initWithUser:v8 state:v9 stateEnd:v10 withReason:a4 changedTimestamp:v11 lastUpdateTimestamp:v6];

  return v12;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [HMDUserActivityType6Report alloc];
  id v6 = [(HMDUserActivityReport *)self user];
  unint64_t v7 = [(HMDUserActivityType6Report *)self state];
  v8 = [(HMDUserActivityType6Report *)self stateEnd];
  unint64_t v9 = [(HMDUserActivityReport *)self reason];
  v10 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
  v11 = [(HMDUserActivityType6Report *)v5 initWithUser:v6 state:v7 stateEnd:v8 withReason:v9 changedTimestamp:v4 lastUpdateTimestamp:v10];

  return v11;
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
    && (v12.receiver = self,
        v12.super_class = (Class)HMDUserActivityType6Report,
        [(HMDUserActivityReport *)&v12 isEqual:v4])
    && (unint64_t v7 = -[HMDUserActivityType6Report state](self, "state"), v7 == [v6 state]))
  {
    v8 = [(HMDUserActivityType6Report *)self stateEnd];
    unint64_t v9 = [v6 stateEnd];
    char v10 = HMFEqualObjects();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)serializedRemoteMessagePayload
{
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType6Report;
  v3 = [(HMDUserActivityReport *)&v9 serializedRemoteMessagePayload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType6Report state](self, "state"));
  [v4 setObject:v5 forKeyedSubscript:@"HAS.T6.S"];

  id v6 = [(HMDUserActivityType6Report *)self stateEnd];
  [v4 setObject:v6 forKeyedSubscript:@"HAS.T6.SE"];

  unint64_t v7 = (void *)[v4 copy];
  return v7;
}

- (unint64_t)contributorType
{
  return 3;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmf_numberForKey:", @"HAS.T6.S");
  if (v8)
  {
    objc_super v9 = objc_msgSend(v6, "hmf_dateForKey:", @"HAS.T6.SE");
    v13.receiver = self;
    v13.super_class = (Class)HMDUserActivityType6Report;
    id v10 = [(HMDUserActivityReport *)&v13 initFromMessagePayload:v6 withUser:v7];
    if (v10)
    {
      *((void *)v10 + 5) = [v8 unsignedIntValue];
      objc_storeStrong((id *)v10 + 6, v9);
    }
    self = (HMDUserActivityType6Report *)v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdateTimestamp:(id)a8
{
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDUserActivityType6Report;
  v16 = [(HMDUserActivityReport *)&v19 initWithUser:a3 withReason:a6 changedTimestamp:a7 lastUpdateTimestamp:a8];
  v17 = v16;
  if (v16)
  {
    v16->_state = a4;
    objc_storeStrong((id *)&v16->_stateEnd, a5);
  }

  return v17;
}

- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6
{
  return [(HMDUserActivityType6Report *)self initWithUser:a3 state:a4 stateEnd:a5 withReason:a6 changedTimestamp:0 lastUpdateTimestamp:0];
}

@end