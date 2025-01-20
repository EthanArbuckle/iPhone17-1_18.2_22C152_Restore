@interface RecoveryContactSetUpViewControllerWrapper.AAUICustodianSetupDelegate
- (_TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate)init;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
@end

@implementation RecoveryContactSetUpViewControllerWrapper.AAUICustodianSetupDelegate

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4 = a3;
  v7 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v5 = *(void (**)(uint64_t))((char *)&v7->super.isa
                                      + OBJC_IVAR____TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate_onChange);
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_218AB12E4((uint64_t)v5);
  }
}

- (_TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate)init
{
  result = (_TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_218AB12E4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate_onChange));
}

@end