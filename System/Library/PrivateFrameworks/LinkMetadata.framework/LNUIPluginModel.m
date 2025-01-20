@interface LNUIPluginModel
+ (BOOL)supportsSecureCoding;
- (LNUIPluginModel)initWithCoder:(id)a3;
- (LNUIPluginModel)initWithPluginModelData:(id)a3 bundleIdentifier:(id)a4;
- (NSData)pluginModelData;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNUIPluginModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginModelData, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSData)pluginModelData
{
  return self->_pluginModelData;
}

- (LNUIPluginModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pluginModelData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNUIPluginModel *)self initWithPluginModelData:v5 bundleIdentifier:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNUIPluginModel *)self pluginModelData];
  [v4 encodeObject:v5 forKey:@"pluginModelData"];

  id v6 = [(LNUIPluginModel *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];
}

- (LNUIPluginModel)initWithPluginModelData:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNUIPluginModel;
  v9 = [(LNUIPluginModel *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginModelData, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end