@interface DiagnosticsReporter
- (void)errorDidOccur:(id)a3;
- (void)incidentsDidOccur:(id)a3;
@end

@implementation DiagnosticsReporter

- (void)errorDidOccur:(id)a3
{
  uint64_t v3 = sub_100769D10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100769CE0();
  swift_retain();
  uint64_t v7 = sub_1007749B0();
  if (v7)
  {
    sub_1007287E4(v7);
    swift_errorRelease();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)incidentsDidOccur:(id)a3
{
  uint64_t v3 = sub_100769D10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100769CE0();
  swift_retain();
  uint64_t v7 = sub_1007749F0();
  if (v7)
  {
    sub_1007291AC(v7);
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