@interface SKANBlindedData
- (NSString)blindedElement;
- (NSString)privateInput;
- (_TtC9appstored15SKANBlindedData)init;
- (unint64_t)timestamp;
@end

@implementation SKANBlindedData

- (NSString)blindedElement
{
  return (NSString *)sub_100035EDC();
}

- (NSString)privateInput
{
  return (NSString *)sub_100035EDC();
}

- (unint64_t)timestamp
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored15SKANBlindedData_timestamp);
}

- (_TtC9appstored15SKANBlindedData)init
{
  result = (_TtC9appstored15SKANBlindedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end