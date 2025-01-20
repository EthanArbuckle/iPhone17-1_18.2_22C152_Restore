@interface _NS128bitWrapper
- (BOOL)isEqual:(id)a3;
- (char)initWithBytes:(char *)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation _NS128bitWrapper

- (char)initWithBytes:(char *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NS128bitWrapper;
    result = (char *)objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      if (a2)
      {
        *(_OWORD *)(result + 8) = *a2;
      }
      else
      {

        return 0;
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->bits.high64 == *((void *)a3 + 1)
      && self->bits.low64 == *((void *)a3 + 2);
}

- (unint64_t)hash
{
  return CFHashBytes();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  return self;
}

- (id)description
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _double_quad_uint bits = self->bits;
  uuid_unparse((const unsigned __int8 *)&bits, out);
  return (id)[NSString stringWithUTF8String:out];
}

- (int64_t)compare:(id)a3
{
  int64_t high64 = self->bits.high64;
  int64_t v4 = *((void *)a3 + 1);
  if (high64 == v4)
  {
    int64_t high64 = self->bits.low64;
    int64_t v4 = *((void *)a3 + 2);
  }
  BOOL v5 = high64 < v4;
  BOOL v6 = high64 > v4;
  uint64_t v7 = v5;
  return v6 - v7;
}

@end