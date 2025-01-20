@interface APSystemAppOutlet.SystemAppOutletSubjectMonitor
- (_TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
@end

@implementation APSystemAppOutlet.SystemAppOutletSubjectMonitor

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  type metadata accessor for APSubject(0);
  unint64_t v5 = sub_247DD2D30();
  swift_unknownObjectRetain();
  v6 = self;
  sub_247D5278C(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor_subscription) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_s29SystemAppOutletSubjectMonitorCMa();
  return [(APSystemAppOutlet.SystemAppOutletSubjectMonitor *)&v4 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end