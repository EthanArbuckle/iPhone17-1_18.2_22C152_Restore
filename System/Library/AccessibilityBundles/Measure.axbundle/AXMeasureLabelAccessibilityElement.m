@interface AXMeasureLabelAccessibilityElement
- (BOOL)isAccessibilityElement;
- (BOOL)isRectangleArea;
- (BOOL)isRectangleSideLength;
- (CGRect)accessibilityFrameInContainerSpace;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)labelRender;
- (unint64_t)accessibilityTraits;
- (void)setIsRectangleArea:(BOOL)a3;
- (void)setIsRectangleSideLength:(BOOL)a3;
- (void)setLabelRender:(id)a3;
@end

@implementation AXMeasureLabelAccessibilityElement

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v3 = [(AXMeasureLabelAccessibilityElement *)self labelRender];
  v4 = [v3 safeValueForKey:@"labelNode"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    [v5 alpha];
    BOOL v7 = v6 > 0.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)accessibilityLabel
{
  v3 = [(AXMeasureLabelAccessibilityElement *)self labelRender];
  unint64_t v4 = [v3 safeIntegerForKey:@"state"] - 3;

  if (v4 < 2)
  {
    v5 = @"CURRENT_MEASUREMENT";
LABEL_7:
    double v6 = accessibilityLocalizedString(v5);
    goto LABEL_8;
  }
  if ([(AXMeasureLabelAccessibilityElement *)self isRectangleArea])
  {
    v5 = @"RECTANGLE_AREA";
    goto LABEL_7;
  }
  if ([(AXMeasureLabelAccessibilityElement *)self isRectangleSideLength])
  {
    v5 = @"RECTANGLE_SIDE_LENGTH";
    goto LABEL_7;
  }
  double v6 = 0;
LABEL_8:

  return v6;
}

- (id)accessibilityValue
{
  v2 = [(AXMeasureLabelAccessibilityElement *)self labelRender];
  v3 = [v2 safeStringForKey:@"speakableString"];

  return v3;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  v2 = [(AXMeasureLabelAccessibilityElement *)self labelRender];
  [v2 safeCGRectForKey:@"accessibilityFrameForLabelContainer"];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF18];
  double v3 = [(AXMeasureLabelAccessibilityElement *)self labelRender];
  unint64_t v4 = [v3 safeIntegerForKey:@"state"] - 3;

  double v5 = (void *)MEMORY[0x263F1CF68];
  if (v4 >= 2) {
    double v5 = (void *)MEMORY[0x263F1CEE8];
  }
  return *v5 | v2;
}

- (BOOL)isRectangleArea
{
  return self->_isRectangleArea;
}

- (void)setIsRectangleArea:(BOOL)a3
{
  self->_isRectangleArea = a3;
}

- (BOOL)isRectangleSideLength
{
  return self->_isRectangleSideLength;
}

- (void)setIsRectangleSideLength:(BOOL)a3
{
  self->_isRectangleSideLength = a3;
}

- (id)labelRender
{
  id WeakRetained = objc_loadWeakRetained(&self->_labelRender);

  return WeakRetained;
}

- (void)setLabelRender:(id)a3
{
}

- (void).cxx_destruct
{
}

@end