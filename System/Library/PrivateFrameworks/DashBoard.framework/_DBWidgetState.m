@interface _DBWidgetState
- (BOOL)wantsLargeSize;
- (UIView)view;
- (void)setView:(id)a3;
- (void)setWantsLargeSize:(BOOL)a3;
@end

@implementation _DBWidgetState

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (BOOL)wantsLargeSize
{
  return self->_wantsLargeSize;
}

- (void)setWantsLargeSize:(BOOL)a3
{
  self->_wantsLargeSize = a3;
}

- (void).cxx_destruct
{
}

@end