@interface DiagnosticsReporter
- (void)errorDidOccur:(id)a3;
- (void)incidentsDidOccur:(id)a3;
@end

@implementation DiagnosticsReporter

- (void)errorDidOccur:(id)a3
{
  uint64_t v3 = sub_100755B70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  swift_retain();
  uint64_t v8 = sub_1007603C0();
  if (v8)
  {
    sub_1006E53D4(v8);
    swift_errorRelease();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)incidentsDidOccur:(id)a3
{
  uint64_t v3 = sub_100755B70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  swift_retain();
  uint64_t v8 = sub_100760400();
  if (v8)
  {
    sub_1006E5D9C(v8);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end