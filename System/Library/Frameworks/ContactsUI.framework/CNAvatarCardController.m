@interface CNAvatarCardController
+ (BOOL)avatarCardEnabledForTraitCollection:(id)a3;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3;
+ (id)previewHeaderViewControllerForContacts:(id)a3;
- (BOOL)actionsNeedRefresh;
- (BOOL)bypassActionValidation;
- (BOOL)hasActions;
- (BOOL)isVisible;
- (BOOL)readyForContactsMatching:(id)a3;
- (CGRect)sourceRect;
- (CNActionMenuHelper)actionMenuHelper;
- (CNAvatarCardControllerDelegate)delegate;
- (CNAvatarView)avatarView;
- (CNContact)contact;
- (CNContactOrbActionsController)orbActionsController;
- (CNContactOrbHeaderView)headerView;
- (CNContactOrbHeaderViewController)orbHeaderViewController;
- (NSArray)actionCategories;
- (NSArray)contacts;
- (NSData)overrideImageData;
- (NSString)message;
- (NSString)name;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIGestureRecognizer)rolloverGestureRecognizer;
- (UIView)highlightView;
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteractionTargetedPreview;
- (id)headerViewController;
- (id)presentingViewControllerForActionsController:(id)a3;
- (id)refetchContactsMatching:(id)a3 storeProvider:(id)a4;
- (int64_t)presentationResult;
- (void)cleanupAfterDisplay;
- (void)configurePreviewInteraction;
- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)prepareForDisplay;
- (void)prepareWithContacts:(id)a3 store:(id)a4;
- (void)prepareWithContacts:(id)a3 storeProvider:(id)a4;
- (void)retrieveActions;
- (void)setActionCategories:(id)a3;
- (void)setActionMenuHelper:(id)a3;
- (void)setActionsNeedRefresh:(BOOL)a3;
- (void)setAvatarView:(id)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setName:(id)a3;
- (void)setOrbActionsController:(id)a3;
- (void)setOrbHeaderViewController:(id)a3;
- (void)setOverrideImageData:(id)a3;
- (void)setPresentationResult:(int64_t)a3;
- (void)setRolloverGestureRecognizer:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setupActionsControllerForContacts:(id)a3;
- (void)setupActionsForContacts:(id)a3;
- (void)showContact;
- (void)updateWithMenuItems:(id)a3;
@end

@implementation CNAvatarCardController

- (void)setActionCategories:(id)a3
{
}

- (void)setSourceView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_sourceView != v5)
  {
    v11 = v5;
    v6 = [(CNAvatarCardController *)self sourceView];
    v7 = [(CNAvatarCardController *)self contextMenuInteraction];
    [v6 removeInteraction:v7];

    objc_storeStrong((id *)&self->_sourceView, a3);
    v8 = [(UIView *)v11 traitCollection];
    BOOL v9 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:v8];

    v10 = [(CNAvatarCardController *)self sourceView];

    if (v10 && v9) {
      [(CNAvatarCardController *)self configurePreviewInteraction];
    }
    else {
      [(CNAvatarCardController *)self setContextMenuInteraction:0];
    }
    v5 = v11;
  }
}

- (UIView)sourceView
{
  return self->_sourceView;
}

+ (BOOL)avatarCardEnabledForTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 userInterfaceIdiom] != 3 && objc_msgSend(v3, "userInterfaceIdiom") != 5;

  return v4;
}

