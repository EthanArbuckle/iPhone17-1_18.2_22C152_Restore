@interface CNUICoreApplicationAuthorizationItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChanges;
- (BOOL)isEqual:(id)a3;
- (CNUICoreApplicationAuthorizationItem)init;
- (CNUICoreApplicationAuthorizationItem)initWithCoder:(id)a3;
- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7;
- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7 shouldTakeSnapshot:(BOOL)a8;
- (CNUICoreApplicationAuthorizationItem)snapshot;
- (NSData)icon;
- (NSString)bundleIdentifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)itemBySettingIcon:(id)a3;
- (int64_t)authorization;
- (int64_t)deviceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorization:(int64_t)a3;
@end

@implementation CNUICoreApplicationAuthorizationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

- (CNUICoreApplicationAuthorizationItem)snapshot
{
  return self->_snapshot;
}

- (void)setAuthorization:(int64_t)a3
{
  self->_authorization = a3;
}

- (int64_t)authorization
{
  return self->_authorization;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)icon
{
  return self->_icon;
}

- (BOOL)hasChanges
{
  v2 = self;
  v3 = [(CNUICoreApplicationAuthorizationItem *)self snapshot];
  LOBYTE(v2) = ![(CNUICoreApplicationAuthorizationItem *)v2 isEqual:v3];

  return (char)v2;
}

- (id)itemBySettingIcon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(CNUICoreApplicationAuthorizationItem *)self name];
  v7 = [(CNUICoreApplicationAuthorizationItem *)self bundleIdentifier];
  v8 = objc_msgSend(v5, "initWithIcon:name:bundleIdentifier:deviceType:authorization:", v4, v6, v7, -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"), -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"));

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreApplicationAuthorizationItem *)self icon];
  id v5 = (id)[v3 appendName:@"icon" BOOLValue:v4 != 0];

  v6 = [(CNUICoreApplicationAuthorizationItem *)self name];
  id v7 = (id)[v3 appendName:@"name" object:v6];

  v8 = [(CNUICoreApplicationAuthorizationItem *)self bundleIdentifier];
  id v9 = (id)[v3 appendName:@"bundleIdentifier" object:v8];

  id v10 = (id)objc_msgSend(v3, "appendName:integerValue:", @"deviceType", -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"));
  id v11 = (id)objc_msgSend(v3, "appendName:integerValue:", @"authorizationLevel", -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"));
  v12 = [v3 build];

  return v12;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  id v4 = [(CNUICoreApplicationAuthorizationItem *)self icon];
  uint64_t v5 = [v3 objectHash:v4];

  v6 = (void *)MEMORY[0x1E4F5A418];
  id v7 = [(CNUICoreApplicationAuthorizationItem *)self name];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  id v9 = (void *)MEMORY[0x1E4F5A418];
  id v10 = [(CNUICoreApplicationAuthorizationItem *)self bundleIdentifier];
  uint64_t v11 = [v9 objectHash:v10] - v8 + 32 * v8;

  uint64_t v12 = [(CNUICoreApplicationAuthorizationItem *)self deviceType];
  if (v12 >= 0) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = -v12;
  }
  uint64_t v14 = v13 - v11 + 32 * v11;
  uint64_t v15 = [(CNUICoreApplicationAuthorizationItem *)self authorization];
  if (v15 >= 0) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = -v15;
  }
  return v16 - v14 + 32 * v14 + 486695567;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNUICoreApplicationAuthorizationItem *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((unint64_t v5 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)self icon],
           unint64_t v6 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)v4 icon],
           !(v5 | v6))
       || [(id)v5 isEqual:v6])
      && ((unint64_t v7 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)self name],
           unint64_t v8 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)v4 name],
           !(v7 | v8))
       || [(id)v7 isEqual:v8])
      && ((unint64_t v9 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)self bundleIdentifier],
           unint64_t v10 = (unint64_t)[(CNUICoreApplicationAuthorizationItem *)v4 bundleIdentifier],
           !(v9 | v10))
       || [(id)v9 isEqual:v10])
      && (int64_t v11 = [(CNUICoreApplicationAuthorizationItem *)self deviceType],
          v11 == [(CNUICoreApplicationAuthorizationItem *)v4 deviceType]))
    {
      int64_t v12 = [(CNUICoreApplicationAuthorizationItem *)self authorization];
      BOOL v13 = v12 == [(CNUICoreApplicationAuthorizationItem *)v4 authorization];
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(CNUICoreApplicationAuthorizationItem *)self icon];
  unint64_t v6 = [(CNUICoreApplicationAuthorizationItem *)self name];
  unint64_t v7 = [(CNUICoreApplicationAuthorizationItem *)self bundleIdentifier];
  unint64_t v8 = objc_msgSend(v4, "initWithIcon:name:bundleIdentifier:deviceType:authorization:shouldTakeSnapshot:", v5, v6, v7, -[CNUICoreApplicationAuthorizationItem deviceType](self, "deviceType"), -[CNUICoreApplicationAuthorizationItem authorization](self, "authorization"), 0);

  uint64_t v9 = [(CNUICoreApplicationAuthorizationItem *)self snapshot];
  unint64_t v10 = (void *)v8[6];
  v8[6] = v9;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  icon = self->_icon;
  id v5 = a3;
  [v5 encodeObject:icon forKey:@"_icon"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeInteger:self->_deviceType forKey:@"_deviceType"];
  [v5 encodeInteger:self->_authorization forKey:@"_authorization"];
  [v5 encodeObject:self->_snapshot forKey:@"_snapshot"];
}

- (CNUICoreApplicationAuthorizationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreApplicationAuthorizationItem;
  id v5 = [(CNUICoreApplicationAuthorizationItem *)&v20 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_icon"];
    uint64_t v7 = [v6 copy];
    icon = v5->_icon;
    v5->_icon = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    int64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    uint64_t v13 = [v12 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v13;

    v5->_deviceType = [v4 decodeIntegerForKey:@"_deviceType"];
    v5->_authorization = [v4 decodeIntegerForKey:@"_authorization"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_snapshot"];
    uint64_t v16 = [v15 copy];
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNUICoreApplicationAuthorizationItem *)v16;

    v18 = v5;
  }

  return v5;
}

- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7 shouldTakeSnapshot:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (!v15)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v31 = @"parameter ‘name’ must be nonnull";
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v31 = @"parameter ‘bundleIdentifier’ must be nonnull";
LABEL_11:
    id v32 = [v29 exceptionWithName:v30 reason:v31 userInfo:0];
    objc_exception_throw(v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)CNUICoreApplicationAuthorizationItem;
  v18 = [(CNUICoreApplicationAuthorizationItem *)&v33 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    icon = v18->_icon;
    v18->_icon = (NSData *)v19;

    uint64_t v21 = [v15 copy];
    name = v18->_name;
    v18->_name = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    bundleIdentifier = v18->_bundleIdentifier;
    v18->_bundleIdentifier = (NSString *)v23;

    v18->_deviceType = a6;
    v18->_authorization = a7;
    if (a8)
    {
      uint64_t v25 = [(CNUICoreApplicationAuthorizationItem *)v18 copy];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
    }
    snapshot = v18->_snapshot;
    v18->_snapshot = (CNUICoreApplicationAuthorizationItem *)v25;

    v27 = v18;
  }

  return v18;
}

- (CNUICoreApplicationAuthorizationItem)initWithIcon:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 deviceType:(int64_t)a6 authorization:(int64_t)a7
{
  return [(CNUICoreApplicationAuthorizationItem *)self initWithIcon:a3 name:a4 bundleIdentifier:a5 deviceType:a6 authorization:a7 shouldTakeSnapshot:1];
}

- (CNUICoreApplicationAuthorizationItem)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end