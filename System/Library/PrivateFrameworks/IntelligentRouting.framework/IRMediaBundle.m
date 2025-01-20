@interface IRMediaBundle
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (IRMediaBundle)init;
- (IRMediaBundle)initWithBundleType:(int64_t)a3 andIdentifier:(id)a4;
- (IRMediaBundle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bundleType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRMediaBundle

- (IRMediaBundle)initWithBundleType:(int64_t)a3 andIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)IRMediaBundle;
  result = [(IRBundle *)&v6 initWithIdentifier:a4];
  if (result) {
    result->_bundleType = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IRMediaBundle;
  v4 = [(IRBundle *)&v7 copyWithZone:a3];
  v4[2] = [(IRMediaBundle *)self bundleType];
  v5 = self;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IRMediaBundle;
  id v4 = a3;
  [(IRBundle *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", self->_bundleType, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"bundleType"];
}

- (IRMediaBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRMediaBundle;
  v5 = [(IRBundle *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleType"];
    objc_super v7 = v6;
    if (v6)
    {
      int64_t v8 = (int)[(IRMediaBundle *)v6 intValue];

      v5->_bundleType = v8;
      objc_super v7 = v5;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (IRMediaBundle)init
{
}

+ (id)new
{
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  objc_super v7 = [(IRBundle *)self identifier];
  [v6 appendFormat:@", identifier: %@", v7];

  unint64_t bundleType = self->_bundleType;
  if (bundleType > 2) {
    v9 = @"Invalid";
  }
  else {
    v9 = off_26539E568[bundleType];
  }
  [v6 appendFormat:@", bundleType: %@", v9];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IRMediaBundle *)self bundleType];
    if (v6 == [v5 bundleType])
    {
      objc_super v7 = [(IRBundle *)self identifier];
      int64_t v8 = [v5 identifier];
      if ([v7 isEqual:v8])
      {

        char v9 = 1;
      }
      else
      {
        objc_super v10 = [(IRBundle *)self identifier];
        v11 = [v5 identifier];
        BOOL v12 = v10 != v11;

        char v9 = !v12;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)IRMediaBundle;
  return [(IRBundle *)&v3 hash] ^ self->_bundleType ^ 0x1F;
}

- (int64_t)bundleType
{
  return self->_bundleType;
}

@end