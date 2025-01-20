@interface SortHueEntry
- (SortHueEntry)initWithHue:(unsigned int)a3 count:(unsigned int)a4;
- (id)description;
- (int64_t)count;
- (int64_t)hue;
- (void)setCount:(int64_t)a3;
- (void)setHue:(int64_t)a3;
@end

@implementation SortHueEntry

- (SortHueEntry)initWithHue:(unsigned int)a3 count:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SortHueEntry;
  v6 = [(SortHueEntry *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(SortHueEntry *)v6 setHue:a3];
    [(SortHueEntry *)v7 setCount:a4];
  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Hue: %ld Count: %ld", -[SortHueEntry hue](self, "hue"), -[SortHueEntry count](self, "count"));
}

- (int64_t)hue
{
  return self->_hue;
}

- (void)setHue:(int64_t)a3
{
  self->_hue = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

@end