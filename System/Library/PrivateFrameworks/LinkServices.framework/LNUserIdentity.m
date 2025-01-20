@interface LNUserIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNUserIdentity)initWithCoder:(id)a3;
- (LNUserIdentity)initWithPersonaUniqueIdentifier:(id)a3;
- (LNUserIdentity)initWithPersonaUniqueIdentifier:(id)a3 accessLevel:(int64_t)a4;
- (NSString)personaUniqueIdentifier;
- (id)description;
- (int64_t)accessLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNUserIdentity

- (void).cxx_destruct
{
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
}

- (NSString)personaUniqueIdentifier
{
  return self->_personaUniqueIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNUserIdentity *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNUserIdentity *)self personaUniqueIdentifier];
      v8 = [(LNUserIdentity *)v6 personaUniqueIdentifier];
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

- (unint64_t)hash
{
  v2 = [(LNUserIdentity *)self personaUniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (LNUserIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueIdentifier"];
  int v6 = [v4 decodeIntForKey:@"accessLevel"];

  v7 = [(LNUserIdentity *)self initWithPersonaUniqueIdentifier:v5 accessLevel:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(LNUserIdentity *)self personaUniqueIdentifier];
  [v5 encodeObject:v4 forKey:@"personaUniqueIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNUserIdentity accessLevel](self, "accessLevel"), @"accessLevel");
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [(LNUserIdentity *)self personaUniqueIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, userPersonaUniqueIdentifier: %@, accessLevel: %ld>", v5, self, v6, -[LNUserIdentity accessLevel](self, "accessLevel")];

  return v7;
}

- (LNUserIdentity)initWithPersonaUniqueIdentifier:(id)a3 accessLevel:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNUserIdentity.m", 21, @"Invalid parameter not satisfying: %@", @"personaUniqueIdentifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNUserIdentity;
  v8 = [(LNUserIdentity *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    personaUniqueIdentifier = v8->_personaUniqueIdentifier;
    v8->_personaUniqueIdentifier = (NSString *)v9;

    v8->_accessLevel = a4;
    v11 = v8;
  }

  return v8;
}

- (LNUserIdentity)initWithPersonaUniqueIdentifier:(id)a3
{
  return [(LNUserIdentity *)self initWithPersonaUniqueIdentifier:a3 accessLevel:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end