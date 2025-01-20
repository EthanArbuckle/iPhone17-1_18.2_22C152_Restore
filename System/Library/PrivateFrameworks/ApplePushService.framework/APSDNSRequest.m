@interface APSDNSRequest
+ (BOOL)supportsSecureCoding;
- (APSDNSRequest)initWithCoder:(id)a3;
- (APSDNSRequest)initWithHostname:(id)a3 timeoutInSeconds:(double)a4 requestFlags:(int64_t)a5 responseBlock:(id)a6;
- (NSDate)requestStartTime;
- (NSString)environment;
- (NSString)hostname;
- (double)timeout;
- (id)responseBlock;
- (void)encodeWithCoder:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setRequestStartTime:(id)a3;
@end

@implementation APSDNSRequest

- (APSDNSRequest)initWithHostname:(id)a3 timeoutInSeconds:(double)a4 requestFlags:(int64_t)a5 responseBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APSDNSRequest;
  v12 = [(APSDNSRequest *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    hostname = v12->_hostname;
    v12->_hostname = (NSString *)v13;

    v12->_timeout = a4;
    uint64_t v15 = [v11 copy];
    id responseBlock = v12->_responseBlock;
    v12->_id responseBlock = (id)v15;

    requestStartTime = v12->_requestStartTime;
    v12->_flags = a5;
    v12->_requestStartTime = 0;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APSDNSRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSDNSRequest;
  v5 = [(APSDNSRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSDNSHostname"];
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSDNSEnvironment"];
    environment = v5->_environment;
    v5->_environment = (NSString *)v8;

    v5->_flags = [v4 decodeIntegerForKey:@"APSDNSRequestFlags"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  hostname = self->_hostname;
  id v5 = a3;
  [v5 encodeObject:hostname forKey:@"APSDNSHostname"];
  [v5 encodeObject:self->_environment forKey:@"APSDNSEnvironment"];
  [v5 encodeInteger:self->_flags forKey:@"APSDNSRequestFlags"];
}

- (NSString)hostname
{
  return self->_hostname;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)responseBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStartTime, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end