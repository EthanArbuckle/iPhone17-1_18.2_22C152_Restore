@interface CTAppDataUsage
+ (BOOL)supportsSecureCoding;
- (CTAppDataUsage)initWithCoder:(id)a3;
- (CTDataUsed)used;
- (NSString)bundleId;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)init:(id)a3 withDisplayName:(id)a4 andUsage:(id)a5;
- (id)usage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTAppDataUsage

- (id)init:(id)a3 withDisplayName:(id)a4 andUsage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CTAppDataUsage;
  v12 = [(CTAppDataUsage *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)usage
{
  v2 = [(CTAppDataUsage *)self used];
  v3 = [v2 native];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CTAppDataUsage *)self bundleId];
  v6 = [(CTAppDataUsage *)self displayName];
  v7 = [(CTAppDataUsage *)self used];
  v8 = (void *)[v4 init:v5 withDisplayName:v6 andUsage:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTAppDataUsage *)self bundleId];
  [v4 encodeObject:v5 forKey:@"bundleIdKey"];

  v6 = [(CTAppDataUsage *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayNameKey"];

  id v7 = [(CTAppDataUsage *)self used];
  [v4 encodeObject:v7 forKey:@"usageKey"];
}

- (CTAppDataUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTAppDataUsage;
  v5 = [(CTAppDataUsage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdKey"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameKey"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageKey"];
    used = v5->_used;
    v5->_used = (CTDataUsed *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CTDataUsed)used
{
  return self->_used;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end