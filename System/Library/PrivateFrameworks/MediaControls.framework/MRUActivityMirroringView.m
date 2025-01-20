@interface MRUActivityMirroringView
- (BSUIEmojiLabelView)deviceNameView;
- (CCUICAPackageView)packageView;
- (MRUActivityAccessoryView)leadingView;
- (MRUActivityAccessoryView)trailingView;
- (MRUActivityMirroringView)initWithFrame:(CGRect)a3;
- (NSString)deviceName;
- (NSString)state;
- (UIButton)button;
- (UIImage)deviceImage;
- (UIImageView)deviceImageView;
- (UILabel)headerLabel;
- (double)preferredHeightForBottomSafeArea;
- (void)layoutSubviews;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceImageView:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceNameView:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setPackageView:(id)a3;
- (void)setState:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateDeviceSymbolConfiguration;
- (void)updatePackageScale;
- (void)updateVisibilty;
@end

@implementation MRUActivityMirroringView

- (MRUActivityMirroringView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)MRUActivityMirroringView;
  v3 = -[MRUActivityMirroringView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E4F5ADE0]);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    [(CCUICAPackageView *)v3->_packageView setUserInteractionEnabled:0];
    v6 = +[MRUAssetsProvider packageDescriptionWithName:@"MirroringLeading"];
    [(CCUICAPackageView *)v3->_packageView setPackageDescription:v6];

    v7 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v3->_packageView, 23.0, 22.0);
    leadingView = v3->_leadingView;
    v3->_leadingView = v7;

    [(MRUActivityMirroringView *)v3 addSubview:v3->_leadingView];
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = v9;

    [(UIImageView *)v3->_deviceImageView setContentMode:1];
    v11 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v3->_deviceImageView, 23.0, 22.0);
    trailingView = v3->_trailingView;
    v3->_trailingView = v11;

    [(MRUActivityMirroringView *)v3 addSubview:v3->_trailingView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v13;

    v15 = +[MRUStringsProvider screenMirroring];
    [(UILabel *)v3->_headerLabel setText:v15];

    [(UILabel *)v3->_headerLabel setNumberOfLines:1];
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_headerLabel setTextColor:v16];

    [(MRUActivityMirroringView *)v3 addSubview:v3->_headerLabel];
    v17 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E4F4F8B0]);
    deviceNameView = v3->_deviceNameView;
    v3->_deviceNameView = v17;

    [(BSUIEmojiLabelView *)v3->_deviceNameView setNumberOfLines:1];
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(BSUIEmojiLabelView *)v3->_deviceNameView setTextColor:v19];

    [(MRUActivityMirroringView *)v3 addSubview:v3->_deviceNameView];
    v20 = [MEMORY[0x1E4FB1618] colorWithRed:0.22745098 green:0.509803922 blue:0.968627451 alpha:1.0];
    v21 = objc_msgSend(MEMORY[0x1E4FB14D8], "sbui_systemApertureTextButtonConfiguration");
    [v21 setBaseForegroundColor:v20];
    [v21 setBaseBackgroundColor:v20];
    uint64_t v22 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v21 primaryAction:0];
    button = v3->_button;
    v3->_button = (UIButton *)v22;

    v24 = v3->_button;
    v25 = +[MRUStringsProvider stopMirroring];
    [(UIButton *)v24 setTitle:v25 forState:0];

    [(MRUActivityMirroringView *)v3 addSubview:v3->_button];
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUActivityMirroringView *)v3 updateContentSizeCategory];
    [(MRUActivityMirroringView *)v3 updatePackageScale];
    [(MRUActivityMirroringView *)v3 updateDeviceSymbolConfiguration];
    [(MRUActivityMirroringView *)v3 updateVisibilty];
  }
  return v3;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)MRUActivityMirroringView;
  [(MRUActivityMirroringView *)&v58 layoutSubviews];
  [(MRUActivityMirroringView *)self updatePackageScale];
  [(MRUActivityMirroringView *)self updateDeviceSymbolConfiguration];
  [(MRUActivityMirroringView *)self updateVisibilty];
  uint64_t v3 = [(MRUActivityMirroringView *)self SBUISA_layoutMode];
  [(MRUActivityMirroringView *)self bounds];
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v3 == 4)
  {
    CGFloat v12 = v4 + 20.0;
    CGFloat v13 = v5 + 29.0;
    CGFloat v14 = v6 - (20.0 + 20.0);
    CGFloat v15 = v7 - (29.0 + 17.0);
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v14, v15);
    double v17 = v16;
    v59.origin.CGFloat x = v12;
    v59.origin.CGFloat y = v13;
    v59.size.CGFloat width = v14;
    v59.size.CGFloat height = v15;
    double MinX = CGRectGetMinX(v59);
    v60.origin.CGFloat x = v12;
    v60.origin.CGFloat y = v13;
    v60.size.CGFloat width = v14;
    v60.size.CGFloat height = v15;
    CGFloat v19 = CGRectGetMaxY(v60) - v17;
    v61.origin.CGFloat x = v12;
    v61.origin.CGFloat y = v13;
    v61.size.CGFloat width = v14;
    v61.size.CGFloat height = v15;
    -[UIButton setFrame:](self->_button, "setFrame:", MinX, v19, CGRectGetWidth(v61), v17);
    UIRectInset();
    CGFloat x = v62.origin.x;
    CGFloat y = v62.origin.y;
    CGFloat width = v62.size.width;
    CGFloat height = v62.size.height;
    CGFloat v57 = CGRectGetMinX(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v63);
    [(MRUActivityMirroringView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGFloat v55 = CGRectGetMaxX(v64) - 40.0;
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    CGFloat v24 = CGRectGetMinY(v65);
    [(MRUActivityMirroringView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_trailingView, "setFrame:");
    [(UILabel *)self->_headerLabel mr_tightBoundingRectOfFirstLine];
    CGRectGetMinY(v66);
    v25 = [(MRUActivityMirroringView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
    [v25 layoutFrame];
    CGRectGetHeight(v67);

    v68.origin.CGFloat x = v55;
    v68.size.CGFloat height = 40.0;
    v68.origin.CGFloat y = v24;
    v68.size.CGFloat width = 40.0;
    CGRectGetWidth(v68);
    v69.origin.CGFloat y = MinY;
    v69.origin.CGFloat x = v57;
    v69.size.CGFloat height = 38.0;
    v69.size.CGFloat width = 50.0;
    CGRectGetWidth(v69);
    UIRectInset();
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v30, v32);
    double v35 = v34;
    v70.origin.CGFloat x = v27;
    v70.origin.CGFloat y = v29;
    v70.size.CGFloat width = v31;
    v70.size.CGFloat height = v33;
    double v36 = CGRectGetMinX(v70);
    v71.origin.CGFloat x = v27;
    v71.origin.CGFloat y = v29;
    v71.size.CGFloat width = v31;
    v71.size.CGFloat height = v33;
    double v37 = CGRectGetMinY(v71);
    CGFloat v38 = v27;
    CGFloat v39 = v29;
    CGFloat v40 = v31;
    CGFloat v41 = v33;
  }
  else
  {
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v6, v7);
    v72.origin.CGFloat x = v8;
    v72.origin.CGFloat y = v9;
    v72.size.CGFloat width = v10;
    v72.size.CGFloat height = v11;
    CGRectGetWidth(v72);
    UIRectCenteredRect();
    -[UIButton setFrame:](self->_button, "setFrame:");
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v10, v11);
    double v35 = v42;
    v73.origin.CGFloat x = v8;
    v73.origin.CGFloat y = v9;
    v73.size.CGFloat width = v10;
    v73.size.CGFloat height = v11;
    double v36 = CGRectGetMinX(v73);
    v74.origin.CGFloat x = v8;
    v74.origin.CGFloat y = v9;
    v74.size.CGFloat width = v10;
    v74.size.CGFloat height = v11;
    double v37 = CGRectGetMinY(v74);
    CGFloat v38 = v8;
    CGFloat v39 = v9;
    CGFloat v40 = v10;
    CGFloat v41 = v11;
  }
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v36, v37, CGRectGetWidth(*(CGRect *)&v38), v35);
  UIRectInset();
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  -[BSUIEmojiLabelView sizeThatFits:](self->_deviceNameView, "sizeThatFits:", v47, v49);
  double v52 = v51;
  v75.origin.CGFloat x = v44;
  v75.origin.CGFloat y = v46;
  v75.size.CGFloat width = v48;
  v75.size.CGFloat height = v50;
  double v53 = CGRectGetMinX(v75);
  v76.origin.CGFloat x = v44;
  v76.origin.CGFloat y = v46;
  v76.size.CGFloat width = v48;
  v76.size.CGFloat height = v50;
  double v54 = CGRectGetMinY(v76);
  v77.origin.CGFloat x = v44;
  v77.origin.CGFloat y = v46;
  v77.size.CGFloat width = v48;
  v77.size.CGFloat height = v50;
  -[BSUIEmojiLabelView setFrame:](self->_deviceNameView, "setFrame:", v53, v54, CGRectGetWidth(v77), v52);
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
  id v5 = a3;
  [(BSUIEmojiLabelView *)self->_deviceNameView setText:v5];

  [(MRUActivityMirroringView *)self setNeedsLayout];
}

