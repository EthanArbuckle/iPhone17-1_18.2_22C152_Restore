@interface BlastDoorSMSParserPart
- (BlastDoorSMSParserPart)init;
- (NSArray)attachmentParts;
- (NSArray)textParts;
- (NSString)description;
@end

@implementation BlastDoorSMSParserPart

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)textParts
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B179B170, (void (*)(void))type metadata accessor for _ObjCSMSParserTextPartWrapper);
}

- (NSArray)attachmentParts
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B179B320, (void (*)(void))type metadata accessor for _ObjCSMSParserAttachmentPartWrapper);
}

- (BlastDoorSMSParserPart)init
{
  result = (BlastDoorSMSParserPart *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end