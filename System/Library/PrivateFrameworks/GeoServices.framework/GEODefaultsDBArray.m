@interface GEODefaultsDBArray
+ (id)dbValue:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation GEODefaultsDBArray

- (unint64_t)count
{
  return [self->super.super._value count];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28FE8] scannerWithString:a4];
  unint64_t v10 = 0;
  if ([v7 scanInteger:&v10])
  {
    unint64_t v8 = v10;
    if ((v10 & 0x8000000000000000) != 0 || v8 >= [self->super.super._value count])
    {
      if (v6) {
        [self->super.super._value addObject:v6];
      }
    }
    else
    {
      id value = self->super.super._value;
      if (v6) {
        [value setObject:v6 atIndexedSubscript:v10];
      }
      else {
        [value removeObjectAtIndex:v10];
      }
    }
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  v4 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  unint64_t v8 = 0;
  v5 = 0;
  if ([v4 scanInteger:&v8])
  {
    unint64_t v6 = v8;
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v6 >= [self->super.super._value count])
      {
        v5 = 0;
      }
      else
      {
        v5 = [self->super.super._value objectAtIndexedSubscript:v8];
      }
    }
  }

  return v5;
}

+ (id)dbValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = (void *)[v4 initWithParent:v3 type:@"arr" value:v5];

  return v6;
}

@end