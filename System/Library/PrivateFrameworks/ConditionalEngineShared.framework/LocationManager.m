@interface LocationManager
- (_TtC23ConditionalEngineShared15LocationManager)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManager

- (_TtC23ConditionalEngineShared15LocationManager)init
{
  LocationManager.init()();
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_24A705D7C(0, &qword_2697B3508);
  unint64_t v6 = sub_24A762F38();
  id v7 = a3;
  v8 = self;
  sub_24A70F190(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_24A70F494(v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5 = sub_24A704710(&qword_2697B3440);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A763008();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_24A762FE8();
  v9 = self;
  id v10 = a3;
  uint64_t v11 = sub_24A762FD8();
  v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  sub_24A70DA08((uint64_t)v7, (uint64_t)&unk_2697B3500, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  sub_24A70FD54((uint64_t)self + OBJC_IVAR____TtC23ConditionalEngineShared15LocationManager_locationContinuation, &qword_2697B3510);
}

@end