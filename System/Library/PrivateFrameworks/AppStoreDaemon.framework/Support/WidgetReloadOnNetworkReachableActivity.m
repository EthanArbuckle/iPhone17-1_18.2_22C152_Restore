@interface WidgetReloadOnNetworkReachableActivity
+ (_TtC9appstored38WidgetReloadOnNetworkReachableActivity)sharedActivity;
- (_TtC9appstored38WidgetReloadOnNetworkReachableActivity)init;
- (void)bootstrapWithCompletionHandler:(id)a3;
- (void)scheduleWithEndpoint:(id)a3 parameters:(id)a4;
@end

@implementation WidgetReloadOnNetworkReachableActivity

+ (_TtC9appstored38WidgetReloadOnNetworkReachableActivity)sharedActivity
{
  if (qword_1005A3018 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (_TtC9appstored38WidgetReloadOnNetworkReachableActivity *)v2;
}

- (void)bootstrapWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A4920;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  swift_retain();
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

- (void)scheduleWithEndpoint:(id)a3 parameters:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_100065E78((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC9appstored38WidgetReloadOnNetworkReachableActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v8 = &self->$defaultActor[OBJC_IVAR____TtC9appstored38WidgetReloadOnNetworkReachableActivity_backoff];
  swift_retain();
  static Clock<>.continuous.getter();
  uint64_t v9 = (int *)sub_10001644C((uint64_t *)&unk_1005A48C8);
  *(void *)&v8[v9[12]] = 0;
  uint64_t v10 = (char *)&v8[v9[13]];
  uint64_t v11 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(_OWORD *)v8 = xmmword_100489440;
  *((_OWORD *)v8 + 1) = xmmword_100489450;
  *((void *)v8 + 4) = 0;
  (*(void (**)(unsigned __int8 *, char *, uint64_t))(v5 + 32))(&v8[v9[11]], v7, v4);
  *(void *)&self->$defaultActor[OBJC_IVAR____TtC9appstored38WidgetReloadOnNetworkReachableActivity_activity] = 0;
  swift_release();
  v13.receiver = self;
  v13.super_class = ObjectType;
  return [(WidgetReloadOnNetworkReachableActivity *)&v13 init];
}

@end