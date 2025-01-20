@interface ISImageDescriptor
+ (BOOL)supportsSecureCoding;
+ (ISImageDescriptor)imageDescriptorWithIconVariant:(int)a3 options:(int)a4;
+ (id)icnsImageDescriptors;
+ (id)imageDescriptorNamed:(id)a3;
- (BOOL)drawBadge;
- (BOOL)drawBorder;
- (BOOL)graphicVariant;
- (BOOL)ignoreCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferExtendedColorResources;
- (BOOL)selectedVariant;
- (BOOL)shouldApplyMask;
- (BOOL)templateVariant;
- (CGSize)sanitizedSize;
- (CGSize)size;
- (IFColor)tintColor;
- (ISImageDescriptor)init;
- (ISImageDescriptor)initWithCoder:(id)a3;
- (ISImageDescriptor)initWithSize:(CGSize)a3 scale:(double)a4;
- (NSString)description;
- (NSString)preferedResourceName;
- (NSUUID)digest;
- (double)continuousCornerRadius;
- (double)sanitizedScale;
- (double)scale;
- (id)_recipe;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)appearance;
- (int64_t)appearanceVariant;
- (int64_t)contrast;
- (int64_t)layoutDirection;
- (int64_t)vibrancy;
- (unint64_t)background;
- (unint64_t)backgroundStyle;
- (unint64_t)badgeOptions;
- (unint64_t)hash;
- (unint64_t)languageDirection;
- (unint64_t)platformStyle;
- (unint64_t)shape;
- (unint64_t)specialIconOptions;
- (unint64_t)variantOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setAppearanceVariant:(int64_t)a3;
- (void)setBackground:(unint64_t)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBadgeOptions:(unint64_t)a3;
- (void)setContrast:(int64_t)a3;
- (void)setDrawBadge:(BOOL)a3;
- (void)setDrawBorder:(BOOL)a3;
- (void)setGraphicVariant:(BOOL)a3;
- (void)setIgnoreCache:(BOOL)a3;
- (void)setLanguageDirection:(unint64_t)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setPlatformStyle:(unint64_t)a3;
- (void)setPreferExtendedColorResources:(BOOL)a3;
- (void)setPreferedResourceName:(id)a3;
- (void)setScale:(double)a3;
- (void)setSelectedVariant:(BOOL)a3;
- (void)setShape:(unint64_t)a3;
- (void)setShouldApplyMask:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSpecialIconOptions:(unint64_t)a3;
- (void)setTemplateVariant:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setVariantOptions:(unint64_t)a3;
- (void)setVibrancy:(int64_t)a3;
@end

@implementation ISImageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferedResourceName, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ISImageDescriptor alloc];
  -[ISImageDescriptor setSize:](v4, "setSize:", self->_size.width, self->_size.height);
  [(ISImageDescriptor *)v4 setScale:self->_scale];
  [(ISImageDescriptor *)v4 setVariantOptions:self->_variantOptions];
  v5 = (void *)[(NSString *)self->_preferedResourceName copy];
  [(ISImageDescriptor *)v4 setPreferedResourceName:v5];

  [(ISImageDescriptor *)v4 setTintColor:self->_tintColor];
  [(ISImageDescriptor *)v4 setIgnoreCache:self->_ignoreCache];
  [(ISImageDescriptor *)v4 setGraphicVariant:self->_graphicVariant];
  [(ISImageDescriptor *)v4 setAppearance:self->_appearance];
  [(ISImageDescriptor *)v4 setContrast:self->_contrast];
  [(ISImageDescriptor *)v4 setVibrancy:self->_vibrancy];
  [(ISImageDescriptor *)v4 setAppearanceVariant:self->_appearanceVariant];
  [(ISImageDescriptor *)v4 setBackground:self->_background];
  [(ISImageDescriptor *)v4 setSpecialIconOptions:self->_specialIconOptions];
  [(ISImageDescriptor *)v4 setPlatformStyle:self->_platformStyle];
  [(ISImageDescriptor *)v4 setLanguageDirection:self->_languageDirection];
  [(ISImageDescriptor *)v4 setLayoutDirection:self->_layoutDirection];
  return v4;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (void)setVibrancy:(int64_t)a3
{
  self->_vibrancy = a3;
}