- (void)configurePreviewInteraction
{
  id v3 = [(CNAvatarCardController *)self contextMenuInteraction];

  if (!v3)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    [(CNAvatarCardController *)self setContextMenuInteraction:v4];
  }
  [(CNAvatarCardController *)self setPresentationResult:1];
  v5 = [(CNAvatarCardController *)self sourceView];
  v6 = [(CNAvatarCardController *)self contextMenuInteraction];
  [v5 addInteraction:v6];

  v7 = [(CNAvatarCardController *)self actionMenuHelper];

  if (!v7)
  {
    v8 = objc_alloc_init(CNActionMenuHelper);
    [(CNAvatarCardController *)self setActionMenuHelper:v8];
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setPresentationResult:(int64_t)a3
{
  self->_presentationResult = a3;
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (void)setActionMenuHelper:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setAvatarView:(id)a3
{
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

+ (id)descriptorForRequiredKeys
{
  return (id)[a1 descriptorForRequiredKeysIncludingAvatarViewDescriptors:1];
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  BOOL v3 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F1B8F8];
  v5 = [MEMORY[0x1E4F1B910] sharedFullNameFormatterWithFallBacks];
  v6 = +[CNContactOrbHeaderView descriptorForRequiredKeysForContactFormatter:v5 includingAvatarViewDescriptors:v3];
  v12[0] = v6;
  v7 = +[CNContactOrbActionsController descriptorForRequiredKeys];
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  BOOL v9 = [NSString stringWithUTF8String:"+[CNAvatarCardController descriptorForRequiredKeysIncludingAvatarViewDescriptors:]"];
  v10 = [v4 descriptorWithKeyDescriptors:v8 description:v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_avatarView);
  objc_storeStrong((id *)&self->_orbActionsController, 0);
  objc_storeStrong((id *)&self->_orbHeaderViewController, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_overrideImageData, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionCategories, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setActionsNeedRefresh:(BOOL)a3
{
  self->_actionsNeedRefresh = a3;
}

- (BOOL)actionsNeedRefresh
{
  return self->_actionsNeedRefresh;
}

- (void)setRolloverGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)rolloverGestureRecognizer
{
  return self->_rolloverGestureRecognizer;
}

- (void)setHeaderView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatarView);

  return (CNAvatarView *)WeakRetained;
}

- (void)setOrbActionsController:(id)a3
{
}

- (CNContactOrbActionsController)orbActionsController
{
  return self->_orbActionsController;
}

- (void)setOrbHeaderViewController:(id)a3
{
}

- (CNContactOrbHeaderViewController)orbHeaderViewController
{
  return self->_orbHeaderViewController;
}

- (void)setOverrideImageData:(id)a3
{
}

- (NSData)overrideImageData
{
  return self->_overrideImageData;
}

- (int64_t)presentationResult
{
  return self->_presentationResult;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (CNAvatarCardControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarCardControllerDelegate *)WeakRetained;
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (id)presentingViewControllerForActionsController:(id)a3
{
  BOOL v4 = [(CNAvatarCardController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CNAvatarCardController *)self delegate];
    v7 = [v6 presentingViewControllerForAvatarCardController:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
}

- (void)setupActionsControllerForContacts:(id)a3
{
  id v4 = a3;
  char v5 = [CNContactOrbActionsController alloc];
  v6 = [(CNAvatarCardController *)self actionCategories];
  v7 = [(CNContactOrbActionsController *)v5 initWithContacts:v4 actionCategories:v6 bypassActionValidation:[(CNAvatarCardController *)self bypassActionValidation]];

  [(CNAvatarCardController *)self setOrbActionsController:v7];
  v8 = [(CNAvatarCardController *)self orbActionsController];

  if (v8)
  {
    id v9 = [(CNAvatarCardController *)self orbActionsController];
    [v9 setDelegate:self];
  }
}

- (void)retrieveActions
{
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  id v7 = [(CNAvatarCardController *)self contacts];
  if (((*(uint64_t (**)(uint64_t))(v3 + 16))(v3) & 1) == 0)
  {
    id v4 = [(CNAvatarCardController *)self orbActionsController];

    if (!v4) {
      return;
    }
    char v5 = [(CNAvatarCardController *)self orbActionsController];
    [v5 reloadMenuItems];

    id v7 = [(CNAvatarCardController *)self orbActionsController];
    v6 = [v7 currentAvailableMenuItems];
    [(CNAvatarCardController *)self updateWithMenuItems:v6];
  }
}

- (void)setupActionsForContacts:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [(CNAvatarCardController *)self setupActionsControllerForContacts:v4];
  }
}

- (void)updateWithMenuItems:(id)a3
{
  id v4 = a3;
  id v6 = [(CNAvatarCardController *)self actionMenuHelper];
  char v5 = [(CNAvatarCardController *)self contextMenuInteraction];
  [v6 updateWithMenuItems:v4 contextMenuInteraction:v5];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v5 = [(CNAvatarCardController *)self actionMenuHelper];
  [v5 willDismissMenu];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a3;
  id v7 = [(CNAvatarCardController *)self actionMenuHelper];
  [v7 willDisplayMenuWithContextMenuInteraction:v6];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(CNAvatarCardController *)self setPresentationResult:1];
  id v7 = [(CNAvatarCardController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  id v9 = [(CNAvatarCardController *)self delegate];
  v10 = v9;
  if (v8)
  {
    -[CNAvatarCardController setPresentationResult:](self, "setPresentationResult:", objc_msgSend(v9, "avatarCardController:presentationResultForLocation:", self, x, y));

    if ((unint64_t)([(CNAvatarCardController *)self presentationResult] - 1) < 2) {
      goto LABEL_10;
    }
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(CNAvatarCardController *)self delegate];
      int v13 = objc_msgSend(v12, "avatarCardController:shouldPresentForLocation:", self, x, y);

      if (!v13)
      {
LABEL_10:
        v19 = 0;
        goto LABEL_11;
      }
      [(CNAvatarCardController *)self setPresentationResult:0];
    }
  }
  [(CNAvatarCardController *)self retrieveActions];
  v14 = [(CNAvatarCardController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [(CNAvatarCardController *)self delegate];
    [v16 avatarCardControllerWillBeginPreviewInteraction:self];
  }
  v17 = [(CNAvatarCardController *)self actionMenuHelper];
  v18 = [v17 configurationActionProviderWithActionBlock:&__block_literal_global_49_55491];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__CNAvatarCardController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v21[3] = &unk_1E549AB90;
  v21[4] = self;
  v19 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:v21 actionProvider:v18];

LABEL_11:

  return v19;
}

