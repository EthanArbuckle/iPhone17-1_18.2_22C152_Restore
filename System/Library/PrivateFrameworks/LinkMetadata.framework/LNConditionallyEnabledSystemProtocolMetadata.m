@interface LNConditionallyEnabledSystemProtocolMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)persistState;
- (LNConditionallyEnabledSystemProtocolMetadata)initWithCoder:(id)a3;
- (LNConditionallyEnabledSystemProtocolMetadata)initWithPersistState:(BOOL)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConditionallyEnabledSystemProtocolMetadata

- (BOOL)persistState
{
  return self->_persistState;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNConditionallyEnabledSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v7 = [(LNConditionallyEnabledSystemProtocolMetadata *)self persistState];
      BOOL v8 = v7 ^ [(LNConditionallyEnabledSystemProtocolMetadata *)v6 persistState] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  return [(LNConditionallyEnabledSystemProtocolMetadata *)self persistState];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(LNConditionallyEnabledSystemProtocolMetadata *)self persistState];
  BOOL v7 = @"NO";
  if (v6) {
    BOOL v7 = @"YES";
  }
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p, persistState: %@>", v5, self, v7];

  return (NSString *)v8;
}

- (LNConditionallyEnabledSystemProtocolMetadata)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"persistState"];
  return [(LNConditionallyEnabledSystemProtocolMetadata *)self initWithPersistState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNConditionallyEnabledSystemProtocolMetadata persistState](self, "persistState"), @"persistState");
}

- (LNConditionallyEnabledSystemProtocolMetadata)initWithPersistState:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNConditionallyEnabledSystemProtocolMetadata;
  id v4 = [(LNConditionallyEnabledSystemProtocolMetadata *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_persistState = a3;
    BOOL v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end