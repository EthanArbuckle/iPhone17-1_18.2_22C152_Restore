@interface ASDAppCapabilityMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataWithAction:(int64_t)a3 bundleID:(id)a4 capabilities:(id)a5;
+ (id)metadataWithAction:(int64_t)a3 entitlements:(id)a4 infoPlist:(id)a5;
- (ASDAppCapabilityMetadata)initWithCoder:(id)a3;
- (BOOL)supportsFeatureA;
- (BOOL)supportsFeatureB;
- (BOOL)supportsFeatureC;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)action;
- (int64_t)features;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setFeatures:(int64_t)a3;
- (void)setSupportsFeatureA:(BOOL)a3;
- (void)setSupportsFeatureB:(BOOL)a3;
- (void)setSupportsFeatureC:(BOOL)a3;
@end

@implementation ASDAppCapabilityMetadata

+ (id)metadataWithAction:(int64_t)a3 entitlements:(id)a4 infoPlist:(id)a5
{
  v6 = objc_opt_new();
  [v6 setAction:a3];
  [v6 setFeatures:0];
  return v6;
}

+ (id)metadataWithAction:(int64_t)a3 bundleID:(id)a4 capabilities:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = objc_opt_new();
  [v9 setAction:a3];
  [v9 setBundleID:v8];

  BOOL v10 = ([v7 containsObject:@"a"] & 1) != 0
     || [v7 containsObject:@"supports-alternate-distribution"];
  int v11 = [v7 containsObject:@"is-custom-browser-engine-app"];
  if ([v7 containsObject:@"uses-non-webkit-browser-engine"] | v11) {
    uint64_t v12 = v10 | 2;
  }
  else {
    uint64_t v12 = v10;
  }
  [v9 setFeatures:v12];

  return v9;
}

- (BOOL)supportsFeatureA
{
  return self->_features & 1;
}

- (void)setSupportsFeatureA:(BOOL)a3
{
  self->_features = self->_features & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)supportsFeatureB
{
  return (LOBYTE(self->_features) >> 1) & 1;
}

- (void)setSupportsFeatureB:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_features = self->_features & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDAppCapabilityMetadata allocWithZone:](ASDAppCapabilityMetadata, "allocWithZone:") init];
  v5->_action = self->_action;
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_features = self->_features;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppCapabilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDAppCapabilityMetadata *)self init];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"A"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_features = [v4 decodeIntegerForKey:@"C"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t action = self->_action;
  id v5 = a3;
  [v5 encodeInteger:action forKey:@"A"];
  [v5 encodeObject:self->_bundleID forKey:@"B"];
  [v5 encodeInteger:self->_features forKey:@"C"];
}

- (id)description
{
  if ([(NSString *)self->_bundleID length])
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@: ", self->_bundleID];
  }
  else
  {
    uint64_t v3 = &stru_1EEC399F8;
  }
  id v4 = [NSString stringWithFormat:@"%@Action: %ld Features: %ld", v3, self->_action, self->_features];

  return v4;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_int64_t action = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)supportsFeatureC
{
  return self->_supportsFeatureC;
}

- (void)setSupportsFeatureC:(BOOL)a3
{
  self->_supportsFeatureC = a3;
}

- (int64_t)features
{
  return self->_features;
}

- (void)setFeatures:(int64_t)a3
{
  self->_features = a3;
}

- (void).cxx_destruct
{
}

@end