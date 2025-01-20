@interface ActivityListItemHostViewController
- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4;
- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivitySceneDescriptor:(id)a3;
- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithCoder:(id)a3;
@end

@implementation ActivityListItemHostViewController

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4
{
  uint64_t v5 = sub_23C990C60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v17 - v10;
  sub_23C9550C8();
  sub_23C990DD0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v13 = a4;
  id v14 = sub_23C98368C(0, (uint64_t)v9, v13, 0, 0);
  v15 = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v15;
}

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithCoder:(id)a3
{
  result = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)sub_23C9913D0();
  __break(1u);
  return result;
}

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  id v3 = a3;
  result = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end