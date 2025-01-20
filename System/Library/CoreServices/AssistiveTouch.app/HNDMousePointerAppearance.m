@interface HNDMousePointerAppearance
- (BOOL)showFingerOutlines;
- (BOOL)showInnerCircle;
- (HNDMousePointerAppearance)init;
- (UIColor)pointerUIColorRepresentation;
- (double)fingerInnerCircleInnerRadius;
- (double)fingerInnerRadius;
- (double)innerCircleStrokeWidth;
- (double)sizeMultiplier;
- (double)strokeOutlineWidth;
- (double)strokeWidth;
- (id)_uiColorForCursorColor:(int64_t)a3;
- (id)deselectedStrokeColor;
- (id)selectedStrokeColor;
- (int64_t)cursorColor;
- (void)setCursorColor:(int64_t)a3;
- (void)setSizeMultiplier:(double)a3;
@end

@implementation HNDMousePointerAppearance

- (HNDMousePointerAppearance)init
{
  v4.receiver = self;
  v4.super_class = (Class)HNDMousePointerAppearance;
  v2 = [(HNDMousePointerAppearance *)&v4 init];
  [(HNDMousePointerAppearance *)v2 setSizeMultiplier:1.0];
  return v2;
}

- (void)setCursorColor:(int64_t)a3
{
  if (self->_cursorColor != a3)
  {
    self->_cursorColor = a3;
    -[HNDMousePointerAppearance _uiColorForCursorColor:](self, "_uiColorForCursorColor:");
    objc_super v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    pointerUIColorRepresentation = self->_pointerUIColorRepresentation;
    self->_pointerUIColorRepresentation = v4;
    _objc_release_x1(v4, pointerUIColorRepresentation);
  }
}

- (id)_uiColorForCursorColor:(int64_t)a3
{
  v3 = (void *)AXSAssistiveTouchCursorColor();
  if (v3)
  {
    v3 = +[UIColor colorWithCGColor:v3];
  }

  return v3;
}

- (id)selectedStrokeColor
{
  if ((id)[(HNDMousePointerAppearance *)self cursorColor] == (id)1)
  {
    uint64_t v3 = +[UIColor whiteColor];
LABEL_8:
    objc_super v4 = (void *)v3;
    goto LABEL_9;
  }
  if ((id)[(HNDMousePointerAppearance *)self cursorColor] != (id)2
    || ([(HNDMousePointerAppearance *)self _uiColorForCursorColor:1],
        (objc_super v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [(HNDMousePointerAppearance *)self pointerUIColorRepresentation];

    if (v5)
    {
      v6 = [(HNDMousePointerAppearance *)self pointerUIColorRepresentation];
      objc_super v4 = AXSlightlyBrighterColorForColor();

      goto LABEL_9;
    }
    v8.receiver = self;
    v8.super_class = (Class)HNDMousePointerAppearance;
    uint64_t v3 = [(HNDMousePointerAppearance *)&v8 selectedStrokeColor];
    goto LABEL_8;
  }
LABEL_9:

  return v4;
}

- (id)deselectedStrokeColor
{
  uint64_t v3 = [(HNDMousePointerAppearance *)self pointerUIColorRepresentation];

  if (v3)
  {
    objc_super v4 = [(HNDMousePointerAppearance *)self pointerUIColorRepresentation];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HNDMousePointerAppearance;
    objc_super v4 = [(HNDMousePointerAppearance *)&v6 deselectedStrokeColor];
  }

  return v4;
}

- (BOOL)showFingerOutlines
{
  return sub_100041014() ^ 1;
}

- (double)strokeWidth
{
  v7.receiver = self;
  v7.super_class = (Class)HNDMousePointerAppearance;
  [(HNDMousePointerAppearance *)&v7 strokeWidth];
  double v4 = v3;
  [(HNDMousePointerAppearance *)self sizeMultiplier];
  return v4 * v5;
}

- (double)strokeOutlineWidth
{
  v7.receiver = self;
  v7.super_class = (Class)HNDMousePointerAppearance;
  [(HNDMousePointerAppearance *)&v7 strokeOutlineWidth];
  double v4 = v3;
  [(HNDMousePointerAppearance *)self sizeMultiplier];
  return v4 * v5;
}

- (double)innerCircleStrokeWidth
{
  v7.receiver = self;
  v7.super_class = (Class)HNDMousePointerAppearance;
  [(HNDMousePointerAppearance *)&v7 innerCircleStrokeWidth];
  double v4 = v3;
  [(HNDMousePointerAppearance *)self sizeMultiplier];
  return v4 * v5;
}

- (double)fingerInnerRadius
{
  v7.receiver = self;
  v7.super_class = (Class)HNDMousePointerAppearance;
  [(HNDMousePointerAppearance *)&v7 fingerInnerRadius];
  double v4 = v3;
  [(HNDMousePointerAppearance *)self sizeMultiplier];
  return v4 * v5;
}

- (double)fingerInnerCircleInnerRadius
{
  v7.receiver = self;
  v7.super_class = (Class)HNDMousePointerAppearance;
  [(HNDMousePointerAppearance *)&v7 fingerInnerCircleInnerRadius];
  double v4 = v3;
  [(HNDMousePointerAppearance *)self sizeMultiplier];
  return v4 * v5;
}

- (BOOL)showInnerCircle
{
  return sub_100041014() ^ 1;
}

- (double)sizeMultiplier
{
  return self->_sizeMultiplier;
}

- (void)setSizeMultiplier:(double)a3
{
  self->_sizeMultiplier = a3;
}

- (int64_t)cursorColor
{
  return self->_cursorColor;
}

- (UIColor)pointerUIColorRepresentation
{
  return self->_pointerUIColorRepresentation;
}

- (void).cxx_destruct
{
}

@end