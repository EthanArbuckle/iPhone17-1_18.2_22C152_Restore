@interface PhotosPersonEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC24IntelligencePlatformCore17PhotosPersonEvent)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation PhotosPersonEvent

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_1C791F3C0();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  id v9 = static PhotosPersonEvent.event(with:dataVersion:)(v6, v8, a4);
  sub_1C6E355F8(v6, v8);
  return v9;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = PhotosPersonEvent.serialize()();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_1C791F390();
    sub_1C6E2FF68(v3, v5);
  }
  return v6;
}

- (_TtC24IntelligencePlatformCore17PhotosPersonEvent)init
{
}

- (void).cxx_destruct
{
}

@end