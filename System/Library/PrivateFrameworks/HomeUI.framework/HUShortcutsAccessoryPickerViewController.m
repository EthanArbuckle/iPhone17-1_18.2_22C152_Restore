@interface HUShortcutsAccessoryPickerViewController
- (HUShortcutsAccessoryPickerViewController)initWithHome:(id)a3 configuration:(id)a4;
- (HUShortcutsAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)getServices;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (void)configureWithDefaultSelectionController;
- (void)setServices:(id)a3;
@end

@implementation HUShortcutsAccessoryPickerViewController

- (HUShortcutsAccessoryPickerViewController)initWithHome:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HUShortcutsTriggerViewAccessoryPickerConfiguration.buildConfiguration()((uint64_t *)&v13);

  v9 = v13;
  id v10 = objc_allocWithZone((Class)type metadata accessor for ShortcutsAccessoryPickerViewController());
  sub_1BE4AE1F0(v9);
  swift_retain();
  swift_unknownObjectRetain();
  v11 = (HUShortcutsAccessoryPickerViewController *)ShortcutsAccessoryPickerViewController.init(home:configuration:)(v6, (uint64_t *)&v13);

  sub_1BE4B06BC(v9);
  swift_release();
  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE4AF88C(v4);

  return v6;
}

- (void)configureWithDefaultSelectionController
{
  v2 = self;
  sub_1BE4AFCB4();
}

- (id)getServices
{
  v2 = self;
  sub_1BE4AFDD4();

  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA112220);
  sub_1BE466650();
  v3 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)setServices:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA112220);
  sub_1BE466650();
  uint64_t v4 = sub_1BE9C4E88();
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_selectionController);
  swift_beginAccess();
  if (*v5)
  {
    _s26DefaultSelectionControllerCMa();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6) {
      *(void *)(v6
    }
                + OBJC_IVAR____TtCC6HomeUI38ShortcutsAccessoryPickerViewController26DefaultSelectionController_services) = v4;
  }
  swift_bridgeObjectRelease();
}

- (HUShortcutsAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUShortcutsAccessoryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE4B06BC(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_configuration));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_home));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_moduleContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_module));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUShortcutsAccessoryPickerViewController_moduleController);
}

@end