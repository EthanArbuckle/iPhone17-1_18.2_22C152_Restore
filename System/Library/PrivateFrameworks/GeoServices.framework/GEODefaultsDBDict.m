@interface GEODefaultsDBDict
+ (id)dbValue:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation GEODefaultsDBDict

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (unint64_t)count
{
  return [self->super.super._value count];
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[self->super.super._value objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

+ (id)dbValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = (void *)[v4 initWithParent:v3 type:@"dict" value:v5];

  return v6;
}

@end