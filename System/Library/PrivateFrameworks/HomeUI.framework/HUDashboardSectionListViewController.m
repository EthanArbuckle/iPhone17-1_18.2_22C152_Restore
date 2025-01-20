@interface HUDashboardSectionListViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUDashboardSectionListViewController)initWithContext:(id)a3;
- (HUDashboardSectionListViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (id)displayedItemsInSection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)_cancel;
- (void)_done;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didReorderItemWithSortedItemsBySectionID:(id)a3;
- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4;
- (void)homeDidUpdateApplicationData:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUDashboardSectionListViewController

- (HUDashboardSectionListViewController)initWithContext:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardSectionListViewController____lazy_storage___layoutManager) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardSectionListViewController_dashboardContext) = (Class)a3;
  v5 = *(void **)((char *)a3 + OBJC_IVAR___HUDashboardContext_room);
  objc_allocWithZone((Class)type metadata accessor for DashboardSectionListItemManager());
  id v6 = v5;
  id v7 = a3;
  v8 = sub_1BE44785C(0, v5);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DashboardSectionListViewController();
  v9 = [(HUItemCollectionViewController *)&v11 initUsingCompositionalLayoutWithItemManager:v8];

  return v9;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE468ED4();
}

- (void)_cancel
{
  v2 = self;
  sub_1BE469078();
}

- (void)_done
{
  v2 = self;
  sub_1BE4692E4();
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  v8 = sub_1BE4693F4(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA1157E0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE46A514(v6, v7);
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  uint64_t v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 displayedItemsInSectionWithIdentifier:v6];

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  sub_1BE9C49F8();
  uint64_t v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  id v6 = (void *)sub_1BE9C49B8();
  id v7 = [(HFItemManager *)v5 sectionIndexForDisplayedSectionIdentifier:v6];

  v8 = [(HUItemCollectionViewController *)v4 itemManager];
  id v9 = [(HFItemManager *)v8 titleForSection:v7];

  swift_bridgeObjectRelease();
  if (v9) {

  }
  return v9 != 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v5 = sub_1BE9C1208();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  unsigned __int8 v9 = objc_msgSend(a3, sel_isEditing);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA118130);
  uint64_t v4 = sub_1BE9C4908();
  uint64_t v5 = self;
  sub_1BE469D3C(v4);

  swift_bridgeObjectRelease();
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1BE469EC8(v4);
}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE46AA00(v7);
}

- (HUDashboardSectionListViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUDashboardSectionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardSectionListViewController_dashboardContext));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUDashboardSectionListViewController____lazy_storage___layoutManager);
}

@end