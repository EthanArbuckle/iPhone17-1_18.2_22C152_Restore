@interface _NSConstantData
+ (id)alloc;
- (const)bytes;
- (unint64_t)length;
- (unint64_t)retainCount;
- (void)dealloc;
@end

@implementation _NSConstantData

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

- (unint64_t)length
{
  return (unint64_t)self[1].super.super.isa;
}

- (const)bytes
{
  return &self[2];
}

@end