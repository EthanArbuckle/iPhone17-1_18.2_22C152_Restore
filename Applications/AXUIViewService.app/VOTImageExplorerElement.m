@interface VOTImageExplorerElement
- (AXMVisionFeature)feature;
- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions;
- (BOOL)flippedYAxis;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (VOTImageExplorerElement)initWithImageView:(id)a3 forFeature:(id)a4 hasFlippedYAxis:(BOOL)a5;
- (id)_accessibilityScrollStatus;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)setFlippedYAxis:(BOOL)a3;
@end

@implementation VOTImageExplorerElement

- (VOTImageExplorerElement)initWithImageView:(id)a3 forFeature:(id)a4 hasFlippedYAxis:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VOTImageExplorerElement;
  v10 = [(VOTImageExplorerElement *)&v13 initWithAccessibilityContainer:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_feature, a4);
    [(VOTImageExplorerElement *)v11 setFlippedYAxis:v5];
  }

  return v11;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v3 = [(VOTImageExplorerElement *)self accessibilityContainer];
  v4 = [(VOTImageExplorerElement *)self feature];
  [v4 normalizedFrame];
  [v3 frame];
  [(VOTImageExplorerElement *)self flippedYAxis];

  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_accessibilityScrollStatus
{
  v3 = [(VOTImageExplorerElement *)self feature];
  v4 = +[AXMVisionFeature localizedStringForLocation:isSubjectImplicit:](AXMVisionFeature, "localizedStringForLocation:isSubjectImplicit:", [v3 locationUsingThirds:0 withFlippedYAxis:[self flippedYAxis]], 1);

  return v4;
}

- (AXMVisionFeature)feature
{
  return self->_feature;
}

- (BOOL)flippedYAxis
{
  return self->_flippedYAxis;
}

- (void)setFlippedYAxis:(BOOL)a3
{
  self->_flippedYAxis = a3;
}

- (void).cxx_destruct
{
}

@end