@interface DOCPickerViewController
- (_TtC18DocumentAppIntents23DOCPickerViewController)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents23DOCPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_didSelectURL:(id)a3;
- (void)_dismissViewController;
- (void)_displayLocationsMenuFromRect:(CGRect)a3;
- (void)_stitchFileCreationAtURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCPickerViewController

- (_TtC18DocumentAppIntents23DOCPickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_placeholderViewController) = 0;
  *(void *)&self->source[OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC18DocumentAppIntents23DOCPickerViewController *)sub_1004F6110();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003F9C90();
}

- (void)_didSelectURL:(id)a3
{
  uint64_t v4 = sub_1004F1510();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F14C0();
  v8 = self;
  sub_1003FAFE8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)_dismissViewController
{
  v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    uint64_t v5 = *(void (**)(void))(v4 + 16);
    uint64_t v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)_stitchFileCreationAtURL:(id)a3
{
  uint64_t v3 = sub_1004F1510();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F14C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC18DocumentAppIntents23DOCPickerViewController *, uint64_t, uint64_t, double, double, double, double))(v9 + 8))(self, ObjectType, v9, x, y, width, height);
    swift_unknownObjectRelease();
  }
}

- (_TtC18DocumentAppIntents23DOCPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18DocumentAppIntents23DOCPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_source));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_placeholderViewController));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents23DOCPickerViewController_delegate;

  sub_100037E24((uint64_t)v3);
}

@end