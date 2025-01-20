@interface _MUImpressionUIElement
- (CGRect)frame;
- (MUImpressionElement)clientElement;
- (NSDate)startDate;
- (int64_t)state;
- (void)setClientElement:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _MUImpressionUIElement

- (MUImpressionElement)clientElement
{
  return self->_clientElement;
}

- (void)setClientElement:(id)a3
{
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_clientElement, 0);
}

@end