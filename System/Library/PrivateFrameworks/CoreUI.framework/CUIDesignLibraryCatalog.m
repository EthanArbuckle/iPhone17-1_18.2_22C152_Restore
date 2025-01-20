@interface CUIDesignLibraryCatalog
+ (id)_bundleNameForResolvedDesignSystem:(int64_t)a3;
+ (id)_catalogPathComponentForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7;
+ (id)catalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7;
- (CUIDesignLibraryCatalog)initWithURL:(id)a3 error:(id *)a4;
- (id)_colorNameStringFromNameEnum:(int64_t)a3 palette:(int64_t)a4;
- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6;
- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7;
- (id)description;
- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4;
- (int64_t)colorScheme;
- (int64_t)contrast;
- (int64_t)designSystem;
- (int64_t)styling;
- (void)dealloc;
- (void)setColorScheme:(int64_t)a3;
- (void)setContrast:(int64_t)a3;
- (void)setDesignSystem:(int64_t)a3;
- (void)setStyling:(int64_t)a3;
@end

@implementation CUIDesignLibraryCatalog

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7
{
  kdebug_trace();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = (char *)self + 896 * a4 + 32 * a3 + 8 * a6;
  CFNullRef v16 = (const __CFNull *)*((void *)v13 + 3);
  v15 = (CFNullRef *)(v13 + 24);
  CFNullRef v14 = v16;
  if (v16 == kCFNull)
  {
    v17 = 0;
    goto LABEL_54;
  }
  v17 = v14;
  if (v17)
  {
LABEL_54:
    os_unfair_lock_unlock(p_lock);
    kdebug_trace();
    return v17;
  }
  id v18 = [(CUIDesignLibraryCatalog *)self _colorNameStringFromNameEnum:a3 palette:a4];
  unsigned int v38 = 0;
  uint64_t v37 = 0;
  if (a3 == 11)
  {
    v20 = (CFStringRef *)&kCGColorWhite;
    unsigned int v21 = -1;
LABEL_8:
    unsigned int v38 = v21;
    ConstantColor = CGColorGetConstantColor(*v20);
    CGColorRetain(ConstantColor);
    if (ConstantColor) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (a3 == 12)
  {
    v20 = (CFStringRef *)&kCGColorBlack;
    unsigned int v21 = -16777216;
    goto LABEL_8;
  }
  id v23 = v18;
  if (objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v19), "getPhysicalColor:withName:", &v37, v18))
  {
    unsigned int v21 = v38;
LABEL_12:
    if (BYTE2(v21) == BYTE1(v21) && BYTE1(v21) == v21)
    {
      CGFloat components = (double)BYTE2(v21) / 255.0;
      double v40 = (double)HIBYTE(v21) / 255.0;
      GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    }
    else
    {
      CGFloat components = (double)BYTE2(v21) / 255.0;
      double v40 = (double)BYTE1(v21) / 255.0;
      double v41 = (double)v21 / 255.0;
      double v42 = (double)HIBYTE(v21) / 255.0;
      GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    }
    ConstantColor = CGColorCreate(GrayGamma2_2, &components);
LABEL_17:
    int64_t v25 = [(CUIDesignLibraryCatalog *)self colorScheme];
    int64_t v26 = [(CUIDesignLibraryCatalog *)self styling];
    uint64_t v27 = 0;
    if ((unint64_t)(a3 - 13) <= 0xFFFFFFFFFFFFFFFDLL && v26 == 1)
    {
      if (v25 == 1) {
        int v28 = 27;
      }
      else {
        int v28 = 0;
      }
      if (!v25) {
        int v28 = 26;
      }
      if (BYTE2(v38) == v38) {
        unsigned int v29 = v28;
      }
      else {
        unsigned int v29 = 0;
      }
      if (BYTE2(v38) != BYTE1(v38)) {
        unsigned int v29 = 0;
      }
      if (HIBYTE(v38) == 255) {
        uint64_t v27 = v29;
      }
      else {
        uint64_t v27 = 0;
      }
    }
    if ((unint64_t)(a6 - 1) > 2 || !ConstantColor) {
      goto LABEL_53;
    }
    double v30 = colorWithName_palette_displayGamut_hierarchyLevel_error__CUIHierarchicalColorOpacities[a6];
    if (v25 == 1)
    {
      BOOL v31 = (a3 == 10 || a3 == 0) && a6 == 2;
      double v32 = 0.2;
    }
    else
    {
      if (v25)
      {
LABEL_52:
        CGFloat Alpha = CGColorGetAlpha(ConstantColor);
        CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(ConstantColor, v30 * Alpha);
        CGColorRelease(ConstantColor);
        ConstantColor = CopyWithAlpha;
LABEL_53:
        v17 = [[CUIDesignColor alloc] initWithColor:ConstantColor blendMode:v27 displayGamut:0];
        CGColorRelease(ConstantColor);
        CFNullRef *v15 = (CFNullRef)v17;
        goto LABEL_54;
      }
      BOOL v31 = a6 == 1 && a3 == 2;
      double v32 = 0.3;
    }
    if (v31) {
      double v30 = v32;
    }
    goto LABEL_52;
  }
  if (a7) {
    *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:@"The requested color, %@, could not be found in the %@ CUIDesignLibrary catalog.", v23, self->_assetStoreName], NSLocalizedDescriptionKey, 0));
  }
  CFNullRef *v15 = kCFNull;
  os_unfair_lock_unlock(&self->_lock);
  kdebug_trace();
  return 0;
}

