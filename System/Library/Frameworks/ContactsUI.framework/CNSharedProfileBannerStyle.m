@interface CNSharedProfileBannerStyle
+ (id)defaultActionButtonConfiguration;
+ (id)defaultStyle;
- (UIButtonConfiguration)actionButtonConfiguration;
- (UIColor)backgroundColor;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImageSymbolConfiguration)xmarkButtonColorConfiguration;
- (UIVisualEffectView)backgroundVisualEffectView;
- (double)leadingTrailingInset;
- (void)setActionButtonConfiguration:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setLeadingTrailingInset:(double)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setXmarkButtonColorConfiguration:(id)a3;
@end

@implementation CNSharedProfileBannerStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_xmarkButtonColorConfiguration, 0);
  objc_storeStrong((id *)&self->_actionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);

  objc_storeStrong((id *)&self->_titleTextColor, 0);
}

- (void)setLeadingTrailingInset:(double)a3
{
  self->_leadingTrailingInset = a3;
}

- (double)leadingTrailingInset
{
  return self->_leadingTrailingInset;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setXmarkButtonColorConfiguration:(id)a3
{
}

- (UIImageSymbolConfiguration)xmarkButtonColorConfiguration
{
  return self->_xmarkButtonColorConfiguration;
}

- (void)setActionButtonConfiguration:(id)a3
{
}

- (UIButtonConfiguration)actionButtonConfiguration
{
  return self->_actionButtonConfiguration;
}

- (void)setSubtitleFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setSubtitleTextColor:(id)a3
{
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

+ (id)defaultActionButtonConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v2 setButtonSize:1];
  [v2 setTitleTextAttributesTransformer:&__block_literal_global_41013];

  return v2;
}

id __62__CNSharedProfileBannerStyle_defaultActionButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[v2 mutableCopy];
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  v6 = [v5 fontDescriptor];
  v7 = +[CNUIFontRepository boldFontWithFontDescriptor:v6];
  [v3 setObject:v7 forKeyedSubscript:v4];

  return v3;
}

+ (id)defaultStyle
{
  v3 = objc_alloc_init(CNSharedProfileBannerStyle);
  uint64_t v4 = [MEMORY[0x1E4FB1618] labelColor];
  [(CNSharedProfileBannerStyle *)v3 setTitleTextColor:v4];

  v5 = +[CNUIColorRepository sharedProfileBannerSubtitleDefaultColor];
  [(CNSharedProfileBannerStyle *)v3 setSubtitleTextColor:v5];

  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(CNSharedProfileBannerStyle *)v3 setTitleFont:v7];

  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
  [(CNSharedProfileBannerStyle *)v3 setSubtitleFont:v8];

  v9 = [a1 defaultActionButtonConfiguration];
  [(CNSharedProfileBannerStyle *)v3 setActionButtonConfiguration:v9];

  v10 = (void *)MEMORY[0x1E4FB1830];
  v11 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v12 = [v10 configurationWithHierarchicalColor:v11];
  [(CNSharedProfileBannerStyle *)v3 setXmarkButtonColorConfiguration:v12];

  v13 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(CNSharedProfileBannerStyle *)v3 setBackgroundColor:v13];

  [(CNSharedProfileBannerStyle *)v3 setLeadingTrailingInset:0.0];

  return v3;
}

@end