uint64_t __80__CNAvatarCardController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) orbHeaderViewController];
}

- (id)contextMenuInteractionTargetedPreview
{
  uint64_t v3 = [(CNAvatarCardController *)self highlightView];
  if ((v3
     || ([(CNAvatarCardController *)self sourceView],
         (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && ([v3 window], char v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [(CNAvatarCardController *)self actionMenuHelper];
    v10 = [v9 targetedPreviewForSourceView:v3];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = (void *)MEMORY[0x1E4FB14C0];
      [v3 bounds];
      v12 = objc_msgSend(v11, "bezierPathWithOvalInRect:");
      int v13 = [v10 parameters];
      [v13 setVisiblePath:v12];
    }
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNAvatarCardController.m", 445, 3, @"Tried to initialize UITargetedPreview with a view that is not in a window: %@", v4, v5, v6, v7, (uint64_t)v3);
    v10 = 0;
  }

  return v10;
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(CNAvatarCardController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CNAvatarCardController *)self delegate];
    [v9 avatarCardControllerWillDismiss:self];
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __60__CNAvatarCardController_dismissAnimated_completionHandler___block_invoke;
  v17 = &unk_1E549B710;
  v18 = self;
  id v19 = v6;
  id v10 = v6;
  char v11 = (void (**)(void))_Block_copy(&v14);
  v12 = [(CNAvatarCardController *)self contextMenuInteraction];

  if (v12)
  {
    v11[2](v11);
  }
  else
  {
    int v13 = [(CNAvatarCardController *)self presentingViewController];
    [v13 dismissViewControllerAnimated:v4 completion:v11];
  }
}

void __60__CNAvatarCardController_dismissAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 avatarCardControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)dismissAnimated:(BOOL)a3
{
}

- (UIViewController)presentingViewController
{
  uint64_t v3 = [(CNAvatarCardController *)self delegate];
  char v4 = [v3 presentingViewControllerForAvatarCardController:self];

  return (UIViewController *)v4;
}

- (void)showContact
{
  uint64_t v3 = [(CNAvatarCardController *)self contacts];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [(CNAvatarCardController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0
      && ([(CNAvatarCardController *)self delegate],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 avatarCardController:self shouldShowContact:v4],
          v7,
          (v8 & 1) == 0))
    {

      id v4 = 0;
    }
    else if ([v4 hasBeenPersisted])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __37__CNAvatarCardController_showContact__block_invoke;
      v9[3] = &unk_1E549B488;
      id v4 = v4;
      id v10 = v4;
      [(CNAvatarCardController *)self dismissAnimated:1 completionHandler:v9];
    }
  }
}

