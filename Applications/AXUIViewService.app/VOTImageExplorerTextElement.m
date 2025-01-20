@interface VOTImageExplorerTextElement
- (AXMVisionFeature)parentTextFeature;
- (BOOL)isHeader;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (NSString)description;
- (VOTImageExplorerTextElement)initWithImageView:(id)a3 forTextFeature:(id)a4 withParentTextFeature:(id)a5 hasFlippedYAxis:(BOOL)a6;
- (_NSRange)accessibilityColumnRange;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)parentAccessibilityContainer;
- (unint64_t)columnIndex;
- (unint64_t)rowIndex;
- (void)setColumnIndex:(unint64_t)a3;
- (void)setIsHeader:(BOOL)a3;
- (void)setRowIndex:(unint64_t)a3;
@end

@implementation VOTImageExplorerTextElement

- (VOTImageExplorerTextElement)initWithImageView:(id)a3 forTextFeature:(id)a4 withParentTextFeature:(id)a5 hasFlippedYAxis:(BOOL)a6
{
  BOOL v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)VOTImageExplorerTextElement;
  id v9 = a5;
  v10 = [(VOTImageExplorerElement *)&v12 initWithImageView:a3 forFeature:a4 hasFlippedYAxis:v6];
  objc_storeWeak((id *)&v10->_parentTextFeature, v9);

  return v10;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(VOTImageExplorerTextElement *)self accessibilityLabel];
  [(VOTImageExplorerTextElement *)self accessibilityFrame];
  BOOL v6 = NSStringFromCGRect(v10);
  v7 = +[NSString stringWithFormat:@"%@, Label: %@, Frame: %@, Row: %li, Column: %li", v4, v5, v6, [(VOTImageExplorerTextElement *)self rowIndex], [(VOTImageExplorerTextElement *)self columnIndex]];

  return (NSString *)v7;
}

- (BOOL)isHeader
{
  v2 = [(VOTImageExplorerElement *)self feature];
  BOOL v3 = [v2 ocrFeatureType] == (id)12;

  return v3;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2 = [(VOTImageExplorerTextElement *)self rowIndex];
  NSUInteger v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  NSUInteger v2 = [(VOTImageExplorerTextElement *)self columnIndex];
  NSUInteger v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)accessibilityLabel
{
  NSUInteger v2 = [(VOTImageExplorerElement *)self feature];
  NSUInteger v3 = [v2 value];

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"VOTImageExplorerTextElement";
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(VOTImageExplorerTextElement *)self accessibilityContainerType] == (id)4)
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    CGRect v10 = [(VOTImageExplorerElement *)self feature];
    [v10 boundingBoxForRange:location, length];

    v11 = [(VOTImageExplorerTextElement *)self parentAccessibilityContainer];
    [v11 frame];
    UIAccessibilityFrameForBounds();
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)accessibilityFrame
{
  NSUInteger v3 = [(VOTImageExplorerTextElement *)self parentAccessibilityContainer];
  v4 = [(VOTImageExplorerTextElement *)self parentTextFeature];
  id v5 = [v4 ocrFeatureType];

  if (v5 == (id)16)
  {
    BOOL v6 = [(VOTImageExplorerTextElement *)self parentTextFeature];
    [v6 normalizedFrame];
    [v3 frame];
    [(VOTImageExplorerElement *)self flippedYAxis];

    UIAccessibilityFrameForBounds();
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(VOTImageExplorerElement *)self feature];
    [v15 normalizedFrame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    unsigned int v24 = [(VOTImageExplorerElement *)self flippedYAxis];
    double v25 = 1.0 - v19 - v23;
    if (!v24) {
      double v25 = v19;
    }
    CGFloat v26 = v14 * v25;

    v36.origin.CGFloat x = v12 * v17;
    v36.origin.CGFloat y = v26;
    v36.size.CGFloat width = v12 * v21;
    v36.size.CGFloat height = v14 * v23;
    CGRect v37 = CGRectOffset(v36, v8, v10);
  }
  else
  {
    v27 = [(VOTImageExplorerElement *)self feature];
    [v27 normalizedFrame];
    [v3 frame];
    [(VOTImageExplorerElement *)self flippedYAxis];

    UIAccessibilityFrameForBounds();
  }
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;

  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (id)parentAccessibilityContainer
{
  NSUInteger v2 = [(VOTImageExplorerTextElement *)self accessibilityContainer];
  NSUInteger v3 = [v2 accessibilityContainer];

  return v3;
}

- (AXMVisionFeature)parentTextFeature
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTextFeature);

  return (AXMVisionFeature *)WeakRetained;
}

- (unint64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(unint64_t)a3
{
  self->_rowIndeCGFloat x = a3;
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndeCGFloat x = a3;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (void).cxx_destruct
{
}

@end