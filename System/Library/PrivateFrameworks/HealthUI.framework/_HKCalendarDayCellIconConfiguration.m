@interface _HKCalendarDayCellIconConfiguration
+ (id)configurationWithDateIndex:(int64_t)a3 color:(id)a4 style:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _HKCalendarDayCellIconConfiguration

+ (id)configurationWithDateIndex:(int64_t)a3 color:(id)a4 style:(int64_t)a5
{
  id v7 = a4;
  v8 = objc_alloc_init((Class)objc_opt_class());
  v9 = (void *)v8[2];
  v8[1] = a3;
  v8[2] = v7;

  v8[3] = a5;
  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_dateIndex];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(UIColor *)self->_color hash] ^ v4;
  v6 = [NSNumber numberWithInteger:self->_style];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t dateIndex = self->_dateIndex,
        uint64_t v6 = v4[1],
        char v7 = [(UIColor *)self->_color isEqual:v4[2]],
        dateIndex == v6))
  {
    if (self->_style == v4[3]) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_HKCalendarDayCellIconConfiguration;
  uint64_t v4 = [(_HKCalendarDayCellIconConfiguration *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: Date Index=%ld, Color=%@, Style=%ld", v4, self->_dateIndex, self->_color, self->_style];

  return v5;
}

- (void).cxx_destruct
{
}

@end