@interface EKDayViewContentGeometryDelegate
- (BOOL)originIsUpperLeft;
- (BOOL)shouldReverseLayoutDirection;
- (CGPoint)pointForDate:(double)a3;
- (CGRect)bounds;
- (CGRect)displayedRect;
- (CGRect)frame;
- (EKDayViewContent)dayViewContent;
- (NSString)description;
- (double)dateForPoint:(CGPoint)a3;
- (double)hourHeight;
- (double)timeWidth;
- (double)topPadding;
- (void)setBounds:(CGRect)a3;
- (void)setDayViewContent:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation EKDayViewContentGeometryDelegate

- (BOOL)originIsUpperLeft
{
  return 1;
}

- (double)dateForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  objc_msgSend(v5, "dateForPoint:", x, y);
  double v7 = v6;

  return v7;
}

- (CGPoint)pointForDate:(double)a3
{
  v4 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  [v4 pointForDate:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)displayedRect
{
  v3 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  [(EKDayViewContentGeometryDelegate *)self frame];
  objc_msgSend(v3, "_occurrencePaddingBetweenDays:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)topPadding
{
  v2 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  v3 = [v2 grid];
  [v3 topPadding];
  double v5 = v4;

  return v5;
}

- (double)timeWidth
{
  v2 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  v3 = [v2 grid];
  [v3 timeWidth];
  double v5 = v4;

  return v5;
}

- (EKDayViewContent)dayViewContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayViewContent);

  return (EKDayViewContent *)WeakRetained;
}

- (double)hourHeight
{
  v2 = [(EKDayViewContentGeometryDelegate *)self dayViewContent];
  v3 = [v2 grid];
  [v3 hourHeight];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldReverseLayoutDirection
{
  return CalTimeDirectionIsLeftToRight() ^ 1;
}

- (void)setDayViewContent:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (NSString)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)EKDayViewContentGeometryDelegate;
  double v4 = [(EKDayViewContentGeometryDelegate *)&v14 description];
  [(EKDayViewContentGeometryDelegate *)self hourHeight];
  uint64_t v6 = v5;
  [(EKDayViewContentGeometryDelegate *)self topPadding];
  uint64_t v8 = v7;
  [(EKDayViewContentGeometryDelegate *)self timeWidth];
  uint64_t v10 = v9;
  [(EKDayViewContentGeometryDelegate *)self displayedRect];
  double v11 = NSStringFromCGRect(v16);
  double v12 = [v3 stringWithFormat:@"%@ %f %f %f %@", v4, v6, v8, v10, v11];

  return (NSString *)v12;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
}

@end