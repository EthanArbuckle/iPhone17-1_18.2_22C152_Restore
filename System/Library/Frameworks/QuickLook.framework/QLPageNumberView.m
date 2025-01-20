@interface QLPageNumberView
- (CGPath)_copyMutablePathForRoundedRect:(CGRect)a3 radius:(double)a4 inverted:(BOOL)a5;
- (QLPageNumberView)initWithFrame:(CGRect)a3;
- (id)_indexFormatter;
- (int64_t)pageCount;
- (int64_t)pageNumber;
- (void)_updateString;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPageCount:(int64_t)a3;
- (void)setPageNumber:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation QLPageNumberView

- (QLPageNumberView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)QLPageNumberView;
  v3 = -[QLPageNumberView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v3->_label;
    v3->_label = v4;

    v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
    v7 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v3->_label setTextColor:v7];

    [(UILabel *)v3->_label setFont:v6];
    [(UILabel *)v3->_label setTextAlignment:1];
    v8 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_label setBackgroundColor:v8];

    [(QLPageNumberView *)v3 addSubview:v3->_label];
    v9 = [MEMORY[0x263F825C8] clearColor];
    [(QLPageNumberView *)v3 setBackgroundColor:v9];
  }
  return v3;
}

- (id)_indexFormatter
{
  indexFormatter = self->_indexFormatter;
  if (!indexFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    v5 = self->_indexFormatter;
    self->_indexFormatter = v4;

    v6 = self->_indexFormatter;
    v7 = [MEMORY[0x263EFF960] currentLocale];
    [(NSNumberFormatter *)v6 setLocale:v7];

    [(NSNumberFormatter *)self->_indexFormatter setGeneratesDecimalNumbers:1];
    [(NSNumberFormatter *)self->_indexFormatter setNumberStyle:1];
    indexFormatter = self->_indexFormatter;
  }

  return indexFormatter;
}

- (void)_updateString
{
  id v10 = [(QLPageNumberView *)self _indexFormatter];
  v3 = [NSNumber numberWithInteger:self->_pageNumber];
  v4 = [v10 stringFromNumber:v3];

  v5 = [NSNumber numberWithInteger:self->_pageCount];
  v6 = [v10 stringFromNumber:v5];

  v7 = NSString;
  v8 = QLLocalizedString();
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, objc_msgSend(v4, "intValue"), objc_msgSend(v6, "intValue"));

  [(UILabel *)self->_label setText:v9];
  [(UILabel *)self->_backgroundLabel setText:v9];
  [(QLPageNumberView *)self setNeedsLayout];
}

- (void)setPageNumber:(int64_t)a3
{
  if (self->_pageNumber != a3)
  {
    self->_pageNumber = a3;
    [(QLPageNumberView *)self _updateString];
    [(QLPageNumberView *)self setNeedsDisplay];
  }
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageCount:(int64_t)a3
{
  if (self->_pageCount != a3)
  {
    self->_pageCount = a3;
    [(QLPageNumberView *)self _updateString];
    [(QLPageNumberView *)self setNeedsDisplay];
  }
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)sizeToFit
{
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label frame];
  [(QLPageNumberView *)self frame];

  -[QLPageNumberView setFrame:](self, "setFrame:");
}

- (void)layoutSubviews
{
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label frame];
  double v4 = v3;
  double v6 = v5;
  -[UILabel setFrame:](self->_label, "setFrame:", 12.0, 6.0);
  backgroundLabel = self->_backgroundLabel;

  -[UILabel setFrame:](backgroundLabel, "setFrame:", 12.0, 7.0, v4, v6);
}

- (CGPath)_copyMutablePathForRoundedRect:(CGRect)a3 radius:(double)a4 inverted:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRect v24 = CGRectInset(v23, a4, a4);
  CGFloat v12 = v24.origin.x;
  double v13 = x + width;
  CGFloat v14 = v24.origin.y;
  double v21 = v24.origin.y + v24.size.height;
  double v22 = v24.origin.x + v24.size.width;
  double v15 = y + height;
  CGPathMoveToPoint(Mutable, 0, v24.origin.x, y);
  if (a5)
  {
    CGPathAddArcToPoint(Mutable, 0, x, y, x, v14, a4);
    CGPathAddLineToPoint(Mutable, 0, x, v21);
    CGPathAddArcToPoint(Mutable, 0, x, v15, v12, v15, a4);
    CGPathAddLineToPoint(Mutable, 0, v22, v15);
    CGPathAddArcToPoint(Mutable, 0, v13, v15, v13, v21, a4);
    CGPathAddLineToPoint(Mutable, 0, v13, v14);
    v16 = Mutable;
    double v17 = x + width;
    CGFloat v18 = y;
    CGFloat v19 = v22;
  }
  else
  {
    CGPathAddLineToPoint(Mutable, 0, v22, y);
    CGPathAddArcToPoint(Mutable, 0, v13, y, v13, v14, a4);
    CGPathAddLineToPoint(Mutable, 0, v13, v21);
    CGPathAddArcToPoint(Mutable, 0, v13, v15, v22, v15, a4);
    CGPathAddLineToPoint(Mutable, 0, v12, v15);
    CGPathAddArcToPoint(Mutable, 0, x, v15, x, v21, a4);
    CGPathAddLineToPoint(Mutable, 0, x, v14);
    v16 = Mutable;
    double v17 = x;
    CGFloat v18 = y;
    CGFloat v19 = v12;
  }
  CGPathAddArcToPoint(v16, 0, v17, v18, v19, y, a4);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v15);
  [(QLPageNumberView *)self bounds];
  CGRect v17 = CGRectInset(v16, 2.0, 2.0);
  v9 = -[QLPageNumberView _copyMutablePathForRoundedRect:radius:inverted:](self, "_copyMutablePathForRoundedRect:radius:inverted:", 0, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height + -3.0, 4.0);
  CGContextAddPath(CurrentContext, v9);
  id v10 = (void *)MEMORY[0x263F825C8];
  objc_super v11 = QLFrameworkBundle();
  CGFloat v12 = [v10 colorNamed:@"QLSquaredLabelBackgroundColor" inBundle:v11 compatibleWithTraitCollection:0];

  id v13 = v12;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);
  CGContextDrawPath(CurrentContext, kCGPathFill);
  CGPathRelease(v9);
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexFormatter, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_backgroundLabel, 0);
}

@end