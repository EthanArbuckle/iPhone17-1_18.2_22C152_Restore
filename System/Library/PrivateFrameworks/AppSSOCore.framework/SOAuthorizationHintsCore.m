@interface SOAuthorizationHintsCore
+ (BOOL)supportsSecureCoding;
- (NSString)localizedExtensionBundleDisplayName;
- (SOAuthorizationHintsCore)initWithCoder:(id)a3;
- (SOAuthorizationHintsCore)initWithLocalizedExtensionBundleDisplayName:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOAuthorizationHintsCore

- (SOAuthorizationHintsCore)initWithLocalizedExtensionBundleDisplayName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationHintsCore;
  v6 = [(SOAuthorizationHintsCore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localizedExtensionBundleDisplayName, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationHintsCore)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOAuthorizationHintsCore;
  id v5 = [(SOAuthorizationHintsCore *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_localizedExtensionBundleDisplayName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    localizedExtensionBundleDisplayName = v5->_localizedExtensionBundleDisplayName;
    v5->_localizedExtensionBundleDisplayName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedExtensionBundleDisplayName = self->_localizedExtensionBundleDisplayName;
  id v4 = a3;
  NSStringFromSelector(sel_localizedExtensionBundleDisplayName);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:localizedExtensionBundleDisplayName forKey:v5];
}

- (id)description
{
  v7[1] = *MEMORY[0x1E4F143B8];
  localizedExtensionBundleDisplayName = @"(null)";
  if (self->_localizedExtensionBundleDisplayName) {
    localizedExtensionBundleDisplayName = (__CFString *)self->_localizedExtensionBundleDisplayName;
  }
  uint64_t v6 = @"localizedExtensionBundleDisplayName";
  v7[0] = localizedExtensionBundleDisplayName;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v3 description];

  return v4;
}

- (NSString)localizedExtensionBundleDisplayName
{
  return self->_localizedExtensionBundleDisplayName;
}

- (void).cxx_destruct
{
}

@end