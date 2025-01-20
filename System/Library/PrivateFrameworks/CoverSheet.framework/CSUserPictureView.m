@interface CSUserPictureView
+ (id)_monogrammerForLegibilitySettings:(id)a3 diameter:(double)a4;
- (CNContact)contact;
- (CSUserPictureView)initWithFrame:(CGRect)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)diameter;
- (double)strength;
- (id)presentationRegions;
- (void)_regenerateImage;
- (void)layoutSubviews;
- (void)setContact:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation CSUserPictureView

- (CSUserPictureView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSUserPictureView;
  v3 = -[CSUserPictureView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_diameter = 256.0;
    v5 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
    [(CSUserPictureView *)v4 setLegibilitySettings:v5];
  }
  return v4;
}

- (void)setContact:(id)a3
{
  v4 = (CNContact *)[a3 copy];
  contact = self->_contact;
  self->_contact = v4;

  [(CSUserPictureView *)self _regenerateImage];
}

- (void)layoutSubviews
{
  [(CSUserPictureView *)self bounds];
  -[_UILegibilityView sizeThatFits:](self->_monogramLegibilityView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  UIRectCenteredIntegralRectScale();
  CGRect v6 = CGRectOffset(v5, 0.0, -20.0);
  -[_UILegibilityView setFrame:](self->_monogramLegibilityView, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 0);
  [(_UILegibilityView *)self->_monogramLegibilityView setIsAccessibilityElement:1];
  monogramLegibilityView = self->_monogramLegibilityView;

  [(_UILegibilityView *)monogramLegibilityView setAccessibilityIdentifier:@"user-picture-icon"];
}

- (id)presentationRegions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = +[CSRegion regionForCoordinateSpace:self->_monogramLegibilityView];
  v3 = [v2 role:2];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v8 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    CGRect v6 = [MEMORY[0x1E4FA5F38] rootSettings];
    objc_msgSend(v6, "userPictureStrengthForStyle:", -[_UILegibilitySettings style](*p_legibilitySettings, "style"));
    self->_legibilityStrength = v7;

    [(CSUserPictureView *)self _regenerateImage];
  }
}

+ (id)_monogrammerForLegibilitySettings:(id)a3 diameter:(double)a4
{
  if ((unint64_t)[a3 style] >= 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  CGRect v6 = (void *)[objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:v5 diameter:a4];

  return v6;
}

- (void)_regenerateImage
{
  if (self->_contact)
  {
    v3 = objc_opt_class();
    v4 = [(CSUserPictureView *)self legibilitySettings];
    id v9 = [v3 _monogrammerForLegibilitySettings:v4 diameter:self->_diameter];

    monogramLegibilityView = self->_monogramLegibilityView;
    if (!monogramLegibilityView)
    {
      CGRect v6 = (_UILegibilityView *)[objc_alloc(MEMORY[0x1E4F43238]) initWithSettings:self->_legibilitySettings strength:0 image:self->_legibilityStrength];
      double v7 = self->_monogramLegibilityView;
      self->_monogramLegibilityView = v6;

      [(CSUserPictureView *)self addSubview:self->_monogramLegibilityView];
      monogramLegibilityView = self->_monogramLegibilityView;
    }
    id v8 = [v9 monogramForContact:self->_contact];
    [(_UILegibilityView *)monogramLegibilityView setImage:v8 shadowImage:0];
  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_legibilityStrength;
}

- (void)setStrength:(double)a3
{
  self->_legibilityStrength = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_monogramLegibilityView, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end