@interface MKIconStyle
- (BOOL)_elevationForIcons;
- (MKIconStyle)initWithStyleAttributes:(id)a3 isHybridMap:(BOOL)a4;
- (UIColor)backgroundColor;
- (UIImage)image;
- (id)iconForModifiers:(id)a3;
- (void)_setColorAndImages;
- (void)registerImage:(id)a3 darkMode:(BOOL)a4;
@end

@implementation MKIconStyle

- (MKIconStyle)initWithStyleAttributes:(id)a3 isHybridMap:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKIconStyle;
  v8 = [(MKIconStyle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleAttributes, a3);
    v9->_isHybridMap = a4;
    [(MKIconStyle *)v9 _setColorAndImages];
  }

  return v9;
}

- (UIColor)backgroundColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__MKIconStyle_backgroundColor__block_invoke;
  v4[3] = &unk_1E54BBF10;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F428B8] colorWithDynamicProvider:v4];

  return (UIColor *)v2;
}

id __30__MKIconStyle_backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 == 2)
  {
    v5 = *(void **)(v4 + 24);
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v5 = *(void **)(v4 + 16);
  if (v5)
  {
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
LABEL_7:

  return v6;
}

- (UIImage)image
{
  combinedImageAsset = self->_combinedImageAsset;
  if (combinedImageAsset)
  {
    uint64_t v3 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
    uint64_t v4 = [(UIImageAsset *)combinedImageAsset imageWithTraitCollection:v3];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"mappin"];
    v5 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    uint64_t v4 = [v3 imageWithTintColor:v5 renderingMode:1];
  }

  return (UIImage *)v4;
}

- (void)_setColorAndImages
{
  id v16 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
  [v16 setGlyphOnly:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3A28]);
  [v3 setGlyphOnly:1];
  [v3 setNightMode:1];
  objc_msgSend(MEMORY[0x1E4F645A0], "styleAttributesForMapFeatureAttributes:elevatedGround:", self->_styleAttributes, -[MKIconStyle _elevationForIcons](self, "_elevationForIcons"));
  uint64_t v4 = (GEOFeatureStyleAttributes *)objc_claimAutoreleasedReturnValue();
  styleAttributes = self->_styleAttributes;
  self->_styleAttributes = v4;

  id v6 = [(MKIconStyle *)self iconForModifiers:v16];
  uint64_t v7 = [(MKIconStyle *)self iconForModifiers:v3];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = (UIImageAsset *)objc_alloc_init(MEMORY[0x1E4F42A88]);
    combinedImageAsset = self->_combinedImageAsset;
    self->_combinedImageAsset = v10;

    [(MKIconStyle *)self registerImage:v6 darkMode:0];
    [(MKIconStyle *)self registerImage:v8 darkMode:1];
    objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v6, "fillColor"));
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColorLight = self->_backgroundColorLight;
    self->_backgroundColorLight = v12;

    objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v8, "fillColor"));
    v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColorDark = self->_backgroundColorDark;
    self->_backgroundColorDark = v14;
  }
}

- (id)iconForModifiers:(id)a3
{
  id v4 = a3;
  v5 = +[MKIconManager iconManager];
  styleAttributes = self->_styleAttributes;
  uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  *(float *)&double v8 = v8;
  BOOL v9 = [v5 imageForStyleAttributes:styleAttributes withStylesheetName:@"default" contentScale:8 sizeGroup:v4 modifiers:v8];

  return v9;
}

- (void)registerImage:(id)a3 darkMode:(BOOL)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F42A80];
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = [v7 image];
  [v7 contentScale];
  float v11 = v10;

  v12 = (void *)[v8 initWithCGImage:v9 scale:0 orientation:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__MKIconStyle_registerImage_darkMode___block_invoke;
  v14[3] = &__block_descriptor_33_e27_v16__0___UIMutableTraits__8l;
  BOOL v15 = a4;
  v13 = [MEMORY[0x1E4F42F80] traitCollectionWithTraits:v14];
  [(UIImageAsset *)self->_combinedImageAsset registerImage:v12 withTraitCollection:v13];
}

void __38__MKIconStyle_registerImage_darkMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F42D90];
  id v6 = a2;
  id v4 = [v3 mainScreen];
  [v4 scale];
  objc_msgSend(v6, "setDisplayScale:");

  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 setUserInterfaceStyle:v5];
}

- (BOOL)_elevationForIcons
{
  id v3 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v3 supportsAdvancedMap]) {
    BOOL v4 = !self->_isHybridMap;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImageAsset, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);

  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end