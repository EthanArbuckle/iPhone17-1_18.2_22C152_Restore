@interface HUInformationalAccessoryGridViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (HUInformationalAccessoryGridViewController)init;
- (HUInformationalAccessoryGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUInformationalAccessoryGridViewController)initWithVisibleAccessories:(id)a3;
- (NSSet)visibleAccessories;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)setVisibleAccessories:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUInformationalAccessoryGridViewController

- (NSSet)visibleAccessories
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUInformationalAccessoryGridViewController_visibleAccessories);
  swift_beginAccess();
  if (*v2)
  {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EA116480);
    sub_1BE49FC0C();
    sub_1BE9C36A8();
    v3 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSSet *)v3;
}

- (void)setVisibleAccessories:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EA116480);
    sub_1BE49FC0C();
    uint64_t v3 = sub_1BE9C4E88();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___HUInformationalAccessoryGridViewController_visibleAccessories);
  swift_beginAccess();
  uint64_t *v5 = v3;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1BE49E8F0();
}

- (HUInformationalAccessoryGridViewController)init
{
  return [(HUInformationalAccessoryGridViewController *)self initWithVisibleAccessories:0];
}

- (HUInformationalAccessoryGridViewController)initWithVisibleAccessories:(id)a3
{
  if (a3)
  {
    sub_1BE37E9E8(0, (unint64_t *)&unk_1EA116480);
    sub_1BE49FC0C();
    uint64_t v3 = sub_1BE9C4E88();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (HUInformationalAccessoryGridViewController *)InformationalAccessoryGridViewController.init(visibleAccessories:)(v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE49F038();
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1BE49F254(v4);

  return v6;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1BE49F408(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (HUInformationalAccessoryGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUInformationalAccessoryGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUInformationalAccessoryGridViewController_module));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUInformationalAccessoryGridViewController_moduleController);
}

@end