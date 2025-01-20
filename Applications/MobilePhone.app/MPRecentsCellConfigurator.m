@interface MPRecentsCellConfigurator
- (MPRecentsCellConfigurator)init;
- (MPRecentsCellConfigurator)initWithTableView:(id)a3 recentsController:(id)a4 featureFlags:(id)a5 tapTargets:(BOOL)a6 callReportingViewModel:(id)a7 reportFlowPresenter:(id)a8 contactsService:(id)a9 avatarViewControllerSettings:(id)a10 placeCallAction:(id)a11 removeCallsAtIndexPaths:(id)a12;
- (id)cellForRowAtIndexPath:(id)a3 withRecentCall:(id)a4;
- (id)reportSwipeActionForCall:(id)a3;
- (id)trailingSwipeActionsConfigurationForRowAt:(id)a3 recentCall:(id)a4;
- (int64_t)configureCardController:(id)a3 presentationResultForRecentCall:(id)a4;
@end

@implementation MPRecentsCellConfigurator

- (MPRecentsCellConfigurator)initWithTableView:(id)a3 recentsController:(id)a4 featureFlags:(id)a5 tapTargets:(BOOL)a6 callReportingViewModel:(id)a7 reportFlowPresenter:(id)a8 contactsService:(id)a9 avatarViewControllerSettings:(id)a10 placeCallAction:(id)a11 removeCallsAtIndexPaths:(id)a12
{
  v17 = _Block_copy(a11);
  v18 = _Block_copy(a12);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v17;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a10;
  v28 = (MPRecentsCellConfigurator *)specialized RecentsCellConfigurator.init(tableView:recentsController:featureFlags:tapTargets:callReportingViewModel:reportFlowPresenter:contactsService:avatarViewControllerSettings:placeCallAction:removeCallsAtIndexPaths:)(v21, v22, v23, a6, v24, v25, v26, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned CHRecentCall) -> (), v19, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray) -> (), v20);

  swift_release();
  swift_release();
  return v28;
}

- (id)cellForRowAtIndexPath:(id)a3 withRecentCall:(id)a4
{
  return @objc RecentsCellConfigurator.cell(for:recentCall:)(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(char *, id))RecentsCellConfigurator.cell(for:recentCall:));
}

- (id)trailingSwipeActionsConfigurationForRowAt:(id)a3 recentCall:(id)a4
{
  return @objc RecentsCellConfigurator.cell(for:recentCall:)(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(char *, id))RecentsCellConfigurator.trailingSwipeActionsConfigurationForRow(at:recentCall:));
}

- (int64_t)configureCardController:(id)a3 presentationResultForRecentCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int64_t v9 = RecentsCellConfigurator.configure(cardController:for:)(v6, (uint64_t)v7);

  return v9;
}

- (id)reportSwipeActionForCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)RecentsCellConfigurator.reportSwipeAction(for:)(v4);

  return v6;
}

- (MPRecentsCellConfigurator)init
{
  result = (MPRecentsCellConfigurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___MPRecentsCellConfigurator_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectWeakDestroy();
}

@end