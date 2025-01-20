@interface CRKApplicationDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)includeBadgeIcon;
- (BOOL)includeIcon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToApplicationDescriptor:(id)a3;
- (CRKApplicationDescriptor)init;
- (CRKApplicationDescriptor)initWithBundleIdentifier:(id)a3 includeIcon:(BOOL)a4 includeBadgeIcon:(BOOL)a5;
- (CRKApplicationDescriptor)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKApplicationDescriptor

- (CRKApplicationDescriptor)init
{
  return [(CRKApplicationDescriptor *)self initWithBundleIdentifier:@"com.apple.invalid" includeIcon:0 includeBadgeIcon:0];
}

- (CRKApplicationDescriptor)initWithBundleIdentifier:(id)a3 includeIcon:(BOOL)a4 includeBadgeIcon:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKApplicationDescriptor;
  v10 = [(CRKApplicationDescriptor *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11->_includeIcon = a4;
    v11->_includeBadgeIcon = a5;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(CRKApplicationDescriptor *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(CRKApplicationDescriptor *)self includeIcon];
  unint64_t v6 = v5 ^ [(CRKApplicationDescriptor *)self includeBadgeIcon];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(CRKApplicationDescriptor *)self isEqualToApplicationDescriptor:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToApplicationDescriptor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CRKApplicationDescriptor *)self bundleIdentifier];
    uint64_t v6 = [v4 bundleIdentifier];
    if ((!(v5 | v6) || [(id)v5 isEqual:v6])
      && (int v7 = [(CRKApplicationDescriptor *)self includeIcon],
          v7 == [v4 includeIcon]))
    {
      BOOL v9 = [(CRKApplicationDescriptor *)self includeBadgeIcon];
      int v8 = v9 ^ [v4 includeBadgeIcon] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CRKApplicationDescriptor *)self bundleIdentifier];
  if ([(CRKApplicationDescriptor *)self includeIcon]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  int v7 = v6;
  if ([(CRKApplicationDescriptor *)self includeBadgeIcon]) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  BOOL v9 = [v3 stringWithFormat:@"<%@: %p { bundleIdentifier = %@, includeIcon = %@, includeBadgeIcon = %@ }>", v4, self, v5, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKApplicationDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKApplicationDescriptor;
  uint64_t v5 = [(CRKApplicationDescriptor *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeIcon"];
    v5->_includeIcon = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeBadgeIcon"];
    v5->_includeBadgeIcon = [v10 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKApplicationDescriptor *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKApplicationDescriptor includeIcon](self, "includeIcon"));
  [v4 encodeObject:v6 forKey:@"includeIcon"];

  objc_msgSend(NSNumber, "numberWithBool:", -[CRKApplicationDescriptor includeBadgeIcon](self, "includeBadgeIcon"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"includeBadgeIcon"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)includeIcon
{
  return self->_includeIcon;
}

- (BOOL)includeBadgeIcon
{
  return self->_includeBadgeIcon;
}

- (void).cxx_destruct
{
}

@end