@interface DAShareInitiatorResult
+ (BOOL)supportsSecureCoding;
- (DACarKeySharingMessage)response;
- (DAShareInitiatorResult)initWithCoder:(id)a3;
- (NSError)error;
- (id)description;
- (id)initDataRequiredResultWithResponse:(id)a3;
- (id)initFailureResultWithResponse:(id)a3 error:(id)a4;
- (id)initInviteAcceptedResultWithResponse:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAShareInitiatorResult

- (id)initInviteAcceptedResultWithResponse:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAShareInitiatorResult;
  v6 = [(DAShareInitiatorResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_response, a3);
    error = v7->_error;
    v7->_error = 0;
  }
  return v7;
}

- (id)initDataRequiredResultWithResponse:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAShareInitiatorResult;
  v6 = [(DAShareInitiatorResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_response, a3);
    error = v7->_error;
    v7->_error = 0;
  }
  return v7;
}

- (id)initFailureResultWithResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAShareInitiatorResult;
  v9 = [(DAShareInitiatorResult *)&v14 init];
  objc_super v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_response, a3);
    uint64_t v11 = kmlErrorToDAError(v8);
    error = v10->_error;
    v10->_error = (NSError *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DAShareInitiatorResult type](self, "type"), @"type");
  id v5 = [(DAShareInitiatorResult *)self response];
  [v4 encodeObject:v5 forKey:@"response"];

  id v6 = [(DAShareInitiatorResult *)self error];
  [v4 encodeObject:v6 forKey:@"error"];
}

- (DAShareInitiatorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAShareInitiatorResult;
  id v5 = [(DAShareInitiatorResult *)&v11 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
    response = v5->_response;
    v5->_response = (DACarKeySharingMessage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Type        : %ld\n", self->_type);
  [v3 appendString:v4];

  id v5 = [NSString stringWithFormat:@"Error       : %@\n", self->_error];
  [v3 appendString:v5];

  uint64_t v6 = [NSString stringWithFormat:@"Response    : %@\n", self->_response];
  [v3 appendString:v6];

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (DACarKeySharingMessage)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end