- (void)setVariantOptions:(unint64_t)a3
{
  self->_variantOptions = a3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setSpecialIconOptions:(unint64_t)a3
{
  self->_specialIconOptions = a3;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setPreferedResourceName:(id)a3
{
}

- (void)setPlatformStyle:(unint64_t)a3
{
  self->_platformStyle = a3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

- (void)setGraphicVariant:(BOOL)a3
{
  self->_graphicVariant = a3;
}

- (void)setBackground:(unint64_t)a3
{
  self->_background = a3;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (NSString)description
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld:%ld:%ld", -[ISImageDescriptor appearance](self, "appearance"), -[ISImageDescriptor contrast](self, "contrast"), -[ISImageDescriptor vibrancy](self, "vibrancy"), -[ISImageDescriptor appearanceVariant](self, "appearanceVariant"));
  v4 = NSString;
  v5 = [(ISImageDescriptor *)self tintColor];
  v6 = [v5 ciColor];
  uint64_t v7 = [v6 stringRepresentation];
  v8 = (void *)v7;
  v9 = &stru_1F06391F0;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = [v4 stringWithFormat:@"(%@)", v9];

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor background](self, "background"));
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor specialIconOptions](self, "specialIconOptions"));
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor platformStyle](self, "platformStyle"));
  v14 = NSString;
  v27.receiver = self;
  v27.super_class = (Class)ISImageDescriptor;
  v15 = [(ISImageDescriptor *)&v27 description];
  [(ISImageDescriptor *)self size];
  uint64_t v17 = v16;
  [(ISImageDescriptor *)self size];
  uint64_t v19 = v18;
  [(ISImageDescriptor *)self scale];
  uint64_t v21 = v20;
  unint64_t v22 = [(ISImageDescriptor *)self variantOptions];
  int64_t v23 = [(ISImageDescriptor *)self layoutDirection];
  v24 = [(ISImageDescriptor *)self digest];
  v25 = [v14 stringWithFormat:@"%@ - (%0.2f, %0.2f)@%.0fx v:%lx l:%lu a:%@ t:%@ b:%@ s:%@ ps:%@ digest: %@", v15, v17, v19, v21, v22, v23, v3, v10, v11, v12, v13, v24];

  return (NSString *)v25;
}

- (NSUUID)digest
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld:%ld:%ld", -[ISImageDescriptor appearance](self, "appearance"), -[ISImageDescriptor contrast](self, "contrast"), -[ISImageDescriptor vibrancy](self, "vibrancy"), -[ISImageDescriptor appearanceVariant](self, "appearanceVariant"));
  v4 = [(ISImageDescriptor *)self tintColor];
  v5 = [v4 ciColor];
  uint64_t v6 = [v5 stringRepresentation];
  uint64_t v7 = (void *)v6;
  v8 = &stru_1F06391F0;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor background](self, "background"));
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor specialIconOptions](self, "specialIconOptions"));
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[ISImageDescriptor platformStyle](self, "platformStyle"));
  v13 = NSString;
  [(ISImageDescriptor *)self scale];
  v15 = [v13 stringWithFormat:@"%.0f:%ld:%@:%lu:%@:%@:%@:%@:%@", v14, -[ISImageDescriptor variantOptions](self, "variantOptions"), 0, -[ISImageDescriptor layoutDirection](self, "layoutDirection"), v3, v9, v10, v11, v12];

  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v15);

  return (NSUUID *)v16;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)vibrancy
{
  return self->_vibrancy;
}

- (unint64_t)variantOptions
{
  return self->_variantOptions;
}

- (unint64_t)specialIconOptions
{
  return self->_specialIconOptions;
}

