@interface IMDCollaborationClearNoticeRateLimiter
- (BOOL)shouldSendWithNotice:(id)a3;
- (IMDCollaborationClearNoticeRateLimiter)init;
- (void)didSendWithNotice:(id)a3;
@end

@implementation IMDCollaborationClearNoticeRateLimiter

- (IMDCollaborationClearNoticeRateLimiter)init
{
  return (IMDCollaborationClearNoticeRateLimiter *)IMDCollaborationClearNoticeRateLimiter.init()();
}

- (BOOL)shouldSendWithNotice:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1D989012C(v4);

  return self & 1;
}

- (void)didSendWithNotice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D9890DA8(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDCollaborationClearNoticeRateLimiter_noticeEventHistory);
}

@end