@interface ASCAdTransparencyContainerView
+ (double)buttonTextPadding;
+ (double)edgePadding;
+ (id)developerNameFontCompatibleWithTraitCollection:(id)a3;
- (ASCAdTransparencyButtonView)adTransparencyButton;
- (ASCAdTransparencyContainerView)initWithCoder:(id)a3;
- (ASCAdTransparencyContainerView)initWithFrame:(CGRect)a3;
- (BOOL)isBackgroundHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)developerName;
- (UILabel)titleLabel;
- (UIVisualEffectView)backgroundView;
- (void)addAdTransparencyTarget:(id)a3 action:(SEL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateFont;
@end

@implementation ASCAdTransparencyContainerView

+ (id)developerNameFontCompatibleWithTraitCollection:(id)a3
{
  v3 = [a3 preferredContentSizeCategory];
  +[__ASCLayoutProxy adTransparencyDeveloperNamePointSizeProvider:v3];
  double v5 = v4;

  if (!developerNameFontCompatibleWithTraitCollection__textFont
    || ([(id)developerNameFontCompatibleWithTraitCollection__textFont pointSize], v6 != v5))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1798] systemFontOfSize:v5 weight:*MEMORY[0x1E4FB29C8]];
    v8 = (void *)developerNameFontCompatibleWithTraitCollection__textFont;
    developerNameFontCompatibleWithTraitCollection__textFont = v7;
  }
  v9 = (void *)developerNameFontCompatibleWithTraitCollection__textFont;

  return v9;
}

+ (double)edgePadding
{
  return 5.0;
}

+ (double)buttonTextPadding
{
  return 4.0;
}

- (ASCAdTransparencyContainerView)initWithFrame:(CGRect)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)ASCAdTransparencyContainerView;
  v3 = -[ASCAdTransparencyContainerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    -[ASCAdTransparencyContainerView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(ASCAdTransparencyContainerView *)v4 setBackgroundColor:v5];

    double v6 = [ASCAdTransparencyButtonView alloc];
    uint64_t v7 = -[ASCAdTransparencyButtonView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    adTransparencyButton = v4->_adTransparencyButton;
    v4->_adTransparencyButton = (ASCAdTransparencyButtonView *)v7;

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    v11 = v4->_titleLabel;
    v12 = [MEMORY[0x1E4FB1618] grayColor];
    [(UILabel *)v11 setTextColor:v12];

    [(ASCAdTransparencyContainerView *)v4 addSubview:v4->_adTransparencyButton];
    [(ASCAdTransparencyContainerView *)v4 addSubview:v4->_titleLabel];
    [(ASCAdTransparencyContainerView *)v4 updateFont];
    v13 = self;
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = (id)[(ASCAdTransparencyContainerView *)v4 registerForTraitChanges:v14 withAction:sel_updateFont];
  }
  return v4;
}

- (ASCAdTransparencyContainerView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isBackgroundHidden
{
  v3 = [(ASCAdTransparencyContainerView *)self backgroundView];

  if (!v3) {
    return 1;
  }
  double v4 = [(ASCAdTransparencyContainerView *)self backgroundView];
  char v5 = [v4 isHidden];

  return v5;
}

- (void)setBackgroundHidden:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(ASCAdTransparencyContainerView *)self backgroundView];
  double v6 = v5;
  if (v3)
  {
    [v5 setHidden:1];

    uint64_t v7 = [MEMORY[0x1E4FB1618] grayColor];
  }
  else
  {

    if (!v6)
    {
      v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:18];
      v9 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v8];
      backgroundView = self->_backgroundView;
      self->_backgroundView = v9;

      v11 = [(UIVisualEffectView *)self->_backgroundView layer];
      [v11 setCornerRadius:5.0];

      v12 = [(UIVisualEffectView *)self->_backgroundView layer];
      [v12 setMasksToBounds:1];

      [(ASCAdTransparencyContainerView *)self insertSubview:self->_backgroundView atIndex:0];
    }
    v13 = [(ASCAdTransparencyContainerView *)self backgroundView];
    [v13 setHidden:0];

    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v14 = (void *)v7;
  id v15 = [(ASCAdTransparencyContainerView *)self titleLabel];
  [v15 setTextColor:v14];

  [(ASCAdTransparencyContainerView *)self setNeedsLayout];
}

