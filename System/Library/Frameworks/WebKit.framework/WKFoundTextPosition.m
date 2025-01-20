@interface WKFoundTextPosition
+ (id)textPositionWithOffset:(unint64_t)a3 order:(unint64_t)a4;
- (unint64_t)offset;
- (unint64_t)order;
- (void)setOffset:(unint64_t)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation WKFoundTextPosition

+ (id)textPositionWithOffset:(unint64_t)a3 order:(unint64_t)a4
{
  v6 = objc_alloc_init(WKFoundTextPosition);
  [(WKFoundTextPosition *)v6 setOffset:a3];
  [(WKFoundTextPosition *)v6 setOrder:a4];
  v7 = (void *)CFMakeCollectable(v6);

  return v7;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

@end