@interface BKSMousePointerSuppressionAssertionDescriptor
- (unint64_t)suppressionOptions;
- (void)setSuppressionOptions:(unint64_t)a3;
@end

@implementation BKSMousePointerSuppressionAssertionDescriptor

- (void)setSuppressionOptions:(unint64_t)a3
{
  self->_suppressionOptions = a3;
}

- (unint64_t)suppressionOptions
{
  return self->_suppressionOptions;
}

@end