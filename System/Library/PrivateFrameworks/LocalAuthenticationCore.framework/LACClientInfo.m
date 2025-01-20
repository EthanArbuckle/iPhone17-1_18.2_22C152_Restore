@interface LACClientInfo
+ (BOOL)supportsSecureCoding;
+ (id)emptyClientInfo;
- (LACClientInfo)initWithBundleId:(id)a3 displayName:(id)a4;
- (LACClientInfo)initWithCoder:(id)a3;
- (NSString)bundleId;
- (NSString)displayName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACClientInfo

- (LACClientInfo)initWithBundleId:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACClientInfo;
  v9 = [(LACClientInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

+ (id)emptyClientInfo
{
  v2 = (void *)[objc_alloc((Class)a1) initWithBundleId:0 displayName:0];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LACClientInfo *)self bundleId];
  v6 = NSStringFromSelector(sel_bundleId);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(LACClientInfo *)self displayName];
  id v7 = NSStringFromSelector(sel_displayName);
  [v4 encodeObject:v8 forKey:v7];
}

- (LACClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_bundleId);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_displayName);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = [(LACClientInfo *)self initWithBundleId:v7 displayName:v10];
  return v11;
}

- (id)description
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSString;
  v6 = [(LACClientInfo *)self bundleId];
  id v7 = [v5 stringWithFormat:@"bundleID: %@", v6];
  v15[0] = v7;
  uint64_t v8 = NSString;
  v9 = [(LACClientInfo *)self displayName];
  v10 = [v8 stringWithFormat:@"displayName: %@", v9];
  v15[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  objc_super v12 = [v11 componentsJoinedByString:@"; "];
  v13 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];

  return v13;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end