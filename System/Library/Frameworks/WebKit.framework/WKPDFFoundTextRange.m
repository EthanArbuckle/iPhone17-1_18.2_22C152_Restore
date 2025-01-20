@interface WKPDFFoundTextRange
+ (id)foundTextRangeWithIndex:(unint64_t)a3;
- (BOOL)isEmpty;
- (id)start;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation WKPDFFoundTextRange

+ (id)foundTextRangeWithIndex:(unint64_t)a3
{
  v4 = objc_alloc_init(WKPDFFoundTextRange);
  [(WKPDFFoundTextRange *)v4 setIndex:a3];
  v5 = (void *)CFMakeCollectable(v4);

  return v5;
}

- (id)start
{
  unint64_t v2 = [(WKPDFFoundTextRange *)self index];

  return +[WKPDFFoundTextPosition textPositionWithIndex:v2];
}

- (BOOL)isEmpty
{
  return 0;
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