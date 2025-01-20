@interface DOCTagCheckmarkView
+ (id)checkmarkImage;
- (DOCTag)itemTag;
- (DOCTagCheckmarkView)initWithFrame:(CGRect)a3;
- (id)image;
- (void)_updateTintColor;
- (void)setItemTag:(id)a3;
- (void)updateForChangedTraitsAffectingFonts;
@end

@implementation DOCTagCheckmarkView

+ (id)checkmarkImage
{
  if (checkmarkImage_onceToken != -1) {
    dispatch_once(&checkmarkImage_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)checkmarkImage_checkmarkImage;

  return v2;
}

void __37__DOCTagCheckmarkView_checkmarkImage__block_invoke()
{
  v0 = +[DOCTagAppearance pickerList];
  id v3 = [v0 checkmarkImageConfiguration];

  uint64_t v1 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark" withConfiguration:v3];
  v2 = (void *)checkmarkImage_checkmarkImage;
  checkmarkImage_checkmarkImage = v1;
}

- (id)image
{
  return [(UIImageView *)self->_imageView image];
}

- (DOCTagCheckmarkView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)DOCTagCheckmarkView;
  id v3 = -[DOCTagCheckmarkView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DOCTagCheckmarkView *)v3 setContentMode:1];
    id v5 = objc_alloc(MEMORY[0x263F82828]);
    v6 = [(id)objc_opt_class() checkmarkImage];
    uint64_t v7 = [v5 initWithImage:v6];
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    [(DOCTagCheckmarkView *)v4 _updateTintColor];
    [(DOCTagCheckmarkView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(DOCTagCheckmarkView *)v4 image];
    [v9 size];
    double v11 = v10;

    double v12 = 1.0;
    if (v11 > 0.0)
    {
      v13 = [(DOCTagCheckmarkView *)v4 image];
      [v13 size];
      double v15 = v14;
      v16 = [(DOCTagCheckmarkView *)v4 image];
      [v16 size];
      double v12 = v15 / v17;
    }
    v18 = [(DOCTagCheckmarkView *)v4 widthAnchor];
    v19 = [(DOCTagCheckmarkView *)v4 heightAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 multiplier:v12];
    [v20 setActive:1];

    v21 = [(DOCTagCheckmarkView *)v4 heightAnchor];
    uint64_t v22 = [v21 constraintEqualToConstant:0.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1144750080;
    [(NSLayoutConstraint *)v4->_heightConstraint setPriority:v24];
    [(DOCTagCheckmarkView *)v4 updateForChangedTraitsAffectingFonts];
    [(NSLayoutConstraint *)v4->_heightConstraint setActive:1];
    [(DOCTagCheckmarkView *)v4 addSubview:v4->_imageView];
    v25 = (void *)MEMORY[0x263F08938];
    v26 = DOCConstraintsToResizeWithSuperview();
    [v25 activateConstraints:v26];

    v27 = objc_msgSend(MEMORY[0x263F82DA0], "doc_traitsAffectingFonts");
    id v28 = (id)[(DOCTagCheckmarkView *)v4 registerForTraitChanges:v27 withAction:sel_updateForChangedTraitsAffectingFonts];
  }
  return v4;
}

- (void)updateForChangedTraitsAffectingFonts
{
  id v3 = [(DOCTagCheckmarkView *)self image];
  [v3 alignmentRectInsets];
  double v5 = v4;
  v6 = [(DOCTagCheckmarkView *)self image];
  [v6 alignmentRectInsets];
  double v8 = v5 + v7;

  v9 = [(DOCTagCheckmarkView *)self image];
  [v9 size];
  double v11 = v10 - v8;

  double v12 = [MEMORY[0x263F82770] defaultMetrics];
  v13 = [(DOCTagCheckmarkView *)self traitCollection];
  [v12 scaledValueForValue:v13 compatibleWithTraitCollection:v11];
  double v15 = v14;

  heightConstraint = self->_heightConstraint;

  [(NSLayoutConstraint *)heightConstraint setConstant:v15];
}

- (void)setItemTag:(id)a3
{
  id v5 = a3;
  if ((-[DOCTag isEqual:](self->_itemTag, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_itemTag, a3);
    [(DOCTagCheckmarkView *)self _updateTintColor];
  }
}

- (void)_updateTintColor
{
  id v4 = +[DOCTagAppearance pickerList];
  id v3 = [v4 checkmarkImageColorForTag:self->_itemTag];
  [(UIImageView *)self->_imageView setTintColor:v3];
}

- (DOCTag)itemTag
{
  return self->_itemTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTag, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end