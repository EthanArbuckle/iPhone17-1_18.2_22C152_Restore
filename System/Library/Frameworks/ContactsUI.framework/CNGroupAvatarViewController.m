@interface CNGroupAvatarViewController
+ (id)descriptorForRequiredKeys;
+ (id)log;
+ (unint64_t)maxContactAvatars;
- (BOOL)_canShowWhileLocked;
- (BOOL)contactsEqualToContactsFromGroup:(id)a3;
- (BOOL)isDoNotDisturb;
- (BOOL)isMarkedForSyndication;
- (BOOL)isPerformingTransition;
- (CALayer)sourceAvatarLayer;
- (CGSize)primaryAvatarSize;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings;
- (CNGroupAvatarViewController)initWithGroup:(id)a3;
- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarLayoutType:(unint64_t)a4;
- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4;
- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4 avatarLayoutType:(unint64_t)a5;
- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4 avatarLayoutType:(unint64_t)a5 withLayoutDelegate:(id)a6;
- (CNGroupIdentity)group;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (CNVisualIdentityAvatarViewController)avatarViewController;
- (UIImage)badgeImage;
- (UIImageView)destinationAvatarImageView;
- (id)avatarLayerForIdentifier:(id)a3;
- (id)avatarLayers;
- (void)groupIdentityDidUpdate:(id)a3;
- (void)loadView;
- (void)performTransitionAnimationWithCompletion:(id)a3;
- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeStyleSettings:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIsDoNotDisturb:(BOOL)a3;
- (void)setIsMarkedForSyndication:(BOOL)a3;
- (void)setIsPerformingTransition:(BOOL)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
@end

@implementation CNGroupAvatarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);

  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNVisualIdentityAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setGroup:(id)a3
{
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t))a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = [(CNGroupAvatarViewController *)self group];
  uint64_t v9 = [v8 numberOfContacts];

  if (v9 != 1)
  {
    v11 = CNUILogAvatarView();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(CNGroupAvatarViewController *)self group];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v12 numberOfContacts];
      _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, "Skipping transition animation, not supported for groups of %ld", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v10 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];

  if (!v10)
  {
    v11 = CNUILogAvatarView();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18B625000, v11, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_10;
  }
  if (![(CNGroupAvatarViewController *)self isPerformingTransition])
  {
    v13 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    v14 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];
    uint64_t v15 = [v14 avatarViewAnimationTypeForEffectiveState];

    if (v6) {
      v6[2](v6, v15);
    }
    if (v15 == 2)
    {
      v22 = CNUILogAvatarView();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v22, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7) {
        v7[2](v7, 2);
      }
      goto LABEL_28;
    }
    if (v15 == 1)
    {
      v23 = CNUILogAvatarView();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v23, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      [(CNGroupAvatarViewController *)self setIsPerformingTransition:1];
      v24 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];
      v25 = [v24 pendingNickname];
      v26 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];
      v27 = [v26 contact];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_37;
      v28[3] = &unk_1E549B710;
      v28[4] = self;
      v29 = v7;
      [(CNSharedProfileAnimationGenerator *)v13 performPeekABooAnimationForAnimatingAvatarView:self pendingNickname:v25 contact:v27 completionHandler:v28];

      v21 = v29;
    }
    else
    {
      if (v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      v16 = CNUILogAvatarView();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      [(CNGroupAvatarViewController *)self setIsPerformingTransition:1];
      v17 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];
      v18 = [v17 pendingNickname];
      v19 = [(CNGroupAvatarViewController *)self sharedProfileStateOracle];
      v20 = [v19 contact];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v30[3] = &unk_1E549B710;
      v30[4] = self;
      v31 = v7;
      [(CNSharedProfileAnimationGenerator *)v13 performCoinFlipAnimationForAnimatingAvatarView:self pendingNickname:v18 contact:v20 completionHandler:v30];

      v21 = v31;
    }

    goto LABEL_28;
  }
  v11 = CNUILogAvatarView();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_10:

  if (v7) {
    v7[2](v7, 2);
  }
LABEL_29:
}

uint64_t __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
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

uint64_t __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_37(uint64_t a1)
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

- (void)setIsPerformingTransition:(BOOL)a3
{
  if (self->_isPerformingTransition != a3)
  {
    BOOL v3 = a3;
    self->_isPerformingTransition = a3;
    id v4 = [(CNGroupAvatarViewController *)self avatarViewController];
    [v4 setIsPerformingTransition:v3];
  }
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
}

- (UIImageView)destinationAvatarImageView
{
  v2 = [(CNGroupAvatarViewController *)self avatarViewController];
  BOOL v3 = [v2 primaryAvatarAlternativeImageView];

  return (UIImageView *)v3;
}

- (CALayer)sourceAvatarLayer
{
  v2 = [(CNGroupAvatarViewController *)self avatarViewController];
  BOOL v3 = [v2 primaryAvatarLayer];

  return (CALayer *)v3;
}

