@interface LNActionConfirmationResponse
+ (BOOL)supportsSecureCoding;
- (LNActionConfirmationResponse)initWithCoder:(id)a3;
- (LNActionConfirmationResponse)initWithIdentifier:(id)a3;
- (LNActionConfirmationResponse)initWithIdentifier:(id)a3 updates:(id)a4;
- (NSDictionary)updates;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionConfirmationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNActionConfirmationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"updates"];

  if (v5)
  {
    self = [(LNActionConfirmationResponse *)self initWithIdentifier:v5 updates:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNActionConfirmationResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (LNActionConfirmationResponse)initWithIdentifier:(id)a3
{
  return [(LNActionConfirmationResponse *)self initWithIdentifier:a3 updates:0];
}

- (LNActionConfirmationResponse)initWithIdentifier:(id)a3 updates:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNActionConfirmationResponse.m", 18, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionConfirmationResponse;
  v10 = [(LNActionConfirmationResponse *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_updates, a4);
    v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end