- (int64_t)styling
{
  return self->_styling;
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (id)_colorNameStringFromNameEnum:(int64_t)a3 palette:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 3) {
    v4 = @"system";
  }
  else {
    v4 = off_1E5A51E18[a4 - 1];
  }
  id result = @"systemWhiteColor";
  switch(a3)
  {
    case 0:
      v6 = @"RedColor";
      goto LABEL_20;
    case 1:
      v6 = @"OrangeColor";
      goto LABEL_20;
    case 2:
      v6 = @"YellowColor";
      goto LABEL_20;
    case 3:
      v6 = @"GreenColor";
      goto LABEL_20;
    case 4:
      v6 = @"TealColor";
      goto LABEL_20;
    case 5:
      v6 = @"MintColor";
      goto LABEL_20;
    case 6:
      v6 = @"CyanColor";
      goto LABEL_20;
    case 7:
      v6 = @"BlueColor";
      goto LABEL_20;
    case 8:
      v6 = @"IndigoColor";
      goto LABEL_20;
    case 9:
      v6 = @"PurpleColor";
      goto LABEL_20;
    case 10:
      v6 = @"PinkColor";
      goto LABEL_20;
    case 11:
      return result;
    case 12:
      return @"systemBlackColor";
    case 13:
      return @"systemGrayColor";
    case 14:
      v6 = @"BrownColor";
LABEL_20:
      id result = [(__CFString *)v4 stringByAppendingString:v6];
      break;
    case 15:
      id result = @"labelColor";
      break;
    case 16:
      id result = @"secondaryLabelColor";
      break;
    case 17:
      id result = @"tertiaryLabelColor";
      break;
    case 18:
      id result = @"quaternaryLabelColor";
      break;
    case 19:
      id result = @"quinaryLabelColor";
      break;
    case 20:
      id result = @"IconBorderOuterColor";
      break;
    case 21:
      id result = @"primarySystemFillColor";
      break;
    case 22:
      id result = @"secondarySystemFillColor";
      break;
    case 23:
      id result = @"tertiarySystemFillColor";
      break;
    case 24:
      id result = @"quaternarySystemFillColor";
      break;
    case 25:
      id result = @"quinarySystemFillColor";
      break;
    case 26:
      id result = @"groupBoxFillColor";
      break;
    case 27:
      id result = @"groupBoxFormFillColor";
      break;
    default:
      id result = @"systemRedColor";
      break;
  }
  return result;
}

