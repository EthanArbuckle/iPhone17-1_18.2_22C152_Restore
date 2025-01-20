@interface GameCenterDashboardLaunchManager
+ (id)viewControllerWithRequest:(id)a3 dismissHandler:(id)a4;
- (_TtC13GameOverlayUI32GameCenterDashboardLaunchManager)init;
- (void)donePressed:(id)a3;
@end

@implementation GameCenterDashboardLaunchManager

- (void)donePressed:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler);
  if (v6)
  {
    uint64_t v7 = swift_retain();
    v6(v7);
    sub_100039104((uint64_t)v6);
  }

  sub_100017388((uint64_t)v8, &qword_100142A70);
}

+ (id)viewControllerWithRequest:(id)a3 dismissHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_1000C0228;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = sub_1000BB228(a3, (uint64_t)v5, v6);
  sub_100039104((uint64_t)v5);

  return v8;
}

- (_TtC13GameOverlayUI32GameCenterDashboardLaunchManager)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler);
  v4 = (objc_class *)type metadata accessor for GameCenterDashboardLaunchManager();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(GameCenterDashboardLaunchManager *)&v6 init];
}

- (void).cxx_destruct
{
  sub_100039104(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13GameOverlayUI32GameCenterDashboardLaunchManager_dismissHandler));
}

@end