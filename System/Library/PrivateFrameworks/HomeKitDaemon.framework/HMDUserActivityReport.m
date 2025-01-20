@interface HMDUserActivityReport
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpiredWithCurrentDate:(id)a3 validInterval:(double)a4;
- (HMDUser)user;
- (HMDUserActivityReport)initWithUser:(id)a3 withReason:(unint64_t)a4 changedTimestamp:(id)a5 lastUpdateTimestamp:(id)a6;
- (NSDate)changedTimestamp;
- (NSDate)lastUpdateTimestamp;
- (id)changedTimestampFromReason:(unint64_t)a3 lastUpdateTimestamp:(id)a4;
- (id)copyReportWithChangedTimestamp:(id)a3;
- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4;
- (id)initFromMessagePayload:(id)a3 withUser:(id)a4;
- (id)serializedRemoteMessagePayload;
- (unint64_t)contributorType;
- (unint64_t)reason;
@end

@implementation HMDUserActivityReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (NSDate)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (NSDate)changedTimestamp
{
  return self->_changedTimestamp;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (HMDUser)user
{
  return self->_user;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  v10 = [v8 stringWithFormat:@"You must override %@ in a subclass", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  uint64_t v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)serializedRemoteMessagePayload
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v14[0] = @"HAS.contributorType";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityReport contributorType](self, "contributorType"));
  v14[1] = @"HAS.reason";
  v15[0] = v4;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityReport reason](self, "reason"));
  v15[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  uint64_t v7 = [v3 dictionaryWithDictionary:v6];

  v8 = [(HMDUserActivityReport *)self changedTimestamp];

  if (v8)
  {
    v9 = [(HMDUserActivityReport *)self changedTimestamp];
    [v7 setObject:v9 forKeyedSubscript:@"HAS.changedTimestamp"];
  }
  id v10 = [(HMDUserActivityReport *)self lastUpdateTimestamp];

  if (v10)
  {
    id v11 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
    [v7 setObject:v11 forKeyedSubscript:@"HAS.lastUpdatedTimestamp"];
  }
  v12 = (void *)[v7 copy];

  return v12;
}

- (BOOL)isExpiredWithCurrentDate:(id)a3 validInterval:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
  [v7 timeIntervalSinceDate:v6];
  double v9 = fabs(v8);
  BOOL v10 = vabdd_f64(v9, a4) >= 2.22044605e-16 && v9 >= a4;

  return v10;
}

- (unint64_t)contributorType
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_10;
  }
  unint64_t v7 = [(HMDUserActivityReport *)self contributorType];
  if (v7 != [v6 contributorType]) {
    goto LABEL_10;
  }
  double v8 = [(HMDUserActivityReport *)self user];
  double v9 = [v6 user];
  int v10 = HMFEqualObjects();

  if (!v10) {
    goto LABEL_10;
  }
  unint64_t v11 = [(HMDUserActivityReport *)self reason];
  if (v11 != [v6 reason]) {
    goto LABEL_10;
  }
  v12 = [(HMDUserActivityReport *)self changedTimestamp];
  v13 = [v6 changedTimestamp];
  int v14 = HMFEqualObjects();

  if (v14)
  {
    v15 = [(HMDUserActivityReport *)self lastUpdateTimestamp];
    v16 = [v6 lastUpdateTimestamp];
    char v17 = HMFEqualObjects();
  }
  else
  {
LABEL_10:
    char v17 = 0;
  }

  return v17;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_msgSend(v6, "hmf_numberForKey:", @"HAS.reason");
  double v9 = v8;
  if (v8 && (uint64_t v10 = [v8 unsignedIntegerValue]) != 0)
  {
    uint64_t v11 = v10;
    v12 = objc_msgSend(v6, "hmf_dateForKey:", @"HAS.changedTimestamp");
    v13 = objc_msgSend(v6, "hmf_dateForKey:", @"HAS.lastUpdatedTimestamp");
    if (!v13)
    {
      v13 = [MEMORY[0x263EFF910] now];
    }
    if (v12) {
      int v14 = v12;
    }
    else {
      int v14 = v13;
    }
    self = [(HMDUserActivityReport *)self initWithUser:v7 withReason:v11 changedTimestamp:v14 lastUpdateTimestamp:v13];

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)changedTimestampFromReason:(unint64_t)a3 lastUpdateTimestamp:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 11 || a3 == 4) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (HMDUserActivityReport)initWithUser:(id)a3 withReason:(unint64_t)a4 changedTimestamp:(id)a5 lastUpdateTimestamp:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserActivityReport;
  int v14 = [(HMDUserActivityReport *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_user, a3);
    v15->_reason = a4;
    v16 = v13;
    if (!v13)
    {
      v16 = [MEMORY[0x263EFF910] now];
    }
    objc_storeStrong((id *)&v15->_lastUpdateTimestamp, v16);
    if (v13)
    {
      if (v12)
      {
LABEL_6:
        char v17 = (NSDate *)v12;
        changedTimestamp = v15->_changedTimestamp;
        v15->_changedTimestamp = v17;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      if (v12) {
        goto LABEL_6;
      }
    }
    uint64_t v19 = [(HMDUserActivityReport *)v15 changedTimestampFromReason:a4 lastUpdateTimestamp:v15->_lastUpdateTimestamp];
    changedTimestamp = v15->_changedTimestamp;
    v15->_changedTimestamp = (NSDate *)v19;
    goto LABEL_9;
  }
LABEL_10:

  return v15;
}

@end