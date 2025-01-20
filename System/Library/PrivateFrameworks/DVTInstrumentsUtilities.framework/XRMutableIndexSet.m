@interface XRMutableIndexSet
- (id)copyWithZone:(_NSZone *)a3;
- (void)addIndex:(unint64_t)a3;
- (void)addIndexesInRange:(_XRIndexRange)a3;
@end

@implementation XRMutableIndexSet

- (void)addIndex:(unint64_t)a3
{
  p_impl = &self->super._impl;
  *(void *)&long long v5 = a3;
  *((void *)&v5 + 1) = a3;
  sub_23457DEF8((uint64_t)&self->super._impl, &v5);
  self->super._impl._cacheIsValid = 0;
  sub_23457D014((uint64_t)p_impl);
}

- (void)addIndexesInRange:(_XRIndexRange)a3
{
  p_impl = &self->super._impl;
  if (a3.var1)
  {
    *(void *)&long long v5 = a3.var0;
    *((void *)&v5 + 1) = a3.var0 + a3.var1 - 1;
    sub_23457DEF8((uint64_t)&self->super._impl, &v5);
    self->super._impl._cacheIsValid = 0;
  }
  sub_23457D014((uint64_t)p_impl);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = sub_23457D190(v4, self);
  return v4;
}

@end