- (unint64_t)platformStyle
{
  return self->_platformStyle;
}

- (int64_t)layoutDirection
{
  unint64_t v2 = [(ISImageDescriptor *)self languageDirection];
  if (v2 == 1) {
    return 5;
  }
  else {
    return 4 * (v2 == 2);
  }
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (int64_t)contrast
{
  return self->_contrast;
}

- (unint64_t)background
{
  return self->_background;
}

- (int64_t)appearance
{
  v3 = +[ISDefaults sharedInstance];
  int64_t v4 = [v3 forceApperance];

  if (v4 < 0) {
    return self->_appearance;
  }
  if (v4 != self->_appearance) {
    self->_appearance = v4;
  }
  return v4;
}

- (IFColor)tintColor
{
  v3 = +[ISDefaults sharedInstance];
  int64_t v4 = [v3 tintColor];

  if (v4)
  {
    objc_storeStrong((id *)&self->_tintColor, v4);
    self->_appearance = 2;
  }
  v5 = self->_tintColor;

  return v5;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDrawBorder:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (double)continuousCornerRadius
{
  uint64_t v3 = +[ISDeviceInfo sharedInstance];
  unint64_t v4 = [v3 ideom];

  unint64_t v5 = [(ISImageDescriptor *)self shape];
  BOOL v6 = v4 < 4;
  if (v5) {
    BOOL v6 = v5 == 1;
  }
  if (!v6) {
    return 0.0;
  }
  [(ISImageDescriptor *)self size];
  +[ISShapeCompositorResource continuousCornerRadiusForSize:](ISShapeCompositorResource, "continuousCornerRadiusForSize:");
  return result;
}

+ (id)imageDescriptorNamed:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[ISDeviceInfo sharedInstance];
  uint64_t v5 = [v4 ideom];

  BOOL v6 = +[ISDeviceInfo sharedInstance];
  [v6 screenScale];
  double v8 = v7;

  double v9 = 29.0;
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.TableUIName"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.Spotlight"])
  {
    uint64_t v10 = 0;
    *(double *)&uint64_t v12 = 40.0;
LABEL_5:
    double v9 = *(double *)&v12;
LABEL_6:
    double v11 = v9;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.HomeScreen"])
  {
    v13 = +[ISDeviceInfo sharedInstance];
    [v13 homeScreenIconSize];
LABEL_11:
    double v11 = v14;
    double v9 = v15;

    uint64_t v10 = 0;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.LargeHomeScreen"])
  {
    v13 = +[ISDeviceInfo sharedInstance];
    [v13 largeHomeScreenIconSize];
    goto LABEL_11;
  }
  double v11 = 37.0;
  if (([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CustomDocumentSize"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.BadgedDocumentSize"] & 1) != 0)
  {
    *(double *)&uint64_t v16 = 48.0;
LABEL_15:
    double v9 = *(double *)&v16;
LABEL_16:
    uint64_t v10 = 3;
    goto LABEL_17;
  }
  double v11 = 20.0;
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.Notification"])
  {
    uint64_t v10 = 0;
LABEL_24:
    double v9 = 20.0;
    goto LABEL_17;
  }
  if (([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CustomDocumentScalableSize"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.BadgedDocumentScalableSize"])
  {
    if (v5 == 2) {
      double v9 = 320.0;
    }
    else {
      double v9 = 48.0;
    }
    double v11 = dbl_1AE7C0F70[v5 == 2];
    goto LABEL_16;
  }
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CarLauncher"])
  {
LABEL_32:
    uint64_t v10 = 0;
    *(double *)&uint64_t v12 = 60.0;
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CarNotification"])
  {
LABEL_2:
    uint64_t v10 = 0;
    double v11 = 29.0;
    goto LABEL_17;
  }
  if (![v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.Activity"])
  {
    if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CustomDocumentCompact"])
    {
      double v11 = 64.0;
      *(double *)&uint64_t v16 = 84.0;
      goto LABEL_15;
    }
    if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CustomDocumentRegular"])
    {
      double v11 = 96.0;
      *(double *)&uint64_t v16 = 128.0;
      goto LABEL_15;
    }
    if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.CustomDocumentTable"])
    {
      double v11 = 34.0;
      *(double *)&uint64_t v16 = 44.0;
      goto LABEL_15;
    }
    if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.MessagesExtensionLauncher"])
    {
      unint64_t v22 = +[ISDeviceInfo sharedInstance];
      [v22 messagesLauncherIconSize];
      double v11 = v23;
      double v9 = v24;
    }
    else
    {
      if (([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.MessagesExtensionBadge"] & 1) == 0)
      {
        if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.MessagesExtensionStatus"])
        {
          double v11 = 27.0;
          uint64_t v10 = 4;
          goto LABEL_24;
        }
        if ([v3 isEqualToString:@"com.apple.IconServices.ImageDescriptor.WidgetAddGallery"])
        {
          double v9 = 24.0;
          uint64_t v10 = 1;
          double v11 = 24.0;
        }
        else
        {
          uint64_t v10 = 0;
          double v11 = *MEMORY[0x1E4F1DB30];
          double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        }
        goto LABEL_17;
      }
      double v9 = 24.0;
      double v11 = 32.0;
    }
    uint64_t v10 = 4;
    goto LABEL_17;
  }
  if (v5 == 2)
  {
    uint64_t v10 = 0;
    *(double *)&uint64_t v12 = 76.0;
    goto LABEL_5;
  }
  if (v5 != 1) {
    goto LABEL_32;
  }
  uint64_t v20 = +[ISDeviceInfo sharedInstance];
  uint64_t v21 = [v20 deviceSubtype];

  uint64_t v10 = 0;
  double v9 = 64.0;
  if (v21 == 1792 || v21 == 2688) {
    goto LABEL_6;
  }
  double v11 = 64.0;
  if (v21 != 2778) {
    goto LABEL_32;
  }
LABEL_17:
  uint64_t v17 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v11, v9, v8);
  [(ISImageDescriptor *)v17 setShape:v10];
  uint64_t v18 = _ISDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[ISImageDescriptor(iOSConvenience) imageDescriptorNamed:v18];
  }

  return v17;
}

- (ISImageDescriptor)initWithSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)ISImageDescriptor;
  double v7 = [(ISImageDescriptor *)&v10 init];
  double v8 = v7;
  if (v7)
  {
    v7->_size.CGFloat width = width;
    v7->_size.CGFloat height = height;
    v7->_scale = a4;
    v7->_preferExtendedColorResources = MGGetBoolAnswer();
    *(_OWORD *)&v8->_appearance = 0u;
    *(_OWORD *)&v8->_contrast = 0u;
    v8->_languageDirection = objc_msgSend(MEMORY[0x1E4F1CA20], "_IS_currentLanguageDirection");
    v8->_background = 0;
    *(_OWORD *)&v8->_specialIconOptions = xmmword_1AE7C0F60;
  }
  return v8;
}

- (void)setShape:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF96FFFDLL;
      goto LABEL_9;
    case 1uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x10000;
      goto LABEL_9;
    case 2uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 2;
      goto LABEL_9;
    case 3uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x40000;
      goto LABEL_9;
    case 4uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x80000;
      goto LABEL_9;
    case 5uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x200000;
      goto LABEL_9;
    case 6uLL:
      unint64_t v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x400000;
LABEL_9:
      self->_variantOptions = v3;
      break;
    default:
      return;
  }
}

- (unint64_t)shape
{
  unint64_t result = self->_variantOptions & 0x6D0002;
  if (result >= 0x80000)
  {
    switch(result)
    {
      case 0x80000uLL:
        return 4;
      case 0x200000uLL:
        return 5;
      case 0x400000uLL:
        return 6;
    }
  }
  else
  {
    switch(result)
    {
      case 2uLL:
        return result;
      case 0x10000uLL:
        return 1;
      case 0x40000uLL:
        return 3;
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ISImageDescriptor *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ISImageDescriptor *)self digest];
      BOOL v6 = [(ISImageDescriptor *)v4 digest];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)_recipe
{
  switch([(ISImageDescriptor *)self shape])
  {
    case 1uLL:
      uint64_t v3 = 4;
      goto LABEL_5;
    case 2uLL:
      uint64_t v3 = 8;
LABEL_5:
      uint64_t v6 = +[ISRecipeInfo appRecipeForPlatform:v3 descriptor:self];
      goto LABEL_10;
    case 3uLL:
      unint64_t v4 = +[ISPlatformInfo sharedInstance];
      uint64_t v5 = +[ISRecipeInfo documentRecipeForPlatform:descriptor:](ISRecipeInfo, "documentRecipeForPlatform:descriptor:", [v4 nativePlatform], self);
      goto LABEL_7;
    case 4uLL:
      char v7 = objc_alloc_init(ISMessagesAppRecipe);
      [(ISMessagesAppRecipe *)v7 setShouldDrawBorder:[(ISImageDescriptor *)self drawBorder]];
      break;
    case 5uLL:
      uint64_t v6 = objc_opt_new();
LABEL_10:
      char v7 = (ISMessagesAppRecipe *)v6;
      break;
    case 6uLL:
      char v7 = (ISMessagesAppRecipe *)objc_opt_new();
      [(ISMessagesAppRecipe *)v7 setShouldOnlyDrawBorder:1];
      break;
    default:
      unint64_t v4 = +[ISPlatformInfo sharedInstance];
      uint64_t v5 = +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", [v4 nativePlatform], self);
LABEL_7:
      char v7 = (ISMessagesAppRecipe *)v5;

      break;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (ISImageDescriptor)imageDescriptorWithIconVariant:(int)a3 options:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  LIIconOutputSizeForVariant();
  double v8 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v6, v7, MEMORY[0x1B3E70B30](v5));
  if (+[ISIcon variant:v5 isMemberOfSet:4])
  {
    [(ISImageDescriptor *)v8 setShape:4];
    if ((a4 & 0x10000) != 0) {
      goto LABEL_8;
    }
LABEL_7:
    [(ISImageDescriptor *)v8 setDrawBorder:1];
    goto LABEL_8;
  }
  if (+[ISIcon variant:v5 isMemberOfSet:3])
  {
    [(ISImageDescriptor *)v8 setShape:2];
    goto LABEL_8;
  }
  if (+[ISIcon variant:v5 isMemberOfSet:1]) {
    goto LABEL_7;
  }
LABEL_8:
  double v9 = _ISDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_log_debug_impl(&dword_1AE771000, v9, OS_LOG_TYPE_DEBUG, "Created image descriptor: %@ from variant: %d options: %x", (uint8_t *)&v11, 0x18u);
  }

  return v8;
}

- (ISImageDescriptor)init
{
  MGGetFloat32Answer();
  return -[ISImageDescriptor initWithSize:scale:](self, "initWithSize:scale:", 60.0, 60.0, v3);
}

- (ISImageDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ISImageDescriptor *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"size.width"];
    CGFloat v7 = v6;
    [v4 decodeDoubleForKey:@"size.height"];
    v5->_size.CGFloat width = v7;
    v5->_size.CGFloat height = v8;
    [v4 decodeDoubleForKey:@"scale"];
    v5->_scale = v9;
    v5->_variantOptions = [v4 decodeIntegerForKey:@"variantOptions"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferedResourceName"];
    preferedResourceName = v5->_preferedResourceName;
    v5->_preferedResourceName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (IFColor *)v12;

    v5->_ignoreCache = [v4 decodeBoolForKey:@"ignoreCache"];
    v5->_graphicVariant = [v4 decodeBoolForKey:@"graphicVariant"];
    v5->_appearance = [v4 decodeIntegerForKey:@"appearance"];
    v5->_contrast = [v4 decodeIntegerForKey:@"contrast"];
    v5->_vibrancy = [v4 decodeIntegerForKey:@"vibrancy"];
    v5->_appearanceVariant = [v4 decodeIntegerForKey:@"appearanceVariant"];
    v5->_background = [v4 decodeIntegerForKey:@"background"];
    v5->_specialIconOptions = [v4 decodeIntegerForKey:@"specialIconOptions"];
    v5->_platformStyle = [v4 decodeIntegerForKey:@"platformStyle"];
    v5->_languageDirection = [v4 decodeIntegerForKey:@"languageDirection"];
    v5->_layoutDirection = [v4 decodeIntegerForKey:@"layoutDirection"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_size.width;
  id v5 = a3;
  [v5 encodeDouble:@"size.width" forKey:width];
  [v5 encodeDouble:@"size.height" forKey:self->_size.height];
  [v5 encodeDouble:@"scale" forKey:self->_scale];
  [v5 encodeInteger:self->_variantOptions forKey:@"variantOptions"];
  [v5 encodeObject:self->_preferedResourceName forKey:@"preferedResourceName"];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeBool:self->_ignoreCache forKey:@"ignoreCache"];
  [v5 encodeBool:self->_graphicVariant forKey:@"graphicVariant"];
  [v5 encodeInteger:self->_appearance forKey:@"appearance"];
  [v5 encodeInteger:self->_contrast forKey:@"contrast"];
  [v5 encodeInteger:self->_vibrancy forKey:@"vibrancy"];
  [v5 encodeInteger:self->_appearanceVariant forKey:@"appearanceVariant"];
  [v5 encodeInteger:self->_background forKey:@"background"];
  [v5 encodeInteger:self->_specialIconOptions forKey:@"specialIconOptions"];
  [v5 encodeInteger:self->_platformStyle forKey:@"platformStyle"];
  [v5 encodeInteger:self->_languageDirection forKey:@"languageDirection"];
  [v5 encodeInteger:self->_layoutDirection forKey:@"layoutDirection"];
}

- (BOOL)templateVariant
{
  return (LOBYTE(self->_variantOptions) >> 3) & 1;
}

- (void)setTemplateVariant:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)selectedVariant
{
  return (LOBYTE(self->_variantOptions) >> 4) & 1;
}

