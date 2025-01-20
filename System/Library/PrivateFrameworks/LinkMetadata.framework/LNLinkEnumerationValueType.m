@interface LNLinkEnumerationValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNLinkEnumerationValueType)initWithCoder:(id)a3;
- (LNLinkEnumerationValueType)initWithEnumerationIdentifier:(id)a3;
- (NSString)enumerationIdentifier;
- (id)typeIdentifierAsString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNLinkEnumerationValueType

- (void).cxx_destruct
{
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNLinkEnumerationValueType)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumerationIdentifier"];

  v6 = [(LNLinkEnumerationValueType *)self initWithEnumerationIdentifier:v5];
  return v6;
}

- (LNLinkEnumerationValueType)initWithEnumerationIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNLinkEnumerationValueType.m", 18, @"Invalid parameter not satisfying: %@", @"enumerationIdentifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNLinkEnumerationValueType;
  v6 = [(LNValueType *)&v12 _init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    enumerationIdentifier = v6->_enumerationIdentifier;
    v6->_enumerationIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNLinkEnumerationValueType *)self enumerationIdentifier];
  [v4 encodeObject:v5 forKey:@"enumerationIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNLinkEnumerationValueType *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [(LNLinkEnumerationValueType *)self enumerationIdentifier];
      v8 = [(LNLinkEnumerationValueType *)v6 enumerationIdentifier];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (NSString)enumerationIdentifier
{
  return self->_enumerationIdentifier;
}

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayWithObject:v3];
}

- (unint64_t)hash
{
  v2 = [(LNLinkEnumerationValueType *)self enumerationIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)typeIdentifierAsString
{
  return @"Enumeration";
}

@end