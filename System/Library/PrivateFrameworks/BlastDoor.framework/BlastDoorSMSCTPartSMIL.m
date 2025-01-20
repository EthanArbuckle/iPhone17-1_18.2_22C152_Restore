@interface BlastDoorSMSCTPartSMIL
- (BlastDoorSMSCTPartSMIL)init;
- (NSArray)orderedParts;
- (NSAttributedString)contentBody;
- (NSString)description;
@end

@implementation BlastDoorSMSCTPartSMIL

- (NSString)description
{
  sub_1B11F10B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL));
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSAttributedString)contentBody
{
  return (NSAttributedString *)sub_1B17A1F58((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL);
}

- (NSArray)orderedParts
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B179AAD0, (void (*)(void))type metadata accessor for _ObjCSMSParserPartWrapper);
}

- (BlastDoorSMSCTPartSMIL)init
{
  result = (BlastDoorSMSCTPartSMIL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B11ED660(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL));
  swift_bridgeObjectRelease();
}

@end