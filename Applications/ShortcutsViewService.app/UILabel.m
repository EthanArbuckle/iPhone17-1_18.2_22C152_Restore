@interface UILabel
- (CGRect)imageGlyphBoundingFrame;
@end

@implementation UILabel

- (CGRect)imageGlyphBoundingFrame
{
  v3 = [(UILabel *)self text];
  [(UILabel *)self bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = [(UILabel *)self _defaultAttributes];
  [v3 boundingRectWithSize:8 options:v8 attributes:0 context:v5];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(UILabel *)self _firstBaselineOffsetFromTop];
  double v18 = v17 - v12 - v16;
  double v19 = v10;
  double v20 = v14;
  double v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

@end