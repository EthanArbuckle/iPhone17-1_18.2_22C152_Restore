@interface FBK_EXHostViewControllerDelegateWrapper
- (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper)init;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5;
@end

@implementation FBK_EXHostViewControllerDelegateWrapper

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23CF8FBC4();
}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_23CF8FCF0(a5);
}

- (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper)init
{
  result = (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end