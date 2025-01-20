@interface LocationDelegate
- (_TtC22MercuryPosterExtensionP33_6C370B8E95E1084F848401CE1CB3D33016LocationDelegate)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationDelegate

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100023BA0(v4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v6 = qword_1000978C8;
  id v7 = a3;
  id v8 = a4;
  v13 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10005DCD8();
  sub_100008DB0(v9, (uint64_t)qword_10009FB08);
  v10 = sub_10005DCB8();
  os_log_type_t v11 = sub_10005E078();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "The location manager failed.", v12, 2u);
    swift_slowDealloc();
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_10000991C(0, &qword_100098B88);
  unint64_t v6 = sub_10005DFA8();
  id v7 = a3;
  id v8 = self;
  sub_1000266D4(v6);

  swift_bridgeObjectRelease();
}

- (_TtC22MercuryPosterExtensionP33_6C370B8E95E1084F848401CE1CB3D33016LocationDelegate)init
{
  result = (_TtC22MercuryPosterExtensionP33_6C370B8E95E1084F848401CE1CB3D33016LocationDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end