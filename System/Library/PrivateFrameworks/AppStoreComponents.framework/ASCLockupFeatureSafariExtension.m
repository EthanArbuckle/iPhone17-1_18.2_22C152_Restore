@interface ASCLockupFeatureSafariExtension
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureSafariExtension)initWithCoder:(id)a3;
- (ASCLockupFeatureSafariExtension)initWithContentProviderTeamID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)contentProviderTeamID;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureSafariExtension

- (ASCLockupFeatureSafariExtension)initWithContentProviderTeamID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureSafariExtension;
  v5 = [(ASCLockupFeatureSafariExtension *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contentProviderTeamID = v5->_contentProviderTeamID;
    v5->_contentProviderTeamID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSafariExtension)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentProviderTeamID"];

  uint64_t v6 = [(ASCLockupFeatureSafariExtension *)self initWithContentProviderTeamID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupFeatureSafariExtension *)self contentProviderTeamID];
  [v4 encodeObject:v5 forKey:@"contentProviderTeamID"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureSafariExtension *)self contentProviderTeamID];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureSafariExtension *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    unint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      objc_super v9 = [(ASCLockupFeatureSafariExtension *)self contentProviderTeamID];
      uint64_t v10 = [(ASCLockupFeatureSafariExtension *)v8 contentProviderTeamID];
      v11 = (void *)v10;
      if (v9 && v10) {
        char v7 = [v9 isEqual:v10];
      }
      else {
        char v7 = v9 == (void *)v10;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureSafariExtension *)self contentProviderTeamID];
  [(ASCDescriber *)v3 addObject:v4 withName:@"contentProviderTeamID"];

  unint64_t v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (NSString)contentProviderTeamID
{
  return self->_contentProviderTeamID;
}

- (void).cxx_destruct
{
}

@end