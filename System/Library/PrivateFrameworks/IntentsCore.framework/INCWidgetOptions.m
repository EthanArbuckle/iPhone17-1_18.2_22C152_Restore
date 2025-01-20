@interface INCWidgetOptions
- (INCWidgetOptions)initWithExtensionBundleIdentifier:(id)a3 intentType:(id)a4;
- (NSString)extensionBundleIdentifier;
- (NSString)intentType;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setIntentType:(id)a3;
@end

@implementation INCWidgetOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (void)setIntentType:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (INCWidgetOptions)initWithExtensionBundleIdentifier:(id)a3 intentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCWidgetOptions;
  v8 = [(INCWidgetOptions *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    intentType = v8->_intentType;
    v8->_intentType = (NSString *)v11;
  }
  return v8;
}

@end