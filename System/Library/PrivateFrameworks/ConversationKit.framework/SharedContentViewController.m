@interface SharedContentViewController
- (BOOL)isPipped;
- (BOOL)restoreViewControllerHierarchyWhenExitingPiP;
- (CGRect)frameForRestoreAnimation;
- (CGSize)preferredPiPContentAspectRatio;
- (_TtC15ConversationKit27SharedContentViewController)init;
- (_TtC15ConversationKit27SharedContentViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit27SharedContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)sharedContentSourceName;
- (id)viewControllerForPiP;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)getSharedContentSourceAvatarWithImageHandler:(id)a3;
- (void)screenSharingStateMonitorDidUpdateScreenInfoForParticipant:(id)a3;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)setIsPipped:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SharedContentViewController

- (BOOL)isPipped
{
  return SharedContentViewController.isPipped.getter() & 1;
}

- (void)setIsPipped:(BOOL)a3
{
  v4 = self;
  SharedContentViewController.isPipped.setter(a3);
}

- (_TtC15ConversationKit27SharedContentViewController)init
{
  return (_TtC15ConversationKit27SharedContentViewController *)SharedContentViewController.init()();
}

- (_TtC15ConversationKit27SharedContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SharedContentViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  SharedContentViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SharedContentViewController.viewDidLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  SharedContentViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC15ConversationKit27SharedContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  SharedContentViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_delegate);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_participant, &demangling cache variable for type metadata for Participant?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_sharedContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_screenSharingInteraction));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_previousViewModel, &demangling cache variable for type metadata for SharedContentViewModel?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_previousScreenSnapshot));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_avatarImageQueue);
}

- (id)viewForZoomingInScrollView:(id)a3
{
  SharedContentViewController.viewForZooming(in:)(v3, (UIScrollView *)self);
  return v4;
}

- (void)scrollViewDidZoom:(id)a3
{
  v4 = (UIScrollView *)a3;
  id v5 = self;
  SharedContentViewController.scrollViewDidZoom(_:)(v4);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  SharedContentViewController.scrollViewDidEndZooming(_:with:atScale:)(v7);
}

- (CGSize)preferredPiPContentAspectRatio
{
  v2 = self;
  CGSize v3 = SharedContentViewController.preferredPiPContentAspectRatio()();

  double width = v3.width;
  double height = v3.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)frameForRestoreAnimation
{
  v2 = self;
  __C::CGRect v11 = SharedContentViewController.frameForRestoreAnimation()();
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;

  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (id)viewControllerForPiP
{
  SharedContentViewController.viewControllerForPiP()(v2);
  return v3;
}

- (BOOL)restoreViewControllerHierarchyWhenExitingPiP
{
  return 1;
}

- (id)sharedContentSourceName
{
  v2 = self;
  Swift::String_optional v3 = SharedContentViewController.sharedContentSourceName()();

  if (v3.value._object)
  {
    v4 = (void *)MEMORY[0x1C87730B0](v3.value._countAndFlagsBits, v3.value._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)getSharedContentSourceAvatarWithImageHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  specialized SharedContentViewController.getSharedContentSourceAvatarWithImageHandler(_:)((uint64_t)v5, v4);
  _Block_release(v4);
}

- (void)screenSharingStateMonitorDidUpdateScreenInfoForParticipant:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  SharedContentViewController.screenSharingStateMonitorDidUpdateScreenInfoForParticipant(_:)();
  swift_unknownObjectRelease();
}

@end