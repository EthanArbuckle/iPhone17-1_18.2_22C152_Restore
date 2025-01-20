@interface HKCountrySetBitmaskPath
+ (id)pathWithBitmask:(unint64_t)a3 index:(int64_t)a4;
- (BOOL)_isEqualToMask:(BOOL)a1;
- (BOOL)isEqual:(id)a3;
- (int64_t)index;
- (unint64_t)bitmask;
- (unint64_t)hash;
@end

@implementation HKCountrySetBitmaskPath

+ (id)pathWithBitmask:(unint64_t)a3 index:(int64_t)a4
{
  v6 = [HKCountrySetBitmaskPath alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)HKCountrySetBitmaskPath;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_bitmask = a3;
      v6->_index = a4;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_index ^ self->_bitmask;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKCountrySetBitmaskPath *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HKCountrySetBitmaskPath _isEqualToMask:]((BOOL)self, v4);
  }

  return v5;
}

- (BOOL)_isEqualToMask:(BOOL)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 index];
    if (v5 == [(id)a1 index])
    {
      uint64_t v6 = [v4 bitmask];
      a1 = v6 == [(id)a1 bitmask];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (unint64_t)bitmask
{
  return self->_bitmask;
}

- (int64_t)index
{
  return self->_index;
}

@end