@interface BobbleSettingsViewController
+ (BOOL)bobbleSupported:(id)a3;
+ (NSArray)bobbleMainSepcifier;
+ (id)headGestureOnInput:(id)a3;
- (HPMHeadphoneDevice)headphoneDevice;
- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)acceptReplyPlayPauseStringMapping;
- (id)declineDismissSkipStringMapping;
- (id)getVoiceEnvironment:(id)a3;
- (id)headGesturesEnabled;
- (id)specifiers;
- (void)presentBobbleTutorials;
- (void)setHeadGesturesEnabledWithEnabled:(id)a3;
- (void)setHeadphoneDevice:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BobbleSettingsViewController

- (void)presentBobbleTutorials
{
  v2 = self;
  sub_1E4C97AD4();
}

- (HPMHeadphoneDevice)headphoneDevice
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  return (HPMHeadphoneDevice *)*v2;
}

- (void)setHeadphoneDevice:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E4CBF1F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16HeadphoneConfigs28BobbleSettingsViewController *)BobbleSettingsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs28BobbleSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E4CA0390();
}

- (id)specifiers
{
  v2 = self;
  unint64_t v3 = (unint64_t)BobbleSettingsViewController.specifiers()();

  if (v3)
  {
    v4 = (void *)sub_1E4CBF290();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  id v4 = v6.receiver;
  [(BobbleSettingsViewController *)&v6 viewWillAppear:v3];
  sub_1E4C9FC1C();
  id v5 = sub_1E4C9F8E8();
  objc_msgSend(v5, sel_play, v6.receiver, v6.super_class);

  objc_msgSend(v4, sel_reloadSpecifiers);
}

- (id)headGesturesEnabled
{
  v2 = self;
  sub_1E4C9EC8C();
  id v4 = v3;

  return v4;
}

- (void)setHeadGesturesEnabledWithEnabled:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v3)
  {
    id v5 = a3;
    objc_super v6 = self;
    swift_retain();
    if (objc_msgSend(v5, sel_BOOLValue)) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    (*(void (**)(uint64_t))(*(void *)v3 + 144))(v7);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (id)getVoiceEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1E4C951A8();
  swift_unknownObjectRelease();

  id v5 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();

  return v5;
}

+ (BOOL)bobbleSupported:(id)a3
{
  swift_unknownObjectRetain();
  BOOL v3 = _s16HeadphoneConfigs28BobbleSettingsViewControllerC15bobbleSupportedySbyXlFZ_0();
  swift_unknownObjectRelease();
  return v3;
}

+ (NSArray)bobbleMainSepcifier
{
  swift_getObjCClassMetadata();
  sub_1E4C9F464();
  sub_1E4C7EA5C(0, &qword_1EAE8D880);
  v2 = (void *)sub_1E4CBF290();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (id)headGestureOnInput:(id)a3
{
  id v3 = a3;
  sub_1E4CA0A30(v3);

  id v4 = (void *)sub_1E4CBF1C0();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)acceptReplyPlayPauseStringMapping
{
  uint64_t v2 = *(void *)((char *)self + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    id v3 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 232);
    id v4 = self;
    uint64_t v5 = swift_retain();
    LOBYTE(v3) = v3(v5);
    swift_release();
    sub_1E4C94CE4((char)v3);

    objc_super v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)declineDismissSkipStringMapping
{
  uint64_t v2 = *(void *)((char *)self + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    id v3 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 184);
    id v4 = self;
    uint64_t v5 = swift_retain();
    LOBYTE(v3) = v3(v5);
    swift_release();
    sub_1E4C94CE4((char)v3);

    objc_super v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset);
}

@end