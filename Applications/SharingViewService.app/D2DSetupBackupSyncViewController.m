@interface D2DSetupBackupSyncViewController
- (_TtC18SharingViewService32D2DSetupBackupSyncViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation D2DSetupBackupSyncViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10007A590();
}

- (_TtC18SharingViewService32D2DSetupBackupSyncViewController)initWithContentView:(id)a3
{
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService32D2DSetupBackupSyncViewController_backupSymbolView] = 0;
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService32D2DSetupBackupSyncViewController_progressView] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupBackupSyncViewController();
  return [(D2DSetupBaseViewController *)&v5 initWithContentView:a3];
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService32D2DSetupBackupSyncViewController_progressView];
}

@end