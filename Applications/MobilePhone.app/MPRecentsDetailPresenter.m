@interface MPRecentsDetailPresenter
- (MPRecentsDetailPresenter)init;
- (MPRecentsDetailPresenter)initWithRecentsController:(id)a3 contactsService:(id)a4 callReportingViewModel:(id)a5;
- (void)showRecentCallDetailsViewControllerFor:(id)a3 from:(id)a4;
@end

@implementation MPRecentsDetailPresenter

- (MPRecentsDetailPresenter)initWithRecentsController:(id)a3 contactsService:(id)a4 callReportingViewModel:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (MPRecentsDetailPresenter *)specialized RecentsDetailPresenter.init(recentsController:contactsService:callReportingViewModel:)(v7, v8, v9);

  return v10;
}

- (void)showRecentCallDetailsViewControllerFor:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RecentsDetailPresenter.showRecentCallDetailsViewController(for:from:)(v6, v7);
}

- (MPRecentsDetailPresenter)init
{
  result = (MPRecentsDetailPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MPRecentsDetailPresenter_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPRecentsDetailPresenter_featureflags);
}

@end