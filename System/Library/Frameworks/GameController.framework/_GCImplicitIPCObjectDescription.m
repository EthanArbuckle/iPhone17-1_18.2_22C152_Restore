@interface _GCImplicitIPCObjectDescription
+ (BOOL)supportsSecureCoding;
- (NSObject)identifier;
- (_GCImplicitIPCObjectDescription)init;
- (_GCImplicitIPCObjectDescription)initWithCoder:(id)a3;
- (_GCImplicitIPCObjectDescription)initWithIdentifier:(id)a3;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCImplicitIPCObjectDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCImplicitIPCObjectDescription)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCImplicitIPCObjectDescription;
  v5 = [(_GCImplicitIPCObjectDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (_GCImplicitIPCObjectDescription)init
{
  return 0;
}

- (_GCImplicitIPCObjectDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCImplicitIPCObjectDescription;
  v5 = [(_GCImplicitIPCObjectDescription *)&v10 init];
  if (v5)
  {
    uint64_t v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D289AB0])
  {
    v5 = [v4 IPCObjectRegistry];
    uint64_t v6 = [v5 IPCObjectWithIdentifier:self->_identifier];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end