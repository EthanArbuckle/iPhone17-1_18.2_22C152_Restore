@interface AVInfoTabViewController
- (AVPlayerItem)playerItem;
- (NSArray)actions;
- (_TtC5AVKit23AVInfoTabViewController)initWithCoder:(id)a3;
- (_TtC5AVKit23AVInfoTabViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5AVKit23AVInfoTabViewController)initWithPlayerItem:(id)a3 actions:(id)a4;
- (id)avkit_infoPanelKindIdentifier;
- (void)dealloc;
- (void)setActions:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AVInfoTabViewController

- (AVPlayerItem)playerItem
{
  return (AVPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem));
}

- (void)setPlayerItem:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1B05F88AC(a3);
}

- (NSArray)actions
{
  sub_1B05F5D00(0, (unint64_t *)&qword_1E9B34E40);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B0706070();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setActions:(id)a3
{
  sub_1B05F5D00(0, (unint64_t *)&qword_1E9B34E40);
  uint64_t v4 = sub_1B0706080();
  v5 = self;
  sub_1B05F662C(v4);
}

- (_TtC5AVKit23AVInfoTabViewController)initWithPlayerItem:(id)a3 actions:(id)a4
{
  sub_1B05F5D00(0, (unint64_t *)&qword_1E9B34E40);
  uint64_t v5 = sub_1B0706080();
  return (_TtC5AVKit23AVInfoTabViewController *)sub_1B05F67C8(a3, v5);
}

- (_TtC5AVKit23AVInfoTabViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken) = 0;
  id v4 = a3;

  result = (_TtC5AVKit23AVInfoTabViewController *)sub_1B07061F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  id v2 = v6.receiver;
  [(AVInfoTabViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1B05F7044();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1B05F6CA4();
}

- (void)dealloc
{
  id v2 = self;
  sub_1B05F6ED4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B05F18C4((uint64_t)self + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken);
}

- (id)avkit_infoPanelKindIdentifier
{
  sub_1B0706040();
  id v2 = (void *)sub_1B0706010();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC5AVKit23AVInfoTabViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5AVKit23AVInfoTabViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end