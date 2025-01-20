@interface EKDayTimeContentView
- (EKDayTimeContentView)init;
- (EKDayTimeView)owner;
- (_NSRange)hourRange;
- (void)drawRect:(CGRect)a3;
- (void)setHourRange:(_NSRange)a3;
- (void)setOwner:(id)a3;
@end

@implementation EKDayTimeContentView

- (void)setHourRange:(_NSRange)a3
{
  self->_hourRange = a3;
}

- (void)setOwner:(id)a3
{
  self->_owner = (EKDayTimeView *)a3;
}

- (EKDayTimeContentView)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKDayTimeContentView;
  v2 = [(EKDayTimeContentView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(EKDayTimeContentView *)v2 layer];
    [v4 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.enableContext"];
    [v4 setNeedsDisplay];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  owner = self->_owner;
  uint64_t v10 = [(EKDayTimeContentView *)self hourRange];

  -[EKDayTimeView drawRect:forContentView:withHourRange:](owner, "drawRect:forContentView:withHourRange:", self, v10, v9, x, y, width, height);
}

- (_NSRange)hourRange
{
  p_hourRange = &self->_hourRange;
  NSUInteger location = self->_hourRange.location;
  NSUInteger length = p_hourRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (EKDayTimeView)owner
{
  return self->_owner;
}

@end