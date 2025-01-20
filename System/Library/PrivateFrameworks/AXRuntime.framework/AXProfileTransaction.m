@interface AXProfileTransaction
- (__AXUIElement)element;
- (double)start;
- (int64_t)attribute;
- (void)setAttribute:(int64_t)a3;
- (void)setElement:(__AXUIElement *)a3;
- (void)setStart:(double)a3;
@end

@implementation AXProfileTransaction

- (int64_t)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(int64_t)a3
{
  self->_attribute = a3;
}

- (__AXUIElement)element
{
  return self->_element;
}

- (void)setElement:(__AXUIElement *)a3
{
  self->_element = a3;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

@end