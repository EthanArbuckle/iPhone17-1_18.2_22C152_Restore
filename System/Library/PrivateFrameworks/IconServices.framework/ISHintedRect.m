@interface ISHintedRect
- (CGRect)hintedRectForSize:(CGSize)a3;
- (CGRect)hintedRectForSize:(CGSize)a3 options:(unint64_t)a4;
- (void)addHintedRect:(CGRect)a3 forSize:(CGSize)a4;
@end

@implementation ISHintedRect

- (void)addHintedRect:(CGRect)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)ISHintedRect;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);
}

- (CGRect)hintedRectForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(ISHintedValue *)self options];
  -[ISHintedRect hintedRectForSize:options:](self, "hintedRectForSize:options:", v6, width, height);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)hintedRectForSize:(CGSize)a3 options:(unint64_t)a4
{
  char v4 = a4;
  double height = a3.height;
  double width = a3.width;
  int64_t v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  double v9 = [(ISHintedValue *)self hintedValueForIndex:v8];
  [v9 rectValue];
  double x = v10;
  double y = v12;
  double v15 = v14;
  double v17 = v16;
  if (v4)
  {
    if (-[ISHintedValue sizeOutsideHintedRange:](self, "sizeOutsideHintedRange:", width, height))
    {
      -[ISHintedValue scaleFactorForSize:](self, "scaleFactorForSize:", width, height);
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeScale(&v43, v18, v18);
      CGAffineTransform v42 = v43;
      v44.origin.double x = x;
      v44.origin.double y = y;
      v44.size.double width = v15;
      v44.size.double height = v17;
      CGRect v45 = CGRectApplyAffineTransform(v44, &v42);
      double x = v45.origin.x;
      double y = v45.origin.y;
      double v15 = v45.size.width;
      double v17 = v45.size.height;
    }
    else
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      double v20 = v19;
      v21 = [(ISHintedValue *)self hintedValueForIndex:v8 - 1];
      [v21 rectValue];
      double x = v22 + (x - v22) * v20;
      double y = v23 + (y - v23) * v20;
      double v15 = v24 + (v15 - v24) * v20;
      double v17 = v25 + (v17 - v25) * v20;
    }
  }
  double v26 = round(x);
  double v27 = round(y);
  double v28 = round(v15);
  double v29 = round(v17);
  if ((v4 & 2) == 0)
  {
    double v29 = v17;
    double v28 = v15;
    double v27 = y;
    double v26 = x;
  }
  double v30 = round(x + x) * 0.5;
  double v31 = round(y + y) * 0.5;
  double v32 = round(v15 + v15) * 0.5;
  double v33 = round(v17 + v17);
  if ((v4 & 4) != 0) {
    double v34 = v33 * 0.5;
  }
  else {
    double v34 = v29;
  }
  if ((v4 & 4) != 0) {
    double v35 = v32;
  }
  else {
    double v35 = v28;
  }
  if ((v4 & 4) != 0) {
    double v36 = v31;
  }
  else {
    double v36 = v27;
  }
  if ((v4 & 4) != 0) {
    double v37 = v30;
  }
  else {
    double v37 = v26;
  }

  double v38 = v37;
  double v39 = v36;
  double v40 = v35;
  double v41 = v34;
  result.size.double height = v41;
  result.size.double width = v40;
  result.origin.double y = v39;
  result.origin.double x = v38;
  return result;
}

@end