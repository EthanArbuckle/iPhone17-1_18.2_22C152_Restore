@interface APSSignDataWithIdentityRequest
+ (BOOL)supportsSecureCoding;
- (APSSignDataWithIdentityRequest)initWithCoder:(id)a3;
- (NSData)data;
- (NSNumber)time;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation APSSignDataWithIdentityRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"dataKey"];
  [v5 encodeObject:self->_time forKey:@"timeKey"];
}

- (APSSignDataWithIdentityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSSignDataWithIdentityRequest;
  id v5 = [(APSSignDataWithIdentityRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataKey"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeKey"];
    time = v5->_time;
    v5->_time = (NSNumber *)v8;
  }
  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSNumber)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end