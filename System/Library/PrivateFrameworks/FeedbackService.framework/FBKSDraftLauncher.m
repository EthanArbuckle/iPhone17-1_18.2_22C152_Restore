@interface FBKSDraftLauncher
- (FBKSDraftLauncher)form;
- (FBKSDraftLauncher)initWithFeedbackForm:(id)a3;
- (FBKSDraftLauncher_FrameworkPrivateName)swiftObject;
- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSDraftLauncher

- (FBKSDraftLauncher)initWithFeedbackForm:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBKSDraftLauncher;
  v5 = [(FBKSDraftLauncher *)&v11 init];
  if (v5)
  {
    v6 = [FBKSDraftLauncher_FrameworkPrivateName alloc];
    v7 = [v4 swiftObject];
    uint64_t v8 = [(FBKSDraftLauncher_FrameworkPrivateName *)v6 initWithFeedbackForm:v7];
    swiftObject = v5->_swiftObject;
    v5->_swiftObject = (FBKSDraftLauncher_FrameworkPrivateName *)v8;
  }
  return v5;
}

- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(FBKSDraftLauncher *)self swiftObject];
  uint64_t v8 = [v7 _swiftObject];

  [v9 collectFeedbackWithLaunchConfiguration:v8 completion:v6];
}

- (FBKSDraftLauncher)form
{
  return self->_form;
}

- (FBKSDraftLauncher_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
  objc_storeStrong((id *)&self->_form, 0);
}

@end