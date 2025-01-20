@interface InAppMessagesMetricsDelegate
- (_TtC22SubscribePageExtension28InAppMessagesMetricsDelegate)init;
- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4;
@end

@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  v22 = self;
  uint64_t v23 = sub_100767040();
  uint64_t v5 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100766CC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1007669C0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100767480();
  id v21 = a3;
  v19 = v22;
  swift_bridgeObjectRetain();
  sub_1007669B0();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, (uint64_t)v19 + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesMetricsDelegate_metricsPipeline, v9);
  sub_100767020();
  sub_100766CB0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v23);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);

  swift_bridgeObjectRelease();
}

- (_TtC22SubscribePageExtension28InAppMessagesMetricsDelegate)init
{
  result = (_TtC22SubscribePageExtension28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28InAppMessagesMetricsDelegate_metricsPipeline;
  uint64_t v3 = sub_100766CC0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end