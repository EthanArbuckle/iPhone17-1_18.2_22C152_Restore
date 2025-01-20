@interface CCDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isLocal;
- (CCDevice)init;
- (CCDevice)initWithCoder:(id)a3;
- (CCDevice)initWithIdentifier:(id)a3 options:(unsigned __int8)a4;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (unsigned)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCDevice

- (unsigned)options
{
  return self->_options;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (CCDevice)initWithIdentifier:(id)a3 options:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCDevice;
  v8 = [(CCDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_options = a4;
  }

  return v9;
}

- (CCDevice)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (BOOL)isLocal
{
  return self->_options & 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CCDevice *)self identifier];
  BOOL v7 = [(CCDevice *)self isLocal];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  v9 = (void *)[v3 initWithFormat:@"<%@> identifier: %@ isLocal: %@", v5, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCDevice *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCDevice *)self isEqualToDevice:v5];

  return v6;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = [v4 identifier];
  if ([(NSString *)identifier isEqual:v6])
  {
    int options = self->_options;
    BOOL v8 = options == [v4 options];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  id v4 = [NSNumber numberWithUnsignedChar:self->_options];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"deviceIdentifier"];
  id v6 = [NSNumber numberWithUnsignedChar:self->_options];
  [v5 encodeObject:v6 forKey:@"deviceOptions"];
}

- (CCDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceOptions"];
    BOOL v7 = v6;
    if (v6)
    {
      self = -[CCDevice initWithIdentifier:options:](self, "initWithIdentifier:options:", v5, [v6 unsignedIntValue]);
      BOOL v8 = self;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end