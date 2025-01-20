@interface CKPinnedSectionSeparatorView
+ (UIEdgeInsets)padding;
+ (double)heightWithPadding;
+ (id)reuseIdentifier;
- (CKPinnedSectionSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation CKPinnedSectionSeparatorView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CKPinnedSectionSeparatorView)initWithFrame:(CGRect)a3
{
  v28[5] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CKPinnedSectionSeparatorView;
  v3 = -[CKPinnedSectionSeparatorView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(CKPinnedSectionSeparatorView *)v3 bounds];
    double v6 = v5 * 0.5 + -1.0;
    [(CKPinnedSectionSeparatorView *)v3 bounds];
    v7 = objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [v7 layer];
    [v8 setCornerRadius:1.0];

    v9 = [MEMORY[0x1E4F428B8] separatorColor];
    [v7 setBackgroundColor:v9];

    [(CKPinnedSectionSeparatorView *)v3 addSubview:v7];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [v7 leadingAnchor];
    v25 = [(CKPinnedSectionSeparatorView *)v3 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [v7 trailingAnchor];
    v22 = [(CKPinnedSectionSeparatorView *)v3 trailingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v28[1] = v21;
    v19 = [v7 centerXAnchor];
    v10 = [(CKPinnedSectionSeparatorView *)v3 centerXAnchor];
    v11 = [v19 constraintEqualToAnchor:v10];
    v28[2] = v11;
    v12 = [v7 centerYAnchor];
    v13 = [(CKPinnedSectionSeparatorView *)v3 centerYAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v28[3] = v14;
    v15 = [v7 heightAnchor];
    v16 = [v15 constraintEqualToConstant:2.0];
    v28[4] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
    [v20 activateConstraints:v17];
  }
  return v3;
}

+ (UIEdgeInsets)padding
{
  double v2 = 4.0;
  double v3 = 0.0;
  double v4 = 4.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)heightWithPadding
{
  [(id)objc_opt_class() padding];
  return v3 + v2 + 2.0;
}

@end