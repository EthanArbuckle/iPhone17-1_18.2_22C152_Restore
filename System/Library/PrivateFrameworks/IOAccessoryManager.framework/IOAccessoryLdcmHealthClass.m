@interface IOAccessoryLdcmHealthClass
+ (BOOL)supportsSecureCoding;
- (BOOL)isHealthy;
- (IOAccessoryLdcmHealthClass)init;
- (IOAccessoryLdcmHealthClass)initWithCoder:(id)a3;
- (unint64_t)dryCount;
- (unint64_t)lastSeenTimestamp;
- (unint64_t)leakagePassedCount;
- (unint64_t)outOfProfileCount;
- (unint64_t)overVoltageCount;
- (unint64_t)overVoltageTimestamp;
- (unint64_t)rsvd0;
- (unint64_t)rsvd1;
- (unint64_t)rsvd2;
- (unint64_t)rsvd3;
- (unint64_t)wetCount;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setDryCount:(unint64_t)a3;
- (void)setIsHealthy:(BOOL)a3;
- (void)setLastSeenTimestamp:(unint64_t)a3;
- (void)setLeakagePassedCount:(unint64_t)a3;
- (void)setOutOfProfileCount:(unint64_t)a3;
- (void)setOverVoltageCount:(unint64_t)a3;
- (void)setOverVoltageTimestamp:(unint64_t)a3;
- (void)setRsvd0:(unint64_t)a3;
- (void)setRsvd1:(unint64_t)a3;
- (void)setRsvd2:(unint64_t)a3;
- (void)setRsvd3:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWetCount:(unint64_t)a3;
@end

@implementation IOAccessoryLdcmHealthClass

- (IOAccessoryLdcmHealthClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)IOAccessoryLdcmHealthClass;
  result = [(IOAccessoryLdcmHealthClass *)&v3 init];
  if (result)
  {
    result->_version = 1;
    result->_isHealthy = 0;
    *(_OWORD *)&result->_leakagePassedCount = 0u;
    *(_OWORD *)&result->_wetCount = 0u;
    *(_OWORD *)&result->_outOfProfileCount = 0u;
    *(_OWORD *)&result->_rsvd0 = 0u;
    *(_OWORD *)&result->_rsvd2 = 0u;
    result->_overVoltageTimestamp = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", -[IOAccessoryLdcmHealthClass version](self, "version"), @"version");
  objc_msgSend(a3, "encodeBool:forKey:", -[IOAccessoryLdcmHealthClass isHealthy](self, "isHealthy"), @"isHealthy");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass leakagePassedCount](self, "leakagePassedCount"), @"leakagePassedCount");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass dryCount](self, "dryCount"), @"dryCount");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass wetCount](self, "wetCount"), @"wetCount");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass overVoltageCount](self, "overVoltageCount"), @"overVoltageCount");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass outOfProfileCount](self, "outOfProfileCount"), @"outOfProfileCount");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass lastSeenTimestamp](self, "lastSeenTimestamp"), @"lastSeenTimestamp");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd0](self, "rsvd0"), @"rsvd0");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd1](self, "rsvd1"), @"rsvd1");
  objc_msgSend(a3, "encodeInt64:forKey:", -[IOAccessoryLdcmHealthClass rsvd2](self, "rsvd2"), @"rsvd2");
  unint64_t v5 = [(IOAccessoryLdcmHealthClass *)self rsvd3];
  [a3 encodeInt64:v5 forKey:@"rsvd3"];
}

- (IOAccessoryLdcmHealthClass)initWithCoder:(id)a3
{
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)isHealthy
{
  return self->_isHealthy;
}

- (void)setIsHealthy:(BOOL)a3
{
  self->_isHealthy = a3;
}

- (unint64_t)leakagePassedCount
{
  return self->_leakagePassedCount;
}

- (void)setLeakagePassedCount:(unint64_t)a3
{
  self->_leakagePassedCount = a3;
}

- (unint64_t)dryCount
{
  return self->_dryCount;
}

- (void)setDryCount:(unint64_t)a3
{
  self->_dryCount = a3;
}

- (unint64_t)wetCount
{
  return self->_wetCount;
}

- (void)setWetCount:(unint64_t)a3
{
  self->_wetCount = a3;
}

- (unint64_t)overVoltageCount
{
  return self->_overVoltageCount;
}

- (void)setOverVoltageCount:(unint64_t)a3
{
  self->_overVoltageCount = a3;
}

- (unint64_t)outOfProfileCount
{
  return self->_outOfProfileCount;
}

- (void)setOutOfProfileCount:(unint64_t)a3
{
  self->_outOfProfileCount = a3;
}

- (unint64_t)lastSeenTimestamp
{
  return self->_lastSeenTimestamp;
}

- (void)setLastSeenTimestamp:(unint64_t)a3
{
  self->_lastSeenTimestamp = a3;
}

- (unint64_t)rsvd0
{
  return self->_rsvd0;
}

- (void)setRsvd0:(unint64_t)a3
{
  self->_rsvd0 = a3;
}

- (unint64_t)rsvd1
{
  return self->_rsvd1;
}

- (void)setRsvd1:(unint64_t)a3
{
  self->_rsvd1 = a3;
}

- (unint64_t)rsvd2
{
  return self->_rsvd2;
}

- (void)setRsvd2:(unint64_t)a3
{
  self->_rsvd2 = a3;
}

- (unint64_t)rsvd3
{
  return self->_rsvd3;
}

- (void)setRsvd3:(unint64_t)a3
{
  self->_rsvd3 = a3;
}

- (unint64_t)overVoltageTimestamp
{
  return self->_overVoltageTimestamp;
}

- (void)setOverVoltageTimestamp:(unint64_t)a3
{
  self->_overVoltageTimestamp = a3;
}

@end