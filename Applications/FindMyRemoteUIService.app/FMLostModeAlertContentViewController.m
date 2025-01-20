@interface FMLostModeAlertContentViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithCoder:(id)a3;
- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FMLostModeAlertContentViewController

- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo;
  *(_OWORD *)v4 = xmmword_100011710;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 2;
  id v6 = a3;

  result = (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000B650(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo), *(void *)&self->super.context[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo]);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state);
  uint64_t v4 = *(void *)&self->super.context[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
  uint64_t v5 = *(void *)&self->super.proxCardNavigationController[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
  uint64_t v6 = *(void *)&self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
  unsigned __int8 v7 = self->lostModeInfo[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 8];

  sub_10000AD78(v3, v4, v5, v6, v7);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end