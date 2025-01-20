@interface PKColorMatrixView
+ (double)_rgbDistanceFromColor:(id)a3 toColor:(id)a4;
+ (id)_representableColorForColor:(id)a3;
+ (id)defaultColorMatrix;
+ (id)flippedColorMatrix:(id)a3;
- (CGRect)_frameForViewWithPoint:(id)a3;
- (CGRect)frameForColorPickerCrosshairView:(id)a3;
- (NSArray)colorButtons;
- (NSArray)colorMatrix;
- (NSArray)darkColorMatrix;
- (PKColorMatrixView)initWithFrame:(CGRect)a3;
- (UIColor)selectedColor;
- (_PKColorPickerImplementationDelegate)colorPickerDelegate;
- (id)_boundedPointForPoint:(id)a3;
- (id)_colorForPoint:(id)a3;
- (id)_pointForCGPoint:(CGPoint)a3;
- (id)_pointForColor:(id)a3;
- (id)_pointFromButton:(id)a3;
- (id)representableColorForColor:(id)a3;
- (id)uiColorMatrix;
- (int64_t)_uiColorUserInterfaceStyle;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)cornerPositionForColorPickerCrosshairView:(id)a3;
- (void)colorPickerCrosshairViewShouldUpdateColor:(id)a3 point:(CGPoint)a4;
- (void)colorPickerCrosshairViewShouldUpdateWithColor:(id)a3;
- (void)didTapColorButton:(id)a3;
- (void)layoutSubviews;
- (void)setColorButtons:(id)a3;
- (void)setColorMatrix:(id)a3;
- (void)setColorPickerDelegate:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDarkColorMatrix:(id)a3;
- (void)setSelectedColor:(id)a3;
@end

@implementation PKColorMatrixView

- (PKColorMatrixView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PKColorMatrixView;
  v3 = -[PKColorMatrixView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(id)objc_opt_class() defaultColorMatrix];
  colorMatrix = v3->_colorMatrix;
  v3->_colorMatrix = (NSArray *)v4;

  uint64_t v6 = +[PKColorMatrixView flippedColorMatrix:v3->_colorMatrix];
  darkColorMatrix = v3->_darkColorMatrix;
  v3->_darkColorMatrix = (NSArray *)v6;

  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(PKColorMatrixView *)v3 colorMatrix];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [MEMORY[0x1E4F1CA48] array];
      v13 = [(PKColorMatrixView *)v3 colorMatrix];
      v14 = [v13 objectAtIndexedSubscript:0];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        unint64_t v16 = 0;
        do
        {
          v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
          [v17 addTarget:v3 action:sel_didTapColorButton_ forControlEvents:64];
          [v12 addObject:v17];
          [(PKColorMatrixView *)v3 addSubview:v17];

          ++v16;
          v18 = [(PKColorMatrixView *)v3 colorMatrix];
          v19 = [v18 objectAtIndexedSubscript:0];
          unint64_t v20 = [v19 count];
        }
        while (v16 < v20);
      }
      v21 = (void *)[v12 copy];
      [v8 addObject:v21];

      ++v11;
      v22 = [(PKColorMatrixView *)v3 colorMatrix];
      unint64_t v23 = [v22 count];
    }
    while (v11 < v23);
  }
  v24 = (void *)[v8 copy];
  [(PKColorMatrixView *)v3 setColorButtons:v24];

  return v3;
}

+ (id)flippedColorMatrix:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = [v4 objectAtIndexedSubscript:0];
  v7 = [v6 reverseObjectEnumerator];
  v8 = [v7 allObjects];
  [v5 addObject:v8];

  v9 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);

  uint64_t v10 = [v9 reverseObjectEnumerator];
  unint64_t v11 = [v10 allObjects];
  [v5 addObjectsFromArray:v11];

  return v5;
}

