@interface NSCoder(MIORangeExtensions)
- (uint64_t)decodeMIORangeForKey:()MIORangeExtensions;
- (void)encodeMIORange:()MIORangeExtensions forKey:;
@end

@implementation NSCoder(MIORangeExtensions)

- (void)encodeMIORange:()MIORangeExtensions forKey:
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v12 = objc_alloc_init(v8);
  v10 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v10 forKeyedSubscript:@"lowerBound"];

  v11 = [NSNumber numberWithInteger:a4];
  [v12 setObject:v11 forKeyedSubscript:@"upperBound"];

  [a1 encodeObject:v12 forKey:v9];
}

- (uint64_t)decodeMIORangeForKey:()MIORangeExtensions
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [a1 decodeObjectOfClasses:v8 forKey:v5];

  v10 = [v9 objectForKeyedSubscript:@"lowerBound"];
  v11 = [v9 objectForKeyedSubscript:@"upperBound"];
  uint64_t v12 = [v10 integerValue];
  [v11 integerValue];

  return v12;
}

@end