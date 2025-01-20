@interface ShareAudioPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC13MediaControls32ShareAudioPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation ShareAudioPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  double v3 = sub_1AE8E8668();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_1AE8E8798();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1AE8E8AA8();
}

- (_TtC13MediaControls32ShareAudioPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC13MediaControls32ShareAudioPresentationController_materialView;
  id v9 = objc_allocWithZone(MEMORY[0x1E4F743C8]);
  id v10 = a3;
  id v11 = a4;
  double v12 = self;
  *(Class *)((char *)&self->super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v15.receiver = v12;
  v15.super_class = ObjectType;
  double v13 = [(ShareAudioPresentationController *)&v15 initWithPresentedViewController:v10 presentingViewController:v11];

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13MediaControls32ShareAudioPresentationController_materialView));
}

@end