@interface InAppMessagesMetricsDelegate
- (_TtC18ASMessagesProvider28InAppMessagesMetricsDelegate)init;
- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4;
@end

@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  v19 = self;
  uint64_t v20 = sub_77D0B0();
  uint64_t v5 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_77CD30();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_77CA30();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77D500();
  id v18 = a3;
  v16 = v19;
  swift_bridgeObjectRetain();
  sub_77CA20();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, (uint64_t)v16 + OBJC_IVAR____TtC18ASMessagesProvider28InAppMessagesMetricsDelegate_metricsPipeline, v8);
  sub_77D090();
  sub_77CD20();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);

  swift_bridgeObjectRelease();
}

- (_TtC18ASMessagesProvider28InAppMessagesMetricsDelegate)init
{
  result = (_TtC18ASMessagesProvider28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28InAppMessagesMetricsDelegate_metricsPipeline;
  uint64_t v3 = sub_77CD30();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end