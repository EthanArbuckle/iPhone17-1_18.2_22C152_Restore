@interface EKUITableViewCellWithPrimaryAndSecondaryFonts
+ (id)primaryTextLabelFontForWidth:(double)a3;
+ (id)secondaryTextLabelFont;
+ (id)timeLabelsFont;
+ (void)initialize;
- (UIEdgeInsets)layoutMargins;
- (id)primaryTextLabelFont;
- (id)secondaryTextLabelFont;
- (id)timeLabelsFont;
@end

@implementation EKUITableViewCellWithPrimaryAndSecondaryFonts

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EKUITableViewCellWithPrimaryAndSecondaryFonts_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, block);
  }
}

void __59__EKUITableViewCellWithPrimaryAndSecondaryFonts_initialize__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__clearFontCaches name:*MEMORY[0x1E4FB27A8] object:0];
}

- (id)timeLabelsFont
{
  id v2 = objc_opt_class();

  return (id)[v2 timeLabelsFont];
}

+ (id)timeLabelsFont
{
  id v2 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB2780] traitCollection:0];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  v4 = objc_msgSend(v3, "monospacedDigitSystemFontOfSize:weight:");

  return v4;
}

- (id)primaryTextLabelFont
{
  v3 = objc_opt_class();
  v4 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self contentView];
  [v4 frame];
  v6 = [v3 primaryTextLabelFontForWidth:v5];

  return v6;
}

+ (id)primaryTextLabelFontForWidth:(double)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4FB2908], a3);
  v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  double v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)secondaryTextLabelFont
{
  id v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)secondaryTextLabelFont
{
  return +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:*MEMORY[0x1E4FB2950] maximumContentSizeCategory:*MEMORY[0x1E4FB2780] traitCollection:0];
}

- (UIEdgeInsets)layoutMargins
{
  [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self bounds];

  double v3 = EKUILayoutMarginsForFullscreenLayoutRectWithSize(0, v2);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end