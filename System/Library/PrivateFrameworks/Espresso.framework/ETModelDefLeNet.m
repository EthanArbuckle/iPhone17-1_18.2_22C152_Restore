@interface ETModelDefLeNet
- (int)output_size;
- (void)setOutput_size:(int)a3;
@end

@implementation ETModelDefLeNet

- (void)setOutput_size:(int)a3
{
  self->_output_size = a3;
}

- (int)output_size
{
  return self->_output_size;
}

@end