@interface HNDScreen
+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4;
@end

@implementation HNDScreen

+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v6 window];
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v9;
    double y = v10;
  }
  else
  {
    v21.double x = x;
    v21.double y = y;
    v19 = NSStringFromCGPoint(v21);
    id v20 = v6;
    CFStringRef v18 = @"Tried to convert HNDScreen point %@ to view %@, but it had no window.";
    LOBYTE(v17) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y, v17, v18, v19, v20);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
  }
  else
  {
    id v11 = [v6 window];
  }
  double v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointToSceneReferenceSpace:", v8, v10);
    double v8 = v13;
    double v10 = v14;
  }
  else
  {
    v18.double x = v8;
    v18.double y = v10;
    uint64_t v17 = NSStringFromCGPoint(v18);
    _AXLogWithFacility();
  }
  double v15 = v8;
  double v16 = v10;
  result.double y = v16;
  result.double x = v15;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  double v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
    double x = v11;
    double y = v12;
    double width = v13;
    double height = v14;
  }
  else
  {
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    v29 = NSStringFromCGRect(v31);
    id v30 = v8;
    CFStringRef v28 = @"Tried to convert HNDScreen rect %@ to view %@, but it had no window.";
    LOBYTE(v27) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(v8, "convertRect:fromView:", 0, x, y, width, height, v27, v28, v29, v30);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v8;
  }
  else
  {
    id v17 = [v8 window];
  }
  double v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "_convertRectToSceneReferenceSpace:", v10, v12, v14, v16);
    double v10 = v19;
    double v12 = v20;
    double v14 = v21;
    double v16 = v22;
  }
  else
  {
    v28.origin.double x = v10;
    v28.origin.double y = v12;
    v28.size.double width = v14;
    v28.size.double height = v16;
    uint64_t v27 = NSStringFromCGRect(v28);
    _AXLogWithFacility();
  }
  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v16;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

@end