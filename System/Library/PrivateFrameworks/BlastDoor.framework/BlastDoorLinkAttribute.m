@interface BlastDoorLinkAttribute
- (BlastDoorLinkAttribute)init;
- (NSString)description;
- (NSURL)link;
- (_NSRange)range;
@end

@implementation BlastDoorLinkAttribute

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for LinkAttribute, &OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute, type metadata accessor for LinkAttribute);
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSURL)link
{
  uint64_t v3 = type metadata accessor for LinkAttribute(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B1969D10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute, (uint64_t)v6, type metadata accessor for LinkAttribute);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, &v6[*(int *)(v4 + 28)], v7);
  v11 = (void *)sub_1B1969C50();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (NSURL *)v11;
}

- (BlastDoorLinkAttribute)init
{
  _NSRange result = (BlastDoorLinkAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end