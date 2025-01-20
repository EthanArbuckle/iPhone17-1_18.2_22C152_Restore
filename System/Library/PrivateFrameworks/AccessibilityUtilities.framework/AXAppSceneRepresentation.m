@interface AXAppSceneRepresentation
+ (BOOL)supportsSecureCoding;
- (AXAppSceneRepresentation)init;
- (AXAppSceneRepresentation)initWithBundleIdentifier:(id)a3 fbSceneIdentifier:(id)a4;
- (AXAppSceneRepresentation)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)fbSceneIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXAppSceneRepresentation

- (AXAppSceneRepresentation)init
{
  return [(AXAppSceneRepresentation *)self initWithBundleIdentifier:0 fbSceneIdentifier:0];
}

- (AXAppSceneRepresentation)initWithBundleIdentifier:(id)a3 fbSceneIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXAppSceneRepresentation;
  v9 = [(AXAppSceneRepresentation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_fbSceneIdentifier, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXAppSceneRepresentation *)self bundleIdentifier];
  v5 = [(AXAppSceneRepresentation *)self fbSceneIdentifier];
  v6 = [v3 stringWithFormat:@"AXAppScene<%p>: bundleIdentifier:%@ fbSceneIdentifier:%@", self, v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXAppSceneRepresentation *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = [(AXAppSceneRepresentation *)self fbSceneIdentifier];
  [v4 encodeObject:v6 forKey:@"fbSceneIdentifier"];
}

- (AXAppSceneRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fbSceneIdentifier"];

  id v7 = [(AXAppSceneRepresentation *)self initWithBundleIdentifier:v5 fbSceneIdentifier:v6];
  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)fbSceneIdentifier
{
  return self->_fbSceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbSceneIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end