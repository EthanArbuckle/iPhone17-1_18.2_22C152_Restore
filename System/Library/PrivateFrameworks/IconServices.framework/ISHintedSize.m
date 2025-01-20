@interface ISHintedSize
- (CGSize)hintedSizeForSize:(CGSize)a3;
- (CGSize)hintedSizeForSize:(CGSize)a3 options:(unint64_t)a4;
- (void)addHintedSize:(CGSize)a3 forSize:(CGSize)a4;
@end

@implementation ISHintedSize

- (void)addHintedSize:(CGSize)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a3.width, a3.height);
  v8.receiver = self;
  v8.super_class = (Class)ISHintedSize;
  -[ISHintedValue addHintedValue:forSize:](&v8, sel_addHintedValue_forSize_, v7, width, height);
}

- (CGSize)hintedSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(ISHintedValue *)self options];
  -[ISHintedSize hintedSizeForSize:options:](self, "hintedSizeForSize:options:", v6, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)hintedSizeForSize:(CGSize)a3 options:(unint64_t)a4
{
  char v4 = a4;
  double height = a3.height;
  double width = a3.width;
  int64_t v8 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  v9 = [(ISHintedValue *)self hintedValueForIndex:v8];
  [v9 sizeValue];
  double v11 = v10;
  double v13 = v12;
  if (v4)
  {
    BOOL v14 = v8 < 1;
    int64_t v15 = v8 - 1;
    if (!v14)
    {
      -[ISHintedValue interpolationFactorForSize:](self, "interpolationFactorForSize:", width, height);
      double v17 = v16;
      v18 = [(ISHintedValue *)self hintedValueForIndex:v15];
      [v18 sizeValue];
      double v11 = v19 + (v11 - v19) * v17;
      double v13 = v20 + (v13 - v20) * v17;
    }
  }
  double v21 = round(v11);
  double v22 = round(v13);
  if ((v4 & 2) != 0)
  {
    double v13 = v22;
    double v11 = v21;
  }

  double v23 = v11;
  double v24 = v13;
  result.double height = v24;
  result.double width = v23;
  return result;
}

@end