- (void)didTapColorButton:(id)a3
{
  id v11 = [(PKColorMatrixView *)self _pointFromButton:a3];
  id v4 = -[PKColorMatrixView _colorForPoint:](self, "_colorForPoint:");
  [(PKColorMatrixView *)self setSelectedColor:v4];
  v5 = [(PKColorMatrixView *)self colorPickerDelegate];
  [v5 colorPickerImplementationDidChangeSelectedColor:self];

  uint64_t v6 = [(PKColorMatrixView *)self colorPickerDelegate];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(PKColorMatrixView *)self colorPickerDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(PKColorMatrixView *)self colorPickerDelegate];
      [v10 colorPickerImplementationUserDidTouchUpInside:self];
    }
  }
}

- (id)_pointFromButton:(id)a3
{
  id v4 = a3;
  v5 = [(PKColorMatrixView *)self colorButtons];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      v8 = [(PKColorMatrixView *)self colorButtons];
      char v9 = [v8 objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 count];

      if (v10) {
        break;
      }
LABEL_7:
      ++v7;
      v18 = [(PKColorMatrixView *)self colorButtons];
      unint64_t v19 = [v18 count];

      if (v7 >= v19) {
        goto LABEL_8;
      }
    }
    unint64_t v11 = 0;
    while (1)
    {
      v12 = [(PKColorMatrixView *)self colorButtons];
      v13 = [v12 objectAtIndexedSubscript:v7];
      id v14 = [v13 objectAtIndexedSubscript:v11];

      if (v14 == v4) {
        break;
      }

      ++v11;
      uint64_t v15 = [(PKColorMatrixView *)self colorButtons];
      unint64_t v16 = [v15 objectAtIndexedSubscript:0];
      unint64_t v17 = [v16 count];

      if (v11 >= v17) {
        goto LABEL_7;
      }
    }
    unint64_t v20 = +[PKColorMatrixViewPoint pointWithRow:v7 col:v11];
  }
  else
  {
LABEL_8:
    unint64_t v20 = 0;
  }

  return v20;
}

- (CGRect)_frameForViewWithPoint:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PKColorMatrixView *)self uiColorMatrix];
    [v5 count];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    [v6 count];

    [(PKColorMatrixView *)self bounds];
    [v4 col];
    [v4 row];

    unint64_t v7 = [(PKColorMatrixView *)self traitCollection];
    [v7 displayScale];
    UIRectIntegralWithScale();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_pointForCGPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKColorMatrixView *)self uiColorMatrix];
  double v7 = (double)(unint64_t)[v6 count];
  double v8 = [v6 objectAtIndexedSubscript:0];
  double v9 = (double)(unint64_t)[v8 count];

  [(PKColorMatrixView *)self bounds];
  double v12 = +[PKColorMatrixViewPoint pointWithRow:vcvtmd_s64_f64(y / (v10 / v7)) col:vcvtmd_s64_f64(x / (v11 / v9))];

  return v12;
}

- (id)_colorForPoint:(id)a3
{
  id v4 = a3;
  v5 = [(PKColorMatrixView *)self uiColorMatrix];
  if (v4 && (unint64_t v6 = [v4 row], v6 < objc_msgSend(v5, "count")))
  {
    unint64_t v7 = [v4 col];
    double v8 = [v5 objectAtIndexedSubscript:0];
    unint64_t v9 = [v8 count];

    double v10 = 0;
    if (v7 < v9)
    {
      double v11 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      double v10 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "col"));
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKColorMatrixView *)self setNeedsLayout];
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  if ([(PKColorMatrixView *)self colorUserInterfaceStyle])
  {
    return [(PKColorMatrixView *)self colorUserInterfaceStyle];
  }
  else
  {
    id v4 = [(PKColorMatrixView *)self traitCollection];
    int64_t v5 = [v4 userInterfaceStyle];

    return v5;
  }
}

- (id)uiColorMatrix
{
  if ([(PKColorMatrixView *)self _uiColorUserInterfaceStyle] == 2) {
    [(PKColorMatrixView *)self darkColorMatrix];
  }
  else {
  v3 = [(PKColorMatrixView *)self colorMatrix];
  }

  return v3;
}

