@interface VOTImageExplorerFaceElement
- (AXMVisionFeature)peopleFeature;
- (CGRect)accessibilityFrame;
- (VOTImageExplorerFaceElement)initWithImageView:(id)a3 forFaceFeature:(id)a4 withOverlappingPeopleFeature:(id)a5 hasFlippedYAxis:(BOOL)a6;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation VOTImageExplorerFaceElement

- (VOTImageExplorerFaceElement)initWithImageView:(id)a3 forFaceFeature:(id)a4 withOverlappingPeopleFeature:(id)a5 hasFlippedYAxis:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (AXMVisionFeature *)a5;
  v14.receiver = self;
  v14.super_class = (Class)VOTImageExplorerFaceElement;
  v11 = [(VOTImageExplorerElement *)&v14 initWithImageView:a3 forFeature:a4 hasFlippedYAxis:v6];
  peopleFeature = v11->_peopleFeature;
  v11->_peopleFeature = v10;

  return v11;
}

- (id)accessibilityLabel
{
  v3 = [(VOTImageExplorerElement *)self feature];
  v4 = [v3 faceDetectionResult];
  v5 = [v4 name];

  BOOL v6 = [(VOTImageExplorerElement *)self feature];
  v7 = [v6 faceDetectionResult];
  v8 = [v7 attributes];

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v9 = [(VOTImageExplorerElement *)self feature];
    v10 = [v9 mediaAnalysisFaceDetectionResult];
    uint64_t v11 = [v10 name];

    v12 = [(VOTImageExplorerElement *)self feature];
    v13 = [v12 mediaAnalysisFaceDetectionResult];
    uint64_t v14 = [v13 attributes];

    v5 = (void *)v11;
    v8 = (void *)v14;
  }
  [v8 setExcludeOptions:[AXMVisionFeatureFaceAttributes defaultExcludeOptions]];
  v17 = [v8 accessibilityLabelForAttributes];
  v15 = __UIAXStringForVariables();

  return v15;
}

- (id)accessibilityValue
{
  v3 = [(VOTImageExplorerElement *)self feature];
  v4 = +[AXMVisionFeature localizedStringForLocation:isSubjectImplicit:](AXMVisionFeature, "localizedStringForLocation:isSubjectImplicit:", [v3 locationUsingThirds:0 withFlippedYAxis:[self flippedYAxis]], 1);

  return v4;
}

- (id)accessibilityIdentifier
{
  return @"VOTImageExplorerFaceElement";
}

- (CGRect)accessibilityFrame
{
  v3 = [(VOTImageExplorerFaceElement *)self accessibilityContainer];
  v4 = [(VOTImageExplorerElement *)self feature];
  [v4 normalizedFrame];
  [v3 frame];
  [(VOTImageExplorerElement *)self flippedYAxis];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(VOTImageExplorerFaceElement *)self peopleFeature];

  if (v13)
  {
    uint64_t v14 = [(VOTImageExplorerFaceElement *)self peopleFeature];
    [v14 normalizedFrame];
    [v3 frame];
    UIAccessibilityFrameForBounds();
    double v16 = v15;
    double v18 = v17;

    double v12 = v18 - vabdd_f64(v16, v8);
  }

  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (AXMVisionFeature)peopleFeature
{
  return self->_peopleFeature;
}

- (void).cxx_destruct
{
}

@end