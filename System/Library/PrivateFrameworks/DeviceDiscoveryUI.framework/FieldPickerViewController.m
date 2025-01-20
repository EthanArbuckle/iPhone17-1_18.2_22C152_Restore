@interface FieldPickerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithCoder:(id)a3;
- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithRootViewController:(id)a3;
- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4;
@end

@implementation FieldPickerViewController

- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4
{
  sub_24CB0BCB4(0, (unint64_t *)&qword_269814790);
  unint64_t v6 = sub_24CBAB4E8();
  unint64_t v7 = v6;
  v8 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_fieldSaveHandler);
  if (!(v6 >> 62))
  {
    uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v10 = a3;
    v11 = self;
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  id v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain();
  if (!sub_24CBABA28()) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v12 = (id)MEMORY[0x25330AC80](0, v7);
    goto LABEL_6;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v12 = *(id *)(v7 + 32);
LABEL_6:
  id v15 = v12;
  swift_bridgeObjectRelease();
  v8(v15);

  swift_bridgeObjectRelease();
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithCoder:(id)a3
{
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)sub_24CBABA18();
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17DeviceDiscoveryUI25FieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17DeviceDiscoveryUI25FieldPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_presentedContact));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI25FieldPickerViewController_selectionFromContact));
  swift_release();
  swift_release();
}

@end