@interface MKTransitIncidentItemCellBackgroundView
- (MKTransitIncidentItemCellBackgroundView)initWithFrame:(CGRect)a3;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (int64_t)position;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)setFillColor:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation MKTransitIncidentItemCellBackgroundView

- (MKTransitIncidentItemCellBackgroundView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  v3 = -[MKTransitIncidentItemCellBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKTransitIncidentItemCellBackgroundView *)v3 setOpaque:0];
    v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 nativeScale];
    v4->_scale = v6;

    v7 = [(MKTransitIncidentItemCellBackgroundView *)v4 traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];
    double v9 = 10.0;
    if (v8 == 5) {
      double v9 = 8.0;
    }
    v4->_cornerRadius = v9;
  }
  return v4;
}

- (void)setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    [(MKTransitIncidentItemCellBackgroundView *)self setNeedsDisplay];
  }
}

- (void)setFillColor:(id)a3
{
  v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_fillColor != v5)
  {
    uint64_t v8 = v5;
    char v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fillColor, a3);
      [(MKTransitIncidentItemCellBackgroundView *)self setNeedsDisplay];
      double v6 = v8;
    }
  }
}

- (void)setStrokeColor:(id)a3
{
  v5 = (UIColor *)a3;
  double v6 = v5;
  if (self->_strokeColor != v5)
  {
    uint64_t v8 = v5;
    char v7 = -[UIColor isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_strokeColor, a3);
      [(MKTransitIncidentItemCellBackgroundView *)self setNeedsDisplay];
      double v6 = v8;
    }
  }
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  [(MKTransitIncidentItemCellBackgroundView *)&v9 didMoveToWindow];
  v3 = [(MKTransitIncidentItemCellBackgroundView *)self window];
  v4 = [v3 screen];
  v5 = v4;
  if (v4)
  {
    [v4 nativeScale];
    self->_scale = v6;
  }
  else
  {
    char v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 nativeScale];
    self->_scale = v8;
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)MKTransitIncidentItemCellBackgroundView;
  -[MKTransitIncidentItemCellBackgroundView drawRect:](&v36, sel_drawRect_);
  double v8 = [(MKTransitIncidentItemCellBackgroundView *)self fillColor];

  if (v8)
  {
    objc_super v9 = [(MKTransitIncidentItemCellBackgroundView *)self fillColor];
    [v9 setFill];
  }
  v10 = [(MKTransitIncidentItemCellBackgroundView *)self strokeColor];

  if (v10)
  {
    objc_super v11 = [(MKTransitIncidentItemCellBackgroundView *)self strokeColor];
    [v11 setStroke];
  }
  double cornerRadius = self->_cornerRadius;
  double scale = self->_scale;
  if (scale == 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = 1.0 / scale;
  }
  switch([(MKTransitIncidentItemCellBackgroundView *)self position])
  {
    case 0:
      v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, cornerRadius, cornerRadius);
      [v15 setLineWidth:v14];
      [v15 fill];
      v16 = [(MKTransitIncidentItemCellBackgroundView *)self strokeColor];

      if (v16) {
        [v15 stroke];
      }
      goto LABEL_19;
    case 1:
      v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, width, height, cornerRadius, cornerRadius);
      [v15 setLineWidth:v14];
      [v15 fill];
      Mutable = CGPathCreateMutable();
      v44.origin.double x = x;
      v44.origin.double y = y;
      v44.size.double width = width;
      v44.size.double height = height;
      double MinX = CGRectGetMinX(v44);
      v45.origin.double x = x;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      double MinY = CGRectGetMinY(v45);
      v46.origin.double x = x;
      v46.origin.double y = y;
      v46.size.double width = width;
      v46.size.double height = height;
      double MaxX = CGRectGetMaxX(v46);
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      CGFloat MaxY = CGRectGetMaxY(v47);
      CGPathMoveToPoint(Mutable, 0, MinX, MaxY);
      CGPathAddLineToPoint(Mutable, 0, MinX, MinY + self->_cornerRadius);
      CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MinX + self->_cornerRadius, MinY, self->_cornerRadius);
      CGPathAddLineToPoint(Mutable, 0, MaxX - self->_cornerRadius, MinY);
      CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MinY + self->_cornerRadius, self->_cornerRadius);
      v22 = Mutable;
      CGFloat v23 = MaxX;
      CGFloat v24 = MaxY;
      goto LABEL_15;
    case 2:
      v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 0, x, y, width, height, cornerRadius, cornerRadius);
      [v15 setLineWidth:v14];
      [v15 fill];
      Mutable = CGPathCreateMutable();
      points.double x = x;
      points.double y = y;
      v48.origin.double x = x;
      v48.origin.double y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      CGFloat v25 = CGRectGetMaxY(v48);
      double v41 = x;
      CGFloat v42 = v25;
      CGPathAddLines(Mutable, 0, &points, 2uLL);
      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      v37.double x = CGRectGetMaxX(v49);
      v37.double y = y;
      v50.origin.double x = x;
      v50.origin.double y = y;
      v50.size.double width = width;
      v50.size.double height = height;
      CGFloat v26 = CGRectGetMaxX(v50);
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      CGFloat v27 = CGRectGetMaxY(v51);
      CGFloat v38 = v26;
      CGFloat v39 = v27;
      CGPathAddLines(Mutable, 0, &v37, 2uLL);
      v28 = [(MKTransitIncidentItemCellBackgroundView *)self strokeColor];

      if (!v28) {
        goto LABEL_18;
      }
      v29 = (void *)MEMORY[0x1E4F427D0];
      goto LABEL_17;
    case 3:
      v15 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, x, y, width, height, cornerRadius, cornerRadius);
      [v15 setLineWidth:v14];
      [v15 fill];
      Mutable = CGPathCreateMutable();
      v52.origin.double x = x;
      v52.origin.double y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      double v30 = CGRectGetMinX(v52);
      v53.origin.double x = x;
      v53.origin.double y = y;
      v53.size.double width = width;
      v53.size.double height = height;
      CGFloat v31 = CGRectGetMinY(v53);
      v54.origin.double x = x;
      v54.origin.double y = y;
      v54.size.double width = width;
      v54.size.double height = height;
      double v32 = CGRectGetMaxX(v54);
      v55.origin.double x = x;
      v55.origin.double y = y;
      v55.size.double width = width;
      v55.size.double height = height;
      double v33 = CGRectGetMaxY(v55);
      CGPathMoveToPoint(Mutable, 0, v30, v31);
      CGPathAddLineToPoint(Mutable, 0, v30, v33 - self->_cornerRadius);
      CGPathAddArcToPoint(Mutable, 0, v30, v33, v30 + self->_cornerRadius, v33, self->_cornerRadius);
      CGPathAddLineToPoint(Mutable, 0, v32 - self->_cornerRadius, v33);
      CGPathAddArcToPoint(Mutable, 0, v32, v33, v32, v33 - self->_cornerRadius, self->_cornerRadius);
      v22 = Mutable;
      CGFloat v23 = v32;
      CGFloat v24 = v31;
LABEL_15:
      CGPathAddLineToPoint(v22, 0, v23, v24);
      v34 = [(MKTransitIncidentItemCellBackgroundView *)self strokeColor];

      if (!v34) {
        goto LABEL_18;
      }
      v29 = (void *)MEMORY[0x1E4F427D0];
LABEL_17:
      v35 = [v29 bezierPathWithCGPath:Mutable];

      [v35 setLineWidth:v14];
      [v35 stroke];
      v15 = v35;
LABEL_18:
      CGPathRelease(Mutable);
LABEL_19:

      return;
    default:
      return;
  }
}

- (int64_t)position
{
  return self->_position;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end