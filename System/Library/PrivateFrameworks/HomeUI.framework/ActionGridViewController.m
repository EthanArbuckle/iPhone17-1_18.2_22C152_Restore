@interface ActionGridViewController
+ (unint64_t)updateMode;
- (BOOL)allowsEditing;
- (BOOL)controlsWantSystemPresentationAnimations;
- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4;
- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4;
- (NSArray)allowlistedAccessories;
- (NSArray)denylistedAccessories;
- (_TtC6HomeUI24ActionGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5;
- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5;
- (void)configureWithAccessoryControlViewController:(id)a3;
- (void)setAllowlistedAccessories:(id)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setDenylistedAccessories:(id)a3;
- (void)willDismissWithViewController:(id)a3;
@end

@implementation ActionGridViewController

- (BOOL)allowsEditing
{
  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  return v2[16];
}

- (void)setAllowsEditing:(BOOL)a3
{
  v4 = self;
  sub_1BE5755CC(a3);
}

- (NSArray)denylistedAccessories
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig);
  swift_beginAccess();
  if (*v2)
  {
    sub_1BE9C36A8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA117430);
    v3 = (void *)sub_1BE9C4BF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setDenylistedAccessories:(id)a3
{
}

- (NSArray)allowlistedAccessories
{
  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA117430);
    v3 = (void *)sub_1BE9C4BF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setAllowlistedAccessories:(id)a3
{
}

+ (unint64_t)updateMode
{
  return 1;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE576A4C(v4);

  return v6;
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v9 = sub_1BE9C1208();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v13 = a4;
  v14 = self;
  v15 = sub_1BE576BB0(v13, (uint64_t)v12, x, y);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v15;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  id v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA118018;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA113230;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1BE5AF20C((uint64_t)v11, (uint64_t)&unk_1EA1167F0, (uint64_t)v16);
  swift_release();
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE5771E8(v4);
}

- (BOOL)controlsWantSystemPresentationAnimations
{
  return objc_msgSend(self, sel_isAMac) ^ 1;
}

- (void)willDismissWithViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE578830();
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (!v10)
  {
    id v17 = a3;
    id v18 = a5;
    v19 = self;
    goto LABEL_5;
  }
  id v11 = a3;
  id v12 = a5;
  id v13 = self;
  id v14 = v10;
  char v15 = sub_1BE37E814();

  if (v15 == 2)
  {
LABEL_5:
    v21.receiver = self;
    v21.super_class = (Class)type metadata accessor for ActionGridViewController();
    BOOL v16 = -[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](&v21, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a3, a5, x, y);

    goto LABEL_6;
  }

  BOOL v16 = v15 & 1;
LABEL_6:

  return v16;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_1BE5776D4((uint64_t)v6, v7);

  return v9 & 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    unsigned __int8 v9 = self;
    id v10 = v4;
    char v11 = sub_1BE379970(v8);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v4 = *(void **)((char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (v4)
  {
    id v6 = self;
    id v7 = a3;
    id v8 = a4;
    id v9 = v6;
    id v10 = v4;
    char v11 = (void *)sub_1BE379D18(v8);

    return v11;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (_TtC6HomeUI24ActionGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC6HomeUI24ActionGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController));
  swift_release();

  swift_release();
}

@end