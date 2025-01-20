@interface HFEventBuilder(HREAddtions)
- (uint64_t)recommendableObjectsInvolved;
@end

@implementation HFEventBuilder(HREAddtions)

- (uint64_t)recommendableObjectsInvolved
{
  return [MEMORY[0x263EFFA08] set];
}

@end