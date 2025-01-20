@interface ActivityPickerViewController
- (_TtC14FamilyControls28ActivityPickerViewController)initWithCoder:(id)a3;
- (_TtC14FamilyControls28ActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ActivityPickerViewController

- (_TtC14FamilyControls28ActivityPickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController) = 0;
  id v4 = a3;

  result = (_TtC14FamilyControls28ActivityPickerViewController *)sub_20B97A7B8();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  [(ActivityPickerViewController *)v4 setView:v5];
  type metadata accessor for ActivityPickerRemoteViewController();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  v7 = v4;
  sub_20B93CE34((uint64_t)sub_20B963D38, v6);

  swift_release();
}

- (_TtC14FamilyControls28ActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14FamilyControls28ActivityPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController);
}

@end