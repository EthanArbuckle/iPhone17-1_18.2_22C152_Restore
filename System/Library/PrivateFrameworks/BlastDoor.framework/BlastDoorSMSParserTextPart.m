@interface BlastDoorSMSParserTextPart
- (BlastDoorSMSParserTextPart)init;
- (NSString)contentLocation;
- (NSString)description;
- (NSString)text;
@end

@implementation BlastDoorSMSParserTextPart

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)contentLocation
{
  return (NSString *)sub_1B17AA7A8();
}

- (NSString)text
{
  return (NSString *)sub_1B17A7844();
}

- (BlastDoorSMSParserTextPart)init
{
  result = (BlastDoorSMSParserTextPart *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end