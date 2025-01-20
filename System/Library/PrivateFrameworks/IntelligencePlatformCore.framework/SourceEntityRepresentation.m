@interface SourceEntityRepresentation
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC24IntelligencePlatformCore26SourceEntityRepresentation)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation SourceEntityRepresentation

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4 = a3;
  uint64_t v5 = sub_1C791F3C0();
  unint64_t v7 = v6;

  swift_getObjCClassMetadata();
  v8 = (void *)static SourceEntityRepresentation.event(with:dataVersion:)();
  sub_1C6E355F8(v5, v7);
  return v8;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = SourceEntityRepresentation.serialize()();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = (void *)sub_1C791F390();
    sub_1C6E2FF68(v3, v5);
  }
  return v6;
}

- (_TtC24IntelligencePlatformCore26SourceEntityRepresentation)init
{
}

- (void).cxx_destruct
{
  sub_1C754380C((uint64_t)self + OBJC_IVAR____TtC24IntelligencePlatformCore26SourceEntityRepresentation_source, (void (*)(void))type metadata accessor for Source);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end