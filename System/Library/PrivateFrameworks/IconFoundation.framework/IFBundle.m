@interface IFBundle
+ (id)appIconOverrideBundle;
+ (id)bundleWithURL:(id)a3;
+ (id)coreGlyphsBundle;
+ (id)coreGlyphsPrivateBundle;
+ (id)coreTypesBundle;
+ (id)frameworkBundle;
+ (id)frameworkLocalizedString:(id)a3;
+ (id)iconFoundationFrameworkBundle;
+ (id)iconsetResourceAssetsCatalogURL;
+ (id)iconsetResourceBundle;
+ (id)mainBundle;
+ (id)mobileIconsFrameworkBundle;
- (BOOL)isCoreTypes;
- (IFBundle)initWithCFBundle:(__CFBundle *)a3;
- (IFBundle)initWithURL:(id)a3;
- (IFPlistParser)plistParser;
- (NSDictionary)iconDictionary;
- (NSDictionary)infoDictionary;
- (NSString)bundleID;
- (NSURL)assetCatalogURL;
- (NSURL)bundleURL;
- (__CFBundle)bundle;
- (id)URLForResource:(id)a3;
- (id)URLForResource:(id)a3 withExtension:(id)a4;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5;
- (id)URLsForResources:(id)a3;
- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (unint64_t)platform;
- (void)dealloc;
- (void)setBundle:(__CFBundle *)a3;
- (void)setPlistParser:(id)a3;
@end

@implementation IFBundle

+ (id)frameworkBundle
{
  if (frameworkBundle_onceToken != -1) {
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)frameworkBundle_frameworkBundle;

  return v2;
}

void __27__IFBundle_frameworkBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/PrivateFrameworks/IconServices.framework"];
  v0 = [[IFBundle alloc] initWithURL:v2];
  v1 = (void *)frameworkBundle_frameworkBundle;
  frameworkBundle_frameworkBundle = (uint64_t)v0;
}

+ (id)iconFoundationFrameworkBundle
{
  if (iconFoundationFrameworkBundle_onceToken != -1) {
    dispatch_once(&iconFoundationFrameworkBundle_onceToken, &__block_literal_global_7);
  }
  id v2 = (void *)iconFoundationFrameworkBundle_bundle;

  return v2;
}

void __41__IFBundle_iconFoundationFrameworkBundle__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 bundleURL];

  v1 = [[IFBundle alloc] initWithURL:v3];
  id v2 = (void *)iconFoundationFrameworkBundle_bundle;
  iconFoundationFrameworkBundle_bundle = (uint64_t)v1;
}

+ (id)mobileIconsFrameworkBundle
{
  if (mobileIconsFrameworkBundle_onceToken != -1) {
    dispatch_once(&mobileIconsFrameworkBundle_onceToken, &__block_literal_global_10);
  }
  id v2 = (void *)mobileIconsFrameworkBundle_frameworkBundle;

  return v2;
}

void __38__IFBundle_mobileIconsFrameworkBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/PrivateFrameworks/MobileIcons.framework"];
  v0 = [[IFBundle alloc] initWithURL:v2];
  v1 = (void *)mobileIconsFrameworkBundle_frameworkBundle;
  mobileIconsFrameworkBundle_frameworkBundle = (uint64_t)v0;
}

+ (id)iconsetResourceBundle
{
  if (iconsetResourceBundle_onceToken != -1) {
    dispatch_once(&iconsetResourceBundle_onceToken, &__block_literal_global_15);
  }
  id v2 = (void *)iconsetResourceBundle_resourceBundle;

  return v2;
}

void __33__IFBundle_iconsetResourceBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/IconsetResources.bundle"];
  v0 = [[IFBundle alloc] initWithURL:v2];
  v1 = (void *)iconsetResourceBundle_resourceBundle;
  iconsetResourceBundle_resourceBundle = (uint64_t)v0;
}

+ (id)mainBundle
{
  if (mainBundle_onceToken != -1) {
    dispatch_once(&mainBundle_onceToken, &__block_literal_global_20);
  }
  id v2 = (void *)mainBundle_mainBundle;

  return v2;
}

uint64_t __22__IFBundle_mainBundle__block_invoke()
{
  mainBundle_mainBundle = [[IFBundle alloc] initWithCFBundle:CFBundleGetMainBundle()];

  return MEMORY[0x1F41817F8]();
}

