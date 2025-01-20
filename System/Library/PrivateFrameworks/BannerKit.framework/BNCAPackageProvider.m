@interface BNCAPackageProvider
+ (BOOL)supportsSecureCoding;
- (BNCAPackageProvider)initWithCoder:(id)a3;
- (BNCAPackageProvider)initWithPackageName:(id)a3 inBundle:(id)a4 state:(id)a5;
- (BOOL)isCAPackageProvider;
- (NSBundle)bundle;
- (NSString)name;
- (NSString)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BNCAPackageProvider

- (BNCAPackageProvider)initWithPackageName:(id)a3 inBundle:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 length])
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BNCAPackageProvider.m", 31, @"Invalid parameter not satisfying: %@", @"[name length] > 0" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"BNCAPackageProvider.m", 32, @"Invalid parameter not satisfying: %@", @"bundle" object file lineNumber description];

LABEL_3:
  if (![v11 length])
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BNCAPackageProvider.m", 33, @"Invalid parameter not satisfying: %@", @"[state length] > 0" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)BNCAPackageProvider;
  v12 = [(BNCAPackageProvider *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    bundle = v12->_bundle;
    v12->_bundle = (NSBundle *)v15;

    uint64_t v17 = [v11 copy];
    state = v12->_state;
    v12->_state = (NSString *)v17;
  }
  return v12;
}

- (BOOL)isCAPackageProvider
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)state
{
  return self->_state;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_bundle forKey:@"bundle"];
  [v5 encodeObject:self->_state forKey:@"state"];
}

- (BNCAPackageProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];

  v8 = [(BNCAPackageProvider *)self initWithPackageName:v5 inBundle:v6 state:v7];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end