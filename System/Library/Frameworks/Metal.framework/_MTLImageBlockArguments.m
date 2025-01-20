@interface _MTLImageBlockArguments
- (unint64_t)height;
- (unint64_t)width;
- (void)setHeight:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation _MTLImageBlockArguments

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

@end