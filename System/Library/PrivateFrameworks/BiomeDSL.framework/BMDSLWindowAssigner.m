@interface BMDSLWindowAssigner
- (id)bpsWindowAssigner;
@end

@implementation BMDSLWindowAssigner

- (id)bpsWindowAssigner
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];

  __break(1u);
  return result;
}

@end