+ (id)coreTypesBundle
{
  if (coreTypesBundle_onceToken != -1) {
    dispatch_once(&coreTypesBundle_onceToken, &__block_literal_global_22);
  }
  id v2 = (void *)coreTypesBundle_coreTypesBundle;

  return v2;
}

void __27__IFBundle_coreTypesBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle"];
  v0 = [[IFBundle alloc] initWithURL:v2];
  v1 = (void *)coreTypesBundle_coreTypesBundle;
  coreTypesBundle_coreTypesBundle = (uint64_t)v0;
}

+ (id)coreGlyphsBundle
{
  if (coreGlyphsBundle_onceToken != -1) {
    dispatch_once(&coreGlyphsBundle_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)coreGlyphsBundle_coreGlyphsBundle;

  return v2;
}

void __28__IFBundle_coreGlyphsBundle__block_invoke()
{
  v0 = [IFBundle alloc];
  id v3 = [MEMORY[0x1E4F1CB10] coreGlyphsBundleURL];
  uint64_t v1 = [(IFBundle *)v0 initWithURL:v3];
  id v2 = (void *)coreGlyphsBundle_coreGlyphsBundle;
  coreGlyphsBundle_coreGlyphsBundle = v1;
}

+ (id)coreGlyphsPrivateBundle
{
  if (coreGlyphsPrivateBundle_onceToken != -1) {
    dispatch_once(&coreGlyphsPrivateBundle_onceToken, &__block_literal_global_26);
  }
  id v2 = (void *)coreGlyphsPrivateBundle_coreGlyphsBundle;

  return v2;
}

void __35__IFBundle_coreGlyphsPrivateBundle__block_invoke()
{
  v0 = [IFBundle alloc];
  id v3 = [MEMORY[0x1E4F1CB10] coreGlyphsPrivateBundleURL];
  uint64_t v1 = [(IFBundle *)v0 initWithURL:v3];
  id v2 = (void *)coreGlyphsPrivateBundle_coreGlyphsBundle;
  coreGlyphsPrivateBundle_coreGlyphsBundle = v1;
}

+ (id)appIconOverrideBundle
{
  if (appIconOverrideBundle_onceToken != -1) {
    dispatch_once(&appIconOverrideBundle_onceToken, &__block_literal_global_28);
  }
  id v2 = (void *)appIconOverrideBundle_bundle;

  return v2;
}

void __33__IFBundle_appIconOverrideBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/Library/Bundles/AppIconOverrides.bundle"];
  v0 = [[IFBundle alloc] initWithURL:v2];
  uint64_t v1 = (void *)appIconOverrideBundle_bundle;
  appIconOverrideBundle_bundle = (uint64_t)v0;
}

+ (id)iconsetResourceAssetsCatalogURL
{
  id v2 = +[IFBundle iconsetResourceBundle];
  id v3 = [v2 URLForResource:@"Assets" withExtension:@"car"];

  return v3;
}

+ (id)frameworkLocalizedString:(id)a3
{
  id v3 = a3;
  v4 = +[IFBundle frameworkBundle];
  v5 = [v4 localizedStringForKey:v3 value:&stru_1F37B9820 table:0];

  return v5;
}

+ (id)bundleWithURL:(id)a3
{
  uint64_t Unique = _CFBundleCreateUnique();
  if (Unique)
  {
    v4 = (const void *)Unique;
    v5 = [[IFBundle alloc] initWithCFBundle:Unique];
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IFBundle)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFBundle;
  v5 = [(IFBundle *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    v5->_bundle = (__CFBundle *)_CFBundleCreateUnique();
    v7 = [v4 absoluteURL];
    v8 = [v7 path];
    v6->_coreTypes = [v8 isEqual:@"/System/Library/CoreServices/MobileCoreTypes.bundle"];
  }
  return v6;
}

- (IFBundle)initWithCFBundle:(__CFBundle *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IFBundle;
  id v4 = [(IFBundle *)&v10 init];
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_bundle = a3;
    CFURLRef v6 = CFBundleCopyBundleURL(a3);
    v7 = [(__CFURL *)v6 absoluteURL];
    v8 = [v7 path];
    v5->_coreTypes = [v8 isEqual:@"/System/Library/CoreServices/MobileCoreTypes.bundle"];
  }
  return v5;
}

