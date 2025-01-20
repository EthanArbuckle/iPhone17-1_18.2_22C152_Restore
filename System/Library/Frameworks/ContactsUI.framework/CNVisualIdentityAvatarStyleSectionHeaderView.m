@interface CNVisualIdentityAvatarStyleSectionHeaderView
+ (CGSize)sizeWithText:(id)a3;
+ (NSString)reuseID;
+ (UIFont)font;
- (CNVisualIdentityAvatarStyleSectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)label;
@end

@implementation CNVisualIdentityAvatarStyleSectionHeaderView

- (void).cxx_destruct
{
}

- (UILabel)label
{
  return self->_label;
}

- (CNVisualIdentityAvatarStyleSectionHeaderView)initWithFrame:(CGRect)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)CNVisualIdentityAvatarStyleSectionHeaderView;
  v3 = -[CNVisualIdentityAvatarStyleSectionHeaderView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v4;

    v6 = [(id)objc_opt_class() font];
    [(UILabel *)v3->_label setFont:v6];

    [(CNVisualIdentityAvatarStyleSectionHeaderView *)v3 addSubview:v3->_label];
    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(UILabel *)v3->_label leadingAnchor];
    v24 = [(CNVisualIdentityAvatarStyleSectionHeaderView *)v3 layoutMarginsGuide];
    v22 = [v24 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v26[0] = v21;
    v19 = [(UILabel *)v3->_label trailingAnchor];
    v20 = [(CNVisualIdentityAvatarStyleSectionHeaderView *)v3 layoutMarginsGuide];
    v18 = [v20 trailingAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v26[1] = v17;
    v7 = [(UILabel *)v3->_label topAnchor];
    v8 = [(CNVisualIdentityAvatarStyleSectionHeaderView *)v3 layoutMarginsGuide];
    v9 = [v8 topAnchor];
    v10 = [v7 constraintEqualToAnchor:v9];
    v26[2] = v10;
    v11 = [(UILabel *)v3->_label bottomAnchor];
    v12 = [(CNVisualIdentityAvatarStyleSectionHeaderView *)v3 layoutMarginsGuide];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v26[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
  }
  return v3;
}

+ (UIFont)font
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
}

+ (CGSize)sizeWithText:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  id v4 = a3;
  v5 = [a1 font];
  v14[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v6, 0, 1.79769313e308, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (NSString)reuseID
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end