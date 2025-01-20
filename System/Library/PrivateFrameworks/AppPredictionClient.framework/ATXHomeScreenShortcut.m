@interface ATXHomeScreenShortcut
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenShortcut)initWithCoder:(id)a3;
- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5;
- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5 isAppLaunchWorkflow:(BOOL)a6;
- (BOOL)isAppLaunchWorkflow;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenShortcut:(id)a3;
- (CGImage)icon;
- (NSString)bundleIdentifierForDisplay;
- (NSString)identifier;
- (NSString)name;
- (id)dictionaryRepresentationForIntrospection;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIcon:(CGImage *)a3;
@end

@implementation ATXHomeScreenShortcut

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5
{
  return [(ATXHomeScreenShortcut *)self initWithIdentifier:a3 name:a4 bundleIdentifierForDisplay:a5 isAppLaunchWorkflow:0];
}

- (ATXHomeScreenShortcut)initWithIdentifier:(id)a3 name:(id)a4 bundleIdentifierForDisplay:(id)a5 isAppLaunchWorkflow:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenShortcut;
  v13 = [(ATXHomeScreenShortcut *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    name = v13->_name;
    v13->_name = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    bundleIdentifierForDisplay = v13->_bundleIdentifierForDisplay;
    v13->_bundleIdentifierForDisplay = (NSString *)v18;

    v13->_isAppLaunchWorkflow = a6;
  }

  return v13;
}

- (void)setIcon:(CGImage *)a3
{
  icon = self->_icon;
  if (icon != a3)
  {
    if (icon)
    {
      CGImageRelease(icon);
      self->_icon = 0;
    }
    self->_icon = CGImageRetain(a3);
  }
}

- (void)dealloc
{
  icon = self->_icon;
  if (icon)
  {
    CGImageRelease(icon);
    self->_icon = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXHomeScreenShortcut;
  [(ATXHomeScreenShortcut *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_name forKey:@"name"];
  [v6 encodeObject:self->_bundleIdentifierForDisplay forKey:@"bundleId"];
  [v6 encodeObject:self->_identifier forKey:@"uuid"];
  [v6 encodeBool:self->_isAppLaunchWorkflow forKey:@"isAppLaunchWorkflow"];
  if (self->_icon)
  {
    objc_super v4 = (__CFData *)objc_opt_new();
    v5 = CGImageDestinationCreateWithData(v4, (CFStringRef)[(id)*MEMORY[0x1E4F44460] identifier], 1uLL, 0);
    CGImageDestinationAddImage(v5, self->_icon, 0);
    CGImageDestinationFinalize(v5);
    CFRelease(v5);
    if ([(__CFData *)v4 length]) {
      [v6 encodeObject:v4 forKey:@"icon"];
    }
  }
}

- (ATXHomeScreenShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXHomeScreenShortcut;
  v5 = [(ATXHomeScreenShortcut *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleIdentifierForDisplay = v5->_bundleIdentifierForDisplay;
    v5->_bundleIdentifierForDisplay = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    v5->_isAppLaunchWorkflow = [v4 decodeBoolForKey:@"isAppLaunchWorkflow"];
    CFDataRef v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    if ([(__CFData *)v12 length])
    {
      v13 = CGDataProviderCreateWithCFData(v12);
      if (v13)
      {
        uint64_t v14 = v13;
        v5->_icon = CGImageCreateWithPNGDataProvider(v13, 0, 0, kCGRenderingIntentDefault);
        CGDataProviderRelease(v14);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] - v3 + 32 * v3;
  return [(NSString *)self->_bundleIdentifierForDisplay hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXHomeScreenShortcut *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenShortcut *)self isEqualToATXHomeScreenShortcut:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenShortcut:(id)a3
{
  NSUInteger v4 = (id *)a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = identifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  name = self->_name;
  id v11 = (NSString *)v4[3];
  if (name == v11)
  {
  }
  else
  {
    CFDataRef v12 = v11;
    v13 = name;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  objc_super v16 = self->_bundleIdentifierForDisplay;
  v17 = v16;
  if (v16 == v4[4]) {
    char v15 = 1;
  }
  else {
    char v15 = -[NSString isEqual:](v16, "isEqual:");
  }

LABEL_13:
  return v15;
}

- (id)dictionaryRepresentationForIntrospection
{
  v10[4] = *MEMORY[0x1E4F143B8];
  identifier = self->_identifier;
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"<nil>";
  }
  v9[0] = @"name";
  v9[1] = @"bundleId";
  bundleIdentifierForDisplay = (__CFString *)self->_bundleIdentifierForDisplay;
  if (!bundleIdentifierForDisplay) {
    bundleIdentifierForDisplay = @"<nil>";
  }
  v10[0] = name;
  v10[1] = bundleIdentifierForDisplay;
  if (identifier) {
    v5 = (__CFString *)identifier;
  }
  else {
    v5 = @"<nil>";
  }
  v9[2] = @"uuid";
  v9[3] = @"isAppLaunchWorkflow";
  if (self->_isAppLaunchWorkflow) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  v10[2] = v5;
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (BOOL)isAppLaunchWorkflow
{
  return self->_isAppLaunchWorkflow;
}

- (CGImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end