@interface COMTAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (COMTAction)init;
- (COMTAction)initWithCoder:(id)a3;
- (NSString)actionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTAction

- (COMTAction)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v4;

  return self;
}

- (COMTAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AI"];

  v6 = (NSString *)[v5 copy];
  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v6;

  return self;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, id = %@>", v5, self, self->_actionIdentifier];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(COMTAction *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"AI"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COMTAction *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(COMTAction *)self actionIdentifier];
      v6 = [(COMTAction *)v4 actionIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
}

@end