@interface CAMDrawerAspectRatioButton
+ (id)localizedTitleForAspectRatio:(int64_t)a3 useBriefText:(BOOL)a4;
- (BOOL)isMenuItemSelected:(id)a3;
- (CAMDrawerAspectRatioButton)initWithLayoutStyle:(int64_t)a3;
- (NSMutableDictionary)_imagesByText;
- (id)_imageForAspectRatio:(int64_t)a3;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)imageNameForCurrentState;
- (id)loadMenuItems;
- (int64_t)aspectRatio;
- (int64_t)controlType;
- (void)didSelectMenuItem:(id)a3;
- (void)setAspectRatio:(int64_t)a3;
- (void)updateImage;
@end

@implementation CAMDrawerAspectRatioButton

- (CAMDrawerAspectRatioButton)initWithLayoutStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerAspectRatioButton;
  v3 = [(CAMControlDrawerMenuButton *)&v7 initWithLayoutStyle:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    imagesByText = v3->__imagesByText;
    v3->__imagesByText = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (int64_t)controlType
{
  return 2;
}

- (void)setAspectRatio:(int64_t)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_aspectRatio = a3;
    [(CAMControlDrawerMenuButton *)self updateLabelsIfNeeded];
    [(CAMDrawerAspectRatioButton *)self updateImage];
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  uint64_t v4 = [a3 value];
  uint64_t v5 = [v4 integerValue];
  LOBYTE(self) = v5 == [(CAMDrawerAspectRatioButton *)self aspectRatio];

  return (char)self;
}

- (id)loadMenuItems
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  v3 = +[CAMCaptureCapabilities capabilities];
  uint64_t v4 = [v3 supportedAspectRatioCropValues];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue];
        v10 = [(id)objc_opt_class() localizedTitleForAspectRatio:v9 useBriefText:0];
        v11 = [CAMControlDrawerMenuItem alloc];
        v12 = [NSNumber numberWithInteger:v9];
        v13 = [(CAMControlDrawerMenuItem *)v11 initWithTitle:v10 value:v12];

        [v2 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMDrawerAspectRatioButton *)self aspectRatio];
  uint64_t v6 = [v4 value];

  uint64_t v7 = [v6 integerValue];
  if (v7 != v5)
  {
    [(CAMDrawerAspectRatioButton *)self setAspectRatio:v7];
    [(CAMDrawerAspectRatioButton *)self sendActionsForControlEvents:4096];
  }
}

- (id)imageNameForCurrentState
{
  return 0;
}

+ (id)localizedTitleForAspectRatio:(int64_t)a3 useBriefText:(BOOL)a4
{
  int64_t v5 = @"ASPECT_FOUR_THREE";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      if (a4) {
        int64_t v5 = @"ASPECT_SQUARE_BRIEF";
      }
      else {
        int64_t v5 = @"ASPECT_SQUARE";
      }
      goto LABEL_10;
    case 2:
      int64_t v5 = @"ASPECT_SIXTEEN_NINE";
      goto LABEL_10;
    case 3:
      int64_t v5 = @"ASPECT_THREE_TWO";
LABEL_10:
      uint64_t v6 = CAMLocalizedFrameworkString(v5, 0);
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

- (id)_imageForAspectRatio:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() localizedTitleForAspectRatio:a3 useBriefText:1];
  int64_t v5 = [(CAMDrawerAspectRatioButton *)self _imagesByText];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6 && v4)
  {
    uint64_t v7 = +[CAMFont cameraFontOfSize:16.0];
    v8 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v9 = [(CAMDrawerAspectRatioButton *)self window];
    v10 = [v9 screen];
    [v10 scale];
    uint64_t v6 = CAMImageWithTextColorFont(v4, v8, v7);

    v11 = [(CAMDrawerAspectRatioButton *)self _imagesByText];
    [v11 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (void)updateImage
{
  v3 = [(CAMDrawerAspectRatioButton *)self _imageForAspectRatio:[(CAMDrawerAspectRatioButton *)self aspectRatio]];
  uint64_t v4 = [(CAMControlDrawerButton *)self _imageView];
  [v4 setImage:v3];

  [(CAMDrawerAspectRatioButton *)self setNeedsLayout];
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMDrawerAspectRatioButton;
  uint64_t v4 = [(CAMControlDrawerMenuButton *)&v9 hudItemForAccessibilityHUDManager:a3];
  int64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 title];

    if (!v6)
    {
      uint64_t v7 = objc_msgSend((id)objc_opt_class(), "localizedTitleForAspectRatio:useBriefText:", -[CAMDrawerAspectRatioButton aspectRatio](self, "aspectRatio"), 1);
      [v5 setTitle:v7];
    }
  }
  return v5;
}

- (int64_t)aspectRatio
{
  return self->_aspectRatio;
}

- (NSMutableDictionary)_imagesByText
{
  return self->__imagesByText;
}

- (void).cxx_destruct
{
}

@end