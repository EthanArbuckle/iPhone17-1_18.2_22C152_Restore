@interface WKPDFFoundTextPosition
+ (id)textPositionWithIndex:(unint64_t)a3;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation WKPDFFoundTextPosition

+ (id)textPositionWithIndex:(unint64_t)a3
{
  v4 = objc_alloc_init(WKPDFFoundTextPosition);
  [(WKPDFFoundTextPosition *)v4 setIndex:a3];
  v5 = (void *)CFMakeCollectable(v4);

  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end