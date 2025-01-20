@interface LNConfirmationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isConfirmed;
- (LNConfirmationResponse)initWithCoder:(id)a3;
- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4;
- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4 updates:(id)a5;
- (NSDictionary)updates;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConfirmationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNConfirmationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"confirmed"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"updates"];

  if (v5)
  {
    self = [(LNConfirmationResponse *)self initWithIdentifier:v5 confirmed:v6 updates:v11];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNConfirmationResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNConfirmationResponse isConfirmed](self, "isConfirmed"), @"confirmed");
  id v6 = [(LNConfirmationResponse *)self updates];
  [v4 encodeObject:v6 forKey:@"updates"];
}

- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4
{
  return [(LNConfirmationResponse *)self initWithIdentifier:a3 confirmed:a4 updates:0];
}

- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4 updates:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNConfirmationResponse.m", 19, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNConfirmationResponse;
  v12 = [(LNConfirmationResponse *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_confirmed = a4;
    objc_storeStrong((id *)&v13->_updates, a5);
    v14 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end