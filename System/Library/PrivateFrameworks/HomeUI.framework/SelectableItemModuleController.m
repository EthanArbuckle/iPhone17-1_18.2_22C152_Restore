@interface SelectableItemModuleController
- (BOOL)canSelectItem:(id)a3;
- (_TtC6HomeUI30SelectableItemModuleController)initWithModule:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation SelectableItemModuleController

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE3E1604(v6, (uint64_t)v7);
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1BE3E1A60((uint64_t)v4);

  return self & 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE3E2064((uint64_t)v4);

  return 0;
}

- (_TtC6HomeUI30SelectableItemModuleController)initWithModule:(id)a3
{
  *(HUItemModuleControllerHosting **)((char *)&self->super._host
                                    + OBJC_IVAR____TtC6HomeUI30SelectableItemModuleController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelectableItemModuleController();
  return [(HUItemModuleController *)&v6 initWithModule:a3];
}

- (void).cxx_destruct
{
}

@end