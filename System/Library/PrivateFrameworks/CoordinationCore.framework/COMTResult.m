@interface COMTResult
+ (BOOL)supportsSecureCoding;
- (COMTResult)initWithActionIdentifier:(id)a3;
- (COMTResult)initWithCoder:(id)a3;
- (NSString)actionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTResult

- (COMTResult)initWithActionIdentifier:(id)a3
{
  return self;
}

- (COMTResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RA"];

  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v5;

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
  id v5 = [(COMTResult *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"RA"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
}

@end