@interface BlastDoorMessagePartAttribute
- (BlastDoorMessagePartAttribute)init;
- (NSString)description;
- (_NSRange)range;
- (unint64_t)partNumber;
@end

@implementation BlastDoorMessagePartAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776230();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMessagePartAttribute_messagePartAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)partNumber
{
  return *(void *)&self->messagePartAttribute[OBJC_IVAR___BlastDoorMessagePartAttribute_messagePartAttribute + 8];
}

- (BlastDoorMessagePartAttribute)init
{
  _NSRange result = (BlastDoorMessagePartAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end