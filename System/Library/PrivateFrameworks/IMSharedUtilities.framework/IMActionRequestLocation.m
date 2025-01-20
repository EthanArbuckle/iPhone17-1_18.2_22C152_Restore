@interface IMActionRequestLocation
- (BOOL)sendPush;
- (IMActionRequestLocation)init;
- (IMActionRequestLocation)initWithDictionary:(id)a3;
- (IMActionRequestLocation)initWithSendPush:(BOOL)a3;
- (id)dictionaryRepresentation;
@end

@implementation IMActionRequestLocation

- (BOOL)sendPush
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMActionRequestLocation_sendPush);
}

- (IMActionRequestLocation)initWithSendPush:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___IMActionRequestLocation_sendPush) = a3;
  v4.receiver = self;
  v4.super_class = (Class)IMActionRequestLocation;
  return [(IMActionRequestLocation *)&v4 init];
}

- (IMActionRequestLocation)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionRequestLocation *)IMActionRequestLocation.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = 0x68737550646E6573;
  *(void *)(inited + 40) = 0xE800000000000000;
  objc_super v4 = self;
  [(IMActionRequestLocation *)v4 sendPush];
  uint64_t v5 = sub_1A09F40F8();
  *(void *)(inited + 72) = sub_1A078231C(0, (unint64_t *)&qword_1EB4A59B8);
  *(void *)(inited + 48) = v5;
  sub_1A08D7480(inited);

  v6 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v6;
}

- (IMActionRequestLocation)init
{
  result = (IMActionRequestLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end