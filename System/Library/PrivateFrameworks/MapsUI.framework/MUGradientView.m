@interface MUGradientView
- (BOOL)disableReduceTransparency;
- (BOOL)shouldReduceTransparency;
- (void)setDisableReduceTransparency:(BOOL)a3;
@end

@implementation MUGradientView

- (BOOL)shouldReduceTransparency
{
  if ([(MUGradientView *)self disableReduceTransparency]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MUGradientView;
  return [(_MKGradientView *)&v4 shouldReduceTransparency];
}

- (BOOL)disableReduceTransparency
{
  return self->_disableReduceTransparency;
}

- (void)setDisableReduceTransparency:(BOOL)a3
{
  self->_disableReduceTransparency = a3;
}

@end