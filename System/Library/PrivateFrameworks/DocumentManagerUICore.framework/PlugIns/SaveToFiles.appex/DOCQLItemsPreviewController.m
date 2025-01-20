@interface DOCQLItemsPreviewController
- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithCoder:(id)a3;
- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithPreviewItems:(id)a3;
@end

@implementation DOCQLItemsPreviewController

- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1004D1240();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC11SaveToFiles27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC11SaveToFiles27DOCQLItemsPreviewController__nonSourceBasedQLItems) = (Class)_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCQLItemsPreviewController();
  v9 = [(DOCQLItemsPreviewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithCoder:(id)a3
{
  result = (_TtC11SaveToFiles27DOCQLItemsPreviewController *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles27DOCQLItemsPreviewController)initWithPreviewItems:(id)a3
{
  result = (_TtC11SaveToFiles27DOCQLItemsPreviewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end