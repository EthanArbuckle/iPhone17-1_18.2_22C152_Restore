@interface AccessoryDetailsSuggestedAutomationsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (_TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation AccessoryDetailsSuggestedAutomationsViewController

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = sub_1BE9C1208();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  sub_1BE59A088();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1BE59A534();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1BE59A848(v4);

  return v6;
}

- (_TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4 = a3;
  result = (_TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_home));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_triggerModuleController));
  v3 = (char *)self + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_viewCoordinator;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end