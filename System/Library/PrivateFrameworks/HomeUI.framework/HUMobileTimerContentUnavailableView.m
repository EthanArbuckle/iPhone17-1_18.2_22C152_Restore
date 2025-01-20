@interface HUMobileTimerContentUnavailableView
- (HUMobileTimerContentUnavailableView)init;
- (id)_titleFont;
@end

@implementation HUMobileTimerContentUnavailableView

- (HUMobileTimerContentUnavailableView)init
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HUMobileTimerContentUnavailableView;
  v2 = -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](&v10, sel_initWithFrame_title_style_includeBackdrop_, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setAlignment:1];
    LODWORD(v4) = 1.0;
    [v3 setHyphenationFactor:v4];
    [v3 setLineBreakMode:0];
    v11[0] = *MEMORY[0x1E4F42508];
    v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v11[1] = *MEMORY[0x1E4F42540];
    v12[0] = v5;
    v12[1] = v3;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F18F92B8 attributes:v6];
    v8 = [(_UIContentUnavailableView *)v2 _messageLabel];
    [v8 setAttributedText:v7];
  }
  return v2;
}

- (id)_titleFont
{
  v2 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438A0] addingSymbolicTraits:2 options:0];
  v3 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v2 size:0.0];

  return v3;
}

@end