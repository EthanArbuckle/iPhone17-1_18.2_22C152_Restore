@interface DiagnosticsReporter
- (void)errorDidOccur:(id)a3;
- (void)incidentsDidOccur:(id)a3;
@end

@implementation DiagnosticsReporter

- (void)errorDidOccur:(id)a3
{
  uint64_t v3 = sub_76B900();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76B8D0();
  swift_retain();
  uint64_t v7 = sub_776420();
  if (v7)
  {
    sub_501154(v7);
    swift_errorRelease();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)incidentsDidOccur:(id)a3
{
  uint64_t v3 = sub_76B900();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76B8D0();
  swift_retain();
  uint64_t v7 = sub_776460();
  if (v7)
  {
    sub_501B1C(v7);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end