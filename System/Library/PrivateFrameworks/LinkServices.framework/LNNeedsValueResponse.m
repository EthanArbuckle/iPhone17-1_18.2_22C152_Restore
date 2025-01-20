@interface LNNeedsValueResponse
+ (BOOL)supportsSecureCoding;
- (LNNeedsValueResponse)initWithCoder:(id)a3;
- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4;
- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4 updates:(id)a5;
- (LNValue)value;
- (NSDictionary)updates;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNNeedsValueResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (LNValue)value
{
  return self->_value;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNNeedsValueResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"updates"];

  if (v5 && v6 | v11)
  {
    self = [(LNNeedsValueResponse *)self initWithIdentifier:v5 value:v6 updates:v11];
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
  v5 = [(LNNeedsValueResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(LNNeedsValueResponse *)self value];
  [v4 encodeObject:v6 forKey:@"value"];

  id v7 = [(LNNeedsValueResponse *)self updates];
  [v4 encodeObject:v7 forKey:@"updates"];
}

- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4
{
  return [(LNNeedsValueResponse *)self initWithIdentifier:a3 value:a4 updates:0];
}

- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4 updates:(id)a5
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNNeedsValueResponse.m", 19, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (!(v11 | v12))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"LNNeedsValueResponse.m" lineNumber:20 description:@"either value or updates must be non-null."];
  }
  v19.receiver = self;
  v19.super_class = (Class)LNNeedsValueResponse;
  v13 = [(LNNeedsValueResponse *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_value, a4);
    objc_storeStrong((id *)&v14->_updates, a5);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end