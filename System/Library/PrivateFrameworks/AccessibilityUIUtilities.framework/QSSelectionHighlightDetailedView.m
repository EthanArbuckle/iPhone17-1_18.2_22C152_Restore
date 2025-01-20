@interface QSSelectionHighlightDetailedView
- (BOOL)sentenceHighlight;
- (CGRect)displayRect;
- (UIColor)selectionColor;
- (UIColor)underlineColor;
- (void)drawRect:(CGRect)a3;
- (void)setDisplayRect:(CGRect)a3;
- (void)setSelectionColor:(id)a3;
- (void)setSentenceHighlight:(BOOL)a3;
- (void)setUnderlineColor:(id)a3;
@end

@implementation QSSelectionHighlightDetailedView

- (void)setDisplayRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_displayRect = &self->_displayRect;
  BOOL v9 = CGRectEqualToRect(self->_displayRect, a3);
  p_displayRect->origin.double x = x;
  p_displayRect->origin.double y = y;
  p_displayRect->size.double width = width;
  p_displayRect->size.double height = height;
  -[QSSelectionHighlightDetailedView setFrame:](self, "setFrame:", x, y, width, height);
  if (!v9)
  {
    [(QSSelectionHighlightDetailedView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [MEMORY[0x1E4F49458] sharedInstance];
  uint64_t v9 = [v8 quickSpeakHighlightOption];

  if (![(QSSelectionHighlightDetailedView *)self sentenceHighlight])
  {
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
      return;
    }
    v14 = [(QSSelectionHighlightDetailedView *)self selectionColor];
    [v14 setFill];

    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x, y, width, height);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [v22 fill];
    goto LABEL_8;
  }
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return;
  }
  v10 = [MEMORY[0x1E4F49458] sharedInstance];
  uint64_t v11 = [v10 quickSpeakSentenceHighlightOption];

  if (v11 != 2)
  {
    if (v11 != 1) {
      return;
    }
    v12 = [(QSSelectionHighlightDetailedView *)self underlineColor];
    [v12 setStroke];

    id v22 = [MEMORY[0x1E4FB14C0] bezierPath];
    [v22 setLineWidth:1.0];
    [v22 setLineCapStyle:1];
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    objc_msgSend(v22, "moveToPoint:", x, CGRectGetMaxY(v24) + -1.0);
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    double MaxX = CGRectGetMaxX(v25);
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    objc_msgSend(v22, "addLineToPoint:", MaxX, CGRectGetMaxY(v26) + -1.0);
    [v22 stroke];
    goto LABEL_8;
  }
  if (v9 == 3)
  {
    v16 = [MEMORY[0x1E4F49458] sharedInstance];
    uint64_t v17 = [v16 quickSpeakSentenceHighlightColor];

    v15 = [(QSSelectionHighlightDetailedView *)self selectionColor];
    if (!v17)
    {
      id v18 = v15;
      v19 = (CGColor *)[v18 CGColor];

      Components = CGColorGetComponents(v19);
      v15 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 - *Components green:1.0 - Components[1] blue:1.0 - Components[2] alpha:CGColorGetAlpha(v19) + 0.1];
    }
  }
  else
  {
    if (v9 != 2) {
      return;
    }
    v15 = [(QSSelectionHighlightDetailedView *)self selectionColor];
  }
  if (v15)
  {
    id v22 = v15;
    [v15 setFill];
    v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x, y, width, height);
    [v21 fill];

LABEL_8:
  }
}

- (CGRect)displayRect
{
  double x = self->_displayRect.origin.x;
  double y = self->_displayRect.origin.y;
  double width = self->_displayRect.size.width;
  double height = self->_displayRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)sentenceHighlight
{
  return self->_sentenceHighlight;
}

- (void)setSentenceHighlight:(BOOL)a3
{
  self->_sentenceHighlight = a3;
}

- (UIColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (void)setSelectionColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionColor, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
}

@end