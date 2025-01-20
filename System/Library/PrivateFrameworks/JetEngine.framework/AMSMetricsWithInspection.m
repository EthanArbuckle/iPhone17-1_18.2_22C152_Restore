@interface AMSMetricsWithInspection
- (_TtC9JetEngine24AMSMetricsWithInspection)init;
- (_TtC9JetEngine24AMSMetricsWithInspection)initWithContainerID:(id)a3 bag:(id)a4;
- (_TtC9JetEngine24AMSMetricsWithInspection)initWithContainerId:(id)a3 bagContract:(id)a4;
- (id)promiseForEnqueueingEvents:(id)a3;
@end

@implementation AMSMetricsWithInspection

- (id)promiseForEnqueueingEvents:(id)a3
{
  sub_19EEBDC10(0, (unint64_t *)&qword_1E946F790);
  unint64_t v4 = sub_19F1DC16C();
  v5 = self;
  v6 = (void *)sub_19F16EE3C(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC9JetEngine24AMSMetricsWithInspection)initWithContainerID:(id)a3 bag:(id)a4
{
}

- (_TtC9JetEngine24AMSMetricsWithInspection)init
{
  result = (_TtC9JetEngine24AMSMetricsWithInspection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9JetEngine24AMSMetricsWithInspection)initWithContainerId:(id)a3 bagContract:(id)a4
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9JetEngine24AMSMetricsWithInspection_urlSession);
}

@end