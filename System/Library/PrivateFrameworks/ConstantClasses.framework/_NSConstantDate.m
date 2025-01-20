@interface _NSConstantDate
+ (id)alloc;
- (double)timeIntervalSinceReferenceDate;
- (unint64_t)retainCount;
- (void)dealloc;
@end

@implementation _NSConstantDate

- (unint64_t)retainCount
{
  return 1;
}

+ (id)alloc
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"Calling Alloc on %@ is not allowed", NSStringFromClass(v4) format];
  return 0;
}

- (void)dealloc
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"Calling Dealloc on %@ is not allowed", NSStringFromClass(v4) format];
}

- (double)timeIntervalSinceReferenceDate
{
  return *(double *)&self[1].super.super.isa;
}

@end