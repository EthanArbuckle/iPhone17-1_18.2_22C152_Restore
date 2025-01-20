@interface EMKOverlayView
- (EMKOverlayView)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6;
- (void)dismiss;
- (void)dismissWithSelectedEmojiToken:(id)a3;
- (void)drawBackground:(CGRect)a3;
- (void)drawForeground:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)selectWithEvent:(id)a3;
- (void)setView:(id)a3 anchorRect:(CGRect)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation EMKOverlayView

- (EMKOverlayView)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = v13;
  v17 = [v16 superview];

  v18 = v16;
  if (v17)
  {
    v19 = v16;
    do
    {
      v18 = [v19 superview];

      v20 = [v18 superview];

      v19 = v18;
    }
    while (v20);
  }
  objc_msgSend(v18, "convertRect:fromView:", v16, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if ([v14 count])
  {
    [v18 bounds];
    v43.receiver = self;
    v43.super_class = (Class)EMKOverlayView;
    v29 = -[EMKOverlayView initWithFrame:](&v43, sel_initWithFrame_);
    self = v29;
    if (v29)
    {
      [(EMKOverlayView *)v29 bounds];
      double v31 = v30;
      unint64_t v32 = [v14 count];
      unint64_t v33 = vcvtmd_u64_f64((v31 + -4.0 + -20.0 + -32.0) / 40.0);
      if ((double)v32 * 36.0 + 20.0 + (double)(v32 + 1) * 4.0 + 32.0 <= v31) {
        unint64_t v33 = v32;
      }
      if (v33 <= 1) {
        unint64_t v33 = 1;
      }
      if (v33 >= v32) {
        unint64_t v33 = v32;
      }
      if (v33 >= 8) {
        unint64_t v33 = 8;
      }
      self->_numEmojiToShow = v33;
      v34 = (EMKEmojiTokenList *)[v14 copy];
      emojiTokenList = self->_emojiTokenList;
      self->_emojiTokenList = v34;

      self->_overlayRect.origin.double x = overlayRectRelativeToRect(self->_numEmojiToShow, v22, v24, v26, v28, v31);
      self->_overlayRect.origin.double y = v36;
      self->_overlayRect.size.double width = v37;
      self->_overlayRect.size.double height = v38;
      self->_selectedIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      v39 = (void *)[v15 copy];
      id selectionHandler = self->_selectionHandler;
      self->_id selectionHandler = v39;

      v41 = [v16 traitCollection];
      self->_interfaceStyle = [v41 userInterfaceStyle];

      [(EMKOverlayView *)self setOpaque:0];
      [v18 addSubview:self];
      [v18 bringSubviewToFront:self];
    }
  }

  return self;
}

- (void)setView:(id)a3 anchorRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v23 = [(EMKOverlayView *)self superview];
  objc_msgSend(v23, "convertRect:fromView:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [v23 bounds];
  -[EMKOverlayView setFrame:](self, "setFrame:");
  unint64_t numEmojiToShow = self->_numEmojiToShow;
  [(EMKOverlayView *)self bounds];
  self->_overlayRect.origin.double x = overlayRectRelativeToRect(numEmojiToShow, v11, v13, v15, v17, v19);
  self->_overlayRect.origin.double y = v20;
  self->_overlayRect.size.double width = v21;
  self->_overlayRect.size.double height = v22;
  [(EMKOverlayView *)self setNeedsDisplay];
}

- (void)drawBackground:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", self->_overlayRect.origin.x, self->_overlayRect.origin.y, self->_overlayRect.size.width, self->_overlayRect.size.height, 9.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setLineWidth:0.2];
  v11.double width = 0.0;
  v11.double height = 5.0;
  CGContextSetShadow(CurrentContext, v11, 7.0);
  if (self->_interfaceStyle == 2) {
    darkBackgroundColor();
  }
  else {
  v5 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  [v5 set];

  [v9 fill];
  v12.double width = 0.0;
  v12.double height = 0.0;
  CGContextSetShadowWithColor(CurrentContext, v12, 0.0, 0);
  if (self->_interfaceStyle == 2) {
    darkBackgroundColor();
  }
  else {
  v6 = [MEMORY[0x1E4F428B8] lightGrayColor];
  }
  [v6 set];

  [v9 stroke];
  selectedIndedouble x = self->_selectedIndex;
  if (selectedIndex < self->_numEmojiToShow)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", (double)selectedIndex * 36.0 + 10.0 + (double)(selectedIndex + 1) * 4.0 + self->_overlayRect.origin.x, self->_overlayRect.origin.y + 6.0, 36.0, 43.0, 6.0);
    if (selectionColor_onceToken != -1) {
      dispatch_once(&selectionColor_onceToken, &__block_literal_global_34);
    }
    [(id)selectionColor_color set];
    [v8 fill];
  }
}

- (void)drawForeground:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", 32.0, a3.origin.y, a3.size.width, a3.size.height);
  v14[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v6 = [MEMORY[0x1E4F428B8] blackColor];
  [v6 set];

  if (self->_numEmojiToShow)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = v7 + 1;
      double v9 = (double)v7 * 36.0 + 10.0 + (double)(v7 + 1) * 4.0 + self->_overlayRect.origin.x + 1.0;
      CGFloat v10 = self->_overlayRect.origin.y + 6.0 + 2.0;
      CGSize v11 = -[EMKEmojiTokenList emojiTokenAtIndex:](self->_emojiTokenList, "emojiTokenAtIndex:");
      CGSize v12 = [v11 string];
      objc_msgSend(v12, "drawInRect:withAttributes:", v5, v9, v10, 36.0, 43.0);

      unint64_t v7 = v8;
    }
    while (v8 < self->_numEmojiToShow);
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[EMKOverlayView drawBackground:](self, "drawBackground:");
  -[EMKOverlayView drawForeground:](self, "drawForeground:", x, y, width, height);
}

- (void)dismissWithSelectedEmojiToken:(id)a3
{
  (*((void (**)(void))self->_selectionHandler + 2))();
  [(EMKOverlayView *)self removeFromSuperview];
}

- (void)dismiss
{
}

- (void)selectWithEvent:(id)a3
{
  v4 = [a3 touchesForView:self];
  id v10 = [v4 anyObject];

  v5 = v10;
  if (v10)
  {
    [v10 locationInView:self];
    double v7 = v6;
    v12.double y = v8;
    self->_selectedIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    v12.double x = v6;
    if (CGRectContainsPoint(self->_overlayRect, v12))
    {
      unint64_t v9 = vcvtmd_u64_f64((v7 - self->_overlayRect.origin.x + -10.0 + -2.0) / 40.0);
      if ((v9 & 0x8000000000000000) == 0 && self->_numEmojiToShow > v9) {
        self->_selectedIndedouble x = v9;
      }
    }
    [(EMKOverlayView *)self setNeedsDisplay];
    v5 = v10;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5 = [a4 touchesForView:self];
  id v11 = [v5 anyObject];

  [v11 locationInView:self];
  double v7 = v6;
  v13.double y = v8;
  v13.double x = v6;
  if (!CGRectContainsPoint(self->_overlayRect, v13)
    || (unint64_t v9 = vcvtmd_u64_f64((v7 - self->_overlayRect.origin.x + -10.0 + -2.0) / 40.0), (v9 & 0x8000000000000000) != 0)
    || self->_numEmojiToShow <= v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = -[EMKEmojiTokenList emojiTokenAtIndex:](self->_emojiTokenList, "emojiTokenAtIndex:");
  }
  [(EMKOverlayView *)self dismissWithSelectedEmojiToken:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_emojiTokenList, 0);
}

@end