@interface HKCaretOptionalTextField
- (BOOL)allowsSelection;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)disableActions;
- (CGRect)caretRectForPosition:(id)a3;
- (double)actualMinimumFontSize;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setDisableActions:(BOOL)a3;
@end

@implementation HKCaretOptionalTextField

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(HKCaretOptionalTextField *)self allowsSelection])
  {
    v10.receiver = self;
    v10.super_class = (Class)HKCaretOptionalTextField;
    v8 = -[HKCaretOptionalTextField hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)caretRectForPosition:(id)a3
{
  if (self->_allowsSelection)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKCaretOptionalTextField;
    [(HKCaretOptionalTextField *)&v7 caretRectForPosition:a3];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)actualMinimumFontSize
{
  return 10.0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (self->_disableActions) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)HKCaretOptionalTextField;
  return [(HKCaretOptionalTextField *)&v5 canPerformAction:a3 withSender:a4];
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (BOOL)disableActions
{
  return self->_disableActions;
}

- (void)setDisableActions:(BOOL)a3
{
  self->_disableActions = a3;
}

@end