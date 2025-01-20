@interface CNAvatarViewController
+ (Class)defaultImplementation;
+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3;
- (BOOL)allowStaleRendering;
- (BOOL)isPerformingTransition;
- (CALayer)sourceAvatarLayer;
- (CNAvatarViewController)initWithCoder:(id)a3;
- (CNAvatarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNAvatarViewController)initWithSettings:(id)a3;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate;
- (UIImageView)destinationAvatarImageView;
- (id)descriptorForRequiredKeys;
- (void)performTransitionAnimationWithCompletion:(id)a3;
- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4;
- (void)setAllowStaleRendering:(BOOL)a3;
- (void)setIsPerformingTransition:(BOOL)a3;
- (void)setObjectViewControllerDelegate:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
@end

@implementation CNAvatarViewController

- (CNAvatarViewController)initWithSettings:(id)a3
{
  id v4 = a3;
  if ([(CNAvatarViewController *)self isMemberOfClass:objc_opt_class()])
  {

    v5 = (CNAvatarViewController *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "defaultImplementation")), "initWithSettings:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNAvatarViewController;
    v5 = [(CNAvatarViewController *)&v8 initWithNibName:0 bundle:0];
  }
  v6 = v5;

  return v6;
}

+ (Class)defaultImplementation
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);

  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

- (void)setObjectViewControllerDelegate:(id)a3
{
}

- (CNAvatarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = +[CNAvatarViewControllerSettings defaultSettings];
  v6 = [(CNAvatarViewController *)self initWithSettings:v5];

  return v6;
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  return +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:a3];
}

- (void)setAllowStaleRendering:(BOOL)a3
{
  self->_allowStaleRendering = a3;
}

- (BOOL)allowStaleRendering
{
  return self->_allowStaleRendering;
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  self->_isPerformingTransition = a3;
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);

  return (CNUIObjectViewControllerDelegate *)WeakRetained;
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t))a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_super v8 = [(CNAvatarViewController *)self sharedProfileStateOracle];

  if (!v8)
  {
    v9 = CNUILogAvatarView();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_7;
  }
  if (![(CNAvatarViewController *)self isPerformingTransition])
  {
    v10 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    v11 = [(CNAvatarViewController *)self sharedProfileStateOracle];
    uint64_t v12 = [v11 avatarViewAnimationTypeForEffectiveState];

    if (v6) {
      v6[2](v6, v12);
    }
    if (v12 == 2)
    {
      v19 = CNUILogAvatarView();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v19, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7) {
        v7[2](v7, 2);
      }
      goto LABEL_25;
    }
    if (v12 == 1)
    {
      v20 = CNUILogAvatarView();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v20, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      [(CNAvatarViewController *)self setIsPerformingTransition:1];
      v21 = [(CNAvatarViewController *)self sharedProfileStateOracle];
      v22 = [v21 pendingNickname];
      v23 = [(CNAvatarViewController *)self sharedProfileStateOracle];
      v24 = [v23 contact];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_7;
      v25[3] = &unk_1E549B710;
      v25[4] = self;
      v26 = v7;
      [(CNSharedProfileAnimationGenerator *)v10 performPeekABooAnimationForAnimatingAvatarView:self pendingNickname:v22 contact:v24 completionHandler:v25];

      v18 = v26;
    }
    else
    {
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
      v13 = CNUILogAvatarView();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v13, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      [(CNAvatarViewController *)self setIsPerformingTransition:1];
      v14 = [(CNAvatarViewController *)self sharedProfileStateOracle];
      v15 = [v14 pendingNickname];
      v16 = [(CNAvatarViewController *)self sharedProfileStateOracle];
      v17 = [v16 contact];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v27[3] = &unk_1E549B710;
      v27[4] = self;
      v28 = v7;
      [(CNSharedProfileAnimationGenerator *)v10 performCoinFlipAnimationForAnimatingAvatarView:self pendingNickname:v15 contact:v17 completionHandler:v27];

      v18 = v28;
    }

    goto LABEL_25;
  }
  v9 = CNUILogAvatarView();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_7:

  if (v7) {
    v7[2](v7, 2);
  }
LABEL_26:
}

uint64_t __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPerformingTransition:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPerformingTransition:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
}

- (UIImageView)destinationAvatarImageView
{
  v2 = [(CNAvatarViewController *)self view];
  v3 = [v2 destinationAvatarImageView];

  return (UIImageView *)v3;
}

- (CALayer)sourceAvatarLayer
{
  v2 = [(CNAvatarViewController *)self view];
  v3 = [v2 sourceAvatarLayer];

  return (CALayer *)v3;
}

- (CNAvatarViewController)initWithCoder:(id)a3
{
  id v4 = +[CNAvatarViewControllerSettings defaultSettings];
  v5 = [(CNAvatarViewController *)self initWithSettings:v4];

  return v5;
}

- (id)descriptorForRequiredKeys
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = [NSString stringWithUTF8String:"-[CNAvatarViewController descriptorForRequiredKeys]"];
  id v4 = [v2 descriptorWithKeyDescriptors:MEMORY[0x1E4F1CBF0] description:v3];

  return v4;
}

@end