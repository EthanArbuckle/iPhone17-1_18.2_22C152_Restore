@interface AKAlignmentGuideController
- (AKAlignmentGuideController)initWithPageController:(id)a3;
- (AKPageController)pageController;
- (BOOL)exifHasFlippedAxes;
- (CGPoint)guideAlignedPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5;
- (double)screenToModelScaleFactor;
- (void)dealloc;
- (void)setExifHasFlippedAxes:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)setScreenToModelScaleFactor:(double)a3;
@end

@implementation AKAlignmentGuideController

- (AKAlignmentGuideController)initWithPageController:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)AKAlignmentGuideController;
  v5 = [(AKAlignmentGuideController *)&v64 init];
  v6 = v5;
  if (v5)
  {
    [(AKAlignmentGuideController *)v5 setPageController:v4];
    -[AKAlignmentGuideController setExifHasFlippedAxes:](v6, "setExifHasFlippedAxes:", +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v4 currentModelToScreenExifOrientation]));
    [v4 currentModelToScreenScaleFactor];
    [(AKAlignmentGuideController *)v6 setScreenToModelScaleFactor:1.0 / v7];
    v8 = [v4 pageModelController];
    v9 = [v8 selectedAnnotations];

    v10 = (void *)MEMORY[0x263EFF9C0];
    v11 = [v4 pageModelController];
    v12 = [v11 annotations];
    v13 = [v10 setWithArray:v12];

    [v13 minusSet:v9];
    unint64_t v14 = [v13 count];
    v6->_otherAnnotationCentersCount = 0;
    if (v14 >> 60)
    {
      if (!v6->_otherAnnotationCenters) {
        goto LABEL_35;
      }
    }
    else
    {
      v15 = (CGPoint *)malloc_type_malloc(16 * v14, 0x58034F82uLL);
      v6->_otherAnnotationCenters = v15;
      if (!v15)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    CGFloat x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v61 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ([v25 conformsToAKRectangularAnnotationProtocol]) {
            [v25 rectangle];
          }
          else {
            [v25 drawingBounds];
          }
          CGFloat v30 = v26;
          CGFloat v31 = v27;
          CGFloat v32 = v28;
          CGFloat v33 = v29;
          if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
          {
            v68.origin.CGFloat x = x;
            v68.origin.CGFloat y = y;
            v68.size.CGFloat width = width;
            v68.size.CGFloat height = height;
            v75.origin.CGFloat x = v30;
            v75.origin.CGFloat y = v31;
            v75.size.CGFloat width = v32;
            v75.size.CGFloat height = v33;
            CGRect v69 = CGRectUnion(v68, v75);
            CGFloat x = v69.origin.x;
            CGFloat y = v69.origin.y;
            CGFloat width = v69.size.width;
            CGFloat height = v69.size.height;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v22);
    }

    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    if (CGRectIsNull(v70))
    {
      v6->_initialDraggedAnnotationsCombinedCenter = (CGPoint)*MEMORY[0x263F00148];
    }
    else
    {
      v54 = v9;
      id v55 = v4;
      v71.origin.CGFloat x = x;
      v71.origin.CGFloat y = y;
      v71.size.CGFloat width = width;
      v71.size.CGFloat height = height;
      CGFloat MidX = CGRectGetMidX(v71);
      v72.origin.CGFloat x = x;
      v72.origin.CGFloat y = y;
      v72.size.CGFloat width = width;
      v72.size.CGFloat height = height;
      CGFloat MidY = CGRectGetMidY(v72);
      v6->_initialDraggedAnnotationsCombinedCenter.CGFloat x = MidX;
      v6->_initialDraggedAnnotationsCombinedCenter.CGFloat y = MidY;
      p_CGFloat x = &v6->_otherAnnotationCenters->x;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v37 = v13;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v57 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if ([v42 conformsToAKRectangularAnnotationProtocol]) {
                  [v42 rectangle];
                }
                else {
                  [v42 drawingBounds];
                }
                CGFloat v47 = v43;
                CGFloat v48 = v44;
                CGFloat v49 = v45;
                CGFloat v50 = v46;
                if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
                {
                  v73.origin.CGFloat x = v47;
                  v73.origin.CGFloat y = v48;
                  v73.size.CGFloat width = v49;
                  v73.size.CGFloat height = v50;
                  CGFloat v51 = CGRectGetMidX(v73);
                  v74.origin.CGFloat x = v47;
                  v74.origin.CGFloat y = v48;
                  v74.size.CGFloat width = v49;
                  v74.size.CGFloat height = v50;
                  CGFloat v52 = CGRectGetMidY(v74);
                  *p_CGFloat x = v51;
                  p_x[1] = v52;
                  p_x += 2;
                  ++v6->_otherAnnotationCentersCount;
                }
              }
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v39);
      }

      v9 = v54;
      id v4 = v55;
    }
    goto LABEL_35;
  }
LABEL_36:

  return v6;
}

- (void)dealloc
{
  v3 = [(AKAlignmentGuideController *)self pageController];
  id v4 = [v3 layerPresentationManager];
  [v4 setAlignmentGuidePositionX:1.79769313e308];
  [v4 setAlignmentGuidePositionY:1.79769313e308];
  free(self->_otherAnnotationCenters);

  v5.receiver = self;
  v5.super_class = (Class)AKAlignmentGuideController;
  [(AKAlignmentGuideController *)&v5 dealloc];
}

- (CGPoint)guideAlignedPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = [(AKAlignmentGuideController *)self pageController];
  v8 = [v7 controller];
  v9 = [v8 mainEventHandler];
  v10 = [v7 layerPresentationManager];
  [v9 firstDragPoint];
  [v10 setAlignmentGuidePositionX:1.79769313e308];
  [v10 setAlignmentGuidePositionY:1.79769313e308];

  double v11 = x;
  double v12 = y;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (BOOL)exifHasFlippedAxes
{
  return self->_exifHasFlippedAxes;
}

- (void)setExifHasFlippedAxes:(BOOL)a3
{
  self->_exifHasFlippedAxes = a3;
}

- (double)screenToModelScaleFactor
{
  return self->_screenToModelScaleFactor;
}

- (void)setScreenToModelScaleFactor:(double)a3
{
  self->_screenToModelScaleFactor = a3;
}

- (void).cxx_destruct
{
}

@end