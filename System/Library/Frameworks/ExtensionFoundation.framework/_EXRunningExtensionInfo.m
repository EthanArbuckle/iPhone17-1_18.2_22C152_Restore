@interface _EXRunningExtensionInfo
+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess;
+ (void)notifyExtensionMainCalled;
- (NSString)bundleIdentifier;
- (NSString)containerBundleIdentifier;
- (NSString)containingViewControllerClassName;
- (NSString)runLoopType;
- (id)initForCurrentProcess;
@end

@implementation _EXRunningExtensionInfo

+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess
{
  if (s_extensionMainCalled == 1)
  {
    if (extensionInfoForCurrentProcess_onceToken != -1) {
      dispatch_once(&extensionInfoForCurrentProcess_onceToken, &__block_literal_global_2);
    }
    id v2 = (id)extensionInfoForCurrentProcess_extensionForCurrentProcess;
  }
  else
  {
    id v2 = 0;
  }

  return (_EXRunningExtensionInfo *)v2;
}

+ (void)notifyExtensionMainCalled
{
  if (notifyExtensionMainCalled_onceToken != -1) {
    dispatch_once(&notifyExtensionMainCalled_onceToken, &__block_literal_global_3);
  }
}

- (id)initForCurrentProcess
{
  v20.receiver = self;
  v20.super_class = (Class)_EXRunningExtensionInfo;
  id v2 = [(_EXRunningExtensionInfo *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v5 = [v4 bundleIdentifier];
      bundleIdentifier = v2->_bundleIdentifier;
      v2->_bundleIdentifier = (NSString *)v5;

      v7 = [v4 containingBundleRecord];
      uint64_t v8 = [v7 bundleIdentifier];
      containerBundleIdentifier = v2->_containerBundleIdentifier;
      v2->_containerBundleIdentifier = (NSString *)v8;

      v10 = [v4 extensionPointRecord];

      v11 = [v10 SDKDictionary];
      v12 = [v11 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

      uint64_t v13 = objc_msgSend(v12, "_EX_stringForKey:", @"NSExtensionContainingViewControllerClass");
      containingViewControllerClassName = v2->_containingViewControllerClassName;
      v2->_containingViewControllerClassName = (NSString *)v13;

      v15 = [v10 SDKDictionary];
      v16 = [v15 objectForKey:@"XPCService" ofClass:objc_opt_class()];

      uint64_t v17 = objc_msgSend(v16, "_EX_stringForKey:", @"RunLoopType");
      runLoopType = v2->_runLoopType;
      v2->_runLoopType = (NSString *)v17;
    }
    else
    {
      v10 = v2;
      id v2 = 0;
    }
  }
  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)containingViewControllerClassName
{
  return self->_containingViewControllerClassName;
}

- (NSString)runLoopType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopType, 0);
  objc_storeStrong((id *)&self->_containingViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end