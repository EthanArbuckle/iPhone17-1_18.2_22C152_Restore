@interface SFPrivacyReportIconView
+ (Class)layerClass;
- (CGSize)intrinsicContentSize;
- (SFPrivacyReportIconView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateColors;
- (void)_updateSymbolConfiguration;
@end

@implementation SFPrivacyReportIconView

- (SFPrivacyReportIconView)initWithFrame:(CGRect)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SFPrivacyReportIconView;
  v3 = -[SFPrivacyReportIconView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.fill"];
    uint64_t v6 = [v4 initWithImage:v5];
    mask = v3->_mask;
    v3->_mask = (UIImageView *)v6;

    [(SFPrivacyReportIconView *)v3 bounds];
    -[UIImageView setFrame:](v3->_mask, "setFrame:");
    [(UIImageView *)v3->_mask setAutoresizingMask:18];
    [(SFPrivacyReportIconView *)v3 setMaskView:v3->_mask];
    v8 = [(SFPrivacyReportIconView *)v3 gradientLayer];
    objc_msgSend(v8, "setStartPoint:", 1.0, 0.0);

    v9 = [(SFPrivacyReportIconView *)v3 gradientLayer];
    objc_msgSend(v9, "setEndPoint:", 0.0, 1.0);

    [(SFPrivacyReportIconView *)v3 _updateColors];
    [(SFPrivacyReportIconView *)v3 _updateSymbolConfiguration];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v11 = (id)[(SFPrivacyReportIconView *)v3 registerForTraitChanges:v10 withTarget:v3 action:sel__updateSymbolConfiguration];

    v12 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportIconView;
  [(SFPrivacyReportIconView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SFPrivacyReportIconView *)self _updateColors];
}

- (void)_updateColors
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1618] systemTealColor];
  v7[0] = [v3 CGColor];
  id v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
  v7[1] = [v4 CGColor];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v6 = [(SFPrivacyReportIconView *)self gradientLayer];
  [v6 setColors:v5];
}

- (void)_updateSymbolConfiguration
{
  id v7 = [(SFPrivacyReportIconView *)self traitCollection];
  if ([v7 horizontalSizeClass] == 2 && objc_msgSend(v7, "verticalSizeClass") == 2) {
    double v3 = 50.0;
  }
  else {
    double v3 = 34.0;
  }
  id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:v3];
  v5 = [(UIImageView *)self->_mask preferredSymbolConfiguration];
  char v6 = [v4 isEqualToConfiguration:v5];

  if ((v6 & 1) == 0)
  {
    [(UIImageView *)self->_mask setPreferredSymbolConfiguration:v4];
    [(SFPrivacyReportIconView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_mask intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end