@interface DaemonAdminConnection
- (_TtC15FeedbackService21DaemonAdminConnection)init;
@end

@implementation DaemonAdminConnection

- (_TtC15FeedbackService21DaemonAdminConnection)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DaemonAdminConnection();
  return [(DaemonAdminConnection *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FeedbackService21DaemonAdminConnection____lazy_storage___connectionForAdmin));
}

@end