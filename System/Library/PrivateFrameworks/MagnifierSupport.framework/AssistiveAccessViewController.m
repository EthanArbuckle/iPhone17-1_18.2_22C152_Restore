@interface AssistiveAccessViewController
- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AssistiveAccessViewController

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_2356EF6A4();
  id v4 = objc_msgSend(self, sel_sharedApplication);
  objc_msgSend(v4, sel_setIdleTimerDisabled_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedApplication);
  objc_msgSend(v6, sel_setIdleTimerDisabled_, 0);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2356EF194();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AssistiveAccessViewController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[AssistiveAccessViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  sub_2356EF6A4();
  swift_unknownObjectRelease();
}

- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport29AssistiveAccessViewController *)sub_2356EFA0C(v5, v7, a4);
}

- (_TtC16MagnifierSupport29AssistiveAccessViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MagnifierSupport29AssistiveAccessViewController_cameraVideoPreviewView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for AssistiveAccessLivePreviewView());
  id v7 = a3;
  id v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AssistiveAccessViewController();
  v9 = [(AssistiveAccessViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29AssistiveAccessViewController_cameraVideoPreviewView));
}

@end