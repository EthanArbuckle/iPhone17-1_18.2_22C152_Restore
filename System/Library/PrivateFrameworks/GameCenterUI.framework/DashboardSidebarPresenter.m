@interface DashboardSidebarPresenter
- (BOOL)retryAfterAuthentication;
- (GKDashboardRequest)request;
- (NSString)title;
- (_TtC12GameCenterUI25DashboardSidebarPresenter)initWithPlayerId:(id)a3;
- (void)fetchGameRecordAfterAuthenticationFor:(id)a3;
- (void)handleViewDidLoad;
- (void)setRetryAfterAuthentication:(BOOL)a3;
@end

@implementation DashboardSidebarPresenter

- (GKDashboardRequest)request
{
  v2 = sub_1AF423114();

  return (GKDashboardRequest *)v2;
}

- (BOOL)retryAfterAuthentication
{
  return sub_1AF42316C() & 1;
}

- (void)setRetryAfterAuthentication:(BOOL)a3
{
}

- (NSString)title
{
  v2 = self;
  sub_1AF4223C8();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)handleViewDidLoad
{
  v2 = self;
  sub_1AF4223F4();
}

- (void)fetchGameRecordAfterAuthenticationFor:(id)a3
{
  uint64_t v4 = sub_1AF7AE0E0();
  uint64_t v6 = v5;
  v7 = self;
  sub_1AF42737C(v4, v6);
  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI25DashboardSidebarPresenter)initWithPlayerId:(id)a3
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  sub_1AF427554();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_release();

  sub_1AF4278B8(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_selectedItem), self->super.playerId[OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_selectedItem]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_requiredData, &qword_1E9AC3898);
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI25DashboardSidebarPresenter_dashboardDisplayMode);
}

@end