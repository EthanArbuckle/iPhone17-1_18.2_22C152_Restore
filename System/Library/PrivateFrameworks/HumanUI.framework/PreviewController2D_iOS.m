@interface PreviewController2D_iOS
- (UIView)canvasView;
- (_TtC7HumanUI23PreviewController2D_iOS)init;
- (_TtC7HumanUI23PreviewController2D_iOS)initWithCoder:(id)a3;
- (_TtC7HumanUI23PreviewController2D_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setCanvasView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PreviewController2D_iOS

- (UIView)canvasView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView));
}

- (void)setCanvasView:(id)a3
{
  if (a3)
  {
    v5 = self;
    v6 = self;
    id v7 = a3;
    id v8 = objc_msgSend(v5, sel_clearColor);
    objc_msgSend(v7, sel_setBackgroundColor_, v8);

    id v9 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView);
    *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView) = (Class)a3;
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7HumanUI23PreviewController2D_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25298D4A8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7HumanUI23PreviewController2D_iOS *)sub_2529775B0(v5, v7, a4);
}

- (_TtC7HumanUI23PreviewController2D_iOS)init
{
  swift_getObjectType();
  v3 = (void *)sub_25298D498();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v6 = [(PreviewController2D_iOS *)self initWithNibName:v3 bundle:v5];

  return v6;
}

- (_TtC7HumanUI23PreviewController2D_iOS)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_252978AA8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_252977A08();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_252977B90(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_252977D20();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7HumanUI23PreviewController2D_iOS_canvasView));
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end