@interface BobbleTutorialController
- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BobbleTutorialController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BobbleTutorialController();
  id v4 = v6.receiver;
  [(BobbleTutorialController *)&v6 viewWillAppear:v3];
  id v5 = sub_1E4C96DF4();
  objc_msgSend(v5, sel_play, v6.receiver, v6.super_class);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E4C95F70();
}

- (void)dealloc
{
  v2 = self;
  sub_1E4C9771C();
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType;
  sub_1E4C97FBC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void **)v3 + 6), *((void *)v3 + 7), v3[64]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset));
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark);
}

- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC16HeadphoneConfigs24BobbleTutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs24BobbleTutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC16HeadphoneConfigs24BobbleTutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end