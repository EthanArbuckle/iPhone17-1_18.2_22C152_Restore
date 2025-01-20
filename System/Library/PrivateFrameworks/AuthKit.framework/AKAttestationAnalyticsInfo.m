@interface AKAttestationAnalyticsInfo
+ (BOOL)supportsSecureCoding;
- (AKAttestationAnalyticsInfo)initWithCoder:(id)a3;
- (NSString)endPointVIP;
- (NSString)errorDomain;
- (NSString)requestMethod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)errorCode;
- (int64_t)responseCode;
- (unint64_t)bodySize;
- (unint64_t)headerSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBodySize:(unint64_t)a3;
- (void)setEndPointVIP:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHeaderSize:(unint64_t)a3;
- (void)setRequestMethod:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation AKAttestationAnalyticsInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_endPointVIP copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[3] = self->_headerSize;
  v4[6] = self->_errorCode;
  uint64_t v7 = [(NSString *)self->_errorDomain copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationAnalyticsInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKAttestationAnalyticsInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endPointVIP"];
    endPointVIP = v5->_endPointVIP;
    v5->_endPointVIP = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestMethod"];
    requestMethod = v5->_requestMethod;
    v5->_requestMethod = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_headerSize"];
    v5->_headerSize = [v10 unsignedIntegerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bodySize"];
    v5->_bodySize = [v11 unsignedIntegerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_errorCode"];
    v5->_errorCode = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_errorDomain"];
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  endPointVIP = self->_endPointVIP;
  id v8 = a3;
  [v8 encodeObject:endPointVIP forKey:@"_endPointVIP"];
  [v8 encodeObject:self->_requestMethod forKey:@"_requestMethod"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_headerSize];
  [v8 encodeObject:v5 forKey:@"_headerSize"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_bodySize];
  [v8 encodeObject:v6 forKey:@"_headerSize"];

  uint64_t v7 = [NSNumber numberWithInteger:self->_errorCode];
  [v8 encodeObject:v7 forKey:@"_errorCode"];

  [v8 encodeObject:self->_errorDomain forKey:@"_errorDomain"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"AKAttestationAnalyticsInfo: host: %@, headerSize: %lu, bodySize: %lu", self->_endPointVIP, self->_headerSize, self->_bodySize];
}

- (NSString)endPointVIP
{
  return self->_endPointVIP;
}

- (void)setEndPointVIP:(id)a3
{
}

- (NSString)requestMethod
{
  return self->_requestMethod;
}

- (void)setRequestMethod:(id)a3
{
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (void)setHeaderSize:(unint64_t)a3
{
  self->_headerSize = a3;
}

- (unint64_t)bodySize
{
  return self->_bodySize;
}

- (void)setBodySize:(unint64_t)a3
{
  self->_bodySize = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_requestMethod, 0);

  objc_storeStrong((id *)&self->_endPointVIP, 0);
}

@end