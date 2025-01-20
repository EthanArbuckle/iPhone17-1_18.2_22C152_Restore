@interface ProtectedAppsProvider
- (_TtC20FaceTimeMessageStore21ProtectedAppsProvider)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
@end

@implementation ProtectedAppsProvider

- (_TtC20FaceTimeMessageStore21ProtectedAppsProvider)init
{
  return (_TtC20FaceTimeMessageStore21ProtectedAppsProvider *)sub_24DF10250();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  sub_24DF1F340();
  sub_24DF1EEE0();
  swift_unknownObjectRetain();
  v5 = self;
  sub_24DF10850();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end