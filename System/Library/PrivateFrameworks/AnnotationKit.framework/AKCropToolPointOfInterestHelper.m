@interface AKCropToolPointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKCropToolPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  v6 = (void *)MEMORY[0x263EFFA68];
  *a3 = (id)MEMORY[0x263EFFA68];
  *a4 = v6;
}

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [v10 currentModelToScreenExifOrientation];
  v12 = +[AKCropAnnotationRenderer cropHandle:7 forAnnotation:v9 withPageController:v10];
  PathBoundingBodouble x = CGPathGetPathBoundingBox(v12);
  CGFloat v13 = PathBoundingBox.origin.x;
  CGFloat v14 = PathBoundingBox.origin.y;
  CGFloat width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  CGPathRelease(v12);
  v67.origin.double x = v13;
  v67.origin.double y = v14;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  CGRect v68 = CGRectInset(v67, -5.0, -5.0);
  v58.double x = x;
  v58.double y = y;
  if (!CGRectContainsPoint(v68, v58)
    || (unint64_t v17 = +[AKGeometryHelper draggableArea:3 convertedForExif:v11]) == 0)
  {
    v18 = +[AKCropAnnotationRenderer cropHandle:4 forAnnotation:v9 withPageController:v10];
    CGRect v69 = CGPathGetPathBoundingBox(v18);
    CGFloat v19 = v69.origin.x;
    CGFloat v20 = v69.origin.y;
    CGFloat v21 = v69.size.width;
    CGFloat v22 = v69.size.height;
    CGPathRelease(v18);
    v70.origin.double x = v19;
    v70.origin.double y = v20;
    v70.size.CGFloat width = v21;
    v70.size.CGFloat height = v22;
    CGRect v71 = CGRectInset(v70, -5.0, -5.0);
    v59.double x = x;
    v59.double y = y;
    if (!CGRectContainsPoint(v71, v59)
      || (unint64_t v17 = +[AKGeometryHelper draggableArea:7 convertedForExif:v11]) == 0)
    {
      v23 = +[AKCropAnnotationRenderer cropHandle:5 forAnnotation:v9 withPageController:v10];
      CGRect v72 = CGPathGetPathBoundingBox(v23);
      CGFloat v24 = v72.origin.x;
      CGFloat v25 = v72.origin.y;
      CGFloat v26 = v72.size.width;
      CGFloat v27 = v72.size.height;
      CGPathRelease(v23);
      v73.origin.double x = v24;
      v73.origin.double y = v25;
      v73.size.CGFloat width = v26;
      v73.size.CGFloat height = v27;
      CGRect v74 = CGRectInset(v73, -5.0, -5.0);
      v60.double x = x;
      v60.double y = y;
      if (!CGRectContainsPoint(v74, v60)
        || (unint64_t v17 = +[AKGeometryHelper draggableArea:5 convertedForExif:v11]) == 0)
      {
        v28 = +[AKCropAnnotationRenderer cropHandle:6 forAnnotation:v9 withPageController:v10];
        CGRect v75 = CGPathGetPathBoundingBox(v28);
        CGFloat v29 = v75.origin.x;
        CGFloat v30 = v75.origin.y;
        CGFloat v31 = v75.size.width;
        CGFloat v32 = v75.size.height;
        CGPathRelease(v28);
        v76.origin.double x = v29;
        v76.origin.double y = v30;
        v76.size.CGFloat width = v31;
        v76.size.CGFloat height = v32;
        CGRect v77 = CGRectInset(v76, -5.0, -5.0);
        v61.double x = x;
        v61.double y = y;
        if (!CGRectContainsPoint(v77, v61)
          || (unint64_t v17 = +[AKGeometryHelper draggableArea:1 convertedForExif:v11]) == 0)
        {
          v33 = +[AKCropAnnotationRenderer cropHandle:1 forAnnotation:v9 withPageController:v10];
          if (!v33) {
            goto LABEL_27;
          }
          v34 = v33;
          CGRect v78 = CGPathGetPathBoundingBox(v33);
          CGFloat v35 = v78.origin.x;
          CGFloat v36 = v78.origin.y;
          CGFloat v37 = v78.size.width;
          CGFloat v38 = v78.size.height;
          CGPathRelease(v34);
          v79.origin.double x = v35;
          v79.origin.double y = v36;
          v79.size.CGFloat width = v37;
          v79.size.CGFloat height = v38;
          CGRect v80 = CGRectInset(v79, -5.0, -5.0);
          v62.double x = x;
          v62.double y = y;
          if (!CGRectContainsPoint(v80, v62)
            || (unint64_t v17 = +[AKGeometryHelper draggableArea:4 convertedForExif:v11]) == 0)
          {
LABEL_27:
            v39 = +[AKCropAnnotationRenderer cropHandle:3 forAnnotation:v9 withPageController:v10];
            if (!v39) {
              goto LABEL_28;
            }
            v40 = v39;
            CGRect v81 = CGPathGetPathBoundingBox(v39);
            CGFloat v41 = v81.origin.x;
            CGFloat v42 = v81.origin.y;
            CGFloat v43 = v81.size.width;
            CGFloat v44 = v81.size.height;
            CGPathRelease(v40);
            v82.origin.double x = v41;
            v82.origin.double y = v42;
            v82.size.CGFloat width = v43;
            v82.size.CGFloat height = v44;
            CGRect v83 = CGRectInset(v82, -5.0, -5.0);
            v63.double x = x;
            v63.double y = y;
            if (!CGRectContainsPoint(v83, v63)
              || (unint64_t v17 = +[AKGeometryHelper draggableArea:2 convertedForExif:v11]) == 0)
            {
LABEL_28:
              v45 = +[AKCropAnnotationRenderer cropHandle:0 forAnnotation:v9 withPageController:v10];
              if (!v45) {
                goto LABEL_18;
              }
              v46 = v45;
              CGRect v84 = CGPathGetPathBoundingBox(v45);
              CGFloat v47 = v84.origin.x;
              CGFloat v48 = v84.origin.y;
              CGFloat v49 = v84.size.width;
              CGFloat v50 = v84.size.height;
              CGPathRelease(v46);
              v85.origin.double x = v47;
              v85.origin.double y = v48;
              v85.size.CGFloat width = v49;
              v85.size.CGFloat height = v50;
              CGRect v86 = CGRectInset(v85, -5.0, -5.0);
              v64.double x = x;
              v64.double y = y;
              if (!CGRectContainsPoint(v86, v64)
                || (unint64_t v17 = +[AKGeometryHelper draggableArea:8 convertedForExif:v11]) == 0)
              {
LABEL_18:
                v51 = +[AKCropAnnotationRenderer cropHandle:2 forAnnotation:v9 withPageController:v10];
                if (!v51) {
                  goto LABEL_29;
                }
                v52 = v51;
                CGRect v87 = CGPathGetPathBoundingBox(v51);
                CGFloat v53 = v87.origin.x;
                CGFloat v54 = v87.origin.y;
                CGFloat v55 = v87.size.width;
                CGFloat v56 = v87.size.height;
                CGPathRelease(v52);
                v88.origin.double x = v53;
                v88.origin.double y = v54;
                v88.size.CGFloat width = v55;
                v88.size.CGFloat height = v56;
                CGRect v89 = CGRectInset(v88, -5.0, -5.0);
                v65.double x = x;
                v65.double y = y;
                if (!CGRectContainsPoint(v89, v65)
                  || (unint64_t v17 = +[AKGeometryHelper draggableArea:6 convertedForExif:v11]) == 0)
                {
LABEL_29:
                  if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v9, x, y))
                  {
                    unint64_t v17 = 20;
                  }
                  else
                  {
                    unint64_t v17 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v17;
}

@end