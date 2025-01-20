@interface HeartbeatEventServiceURLSessionDelegate
- (_TtC12AppAnalyticsP33_883BEF9FB9BC10A2D6AB6388C0003C3E39HeartbeatEventServiceURLSessionDelegate)init;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation HeartbeatEventServiceURLSessionDelegate

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1A91289C8(v9, a5);
}

- (_TtC12AppAnalyticsP33_883BEF9FB9BC10A2D6AB6388C0003C3E39HeartbeatEventServiceURLSessionDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(HeartbeatEventServiceURLSessionDelegate *)&v3 init];
}

@end