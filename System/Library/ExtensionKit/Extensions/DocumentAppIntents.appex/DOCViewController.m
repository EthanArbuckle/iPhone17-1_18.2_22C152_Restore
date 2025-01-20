@interface DOCViewController
- (_TtC18DocumentAppIntents17DOCViewController)init;
- (_TtC18DocumentAppIntents17DOCViewController)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents17DOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DOCViewController

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewIsAppearing:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC18DocumentAppIntents17DOCViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18DocumentAppIntents17DOCViewController_appearStateTracker;
  type metadata accessor for DOCAppearStateTracker();
  uint64_t v6 = swift_allocObject();
  *(_WORD *)(v6 + 16) = 0;
  *(unsigned char *)(v6 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v6;
  id v7 = a3;

  result = (_TtC18DocumentAppIntents17DOCViewController *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents17DOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = OBJC_IVAR____TtC18DocumentAppIntents17DOCViewController_appearStateTracker;
  type metadata accessor for DOCAppearStateTracker();
  uint64_t v7 = swift_allocObject();
  *(_WORD *)(v7 + 16) = 0;
  *(unsigned char *)(v7 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)v7;
  id v8 = a4;

  result = (_TtC18DocumentAppIntents17DOCViewController *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents17DOCViewController)init
{
  uint64_t v3 = OBJC_IVAR____TtC18DocumentAppIntents17DOCViewController_appearStateTracker;
  type metadata accessor for DOCAppearStateTracker();
  uint64_t v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 18) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCViewController();
  return [(DOCViewController *)&v6 initWithNibName:0 bundle:0];
}

- (void).cxx_destruct
{
}

@end