- (void)setDeviceImage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_deviceImageView setImage:v5];

  [(MRUActivityMirroringView *)self setNeedsLayout];
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
  id v5 = a3;
  [(CCUICAPackageView *)self->_packageView setStateName:v5];
}

- (double)preferredHeightForBottomSafeArea
{
  [(UILabel *)self->_headerLabel mr_tightBoundingRectOfFirstLine];
  double v3 = 17.0 + 14.0 - CGRectGetMinY(v10);
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v5 = v3 + v4;
  -[BSUIEmojiLabelView sizeThatFits:](self->_deviceNameView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v7 = v5 + v6;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v7 + v8;
}

- (void)updateContentSizeCategory
{
  double v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = [(UILabel *)self->_headerLabel traitCollection];
  double v5 = objc_msgSend(v3, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v4);
  [(UILabel *)self->_headerLabel setFont:v5];

  double v6 = (void *)MEMORY[0x1E4FB08E0];
  id v8 = [(BSUIEmojiLabelView *)self->_deviceNameView traitCollection];
  double v7 = objc_msgSend(v6, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 4, v8);
  [(BSUIEmojiLabelView *)self->_deviceNameView setFont:v7];
}

- (void)updateVisibilty
{
  if ([(MRUActivityMirroringView *)self SBUISA_layoutMode] == 4)
  {
    p_button = &self->_button;
    button = self->_button;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v24[0] = *MEMORY[0x1E4F1DAB8];
    long long v14 = v24[0];
    v24[1] = v15;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v13 = v25;
    [(UIButton *)button setTransform:v24];
    p_headerLabel = &self->_headerLabel;
    headerLabel = self->_headerLabel;
    v23[0] = v14;
    v23[1] = v15;
    v23[2] = v13;
    [(UILabel *)headerLabel setTransform:v23];
    p_deviceNameView = (id *)&self->_deviceNameView;
    id v8 = *p_deviceNameView;
    v22[0] = v14;
    v22[1] = v15;
    v22[2] = v13;
    [v8 setTransform:v22];
    double v9 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    p_button = &self->_button;
    CGRect v10 = self->_button;
    CGAffineTransform v20 = v21;
    [(UIButton *)v10 setTransform:&v20];
    CGAffineTransformMakeScale(&v19, 0.5, 0.5);
    p_headerLabel = &self->_headerLabel;
    double v11 = self->_headerLabel;
    CGAffineTransform v18 = v19;
    [(UILabel *)v11 setTransform:&v18];
    CGAffineTransformMakeScale(&v17, 0.5, 0.5);
    p_deviceNameView = (id *)&self->_deviceNameView;
    id v12 = *p_deviceNameView;
    CGAffineTransform v16 = v17;
    [v12 setTransform:&v16];
    double v9 = 0.0;
  }
  [(UIButton *)*p_button setAlpha:v9];
  [(UILabel *)*p_headerLabel setAlpha:v9];
  [*p_deviceNameView setAlpha:v9];
}

- (void)updatePackageScale
{
  uint64_t v3 = [(MRUActivityMirroringView *)self SBUISA_layoutMode];
  double v4 = 1.66666667;
  if (v3 != 4) {
    double v4 = 1.0;
  }
  packageView = self->_packageView;

  [(CCUICAPackageView *)packageView setScale:v4];
}

- (void)updateDeviceSymbolConfiguration
{
  if ([(MRUActivityMirroringView *)self SBUISA_layoutMode] == 4)
  {
    double v3 = 34.0;
    uint64_t v4 = 4;
  }
  else
  {
    double v3 = 15.0;
    uint64_t v4 = 5;
  }
  id v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:v4 weight:2 scale:v3];
  double v5 = (void *)MEMORY[0x1E4FB1830];
  double v6 = [MEMORY[0x1E4FB1618] systemGray2Color];
  double v7 = [v5 configurationWithHierarchicalColor:v6];
  id v8 = [v9 configurationByApplyingConfiguration:v7];
  [(UIImageView *)self->_deviceImageView setSymbolConfiguration:v8];
}

- (MRUActivityAccessoryView)leadingView
{
  return self->_leadingView;
}

- (MRUActivityAccessoryView)trailingView
{
  return self->_trailingView;
}

- (UIButton)button
{
  return self->_button;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)state
{
  return self->_state;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (BSUIEmojiLabelView)deviceNameView
{
  return self->_deviceNameView;
}

- (void)setDeviceNameView:(id)a3
{
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_deviceNameView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);

  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end