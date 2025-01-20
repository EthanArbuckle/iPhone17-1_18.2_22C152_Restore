@interface DataBiomeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (_TtC23LighthouseDataProcessor14DataBiomeEvent)init;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setDataVersion:(unsigned int)a3;
@end

@implementation DataBiomeEvent

- (unsigned)dataVersion
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion);
}

- (void)setDataVersion:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion) = a3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = sub_254E14C88();
  uint64_t v8 = v7;

  v9 = (objc_class *)type metadata accessor for DataBiomeEvent();
  v10 = (char *)objc_allocWithZone(v9);
  *(_DWORD *)&v10[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion] = a4;
  v11 = (uint64_t *)&v10[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data];
  uint64_t *v11 = v6;
  v11[1] = v8;
  v14.receiver = v10;
  v14.super_class = v9;
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

- (id)serialize
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data);
  unint64_t v3 = *(void *)&self->dataVersion[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data];
  sub_2545D7BF0(v2, v3);
  v4 = (void *)sub_254E14C68();
  sub_2545DDDFC(v2, v3);

  return v4;
}

- (_TtC23LighthouseDataProcessor14DataBiomeEvent)init
{
  result = (_TtC23LighthouseDataProcessor14DataBiomeEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end