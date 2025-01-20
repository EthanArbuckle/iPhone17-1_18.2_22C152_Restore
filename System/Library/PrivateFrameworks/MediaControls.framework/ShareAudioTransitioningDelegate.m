@interface ShareAudioTransitioningDelegate
- (_TtC13MediaControls31ShareAudioTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation ShareAudioTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  type metadata accessor for ShareAudioPresentationController();
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1AE8DFCA8(v7, a4);

  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  type metadata accessor for ShareAudioPresentationAnimationController();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  id v13 = sub_1AE90E9A0(0, (uint64_t)v9);

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  type metadata accessor for ShareAudioPresentationAnimationController();
  id v5 = a3;
  v6 = self;
  id v7 = sub_1AE90E9A0(1, (uint64_t)v5);

  return v7;
}

- (_TtC13MediaControls31ShareAudioTransitioningDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ShareAudioTransitioningDelegate *)&v3 init];
}

@end