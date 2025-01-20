@interface AVPresentationContainerViewAppearanceProxy
- (BOOL)clipsToBounds;
- (NSString)cornerCurve;
- (UIColor)backgroundColor;
- (UIView)actualView;
- (double)cornerRadius;
- (unint64_t)maskedCorners;
- (void)setActualView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setCornerCurve:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
@end

@implementation AVPresentationContainerViewAppearanceProxy

- (void)setActualView:(id)a3
{
  p_actualView = &self->_actualView;
  id v13 = a3;
  objc_storeWeak((id *)p_actualView, v13);
  unint64_t v5 = [(AVPresentationContainerViewAppearanceProxy *)self maskedCorners];
  v6 = [v13 layer];
  [v6 setMaskedCorners:v5];

  v7 = [(AVPresentationContainerViewAppearanceProxy *)self cornerCurve];
  v8 = [v13 layer];
  [v8 setCornerCurve:v7];

  [(AVPresentationContainerViewAppearanceProxy *)self cornerRadius];
  double v10 = v9;
  v11 = [v13 layer];
  [v11 setCornerRadius:v10];

  v12 = [(AVPresentationContainerViewAppearanceProxy *)self backgroundColor];
  [v13 setBackgroundColor:v12];

  objc_msgSend(v13, "setClipsToBounds:", -[AVPresentationContainerViewAppearanceProxy clipsToBounds](self, "clipsToBounds"));
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerCurve:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIView)actualView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actualView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cornerCurve, 0);

  objc_destroyWeak((id *)&self->_actualView);
}

- (void)setClipsToBounds:(BOOL)a3
{
  self->_clipsToBounds = a3;
}

@end