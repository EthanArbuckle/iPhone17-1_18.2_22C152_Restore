@interface GCDeviceCursor
- (CGRect)frame;
- (GCDeviceCursor)initWithDigital:(BOOL)a3 descriptionName:(id)a4;
- (void)setFrame:(CGRect)a3;
@end

@implementation GCDeviceCursor

- (GCDeviceCursor)initWithDigital:(BOOL)a3 descriptionName:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GCDeviceCursor;
  v4 = [(GCControllerDirectionPad *)&v7 initWithDigital:a3 descriptionName:a4];
  v5 = v4;
  if (v4) {
    -[GCDeviceCursor setFrame:](v4, "setFrame:", -1.0, -1.0, 2.0, 2.0);
  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_frame = &self->_frame;
  if (!CGRectEqualToRect(a3, self->_frame))
  {
    p_frame->origin.CGFloat x = x;
    p_frame->origin.CGFloat y = y;
    p_frame->size.CGFloat width = width;
    p_frame->size.CGFloat height = height;
    v9 = [(GCControllerDirectionPad *)self xAxis];
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    float MinX = CGRectGetMinX(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v19);
    *(float *)&double v12 = MaxX;
    *(float *)&CGFloat MaxX = MinX;
    [v9 setMinValue:MaxX andMaxValue:v12];

    id v16 = [(GCControllerDirectionPad *)self yAxis];
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    float MinY = CGRectGetMinY(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v21);
    *(float *)&double v15 = MaxY;
    *(float *)&CGFloat MaxY = MinY;
    [v16 setMinValue:MaxY andMaxValue:v15];
  }
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

@end