void __37__CNAvatarCardController_showContact__block_invoke(uint64_t a1)
{
  if (CNUIIsMobilePhone())
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];

    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v4 setScheme:@"search"];
    [v4 setHost:v3];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"/%u/%u", 2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
    [v4 setPath:v5];

    [v4 URL];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v7 = NSString;
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    [v7 stringWithFormat:@"contact://show?id=%@", v3];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v6 URLWithString:v4];
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  char v8 = +[CNUIContactsEnvironment currentEnvironment];
  id v9 = [v8 applicationWorkspace];
  [v9 openSensitiveURLInBackground:v10 withOptions:0];
}

- (NSString)message
{
  uint64_t v2 = [(CNAvatarCardController *)self headerView];
  uint64_t v3 = [v2 message];

  return (NSString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCardController *)self headerView];
  [v5 setMessage:v4];

  id v6 = [(CNAvatarCardController *)self headerView];
  [v6 reloadData];
}

- (NSString)name
{
  uint64_t v2 = [(CNAvatarCardController *)self headerView];
  uint64_t v3 = [v2 alternateName];

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCardController *)self headerView];
  [v5 setAlternateName:v4];

  id v6 = [(CNAvatarCardController *)self headerView];
  [v6 reloadData];
}

- (void)cleanupAfterDisplay
{
  [(CNAvatarCardController *)self prepareWithContacts:0 store:0];

  [(CNAvatarCardController *)self prepareForDisplay];
}

- (void)prepareForDisplay
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNAvatarCardController *)self overrideImageData];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1BA40] contactWithDisplayName:0 emailOrPhoneNumber:0];
    id v5 = [(CNAvatarCardController *)self overrideImageData];
    [v4 setImageData:v5];

    id v6 = [(CNAvatarCardController *)self headerView];
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v6 updateWithContacts:v7];

LABEL_5:
    goto LABEL_6;
  }
  char v8 = [(CNAvatarCardController *)self contacts];
  id v9 = [(CNAvatarCardController *)self headerView];
  id v10 = [v9 contacts];

  if (v8 != v10)
  {
    id v4 = [(CNAvatarCardController *)self headerView];
    id v6 = [(CNAvatarCardController *)self contacts];
    [v4 updateWithContacts:v6];
    goto LABEL_5;
  }
LABEL_6:
  char v11 = [(CNAvatarCardController *)self contacts];
  [(CNAvatarCardController *)self setupActionsForContacts:v11];
}

- (BOOL)hasActions
{
  uint64_t v3 = [(CNAvatarCardController *)self contacts];
  id v4 = [v3 firstObject];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNAvatarCardController *)self contacts];
  id v6 = [v5 firstObject];
  BOOL v7 = +[CNQuickActionsManager hasActionsForContact:v6];

  return v7;
}

- (id)refetchContactsMatching:(id)a3 storeProvider:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  if ([v5 count])
  {
    BOOL v7 = v6[2](v6);
    char v8 = [(id)objc_opt_class() descriptorForRequiredKeys];
    v39[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (([v16 areKeysAvailable:v9] & 1) == 0)
          {
            v17 = [v16 identifier];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }

    v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v10];
    id v33 = 0;
    id v19 = [v7 unifiedContactsMatchingPredicate:v18 keysToFetch:v9 error:&v33];
    id v20 = v33;

    if (!v19) {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNAvatarCardController.m", 251, 3, @"Error fetching contact: %@", v21, v22, v23, v24, (uint64_t)v20);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke;
    aBlock[3] = &unk_1E549AB68;
    id v31 = v9;
    id v32 = v19;
    id v25 = v19;
    id v26 = v9;
    v27 = _Block_copy(aBlock);
    objc_msgSend(v11, "_cn_map:", v27);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = v5;
  }

  return v28;
}

