@interface CNPRUISPosterRenderingViewController
- (CNPRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4;
- (CNPRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5;
- (UIView)obscurableContentView;
- (void)registerLabel:(id)a3;
- (void)snapshotWithCompletionBlock:(id)a3;
@end

@implementation CNPRUISPosterRenderingViewController

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

- (CNPRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CNPRUISPosterRenderingViewController;
  v10 = [(CNPRUISPosterRenderingViewController *)&v36 init];
  if (v10)
  {
    v33 = [v8 wrappedPosterConfiguration];
    id v11 = objc_alloc((Class)getPRUISPosterRenderingViewControllerClass[0]());
    [v9 wrappedIncomingCallPosterContext];
    v12 = id v35 = v8;
    uint64_t v13 = [v11 initWithConfiguration:v33 context:v12 boundingShape:a5];
    wrappedPosterRenderingViewController = v10->_wrappedPosterRenderingViewController;
    v10->_wrappedPosterRenderingViewController = (PRUISPosterRenderingViewController *)v13;

    [(CNPRUISPosterRenderingViewController *)v10 view];
    v15 = id v34 = v9;
    v16 = [(PRUISPosterRenderingViewController *)v10->_wrappedPosterRenderingViewController view];
    [v15 addSubview:v16];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [v16 topAnchor];
    v31 = [v15 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v37[0] = v30;
    v29 = [v16 bottomAnchor];
    v28 = [v15 bottomAnchor];
    v26 = [v29 constraintEqualToAnchor:v28];
    v37[1] = v26;
    v17 = [v16 leadingAnchor];
    v18 = [v15 leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v37[2] = v19;
    v20 = [v16 trailingAnchor];
    v21 = [v15 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v37[3] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v27 activateConstraints:v23];

    id v8 = v35;
    v24 = v10;

    id v9 = v34;
  }

  return v10;
}

- (CNPRUISPosterRenderingViewController)initWithConfiguration:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNPRUISPosterRenderingViewController;
  id v8 = [(CNPRUISPosterRenderingViewController *)&v16 init];
  if (v8)
  {
    id v9 = [v6 wrappedPosterConfiguration];
    id v10 = objc_alloc((Class)getPRUISPosterRenderingViewControllerClass[0]());
    id v11 = [v7 wrappedIncomingCallPosterContext];
    uint64_t v12 = [v10 initWithConfiguration:v9 context:v11];
    wrappedPosterRenderingViewController = v8->_wrappedPosterRenderingViewController;
    v8->_wrappedPosterRenderingViewController = (PRUISPosterRenderingViewController *)v12;

    v14 = v8;
  }

  return v8;
}

- (UIView)obscurableContentView
{
  return (UIView *)[(PRUISPosterRenderingViewController *)self->_wrappedPosterRenderingViewController obscurableContentView];
}

@end