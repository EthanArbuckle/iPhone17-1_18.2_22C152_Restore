@interface HomePodSetupAutomation
+ (_TtC14HDSViewService22HomePodSetupAutomation)shared;
- (BOOL)hasAutomationStepResults;
- (_TtC14HDSViewService22HomePodSetupAutomation)init;
@end

@implementation HomePodSetupAutomation

+ (_TtC14HDSViewService22HomePodSetupAutomation)shared
{
  if (qword_1000ED740 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000F3968;

  return (_TtC14HDSViewService22HomePodSetupAutomation *)v2;
}

- (BOOL)hasAutomationStepResults
{
  if ((*(void **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_automationStepResults))[2])
    return 1;
  else {
    return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_alwaysSelectDefault);
  }
}

- (_TtC14HDSViewService22HomePodSetupAutomation)init
{
  return (_TtC14HDSViewService22HomePodSetupAutomation *)HomePodSetupAutomation.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation____lazy_storage___userDefaults));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end