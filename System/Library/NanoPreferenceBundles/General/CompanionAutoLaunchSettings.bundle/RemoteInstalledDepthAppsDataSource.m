@interface RemoteInstalledDepthAppsDataSource
- (_TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource)init;
- (void)dataSourceDidUpdate:(id)a3;
- (void)dealloc;
- (void)updateInstalledDepthApps;
@end

@implementation RemoteInstalledDepthAppsDataSource

- (_TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource)init
{
  return (_TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource *)RemoteInstalledDepthAppsDataSource.init()();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource);
  v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RemoteInstalledDepthAppsDataSource();
  [(RemoteInstalledDepthAppsDataSource *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource__installedDepthApps;
  uint64_t v4 = sub_6344(&qword_3C1F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_logger;
  uint64_t v6 = sub_27980();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_stingSettingsModel));
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource);
}

- (void)updateInstalledDepthApps
{
  v2 = self;
  _s27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSourceC04dataJ9DidUpdateyySo015CSLPRFInstalledg12ApplicationsiJ0CF_0();
}

- (void)dataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSourceC04dataJ9DidUpdateyySo015CSLPRFInstalledg12ApplicationsiJ0CF_0();
}

@end