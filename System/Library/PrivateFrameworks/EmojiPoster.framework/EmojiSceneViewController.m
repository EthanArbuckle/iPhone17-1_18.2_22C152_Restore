@interface EmojiSceneViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (_TtC11EmojiPoster24EmojiSceneViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster24EmojiSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EmojiSceneViewController

- (void)loadView
{
  v2 = self;
  sub_20B90FEA4();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiSceneViewController();
  id v2 = v3.receiver;
  [(EmojiSceneViewController *)&v3 viewDidLoad];
  sub_20B91028C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = (double *)swift_allocObject();
  *((void *)v8 + 2) = self;
  v8[3] = width;
  v8[4] = height;
  aBlock[4] = sub_20B911A6C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20B910A18;
  aBlock[3] = &block_descriptor_23;
  v9 = _Block_copy(aBlock);
  v10 = self;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v9, 0);
  _Block_release(v9);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for EmojiSceneViewController();
  -[EmojiSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6) {
    return 30;
  }
  else {
    return 26;
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (_TtC11EmojiPoster24EmojiSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_20B926948();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11EmojiPoster24EmojiSceneViewController *)EmojiSceneViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster24EmojiSceneViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster24EmojiSceneViewController *)EmojiSceneViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_20B9119A0((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_configuration, (uint64_t)v3, &qword_2676A59A0);
  sub_20B8EC000((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_20B8EC06C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_overlayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_sceneView));
  sub_20B91166C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster24EmojiSceneViewController_scene);
}

@end