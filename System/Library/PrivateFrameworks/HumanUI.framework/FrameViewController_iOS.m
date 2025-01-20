@interface FrameViewController_iOS
- (MTKView)metalView;
- (_TtC7HumanUI23FrameViewController_iOS)init;
- (_TtC7HumanUI23FrameViewController_iOS)initWithCoder:(id)a3;
- (_TtC7HumanUI23FrameViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setMetalView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FrameViewController_iOS

- (MTKView)metalView
{
  return (MTKView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView));
}

- (void)setMetalView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView) = (Class)a3;
  id v3 = a3;
}

- (_TtC7HumanUI23FrameViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_25298D4A8();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer) = 0;
    id v6 = a4;
    v7 = (void *)sub_25298D498();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FrameViewController_iOS();
  v9 = [(FrameViewController_iOS *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7HumanUI23FrameViewController_iOS)init
{
  swift_getObjectType();
  id v3 = (void *)sub_25298D498();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v6 = [(FrameViewController_iOS *)self initWithNibName:v3 bundle:v5];

  return v6;
}

- (_TtC7HumanUI23FrameViewController_iOS)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_metalView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer) = 0;
  id v4 = a3;

  result = (_TtC7HumanUI23FrameViewController_iOS *)sub_25298D678();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FrameViewController_iOS();
  id v2 = v4.receiver;
  [(FrameViewController_iOS *)&v4 viewDidLoad];
  id v3 = objc_msgSend(self, sel_sharedApplication, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setIdleTimerDisabled_, 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_252985AA4(a3);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7HumanUI23FrameViewController_iOS_renderer);
}

@end