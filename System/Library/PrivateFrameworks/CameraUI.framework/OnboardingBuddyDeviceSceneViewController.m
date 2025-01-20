@interface OnboardingBuddyDeviceSceneViewController
- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithCoder:(id)a3;
- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation OnboardingBuddyDeviceSceneViewController

- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_209C22CF0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_209C1DBB4(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_209C1E518();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_209C20744(a3);
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_209C22EF8(a4);
}

- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowAccentAnimationStateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter);
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  id v7 = self;
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  id v10 = objc_msgSend(v7, sel_mainQueue);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  v14[4] = sub_209C22BF0;
  v14[5] = v11;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_209C1DB88;
  v14[3] = &block_descriptor_0;
  v12 = _Block_copy(v14);
  v13 = v9;
  swift_release();
  objc_msgSend(v10, sel_addOperationWithBlock_, v12);
  _Block_release(v12);
  swift_unknownObjectRelease();
}

@end