+ (id)catalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  id result = [a1 _catalogPathComponentForDesignSystem:__resolvedDesignSystemForInputSystem(a3) colorScheme:a4 contrast:a5 styling:a6 error:a7];
  if (!result) {
    return result;
  }
  id v13 = result;
  if (__catalogOnceToken != -1) {
    dispatch_once(&__catalogOnceToken, &__block_literal_global_6);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__catalogCacheLock);
  CFNullRef v14 = (CUIDesignLibraryCatalog *)[(id)__catalogCache objectForKey:v13];
  if (!v14)
  {
    id v15 = objc_msgSend((id)__coreUIBundleResoucePath, "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "_bundleNameForResolvedDesignSystem:", a3));
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v15])
    {
      id v22 = [v15 stringByAppendingPathComponent:v13];
      id v23 = [[CUIDesignLibraryCatalog alloc] initWithURL:+[NSURL fileURLWithPath:v22] error:a7];
      if (v23)
      {
        CFNullRef v14 = v23;
        [(CUIDesignLibraryCatalog *)v23 setDesignSystem:a3];
        [(CUIDesignLibraryCatalog *)v14 setColorScheme:a4];
        [(CUIDesignLibraryCatalog *)v14 setContrast:a5];
        [(CUIDesignLibraryCatalog *)v14 setStyling:a6];
        [(id)__catalogCache setObject:v14 forKey:v13];
        goto LABEL_13;
      }
      if ([+[NSFileManager defaultManager] fileExistsAtPath:v22])
      {
        _CUILog(4, (uint64_t)"CoreUI: Error: Couldn't open CUIDesignLibraryCatalog at path %@.", v24, v25, v26, v27, v28, v29, (uint64_t)v22);
      }
    }
    else
    {
      if (a7) {
        *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:@"Error: Couldn't find CUIDesignLibraryCatalog bundle at path %@. Check to make sure that the DesignLibrary .uicatalog files have been distilled and installed in the correct resource location. This may involve building the correct DesignLibrary bundle target as a separate step.", v15], NSLocalizedDescriptionKey, 0));
      }
      _CUILog(4, (uint64_t)"CoreUI: -[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:] Couldn't locate catalog at path '%@'.", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
    CFNullRef v14 = 0;
  }
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)&__catalogCacheLock);
  return v14;
}

- (CUIDesignLibraryCatalog)initWithURL:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIDesignLibraryCatalog;
  v6 = [(CUIDesignLibraryCatalog *)&v9 init];
  if (v6)
  {
    if (![a3 checkResourceIsReachableAndReturnError:a4])
    {
      v6->_storageRef = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    v6->_assetStoreName = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent"), "copy");
    unint64_t v7 = +[CUIThemeFacet themeWithContentsOfURL:a3 error:a4];
    v6->_storageRef = v7;
    if (!v7)
    {
      v6->_storageRef = 0x7FFFFFFFFFFFFFFFLL;
      v6->_lock._os_unfair_lock_opaque = 0;
LABEL_6:

      return 0;
    }
  }
  return v6;
}

+ (id)_catalogPathComponentForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  unsigned int v7 = 0;
  v8 = &stru_1EF488038;
  objc_super v9 = @"iOSRepositories/";
  char v10 = 1;
  v11 = &stru_1EF488038;
  switch(a3)
  {
    case 0:
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"CUIDesignLibraryCatalog.m" lineNumber:127 description:@"Can't use CUIDesignSystemAutomatic with _catalogPathComponentForDesignSystem. Must resolve before calling based on OS."];
      goto LABEL_5;
    case 1:
      goto LABEL_12;
    case 2:
      unsigned int v7 = 0;
      v11 = &stru_1EF488038;
      objc_super v9 = @"tvOSRepositories/";
      goto LABEL_12;
    case 3:
      unsigned int v7 = 0;
      v11 = &stru_1EF488038;
      objc_super v9 = @"watchOSRepositories/";
      goto LABEL_12;
    case 4:
      unsigned int v7 = 0;
      v11 = &stru_1EF488038;
      objc_super v9 = @"CarPlayRepositories/";
      goto LABEL_12;
    case 5:
      v11 = @"Contents/Resources/";
      unsigned int v7 = 1;
      objc_super v9 = @"macOSRepositories/";
      goto LABEL_12;
    case 6:
      char v10 = 0;
      unsigned int v7 = 0;
      v11 = @"Contents/Resources/";
      objc_super v9 = @"macTouchBarRepositories/";
      goto LABEL_12;
    case 7:
      unsigned int v7 = 0;
      v11 = &stru_1EF488038;
      objc_super v9 = @"xrOSRepositories/";
LABEL_12:
      if (((a4 != 1) & v10) != 0) {
        id v13 = @"Light";
      }
      else {
        id v13 = @"Dark";
      }
      int64_t v14 = v7;
      BOOL v15 = v7 == 0;
      int64_t v16 = 2;
      if (v15) {
        int64_t v16 = 0;
      }
      if (a6 != 2) {
        int64_t v16 = a6;
      }
      if (a6 == 1) {
        int64_t v16 = v14;
      }
      if (v16 == 2) {
        v8 = @"FauxVibrant";
      }
      if (v16 == 1) {
        v8 = @"Vibrant";
      }
      if (((a5 == 1) & v10) != 0) {
        uint64_t v17 = @"IncreasedContrast";
      }
      else {
        uint64_t v17 = @"Standard";
      }
      id result = +[NSString stringWithFormat:@"%@%@%@%@%@.car", v11, v9, v13, v8, v17];
      break;
    default:
      if (a7) {
        *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:@"CUIDesignLibraryCatalog does not recognize the requested design system.", a4, a5, a6, NSLocalizedDescriptionKey, 0]);
      }
