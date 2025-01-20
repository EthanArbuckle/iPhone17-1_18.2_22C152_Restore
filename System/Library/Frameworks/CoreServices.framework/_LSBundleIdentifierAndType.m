@interface _LSBundleIdentifierAndType
+ (id)createRepresentingProxy:(id)a3;
+ (id)createRepresentingRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)type;
- (_LSBundleIdentifierAndType)initWithBundleID:(id)a3 type:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _LSBundleIdentifierAndType

- (_LSBundleIdentifierAndType)initWithBundleID:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LSBundleIdentifierAndType;
  v9 = [(_LSBundleIdentifierAndType *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_type, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  return [(NSString *)self->_type hash] ^ (2 * v3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 bundleID];
    if ([v6 isEqualToString:self->_bundleID])
    {
      id v7 = [v5 type];
      char v8 = [v7 isEqual:self->_type];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_LSBundleIdentifierAndType alloc];
  bundleID = self->_bundleID;
  type = self->_type;

  return [(_LSBundleIdentifierAndType *)v4 initWithBundleID:bundleID type:type];
}

+ (id)createRepresentingProxy:(id)a3
{
  id v4 = [a3 correspondingApplicationRecord];
  id v5 = [a1 createRepresentingRecord:v4];

  return v5;
}

+ (id)createRepresentingRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  v6 = [v4 typeForInstallMachinery];

  id v7 = 0;
  if (v5 && v6) {
    id v7 = (void *)[objc_alloc((Class)a1) initWithBundleID:v5 type:v6];
  }

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end