@interface BlastDoorLinkIsRichLinkAttribute
- (BOOL)isRichLink;
- (BlastDoorLinkIsRichLinkAttribute)init;
- (NSString)description;
- (_NSRange)range;
@end

@implementation BlastDoorLinkIsRichLinkAttribute

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLinkIsRichLinkAttribute_linkIsRichLinkAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isRichLink
{
  return self->linkIsRichLinkAttribute[OBJC_IVAR___BlastDoorLinkIsRichLinkAttribute_linkIsRichLinkAttribute + 8];
}

- (BlastDoorLinkIsRichLinkAttribute)init
{
  _NSRange result = (BlastDoorLinkIsRichLinkAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end