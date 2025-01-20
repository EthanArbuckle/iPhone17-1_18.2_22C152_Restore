@interface ISHintedFloat
- (double)hintedFloatForSize:(CGSize)a3;
- (double)hintedFloatForSize:(CGSize)a3 options:(unint64_t)a4;
- (void)addHintedFloat:(double)a3 forSize:(CGSize)a4;
@end

@implementation ISHintedFloat

- (void)addHintedFloat:(double)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = [NSNumber numberWithDouble:a3];
  v8.receiver = self;
  v8.super_class = (Class)ISHintedFloat;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);
}

- (double)hintedFloatForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(ISHintedValue *)self options];
  -[ISHintedFloat hintedFloatForSize:options:](self, "hintedFloatForSize:options:", v6, width, height);
  return result;
}

- (double)hintedFloatForSize:(CGSize)a3 options:(unint64_t)a4
{
  char v4 = a4;
  double height = a3.height;
  double width = a3.width;
  int64_t v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  v9 = [(ISHintedValue *)self hintedValueForIndex:v8];
  [v9 doubleValue];
  double v11 = v10;
  if (v4)
  {
    if (-[ISHintedValue sizeOutsideHintedRange:](self, "sizeOutsideHintedRange:", width, height))
    {
      -[ISHintedValue scaleFactorForSize:](self, "scaleFactorForSize:", width, height);
      double v11 = v11 * v12;
    }
    else
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      double v14 = v13;
      v15 = [(ISHintedValue *)self hintedValueForIndex:v8 - 1];
      [v15 doubleValue];
      double v11 = v16 + (v11 - v16) * v14;
    }
  }
  double v17 = round(v11);
  if ((v4 & 2) != 0) {
    double v11 = v17;
  }

  return v11;
}

@end