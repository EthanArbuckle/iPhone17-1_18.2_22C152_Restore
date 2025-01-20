@interface String
- (uint64_t):.Iterator._Variant();
@end

@implementation String

- (uint64_t):.Iterator._Variant()
{
  return swift_release();
}

@end