LABEL_5:
      id result = 0;
      break;
  }
  return result;
}

+ (id)_bundleNameForResolvedDesignSystem:(int64_t)a3
{
  id result = @"DesignLibrary-iOS.bundle";
  if ((unint64_t)(a3 - 1) >= 4 && a3 != 7)
  {
    if (a3)
    {
      return @"DesignLibrary-macOS.bundle";
    }
    else
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"CUIDesignLibraryCatalog.m" lineNumber:235 description:@"Can't use CUIDesignSystemAutomatic to find the bundle. Must resolve first by calling __resolvedDesignSystemForInputSystem."];
      return 0;
    }
  }
  return result;
}

- (void)setStyling:(int64_t)a3
{
  self->_styling = a3;
}

- (void)setDesignSystem:(int64_t)a3
{
  self->_designSystem = a3;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (void)setColorScheme:(int64_t)a3
{
  self->_colorScheme = a3;
}

void __85__CUIDesignLibraryCatalog_catalogForDesignSystem_colorScheme_contrast_styling_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __catalogCache = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
  __coreUIBundleResoucePath = [+[NSBundle bundleForClass:objc_opt_class()] resourcePath];
  if (!__coreUIBundleResoucePath)
  {
    _CUILog(4, (uint64_t)"CoreUI: -[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:] Couldn't locate CoreUIBundle", v9, v10, v11, v12, v13, v14, a9);
  }
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<CUIDesignLibraryCatalog %p:%@>", self, objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "debugDescription"));
}

- (void)dealloc
{
  uint64_t v3 = 0;
  colorCache = self->_colorCache;
  do
  {
    uint64_t v5 = 0;
    v6 = colorCache;
    do
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        CFNullRef v8 = (CFNullRef)(*v6)[0][i];
        if (v8 != kCFNull) {

        }
        (*v6)[0][i] = 0;
      }
      ++v5;
      v6 = (id (*)[28][4])((char *)v6 + 32);
    }
    while (v5 != 28);
    ++v3;
    ++colorCache;
  }
  while (v3 != 5);
  v9.receiver = self;
  v9.super_class = (Class)CUIDesignLibraryCatalog;
  [(CUIDesignLibraryCatalog *)&v9 dealloc];
}

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6
{
  return [(CUIDesignLibraryCatalog *)self colorWithName:a3 palette:a4 displayGamut:a5 hierarchyLevel:0 error:a6];
}

- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4
{
  unsigned int v7 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  CFNullRef v8 = (unsigned __int16 *)[v7 renditionKeyForName:a3];
  _CUILog(3, (uint64_t)"-[CUIDesignLibraryCatalog shapeEffectPresetWithName:%@ error:]", v9, v10, v11, v12, v13, v14, (uint64_t)a3);
  CUIRenditionKeyValueForAttribute(v8, 17);
  kdebug_trace();
  if (!v8) {
    goto LABEL_5;
  }
  BOOL v15 = +[CUIRenditionKey renditionKeyWithKeyList:v8];
  [(CUIRenditionKey *)v15 setThemeScale:1];
  [(CUIRenditionKey *)v15 setThemeState:0];
  [(CUIRenditionKey *)v15 setThemePresentationState:0];
  [(CUIRenditionKey *)v15 setThemeValue:0];
  [(CUIRenditionKey *)v15 setThemeDimension1:0];
  [(CUIRenditionKey *)v15 setThemeAppearance:0];
  id v16 = objc_msgSend(v7, "renditionWithKey:", -[CUIRenditionKey keyList](v15, "keyList"));
  id v17 = v16;
  if (v16)
  {
    if ([v16 type] == (id)7)
    {
      id v17 = [v17 effectPreset];
      goto LABEL_6;
    }
LABEL_5:
    id v17 = 0;
  }
LABEL_6:
  if (a4 && !v17) {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:@"The requested effect preset, %@, could not be found in the %@ CUIDesignLibrary catalog.", a3, self->_assetStoreName], NSLocalizedDescriptionKey, 0));
  }
  kdebug_trace();
  return v17;
}

- (int64_t)designSystem
{
  return self->_designSystem;
}

- (int64_t)contrast
{
  return self->_contrast;
}

@end