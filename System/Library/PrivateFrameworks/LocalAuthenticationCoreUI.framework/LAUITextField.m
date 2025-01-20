@interface LAUITextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)shouldHideEditMenu;
- (BOOL)shouldHideSelectionRects;
- (CGRect)caretRectForPosition:(id)a3;
- (id)inputAssistantItem;
- (id)selectionRectsForRange:(id)a3;
- (void)setShouldHideEditMenu:(BOOL)a3;
- (void)setShouldHideSelectionRects:(BOOL)a3;
@end

@implementation LAUITextField

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  if ([(LAUITextField *)self shouldHideSelectionRects])
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)LAUITextField;
    [(LAUITextField *)&v17 caretRectForPosition:v4];
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
  }

  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  if ([(LAUITextField *)self shouldHideSelectionRects])
  {
    double v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LAUITextField;
    double v5 = [(LAUITextField *)&v7 selectionRectsForRange:v4];
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(LAUITextField *)self shouldHideEditMenu])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAUITextField;
    BOOL v7 = [(LAUITextField *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (id)inputAssistantItem
{
  v4.receiver = self;
  v4.super_class = (Class)LAUITextField;
  v2 = [(LAUITextField *)&v4 inputAssistantItem];
  [v2 setLeadingBarButtonGroups:MEMORY[0x263EFFA68]];
  return v2;
}

- (BOOL)shouldHideSelectionRects
{
  return self->_shouldHideSelectionRects;
}

- (void)setShouldHideSelectionRects:(BOOL)a3
{
  self->_shouldHideSelectionRects = a3;
}

- (BOOL)shouldHideEditMenu
{
  return self->_shouldHideEditMenu;
}

- (void)setShouldHideEditMenu:(BOOL)a3
{
  self->_shouldHideEditMenu = a3;
}

@end