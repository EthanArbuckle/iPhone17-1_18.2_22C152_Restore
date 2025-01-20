@interface TodayArticleTransitioningDelegate
- (_TtC18ASMessagesProvider33TodayArticleTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation TodayArticleTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_28F9A4(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_292CF8(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_290E58(v4);

  return v6;
}

- (_TtC18ASMessagesProvider33TodayArticleTransitioningDelegate)init
{
  *(void *)&self->presentedViewController[OBJC_IVAR____TtC18ASMessagesProvider33TodayArticleTransitioningDelegate_presentedViewController] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->presentedViewController[OBJC_IVAR____TtC18ASMessagesProvider33TodayArticleTransitioningDelegate_presentingViewController] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider33TodayArticleTransitioningDelegate_selectedIndexPath;
  uint64_t v4 = sub_76C1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider33TodayArticleTransitioningDelegate_shouldUseReducedMotionTransition) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TodayArticleTransitioningDelegate();
  return [(TodayArticleTransitioningDelegate *)&v6 init];
}

- (void).cxx_destruct
{
}

@end