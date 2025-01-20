@interface ISSymbolImageDescriptor
- (int64_t)weight;
- (unint64_t)size;
- (void)setSize:(unint64_t)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation ISSymbolImageDescriptor

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

@end