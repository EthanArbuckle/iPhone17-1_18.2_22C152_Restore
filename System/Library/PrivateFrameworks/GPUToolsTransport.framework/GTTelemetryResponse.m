@interface GTTelemetryResponse
+ (BOOL)supportsSecureCoding;
- (GTDataVersion)version;
- (GTTelemetryResponse)init;
- (GTTelemetryResponse)initWithCoder:(id)a3;
- (NSData)data;
- (NSError)error;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setVersion:(GTDataVersion)a3;
@end

@implementation GTTelemetryResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryResponse;
  v2 = [(GTTelemetryResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_version.var0.version = 1;
    v4 = v2;
  }

  return v3;
}

- (GTTelemetryResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTTelemetryResponse;
  v5 = [(GTTelemetryResponse *)&v12 init];
  if (v5)
  {
    v5->_version.value = [v4 decodeInt64ForKey:@"version"];
    v5->_requestID = [v4 decodeInt64ForKey:@"requestID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GTDataVersion version = self->_version;
  id v5 = a3;
  [v5 encodeInt64:version.value forKey:@"version"];
  [v5 encodeInt64:self->_requestID forKey:@"requestID"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (GTDataVersion)version
{
  return (GTDataVersion)self->_version.value;
}

- (void)setVersion:(GTDataVersion)a3
{
  self->_GTDataVersion version = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end