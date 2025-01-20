@interface CRKFetchLogEventsResultObject
+ (BOOL)supportsSecureCoding;
- (CRKEventLog)eventLog;
- (CRKFetchLogEventsResultObject)initWithCoder:(id)a3;
- (NSDate)currentDate;
- (NSString)sessionToken;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setEventLog:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation CRKFetchLogEventsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLogEventsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchLogEventsResultObject;
  v5 = [(CATTaskResultObject *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"eventLog"];
    eventLog = v5->_eventLog;
    v5->_eventLog = (CRKEventLog *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"currentDate"];
    currentDate = v5->_currentDate;
    v5->_currentDate = (NSDate *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"sessionToken"];
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchLogEventsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v8 encodeWithCoder:v4];
  v5 = [(CRKFetchLogEventsResultObject *)self eventLog];
  [v4 encodeObject:v5 forKey:@"eventLog"];

  v6 = [(CRKFetchLogEventsResultObject *)self currentDate];
  [v4 encodeObject:v6 forKey:@"currentDate"];

  uint64_t v7 = [(CRKFetchLogEventsResultObject *)self sessionToken];
  [v4 encodeObject:v7 forKey:@"sessionToken"];
}

- (CRKEventLog)eventLog
{
  return self->_eventLog;
}

- (void)setEventLog:(id)a3
{
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);

  objc_storeStrong((id *)&self->_eventLog, 0);
}

@end