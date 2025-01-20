@interface NSDictionary
- (int64_t)integerForKey:(id)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5 defaultValue:(int64_t)a6;
@end

@implementation NSDictionary

- (int64_t)integerForKey:(id)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5 defaultValue:(int64_t)a6
{
  v9 = [(NSDictionary *)self objectForKeyedSubscript:a3];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 integerValue];
    if ((uint64_t)v11 <= a5 && (uint64_t)v11 >= a4) {
      a6 = (int64_t)v11;
    }
  }

  return a6;
}

@end