- (void)setDeveloperName:(id)a3
{
  double v4 = (NSString *)a3;
  if (v4)
  {
    char v5 = NSString;
    double v6 = ASCLocalizedFormatString(@"DEVELOPER_NAME_TEXT");
    uint64_t v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v8 = [(ASCAdTransparencyContainerView *)self titleLabel];
    [v8 setText:v7];
  }
  else
  {
    double v6 = [(ASCAdTransparencyContainerView *)self titleLabel];
    [v6 setText:0];
  }

  developerName = self->_developerName;
  self->_developerName = v4;

  [(ASCAdTransparencyContainerView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 0.0;
  if (![(ASCAdTransparencyContainerView *)self isBackgroundHidden])
  {
    +[ASCAdTransparencyContainerView edgePadding];
    double v6 = v7;
  }
  +[ASCAdTransparencyContainerView buttonTextPadding];
  double v9 = v8;
  v10 = [(ASCAdTransparencyContainerView *)self adTransparencyButton];
  objc_msgSend(v10, "sizeThatFits:", width, height);
  double v12 = v11;
  double v14 = v13;

  id v15 = [(ASCAdTransparencyContainerView *)self titleLabel];
  [v15 intrinsicContentSize];
  double v17 = v16;

  double v18 = v6 + v9 + v6 + v12 + v17;
  double v19 = v6 + v6 + v14;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)layoutSubviews
{
  v68.receiver = self;
  v68.super_class = (Class)ASCAdTransparencyContainerView;
  [(ASCAdTransparencyContainerView *)&v68 layoutSubviews];
  [(ASCAdTransparencyContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = 0.0;
  if (![(ASCAdTransparencyContainerView *)self isBackgroundHidden])
  {
    +[ASCAdTransparencyContainerView edgePadding];
    double v11 = v12;
  }
  +[ASCAdTransparencyContainerView buttonTextPadding];
  double v63 = v13;
  double v14 = [(ASCAdTransparencyContainerView *)self adTransparencyButton];
  objc_msgSend(v14, "sizeThatFits:", v8, v10);
  double v16 = v15;
  double v18 = v17;

  double v19 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v19, v11, v11, v16, v18, v4, v6, v8, v10);
  double v66 = v6;
  double v67 = v4;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v65 = v10;
  double v27 = v26;
  v28 = [(ASCAdTransparencyContainerView *)self adTransparencyButton];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v69.origin.x = v11;
  v69.origin.y = v11;
  v69.size.double width = v16;
  v69.size.double height = v18;
  double v29 = v8 - CGRectGetMaxX(v69) - v63 - v11;
  v30 = [(ASCAdTransparencyContainerView *)self titleLabel];
  [(ASCAdTransparencyContainerView *)self bounds];
  objc_msgSend(v30, "sizeThatFits:", v29, v31);
  double v33 = v32;
  double v35 = v34;

  v70.origin.x = v11;
  v70.origin.y = v11;
  v70.size.double width = v16;
  v70.size.double height = v18;
  double v36 = v63 + CGRectGetMaxX(v70);
  CGFloat v64 = v36;
  [(ASCAdTransparencyContainerView *)self bounds];
  double v38 = v37 * 0.5 - v35 * 0.5;
  CGFloat v62 = v38;
  if (v33 < v29) {
    double v29 = v33;
  }
  v39 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v39, v36, v38, v29, v35, v67, v66, v8, v65);
  double v41 = v40;
  double v43 = v42;
  double v44 = v8;
  double v46 = v45;
  double v48 = v47;
  v49 = [(ASCAdTransparencyContainerView *)self titleLabel];
  objc_msgSend(v49, "setFrame:", v41, v43, v46, v48);

  v71.origin.y = v62;
  v71.origin.x = v64;
  v71.size.double width = v29;
  v71.size.double height = v35;
  double v50 = v11 + CGRectGetMaxX(v71);
  if (v44 >= v50) {
    double v51 = v50;
  }
  else {
    double v51 = v44;
  }
  v52 = [(UIView *)self asc_layoutTraitEnvironment];
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v52, 0.0, 0.0, v51, v65, v67, v66, v44, v65);
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  v61 = [(ASCAdTransparencyContainerView *)self backgroundView];
  objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);
}

- (void)addAdTransparencyTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(ASCAdTransparencyContainerView *)self adTransparencyButton];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (void)updateFont
{
  id v5 = [(ASCAdTransparencyContainerView *)self titleLabel];
  double v3 = [(ASCAdTransparencyContainerView *)self traitCollection];
  double v4 = +[ASCAdTransparencyContainerView developerNameFontCompatibleWithTraitCollection:v3];
  [v5 setFont:v4];
}

- (NSString)developerName
{
  return self->_developerName;
}

- (ASCAdTransparencyButtonView)adTransparencyButton
{
  return self->_adTransparencyButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_adTransparencyButton, 0);

  objc_storeStrong((id *)&self->_developerName, 0);
}

@end