@interface HUCameraEventSpacerCell
- (BOOL)needsFullDashedLineWidth;
- (BOOL)spansMultipleDays;
- (HUCameraEventSpacerCell)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setNeedsFullDashedLineWidth:(BOOL)a3;
- (void)setSpansMultipleDays:(BOOL)a3;
- (void)updateWithRecordingEvent:(id)a3 previousEvent:(id)a4 spanningMultipleDays:(BOOL)a5;
@end

@implementation HUCameraEventSpacerCell

- (HUCameraEventSpacerCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUCameraEventSpacerCell;
  v3 = -[HUCameraEventSpacerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUCameraEventSpacerCell *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths_0, 2uLL);
  v9 = [MEMORY[0x1E4F427D0] bezierPath];
  [v9 setLineWidth:2.0];
  [v9 setLineCapStyle:1];
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v21);
  objc_msgSend(v9, "moveToPoint:", 0.0, MidY);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.CGFloat height = height;
  float MidX = CGRectGetMidX(v22);
  if ([(HUCameraEventSpacerCell *)self spansMultipleDays])
  {
    objc_msgSend(v9, "moveToPoint:", 2.0, MidY);
    objc_msgSend(v9, "addLineToPoint:", MidX + -3.0, MidY);
    objc_msgSend(v9, "moveToPoint:", MidX + 3.0, MidY);
  }
  BOOL v12 = [(HUCameraEventSpacerCell *)self needsFullDashedLineWidth];
  double v13 = -9.0;
  if (v12) {
    double v13 = 1.0;
  }
  objc_msgSend(v9, "addLineToPoint:", width + v13, MidY);
  double v19 = 0.0;
  double v20 = 0.0;
  double v18 = 0.0;
  v14 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
  [v14 getRed:&v20 green:&v19 blue:&v18 alpha:0];

  v15 = [MEMORY[0x1E4F428B8] colorWithRed:v20 green:v19 blue:v18 alpha:0.35];
  [v15 setStroke];

  [v9 stroke];
  if ([(HUCameraEventSpacerCell *)self spansMultipleDays])
  {
    v16 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", MidX, 7.0, 1.0, 33.0, 2.0);

    v17 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v17 setStroke];

    CGContextSetLineDash(CurrentContext, 0.0, 0, 0);
    [v16 stroke];
    v9 = v16;
  }
}

- (void)updateWithRecordingEvent:(id)a3 previousEvent:(id)a4 spanningMultipleDays:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = [a3 containerType];
  if ([(HUCameraEventSpacerCell *)self spansMultipleDays] != v5
    || (v7 == 2) != [(HUCameraEventSpacerCell *)self needsFullDashedLineWidth])
  {
    [(HUCameraEventSpacerCell *)self setSpansMultipleDays:v5];
    [(HUCameraEventSpacerCell *)self setNeedsFullDashedLineWidth:v7 == 2];
    [(HUCameraEventSpacerCell *)self setNeedsDisplay];
  }
}

- (BOOL)spansMultipleDays
{
  return self->_spansMultipleDays;
}

- (void)setSpansMultipleDays:(BOOL)a3
{
  self->_spansMultipleDays = a3;
}

- (BOOL)needsFullDashedLineWidth
{
  return self->_needsFullDashedLineWidth;
}

- (void)setNeedsFullDashedLineWidth:(BOOL)a3
{
  self->_needsFullDashedLineWidth = a3;
}

@end