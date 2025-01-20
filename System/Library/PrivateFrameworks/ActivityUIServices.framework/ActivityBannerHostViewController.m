@interface ActivityBannerHostViewController
- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4 payloadID:(id)a5;
- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivitySceneDescriptor:(id)a3;
- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithCoder:(id)a3;
@end

@implementation ActivityBannerHostViewController

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4 payloadID:(id)a5
{
  uint64_t v7 = sub_23C990C60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v20 - v12;
  sub_23C9550C8();
  sub_23C990DD0();
  if (a5)
  {
    uint64_t v14 = sub_23C990FD0();
    a5 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v16 = a4;
  id v17 = sub_23C98368C(1, (uint64_t)v11, v16, v14, (uint64_t)a5);
  v18 = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v18;
}

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithCoder:(id)a3
{
  result = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)sub_23C9913D0();
  __break(1u);
  return result;
}

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  id v3 = a3;
  result = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end