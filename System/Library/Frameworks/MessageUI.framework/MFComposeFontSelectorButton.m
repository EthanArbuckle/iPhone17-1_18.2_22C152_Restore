@interface MFComposeFontSelectorButton
+ (id)buttonWithFont:(id)a3;
- (UIFont)representedFont;
- (void)layoutSubviews;
- (void)setRepresentedFont:(id)a3;
@end

@implementation MFComposeFontSelectorButton

+ (id)buttonWithFont:(id)a3
{
  id v3 = a3;
  v4 = +[MFComposeFontSelectorButton buttonWithType:0];
  [v4 setContentHorizontalAlignment:4];
  [v4 setContentVerticalAlignment:0];
  v5 = [v4 tintColor];
  v6 = [v4 titleLabel];
  [v6 setTextColor:v5];

  v7 = [v4 titleLabel];
  [v7 setLineBreakMode:4];

  v8 = [v4 titleLabel];
  [v8 setAdjustsFontSizeToFitWidth:1];

  v9 = [v4 titleLabel];
  [v9 setBaselineAdjustment:1];

  [v4 setRepresentedFont:v3];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F73C98]];
  v10 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:textStyle:scale:", @"chevron.forward", *MEMORY[0x1E4FB28C8], 3);
  [v4 setImage:v10 forState:0];

  return v4;
}

- (void)setRepresentedFont:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = (UIFont *)a3;
  if (self->_representedFont != v5)
  {
    objc_storeStrong((id *)&self->_representedFont, a3);
    v6 = [(MFComposeFontSelectorButton *)self titleLabel];
    v7 = [v6 font];
    [v7 pointSize];
    -[UIFont fontWithSize:](v5, "fontWithSize:");
    v8 = (const __CTFont *)objc_claimAutoreleasedReturnValue();

    if ((CTFontIsSystemUIFont() & 1) != 0 || CTFontIsTextStyleFont())
    {
      v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"FORMAT_DEFAULT_FONT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    }
    else
    {
      v10 = (void *)CTFontCopyLocalizedName(v8, (CFStringRef)*MEMORY[0x1E4F24540], 0);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v14 = *MEMORY[0x1E4FB06F8];
    v15[0] = v8;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v13 = (void *)[v11 initWithString:v10 attributes:v12];

    [(MFComposeFontSelectorButton *)self setAttributedTitle:v13 forState:0];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MFComposeFontSelectorButton;
  [(MFComposeFontSelectorButton *)&v11 layoutSubviews];
  uint64_t v3 = [(MFComposeFontSelectorButton *)self effectiveUserInterfaceLayoutDirection];
  [(MFComposeFontSelectorButton *)self frame];
  double v5 = v4;
  v6 = [(MFComposeFontSelectorButton *)self imageView];
  [v6 bounds];
  if (v3 == 1)
  {
    -[MFComposeFontSelectorButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, 5.0, 0.0, v5 - (v7 + 5.0));

    v8 = [(MFComposeFontSelectorButton *)self imageView];
    [v8 bounds];
    -[MFComposeFontSelectorButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v9 + 10.0, 0.0, 5.0);
  }
  else
  {
    -[MFComposeFontSelectorButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v5 - (v7 + 5.0), 0.0, 5.0);

    v8 = [(MFComposeFontSelectorButton *)self imageView];
    [v8 bounds];
    -[MFComposeFontSelectorButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, v10 + 10.0);
  }
}

- (UIFont)representedFont
{
  return self->_representedFont;
}

- (void).cxx_destruct
{
}

@end