@interface MessageDeliveryInfo
- (MessageDeliveryInfo)init;
- (MessageDeliveryInfo)initWithJSON:(id)a3;
- (NSDate)created;
- (NSDate)lastAttempt;
- (id)description;
- (id)encodedAsJSON;
- (int64_t)failedCellularAttempts;
- (int64_t)lastStatus;
- (int64_t)numberOfFailures;
- (unint64_t)messageSize;
- (void)setFailedCellularAttempts:(int64_t)a3;
- (void)setLastAttempt:(id)a3;
- (void)setLastStatus:(int64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setNumberOfFailures:(int64_t)a3;
@end

@implementation MessageDeliveryInfo

- (MessageDeliveryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)MessageDeliveryInfo;
  v2 = [(MessageDeliveryInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate now];
    created = v2->_created;
    v2->_created = (NSDate *)v3;
  }
  return v2;
}

- (id)encodedAsJSON
{
  v17[0] = @"created";
  uint64_t v3 = [(MessageDeliveryInfo *)self created];
  [v3 timeIntervalSinceReferenceDate];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v18[0] = v4;
  v17[1] = @"numberOfFailures";
  v5 = +[NSNumber numberWithInteger:[(MessageDeliveryInfo *)self numberOfFailures]];
  v18[1] = v5;
  v17[2] = @"failedCellularAttempts";
  objc_super v6 = +[NSNumber numberWithInteger:[(MessageDeliveryInfo *)self failedCellularAttempts]];
  v18[2] = v6;
  v17[3] = @"lastStatus";
  v7 = +[NSNumber numberWithInteger:[(MessageDeliveryInfo *)self lastStatus]];
  v18[3] = v7;
  v17[4] = @"messageSize";
  v8 = +[NSNumber numberWithUnsignedInteger:[(MessageDeliveryInfo *)self messageSize]];
  v18[4] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  id v10 = [v9 mutableCopy];

  v11 = [(MessageDeliveryInfo *)self lastAttempt];

  if (v11)
  {
    v12 = [(MessageDeliveryInfo *)self lastAttempt];
    [v12 timeIntervalSinceReferenceDate];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setObject:v13 forKeyedSubscript:@"lastAttempt"];
  }
  v14 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:0];
  if (v14) {
    id v15 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (MessageDeliveryInfo)initWithJSON:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 dataUsingEncoding:4];
    v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21.receiver = self;
      v21.super_class = (Class)MessageDeliveryInfo;
      v8 = [(MessageDeliveryInfo *)&v21 init];
      if (v8)
      {
        v9 = [v7 objectForKeyedSubscript:@"created"];
        [v9 doubleValue];
        uint64_t v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        created = v8->_created;
        v8->_created = (NSDate *)v10;

        v12 = [v7 objectForKeyedSubscript:@"numberOfFailures"];
        -[MessageDeliveryInfo setNumberOfFailures:](v8, "setNumberOfFailures:", [v12 integerValue]);

        v13 = [v7 objectForKeyedSubscript:@"failedCellularAttempts"];
        -[MessageDeliveryInfo setFailedCellularAttempts:](v8, "setFailedCellularAttempts:", [v13 integerValue]);

        v14 = [v7 objectForKeyedSubscript:@"lastStatus"];
        -[MessageDeliveryInfo setLastStatus:](v8, "setLastStatus:", (int)[v14 intValue]);

        id v15 = [v7 objectForKeyedSubscript:@"lastAttempt"];

        if (v15)
        {
          v16 = [v7 objectForKeyedSubscript:@"lastAttempt"];
          [v16 doubleValue];
          v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          [(MessageDeliveryInfo *)v8 setLastAttempt:v17];
        }
        v18 = [v7 objectForKeyedSubscript:@"messageSize"];
        -[MessageDeliveryInfo setMessageSize:](v8, "setMessageSize:", [v18 unsignedIntegerValue]);
      }
      self = v8;
      v19 = self;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  int64_t v3 = [(MessageDeliveryInfo *)self numberOfFailures];
  int64_t v4 = [(MessageDeliveryInfo *)self failedCellularAttempts];
  [(MessageDeliveryInfo *)self lastStatus];
  v5 = MFMessageDeliveryStatusString();
  objc_super v6 = [(MessageDeliveryInfo *)self lastAttempt];
  v7 = +[NSString stringWithFormat:@"numberOfFailures: %d, failedCellularAttempts: %d, lastStatus: %@, lastAttempt: %@, message size: %d bytes", v3, v4, v5, v6, [(MessageDeliveryInfo *)self messageSize]];

  return v7;
}

- (NSDate)created
{
  return self->_created;
}

- (int64_t)numberOfFailures
{
  return self->_numberOfFailures;
}

- (void)setNumberOfFailures:(int64_t)a3
{
  self->_numberOfFailures = a3;
}

- (int64_t)failedCellularAttempts
{
  return self->_failedCellularAttempts;
}

- (void)setFailedCellularAttempts:(int64_t)a3
{
  self->_failedCellularAttempts = a3;
}

- (int64_t)lastStatus
{
  return self->_lastStatus;
}

- (void)setLastStatus:(int64_t)a3
{
  self->_lastStatus = a3;
}

- (NSDate)lastAttempt
{
  return self->_lastAttempt;
}

- (void)setLastAttempt:(id)a3
{
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (void)setMessageSize:(unint64_t)a3
{
  self->_messageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttempt, 0);

  objc_storeStrong((id *)&self->_created, 0);
}

@end