@interface BlastDoorSatelliteSMSTextMessage
- (BlastDoorSatelliteSMSTextMessage)init;
- (NSArray)plainTextBodies;
- (NSString)description;
@end

@implementation BlastDoorSatelliteSMSTextMessage

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)plainTextBodies
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSatelliteSMSTextMessage_satelliteSMSTextMessage))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BlastDoorSatelliteSMSTextMessage)init
{
  result = (BlastDoorSatelliteSMSTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end