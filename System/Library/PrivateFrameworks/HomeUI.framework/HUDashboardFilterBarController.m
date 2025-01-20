@interface HUDashboardFilterBarController
- (BOOL)_hasTapActionForItem:(id)a3;
- (BOOL)canReorderItemAtIndexPath:(id)a3;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUDashboardFilterBarController)init;
- (HUDashboardFilterBarController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUDashboardFilterBarDelegate)delegate;
- (NSString)contextTypeDescriptionForAnalytics;
- (double)intrinsicHeight;
- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)reorderableItemListForSection:(int64_t)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7;
- (void)handleTraitChanges;
- (void)resetAnimated:(BOOL)a3;
- (void)setContextTypeDescriptionForAnalytics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateWithContext:(id)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUDashboardFilterBarController

- (HUDashboardFilterBarController)init
{
  return (HUDashboardFilterBarController *)DashboardFilterBarController.init()();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE537FA8();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardFilterBarController();
  id v4 = v6.receiver;
  [(HUItemCollectionViewController *)&v6 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_presentedViewController, v6.receiver, v6.super_class);

  if (v5) {
    objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, v3, 0);
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DashboardFilterBarController();
  id v4 = v7.receiver;
  [(HUDashboardFilterBarController *)&v7 viewIsAppearing:v3];
  sub_1BE53D468();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BEA10790;
  *(void *)(inited + 32) = sub_1BE9C3578();
  uint64_t v6 = sub_1BE518764(inited);
  swift_setDeallocating();
  MEMORY[0x1C1896690](v6, sel_handleTraitChanges);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1BE538304();
}

- (HUDashboardFilterBarDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUDashboardFilterBarController_delegate;
  swift_beginAccess();
  BOOL v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUDashboardFilterBarDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)contextTypeDescriptionForAnalytics
{
  v2 = (char *)self + OBJC_IVAR___HUDashboardFilterBarController_contextTypeDescriptionForAnalytics;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    BOOL v3 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setContextTypeDescriptionForAnalytics:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BE9C49F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterBarController_contextTypeDescriptionForAnalytics);
  swift_beginAccess();
  *objc_super v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)resetAnimated:(BOOL)a3
{
  v10 = self;
  id v4 = [(HUDashboardFilterBarController *)v10 collectionView];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_indexPathsForSelectedItems);

    objc_super v7 = v10;
    if (v6)
    {
      sub_1BE9C1208();
      uint64_t v8 = sub_1BE9C4C18();

      v9 = v10;
      sub_1BE53DE3C(v8, v9, a3);
      swift_bridgeObjectRelease();

      objc_super v7 = v10;
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)updateWithContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = self;
  sub_1BE538BCC((uint64_t)v6, v4);
}

- (double)intrinsicHeight
{
  v2 = self;
  sub_1BE5392F0();
  double v4 = v3;

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  type metadata accessor for DashboardFilterCategoryCell();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE539594(v6, (uint64_t)v7);
}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = objc_msgSend(v5, sel_defaultConfiguration);
  objc_msgSend(v8, sel_setContentInsetsReference_, 3);

  return v8;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  id v6 = sub_1BE53E274();
  swift_unknownObjectRelease();

  return v6;
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A1734((unint64_t *)&qword_1EBA467A0, (unint64_t *)&qword_1EBA46790);
  uint64_t v10 = sub_1BE9C4E88();
  uint64_t v11 = sub_1BE9C4E88();
  uint64_t v12 = sub_1BE9C4E88();
  id v13 = a3;
  v14 = self;
  sub_1BE539888((uint64_t)v13, v10, v11, v12, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1BE9C1208();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = sub_1BE53E5FC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_1BE53A640(v6, (uint64_t)v7);

  return v9;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA45590);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BE9C11B8();
    uint64_t v8 = sub_1BE9C1208();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1BE9C1208();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  char v11 = sub_1BE53AB78();

  sub_1BE39DA0C((uint64_t)v7, &qword_1EBA45590);
  return v11 & 1;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  double v3 = self;
  uint64_t v4 = [(HUItemCollectionViewController *)v3 itemManager];
  uint64_t v5 = [(HFItemManager *)v4 home];

  if (v5)
  {
    id v6 = [(HUDashboardFilterBarController *)v5 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];

    double v3 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (HUDashboardFilterBarController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUDashboardFilterBarController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUDashboardFilterBarController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterBarController____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterBarController____lazy_storage___blurGroupingEffectView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUDashboardFilterBarController__layoutOptions);
}

- (void)handleTraitChanges
{
  v2 = self;
  sub_1BE53C844();
}

@end