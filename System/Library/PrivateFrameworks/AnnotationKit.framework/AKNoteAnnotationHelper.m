@interface AKNoteAnnotationHelper
+ (CGRect)_boundsForClosedPopupAnnotation:(id)a3 havingParent:(id)a4 onPageController:(id)a5;
+ (CGRect)_boundsForOpenPopupAnnotation:(id)a3 withClosedBounds:(CGRect)a4 havingParent:(id)a5 onPageController:(id)a6;
+ (id)newPopupAnnotationWithParent:(id)a3 onPageController:(id)a4;
@end

@implementation AKNoteAnnotationHelper

+ (id)newPopupAnnotationWithParent:(id)a3 onPageController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = self;
  [v8 setVisualStyle:objc_opt_isKindOfClass() & 1];

  v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v8 setVisualStyle:0];
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    v16 = self;
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      [v8 setVisualStyle:1];
      [a1 _boundsForClosedPopupAnnotation:v8 havingParent:v6 onPageController:v7];
      double v12 = v18;
      double v13 = v19;
      double v14 = v20;
      double v15 = v21;
    }
    else
    {
      double v12 = *MEMORY[0x263F001A0];
      double v13 = *(double *)(MEMORY[0x263F001A0] + 8);
      double v14 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
      NSLog(&cfstr_SParentannotat.isa, "+[AKNoteAnnotationHelper newPopupAnnotationWithParent:onPageController:]");
    }
  }
  objc_msgSend(v8, "setRectangle:", v12, v13, v14, v15);
  objc_msgSend(a1, "_boundsForOpenPopupAnnotation:withClosedBounds:havingParent:onPageController:", v8, v6, v7, v12, v13, v14, v15);
  objc_msgSend(v8, "setOpenRectangle:");

  return v8;
}

+ (CGRect)_boundsForClosedPopupAnnotation:(id)a3 havingParent:(id)a4 onPageController:(id)a5
{
  id v6 = a5;
  [a4 drawingBounds];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGRectGetMaxX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRectGetMaxY(v25);
  [v6 maxPageRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v14;
  v26.size.CGFloat width = v16;
  v26.size.CGFloat height = v18;
  CGRectInset(v26, 6.0, 6.0);

  MEMORY[0x270F9A6D0](AKGeometryHelper, sel_constrainRect_withinRect_);
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

+ (CGRect)_boundsForOpenPopupAnnotation:(id)a3 withClosedBounds:(CGRect)a4 havingParent:(id)a5 onPageController:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a6;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGRectGetMaxX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRectGetMinY(v25);
  [v10 maxPageRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v14;
  v26.size.CGFloat width = v16;
  v26.size.CGFloat height = v18;
  CGRectInset(v26, 6.0, 6.0);

  MEMORY[0x270F9A6D0](AKGeometryHelper, sel_constrainRect_withinRect_);
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

@end