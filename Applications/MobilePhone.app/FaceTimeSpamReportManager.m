@interface FaceTimeSpamReportManager
- (_TtC11MobilePhone25FaceTimeSpamReportManager)init;
- (void)reportSpamWithCall:(id)a3;
@end

@implementation FaceTimeSpamReportManager

- (_TtC11MobilePhone25FaceTimeSpamReportManager)init
{
  FaceTimeSpamReportManager.init()();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone25FaceTimeSpamReportManager_imAccountController));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobilePhone25FaceTimeSpamReportManager_imDaemonController);
}

- (void)reportSpamWithCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  FaceTimeSpamReportManager.reportSpam(call:)(v4);
}

@end