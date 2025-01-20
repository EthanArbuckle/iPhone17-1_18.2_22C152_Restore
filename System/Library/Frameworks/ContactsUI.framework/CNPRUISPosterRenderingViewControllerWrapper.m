@interface CNPRUISPosterRenderingViewControllerWrapper
- (CNPRUISPosterRenderingViewControllerWrapper)initWithConfiguration:(id)a3 context:(id)a4;
- (CNPRUISPosterRenderingViewControllerWrapper)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5;
- (UIView)obscurableContentView;
- (void)registerLabel:(id)a3;
- (void)snapshotWithCompletionBlock:(id)a3;
@end

@implementation CNPRUISPosterRenderingViewControllerWrapper

- (void).cxx_destruct
{
}

- (void)snapshotWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PRUISPosterRenderingViewController *)self->_wrappedPosterRenderingViewController snapshotWithOptions:2 forScreen:0 completionBlock:v4];
  }
  else {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)registerLabel:(id)a3
{
  id v4 = a3;
  v5 = [(PRUISPosterRenderingViewController *)self->_wrappedPosterRenderingViewController obscurableContentView];
  [v5 addSubview:v4];

  id v8 = v4;
  if ([v8 conformsToProtocol:&unk_1ED9D14F0]) {
    v6 = v8;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [(PRUISPosterRenderingViewController *)self->_wrappedPosterRenderingViewController registerPosterAppearanceObserver:v7];
}

- (CNPRUISPosterRenderingViewControllerWrapper)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNPRUISPosterRenderingViewControllerWrapper;
  v10 = [(CNPRUISPosterRenderingViewControllerWrapper *)&v18 init];
  if (v10)
  {
    v11 = [v8 wrappedPosterConfiguration];
    id v12 = objc_alloc((Class)getPRUISPosterRenderingViewControllerClass[0]());
    v13 = [v9 wrappedIncomingCallPosterContext];
    uint64_t v14 = [v12 initWithConfiguration:v11 context:v13 boundingShape:a5];
    wrappedPosterRenderingViewController = v10->_wrappedPosterRenderingViewController;
    v10->_wrappedPosterRenderingViewController = (PRUISPosterRenderingViewController *)v14;

    v16 = v10;
  }

  return v10;
}

- (CNPRUISPosterRenderingViewControllerWrapper)initWithConfiguration:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNPRUISPosterRenderingViewControllerWrapper;
  id v8 = [(CNPRUISPosterRenderingViewControllerWrapper *)&v16 init];
  if (v8)
  {
    id v9 = [v6 wrappedPosterConfiguration];
    id v10 = objc_alloc((Class)getPRUISPosterRenderingViewControllerClass[0]());
    v11 = [v7 wrappedIncomingCallPosterContext];
    uint64_t v12 = [v10 initWithConfiguration:v9 context:v11];
    wrappedPosterRenderingViewController = v8->_wrappedPosterRenderingViewController;
    v8->_wrappedPosterRenderingViewController = (PRUISPosterRenderingViewController *)v12;

    uint64_t v14 = v8;
  }

  return v8;
}

- (UIView)obscurableContentView
{
  return (UIView *)[(PRUISPosterRenderingViewController *)self->_wrappedPosterRenderingViewController obscurableContentView];
}

@end