@interface EspressoBrickTensorCPU
- (float)rawPointer;
- (void)setRawPointer:(float *)a3;
@end

@implementation EspressoBrickTensorCPU

- (void)setRawPointer:(float *)a3
{
  self->_rawPointer = a3;
}

- (float)rawPointer
{
  return self->_rawPointer;
}

@end