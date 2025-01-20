@interface AVPresentationContainerViewLayer
- (AVPresentationContainerViewAppearanceProxy)appearanceProxy;
- (BOOL)masksToBounds;
- (BOOL)wantsAppearanceConfigValues;
- (double)cornerRadius;
- (id)cornerCurve;
- (unint64_t)maskedCorners;
- (void)setCornerCurve:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setMasksToBounds:(BOOL)a3;
- (void)setWantsAppearanceConfigValues:(BOOL)a3;
@end

@implementation AVPresentationContainerViewLayer

- (AVPresentationContainerViewAppearanceProxy)appearanceProxy
{
  appearanceProxy = self->_appearanceProxy;
  if (!appearanceProxy)
  {
    v4 = objc_alloc_init(AVPresentationContainerViewAppearanceProxy);
    v5 = self->_appearanceProxy;
    self->_appearanceProxy = v4;

    v16.receiver = self;
    v16.super_class = (Class)AVPresentationContainerViewLayer;
    v6 = [(AVPresentationContainerViewLayer *)&v16 cornerCurve];
    v7 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
    [v7 setCornerCurve:v6];

    v15.receiver = self;
    v15.super_class = (Class)AVPresentationContainerViewLayer;
    id v8 = [(AVPresentationContainerViewLayer *)&v15 maskedCorners];
    v9 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
    [v9 setMaskedCorners:v8];

    v14.receiver = self;
    v14.super_class = (Class)AVPresentationContainerViewLayer;
    [(AVPresentationContainerViewLayer *)&v14 cornerRadius];
    double v11 = v10;
    v12 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
    [v12 setCornerRadius:v11];

    appearanceProxy = self->_appearanceProxy;
  }

  return appearanceProxy;
}

- (void).cxx_destruct
{
}

- (BOOL)wantsAppearanceConfigValues
{
  return self->_wantsAppearanceConfigValues;
}

- (void)setCornerRadius:(double)a3
{
  v5 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  [v5 setCornerRadius:a3];

  id v8 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  v6 = [v8 actualView];
  v7 = [v6 layer];
  [v7 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setCornerCurve:(id)a3
{
  id v4 = a3;
  v5 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  [v5 setCornerCurve:v4];

  id v8 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  v6 = [v8 actualView];
  v7 = [v6 layer];
  [v7 setCornerCurve:v4];
}

- (id)cornerCurve
{
  v2 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  double v3 = [v2 cornerCurve];

  return v3;
}

- (void)setMasksToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  [v5 setClipsToBounds:v3];

  id v7 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  v6 = [v7 actualView];
  [v6 setClipsToBounds:v3];
}

- (BOOL)masksToBounds
{
  v2 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  char v3 = [v2 clipsToBounds];

  return v3;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  v5 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  [v5 setMaskedCorners:a3];

  id v8 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  v6 = [v8 actualView];
  id v7 = [v6 layer];
  [v7 setMaskedCorners:a3];
}

- (unint64_t)maskedCorners
{
  v2 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (void)setWantsAppearanceConfigValues:(BOOL)a3
{
  if (self->_wantsAppearanceConfigValues != a3)
  {
    BOOL v3 = a3;
    self->_wantsAppearanceConfigValues = a3;
    v5 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
    v6 = [v5 cornerCurve];
    if (v3)
    {
      v14.receiver = self;
      v14.super_class = (Class)AVPresentationContainerViewLayer;
      [(AVPresentationContainerViewLayer *)&v14 setCornerCurve:v6];

      id v7 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
      v13.receiver = self;
      v13.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setMaskedCorners:](&v13, sel_setMaskedCorners_, [v7 maskedCorners]);

      id v8 = [(AVPresentationContainerViewLayer *)self appearanceProxy];
      [v8 cornerRadius];
      v12.receiver = self;
      v12.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setCornerRadius:](&v12, sel_setCornerRadius_);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)AVPresentationContainerViewLayer;
      [(AVPresentationContainerViewLayer *)&v11 setCornerCurve:v6];

      v10.receiver = self;
      v10.super_class = (Class)AVPresentationContainerViewLayer;
      [(AVPresentationContainerViewLayer *)&v10 setMaskedCorners:0];
      v9.receiver = self;
      v9.super_class = (Class)AVPresentationContainerViewLayer;
      [(AVPresentationContainerViewLayer *)&v9 setCornerRadius:0.0];
    }
  }
}

@end