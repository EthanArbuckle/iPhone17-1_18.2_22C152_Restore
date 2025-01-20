@interface VirtualInteractionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC24IntelligencePlatformCore23VirtualInteractionEvent)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation VirtualInteractionEvent

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
  sub_1C7780958();
  v9 = v8;
  sub_1C6E355F8(v5, v7);
  return v9;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = sub_1C7780CF4();
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

- (_TtC24IntelligencePlatformCore23VirtualInteractionEvent)init
{
}

- (void).cxx_destruct
{
}

@end