- (void)setSelectedVariant:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)shouldApplyMask
{
  return (self->_variantOptions & 0x20000) == 0;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)drawBorder
{
  return (LOBYTE(self->_variantOptions) >> 2) & 1;
}

- (BOOL)drawBadge
{
  return (self->_variantOptions & 0x100000) == 0;
}

- (void)setDrawBadge:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (a3) {
    uint64_t v3 = 0;
  }
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (CGSize)sanitizedSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  if (height <= width) {
    double v4 = self->_size.width;
  }
  else {
    double v4 = self->_size.height;
  }
  if (v4 < 20.0)
  {
    double height = 20.0;
    double width = 20.0;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)sanitizedScale
{
  double result = ceil(self->_scale);
  double v3 = 1.0;
  BOOL v4 = result < 1.0;
  BOOL v5 = result < 3.0 || result < 1.0;
  if (result >= 3.0) {
    BOOL v4 = 1;
  }
  if (!v5) {
    double v3 = 3.0;
  }
  if (v4) {
    return v3;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v2 = [(ISImageDescriptor *)self digest];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)preferedResourceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

- (void)setBadgeOptions:(unint64_t)a3
{
  self->_badgeOptions = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)graphicVariant
{
  return self->_graphicVariant;
}

- (int64_t)appearanceVariant
{
  return self->_appearanceVariant;
}

- (void)setAppearanceVariant:(int64_t)a3
{
  self->_appearanceVariant = a3;
}

- (BOOL)preferExtendedColorResources
{
  return self->_preferExtendedColorResources;
}

- (void)setPreferExtendedColorResources:(BOOL)a3
{
  self->_preferExtendedColorResources = a3;
}

+ (id)icnsImageDescriptors
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end