- (void)dealloc
{
  bundle = self->_bundle;
  if (bundle) {
    CFRelease(bundle);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFBundle;
  [(IFBundle *)&v4 dealloc];
}

- (NSURL)assetCatalogURL
{
  return (NSURL *)[(IFBundle *)self URLForResource:@"Assets" withExtension:@"car"];
}

- (id)URLForResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringByDeletingPathExtension];
  CFURLRef v6 = [v4 pathExtension];

  v7 = [(IFBundle *)self URLForResource:v5 withExtension:v6 subdirectory:0];

  return v7;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4
{
  return [(IFBundle *)self URLForResource:a3 withExtension:a4 subdirectory:0];
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  bundle = self->_bundle;
  if (bundle) {
    bundle = CFBundleCopyResourceURL(bundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
  }

  return bundle;
}

- (id)URLsForResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[IFBundle URLForResource:](self, "URLForResource:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4
{
  bundle = self->_bundle;
  if (bundle) {
    bundle = CFBundleCopyResourceURLsOfType(bundle, (CFStringRef)a3, (CFStringRef)a4);
  }

  return bundle;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  bundle = self->_bundle;
  if (bundle) {
    bundle = (__CFBundle *)CFBundleCopyLocalizedString(bundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
  }

  return bundle;
}

- (NSURL)bundleURL
{
  bundle = self->_bundle;
  if (bundle) {
    CFURLRef v3 = CFBundleCopyBundleURL(bundle);
  }
  else {
    CFURLRef v3 = 0;
  }
  id v4 = (void *)[(__CFURL *)v3 copy];

  return (NSURL *)v4;
}

- (NSString)bundleID
{
  bundle = self->_bundle;
  if (bundle)
  {
    CFURLRef v3 = CFBundleGetIdentifier(bundle);
  }
  else
  {
    CFURLRef v3 = 0;
  }
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSDictionary)infoDictionary
{
  bundle = self->_bundle;
  if (bundle)
  {
    CFURLRef v3 = CFBundleGetInfoDictionary(bundle);
  }
  else
  {
    CFURLRef v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v3;
}

- (IFPlistParser)plistParser
{
  plistParser = self->_plistParser;
  if (!plistParser)
  {
    if (self->_bundle)
    {
      id v4 = [IFPlistParser alloc];
      v5 = [(IFBundle *)self infoDictionary];
      id v6 = [(IFPlistParser *)v4 initWithInfoDictionary:v5];
      uint64_t v7 = self->_plistParser;
      self->_plistParser = v6;

      plistParser = self->_plistParser;
    }
    else
    {
      plistParser = 0;
    }
  }

  return plistParser;
}

- (NSDictionary)iconDictionary
{
  id v2 = [(IFBundle *)self plistParser];
  CFURLRef v3 = [v2 iconDictionary];

  return (NSDictionary *)v3;
}

- (unint64_t)platform
{
  if (![(IFBundle *)self bundle]) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(IFBundle *)self bundleURL];
  v5 = (void *)[v3 initWithURL:v4 allowPlaceholder:1 error:0];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F223A0]);
    uint64_t v7 = [(IFBundle *)self bundleURL];
    v5 = (void *)[v6 initWithURL:v7 error:0];
  }
  if ([v5 platform] == 1)
  {
    unint64_t v8 = 1;
  }
  else if ([v5 platform] == 2 || objc_msgSend(v5, "platform") == 7)
  {
    unint64_t v8 = 4;
  }
  else if ([v5 platform] == 6)
  {
    unint64_t v8 = 2;
  }
  else if ([v5 platform] == 4 || objc_msgSend(v5, "platform") == 9)
  {
    unint64_t v8 = 8;
  }
  else if ([v5 platform] == 11 || objc_msgSend(v5, "platform") == 12)
  {
    unint64_t v8 = 16;
  }
  else if ([v5 platform] == 3 || objc_msgSend(v5, "platform") == 8)
  {
    unint64_t v8 = 32;
  }
  else if ([v5 platform])
  {
    unint64_t v8 = 0;
  }
  else
  {
    objc_super v10 = [(IFBundle *)self plistParser];
    unint64_t v8 = [v10 supportedPlatform];
  }
  return v8;
}

- (BOOL)isCoreTypes
{
  return self->_coreTypes;
}

- (__CFBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(__CFBundle *)a3
{
  self->_bundle = a3;
}

- (void)setPlistParser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end