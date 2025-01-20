@interface SBContinuousExposeModuleCheckboxButton
- (CGRect)_pointerRect;
- (SBContinuousExposeModuleCheckboxButton)initWithSize:(CGSize)a3;
- (double)_cornerRadius;
- (double)_dimension;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation SBContinuousExposeModuleCheckboxButton

- (SBContinuousExposeModuleCheckboxButton)initWithSize:(CGSize)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeModuleCheckboxButton;
  v3 = -[SBContinuousExposeModuleCheckboxButton initWithSize:](&v10, "initWithSize:", a3.width, a3.height);
  if (v3)
  {
    v4 = +[UIImageSymbolConfiguration configurationWithScale:3];
    v5 = +[UIImage systemImageNamed:@"circle" withConfiguration:v4];
    v6 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:v4];
    [(SBContinuousExposeModuleCheckboxButton *)v3 setImage:v5 forState:0];
    [(SBContinuousExposeModuleCheckboxButton *)v3 setImage:v6 forState:4];
    v7 = [(SBContinuousExposeModuleCheckboxButton *)v3 layer];
    [(SBContinuousExposeModuleCheckboxButton *)v3 _cornerRadius];
    objc_msgSend(v7, "setCornerRadius:");

    [(SBContinuousExposeModuleCheckboxButton *)v3 setChangesSelectionAsPrimaryAction:1];
    id v8 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v3];
    [(SBContinuousExposeModuleCheckboxButton *)v3 addInteraction:v8];
  }
  return v3;
}

- (double)_cornerRadius
{
  [(SBContinuousExposeModuleCheckboxButton *)self _dimension];
  return v2 * 0.5;
}

- (double)_dimension
{
  [(SBContinuousExposeModuleCheckboxButton *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(SBContinuousExposeModuleCheckboxButton *)self bounds];
  double result = CGRectGetHeight(v6);
  if (Width < result) {
    return Width;
  }
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  CGRect v6 = +[UIPointerEffect effectWithPreview:v5];
  [(SBContinuousExposeModuleCheckboxButton *)self _pointerRect];
  v7 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, CGRectGetWidth(v11) * 0.5);
  id v8 = +[UIPointerStyle styleWithEffect:v6 shape:v7];

  return v8;
}

- (CGRect)_pointerRect
{
  [(SBContinuousExposeModuleCheckboxButton *)self _dimension];
  double v4 = v3 + -40.0;
  [(SBContinuousExposeModuleCheckboxButton *)self frame];
  double v6 = v4 + v5;
  double v8 = v4 + v7;
  double v10 = v9 - (v4 + v4);
  double v12 = v11 - (v4 + v4);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

@end