@interface CNTracedLog
+ (BOOL)shouldLogGivenSamplePercentage:(float)a3;
+ (id)formatIntegerByRoundingForPrivacy:(int64_t)a3;
+ (id)formatTimeIntervalByRoundingForPrivacy:(double)a3;
+ (id)logWithDomain:(id)a3;
+ (int64_t)roundNumber:(int64_t)a3 usingSignificantDigits:(unint64_t)a4;
- (BOOL)summarize;
- (CNTracedLog)init;
- (CNTracedLog)initWithDomain:(id)a3 message:(id)a4;
- (NSDictionary)customProperties;
- (NSString)domain;
- (NSString)domainScope;
- (NSString)domainVersion;
- (NSString)message;
- (NSString)signature;
- (NSString)signature2;
- (NSString)signature3;
- (NSString)uuid;
- (NSString)value;
- (NSString)value2;
- (NSString)value3;
- (id)resultString;
- (int64_t)result;
- (void)setCustomProperties:(id)a3;
- (void)setDomainScope:(id)a3;
- (void)setDomainVersion:(id)a3;
- (void)setResult:(int64_t)a3;
- (void)setSignature2:(id)a3;
- (void)setSignature3:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSummarize:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setValue2:(id)a3;
- (void)setValue3:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CNTracedLog

+ (id)logWithDomain:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDomain:v4 message:&stru_1EE0267A8];

  return v5;
}

- (CNTracedLog)initWithDomain:(id)a3 message:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNTracedLog;
  return [(CNTracedLog *)&v5 init];
}

- (CNTracedLog)init
{
  return 0;
}

- (id)resultString
{
  return 0;
}

+ (id)formatIntegerByRoundingForPrivacy:(int64_t)a3
{
  uint64_t v3 = [a1 roundNumber:a3 usingSignificantDigits:1];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
}

+ (id)formatTimeIntervalByRoundingForPrivacy:(double)a3
{
  uint64_t v3 = [a1 roundNumber:(uint64_t)(a3 * 1000.0) usingSignificantDigits:2];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
}

+ (int64_t)roundNumber:(int64_t)a3 usingSignificantDigits:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (a3 >= 0) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = -a3;
  }
  double v7 = log10((double)v6);
  double v8 = __exp10((double)(uint64_t)(a4 - vcvtpd_u64_f64(v7)));
  return llround((double)(uint64_t)round(v8 * (double)a3) / v8);
}

+ (BOOL)shouldLogGivenSamplePercentage:(float)a3
{
  return (float)((float)arc4random_uniform(0x2710u) / 100.0) <= a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)domainVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomainVersion:(id)a3
{
}

- (NSString)domainScope
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDomainScope:(id)a3
{
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)signature2
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignature2:(id)a3
{
}

- (NSString)signature3
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSignature3:(id)a3
{
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setValue:(id)a3
{
}

- (NSString)value2
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setValue2:(id)a3
{
}

- (NSString)value3
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setValue3:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUuid:(id)a3
{
}

- (BOOL)summarize
{
  return self->_summarize;
}

- (void)setSummarize:(BOOL)a3
{
  self->_summarize = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSDictionary)customProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCustomProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customProperties, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_value3, 0);
  objc_storeStrong((id *)&self->_value2, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_signature3, 0);
  objc_storeStrong((id *)&self->_signature2, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_domainScope, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end