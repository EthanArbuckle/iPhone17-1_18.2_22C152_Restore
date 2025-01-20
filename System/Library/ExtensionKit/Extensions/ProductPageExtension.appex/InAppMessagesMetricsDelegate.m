@interface InAppMessagesMetricsDelegate
- (_TtC20ProductPageExtension28InAppMessagesMetricsDelegate)init;
- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4;
@end

@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  v19 = self;
  uint64_t v20 = sub_10077B6E0();
  uint64_t v5 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10077B360();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10077B060();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10077BB40();
  id v18 = a3;
  v16 = v19;
  swift_bridgeObjectRetain();
  sub_10077B050();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, (uint64_t)v16 + OBJC_IVAR____TtC20ProductPageExtension28InAppMessagesMetricsDelegate_metricsPipeline, v8);
  sub_10077B6C0();
  sub_10077B350();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);

  swift_bridgeObjectRelease();
}

- (_TtC20ProductPageExtension28InAppMessagesMetricsDelegate)init
{
  result = (_TtC20ProductPageExtension28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28InAppMessagesMetricsDelegate_metricsPipeline;
  uint64_t v3 = sub_10077B360();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end