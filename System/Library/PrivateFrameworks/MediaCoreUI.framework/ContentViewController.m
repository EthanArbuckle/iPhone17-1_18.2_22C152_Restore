@interface ContentViewController
- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithCoder:(id)a3;
- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidLayoutSubviews;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ContentViewController

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_backdropView) = 0;
  id v4 = a3;

  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *)sub_255C81248();
  __break(1u);
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_statusBarStyle);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_255C53E1C();
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ContentViewController();
  v2 = v5.receiver;
  [(ContentViewController *)&v5 viewSafeAreaInsetsDidChange];
  if (v2[OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_isActive] != 1) {
    goto LABEL_4;
  }
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    id v4 = v3;
    sub_255AB3C14(v3);

    v2 = v4;
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_255C54034(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_contentView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_backdropView);
}

@end