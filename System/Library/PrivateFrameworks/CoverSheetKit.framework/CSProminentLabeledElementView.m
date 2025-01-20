@interface CSProminentLabeledElementView
- (CSProminentLabeledElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5 glyph:(id)a6;
- (UIImage)glyph;
- (void)setGlyph:(id)a3;
- (void)setOverrideString:(id)a3;
@end

@implementation CSProminentLabeledElementView

- (CSProminentLabeledElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5 glyph:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CSProminentLabeledElementView;
  v12 = [(CSProminentTextElementView *)&v15 initWithDate:a3 font:a4 textColor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_glyph, a6);
  }

  return v13;
}

- (void)setOverrideString:(id)a3
{
  id v18 = a3;
  v4 = [(CSProminentTextElementView *)self overrideString];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4FB0870];
    v7 = [(CSProminentLabeledElementView *)self glyph];
    v8 = [v6 textAttachmentWithImage:v7];

    v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    uint64_t v12 = [(CSProminentLabeledElementView *)self effectiveUserInterfaceLayoutDirection];
    if (v12 == 1) {
      v13 = v10;
    }
    else {
      v13 = v9;
    }
    if (v12 == 1) {
      v14 = v9;
    }
    else {
      v14 = v10;
    }
    [v11 appendAttributedString:v13];
    [v11 appendAttributedString:v14];
    objc_super v15 = [(CSProminentTextElementView *)self textLabel];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(CSProminentTextElementView *)self textLabel];
      [v17 setAttributedText:v11];
    }
    [(CSProminentLabeledElementView *)self setNeedsLayout];
  }
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
}

- (void).cxx_destruct
{
}

@end