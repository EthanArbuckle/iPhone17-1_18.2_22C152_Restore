@interface NSDate(EDAMAdditions)
+ (uint64_t)dateWithEDAMTimestamp:()EDAMAdditions;
- (uint64_t)edamTimestamp;
@end

@implementation NSDate(EDAMAdditions)

- (uint64_t)edamTimestamp
{
  [a1 timeIntervalSince1970];
  return (uint64_t)(trunc(v1) * 1000.0);
}

+ (uint64_t)dateWithEDAMTimestamp:()EDAMAdditions
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)a3 / 1000.0];
}

@end