- (id)_pointForColor:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(PKColorMatrixView *)self uiColorMatrix],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    unint64_t v7 = 0;
    double v8 = 0;
    double v9 = 1.79769313e308;
    do
    {
      double v10 = [(PKColorMatrixView *)self uiColorMatrix];
      double v11 = [v10 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        unint64_t v13 = 0;
        do
        {
          double v14 = [(PKColorMatrixView *)self uiColorMatrix];
          double v15 = [v14 objectAtIndexedSubscript:v7];
          double v16 = [v15 objectAtIndexedSubscript:v13];

          [v16 _colorDifferenceFromColor:v4];
          if (v17 < v9)
          {
            double v18 = v17;
            uint64_t v19 = +[PKColorMatrixViewPoint pointWithRow:v7 col:v13];

            double v8 = (void *)v19;
            double v9 = v18;
          }

          ++v13;
          unint64_t v20 = [(PKColorMatrixView *)self uiColorMatrix];
          v21 = [v20 objectAtIndexedSubscript:0];
          unint64_t v22 = [v21 count];
        }
        while (v13 < v22);
      }
      ++v7;
      unint64_t v23 = [(PKColorMatrixView *)self uiColorMatrix];
      unint64_t v24 = [v23 count];
    }
    while (v7 < v24);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_boundedPointForPoint:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = [(PKColorMatrixView *)self uiColorMatrix];
    double v6 = (double)[v4 row];
    double v7 = (double)(unint64_t)([v5 count] - 1);
    if (v6 < v7) {
      double v7 = v6;
    }
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    uint64_t v8 = (uint64_t)v7;
    uint64_t v9 = [v4 col];

    double v10 = (double)v9;
    double v11 = [v5 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 count] - 1;

    double v13 = (double)(unint64_t)v12;
    if (v10 < (double)(unint64_t)v12) {
      double v13 = v10;
    }
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    double v14 = +[PKColorMatrixViewPoint pointWithRow:v8 col:(uint64_t)v13];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKColorMatrixView;
  [(PKColorMatrixView *)&v24 layoutSubviews];
  int64_t v22 = [(PKColorMatrixView *)self _uiColorUserInterfaceStyle];
  v3 = [(PKColorMatrixView *)self uiColorMatrix];
  uint64_t v21 = [v3 count];
  if (v21 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0x1E64C3000uLL;
    unint64_t v6 = 0x1E64C3000uLL;
    do
    {
      double v7 = [v3 objectAtIndexedSubscript:0];
      uint64_t v8 = [v7 count];

      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v23 = v8;
        do
        {
          [(PKColorMatrixView *)self colorButtons];
          v11 = unint64_t v10 = v6;
          [v11 objectAtIndexedSubscript:v4];
          v13 = uint64_t v12 = v4;
          double v14 = [v13 objectAtIndexedSubscript:v9];

          double v15 = *(void **)(v5 + 2976);
          double v16 = [v3 objectAtIndexedSubscript:v12];
          [v16 objectAtIndexedSubscript:v9];
          v18 = unint64_t v17 = v5;
          uint64_t v19 = [v15 convertColor:v18 fromUserInterfaceStyle:1 to:v22];
          [v14 setBackgroundColor:v19];

          unint64_t v6 = v10;
          uint64_t v4 = v12;
          unint64_t v20 = [*(id *)(v10 + 2360) pointWithRow:v12 col:v9];
          [(PKColorMatrixView *)self _frameForViewWithPoint:v20];
          objc_msgSend(v14, "setFrame:");

          unint64_t v5 = v17;
          ++v9;
        }
        while (v23 != v9);
      }
      ++v4;
    }
    while (v4 != v21);
  }
}

- (id)representableColorForColor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _representableColorForColor:v3];

  return v4;
}