- (CGSize)primaryAvatarSize
{
  v2 = [(CNGroupAvatarViewController *)self avatarViewController];
  [v2 primaryAvatarSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  if (self->_isDoNotDisturb != a3)
  {
    self->_isDoNotDisturb = a3;
    if (a3)
    {
      double v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", @"moon.fill", -1, 0, 1, *MEMORY[0x1E4FB28F0]);
      [(CNGroupAvatarViewController *)self setBadgeImage:v4];

      id v5 = +[CNBadgingAvatarBadgeStyleSettings doNotDisturbBadgeSettings];
      [(CNGroupAvatarViewController *)self setBadgeStyleSettings:v5];
    }
    else
    {
      [(CNGroupAvatarViewController *)self setBadgeImage:0];
    }
  }
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  if (self->_isMarkedForSyndication != a3)
  {
    self->_isMarkedForSyndication = a3;
    if (a3)
    {
      double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.circle.fill"];
      [(CNGroupAvatarViewController *)self setBadgeImage:v4];

      id v5 = +[CNBadgingAvatarBadgeStyleSettings markedForSyndicationBadgeSettings];
      [(CNGroupAvatarViewController *)self setBadgeStyleSettings:v5];
    }
    else
    {
      [(CNGroupAvatarViewController *)self setBadgeImage:0];
    }
  }
}

- (void)setMediaContextBadge:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
  id v5 = a3;
  id v6 = [(CNGroupAvatarViewController *)self avatarViewController];
  [v6 setMediaContextBadge:v5];
}

- (void)setBadgeStyleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
  id v5 = a3;
  id v6 = [(CNGroupAvatarViewController *)self avatarViewController];
  [v6 setBadgeStyleSettings:v5];
}

- (void)setBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImage, a3);
  id v5 = a3;
  id v6 = [(CNGroupAvatarViewController *)self avatarViewController];
  [v6 setBadgeImage:v5];
}

- (BOOL)contactsEqualToContactsFromGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(CNGroupAvatarViewController *)self group];
  id v6 = [v5 contacts];
  uint64_t v7 = [v6 count];
  double v8 = [v4 contacts];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    v10 = [(CNGroupAvatarViewController *)self group];
    v11 = [v10 contacts];
    v12 = [v4 contacts];
    v13 = objc_msgSend(v11, "_cn_zip:", v12);

    char v14 = objc_msgSend(v13, "_cn_all:", &__block_literal_global_29_44505);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __64__CNGroupAvatarViewController_contactsEqualToContactsFromGroup___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 first];
  id v4 = [v2 second];

  uint64_t v5 = [v3 isEqualIgnoringIdentifiers:v4];
  return v5;
}

- (void)groupIdentityDidUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 groupPhoto];
  if (!v7)
  {
    double v3 = [(CNGroupAvatarViewController *)self group];
    id v4 = [v3 groupPhoto];
    if (!v4)
    {
      char v11 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  double v8 = [v6 groupPhoto];
  uint64_t v9 = [(CNGroupAvatarViewController *)self group];
  v10 = [v9 groupPhoto];
  char v11 = [v8 isEqualToData:v10] ^ 1;

  if (!v7) {
    goto LABEL_6;
  }
LABEL_7:

  BOOL v12 = [(CNGroupAvatarViewController *)self contactsEqualToContactsFromGroup:v6];
  v13 = (void *)[v6 mutableCopy];
  [(CNGroupAvatarViewController *)self setGroup:v13];

  char v14 = [(id)objc_opt_class() log];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if ((v11 & 1) != 0 || !v12)
  {
    if (v15)
    {
      v21 = [v6 contacts];
      uint64_t v22 = [v21 count];
      v23 = [(CNGroupAvatarViewController *)self avatarViewController];
      v24 = [v23 containingCellView];
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_INFO, "Group identity did update. itemCount:%lu, containingCell:%{public}@", buf, 0x16u);
    }
    v25 = [[CNVisualIdentity alloc] initWithGroupIdentity:v6];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__CNGroupAvatarViewController_groupIdentityDidUpdate___block_invoke;
    v26[3] = &unk_1E5499DE0;
    v26[4] = self;
    v27 = v25;
    v20 = v25;
    [(CNGroupAvatarViewController *)self performTransitionAnimationWithCompletion:v26];
  }
  else
  {
    if (v15)
    {
      v16 = [v6 contacts];
      uint64_t v17 = [v16 count];
      v18 = [(CNGroupAvatarViewController *)self avatarViewController];
      v19 = [v18 containingCellView];
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      v31 = v19;
      _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_INFO, "Skipping group identity update - no photo or contact changes. itemCount:%lu, containingCell:%{public}@", buf, 0x16u);
    }
    v20 = [(CNGroupAvatarViewController *)self avatarViewController];
    [(CNVisualIdentity *)v20 logSublayersContent];
  }
}

