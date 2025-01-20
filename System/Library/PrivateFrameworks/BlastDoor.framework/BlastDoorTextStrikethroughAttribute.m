@interface BlastDoorTextStrikethroughAttribute
- (BlastDoorTextStrikethroughAttribute)init;
- (NSString)description;
- (_NSRange)range;
@end

@implementation BlastDoorTextStrikethroughAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776FA4();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextStrikethroughAttribute_textStrikethroughAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BlastDoorTextStrikethroughAttribute)init
{
  _NSRange result = (BlastDoorTextStrikethroughAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end