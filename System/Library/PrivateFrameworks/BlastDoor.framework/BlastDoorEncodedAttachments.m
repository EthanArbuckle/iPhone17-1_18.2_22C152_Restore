@interface BlastDoorEncodedAttachments
- (BlastDoorEncodedAttachments)init;
- (NSArray)contents;
- (NSString)description;
@end

@implementation BlastDoorEncodedAttachments

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)contents
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B17839E8, (void (*)(void))type metadata accessor for _ObjCEncodedAttachments_ContentWrapper);
}

- (BlastDoorEncodedAttachments)init
{
  result = (BlastDoorEncodedAttachments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end