@interface AXQuickSettingsData
+ (BOOL)supportsSecureCoding;
- (AXQuickSettingsData)initWithCoder:(id)a3;
- (NSString)frontmostAppIdentifier;
- (NSString)webAreaURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFrontmostAppIdentifier:(id)a3;
- (void)setWebAreaURL:(id)a3;
@end

@implementation AXQuickSettingsData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXQuickSettingsData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXQuickSettingsData;
  v5 = [(AXQuickSettingsData *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frontmostAppIdentifier"];
    [(AXQuickSettingsData *)v5 setFrontmostAppIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webAreaURL"];
    [(AXQuickSettingsData *)v5 setWebAreaURL:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXQuickSettingsData *)self frontmostAppIdentifier];
  [v4 encodeObject:v5 forKey:@"frontmostAppIdentifier"];

  id v6 = [(AXQuickSettingsData *)self webAreaURL];
  [v4 encodeObject:v6 forKey:@"webAreaURL"];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXQuickSettingsData;
  id v4 = [(AXQuickSettingsData *)&v8 description];
  v5 = [(AXQuickSettingsData *)self frontmostAppIdentifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)frontmostAppIdentifier
{
  return self->_frontmostAppIdentifier;
}

- (void)setFrontmostAppIdentifier:(id)a3
{
}

- (NSString)webAreaURL
{
  return self->_webAreaURL;
}

- (void)setWebAreaURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAreaURL, 0);

  objc_storeStrong((id *)&self->_frontmostAppIdentifier, 0);
}

@end