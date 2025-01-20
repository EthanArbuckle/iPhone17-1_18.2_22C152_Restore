@interface MSSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MSSession)init;
- (MSSession)initWithCoder:(id)a3;
- (MSSession)initWithIdentifier:(id)a3;
- (NSUUID)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSSession)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(MSSession *)self initWithIdentifier:v3];

  return v4;
}

- (MSSession)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSession;
  v6 = [(MSSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (MSSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSession;
  id v5 = [(MSSession *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSSession *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    id v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      identifier = self->_identifier;
      v7 = [(MSSession *)v4 identifier];
      char v8 = [(NSUUID *)identifier isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSUUID *)self->_identifier UUIDString];
  v7 = [v3 stringWithFormat:@"<%@ %lx> - %@", v5, self, v6];

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end