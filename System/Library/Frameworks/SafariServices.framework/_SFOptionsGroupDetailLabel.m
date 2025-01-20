@interface _SFOptionsGroupDetailLabel
- (_SFOptionsGroupDetailLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
@end

@implementation _SFOptionsGroupDetailLabel

- (_SFOptionsGroupDetailLabel)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_SFOptionsGroupDetailLabel;
  v3 = -[_SFOptionsGroupDetailLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v9[0] = objc_opt_class();
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v5 = (id)[(_SFOptionsGroupDetailLabel *)v3 registerForTraitChanges:v4 withTarget:v3 action:sel_setNeedsLayout];

    v6 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_SFOptionsGroupDetailLabel;
  [(_SFOptionsGroupDetailLabel *)&v4 layoutSubviews];
  v3 = [(_SFOptionsGroupDetailLabel *)self attributedText];
  [(_SFOptionsGroupDetailLabel *)self setAttributedText:v3];
}

- (void)setAttributedText:(id)a3
{
  objc_super v4 = (void *)[a3 mutableCopy];
  objc_msgSend(v4, "removeAttribute:range:", *MEMORY[0x1E4FB12B8], 0, objc_msgSend(v4, "length"));
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v5 = *MEMORY[0x1E4FB12B0];
  v6 = [v4 attribute:*MEMORY[0x1E4FB12B0] atIndex:0 effectiveRange:&v14];
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    [v7 pointSize];
    double v9 = v8;

    v10 = [v6 fontWithSize:v9];
    objc_msgSend(v4, "addAttribute:value:range:", v5, v10, v14, v15);
  }
  v11 = [(_SFOptionsGroupDetailLabel *)self attributedText];
  char v12 = [v11 isEqualToAttributedString:v4];

  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFOptionsGroupDetailLabel;
    [(_SFOptionsGroupDetailLabel *)&v13 setAttributedText:v4];
  }
}

@end