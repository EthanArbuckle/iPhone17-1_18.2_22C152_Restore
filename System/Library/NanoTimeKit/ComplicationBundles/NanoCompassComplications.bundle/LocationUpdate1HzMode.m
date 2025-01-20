@interface LocationUpdate1HzMode
- (BOOL)isEqual:(id)a3;
- (_TtC24NanoCompassComplications21LocationUpdate1HzMode)init;
- (id)identifier;
- (int64_t)hash;
@end

@implementation LocationUpdate1HzMode

- (_TtC24NanoCompassComplications21LocationUpdate1HzMode)init
{
  v2 = (objc_class *)type metadata accessor for LocationUpdate1HzMode();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = &v3[OBJC_IVAR____TtC24NanoCompassComplications21LocationUpdate1HzMode_identifier];
  *(void *)v4 = 0x6E776F6E6B6E55;
  *((void *)v4 + 1) = 0xE700000000000000;
  v7.receiver = v3;
  v7.super_class = v2;
  v5 = [(LocationUpdate1HzMode *)&v7 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (id)identifier
{
  swift_bridgeObjectRetain();
  v0 = (void *)sub_2375D9E80();
  swift_bridgeObjectRelease();

  return v0;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_2375D9EC0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2375D9ED0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = LocationUpdate1HzMode.isEqual(_:)((uint64_t)v8);

  sub_2375D6BA0((uint64_t)v8);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end