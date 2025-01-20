@interface BSMutableIntegerMap
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeObjectForKey:(int64_t)a3;
- (void)setObject:(id)a3 forKey:(int64_t)a4;
@end

@implementation BSMutableIntegerMap

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[BSIntegerMap allocWithZone:](BSIntegerMap, "allocWithZone:");
  v6 = (void *)[(NSMapTable *)self->super._mapTable copyWithZone:a3];
  v7 = -[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&v5->super.isa, v6, self->super._zeroIndexValue);

  return v7;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
}

- (void)removeObjectForKey:(int64_t)a3
{
}

@end