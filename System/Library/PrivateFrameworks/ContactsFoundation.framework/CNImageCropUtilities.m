@interface CNImageCropUtilities
+ (BOOL)cropRect:(CGRect)a3 fitsWithinSize:(CGSize)a4;
+ (CGRect)centeredSquareCropRectInRect:(CGRect)a3;
+ (CGRect)intersectingSquareCropRect:(CGRect)a3 forRect:(CGRect)a4;
+ (CGRect)scaledCropRect:(CGRect)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5;
+ (CGRect)squareCropRect:(CGRect)a3 toFitSize:(CGSize)a4;
@end

@implementation CNImageCropUtilities

+ (CGRect)centeredSquareCropRectInRect:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  BOOL v4 = height == a3.size.width;
  double v5 = a3.origin.x + (a3.size.width - height) * 0.5;
  double v6 = a3.origin.y + (a3.size.height - height) * 0.5;
  if (v4) {
    double y = v6;
  }
  else {
    double y = a3.origin.y;
  }
  if (v4) {
    double x = a3.origin.x;
  }
  else {
    double x = v5;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v9 = (void (*)(double, double, double, double))getCGRectIntegralSymbolLoc_ptr;
  v21 = getCGRectIntegralSymbolLoc_ptr;
  if (!getCGRectIntegralSymbolLoc_ptr)
  {
    v10 = (void *)CoreGraphicsLibrary();
    v19[3] = (uint64_t)dlsym(v10, "CGRectIntegral");
    getCGRectIntegralSymbolLoc_ptr = (_UNKNOWN *)v19[3];
    v9 = (void (*)(double, double, double, double))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
  {
    +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    v17 = v16;
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v17);
  }
  v9(x, y, height, height);
  if (v13 >= v14) {
    double v13 = v14;
  }
  double v15 = v13;
  result.size.double height = v15;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

+ (CGRect)squareCropRect:(CGRect)a3 toFitSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = 0.0;
  if (a4.width == 0.0 && a4.height == 0.0 || a4.width == 0.0)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    goto LABEL_16;
  }
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  if (a4.height != 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "intersectingSquareCropRect:forRect:", x, y, v7, v6, 0.0, 0.0, a4.width, a4.height);
    double v15 = v14;
    double v26 = v16;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    v17 = (double (*)(double, double, double, double))getCGRectGetMidXSymbolLoc_ptr;
    v30 = getCGRectGetMidXSymbolLoc_ptr;
    if (!getCGRectGetMidXSymbolLoc_ptr)
    {
      uint64_t v18 = (void *)CoreGraphicsLibrary();
      v28[3] = (uint64_t)dlsym(v18, "CGRectGetMidX");
      getCGRectGetMidXSymbolLoc_ptr = (_UNKNOWN *)v28[3];
      v17 = (double (*)(double, double, double, double))v28[3];
    }
    _Block_object_dispose(&v27, 8);
    if (v17)
    {
      double v25 = v15;
      double v19 = v17(x, y, v7, v6);
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v20 = (double (*)(double, double, double, double))getCGRectGetMidYSymbolLoc_ptr;
      v30 = getCGRectGetMidYSymbolLoc_ptr;
      if (!getCGRectGetMidYSymbolLoc_ptr)
      {
        v21 = (void *)CoreGraphicsLibrary();
        v28[3] = (uint64_t)dlsym(v21, "CGRectGetMidY");
        getCGRectGetMidYSymbolLoc_ptr = (_UNKNOWN *)v28[3];
        uint64_t v20 = (double (*)(double, double, double, double))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (v20)
      {
        double v22 = v20(x, y, v7, v6);
        objc_msgSend((id)objc_opt_class(), "intersectingSquareCropRect:forRect:", v19 - v25 * 0.5, v22 - v26 * 0.5, v25, v26, 0.0, 0.0, width, height);
        goto LABEL_16;
      }
    }
    else
    {
      +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    }
    +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    v24 = v23;
    _Block_object_dispose(&v27, 8);
    _Unwind_Resume(v24);
  }
LABEL_16:
  result.size.double height = v10;
  result.size.double width = v11;
  result.origin.double y = v12;
  result.origin.double x = v13;
  return result;
}

+ (CGRect)scaledCropRect:(CGRect)a3 fromSize:(CGSize)a4 toSize:(CGSize)a5
{
  double x = a3.origin.x;
  double v6 = 0.0;
  if (a4.width == 0.0 && a4.height == 0.0)
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  else if (a5.width != 0.0 || (double v7 = 0.0, v8 = 0.0, v9 = 0.0, a5.height != 0.0))
  {
    CGFloat v10 = a5.width / a4.width;
    CGFloat v11 = a5.height / a4.height;
    double v6 = x * v10;
    double v7 = a3.origin.y * v11;
    double v8 = rint(a3.size.width * v10);
    double v9 = rint(a3.size.height * v11);
  }
  double v12 = v7;
  double v13 = v8;
  double v14 = v9;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v6;
  return result;
}

+ (CGRect)intersectingSquareCropRect:(CGRect)a3 forRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v29 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  CGFloat v11 = (double (*)(double, double, double, double, double, double, double, double))getCGRectIntersectionSymbolLoc_ptr;
  v33 = getCGRectIntersectionSymbolLoc_ptr;
  if (!getCGRectIntersectionSymbolLoc_ptr)
  {
    double v12 = (void *)CoreGraphicsLibrary();
    v31[3] = (uint64_t)dlsym(v12, "CGRectIntersection");
    getCGRectIntersectionSymbolLoc_ptr = (_UNKNOWN *)v31[3];
    CGFloat v11 = (double (*)(double, double, double, double, double, double, double, double))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v11)
  {
    +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    goto LABEL_18;
  }
  double v13 = v11(v10, v9, v8, v29, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v20 = (uint64_t (*)(double, double, double, double, double, double, double, double))getCGRectEqualToRectSymbolLoc_ptr;
  v33 = getCGRectEqualToRectSymbolLoc_ptr;
  if (!getCGRectEqualToRectSymbolLoc_ptr)
  {
    v21 = (void *)CoreGraphicsLibrary();
    v31[3] = (uint64_t)dlsym(v21, "CGRectEqualToRect");
    getCGRectEqualToRectSymbolLoc_ptr = (_UNKNOWN *)v31[3];
    uint64_t v20 = (uint64_t (*)(double, double, double, double, double, double, double, double))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v20)
  {
LABEL_18:
    +[CNImageCropUtilities centeredSquareCropRectInRect:]();
    v28 = v27;
    _Block_object_dispose(&v30, 8);
    _Unwind_Resume(v28);
  }
  int v22 = v20(v13, v15, v17, v19, v10, v9, v8, v29);
  if (v17 >= v19) {
    double v23 = v19;
  }
  else {
    double v23 = v17;
  }
  if (v22) {
    double v24 = v9;
  }
  else {
    double v24 = v15;
  }
  if (v22) {
    double v25 = v10;
  }
  else {
    double v25 = v13;
  }
  double v26 = v23;
  result.size.double height = v26;
  result.size.double width = v23;
  result.origin.double y = v24;
  result.origin.double x = v25;
  return result;
}

+ (BOOL)cropRect:(CGRect)a3 fitsWithinSize:(CGSize)a4
{
  return a3.origin.y + a3.size.height <= a4.height && a3.origin.x + a3.size.width <= a4.width;
}

+ (void)centeredSquareCropRectInRect:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  +[CNAuditTokenUtilities bundleIdentifierForAuditToken:](v0, v1);
}

@end