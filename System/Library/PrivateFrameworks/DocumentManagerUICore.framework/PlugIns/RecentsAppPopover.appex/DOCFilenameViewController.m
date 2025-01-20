@interface DOCFilenameViewController
- (BOOL)presentFromViewController:(id)a3 animated:(BOOL)a4;
- (FPItem)item;
- (NSArray)keyCommands;
- (_TtC17RecentsAppPopover15DOCFilenameView)filenameView;
- (_TtC17RecentsAppPopover25DOCFilenameViewController)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover25DOCFilenameViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelViewController;
- (void)editingDidChange:(id)a3;
- (void)editingDidEnd:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)loadView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DOCFilenameViewController

- (_TtC17RecentsAppPopover15DOCFilenameView)filenameView
{
  return (_TtC17RecentsAppPopover15DOCFilenameView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_filenameView));
}

- (FPItem)item
{
  return (FPItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_item));
}

- (_TtC17RecentsAppPopover25DOCFilenameViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear) = 2;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_dismissing) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_visibilityState) = 0;
  id v4 = a3;

  result = (_TtC17RecentsAppPopover25DOCFilenameViewController *)sub_1004C0670();
  __break(1u);
  return result;
}

- (BOOL)presentFromViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1003C1120(v6, a4);

  return 1;
}

- (void)loadView
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_filenameView);
  id v4 = objc_allocWithZone((Class)type metadata accessor for DOCSafeAreaView());
  v5 = self;
  id v6 = sub_1003BC404(v3);
  [(DOCFilenameViewController *)v5 setView:v6];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  [(DOCFilenameViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = v5.receiver;
  [(DOCFilenameViewController *)&v5 viewWillAppear:v3];
  v4[OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = objc_msgSend(self, "isOnScreen", v5.receiver, v5.super_class);
  sub_1003C00F8(v4[OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_contentMustBeSelected]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = v5.receiver;
  [(DOCFilenameViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = 2;
  v4[OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_dismissing] = 0;
  sub_1003C0A28();
}

- (void)cancelViewController
{
  objc_super v2 = self;
  sub_1003C15C4();
}

- (NSArray)keyCommands
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = [v3 dismissingKeyCommandsWithAction:"cancelViewController"];
  sub_1000338CC(0, (unint64_t *)&unk_100618720);
  sub_1004BEDE0();

  v6.super.isa = sub_1004BEDC0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v6.super.isa;
}

- (void)editingDidEnd:(id)a3
{
}

- (void)editingDidChange:(id)a3
{
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v6 = v8.receiver;
  id v7 = a3;
  [(DOCFilenameViewController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    sub_1003C21D0();
  }
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DOCFilenameViewController *)&v9 effectiveAppearanceDidChange:v4];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v4 backgroundColor];
      [v7 setBackgroundColor:v8];

      id v4 = v7;
      id v5 = v8;
    }
  }
}

- (_TtC17RecentsAppPopover25DOCFilenameViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17RecentsAppPopover25DOCFilenameViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_filenameView));
  swift_unknownObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover25DOCFilenameViewController_item);
}

@end