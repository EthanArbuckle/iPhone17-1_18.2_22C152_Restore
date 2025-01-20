@interface AppCardContainerViewController
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (_TtC7ChatKit30AppCardContainerViewController)initWithCoder:(id)a3;
- (_TtC7ChatKit30AppCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3;
- (void)closeButtonPressed;
- (void)dealloc;
- (void)loadView;
- (void)setShowingDarkEffect:(BOOL)a3 isInDarkMode:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AppCardContainerViewController

- (void)loadView
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F42FF0]);
  v8 = self;
  id v4 = objc_msgSend(v3, sel_init);
  [(AppCardContainerViewController *)v8 setView:v4];

  id v5 = [(AppCardContainerViewController *)v8 view];
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v6, sel_setBackgroundColor_, v7);

    sub_18F5D015C();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F5D0900();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  id v3 = self;
  unint64_t result = (unint64_t)objc_msgSend(v2, sel_balloonPlugin);
  if (result)
  {
    id v5 = (void *)result;
    char v6 = sub_18F5CFE78();

    if (v6)
    {

      return 2;
    }
    else
    {
      v8.receiver = v3;
      v8.super_class = (Class)type metadata accessor for AppCardContainerViewController();
      id v7 = [(AppCardContainerViewController *)&v8 supportedInterfaceOrientations];
    }
    return (unint64_t)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  char v6 = (char *)v11.receiver;
  id v7 = a3;
  [(AppCardContainerViewController *)&v11 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  objc_super v8 = &v6[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate];
  if (MEMORY[0x192FBC390](&v6[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate]))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, id, uint64_t, uint64_t))(v9 + 40))(v6, v7, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  char v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  if (objc_msgSend(v6, sel_respondsToSelector_, sel_checkForTouchInRemoteProcessIfNecessaryWithCompletion_))
  {
    v10[4] = sub_18F5D3614;
    v10[5] = v5;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 1107296256;
    v10[2] = sub_18F4F9C40;
    v10[3] = &block_descriptor_38;
    id v7 = _Block_copy(v10);
    objc_super v8 = self;
    id v9 = v6;
    sub_18F7B5790();
    swift_release();
    objc_msgSend(v9, sel_checkForTouchInRemoteProcessIfNecessaryWithCompletion_, v7);
    _Block_release(v7);

    swift_release();
  }
  else
  {
    swift_release();
  }
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController);
  if (objc_msgSend(v3, sel_respondsToSelector_, sel_forceTearDownRemoteViewOverridingExceptions_))
  {
    uint64_t v4 = *((unsigned __int8 *)&self->super.super.super.isa
         + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_shouldOverrideExceptionsOnDismissal);
    uint64_t v5 = self;
    objc_msgSend(v3, sel_forceTearDownRemoteViewOverridingExceptions_, v4);
  }
  else
  {
    char v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  [(AppCardContainerViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController));
  objc_release(*(id *)((char *)&self->super._view
                     + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_popoverPresentationLocation));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_sendDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_touchTrackingGesture);
}

- (_TtC7ChatKit30AppCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_18F5D34F0();
}

- (_TtC7ChatKit30AppCardContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5D34F0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_18F5D1DFC(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_18F5D1F48(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_18F5D2074(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_18F5D21B0();
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  char v6 = (char *)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate;
  if (MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_presentationDelegate, a2, a3, a4))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    objc_super v8 = *(double (**)(void))(v7 + 48);
    id v9 = a3;
    v10 = self;
    double v11 = v8();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    swift_unknownObjectRelease();
  }
  else
  {
    double v11 = *MEMORY[0x1E4F437F8];
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AppCardContainerViewController();
  swift_unknownObjectRetain();
  uint64_t v7 = (char *)v9.receiver;
  -[AppCardContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_super v8 = &v7[OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_cachedCompactDetentHeight];
  *(void *)objc_super v8 = 0;
  v8[8] = 1;
  swift_unknownObjectRelease();
}

- (void)closeButtonPressed
{
}

- (void)setShowingDarkEffect:(BOOL)a3 isInDarkMode:(BOOL)a4
{
  id v4 = self;
  sub_18F5D2F58();
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  v2 = self;
  id v3 = sub_18F5D3170();

  return (_UIRemoteViewController *)v3;
}

@end