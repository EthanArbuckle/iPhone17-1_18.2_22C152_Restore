@interface DOCPickerViewController
- (_TtC17RecentsAppPopover23DOCPickerViewController)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover23DOCPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_didSelectURL:(id)a3;
- (void)_dismissViewController;
- (void)_displayLocationsMenuFromRect:(CGRect)a3;
- (void)_stitchFileCreationAtURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCPickerViewController

- (_TtC17RecentsAppPopover23DOCPickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_placeholderViewController) = 0;
  *(void *)&self->source[OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC17RecentsAppPopover23DOCPickerViewController *)sub_1004C0670();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100395870();
}

- (void)_didSelectURL:(id)a3
{
  uint64_t v4 = sub_1004BBC60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BBC10();
  v8 = self;
  sub_100396BC8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)_dismissViewController
{
  v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_delegate;
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
  uint64_t v3 = sub_1004BBC60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BBC10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC17RecentsAppPopover23DOCPickerViewController *, uint64_t, uint64_t, double, double, double, double))(v9 + 8))(self, ObjectType, v9, x, y, width, height);
    swift_unknownObjectRelease();
  }
}

- (_TtC17RecentsAppPopover23DOCPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17RecentsAppPopover23DOCPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_source));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_placeholderViewController));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover23DOCPickerViewController_delegate;
  sub_10003CC04((uint64_t)v3);
}

@end