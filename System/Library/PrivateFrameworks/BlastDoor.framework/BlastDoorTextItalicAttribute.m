@interface BlastDoorTextItalicAttribute
- (BlastDoorTextItalicAttribute)init;
- (NSString)description;
- (_NSRange)range;
@end

@implementation BlastDoorTextItalicAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776FA4();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextItalicAttribute_textItalicAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BlastDoorTextItalicAttribute)init
{
  _NSRange result = (BlastDoorTextItalicAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end