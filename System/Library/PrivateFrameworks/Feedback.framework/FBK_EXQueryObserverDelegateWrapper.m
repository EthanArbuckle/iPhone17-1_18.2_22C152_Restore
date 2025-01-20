@interface FBK_EXQueryObserverDelegateWrapper
- (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B534FBK_EXQueryObserverDelegateWrapper)init;
- (void)observerDidUpdate:(id)a3;
@end

@implementation FBK_EXQueryObserverDelegateWrapper

- (void)observerDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23CF8E2CC(v4);
}

- (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B534FBK_EXQueryObserverDelegateWrapper)init
{
  result = (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B534FBK_EXQueryObserverDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B534FBK_EXQueryObserverDelegateWrapper_hostViewController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B534FBK_EXQueryObserverDelegateWrapper_extensionKitHostViewControllerDelegate);
}

@end