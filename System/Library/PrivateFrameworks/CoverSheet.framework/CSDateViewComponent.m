@interface CSDateViewComponent
- (BOOL)hidesTime;
- (BOOL)stretch;
- (CSDateViewComponent)init;
- (NSNumber)pageIndex;
- (id)_pageIndexForInternalPageIndex:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hidesTime:(BOOL)a3;
- (id)pageIndex:(id)a3;
- (id)vibrantAndCentered:(int64_t)a3;
- (uint64_t)_internalPageIndexForPageIndex:(uint64_t)result;
- (void)_internalPageIndex;
- (void)_setValueForInternalPageIndex:(int)a3 hidesTime:;
- (void)setHidesTime:(BOOL)a3;
- (void)setPageIndex:(id)a3;
- (void)setStretch:(BOOL)a3;
- (void)setVibrantAndCentered:(int64_t)a3;
@end

@implementation CSDateViewComponent

- (CSDateViewComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSDateViewComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:1];
    [(CSDateViewComponent *)v3 setVibrantAndCentered:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (id)pageIndex:(id)a3
{
  return self;
}

- (id)vibrantAndCentered:(int64_t)a3
{
  return self;
}

- (id)hidesTime:(BOOL)a3
{
  return self;
}

- (void)setPageIndex:(id)a3
{
  id v9 = a3;
  v4 = [(CSDateViewComponent *)self pageIndex];
  char v5 = [v9 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    if (self)
    {
      uint64_t v6 = [v9 integerValue];
      if ((unint64_t)(v6 - 2) < 0xFFFFFFFFFFFFFFFDLL || v9 == 0) {
        char v8 = 0;
      }
      else {
        char v8 = v6 + 2;
      }
    }
    else
    {
      char v8 = 0;
    }
    -[CSDateViewComponent _setValueForInternalPageIndex:hidesTime:](self, v8, [(CSDateViewComponent *)self hidesTime]);
  }
}

- (uint64_t)_internalPageIndexForPageIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = [a2 integerValue];
    if ((unint64_t)(v3 - 2) < 0xFFFFFFFFFFFFFFFDLL || a2 == 0) {
      return 0;
    }
    else {
      return v3 + 2;
    }
  }
  return result;
}

- (void)_setValueForInternalPageIndex:(int)a3 hidesTime:
{
  if (a1)
  {
    if (a3) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = [NSNumber numberWithUnsignedInteger:v4 & 0xFFFFFFFFFFFFFFFCLL | a2 & 3];
    [a1 setValue:v5];
  }
}

- (void)setHidesTime:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDateViewComponent *)self hidesTime] != a3
    || ![(CSComponent *)self hasValueForProperty:4])
  {
    char v5 = -[CSDateViewComponent _internalPageIndex](self);
    -[CSDateViewComponent _setValueForInternalPageIndex:hidesTime:](self, v5, v3);
  }
}

- (void)_internalPageIndex
{
  if (result)
  {
    v1 = [result value];
    char v2 = [v1 unsignedIntegerValue];

    return (void *)(v2 & 3);
  }
  return result;
}

- (void)setVibrantAndCentered:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

- (NSNumber)pageIndex
{
  BOOL v3 = -[CSDateViewComponent _internalPageIndex](self);

  return (NSNumber *)-[CSDateViewComponent _pageIndexForInternalPageIndex:]((uint64_t)self, (uint64_t)v3);
}

- (id)_pageIndexForInternalPageIndex:(uint64_t)a1
{
  char v5 = 0;
  if (a1 && (unint64_t)(a2 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    char v5 = objc_msgSend(NSNumber, "numberWithInteger:", a2 - 2, v2);
  }
  return v5;
}

- (BOOL)hidesTime
{
  uint64_t v2 = [(CSComponent *)self value];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return (v3 >> 2) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDateViewComponent;
  id v4 = [(CSComponent *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setStretch:", -[CSDateViewComponent stretch](self, "stretch"));
  return v4;
}

- (BOOL)stretch
{
  return self->_stretch;
}

- (void)setStretch:(BOOL)a3
{
  self->_stretch = a3;
}

@end