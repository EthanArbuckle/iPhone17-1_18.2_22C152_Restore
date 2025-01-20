@interface HMDUserActivityType3Report
- (BOOL)isEqual:(id)a3;
- (HMDUserActivityType3Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5;
- (HMDUserActivityType3Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5 changedTimestamp:(id)a6 lastUpdateTimestamp:(id)a7;
- (id)copyReportWithChangedTimestamp:(id)a3;
- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4;
- (id)initFromMessagePayload:(id)a3 withUser:(id)a4;
- (id)serializedRemoteMessagePayload;
- (unint64_t)contributorType;
- (unint64_t)state;
@end

@implementation HMDUserActivityType3Report

- (unint64_t)state
{
  return self->_state;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  v7 = [HMDUserActivityType3Report alloc];
  v8 = [(HMDUserActivityReport *)self user];
  unint64_t v9 = [(HMDUserActivityType3Report *)self state];
  v10 = [(HMDUserActivityReport *)self changedTimestamp];
  v11 = [(HMDUserActivityType3Report *)v7 initWithUser:v8 state:v9 withReason:a4 changedTimestamp:v10 lastUpdateTimestamp:v6];

  return v11;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [HMDUserActivityType3Report alloc];
  id v6 = [(HMDUserActivityReport *)self user];
  unint64_t v7 = [(HMDUserActivityType3Report *)self state];
  unint64_t v8 = [(HMDUserActivityReport *)self reason];
  unint64_t v9 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
  v10 = [(HMDUserActivityType3Report *)v5 initWithUser:v6 state:v7 withReason:v8 changedTimestamp:v4 lastUpdateTimestamp:v9];

  return v10;
}

- (id)serializedRemoteMessagePayload
{
  v8.receiver = self;
  v8.super_class = (Class)HMDUserActivityType3Report;
  v3 = [(HMDUserActivityReport *)&v8 serializedRemoteMessagePayload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3Report state](self, "state"));
  [v4 setObject:v5 forKeyedSubscript:@"HAS.T3.US"];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (unint64_t)contributorType
{
  return 2;
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
        v10.super_class = (Class)HMDUserActivityType3Report,
        [(HMDUserActivityReport *)&v10 isEqual:v6]))
  {
    unint64_t v7 = [(HMDUserActivityType3Report *)self state];
    BOOL v8 = v7 == [v6 state];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = objc_msgSend(v6, "hmf_numberForKey:", @"HAS.T3.US");
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDUserActivityType3Report;
    unint64_t v9 = [(HMDUserActivityReport *)&v12 initFromMessagePayload:v6 withUser:v7];
    if (v9) {
      v9[5] = [v8 integerValue];
    }
    self = v9;
    objc_super v10 = self;
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (HMDUserActivityType3Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5 changedTimestamp:(id)a6 lastUpdateTimestamp:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType3Report;
  result = [(HMDUserActivityReport *)&v9 initWithUser:a3 withReason:a5 changedTimestamp:a6 lastUpdateTimestamp:a7];
  if (result) {
    result->_state = a4;
  }
  return result;
}

- (HMDUserActivityType3Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5
{
  return [(HMDUserActivityType3Report *)self initWithUser:a3 state:a4 withReason:a5 changedTimestamp:0 lastUpdateTimestamp:0];
}

@end