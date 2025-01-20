@interface CAMFormattingManager
+ (id)sharedManager;
- (BOOL)supportsVerticalText;
- (BOOL)wantsCustomKerning;
- (CAMFormattingManager)init;
- (void)_commonCAMFormattingManagerInitialization;
@end

@implementation CAMFormattingManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)sharedManager_formattingMangaer;
  return v2;
}

uint64_t __37__CAMFormattingManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(CAMFormattingManager);
  uint64_t v1 = sharedManager_formattingMangaer;
  sharedManager_formattingMangaer = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (CAMFormattingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFormattingManager;
  v2 = [(CAMFormattingManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CAMFormattingManager *)v2 _commonCAMFormattingManagerInitialization];
    v4 = v3;
  }

  return v3;
}

- (void)_commonCAMFormattingManagerInitialization
{
  v3 = CAMLocalizedFrameworkString(@"CAMERA_APPLY_CUSTOM_KERNING", 0);
  self->_wantsCustomKerning = [v3 caseInsensitiveCompare:@"YES"] == 0;

  CAMLocalizedFrameworkString(@"CAMERA_SUPPORTS_VERTICAL_TEXT", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_supportsVerticalText = [v4 caseInsensitiveCompare:@"YES"] == 0;
}

- (BOOL)wantsCustomKerning
{
  return self->_wantsCustomKerning;
}

- (BOOL)supportsVerticalText
{
  return self->_supportsVerticalText;
}

@end