+ (id)_representableColorForColor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [a1 defaultColorMatrix];
    if ([v5 count])
    {
      unint64_t v6 = 0;
      double v7 = 0;
      double v8 = 1.79769313e308;
      do
      {
        uint64_t v9 = [v5 objectAtIndexedSubscript:0];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          unint64_t v11 = 0;
          do
          {
            uint64_t v12 = [v5 objectAtIndexedSubscript:v6];
            double v13 = [v12 objectAtIndexedSubscript:v11];

            [a1 _rgbDistanceFromColor:v13 toColor:v4];
            if (v14 < v8)
            {
              double v15 = v14;
              id v16 = v13;

              double v7 = v16;
              double v8 = v15;
            }

            ++v11;
            unint64_t v17 = [v5 objectAtIndexedSubscript:0];
            unint64_t v18 = [v17 count];
          }
          while (v11 < v18);
        }
        ++v6;
      }
      while (v6 < [v5 count]);
    }
    else
    {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (double)_rgbDistanceFromColor:(id)a3 toColor:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  [a3 getRed:&v11 green:(char *)&v11 + 8 blue:&v12 alpha:(char *)&v12 + 8];
  long long v9 = 0u;
  long long v10 = 0u;
  [v5 getRed:&v9 green:(char *)&v9 + 8 blue:&v10 alpha:(char *)&v10 + 8];
  uint64_t v6 = 0;
  double v7 = 0.0;
  do
  {
    double v7 = v7
       + (*(double *)((char *)&v11 + v6) - *(double *)((char *)&v9 + v6))
       * (*(double *)((char *)&v11 + v6) - *(double *)((char *)&v9 + v6));
    v6 += 8;
  }
  while (v6 != 24);

  return sqrt(v7);
}

