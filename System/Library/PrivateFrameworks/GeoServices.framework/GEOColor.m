@interface GEOColor
- (GEOColor)initWithColor:(id)a3;
- (GEOColor)initWithSystemColor:(int)a3;
- (int)systemColor;
@end

@implementation GEOColor

- (GEOColor)initWithSystemColor:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOColor;
  result = [(GEOColor *)&v5 init];
  if (result) {
    result->_systemColor = a3;
  }
  return result;
}

- (GEOColor)initWithColor:(id)a3
{
  if (a3)
  {
    if (*((unsigned char *)a3 + 20))
    {
      unsigned int v3 = *((_DWORD *)a3 + 4);
      if (v3 - 1 >= 5) {
        a3 = 0;
      }
      else {
        a3 = (id)v3;
      }
    }
    else
    {
      a3 = 0;
    }
  }
  return [(GEOColor *)self initWithSystemColor:a3];
}

- (int)systemColor
{
  return self->_systemColor;
}

@end