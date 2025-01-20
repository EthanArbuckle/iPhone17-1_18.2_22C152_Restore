@interface SFPrintPageRenderer
- (BOOL)printFooter;
- (NSString)URLString;
- (SFPrintPageRenderer)init;
- (SFPrintPageRendererDelegate)delegate;
- (UIPrintFormatter)contentFormatter;
- (id)printInteractionControllerParentViewController:(id)a3;
- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)printInteractionControllerDidFinishJob:(id)a3;
- (void)printInteractionControllerWillStartJob:(id)a3;
- (void)setContentFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrintFooter:(BOOL)a3;
- (void)setURLString:(id)a3;
@end

@implementation SFPrintPageRenderer

- (SFPrintPageRenderer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SFPrintPageRenderer;
  v2 = [(SFPrintPageRenderer *)&v11 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v3;

    [(NSNumberFormatter *)v2->_numberFormatter setNumberStyle:0];
    uint64_t v5 = [MEMORY[0x1E4FB1798] systemFontOfSize:7.0];
    footerFont = v2->_footerFont;
    v2->_footerFont = (UIFont *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    footerColor = v2->_footerColor;
    v2->_footerColor = (UIColor *)v7;

    v2->_printFooter = 1;
    v9 = v2;
  }

  return v2;
}

- (void)setContentFormatter:(id)a3
{
  uint64_t v5 = (UIPrintFormatter *)a3;
  contentFormatter = self->_contentFormatter;
  if (contentFormatter != v5)
  {
    uint64_t v7 = v5;
    [(UIPrintFormatter *)contentFormatter removeFromPrintPageRenderer];
    objc_storeStrong((id *)&self->_contentFormatter, a3);
    uint64_t v5 = v7;
    if (self->_contentFormatter)
    {
      [(UIPrintPageRenderer *)self addPrintFormatter:v7 startingAtPageAtIndex:0];
      uint64_t v5 = v7;
    }
  }
}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  if (self->_printFooter)
  {
    [(UIColor *)self->_footerColor set];
    -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_URLString, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_footerFont, 5, self->_footerOffset.x, self->_footerOffset.y, self->_URLWidth);
    [(NSString *)self->_dateString _legacy_drawAtPoint:self->_footerFont forWidth:2 withFont:self->_footerOffset.x + self->_printWidth - self->_dateWidth lineBreakMode:self->_footerOffset.y];
    numberFormatter = self->_numberFormatter;
    uint64_t v7 = [NSNumber numberWithLong:a3 + 1];
    id v19 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v7];

    v8 = self->_numberFormatter;
    v9 = objc_msgSend(NSNumber, "numberWithLong:", -[UIPrintPageRenderer numberOfPages](self, "numberOfPages"));
    v10 = [(NSNumberFormatter *)v8 stringFromNumber:v9];

    objc_super v11 = NSString;
    v12 = _WBSLocalizedString();
    v13 = objc_msgSend(v11, "stringWithFormat:", v12, v19, v10, 0);

    objc_msgSend(v13, "_legacy_sizeWithFont:", self->_footerFont);
    double v15 = v14;
    double y = self->_footerOffset.y;
    CGFloat v17 = self->_footerOffset.x + self->_printWidth - v14;
    [(UIFont *)self->_footerFont lineHeight];
    objc_msgSend(v13, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_footerFont, 2, v17, y + v18, v15);
  }
}

- (void)printInteractionControllerWillStartJob:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  v4 = [v31 printPaper];
  [v4 paperSize];
  double v6 = v5;
  double v8 = v7;
  [v4 printableRect];
  CGFloat x = v38.origin.x;
  double y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  CGFloat v33 = v38.origin.x;
  CGFloat v34 = v38.origin.y;
  double v30 = v6;
  double v35 = v6 - CGRectGetMaxX(v38);
  double v13 = 36.0;
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (v13 < *(double *)&v32[i]) {
      double v13 = *(double *)&v32[i];
    }
  }
  double v15 = [v31 printInfo];
  uint64_t v16 = [v15 duplex];

  if (v16)
  {
    v39.origin.CGFloat x = x;
    v39.origin.double y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    if (v13 <= v8 - CGRectGetMaxY(v39))
    {
      v40.origin.CGFloat x = x;
      v40.origin.double y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      double v13 = v8 - CGRectGetMaxY(v40);
    }
  }
  if (self->_printFooter) {
    double v17 = 18.0;
  }
  else {
    double v17 = 0.0;
  }
  if (self->_printFooter) {
    double v18 = 36.0;
  }
  else {
    double v18 = 0.0;
  }
  v41.origin.CGFloat x = x;
  v41.origin.double y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v19 = v8 - CGRectGetMaxY(v41);
  if (v17 >= v19) {
    double v19 = v17;
  }
  if (v19 < v13 - v18) {
    double v19 = v13 - v18;
  }
  if (v19 > y || v16 == 0) {
    double y = v19;
  }
  self->_contentOffset.CGFloat x = v13;
  self->_contentOffset.double y = v13;
  [(UIFont *)self->_footerFont lineHeight];
  self->_footerOffset.CGFloat x = v13;
  self->_footerOffset.double y = v8 - (y + v21 * 2.0);
  if (self->_printFooter) {
    -[UIPrintPageRenderer setFooterHeight:](self, "setFooterHeight:");
  }
  contentFormatter = self->_contentFormatter;
  if (contentFormatter)
  {
    double v23 = 0.0;
    if (!self->_printFooter) {
      double v23 = y;
    }
    -[UIPrintFormatter setPerPageContentInsets:](contentFormatter, "setPerPageContentInsets:", self->_contentOffset.y, self->_contentOffset.x, v23, self->_contentOffset.x);
  }
  self->_printWidth = v30 - (v13 + v13);
  v24 = (void *)MEMORY[0x1E4F28C10];
  v25 = [MEMORY[0x1E4F1C9C8] date];
  v26 = [v24 localizedStringFromDate:v25 dateStyle:1 timeStyle:1];
  dateString = self->_dateString;
  self->_dateString = v26;

  [(NSString *)self->_dateString _legacy_sizeWithFont:self->_footerFont];
  self->_dateWidth = v28;
  [(NSString *)self->_URLString _legacy_sizeWithFont:self->_footerFont forWidth:5 lineBreakMode:self->_printWidth - (v28 + 18.0)];
  self->_URLWidth = v29;
}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = [WeakRetained presentingViewControllerForPrintPageRenderer:self];

  return v5;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
}

- (UIPrintFormatter)contentFormatter
{
  return self->_contentFormatter;
}

- (BOOL)printFooter
{
  return self->_printFooter;
}

- (void)setPrintFooter:(BOOL)a3
{
  self->_printFooter = a3;
}

- (SFPrintPageRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrintPageRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentFormatter, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_footerColor, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_dateString, 0);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end