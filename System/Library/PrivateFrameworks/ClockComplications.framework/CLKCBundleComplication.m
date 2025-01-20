@interface CLKCBundleComplication
+ (BOOL)supportsSecureCoding;
+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4;
+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLKCBundleComplication)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5;
- (CLKCBundleComplication)initWithCoder:(id)a3;
- (CLKComplicationDescriptor)complicationDescriptor;
- (NSString)appBundleIdentifier;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKCBundleComplication

+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v10 appBundleIdentifier:v9 complicationDescriptor:v8];

  return v11;
}

+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v7 appBundleIdentifier:v6 complicationDescriptor:0];

  return v8;
}

- (CLKCBundleComplication)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLKCBundleComplication;
  v11 = [(CLKCBundleComplication *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    appBundleIdentifier = v11->_appBundleIdentifier;
    v11->_appBundleIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_complicationDescriptor, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CLKCBundleComplication;
  v4 = [(CLKCBundleComplication *)&v9 description];
  v5 = [(CLKCBundleComplication *)self bundleIdentifier];
  id v6 = [(CLKCBundleComplication *)self appBundleIdentifier];
  id v7 = [v3 stringWithFormat:@"%@: bundleId=%@, appBundleId=%@", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CLKCBundleComplication *)self bundleIdentifier];
    id v7 = [v5 bundleIdentifier];
    if (v6 == v7 || [v6 isEqual:v7])
    {
      id v8 = [(CLKCBundleComplication *)self complicationDescriptor];
      objc_super v9 = [v5 complicationDescriptor];
      if (v8 == v9) {
        char v10 = 1;
      }
      else {
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(CLKCBundleComplication *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CLKCBundleComplication *)self complicationDescriptor];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKCBundleComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKCBundleComplication;
  id v5 = [(CLKCBundleComplication *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CLKCBundleComplicationBundleIdentifierKey"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CLKCBundleComplicationAppBundleIdentifierKey"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CLKCBundleComplicationComplicationDescriptorKey"];
    complicationDescriptor = v5->_complicationDescriptor;
    v5->_complicationDescriptor = (CLKComplicationDescriptor *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"CLKCBundleComplicationBundleIdentifierKey"];
  [v5 encodeObject:self->_appBundleIdentifier forKey:@"CLKCBundleComplicationAppBundleIdentifierKey"];
  [v5 encodeObject:self->_complicationDescriptor forKey:@"CLKCBundleComplicationComplicationDescriptorKey"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end