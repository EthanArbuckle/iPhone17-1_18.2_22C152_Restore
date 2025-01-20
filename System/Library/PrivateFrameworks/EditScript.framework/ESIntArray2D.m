@interface ESIntArray2D
+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4;
- (BOOL)shouldBoundsCheck;
- (ESIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (id)description;
- (int64_t):(unint64_t)a3 :(unint64_t)a4;
- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5;
- (unint64_t)iSize;
- (unint64_t)jSize;
- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5;
- (void)dealloc;
- (void)setShouldBoundsCheck:(BOOL)a3;
@end

@implementation ESIntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v4 = [[ESIntArray2D alloc] initWithISize:a3 jSize:a4];
  return v4;
}

- (void)dealloc
{
  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)ESIntArray2D;
  [(ESIntArray2D *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F089D8] stringWithCapacity:3 * self->_iSize + 3 + (3 * self->_iSize + 3) * self->_jSize];
  unint64_t jSize = self->_jSize;
  unint64_t v5 = self->_iSize + 1;
  if (v5 <= jSize + 1) {
    unint64_t v5 = jSize + 1;
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%%0%ldld ", (uint64_t)(log10((double)v5) + 1.0));
  if (self->_jSize)
  {
    unint64_t v7 = 0;
    do
    {
      if (self->_iSize)
      {
        unint64_t v8 = 0;
        do
          objc_msgSend(v3, "appendFormat:", v6, -[ESIntArray2D ::](self, "::", v8++, v7));
        while (v8 < self->_iSize);
      }
      [v3 appendString:@"\n"];
      ++v7;
    }
    while (v7 < self->_jSize);
  }

  return v3;
}

- (ESIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ESIntArray2D;
  v6 = [(ESIntArray2D *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_iSize = a3;
    v6->_unint64_t jSize = a4;
    v6->_arrayData = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (!-[ESIntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:")) {
    return a5;
  }
  return [(ESIntArray2D *)self :a3 :a4];
}

- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5
{
  self->_arrayData[a3 + self->_iSize * a4] = a5;
}

- (unint64_t)iSize
{
  return self->_iSize;
}

- (unint64_t)jSize
{
  return self->_jSize;
}

- (BOOL)shouldBoundsCheck
{
  return self->_shouldBoundsCheck;
}

- (void)setShouldBoundsCheck:(BOOL)a3
{
  self->_shouldBoundsCheck = a3;
}

@end