id __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 areKeysAvailable:*(void *)(a1 + 32)])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke_2;
    v10[3] = &unk_1E549C040;
    id v11 = v3;
    id v6 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v10);
    BOOL v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    }
    id v4 = v8;
  }

  return v4;
}

uint64_t __64__CNAvatarCardController_refetchContactsMatching_storeProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 allLinkedIdentifiers];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)readyForContactsMatching:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  id v6 = [(CNAvatarCardController *)self contacts];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = [(CNAvatarCardController *)self contacts];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) allLinkedIdentifiers];
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__CNAvatarCardController_readyForContactsMatching___block_invoke;
    v18[3] = &unk_1E549C040;
    id v19 = v8;
    id v15 = v8;
    char v16 = objc_msgSend(v4, "_cn_all:", v18);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

uint64_t __51__CNAvatarCardController_readyForContactsMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)prepareWithContacts:(id)a3 storeProvider:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(CNAvatarCardController *)self prepareWithOverrideImageData:0];
  if (![(CNAvatarCardController *)self readyForContactsMatching:v9])
  {
    uint64_t v7 = [(CNAvatarCardController *)self refetchContactsMatching:v9 storeProvider:v6];
    contacts = self->_contacts;
    self->_contacts = v7;

    [(CNAvatarCardController *)self setActionsNeedRefresh:0];
  }
}

- (void)prepareWithContacts:(id)a3 store:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CNAvatarCardController_prepareWithContacts_store___block_invoke;
  v8[3] = &unk_1E549AB40;
  id v9 = v6;
  id v7 = v6;
  [(CNAvatarCardController *)self prepareWithContacts:a3 storeProvider:v8];
}

id __52__CNAvatarCardController_prepareWithContacts_store___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setContacts:(id)a3
{
  [(CNAvatarCardController *)self prepareWithContacts:a3 storeProvider:&__block_literal_global_55535];

  [(CNAvatarCardController *)self prepareForDisplay];
}

id __38__CNAvatarCardController_setContacts___block_invoke()
{
  v0 = +[CNUIContactsEnvironment currentEnvironment];
  v1 = [v0 contactStore];

  return v1;
}

- (CNContact)contact
{
  uint64_t v2 = [(CNAvatarCardController *)self contacts];
  id v3 = [v2 firstObject];

  return (CNContact *)v3;
}

- (void)setContact:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CNAvatarCardController setContacts:](self, "setContacts:", v6, v7, v8);
}

- (CNContactOrbHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v4 = [CNContactOrbHeaderViewController alloc];
    id v5 = [(CNAvatarCardController *)self contacts];
    id v6 = [(CNContactOrbHeaderViewController *)v4 initWithContacts:v5];
    [(CNAvatarCardController *)self setOrbHeaderViewController:v6];

    id v7 = [(CNAvatarCardController *)self orbHeaderViewController];
    uint64_t v8 = [v7 headerView];
    [(CNAvatarCardController *)self setHeaderView:v8];

    headerView = self->_headerView;
  }

  return headerView;
}

- (id)headerViewController
{
  orbHeaderViewController = self->_orbHeaderViewController;
  if (!orbHeaderViewController)
  {
    uint64_t v4 = [CNContactOrbHeaderViewController alloc];
    id v5 = [(CNAvatarCardController *)self contacts];
    id v6 = [(CNContactOrbHeaderViewController *)v4 initWithContacts:v5];
    [(CNAvatarCardController *)self setOrbHeaderViewController:v6];

    id v7 = [(CNAvatarCardController *)self orbHeaderViewController];
    uint64_t v8 = [v7 headerView];
    [(CNAvatarCardController *)self setHeaderView:v8];

    orbHeaderViewController = self->_orbHeaderViewController;
  }

  return orbHeaderViewController;
}

+ (id)previewHeaderViewControllerForContacts:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CNContactOrbHeaderViewController alloc] initWithContacts:v3];

  return v4;
}

@end