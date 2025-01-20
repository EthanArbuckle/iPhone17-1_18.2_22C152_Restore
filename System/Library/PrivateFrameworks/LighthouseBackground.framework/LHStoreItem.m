@interface LHStoreItem
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC20LighthouseBackground11LHStoreItem)init;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setDataVersion:(unsigned int)a3;
@end

@implementation LHStoreItem

- (unsigned)dataVersion
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion);
  swift_beginAccess();
  return *v2;
}

- (void)setDataVersion:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_254526CC0();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)static LHStoreItem.event(with:dataVersion:)(v6, v8, a4);
  sub_2544E848C(v6, v8);

  return v9;
}

- (id)serialize
{
  v2 = self;
  uint64_t v3 = sub_25451C9A0();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_254526CB0();
    sub_25451DFFC(v3, v5);
  }

  return v6;
}

- (_TtC20LighthouseBackground11LHStoreItem)init
{
  result = (_TtC20LighthouseBackground11LHStoreItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end