- (CGRect)frameForColorPickerCrosshairView:(id)a3
{
  id v4 = a3;
  id v5 = [(PKColorMatrixView *)self selectedColor];
  uint64_t v6 = [(PKColorMatrixView *)self _pointForColor:v5];
  double v7 = [(PKColorMatrixView *)self _boundedPointForPoint:v6];
  [(PKColorMatrixView *)self _frameForViewWithPoint:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = [v4 superview];

  objc_msgSend(v16, "convertRect:fromView:", self, v9, v11, v13, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (unint64_t)cornerPositionForColorPickerCrosshairView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  -[PKColorMatrixView convertRect:fromView:](self, "convertRect:fromView:", v4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(PKColorMatrixView *)self uiColorMatrix];
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  double MidX = CGRectGetMidX(v25);
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  double v15 = -[PKColorMatrixView _pointForCGPoint:](self, "_pointForCGPoint:", MidX, CGRectGetMidY(v26));
  if (![v15 row])
  {
    if (![v15 col])
    {
      unint64_t v20 = 1;
      goto LABEL_12;
    }
    uint64_t v21 = [v15 col];
    double v22 = [v13 objectAtIndexedSubscript:0];
    uint64_t v23 = [v22 count] - 1;

    if (v21 == v23)
    {
      unint64_t v20 = 2;
      goto LABEL_12;
    }
LABEL_9:
    unint64_t v20 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = [v15 row];
  if (v16 != [v13 count] - 1) {
    goto LABEL_9;
  }
  if (![v15 col])
  {
    unint64_t v20 = 3;
    goto LABEL_12;
  }
  uint64_t v17 = [v15 col];
  double v18 = [v13 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 count] - 1;

  if (v17 != v19) {
    goto LABEL_9;
  }
  unint64_t v20 = 4;
LABEL_12:

  return v20;
}

- (void)colorPickerCrosshairViewShouldUpdateColor:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [a3 superview];
  -[PKColorMatrixView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  CGFloat v12 = -[PKColorMatrixView _pointForCGPoint:](self, "_pointForCGPoint:", v9, v11);
  uint64_t v13 = [(PKColorMatrixView *)self _boundedPointForPoint:v12];
  id v16 = [(PKColorMatrixView *)self _colorForPoint:v13];

  double v14 = [(PKColorMatrixView *)self selectedColor];
  LOBYTE(v13) = [v14 isEqual:v16];

  if ((v13 & 1) == 0)
  {
    [(PKColorMatrixView *)self setSelectedColor:v16];
    double v15 = [(PKColorMatrixView *)self colorPickerDelegate];
    [v15 colorPickerImplementationDidChangeSelectedColor:self];
  }
}

- (void)colorPickerCrosshairViewShouldUpdateWithColor:(id)a3
{
  id v7 = a3;
  id v4 = [(PKColorMatrixView *)self selectedColor];
  char v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    [(PKColorMatrixView *)self setSelectedColor:v7];
    CGFloat v6 = [(PKColorMatrixView *)self colorPickerDelegate];
    [v6 colorPickerImplementationDidChangeSelectedColor:self];
  }
}

+ (id)defaultColorMatrix
{
  if (qword_1EA3C6BC0 != -1) {
    dispatch_once(&qword_1EA3C6BC0, &__block_literal_global_27);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

void __39__PKColorMatrixView_defaultColorMatrix__block_invoke()
{
  v142[10] = *MEMORY[0x1E4F143B8];
  v128 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v141[0] = v128;
  v127 = [MEMORY[0x1E4FB1618] colorWithRed:0.921568627 green:0.921568627 blue:0.921568627 alpha:1.0];
  v141[1] = v127;
  v126 = [MEMORY[0x1E4FB1618] colorWithRed:0.839215686 green:0.839215686 blue:0.839215686 alpha:1.0];
  v141[2] = v126;
  v125 = [MEMORY[0x1E4FB1618] colorWithRed:0.760784314 green:0.760784314 blue:0.760784314 alpha:1.0];
  v141[3] = v125;
  v124 = [MEMORY[0x1E4FB1618] colorWithRed:0.678431373 green:0.678431373 blue:0.678431373 alpha:1.0];
  v141[4] = v124;
  v123 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
  v141[5] = v123;
  v122 = [MEMORY[0x1E4FB1618] colorWithRed:0.521568627 green:0.521568627 blue:0.521568627 alpha:1.0];
  v141[6] = v122;
  v121 = [MEMORY[0x1E4FB1618] colorWithRed:0.439215686 green:0.439215686 blue:0.439215686 alpha:1.0];
  v141[7] = v121;
  v120 = [MEMORY[0x1E4FB1618] colorWithRed:0.360784314 green:0.360784314 blue:0.360784314 alpha:1.0];
  v141[8] = v120;
  v119 = [MEMORY[0x1E4FB1618] colorWithRed:0.278431373 green:0.278431373 blue:0.278431373 alpha:1.0];
  v141[9] = v119;
  v118 = [MEMORY[0x1E4FB1618] colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
  v141[10] = v118;
  v117 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v141[11] = v117;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:12];
  v142[0] = v116;
  v115 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.0);
  v140[0] = v115;
  v114 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.11372549);
  v140[1] = v114;
  v113 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.0666666667, 0.0196078431);
  v140[2] = v113;
  v112 = [MEMORY[0x1E4FB1618] colorWithRed:0.180392157 green:0.0235294118 blue:0.239215686 alpha:1.0];
  v140[3] = v112;
  v111 = [MEMORY[0x1E4FB1618] colorWithRed:0.235294118 green:0.0274509804 blue:0.105882353 alpha:1.0];
  v140[4] = v111;
  v110 = [MEMORY[0x1E4FB1618] colorWithRed:0.360784314 green:0.0274509804 blue:0.00392156863 alpha:1.0];
  v140[5] = v110;
  v109 = [MEMORY[0x1E4FB1618] colorWithRed:0.352941176 green:0.109803922 blue:0.0 alpha:1.0];
  v140[6] = v109;
  v108 = [MEMORY[0x1E4FB1618] colorWithRed:0.345098039 green:0.2 blue:0.0 alpha:1.0];
  v140[7] = v108;
  v107 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v140[8] = v107;
  v106 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v140[9] = v106;
  v105 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v140[10] = v105;
  v104 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.149019608);
  v140[11] = v104;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:12];
  v142[1] = v103;
  v102 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.0);
  v139[0] = v102;
  v101 = [MEMORY[0x1E4FB1618] colorWithRed:0.00392156863 green:0.184313725 blue:0.482352941 alpha:1.0];
  v139[1] = v101;
  v100 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.101960784, 0.0392156863);
  v139[2] = v100;
  v99 = [MEMORY[0x1E4FB1618] colorWithRed:0.270588235 green:0.0509803922 blue:0.349019608 alpha:1.0];
  v139[3] = v99;
  v98 = [MEMORY[0x1E4FB1618] colorWithRed:0.333333333 green:0.062745098 blue:0.160784314 alpha:1.0];
  v139[4] = v98;
  v97 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v139[5] = v97;
  v96 = [MEMORY[0x1E4FB1618] colorWithRed:0.482352941 green:0.160784314 blue:0.0 alpha:1.0];
  v139[6] = v96;
  v95 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v139[7] = v95;
  v94 = [MEMORY[0x1E4FB1618] colorWithRed:0.470588235 green:0.345098039 blue:0.0 alpha:1.0];
  v139[8] = v94;
  v93 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.552941176);
  v139[9] = v93;
  v92 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.435294118);
  v139[10] = v92;
  v91 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v139[11] = v91;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:12];
  v142[2] = v90;
  v89 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.431372549);
  v138[0] = v89;
  v88 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.258823529 blue:0.662745098 alpha:1.0];
  v138[1] = v88;
  v87 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.17254902, 0.0352941176);
  v138[2] = v87;
  v86 = [MEMORY[0x1E4FB1618] colorWithRed:0.380392157 green:0.0941176471 blue:0.48627451 alpha:1.0];
  v138[3] = v86;
  v85 = [MEMORY[0x1E4FB1618] colorWithRed:0.474509804 green:0.101960784 blue:0.239215686 alpha:1.0];
  v138[4] = v85;
  v84 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v138[5] = v84;
  v83 = [MEMORY[0x1E4FB1618] colorWithRed:0.678431373 green:0.243137255 blue:0.0 alpha:1.0];
  v138[6] = v83;
  v82 = [MEMORY[0x1E4FB1618] colorWithRed:0.662745098 green:0.407843137 blue:0.0 alpha:1.0];
  v138[7] = v82;
  v81 = [MEMORY[0x1E4FB1618] colorWithRed:0.650980392 green:0.482352941 blue:0.00392156863 alpha:1.0];
  v138[8] = v81;
  v80 = [MEMORY[0x1E4FB1618] colorWithRed:0.768627451 green:0.737254902 blue:0.0 alpha:1.0];
  v138[9] = v80;
  v79 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.607843137);
  v138[10] = v79;
  v78 = [MEMORY[0x1E4FB1618] colorWithRed:0.305882353 green:0.478431373 blue:0.152941176 alpha:1.0];
  v138[11] = v78;
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:12];
  v142[3] = v77;
  v76 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.0);
  v137[0] = v76;
  v75 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.337254902 blue:0.839215686 alpha:1.0];
  v137[1] = v75;
  v74 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.215686275, 0.101960784);
  v137[2] = v74;
  v73 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.478431373, 0.129411765);
  v137[3] = v73;
  v72 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.141176471 blue:0.309803922 alpha:1.0];
  v137[4] = v72;
  v71 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v137[5] = v71;
  v70 = [MEMORY[0x1E4FB1618] colorWithRed:0.854901961 green:0.317647059 blue:0.0 alpha:1.0];
  v137[6] = v70;
  v69 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v137[7] = v69;
  v68 = [MEMORY[0x1E4FB1618] colorWithRed:0.819607843 green:0.615686275 blue:0.00392156863 alpha:1.0];
  v137[8] = v68;
  v67 = [MEMORY[0x1E4FB1618] colorWithRed:0.960784314 green:0.925490196 blue:0.0 alpha:1.0];
  v137[9] = v67;
  v66 = [MEMORY[0x1E4FB1618] colorWithRed:0.764705882 green:0.819607843 blue:0.0901960784 alpha:1.0];
  v137[10] = v66;
  v65 = [MEMORY[0x1E4FB1618] colorWithRed:0.4 green:0.615686275 blue:0.203921569 alpha:1.0];
  v137[11] = v65;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:12];
  v142[4] = v64;
  v63 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.0, 0.631372549);
  v136[0] = v63;
  v61 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.380392157 blue:0.996078431 alpha:1.0];
  v136[1] = v61;
  v60 = [MEMORY[0x1E4FB1618] colorWithRed:0.301960784 green:0.133333333 blue:0.698039216 alpha:1.0];
  v136[2] = v60;
  v59 = [MEMORY[0x1E4FB1618] colorWithRed:0.596078431 green:0.164705882 blue:0.737254902 alpha:1.0];
  v136[3] = v59;
  v58 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v136[4] = v58;
  v57 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.250980392 blue:0.0823529412 alpha:1.0];
  v136[5] = v57;
  v56 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.415686275 blue:0.0 alpha:1.0];
  v136[6] = v56;
  v55 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 1.0);
  v136[7] = v55;
  v54 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v136[8] = v54;
  v53 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.996078431);
  v136[9] = v53;
  v51 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v136[10] = v51;
  v50 = [MEMORY[0x1E4FB1618] colorWithRed:0.462745098 green:0.733333333 blue:0.250980392 alpha:1.0];
  v136[11] = v50;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:12];
  v142[5] = v49;
  v48 = [MEMORY[0x1E4FB1618] colorWithRed:0.00392156863 green:0.780392157 blue:0.988235294 alpha:1.0];
  v135[0] = v48;
  v45 = [MEMORY[0x1E4FB1618] colorWithRed:0.22745098 green:0.529411765 blue:0.996078431 alpha:1.0];
  v135[1] = v45;
  v62 = [MEMORY[0x1E4FB1618] colorWithRed:0.368627451 green:0.188235294 blue:0.921568627 alpha:1.0];
  v135[2] = v62;
  v42 = [MEMORY[0x1E4FB1618] colorWithRed:0.745098039 green:0.219607843 blue:0.952941176 alpha:1.0];
  v135[3] = v42;
  v52 = [MEMORY[0x1E4FB1618] colorWithRed:0.901960784 green:0.231372549 blue:0.478431373 alpha:1.0];
  v135[4] = v52;
  v41 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.384313725 blue:0.31372549 alpha:1.0];
  v135[5] = v41;
  v40 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.525490196 blue:0.282352941 alpha:1.0];
  v135[6] = v40;
  v38 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.705882353 blue:0.247058824 alpha:1.0];
  v135[7] = v38;
  v129 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.996078431);
  v135[8] = v129;
  v37 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 1.0);
  v135[9] = v37;
  v44 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.894117647);
  v135[10] = v44;
  v36 = [MEMORY[0x1E4FB1618] colorWithRed:0.588235294 green:0.82745098 blue:0.37254902 alpha:1.0];
  v135[11] = v36;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:12];
  v142[6] = v34;
  v46 = [MEMORY[0x1E4FB1618] colorWithRed:0.321568627 green:0.839215686 blue:0.988235294 alpha:1.0];
  v134[0] = v46;
  v32 = [MEMORY[0x1E4FB1618] colorWithRed:0.454901961 green:0.654901961 blue:1.0 alpha:1.0];
  v134[1] = v32;
  v130 = [MEMORY[0x1E4FB1618] colorWithRed:0.525490196 green:0.309803922 blue:0.996078431 alpha:1.0];
  v134[2] = v130;
  v131 = [MEMORY[0x1E4FB1618] colorWithRed:0.82745098 green:0.341176471 blue:0.996078431 alpha:1.0];
  v134[3] = v131;
  v35 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  v134[4] = v35;
  double v28 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.549019608 blue:0.509803922 alpha:1.0];
  v134[5] = v28;
  v33 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.647058824 blue:0.490196078 alpha:1.0];
  v134[6] = v33;
  double v27 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.780392157 blue:0.466666667 alpha:1.0];
  v134[7] = v27;
  v39 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.850980392 blue:0.466666667 alpha:1.0];
  v134[8] = v39;
  v31 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.976470588 blue:0.580392157 alpha:1.0];
  v134[9] = v31;
  v43 = [MEMORY[0x1E4FB1618] colorWithRed:0.917647059 green:0.949019608 blue:0.560784314 alpha:1.0];
  v134[10] = v43;
  double v24 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", 0.694117647);
  v134[11] = v24;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:12];
  v142[7] = v23;
  double v22 = [MEMORY[0x1E4FB1618] colorWithRed:0.576470588 green:0.890196078 blue:0.992156863 alpha:1.0];
  v133[0] = v22;
  uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithRed:0.654901961 green:0.776470588 blue:1.0 alpha:1.0];
  v133[1] = v21;
  v30 = [MEMORY[0x1E4FB1618] colorWithRed:0.694117647 green:0.549019608 blue:0.996078431 alpha:1.0];
  v133[2] = v30;
  double v18 = [MEMORY[0x1E4FB1618] colorWithRed:0.88627451 green:0.57254902 blue:0.996078431 alpha:1.0];
  v133[3] = v18;
  uint64_t v17 = [MEMORY[0x1E4FB1618] colorWithRed:0.956862745 green:0.643137255 blue:0.752941176 alpha:1.0];
  v133[4] = v17;
  id v16 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.709803922 blue:0.68627451 alpha:1.0];
  v133[5] = v16;
  CGRect v25 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.77254902 blue:0.670588235 alpha:1.0];
  v133[6] = v25;
  double v14 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.850980392 blue:0.658823529 alpha:1.0];
  v133[7] = v14;
  uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.894117647 blue:0.658823529 alpha:1.0];
  v133[8] = v13;
  v29 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.984313725 blue:0.725490196 alpha:1.0];
  v133[9] = v29;
  CGRect v26 = [MEMORY[0x1E4FB1618] colorWithRed:0.949019608 green:0.968627451 blue:0.717647059 alpha:1.0];
  v133[10] = v26;
  v47 = [MEMORY[0x1E4FB1618] colorWithRed:0.803921569 green:0.909803922 blue:0.709803922 alpha:1.0];
  v133[11] = v47;
  CGFloat v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:12];
  v142[8] = v12;
  uint64_t v19 = [MEMORY[0x1E4FB1618] colorWithRed:0.796078431 green:0.941176471 blue:1.0 alpha:1.0];
  v132[0] = v19;
  double v11 = [MEMORY[0x1E4FB1618] colorWithRed:0.82745098 green:0.88627451 blue:1.0 alpha:1.0];
  v132[1] = v11;
  double v15 = [MEMORY[0x1E4FB1618] colorWithRed:0.850980392 green:0.788235294 blue:0.996078431 alpha:1.0];
  v132[2] = v15;
  unint64_t v20 = [MEMORY[0x1E4FB1618] colorWithRed:0.937254902 green:0.792156863 blue:1.0 alpha:1.0];
  v132[3] = v20;
  v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.976470588 green:0.82745098 blue:0.878431373 alpha:1.0];
  v132[4] = v0;
  v1 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.858823529 blue:0.847058824 alpha:1.0];
  v132[5] = v1;
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.88627451 blue:0.839215686 alpha:1.0];
  v132[6] = v2;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.925490196 blue:0.831372549 alpha:1.0];
  v132[7] = v3;
  id v4 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.949019608 blue:0.835294118 alpha:1.0];
  v132[8] = v4;
  char v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.988235294 blue:0.866666667 alpha:1.0];
  v132[9] = v5;
  CGFloat v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.968627451 green:0.980392157 blue:0.858823529 alpha:1.0];
  v132[10] = v6;
  id v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.874509804 green:0.933333333 blue:0.831372549 alpha:1.0];
  v132[11] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:12];
  v142[9] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:10];
  double v10 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v9;
}

- (UIColor)selectedColor
{
  return self->selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (_PKColorPickerImplementationDelegate)colorPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorPickerDelegate);

  return (_PKColorPickerImplementationDelegate *)WeakRetained;
}

- (void)setColorPickerDelegate:(id)a3
{
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (NSArray)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
}

- (NSArray)darkColorMatrix
{
  return self->_darkColorMatrix;
}

- (void)setDarkColorMatrix:(id)a3
{
}

- (NSArray)colorButtons
{
  return self->_colorButtons;
}

- (void)setColorButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorButtons, 0);
  objc_storeStrong((id *)&self->_darkColorMatrix, 0);
  objc_storeStrong((id *)&self->_colorMatrix, 0);
  objc_destroyWeak((id *)&self->_colorPickerDelegate);

  objc_storeStrong((id *)&self->selectedColor, 0);
}

@end