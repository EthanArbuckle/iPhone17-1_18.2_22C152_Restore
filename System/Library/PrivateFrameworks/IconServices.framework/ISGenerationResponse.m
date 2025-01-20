@interface ISGenerationResponse
+ (BOOL)supportsSecureCoding;
- (ISGenerationResponse)initWithCoder:(id)a3;
- (ISGenerationResponse)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5;
- (ISGenerationResponse)initWithError:(id)a3;
- (NSData)data;
- (NSData)validationToken;
- (NSError)error;
- (NSUUID)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISGenerationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISGenerationResponse)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ISGenerationResponse;
  v12 = [(ISGenerationResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v13->_uuid, a4);
    objc_storeStrong((id *)&v13->_validationToken, a5);
  }

  return v13;
}

- (ISGenerationResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISGenerationResponse;
  v6 = [(ISGenerationResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  if (error)
  {
    id v4 = a3;
    id v5 = @"error";
    validationToken = (NSData *)error;
  }
  else
  {
    data = self->_data;
    id v9 = a3;
    [v9 encodeObject:data forKey:@"data"];
    [v9 encodeObject:self->_uuid forKey:@"uuid"];
    validationToken = self->_validationToken;
    id v5 = @"validationToken";
    id v4 = v9;
  }
  [v4 encodeObject:validationToken forKey:v5];
}

- (ISGenerationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ISGenerationResponse;
  id v5 = [(ISGenerationResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    if (!v5->_error)
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
      data = v5->_data;
      v5->_data = (NSData *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validationToken"];
      validationToken = v5->_validationToken;
      v5->_validationToken = (NSData *)v12;
    }
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)validationToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end