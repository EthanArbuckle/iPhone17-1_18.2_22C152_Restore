@interface DebugSettingsViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)dismissFrom:(id)a3;
- (void)userDefaultsDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation DebugSettingsViewController

- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100753960();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100750304();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter);
  v5 = self;
  [v4 removeObserver:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(DebugSettingsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter));

  swift_bridgeObjectRelease();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(DebugSettingsViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)userDefaultsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100753A78();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_100751C84(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_100754038();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)dismissFrom:(id)a3
{
}

- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC22SubscribePageExtension27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end