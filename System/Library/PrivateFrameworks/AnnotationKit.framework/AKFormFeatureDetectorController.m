@interface AKFormFeatureDetectorController
- (AKController)controller;
- (AKFormFeatureDetectorController)initWithController:(id)a3;
- (BOOL)detectFormFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4;
- (BOOL)formFeature:(id)a3 intersectsAnnotationsOnPage:(id)a4;
- (BOOL)wantsDefaultFeatures;
- (CGSize)defaultFeatureSizeForPage:(id)a3;
- (double)maximumFeatureWidthForPage:(id)a3;
- (id)_convertFont:(id)a3 toSize:(double)a4;
- (id)formFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4;
- (void)createAnnotationWithFeature:(id)a3 onPageController:(id)a4;
- (void)setController:(id)a3;
@end

@implementation AKFormFeatureDetectorController

- (AKFormFeatureDetectorController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKFormFeatureDetectorController;
  v5 = [(AKFormFeatureDetectorController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKFormFeatureDetectorController *)v5 setController:v4];
  }

  return v6;
}

- (BOOL)detectFormFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(AKFormFeatureDetectorController *)self controller];
  v9 = [v8 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v9, "shouldPlaceFormElementAtPoint:onOverlayAtPageIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v8, x, y))
  {
    v10 = -[AKFormFeatureDetectorController formFeatureAtPoint:inPageController:](self, "formFeatureAtPoint:inPageController:", v7, x, y);
    if (objc_opt_respondsToSelector())
    {
      [v10 rect];
      char v15 = objc_msgSend(v9, "shouldPlaceProposedFormElementAtRect:onOverlayAtPageIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v8, v11, v12, v13, v14);
    }
    else
    {
      char v15 = 1;
    }
    v17 = [v8 formDetectionController];
    char v18 = [v17 formFeature:v10 intersectsAnnotationsOnPage:v7];

    BOOL v16 = (v10 != 0) & ~v18 & v15;
    if (v16)
    {
      v19 = [v8 formDetectionController];
      [v19 createAnnotationWithFeature:v10 onPageController:v7];
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)formFeatureAtPoint:(CGPoint)a3 inPageController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [[AKFormFeatureDetector alloc] initWithDelegate:self];
  objc_msgSend(v7, "convertPointFromOverlayToModel:", x, y);
  v9 = -[AKFormFeatureDetector featureAtPoint:onPage:mode:](v8, "featureAtPoint:onPage:mode:", v7, 1);

  AKLog(@"Detected feature: %@");

  return v9;
}

- (void)createAnnotationWithFeature:(id)a3 onPageController:(id)a4
{
  id v45 = a3;
  id v6 = a4;
  id v7 = [(AKFormFeatureDetectorController *)self controller];
  objc_super v8 = [v7 toolController];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v45 rect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = objc_opt_new();
    [v17 setFillColor:0];
    [v17 setStrokeColor:0];
    [v17 setStrokeWidth:0.0];
    [v17 setBrushStyle:0];
    [v17 setDashed:0];
    [v17 setHasShadow:0];
    objc_msgSend(v17, "setRectangle:", v10, v12, v14, v16);
    [v17 setTextIsFixedWidth:0];
    char v18 = [v7 attributeController];
    v19 = [v18 textAttributes];
    v20 = (void *)[v19 mutableCopy];

    v21 = [v7 attributeController];
    v22 = [v21 font];

    if (v22)
    {
      [v22 pointSize];
      double v24 = v23;
      [v22 descender];
      CGFloat v26 = v24 - v25;
      v47.origin.double x = v10;
      v47.origin.double y = v12;
      v47.size.width = v14;
      v47.size.height = v16;
      if (v26 > CGRectGetHeight(v47))
      {
        v48.origin.double x = v10;
        v48.origin.double y = v12;
        v48.size.width = v14;
        v48.size.height = v16;
        uint64_t v27 = [(AKFormFeatureDetectorController *)self _convertFont:v22 toSize:CGRectGetHeight(v48)];

        [v20 setObject:v27 forKeyedSubscript:*MEMORY[0x263F1C238]];
        v22 = (void *)v27;
      }
    }
    uint64_t v28 = *MEMORY[0x263F1C268];
    v29 = [v20 objectForKeyedSubscript:*MEMORY[0x263F1C268]];
    v30 = (void *)[v29 mutableCopy];

    if (!v30)
    {
      v31 = [MEMORY[0x263F1C358] defaultParagraphStyle];
      v30 = (void *)[v31 mutableCopy];
    }
    [v30 setAlignment:0];
    [v20 setObject:v30 forKeyedSubscript:v28];
    [v17 setTypingAttributes:v20];

    if (v17)
    {
LABEL_9:
      [v8 addNewAnnotation:v17 onPageController:v6 shouldSelect:1 shouldCascade:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [v7 modelController];
        [v32 deselectAllAnnotations];
      }
      if ([v17 conformsToAKTextAnnotationProtocol])
      {
        v33 = [v7 textEditorController];
        [v33 beginEditingAnnotation:v17 withPageController:v6 selectAllText:1];
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
      v17 = 0;
      goto LABEL_17;
    }
    [v45 rect];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v17 = objc_opt_new();
    v42 = [MEMORY[0x263F1C6B0] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    [v17 setImage:v42];

    objc_msgSend(v17, "setRectangle:", v35, v37, v39, v41);
    if (v17) {
      goto LABEL_9;
    }
  }
LABEL_17:
  [v45 rect];
  v43 = j__NSStringFromCGRect(v49);
  [v17 drawingBounds];
  v44 = j__NSStringFromCGRect(v50);
  AKLog(@"Placed detected feature\n%@ has annotation drawing bounds - rect:%@, drawingBounds:%@");
}

- (BOOL)formFeature:(id)a3 intersectsAnnotationsOnPage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  [v5 rect];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  double v15 = [v6 pageModelController];
  double v16 = [v15 annotations];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2376C3724;
  v18[3] = &unk_264CDBC00;
  v18[5] = v8;
  v18[6] = v10;
  v18[7] = v12;
  v18[8] = v14;
  v18[4] = &v19;
  [v16 enumerateObjectsUsingBlock:v18];
  LOBYTE(v15) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v15;
}

- (id)_convertFont:(id)a3 toSize:(double)a4
{
  id v5 = a3;
  [v5 pointSize];
  double v7 = v6;
  [v5 descender];
  double v9 = v7 - v8;
  if (v9 > a4)
  {
    [v5 pointSize];
    if (a4 != 1.0)
    {
      uint64_t v11 = [v5 fontWithSize:v10 * a4 / v9];

      id v5 = (id)v11;
    }
  }

  return v5;
}

- (BOOL)wantsDefaultFeatures
{
  return 1;
}

- (CGSize)defaultFeatureSizeForPage:(id)a3
{
  id v4 = a3;
  id v5 = [(AKFormFeatureDetectorController *)self controller];
  double v6 = [v5 attributeController];
  double v7 = [v6 font];
  [v7 pointSize];
  double v9 = v8;
  [v7 descender];
  CGFloat v11 = v9 - v10;
  uint64_t v12 = [v4 overlayView];

  [v12 frame];
  CGFloat v13 = CGRectGetWidth(v19) / 6.0;

  v17.width = v13;
  v17.height = v11;
  double v16 = j__NSStringFromCGSize(v17);
  AKLog(@"%s %@");

  double v14 = v13;
  double v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)maximumFeatureWidthForPage:(id)a3
{
  v3 = [a3 overlayView];
  [v3 frame];
  double v4 = CGRectGetWidth(v6) * 0.5;

  if (v4 > 100.0) {
    double v4 = 100.0;
  }
  AKLog(@"%s %f");
  return v4;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end