void __54__CNGroupAvatarViewController_groupIdentityDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avatarViewController];
  [v2 visualIdentityDidUpdate:*(void *)(a1 + 40)];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  double v3 = [CNGroupAvatarContainerView alloc];
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  uint64_t v7 = -[CNGroupAvatarContainerView initWithFrame:](v3, "initWithFrame:");

  uint64_t v5 = [(CNGroupAvatarViewController *)self avatarViewController];
  id v6 = [v5 view];
  [(CNGroupAvatarContainerView *)v7 setUnderlyingContainerView:v6];

  [(CNGroupAvatarViewController *)self setView:v7];
}

- (id)avatarLayerForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CNGroupAvatarViewController *)self avatarViewController];
  id v6 = [v5 avatarLayoutManager];
  uint64_t v7 = [v6 avatarLayerItems];

  double v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = [v11 identifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          double v8 = [v11 layer];
          goto LABEL_11;
        }
      }
      double v8 = (void *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)avatarLayers
{
  id v2 = [(CNGroupAvatarViewController *)self avatarViewController];
  double v3 = [v2 avatarLayoutManager];
  id v4 = [v3 avatarLayerItems];
  uint64_t v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_23_44514);

  return v5;
}

uint64_t __43__CNGroupAvatarViewController_avatarLayers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 layer];
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4 avatarLayoutType:(unint64_t)a5 withLayoutDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)CNGroupAvatarViewController;
  char v13 = [(CNGroupAvatarViewController *)&v30 init];
  if (v13)
  {
    uint64_t v14 = [v10 mutableCopy];
    group = v13->_group;
    v13->_group = (CNGroupIdentity *)v14;

    if (v11)
    {
      long long v16 = [CNAvatarImageRendererSettings alloc];
      long long v17 = [v11 likenessResolver];
      long long v18 = [v11 likenessRenderer];
      v19 = [v11 schedulerProvider];
      uint64_t v20 = [(CNAvatarImageRendererSettings *)v16 initWithLikenessResolver:v17 likenessRenderer:v18 schedulerProvider:v19];
    }
    else
    {
      uint64_t v20 = 0;
    }
    v21 = [CNVisualIdentityAvatarViewController alloc];
    uint64_t v22 = [[CNVisualIdentity alloc] initWithGroupIdentity:v10];
    uint64_t v23 = [(CNVisualIdentityAvatarViewController *)v21 initWithVisualIdentity:v22 primaryAvatarProvider:0 avatarImageRendererSettings:v20 avatarLayoutType:a5 withLayoutDelegate:v12];
    avatarViewController = v13->_avatarViewController;
    v13->_avatarViewController = (CNVisualIdentityAvatarViewController *)v23;

    v25 = [(CNVisualIdentityAvatarViewController *)v13->_avatarViewController view];
    [v25 setAutoresizingMask:18];

    v26 = [(CNGroupAvatarViewController *)v13 view];
    v27 = [(CNVisualIdentityAvatarViewController *)v13->_avatarViewController view];
    [v26 addSubview:v27];

    [(CNGroupAvatarViewController *)v13 addChildViewController:v13->_avatarViewController];
    [(CNVisualIdentityAvatarViewController *)v13->_avatarViewController didMoveToParentViewController:v13];
    v28 = v13;
  }
  return v13;
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4 avatarLayoutType:(unint64_t)a5
{
  return [(CNGroupAvatarViewController *)self initWithGroup:a3 avatarViewControllerSettings:a4 avatarLayoutType:a5 withLayoutDelegate:0];
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4
{
  return [(CNGroupAvatarViewController *)self initWithGroup:a3 avatarViewControllerSettings:a4 avatarLayoutType:0];
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarLayoutType:(unint64_t)a4
{
  return [(CNGroupAvatarViewController *)self initWithGroup:a3 avatarViewControllerSettings:0 avatarLayoutType:a4];
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3
{
  return [(CNGroupAvatarViewController *)self initWithGroup:a3 avatarViewControllerSettings:0];
}

+ (unint64_t)maxContactAvatars
{
  return +[CNVisualIdentityAvatarViewController maxContactAvatars];
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_44527 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_44527, &__block_literal_global_14_44528);
  }
  id v2 = (void *)descriptorForRequiredKeys_cn_once_object_2_44529;

  return v2;
}

void __56__CNGroupAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = +[CNVisualIdentityAvatarViewController descriptorForRequiredKeys];
  v6[0] = v1;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  double v3 = [NSString stringWithUTF8String:"+[CNGroupAvatarViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  uint64_t v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_44529;
  descriptorForRequiredKeys_cn_once_object_2_44529 = v4;
}

+ (id)log
{
  if (log_cn_once_token_1_44534 != -1) {
    dispatch_once(&log_cn_once_token_1_44534, &__block_literal_global_44535);
  }
  id v2 = (void *)log_cn_once_object_1_44536;

  return v2;
}

void __34__CNGroupAvatarViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNGroupAvatarViewController");
  v1 = (void *)log_cn_once_object_1_44536;
  log_cn_once_object_1_44536 = (uint64_t)v0;
}

@end