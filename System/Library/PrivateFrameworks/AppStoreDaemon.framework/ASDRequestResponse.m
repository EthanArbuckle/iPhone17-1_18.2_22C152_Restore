@interface ASDRequestResponse
+ (BOOL)supportsSecureCoding;
- (ASDRequestResponse)init;
- (ASDRequestResponse)initWithCoder:(id)a3;
- (ASDRequestResponse)initWithError:(id)a3;
- (BOOL)success;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation ASDRequestResponse

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSError *)self->_error copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (ASDRequestResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASDRequestResponse;
  return [(ASDRequestResponse *)&v3 init];
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_error == 0;
}

- (NSError)error
{
  return self->_error;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  if (error)
  {
    id v4 = a3;
    ASDErrorWithSafeUserInfo(error);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v5 forKey:@"error"];
  }
}

- (ASDRequestResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequestResponse;
  id v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (ASDRequestResponse)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequestResponse;
  id v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (void)setSuccess:(BOOL)a3
{
  if (a3)
  {
    self->_error = 0;
  }
  else
  {
    self->_error = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:928 userInfo:0];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setError:(id)a3
{
  self->_error = (NSError *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end