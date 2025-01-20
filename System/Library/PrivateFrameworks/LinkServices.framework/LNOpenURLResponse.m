@interface LNOpenURLResponse
+ (BOOL)supportsSecureCoding;
- (LNOpenURLResponse)initWithCoder:(id)a3;
- (LNOpenURLResponse)initWithIdentifier:(id)a3;
- (NSUUID)identifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNOpenURLResponse

- (void).cxx_destruct
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNOpenURLResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v5)
  {
    self = [(LNOpenURLResponse *)self initWithIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNOpenURLResponse *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(LNOpenURLResponse *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return v7;
}

- (LNOpenURLResponse)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNOpenURLResponse.m", 17, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNOpenURLResponse;
  v7 = [(LNOpenURLResponse *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end