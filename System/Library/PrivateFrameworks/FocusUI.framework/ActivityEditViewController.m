@interface ActivityEditViewController
- (_TtC7FocusUI26ActivityEditViewController)initWithActivityDescription:(id)a3;
- (_TtC7FocusUI26ActivityEditViewController)initWithCoder:(id)a3;
- (_TtC7FocusUI26ActivityEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)visibleHeight;
- (id)willDisappearBlock;
- (void)handleTap:(id)a3;
- (void)setWillDisappearBlock:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActivityEditViewController

- (_TtC7FocusUI26ActivityEditViewController)initWithActivityDescription:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight) = (Class)0x4084000000000000;
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  void *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityEditViewController();
  swift_unknownObjectRetain();
  return [(ActivityEditViewController *)&v5 initWithNibName:0 bundle:0];
}

- (_TtC7FocusUI26ActivityEditViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight) = (Class)0x4084000000000000;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7FocusUI26ActivityEditViewController *)sub_21FF03588();
  __break(1u);
  return result;
}

- (double)visibleHeight
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight);
}

- (id)willDisappearBlock
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21FF0108C;
    aBlock[3] = &block_descriptor_13;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setWillDisappearBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_21FF02BC4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_21FF007A4(v7);
}

- (void)viewDidLoad
{
  v2 = self;
  ActivityEditViewController.viewDidLoad()();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivityEditViewController();
  v4 = v8.receiver;
  id v5 = [(ActivityEditViewController *)&v8 viewWillDisappear:v3];
  v6 = (void (*)(void *))(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v4) + 0x70))(v5);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6(v4);
    sub_21FF007A4(v7);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  ActivityEditViewController.viewWillAppear(_:)(a3);
}

- (void)handleTap:(id)a3
{
}

- (_TtC7FocusUI26ActivityEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7FocusUI26ActivityEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  sub_21FF007A4(v3);
}

@end