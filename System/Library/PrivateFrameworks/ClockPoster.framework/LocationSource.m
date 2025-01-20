@interface LocationSource
- (NSString)description;
- (_TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationSource

- (NSString)description
{
  v2 = self;
  sub_24A0446CC();

  v3 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource)init
{
  result = (_TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_distanceFilter;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_249FDB2A8();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion));
  sub_24A04A29C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_249FCFCA0(0, &qword_2697520D8);
  unint64_t v6 = sub_24A057568();
  v7 = (char *)a3;
  v8 = self;
  sub_24A04551C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_24A0497DC(v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A049D6C();
}

@end