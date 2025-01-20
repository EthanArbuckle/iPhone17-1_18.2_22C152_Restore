@interface BlastDoorTextEffectAttribute
- (BlastDoorTextEffectAttribute)init;
- (NSString)description;
- (_NSRange)range;
- (unint64_t)type;
@end

@implementation BlastDoorTextEffectAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776940();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextEffectAttribute_textEffectAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)type
{
  unint64_t result = sub_1B17B263C(self->textEffectAttribute[OBJC_IVAR___BlastDoorTextEffectAttribute_textEffectAttribute + 8]);
  if (v3) {
    __break(1u);
  }
  return result;
}

- (BlastDoorTextEffectAttribute)init
{
  unint64_t result = (BlastDoorTextEffectAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end