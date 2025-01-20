@interface CKNavbarCanvasViewController
+ (void)updateFTControlsWithConversation:(id)a3 canvasViewController:(id)a4 screenSharingCapabilities:(id)a5 unifiedCallButton:(id)a6;
- (BOOL)_canShowAvatarView;
- (BOOL)_isConfiguredForInlineReply;
- (BOOL)_shouldShowFacetimeButton;
- (BOOL)_shouldShowPersistentMenu;
- (BOOL)canShowBackButtonView;
- (BOOL)editing;
- (BOOL)findMyNavBarEnabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasConfiguredCallButtonAudioRouteActions;
- (BOOL)hideChevron;
- (BOOL)isInEditingMode;
- (BOOL)locationLabelHidden;
- (BOOL)shouldConfigureForJunkModal;
- (BOOL)shouldDisplayParticipantLocationWhenAvailable;
- (BOOL)shouldShowDoneButton;
- (BOOL)shouldUseMinimumSafeAreas;
- (BOOL)splitViewControllerIsCollapsed;
- (BOOL)wantsVerifiedIconForTitle:(id)a3;
- (CKCanvasBackButtonView)backButtonView;
- (CKConversation)conversation;
- (CKDetailsContactsManager)contactsManager;
- (CKLabel)defaultLabel;
- (CKNavBarConversationIdentityView)conversationIdentityView;
- (CKNavBarUnifiedCallButton)unifiedCallButton;
- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4;
- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4 hideLocationIfUnavailable:(BOOL)a5;
- (CKNavbarCanvasViewControllerDelegate)delegate;
- (CKNavigationBarCanvasView)canvasView;
- (CNContactStore)suggestionsEnabledContactStore;
- (IMFindMyLocation)locationToDisplay;
- (NSDictionary)modernScreenSharingCapabilities;
- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3;
- (NSString)navbarTitle;
- (UIBarButtonItem)detailsBarButton;
- (UIButton)callButton;
- (UIButton)closeButton;
- (UIButton)detailsButton;
- (UIButton)doneButton;
- (UIButton)editCancelButtonView;
- (UILabel)locationLabel;
- (UINavigationController)proxyNavigationController;
- (_TtC7ChatKit29CKNavBarPersistentMenuManager)persistentMenuManager;
- (id)_KTTitleIconAttributedString;
- (id)_leftItemViewForTraitCollection:(id)a3;
- (id)_rightItemViewForTraitCollection:(id)a3;
- (id)_titleItemViewForTraitCollection:(id)a3;
- (id)_windowTraitCollection;
- (id)contextMenuForUnknownRecipient:(id)a3;
- (id)navBarTitleFromConversation:(id)a3;
- (id)navigationItem;
- (id)persistentMenuButton;
- (id)recipientContextMenu;
- (int64_t)_unreadCount;
- (int64_t)indicatorType;
- (int64_t)navBarContext;
- (void)_addUserDidTapNavigationBarRecognizer:(id)a3;
- (void)_buttonPressed:(id)a3;
- (void)_chatUnreadCountDidChange:(id)a3;
- (void)_configureForDefaultMode;
- (void)_configureForEditMode;
- (void)_contactPhotosEnabledChangedNotification:(id)a3;
- (void)_facetimeAudioButtonTapped:(id)a3;
- (void)_facetimeVideoButtonTapped:(id)a3;
- (void)_handleAddressBookChange:(id)a3;
- (void)_handleAllowedByScreenTimeChatChanged:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_handleServiceChangedNotification:(id)a3;
- (void)_infoButtonTapped:(id)a3;
- (void)_initializeForTraitCollection:(id)a3;
- (void)_notifyDelegateForNavBarResize;
- (void)_refreshIDSStatusWithCompletion:(id)a3;
- (void)_updateFTControls;
- (void)_updateUnreadCountForBackbuttonView:(int64_t)a3;
- (void)_userDidTapNavigationBar;
- (void)button:(id)a3 requestsJoinActiveCallWithVideoEnabled:(BOOL)a4;
- (void)button:(id)a3 requestsStartFaceTimeWithScreenShareType:(unint64_t)a4;
- (void)buttonRequestsOpenJoinedCall:(id)a3;
- (void)buttonRequestsStartFaceTimeAudio:(id)a3;
- (void)buttonRequestsStartFaceTimeVideo:(id)a3;
- (void)buttonRequestsStartTelephonyCall:(id)a3;
- (void)buttonWidthDidChange:(id)a3;
- (void)configureForEditing:(BOOL)a3;
- (void)conversationIdentityViewTapped:(id)a3;
- (void)dealloc;
- (void)dismissModal;
- (void)fmfSessionChatLocationReceived:(id)a3;
- (void)fmfSessionChatLocationRefreshed:(id)a3;
- (void)fmfSessionRelationshipDidChange:(id)a3;
- (void)handleCloseNavBarAnimationCompleteNotification:(id)a3;
- (void)loadView;
- (void)persistentMenuManager:(id)a3 selectedChipAction:(id)a4;
- (void)persistentMenuManager:(id)a3 selectedSuggestedReply:(id)a4;
- (void)refreshAudioButtonTargetAction;
- (void)refreshFMFLocationIfNecessary;
- (void)registerNotifications;
- (void)setBackButtonView:(id)a3;
- (void)setCallButton:(id)a3;
- (void)setCanShowBackButtonView:(BOOL)a3;
- (void)setCanvasView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setConversation:(id)a3;
- (void)setConversationIdentityView:(id)a3;
- (void)setDefaultLabel:(id)a3;
- (void)setDefaultLabelText;
- (void)setDelegate:(id)a3;
- (void)setDetailsBarButton:(id)a3;
- (void)setDetailsButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditCancelButtonView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHasConfiguredCallButtonAudioRouteActions:(BOOL)a3;
- (void)setIndicatorType:(int64_t)a3;
- (void)setIsInEditingMode:(BOOL)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationLabelHidden:(BOOL)a3;
- (void)setLocationToDisplay:(id)a3;
- (void)setModernScreenSharingCapabilities:(id)a3;
- (void)setNavBarContext:(int64_t)a3;
- (void)setNavbarTitle:(id)a3;
- (void)setPersistentMenuManager:(id)a3;
- (void)setProxyNavigationController:(id)a3;
- (void)setShouldDisplayParticipantLocationWhenAvailable:(BOOL)a3;
- (void)setShouldShowDoneButton:(BOOL)a3;
- (void)setSuggestionsEnabledContactStore:(id)a3;
- (void)setUnifiedCallButton:(id)a3;
- (void)setUnreadCountTitleColor;
- (void)showContactCardForEntity:(id)a3 address:(id)a4;
- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAvatarPickerDelegate;
- (void)updateContentsForConversation:(id)a3;
- (void)updateDefaultLabelIfNecessary;
- (void)updateForRecoveredJunkConversation;
- (void)updateLeftItemView;
- (void)updateLocationLabel;
- (void)updateLocationLabelParentViewAssignment;
- (void)updateLocationToDisplayWithHandle:(id)a3;
- (void)updateRightItemView;
- (void)updateTitle:(id)a3 animated:(BOOL)a4;
- (void)updateTitleViewAnimated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKNavbarCanvasViewController

- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4
{
  return [(CKNavbarCanvasViewController *)self initWithConversation:a3 navigationController:a4 hideLocationIfUnavailable:0];
}

- (CKNavbarCanvasViewController)initWithConversation:(id)a3 navigationController:(id)a4 hideLocationIfUnavailable:(BOOL)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CKNavbarCanvasViewController;
  v10 = [(CKNavbarCanvasViewController *)&v22 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    [(CKNavbarCanvasViewController *)v10 setConversation:v8];
    [(CKNavbarCanvasViewController *)v11 setProxyNavigationController:v9];
    v12 = [(CKNavbarCanvasViewController *)v11 navBarTitleFromConversation:v8];
    [(CKNavbarCanvasViewController *)v11 setNavbarTitle:v12];

    [(CKNavbarCanvasViewController *)v11 registerNotifications];
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL v14 = [(CKNavbarCanvasViewController *)v11 findMyNavBarEnabled];
        uint64_t v15 = [(CKNavbarCanvasViewController *)v11 conversation];
        v16 = (void *)v15;
        v17 = @"NO";
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[CKNavbarCanvasViewController initWithConversation:navigationController:hideLocationIfUnavailable:]";
        __int16 v24 = 2112;
        if (v14) {
          v17 = @"YES";
        }
        v25 = v17;
        __int16 v26 = 2112;
        uint64_t v27 = v15;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s: Nav bar location refresh enablement: %@ for conversation: %@", buf, 0x20u);
      }
    }
    if ([(CKNavbarCanvasViewController *)v11 findMyNavBarEnabled])
    {
      [(CKNavbarCanvasViewController *)v11 refreshFMFLocationIfNecessary];
      if (a5)
      {
        v18 = [(CKNavbarCanvasViewController *)v11 locationToDisplay];
        [(CKNavbarCanvasViewController *)v11 setLocationLabelHidden:v18 == 0];
      }
      else
      {
        [(CKNavbarCanvasViewController *)v11 setLocationLabelHidden:0];
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v11);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __100__CKNavbarCanvasViewController_initWithConversation_navigationController_hideLocationIfUnavailable___block_invoke;
    v20[3] = &unk_1E56215C8;
    objc_copyWeak(&v21, (id *)buf);
    [(CKNavbarCanvasViewController *)v11 _refreshIDSStatusWithCompletion:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

void __100__CKNavbarCanvasViewController_initWithConversation_navigationController_hideLocationIfUnavailable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateFTControls];
}

- (void)dealloc
{
  conversationIdentityView = self->_conversationIdentityView;
  self->_conversationIdentityView = 0;

  [(CKNavigationBarCanvasView *)self->_canvasView clearAllItemViews];
  v4.receiver = self;
  v4.super_class = (Class)CKNavbarCanvasViewController;
  [(CKNavbarCanvasViewController *)&v4 dealloc];
}

- (void)registerNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v4 = [(CKNavbarCanvasViewController *)self conversation];
  [v3 addObserver:self selector:sel__handleConversationRecipientsDidChange_ name:@"CKConversationParticipantsDidChangeNotification" object:v4];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F6B888];
  v7 = [(CKNavbarCanvasViewController *)self conversation];
  id v8 = [v7 chat];
  [v5 addObserver:self selector:sel__handleAllowedByScreenTimeChatChanged_ name:v6 object:v8];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__handleKeyTransparencyStatusChangedNotification_ name:*MEMORY[0x1E4F6B998] object:0];

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__handleServiceChangedNotification_ name:*MEMORY[0x1E4F6BA80] object:0];

  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel_fmfSessionRelationshipDidChange_ name:*MEMORY[0x1E4F6BB00] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F6BAF0];
    BOOL v14 = [(CKNavbarCanvasViewController *)self conversation];
    uint64_t v15 = [v14 chat];
    [v12 addObserver:self selector:sel_fmfSessionChatLocationRefreshed_ name:v13 object:v15];

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:self selector:sel_fmfSessionChatLocationReceived_ name:*MEMORY[0x1E4F6BAF8] object:0];
  }
}

- (void)_refreshIDSStatusWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CKNavbarCanvasViewController *)self conversation];
  uint64_t v6 = [v5 recipients];
  v7 = objc_msgSend(v6, "__im_canonicalIDSAddressesFromEntities");

  if ([v7 count])
  {
    id v8 = dispatch_group_create();
    id v9 = [(CKNavbarCanvasViewController *)self conversation];
    BOOL v10 = +[CKFaceTimeUtilities isModernScreenSharingAvailable:v9];

    if (v10)
    {
      dispatch_group_enter(v8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke;
      v14[3] = &unk_1E5623B88;
      v14[4] = self;
      uint64_t v15 = v8;
      +[CKFaceTimeUtilities queryModernScreenSharingCapabilities:v7 completion:v14];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E5620F48;
    id v13 = v4;
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
  }
  else if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CKNavbarCanvasViewController _refreshIDSStatusWithCompletion:]";
      __int16 v18 = 2048;
      uint64_t v19 = [v7 count];
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%s early returning for addresses.count: %lu", buf, 0x16u);
    }
  }
}

void __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setModernScreenSharingCapabilities:a2];
  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __64__CKNavbarCanvasViewController__refreshIDSStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshFMFLocationIfNecessary
{
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    v3 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    id v4 = [(CKNavbarCanvasViewController *)self conversation];
    v5 = [v4 recipient];
    uint64_t v6 = [v5 defaultIMHandle];
    id v8 = [v3 findMyLocationForHandleOrSibling:v6];

    if (v8) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
    [(CKNavbarCanvasViewController *)self setLocationToDisplay:v7];
  }
}

- (BOOL)findMyNavBarEnabled
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isFindMyNavBarEnabled];

  v5 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  char v6 = [v5 disableLocationSharing];

  id v7 = [(CKNavbarCanvasViewController *)self conversation];
  if (v7)
  {
    id v8 = [(CKNavbarCanvasViewController *)self conversation];
    int v9 = [v8 isGroupConversation] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v4 & ~v6 & v9;
}

- (void)fmfSessionChatLocationRefreshed:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v4 object];
    }
    else
    {
      char v6 = 0;
    }

    id v7 = [(CKNavbarCanvasViewController *)self conversation];
    id v8 = [v7 chat];
    int v9 = [v6 isEqual:v8];

    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = [(CKNavbarCanvasViewController *)self conversation];
          v12 = [v11 recipient];
          id v13 = [v12 defaultIMHandle];
          int v17 = 136315394;
          __int16 v18 = "-[CKNavbarCanvasViewController fmfSessionChatLocationRefreshed:]";
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s handle: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      BOOL v14 = [(CKNavbarCanvasViewController *)self conversation];
      uint64_t v15 = [v14 recipient];
      id v16 = [v15 defaultIMHandle];
      [(CKNavbarCanvasViewController *)self updateLocationToDisplayWithHandle:v16];
    }
  }
}

- (void)fmfSessionChatLocationReceived:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v4 object];
    }
    else
    {
      char v6 = 0;
    }

    id v7 = [(CKNavbarCanvasViewController *)self conversation];
    id v8 = [v7 chat];
    int v9 = [v8 recipient];
    BOOL v10 = [v6 identifier];
    __int16 v19 = v6;
    if ([v9 isEqual:v10])
    {
    }
    else
    {
      v11 = [(CKNavbarCanvasViewController *)self conversation];
      v12 = [v11 chat];
      id v13 = [v12 allSiblingFindMyHandles];
      char v14 = [v13 containsObject:v6];

      if ((v14 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[CKNavbarCanvasViewController fmfSessionChatLocationReceived:]";
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "%s handle: %@", buf, 0x16u);
      }
    }
    id v16 = [(CKNavbarCanvasViewController *)self conversation];
    int v17 = [v16 recipient];
    __int16 v18 = [v17 defaultIMHandle];
    [(CKNavbarCanvasViewController *)self updateLocationToDisplayWithHandle:v18];

    goto LABEL_13;
  }
LABEL_14:
}

- (void)fmfSessionRelationshipDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v4 object];

      if (v6)
      {
        id v7 = [(CKNavbarCanvasViewController *)self conversation];
        id v8 = [v7 chat];
        int v9 = [v8 allSiblingFindMyHandles];
        int v10 = [v9 containsObject:v6];

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              int v12 = 136315394;
              id v13 = "-[CKNavbarCanvasViewController fmfSessionRelationshipDidChange:]";
              __int16 v14 = 2112;
              uint64_t v15 = v6;
              _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%s handle: %@", (uint8_t *)&v12, 0x16u);
            }
          }
          [(CKNavbarCanvasViewController *)self refreshFMFLocationIfNecessary];
        }
      }
    }
    else
    {

      char v6 = 0;
    }
  }
}

- (void)updateLocationToDisplayWithHandle:(id)a3
{
  id v16 = a3;
  BOOL v4 = [(CKNavbarCanvasViewController *)self findMyNavBarEnabled];
  if (v16)
  {
    if (v4)
    {
      v5 = [(CKNavbarCanvasViewController *)self conversation];
      char v6 = [v5 chat];
      id v7 = [v6 allSiblingFindMyHandles];
      id v8 = [v16 findMyHandle];
      int v9 = [v7 containsObject:v8];

      if (v9)
      {
        int v10 = [MEMORY[0x1E4F6BCB8] sharedInstance];
        v11 = [(CKNavbarCanvasViewController *)self conversation];
        int v12 = [v11 recipient];
        id v13 = [v12 defaultIMHandle];
        __int16 v14 = [v10 findMyLocationForHandleOrSibling:v13];

        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        [(CKNavbarCanvasViewController *)self setLocationToDisplay:v15];
      }
    }
  }
}

- (void)setLocationLabelHidden:(BOOL)a3
{
  if (self->_locationLabelHidden != a3)
  {
    BOOL v3 = a3;
    self->_locationLabelHidden = a3;
    v5 = [(CKNavbarCanvasViewController *)self locationLabel];
    [v5 setHidden:v3];

    char v6 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    [v6 setSubtitleHidden:v3];

    [(CKNavbarCanvasViewController *)self _notifyDelegateForNavBarResize];
  }
}

- (void)setLocationToDisplay:(id)a3
{
  id v5 = a3;
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled]
    && ([v5 isEqual:self->_locationToDisplay] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locationToDisplay, a3);
    [(CKNavbarCanvasViewController *)self updateLocationLabel];
  }
}

- (void)updateLocationLabel
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled])
  {
    BOOL v3 = [(CKNavbarCanvasViewController *)self locationToDisplay];
    BOOL v4 = [v3 shortAddress];

    if (v4)
    {
      id v5 = [(CKNavbarCanvasViewController *)self locationLabel];
      char v6 = [v5 attributedText];
      id v7 = [v6 string];
      char v8 = [v7 isEqualToString:v4];

      if (v8)
      {
        int v9 = [(CKNavbarCanvasViewController *)self locationLabel];
        int v10 = [v9 attributedText];
        v11 = [v10 attributesAtIndex:0 effectiveRange:0];

        int v12 = +[CKUIBehavior sharedBehaviors];
        id v13 = [(CKNavbarCanvasViewController *)self traitCollection];
        __int16 v14 = [v13 preferredContentSizeCategory];
        uint64_t v15 = [v12 navBarSubtitleAttributedStringAttributesForContentSizeCategory:v14];

        uint64_t v16 = *MEMORY[0x1E4FB06F8];
        int v17 = [v11 objectForKey:*MEMORY[0x1E4FB06F8]];
        objc_opt_class();
        double v18 = 0.0;
        if (objc_opt_isKindOfClass())
        {
          [v17 pointSize];
          double v18 = v19;
        }
        uint64_t v20 = [v15 objectForKey:v16];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v22 = 0.0;
        if (isKindOfClass) {
          objc_msgSend(v20, "pointSize", 0.0);
        }
        if (v18 != v22)
        {
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v15];
          uint64_t v24 = [(CKNavbarCanvasViewController *)self locationLabel];
          [v24 setAttributedText:v23];

          v25 = [(CKNavbarCanvasViewController *)self locationLabel];
          [v25 sizeToFit];

          __int16 v26 = [(CKNavbarCanvasViewController *)self locationLabel];
          [v26 setNeedsLayout];
        }
      }
      else
      {
        id v30 = objc_alloc(MEMORY[0x1E4F42B38]);
        v11 = objc_msgSend(v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v31 = +[CKUIBehavior sharedBehaviors];
        v32 = [(CKNavbarCanvasViewController *)self traitCollection];
        v33 = [v32 preferredContentSizeCategory];
        uint64_t v15 = [v31 navBarSubtitleAttributedStringAttributesForContentSizeCategory:v33];

        v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v15];
        [v11 setAttributedText:v34];

        v35 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
        [v11 setTextColor:v35];

        [v11 setTextAlignment:1];
        [(CKNavbarCanvasViewController *)self setLocationLabel:v11];
      }

      v36 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
      v37 = [v36 subtitle];
      char v38 = [v37 isEqualToString:v4];

      if (v38)
      {
        if (v8)
        {
          [(CKNavbarCanvasViewController *)self updateLocationLabelParentViewAssignment];
LABEL_32:

          return;
        }
      }
      else
      {
        v39 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
        [v39 setSubtitle:v4];
      }
      if (IMOSLoggingEnabled())
      {
        v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          int v47 = 136315138;
          v48 = "-[CKNavbarCanvasViewController updateLocationLabel]";
          _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "%s updated label with a new short address", (uint8_t *)&v47, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          BOOL v42 = [(CKNavbarCanvasViewController *)self locationLabelHidden];
          int v47 = 67109120;
          LODWORD(v48) = v42;
          _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Location label is shown: %{BOOL}d", (uint8_t *)&v47, 8u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v47 = 136315138;
          v48 = "-[CKNavbarCanvasViewController updateLocationLabel]";
          _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "%s current location is nil or does not have a short address to display.", (uint8_t *)&v47, 0xCu);
        }
      }
      uint64_t v28 = [(CKNavbarCanvasViewController *)self locationLabel];
      if (!v28)
      {
        v43 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
        v44 = [v43 subtitle];
        char v45 = [v44 isEqualToString:&stru_1EDE4CA38];

        [(CKNavbarCanvasViewController *)self setLocationLabel:0];
        v46 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
        [v46 setSubtitle:&stru_1EDE4CA38];

        [(CKNavbarCanvasViewController *)self updateLocationLabelParentViewAssignment];
        if (v45) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }

      [(CKNavbarCanvasViewController *)self setLocationLabel:0];
      v29 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
      [v29 setSubtitle:&stru_1EDE4CA38];
    }
    [(CKNavbarCanvasViewController *)self updateLocationLabelParentViewAssignment];
LABEL_31:
    [(CKNavbarCanvasViewController *)self _notifyDelegateForNavBarResize];
    goto LABEL_32;
  }
}

- (void)setLocationLabel:(id)a3
{
  id v7 = (UILabel *)a3;
  BOOL v5 = [(CKNavbarCanvasViewController *)self findMyNavBarEnabled];
  char v6 = v7;
  if (v5 && self->_locationLabel != v7)
  {
    [(UILabel *)v7 sizeToFit];
    objc_storeStrong((id *)&self->_locationLabel, a3);
    [(UILabel *)self->_locationLabel setHidden:[(CKNavbarCanvasViewController *)self locationLabelHidden]];
    char v6 = v7;
  }
}

- (void)updateLocationLabelParentViewAssignment
{
  if ([(CKNavbarCanvasViewController *)self _canShowAvatarView])
  {
    BOOL v3 = [(CKNavbarCanvasViewController *)self canvasView];
    id v6 = v3;
    BOOL v4 = 0;
  }
  else
  {
    locationLabel = self->_locationLabel;
    BOOL v3 = [(CKNavbarCanvasViewController *)self canvasView];
    id v6 = v3;
    BOOL v4 = locationLabel;
  }
  [v3 setSubtitleView:v4];
}

- (id)navBarTitleFromConversation:(id)a3
{
  id v4 = a3;
  if (IMIsRunningInScreenshotTesting_IsolatedTranscriptUI())
  {
    BOOL v5 = 0;
  }
  else
  {
    if ([v4 hasDisplayName]) {
      [v4 displayName];
    }
    else {
    BOOL v5 = objc_msgSend(v4, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, -[CKNavbarCanvasViewController _canShowAvatarView](self, "_canShowAvatarView"));
    }
  }

  return v5;
}

- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CKNavbarCanvasViewController *)self conversation];
  id v7 = [v5 recipient];

  if (v7)
  {
    id v6 = [(CKNavbarCanvasViewController *)self contactsManager];
    [v6 startCommunicationForEntity:v7 action:2 address:0 usePreferredRouteIfAvailable:v3];
  }
}

- (id)_windowTraitCollection
{
  v2 = [MEMORY[0x1E4F43058] keyWindow];
  BOOL v3 = [v2 traitCollection];

  return v3;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  if (self->_isInEditingMode != a3)
  {
    self->_BOOL isInEditingMode = a3;
    id v4 = [(CKNavbarCanvasViewController *)self canvasView];
    [v4 setShouldAnimateAvatarLayoutChanges:1];

    BOOL isInEditingMode = self->_isInEditingMode;
    id v6 = [(CKNavbarCanvasViewController *)self canvasView];
    [v6 setIsInEditingMode:isInEditingMode];
  }
}

- (BOOL)_canShowAvatarView
{
  if (IMIsRunningInScreenshotTesting_IsolatedTranscriptUI()) {
    return 0;
  }
  id v4 = [(CKNavbarCanvasViewController *)self delegate];
  char v5 = [v4 shouldShowAvatarViewInNavBarCanvas];

  return v5;
}

- (CKDetailsContactsManager)contactsManager
{
  contactsManager = self->_contactsManager;
  if (!contactsManager)
  {
    id v4 = [[CKDetailsContactsManager alloc] initWithConversation:self->_conversation delegate:self];
    char v5 = self->_contactsManager;
    self->_contactsManager = v4;

    contactsManager = self->_contactsManager;
  }

  return contactsManager;
}

- (id)navigationItem
{
  return 0;
}

- (void)loadView
{
  id v14 = [(CKNavbarCanvasViewController *)self _windowTraitCollection];
  BOOL v3 = [CKNavigationBarCanvasView alloc];
  id v4 = -[CKNavigationBarCanvasView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKNavbarCanvasViewController *)self setCanvasView:v4];

  if ([(CKNavbarCanvasViewController *)self findMyNavBarEnabled]) {
    [(CKNavbarCanvasViewController *)self updateLocationLabel];
  }
  char v5 = [(CKNavbarCanvasViewController *)self canvasView];
  [v5 setDelegate:self];

  id v6 = [(CKNavbarCanvasViewController *)self conversation];
  int v7 = [v6 isGroupConversation];

  if (v7)
  {
    uint64_t v8 = +[CKFaceTimeUtilities isGroupFaceTimeSupported] ^ 1;
    int v9 = [(CKNavbarCanvasViewController *)self canvasView];
    [v9 setMultiwayAudioButtonHidden:v8];
  }
  int v10 = [(CKNavbarCanvasViewController *)self canvasView];
  [v10 setKeepTitleViewCentered:1];

  [(CKNavbarCanvasViewController *)self _initializeForTraitCollection:v14];
  v11 = [(CKNavbarCanvasViewController *)self navbarTitle];
  [(CKNavbarCanvasViewController *)self updateTitle:v11 animated:0];

  [(CKNavbarCanvasViewController *)self updateAvatarPickerDelegate];
  int v12 = [(CKNavbarCanvasViewController *)self canvasView];
  [v12 setClipsToBounds:1];

  id v13 = [(CKNavbarCanvasViewController *)self canvasView];
  [(CKNavbarCanvasViewController *)self setView:v13];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  char v5 = [(CKNavbarCanvasViewController *)self canvasView];
  id v6 = [v5 leftItemView];

  int v7 = [(CKNavbarCanvasViewController *)self canvasView];
  uint64_t v8 = [v7 buttonViewFaceTimeAudio];

  int v9 = [(CKNavbarCanvasViewController *)self canvasView];
  int v10 = [v9 buttonViewFaceTimeVideo];

  v11 = [(CKNavbarCanvasViewController *)self view];
  [v4 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  if (![(CKNavbarCanvasViewController *)self shouldShowAvatarView])
  {
    [v6 frame];
    v20.x = v13;
    v20.y = v15;
    if (!CGRectContainsPoint(v23, v20))
    {
      [v8 frame];
      v21.x = v13;
      v21.y = v15;
      if (!CGRectContainsPoint(v24, v21))
      {
        [v10 frame];
        v22.x = v13;
        v22.y = v15;
        int v18 = !CGRectContainsPoint(v25, v22);
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  if ([(CKNavbarCanvasViewController *)self navBarContext] != 1)
  {
LABEL_6:
    LOBYTE(v18) = 0;
    goto LABEL_7;
  }
  uint64_t v16 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
  int v17 = [(CKNavbarCanvasViewController *)self canvasView];
  int v18 = objc_msgSend(v16, "avatarWantsTapAtPoint:fromView:", v17, v13, v15) ^ 1;

LABEL_7:
  return v18;
}

- (void)_updateFTControls
{
  id v5 = [(CKNavbarCanvasViewController *)self conversation];
  BOOL v3 = [(CKNavbarCanvasViewController *)self modernScreenSharingCapabilities];
  id v4 = [(CKNavbarCanvasViewController *)self unifiedCallButton];
  +[CKNavbarCanvasViewController updateFTControlsWithConversation:v5 canvasViewController:self screenSharingCapabilities:v3 unifiedCallButton:v4];
}

+ (void)updateFTControlsWithConversation:(id)a3 canvasViewController:(id)a4 screenSharingCapabilities:(id)a5 unifiedCallButton:(id)a6
{
  id v39 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [v39 chat];
  double v13 = [v12 conversation];

  if (v13)
  {
    BOOL v14 = [v13 state] == 3 || objc_msgSend(v13, "state") == 2;
    int v17 = [MEMORY[0x1E4F6BCC0] conversationIsVideoCall:v13];
    char v18 = [MEMORY[0x1E4F6BCC0] conversationIsAVLessSharePlay:v13];
    uint64_t v19 = [v13 state];
    if (v14)
    {
      uint64_t v20 = 4;
      uint64_t v21 = 2;
      if (v17) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v21 = 4;
      }
      BOOL v22 = (v18 & 1) == 0;
      if (v18) {
        uint64_t v23 = 5;
      }
      else {
        uint64_t v23 = v20;
      }
      if (v22) {
        uint64_t v16 = v21;
      }
      else {
        uint64_t v16 = 6;
      }
    }
    else
    {
      if (v19 == 4) {
        goto LABEL_40;
      }
      if (v18)
      {
        uint64_t v16 = 5;
        uint64_t v23 = 2;
      }
      else
      {
        BOOL v24 = v17 == 0;
        if (v17) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 3;
        }
        if (v24) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 3;
        }
      }
    }
    uint64_t v25 = [v13 state];
    if (((unint64_t)(v25 - 2) < 2 || !v25) && CKIsRunningInMacCatalyst())
    {
      double v15 = [v9 delegate];
      [v15 navbarCanvasViewController:v9 updatedJoinStateWithStyle:v23];
      goto LABEL_31;
    }
  }
  else
  {
    [v9 setIndicatorType:0];
    if (CKIsRunningInMacCatalyst())
    {
      double v15 = [v9 delegate];
      [v15 navbarCanvasViewController:v9 updatedJoinStateWithStyle:0];
      uint64_t v16 = 0;
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v16 = 0;
  }
LABEL_32:
  char v26 = [v39 isGroupConversation];
  uint64_t v27 = [v39 chat];
  int v28 = [v27 supportsCapabilities:1024];

  uint64_t v29 = +[CKFaceTimeUtilities isFaceTimeAudioAvailable:v39] & v28;
  uint64_t v30 = +[CKFaceTimeUtilities isFaceTimeVideoAvailable:v39] & v28;
  v31 = [v39 recipient];
  BOOL v32 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:v31 capabilities:v10];

  if ((v26 & 1) == 0)
  {
    if (v29)
    {
      v33 = [v39 chat];
      uint64_t v29 = [v33 isSMS] ^ 1;
    }
    if (v30)
    {
      v34 = [v39 chat];
      uint64_t v30 = [v34 isSMS] ^ 1;
    }
  }
  v35 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v36 = [v35 isTranscriptSharingEnabled];

  if (v36)
  {
    v37 = [v39 chat];
    int v38 = [v37 isStewieSharingChat];

    uint64_t v29 = (v38 ^ 1) & v29;
    uint64_t v30 = (v38 ^ 1) & v30;
  }
  [v11 updateWithStyle:v16 availabilityForVideo:v30 audio:v29 telephony:0 screenSharing:v32];
LABEL_40:
}

- (void)_userDidTapNavigationBar
{
  if (![(CKNavbarCanvasViewController *)self isInEditingMode])
  {
    if ((unint64_t v3 = [(CKNavbarCanvasViewController *)self navBarContext], v3 <= 4)
      && ((1 << v3) & 0x1A) != 0
      && !CKIsRunningInMessagesTranscriptExtension()
      || ![(CKNavbarCanvasViewController *)self shouldShowAvatarView])
    {
      id v5 = [(CKNavbarCanvasViewController *)self delegate];
      id v4 = [(CKNavbarCanvasViewController *)self canvasView];
      [v5 navbarCanvasViewController:self didTapView:v4];
    }
  }
}

- (void)handleCloseNavBarAnimationCompleteNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = CKNavigationBarCanvasViewHeightAnimationCompletedNotification;
  id v5 = [(CKNavbarCanvasViewController *)self canvasView];
  [v6 removeObserver:self name:v4 object:v5];
}

- (void)viewDidLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)CKNavbarCanvasViewController;
  [(CKNavbarCanvasViewController *)&v30 viewDidLayoutSubviews];
  unint64_t v3 = [(CKNavbarCanvasViewController *)self detailsButton];
  id v4 = [(CKNavbarCanvasViewController *)self detailsButton];
  [v4 bounds];
  objc_msgSend(v3, "contentRectForBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(CKNavbarCanvasViewController *)self detailsButton];
  objc_msgSend(v13, "imageRectForContentRect:", v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  BOOL v22 = [(CKNavbarCanvasViewController *)self detailsButton];
  [v22 bounds];
  double Width = CGRectGetWidth(v31);
  v32.origin.x = v15;
  v32.origin.y = v17;
  v32.size.width = v19;
  v32.size.height = v21;
  double v24 = Width - CGRectGetWidth(v32);

  uint64_t v25 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  char v26 = [(CKNavbarCanvasViewController *)self detailsButton];
  uint64_t v27 = v26;
  if (v25) {
    double v28 = 0.0;
  }
  else {
    double v28 = v24;
  }
  if (v25) {
    double v29 = v24;
  }
  else {
    double v29 = 0.0;
  }
  objc_msgSend(v26, "setImageEdgeInsets:", 0.0, v28, 0.0, v29);
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)CKNavbarCanvasViewController;
  [(CKNavbarCanvasViewController *)&v13 viewDidLoad];
  [(CKNavbarCanvasViewController *)self _updateUnreadCountForBackbuttonView:[(CKNavbarCanvasViewController *)self _unreadCount]];
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BA90] object:0];
  [v3 addObserver:self selector:sel__chatUnreadCountDidChange_ name:*MEMORY[0x1E4F6BA50] object:0];
  [v3 addObserver:self selector:sel__contactPhotosEnabledChangedNotification_ name:CKConversationListContactPhotosEnabledNotification object:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_multiwayStateChanged_ name:*MEMORY[0x1E4F6B9C0] object:0];

  [v3 addObserver:self selector:sel__handleAddressBookChange_ name:*MEMORY[0x1E4F6CA50] object:0];
  double v5 = [(CKNavbarCanvasViewController *)self canvasView];
  double v6 = [(CKNavbarCanvasViewController *)self conversation];
  double v7 = [v6 chat];
  objc_msgSend(v5, "setIsBusinessChat:", objc_msgSend(v7, "isBusinessChat"));

  double v8 = [(CKNavbarCanvasViewController *)self conversation];
  double v9 = [v8 chat];
  double v10 = [v9 conversation];

  if (v10 && ![v10 state])
  {
    double v11 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    double v12 = [v11 conversationManager];
    [v12 refreshActiveConversations];
  }
  [(CKNavbarCanvasViewController *)self _updateFTControls];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKNavbarCanvasViewController;
  [(CKNavbarCanvasViewController *)&v4 viewWillAppear:a3];
  [(CKNavbarCanvasViewController *)self refreshAudioButtonTargetAction];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKNavbarCanvasViewController;
  [(CKNavbarCanvasViewController *)&v3 viewDidAppear:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CKNavbarCanvasViewController;
  id v4 = a3;
  [(CKNavbarCanvasViewController *)&v18 traitCollectionDidChange:v4];
  double v5 = [(CKNavbarCanvasViewController *)self traitCollection];
  [(CKNavbarCanvasViewController *)self _initializeForTraitCollection:v5];
  double v6 = +[CKUIBehavior sharedBehaviors];
  double v7 = [v6 noAvatarTitleFont];
  double v8 = [(CKNavbarCanvasViewController *)self defaultLabel];
  [v8 setFont:v7];

  uint64_t v9 = [v4 horizontalSizeClass];
  uint64_t v10 = [v5 horizontalSizeClass];
  uint64_t v11 = [v4 verticalSizeClass];
  uint64_t v12 = [v5 verticalSizeClass];
  objc_super v13 = [v4 preferredContentSizeCategory];

  double v14 = [v5 preferredContentSizeCategory];
  NSComparisonResult v15 = UIContentSizeCategoryCompareToCategory(v13, v14);

  if (v15 || v9 != v10 || v11 != v12)
  {
    [(CKNavbarCanvasViewController *)self updateTitleViewAnimated:0];
    [(CKNavbarCanvasViewController *)self updateLocationLabel];
    double v16 = [(CKNavbarCanvasViewController *)self canvasView];
    [v16 setNeedsLayout];

    CGFloat v17 = [(CKNavbarCanvasViewController *)self canvasView];
    [v17 layoutIfNeeded];
  }
}

- (void)_handleAddressBookChange:(id)a3
{
  id v4 = [(CKNavbarCanvasViewController *)self conversation];
  double v5 = [(CKNavbarCanvasViewController *)self navBarTitleFromConversation:v4];
  [(CKNavbarCanvasViewController *)self updateTitle:v5 animated:1];

  [(CKNavbarCanvasViewController *)self refreshAudioButtonTargetAction];
}

- (void)_notifyDelegateForNavBarResize
{
  objc_super v3 = [(CKNavbarCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKNavbarCanvasViewController *)self delegate];
    [v5 navbarCanvasViewControllerCanvasHeightDidChange:self];
  }
}

- (void)updateAvatarPickerDelegate
{
  if ([(CKNavbarCanvasViewController *)self shouldShowAvatarView])
  {
    id v3 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    [v3 setDelegate:self];
  }
}

- (void)configureForEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3) {
      [(CKNavbarCanvasViewController *)self _configureForEditMode];
    }
    else {
      [(CKNavbarCanvasViewController *)self _configureForDefaultMode];
    }
  }
}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (NSString *)a3;
  navbarTitle = self->_navbarTitle;
  if (navbarTitle != v7)
  {
    uint64_t v10 = v7;
    if (!v7 || (BOOL v9 = [(NSString *)navbarTitle isEqualToString:v7], v7 = v10, !v9))
    {
      objc_storeStrong((id *)&self->_navbarTitle, a3);
      [(CKNavbarCanvasViewController *)self updateTitleViewAnimated:v4];
      double v7 = v10;
    }
  }
}

- (void)updateTitleViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v15 = [(CKNavbarCanvasViewController *)self _windowTraitCollection];
  id v5 = -[CKNavbarCanvasViewController _titleItemViewForTraitCollection:](self, "_titleItemViewForTraitCollection:");
  BOOL v6 = [(CKNavbarCanvasViewController *)self wantsVerifiedIconForTitle:self->_navbarTitle];
  if ([(CKNavbarCanvasViewController *)self _canShowAvatarView])
  {
    uint64_t v7 = 0;
  }
  else if ([(CKNavbarCanvasViewController *)self hideChevron])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 2;
  }
  double v8 = [(CKNavbarCanvasViewController *)self defaultLabel];

  if (v5 == v8)
  {
    [(CKNavbarCanvasViewController *)self setDefaultLabelText];
    uint64_t v10 = [(CKNavbarCanvasViewController *)self defaultLabel];
    uint64_t v11 = v10;
    if (v6) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = v7;
    }
    [v10 setTitleIconImageType:v12];

    objc_super v13 = [(CKNavbarCanvasViewController *)self defaultLabel];
    [v13 setShouldHaveRotatedTitleIconImage:0 animated:v3];

    double v14 = [(CKNavbarCanvasViewController *)self canvasView];
    [v14 setNeedsLayout];

    BOOL v9 = [(CKNavbarCanvasViewController *)self canvasView];
    [v9 layoutIfNeeded];
  }
  else
  {
    BOOL v9 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    objc_msgSend(v9, "setChevronHidden:", -[CKNavbarCanvasViewController hideChevron](self, "hideChevron"));
  }
}

- (void)updateLeftItemView
{
  id v5 = [(CKNavbarCanvasViewController *)self _windowTraitCollection];
  BOOL v3 = [(CKNavbarCanvasViewController *)self _leftItemViewForTraitCollection:v5];
  BOOL v4 = [(CKNavbarCanvasViewController *)self canvasView];
  [v4 setLeftItemView:v3];
}

- (void)updateRightItemView
{
  id v5 = [(CKNavbarCanvasViewController *)self _windowTraitCollection];
  BOOL v3 = [(CKNavbarCanvasViewController *)self _rightItemViewForTraitCollection:v5];
  BOOL v4 = [(CKNavbarCanvasViewController *)self canvasView];
  [v4 setRightItemView:v3];
}

- (void)updateForRecoveredJunkConversation
{
  [(CKNavbarCanvasViewController *)self updateTitleViewAnimated:1];

  [(CKNavbarCanvasViewController *)self _configureForDefaultMode];
}

- (BOOL)wantsVerifiedIconForTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self conversation];
  if ([v5 shouldShowVerifiedCheckmark])
  {
    BOOL v6 = [(CKNavbarCanvasViewController *)self conversation];
    uint64_t v7 = [v6 recipient];
    double v8 = [v7 name];
    char v9 = [v4 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)hideChevron
{
  if ([(CKNavbarCanvasViewController *)self navBarContext] == 2
    || (IMIsRunningInScreenshotTesting_IsolatedTranscriptUI() & 1) != 0)
  {
    goto LABEL_10;
  }
  BOOL v3 = [(CKNavbarCanvasViewController *)self conversation];
  id v4 = [v3 chat];
  if ([v4 isStewieChat])
  {
    LOBYTE(v5) = 1;
    goto LABEL_5;
  }
  BOOL v6 = [(CKNavbarCanvasViewController *)self conversation];
  uint64_t v7 = [v6 chat];
  char v8 = [v7 isStewieSharingChat];

  if ((v8 & 1) != 0
    || IMIsOscarEnabled()
    && (+[CKConversationList sharedConversationList],
        char v9 = objc_claimAutoreleasedReturnValue(),
        [(CKNavbarCanvasViewController *)self conversation],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v9 primaryFilterModeForConversation:v10],
        v10,
        v9,
        v11 == 9))
  {
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  BOOL v3 = [(CKNavbarCanvasViewController *)self delegate];
  if (!v3)
  {
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  id v4 = [(CKNavbarCanvasViewController *)self delegate];
  int v5 = [v4 shouldShowChevronInNavbarCanvasViewController:self] ^ 1;
LABEL_5:

LABEL_6:
  return v5;
}

- (void)_initializeForTraitCollection:(id)a3
{
  id v4 = a3;
  int v5 = [(CKNavbarCanvasViewController *)self _leftItemViewForTraitCollection:v4];
  BOOL v6 = [(CKNavbarCanvasViewController *)self canvasView];
  [v6 setLeftItemView:v5];

  uint64_t v7 = [(CKNavbarCanvasViewController *)self _rightItemViewForTraitCollection:v4];
  char v8 = [(CKNavbarCanvasViewController *)self canvasView];
  [v8 setRightItemView:v7];

  char v9 = [(CKNavbarCanvasViewController *)self _titleItemViewForTraitCollection:v4];
  uint64_t v10 = [(CKNavbarCanvasViewController *)self canvasView];
  [v10 setTitleView:v9];

  uint64_t v11 = [v4 verticalSizeClass];
  if (v11 == 1)
  {
    id v12 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    [v12 removeFromSuperview];
  }
}

- (id)recipientContextMenu
{
  BOOL v3 = [(CKNavbarCanvasViewController *)self conversation];
  id v4 = [v3 recipient];

  if (v4)
  {
    int v5 = [(CKNavbarCanvasViewController *)self conversation];
    BOOL v6 = [v5 recipient];

    uint64_t v7 = [v6 defaultIMHandle];
    int v8 = [v7 isContact];

    if (v8)
    {
      char v9 = [(CKNavbarCanvasViewController *)self contactsManager];
      uint64_t v10 = [v9 conversationContextMenuForEntity:v6 allowConversationRemoval:0];
    }
    else
    {
      uint64_t v10 = [(CKNavbarCanvasViewController *)self contextMenuForUnknownRecipient:v6];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)contextMenuForUnknownRecipient:(id)a3
{
  return 0;
}

- (void)setCanShowBackButtonView:(BOOL)a3
{
  if (self->_canShowBackButtonView != a3)
  {
    self->_canShowBackButtonView = a3;
    int v5 = [(CKNavbarCanvasViewController *)self canvasView];
    BOOL v6 = [v5 leftItemView];
    uint64_t v7 = [(CKNavbarCanvasViewController *)self backButtonView];

    if (a3)
    {
      if (v6 == v7) {
        return;
      }
      id v9 = [(CKNavbarCanvasViewController *)self backButtonView];
      int v8 = [(CKNavbarCanvasViewController *)self canvasView];
      [v8 setLeftItemView:v9];
    }
    else
    {
      if (v6 != v7) {
        return;
      }
      id v9 = [(CKNavbarCanvasViewController *)self canvasView];
      [v9 setLeftItemView:0];
    }
  }
}

- (void)setIndicatorType:(int64_t)a3
{
  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    if (![(CKNavbarCanvasViewController *)self _canShowAvatarView])
    {
      id v5 = [(CKNavbarCanvasViewController *)self canvasView];
      [v5 setStatusIndicatorType:a3];
    }
  }
}

- (void)updateContentsForConversation:(id)a3
{
  id v6 = a3;
  id v4 = [(CKNavbarCanvasViewController *)self conversation];

  if (v4 != v6)
  {
    [(CKNavbarCanvasViewController *)self setConversation:v6];
    id v5 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    [v5 setConversation:v6];
  }
}

- (void)setNavBarContext:(int64_t)a3
{
  if (self->_navBarContext != a3)
  {
    self->_navBarContext = a3;
    [(CKNavbarCanvasViewController *)self updateTitleViewAnimated:0];
    [(CKNavbarCanvasViewController *)self updateLeftItemView];
    [(CKNavbarCanvasViewController *)self updateRightItemView];
  }
}

- (id)_leftItemViewForTraitCollection:(id)a3
{
  if ([(CKNavbarCanvasViewController *)self canShowBackButtonView])
  {
    id v4 = [(CKNavbarCanvasViewController *)self backButtonView];
  }
  else if ([(CKNavbarCanvasViewController *)self shouldShowDoneButton])
  {
    id v4 = [(CKNavbarCanvasViewController *)self doneButton];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_rightItemViewForTraitCollection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKNavbarCanvasViewController *)self editing])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(CKNavbarCanvasViewController *)self editCancelButtonView];
        int v20 = 138412290;
        CGFloat v21 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Right item view: User is editing, returning %@", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v7 = [(CKNavbarCanvasViewController *)self editCancelButtonView];
  }
  else if (CKIsRunningInMessagesTranscriptExtension())
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(CKNavbarCanvasViewController *)self doneButton];
        int v20 = 138412290;
        CGFloat v21 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Right item view: Running in transcript extension, returning %@", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v7 = [(CKNavbarCanvasViewController *)self doneButton];
  }
  else if ([(CKNavbarCanvasViewController *)self _isConfiguredForInlineReply])
  {
    uint64_t v7 = [(CKNavbarCanvasViewController *)self closeButton];
  }
  else if ([(CKNavbarCanvasViewController *)self _shouldShowPersistentMenu])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [(CKNavbarCanvasViewController *)self persistentMenuButton];
        int v20 = 138412290;
        CGFloat v21 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Right item view: We want to show the persistent menu, returning %@", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v7 = [(CKNavbarCanvasViewController *)self persistentMenuButton];
  }
  else
  {
    BOOL v12 = [(CKNavbarCanvasViewController *)self _shouldShowFacetimeButton];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        double v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [(CKNavbarCanvasViewController *)self unifiedCallButton];
          int v20 = 138412290;
          CGFloat v21 = v15;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Right item view: We want to show the facetime button, returning %@", (uint8_t *)&v20, 0xCu);
        }
      }
      uint64_t v7 = [(CKNavbarCanvasViewController *)self unifiedCallButton];
    }
    else
    {
      if (v13)
      {
        double v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          CGFloat v17 = [(CKNavbarCanvasViewController *)self detailsButton];
          int v20 = 138412290;
          CGFloat v21 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Right item view: By default, returning %@", (uint8_t *)&v20, 0xCu);
        }
      }
      uint64_t v7 = [(CKNavbarCanvasViewController *)self detailsButton];
    }
  }
  objc_super v18 = (void *)v7;

  return v18;
}

- (BOOL)_shouldShowFacetimeButton
{
  v2 = self;
  BOOL v3 = [(CKNavbarCanvasViewController *)self delegate];
  LOBYTE(v2) = [v3 shouldShowFacetimeButtonInNavbarCanvasViewController:v2];

  return (char)v2;
}

- (BOOL)_isConfiguredForInlineReply
{
  return [(CKNavbarCanvasViewController *)self navBarContext] == 1;
}

- (BOOL)_shouldShowPersistentMenu
{
  BOOL v3 = [(CKNavbarCanvasViewController *)self conversation];
  id v4 = [v3 chat];
  id v5 = [v4 persistentMenu];
  if (v5)
  {
    id v6 = [(CKNavbarCanvasViewController *)self persistentMenuButton];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_titleItemViewForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(CKNavbarCanvasViewController *)self _canShowAvatarView]
    && [v4 verticalSizeClass] != 1)
  {
    uint64_t v5 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
  }
  else
  {
    uint64_t v5 = [(CKNavbarCanvasViewController *)self defaultLabel];
  }
  id v6 = (void *)v5;

  return v6;
}

- (CKNavBarConversationIdentityView)conversationIdentityView
{
  conversationIdentityView = self->_conversationIdentityView;
  if (!conversationIdentityView)
  {
    id v4 = [CKNavBarConversationIdentityView alloc];
    uint64_t v5 = [(CKNavbarCanvasViewController *)self conversation];
    id v6 = [(CKNavBarConversationIdentityView *)v4 initWithConversation:v5];
    BOOL v7 = self->_conversationIdentityView;
    self->_conversationIdentityView = v6;

    [(CKNavbarCanvasViewController *)self _addUserDidTapNavigationBarRecognizer:self->_conversationIdentityView];
    conversationIdentityView = self->_conversationIdentityView;
  }

  return conversationIdentityView;
}

- (CKLabel)defaultLabel
{
  defaultLabel = self->_defaultLabel;
  if (!defaultLabel)
  {
    id v4 = objc_alloc_init(CKLabel);
    uint64_t v5 = self->_defaultLabel;
    self->_defaultLabel = v4;

    id v6 = [(CKNavbarCanvasViewController *)self conversation];
    int v7 = [v6 isBusinessConversation];

    [(CKLabel *)self->_defaultLabel setTextAlignment:[(CKNavbarCanvasViewController *)self _canShowAvatarView] | v7];
    int v8 = +[CKUIBehavior sharedBehaviors];
    id v9 = [v8 noAvatarTitleFont];
    [(CKLabel *)self->_defaultLabel setFont:v9];

    [(CKNavbarCanvasViewController *)self setDefaultLabelText];
    if (v7)
    {
      uint64_t v10 = +[CKUIBehavior sharedBehaviors];
      uint64_t v11 = [v10 theme];
      BOOL v12 = [(CKNavbarCanvasViewController *)self conversation];
      int v13 = [v12 chat];
      double v14 = [v11 secondaryBrandColorForBusinessChat:v13];
      [(CKLabel *)self->_defaultLabel setTextColor:v14];
    }
    id v15 = [(CKNavbarCanvasViewController *)self conversation];
    char v16 = [v15 hasVerifiedBusiness];

    BOOL v17 = [(CKNavbarCanvasViewController *)self hideChevron];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__CKNavbarCanvasViewController_defaultLabel__block_invoke;
    v20[3] = &unk_1E5623BB0;
    char v21 = v16;
    void v20[4] = self;
    BOOL v22 = !v17;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v20];
    objc_super v18 = [(CKNavbarCanvasViewController *)self defaultLabel];
    [v18 setShouldHaveRotatedTitleIconImage:0 animated:0];

    [(CKNavbarCanvasViewController *)self _addUserDidTapNavigationBarRecognizer:self->_defaultLabel];
    defaultLabel = self->_defaultLabel;
  }

  return defaultLabel;
}

void __44__CKNavbarCanvasViewController_defaultLabel__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) defaultLabel];
    id v10 = v2;
    uint64_t v3 = 3;
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 41))
    {
      v2 = [v4 defaultLabel];
      id v10 = v2;
      uint64_t v3 = 2;
    }
    else
    {
      uint64_t v5 = [v4 conversation];
      int v6 = [v5 isStewieConversation];

      id v10 = [*(id *)(a1 + 32) defaultLabel];
      if (v6)
      {
        int v7 = +[CKUIBehavior sharedBehaviors];
        int v8 = [v7 theme];
        id v9 = [v8 conversationListEmergencyColor];
        [v10 setTextColor:v9];

        goto LABEL_9;
      }
      v2 = v10;
      uint64_t v3 = 0;
    }
  }
  [v2 setTitleIconImageType:v3];
LABEL_9:
}

- (void)setDefaultLabelText
{
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDE4CA38];
  if (self->_navbarTitle)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_navbarTitle];
    [v13 appendAttributedString:v3];
  }
  if (![(CKNavbarCanvasViewController *)self shouldShowAvatarView]
    && [(CKNavbarCanvasViewController *)self wantsVerifiedIconForTitle:self->_navbarTitle])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    uint64_t v5 = +[CKUIBehavior sharedBehaviors];
    int v6 = [v5 businessVerifiedImageSmall];
    [v4 setImage:v6];

    int v7 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v4];
    [v13 appendAttributedString:v7];
  }
  int v8 = [(CKNavbarCanvasViewController *)self _KTTitleIconAttributedString];
  if (v8)
  {
    [v13 appendAttributedString:v8];
    id v9 = [(CKNavbarCanvasViewController *)self defaultLabel];
    [v9 setIsAccessibilityElement:1];

    id v10 = [v13 string];
    uint64_t v11 = [(CKNavbarCanvasViewController *)self defaultLabel];
    [v11 setAccessibilityLabel:v10];
  }
  BOOL v12 = [(CKNavbarCanvasViewController *)self defaultLabel];
  [v12 setAttributedText:v13];
}

- (void)updateDefaultLabelIfNecessary
{
  id v5 = [(CKNavbarCanvasViewController *)self _windowTraitCollection];
  if (![(CKNavbarCanvasViewController *)self _canShowAvatarView]
    || [v5 verticalSizeClass] == 1)
  {
    [(CKNavbarCanvasViewController *)self setDefaultLabel:0];
    uint64_t v3 = [(CKNavbarCanvasViewController *)self canvasView];
    id v4 = [(CKNavbarCanvasViewController *)self defaultLabel];
    [v3 setTitleView:v4];

    [(CKNavbarCanvasViewController *)self updateTitleViewAnimated:0];
  }
}

- (void)_configureForEditMode
{
  if (!CKIsRunningInMacCatalyst())
  {
    uint64_t v3 = [(CKNavbarCanvasViewController *)self canvasView];
    [v3 setLeftItemView:0];
  }
  id v5 = [(CKNavbarCanvasViewController *)self editCancelButtonView];
  id v4 = [(CKNavbarCanvasViewController *)self canvasView];
  [v4 setRightItemView:v5];
}

- (void)_configureForDefaultMode
{
  if ([(CKNavbarCanvasViewController *)self shouldShowDoneButton])
  {
    uint64_t v3 = [(CKNavbarCanvasViewController *)self doneButton];
  }
  else
  {
    if (![(CKNavbarCanvasViewController *)self canShowBackButtonView]) {
      goto LABEL_6;
    }
    uint64_t v3 = [(CKNavbarCanvasViewController *)self backButtonView];
  }
  id v4 = (void *)v3;
  id v5 = [(CKNavbarCanvasViewController *)self canvasView];
  [v5 setLeftItemView:v4];

LABEL_6:
  id v8 = [(CKNavbarCanvasViewController *)self traitCollection];
  int v6 = [(CKNavbarCanvasViewController *)self _rightItemViewForTraitCollection:v8];
  int v7 = [(CKNavbarCanvasViewController *)self canvasView];
  [v7 setRightItemView:v6];
}

- (UIButton)editCancelButtonView
{
  editCancelButtonView = self->_editCancelButtonView;
  if (!editCancelButtonView)
  {
    id v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    id v5 = self->_editCancelButtonView;
    self->_editCancelButtonView = v4;

    int v6 = self->_editCancelButtonView;
    int v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    id v9 = [(UIButton *)self->_editCancelButtonView titleLabel];
    id v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [v9 setFont:v10];

    [(UIButton *)self->_editCancelButtonView addTarget:self action:sel__buttonPressed_ forEvents:64];
    editCancelButtonView = self->_editCancelButtonView;
  }

  return editCancelButtonView;
}

- (CKCanvasBackButtonView)backButtonView
{
  backButtonView = self->_backButtonView;
  if (!backButtonView)
  {
    id v4 = [CKCanvasBackButtonView alloc];
    id v5 = -[CKCanvasBackButtonView initWithFrame:showPaddingTitleView:](v4, "initWithFrame:showPaddingTitleView:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_backButtonView;
    self->_backButtonView = v5;

    [(CKCanvasBackButtonView *)self->_backButtonView addTarget:self action:sel__buttonPressed_ forEvents:64];
    backButtonView = self->_backButtonView;
  }

  return backButtonView;
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (CKNavBarUnifiedCallButton)unifiedCallButton
{
  if (!self->_unifiedCallButton && !CKIsRunningInMacCatalyst())
  {
    uint64_t v3 = [(CKNavbarCanvasViewController *)self conversation];
    id v4 = [v3 chat];
    char v5 = [v4 isBusinessChat];

    if ((v5 & 1) == 0)
    {
      int v6 = +[CKNavBarUnifiedCallButton buttonWithType:1];
      unifiedCallButton = self->_unifiedCallButton;
      self->_unifiedCallButton = v6;

      [(CKNavBarUnifiedCallButton *)self->_unifiedCallButton setDelegate:self];
    }
  }
  id v8 = self->_unifiedCallButton;

  return v8;
}

- (id)persistentMenuButton
{
  v2 = [(CKNavbarCanvasViewController *)self persistentMenuManager];
  uint64_t v3 = [v2 button];

  return v3;
}

- (_TtC7ChatKit29CKNavBarPersistentMenuManager)persistentMenuManager
{
  if (!self->_persistentMenuManager && !CKIsRunningInMacCatalyst())
  {
    uint64_t v3 = [(CKNavbarCanvasViewController *)self conversation];
    id v4 = [v3 chat];
    char v5 = [v4 persistentMenu];

    if (v5)
    {
      int v6 = [[_TtC7ChatKit29CKNavBarPersistentMenuManager alloc] initWithDelegate:self];
      persistentMenuManager = self->_persistentMenuManager;
      self->_persistentMenuManager = v6;

      id v8 = self->_persistentMenuManager;
      id v9 = [(CKNavbarCanvasViewController *)self conversation];
      id v10 = [v9 chat];
      uint64_t v11 = [v10 persistentMenu];
      [(CKNavBarPersistentMenuManager *)v8 setupWithPersistentMenu:v11];
    }
  }
  BOOL v12 = self->_persistentMenuManager;

  return v12;
}

- (UIBarButtonItem)detailsBarButton
{
  uint64_t v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 useMacToolbar];

  if (v4)
  {
    detailsBarButton = self->_detailsBarButton;
    if (!detailsBarButton)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
      int v7 = +[CKUIBehavior sharedBehaviors];
      id v8 = [v7 macToolbarDetailsImage];
      id v9 = (UIBarButtonItem *)[v6 initWithImage:v8 style:0 target:self action:sel__buttonPressed_];
      id v10 = self->_detailsBarButton;
      self->_detailsBarButton = v9;

      detailsBarButton = self->_detailsBarButton;
    }
    uint64_t v11 = detailsBarButton;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)setDetailsBarButton:(id)a3
{
  id v9 = (UIBarButtonItem *)a3;
  char v5 = +[CKUIBehavior sharedBehaviors];
  if ([v5 useMacToolbar])
  {
    p_detailsBarButton = &self->_detailsBarButton;
    detailsBarButton = self->_detailsBarButton;

    id v8 = v9;
    if (detailsBarButton == v9) {
      goto LABEL_8;
    }
    if (*p_detailsBarButton)
    {
      [(UIBarButtonItem *)*p_detailsBarButton setTarget:0];
      [(UIBarButtonItem *)*p_detailsBarButton setAction:0];
    }
    objc_storeStrong((id *)&self->_detailsBarButton, a3);
    [(UIBarButtonItem *)*p_detailsBarButton setTarget:self];
    [(UIBarButtonItem *)*p_detailsBarButton setAction:sel__buttonPressed_];
  }
  else
  {
  }
  id v8 = v9;
LABEL_8:
}

- (UIButton)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    int v4 = [MEMORY[0x1E4F427E0] buttonWithType:102];
    char v5 = self->_doneButton;
    self->_doneButton = v4;

    id v6 = self->_doneButton;
    int v7 = CKFrameworkBundle();
    id v8 = [v7 localizedStringForKey:@"DONE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    [(UIButton *)self->_doneButton addTarget:self action:sel__buttonPressed_ forControlEvents:64];
    doneButton = self->_doneButton;
  }

  return doneButton;
}

- (UIButton)closeButton
{
  closeButton = self->_closeButton;
  if (!closeButton)
  {
    int v4 = [MEMORY[0x1E4F427E0] buttonWithType:7];
    char v5 = self->_closeButton;
    self->_closeButton = v4;

    [(UIButton *)self->_closeButton setAccessibilityIdentifier:@"closeInlineReply"];
    [(UIButton *)self->_closeButton addTarget:self action:sel__buttonPressed_ forControlEvents:64];
    closeButton = self->_closeButton;
  }

  return closeButton;
}

- (void)_addUserDidTapNavigationBarRecognizer:(id)a3
{
  id v5 = a3;
  if (!CKIsRunningInMacCatalyst())
  {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__userDidTapNavigationBar];
    [v4 setDelegate:self];
    [v5 setUserInteractionEnabled:1];
    [v5 addGestureRecognizer:v4];
  }
}

- (void)conversationIdentityViewTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self conversationIdentityView];

  if (v5 == v4)
  {
    id v7 = [(CKNavbarCanvasViewController *)self delegate];
    id v6 = [(CKNavbarCanvasViewController *)self conversationIdentityView];
    [v7 navbarCanvasViewController:self didTapView:v6];
  }
}

- (void)buttonRequestsStartFaceTimeVideo:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v5 == v4)
  {
    if (IMDeviceIsGreenTea()
      && ([(CKNavbarCanvasViewController *)self conversation],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v6 chat],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isGroupChat],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      id v10 = [(CKNavbarCanvasViewController *)self conversation];
      id v9 = [v10 chat];
      [v9 initiateTUDialRequestWithVideoEnabled:1];
    }
    else
    {
      id v10 = [(CKNavbarCanvasViewController *)self conversation];
      id v9 = [v10 chat];
      [v9 initiateTUConversationWithVideoEnabled:1];
    }
  }
}

- (void)buttonRequestsStartFaceTimeAudio:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v5 == v4)
  {
    id v7 = [(CKNavbarCanvasViewController *)self conversation];
    id v6 = [v7 chat];
    [v6 initiateTUConversationWithVideoEnabled:0];
  }
}

- (void)buttonRequestsStartTelephonyCall:(id)a3
{
  id v10 = a3;
  id v4 = [(CKNavbarCanvasViewController *)self unifiedCallButton];
  if (v4 == v10)
  {
    id v5 = [(CKNavbarCanvasViewController *)self conversation];
    id v6 = [v5 recipient];

    if (!v6) {
      goto LABEL_5;
    }
    id v7 = [(CKNavbarCanvasViewController *)self conversation];
    id v4 = [v7 recipient];

    char v8 = [(CKNavbarCanvasViewController *)self contactsManager];
    id v9 = [v4 rawAddress];
    [v8 startCommunicationForEntity:v4 action:3 address:v9];
  }
LABEL_5:
}

- (void)button:(id)a3 requestsJoinActiveCallWithVideoEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v7 == v6)
  {
    char v8 = [(CKNavbarCanvasViewController *)self conversation];
    id v9 = [v8 chat];
    id v10 = [v9 conversation];

    if (v10)
    {
      id v14 = [(CKNavbarCanvasViewController *)self conversation];
      uint64_t v11 = [v14 chat];
      [v11 joinExistingTUConversation];
    }
    else
    {
      int IsGreenTea = IMDeviceIsGreenTea();
      id v14 = [(CKNavbarCanvasViewController *)self conversation];
      id v13 = [v14 chat];
      uint64_t v11 = v13;
      if (IsGreenTea) {
        [v13 initiateTUDialRequestWithVideoEnabled:v4];
      }
      else {
        [v13 initiateTUConversationWithVideoEnabled:v4];
      }
    }
  }
}

- (void)button:(id)a3 requestsStartFaceTimeWithScreenShareType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v7 == v6)
  {
    id v9 = [(CKNavbarCanvasViewController *)self conversation];
    char v8 = [v9 chat];
    [v8 initiateTUConversationWithScreenShareType:a4];
  }
}

- (void)buttonRequestsOpenJoinedCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v5 == v4)
  {
    id v6 = [(CKNavbarCanvasViewController *)self conversation];
    id v7 = [v6 chat];
    id v10 = [v7 conversation];

    if (v10 && [v10 state])
    {
      char v8 = [MEMORY[0x1E4F1CB10] faceTimeShowInCallUIURL];
      TUOpenURL();
    }
    else
    {
      char v8 = [(CKNavbarCanvasViewController *)self conversation];
      id v9 = [v8 chat];
      [v9 joinExistingTUConversation];
    }
  }
}

- (void)buttonWidthDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self unifiedCallButton];

  if (v5 == v4)
  {
    id v6 = [(CKNavbarCanvasViewController *)self canvasView];
    [v6 setNeedsLayout];
  }
}

- (void)dismissModal
{
}

- (void)showContactCardForEntity:(id)a3 address:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v28[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

  id v10 = (void *)MEMORY[0x1E4F6E6D8];
  uint64_t v11 = [v6 defaultIMHandle];
  BOOL v12 = [v11 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  int v13 = [v10 isCNContactAKnownContact:v12];

  if (v13)
  {
    id v14 = [(CKNavbarCanvasViewController *)self suggestionsEnabledContactStore];
    id v15 = [v6 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
    char v16 = [v15 identifier];
    BOOL v17 = [v14 unifiedContactWithIdentifier:v16 keysToFetch:v9 error:0];

    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v17 = [v6 cnContactWithKeys:v9];
    if (v7) {
      goto LABEL_6;
    }
  }
  objc_super v18 = [v6 defaultIMHandle];
  id v7 = [v18 ID];

LABEL_6:
  int v19 = [v7 _appearsToBePhoneNumber];
  int v20 = (id *)MEMORY[0x1E4F1AEE0];
  if (!v19) {
    int v20 = (id *)MEMORY[0x1E4F1ADC8];
  }
  id v21 = *v20;
  if (v13)
  {
    BOOL v22 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v17];
    uint64_t v23 = [v22 contentViewController];
    [v23 setShouldShowLinkedContacts:1];
  }
  else
  {
    BOOL v22 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v17];
  }
  double v24 = [v17 identifierForKey:v21 withDestination:v7];
  [v22 highlightPropertyWithKey:v21 identifier:v24];

  uint64_t v25 = [(CKNavbarCanvasViewController *)self suggestionsEnabledContactStore];
  [v22 setContactStore:v25];

  char v26 = [v22 contentViewController];
  [v26 setAllowsContactBlocking:1];

  if (objc_opt_respondsToSelector()) {
    [v22 setEdgesForExtendedLayout:0];
  }
  uint64_t v27 = [(CKNavbarCanvasViewController *)self proxyNavigationController];
  [v27 pushViewController:v22 animated:1];
}

- (CNContactStore)suggestionsEnabledContactStore
{
  suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  if (!suggestionsEnabledContactStore)
  {
    id v4 = (void *)MEMORY[0x1E4F1B980];
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled]) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = [v4 storeWithOptions:v5];
    id v7 = self->_suggestionsEnabledContactStore;
    self->_suggestionsEnabledContactStore = v6;

    suggestionsEnabledContactStore = self->_suggestionsEnabledContactStore;
  }

  return suggestionsEnabledContactStore;
}

- (int64_t)_unreadCount
{
  uint64_t v3 = [(CKNavbarCanvasViewController *)self delegate];
  if (v3)
  {
    id v4 = [(CKNavbarCanvasViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CKNavbarCanvasViewController *)self delegate];
      uint64_t v3 = (void *)[v6 unreadCountForCurrentFilterModeForNavbarCanvasViewController:self];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  id v7 = [(CKNavbarCanvasViewController *)self conversation];
  int64_t v8 = (int64_t)v3 - [v7 unreadCount];

  return v8;
}

- (void)_updateUnreadCountForBackbuttonView:(int64_t)a3
{
  [(CKNavbarCanvasViewController *)self setUnreadCountTitleColor];
  char v5 = [NSNumber numberWithInteger:a3];
  id v9 = v5;
  if (a3 < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v5, "__ck_localizedString");
  }
  id v7 = [(CKNavbarCanvasViewController *)self backButtonView];
  [v7 setBackButtonTitle:v6];

  int64_t v8 = [(CKNavbarCanvasViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)_chatUnreadCountDidChange:(id)a3
{
  int64_t v4 = [(CKNavbarCanvasViewController *)self _unreadCount];

  [(CKNavbarCanvasViewController *)self _updateUnreadCountForBackbuttonView:v4];
}

- (void)setUnreadCountTitleColor
{
  uint64_t v3 = [(CKNavbarCanvasViewController *)self conversation];
  int v4 = [v3 isBusinessConversation];

  id v10 = [(CKNavbarCanvasViewController *)self backButtonView];
  if (v4)
  {
    char v5 = +[CKUIBehavior sharedBehaviors];
    id v6 = [v5 theme];
    id v7 = [(CKNavbarCanvasViewController *)self conversation];
    int64_t v8 = [v7 chat];
    id v9 = [v6 primaryBrandColorForBusinessChat:v8];
    [v10 setTitleLabelColor:v9];
  }
  else
  {
    char v5 = [MEMORY[0x1E4F428B8] whiteColor];
    [v10 setTitleLabelColor:v5];
  }
}

- (void)_contactPhotosEnabledChangedNotification:(id)a3
{
  int v4 = [(CKNavbarCanvasViewController *)self traitCollection];
  char v5 = [(CKNavbarCanvasViewController *)self _titleItemViewForTraitCollection:v4];
  id v6 = [(CKNavbarCanvasViewController *)self canvasView];
  [v6 setTitleView:v5];

  id v7 = [(CKNavbarCanvasViewController *)self canvasView];
  int64_t v8 = [v7 titleView];
  id v9 = [(CKNavbarCanvasViewController *)self conversationIdentityView];

  if (v8 == v9)
  {
    id v10 = [(CKNavbarCanvasViewController *)self canvasView];
    uint64_t v11 = [v10 titleView];
    BOOL v12 = [(CKNavbarCanvasViewController *)self defaultLabel];

    if (v11 != v12) {
      [(CKNavbarCanvasViewController *)self setDefaultLabel:0];
    }
  }
  else
  {
    [(CKNavbarCanvasViewController *)self setConversationIdentityView:0];
  }
  int v13 = [(CKNavbarCanvasViewController *)self navbarTitle];
  [(CKNavbarCanvasViewController *)self updateTitle:v13 animated:0];

  id v14 = [(CKNavbarCanvasViewController *)self canvasView];
  [v14 setNeedsLayout];
}

- (void)refreshAudioButtonTargetAction
{
  uint64_t v3 = [(CKNavbarCanvasViewController *)self conversation];
  int v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    id v6 = [(CKNavbarCanvasViewController *)self conversation];
    id v7 = [v6 recipient];

    int64_t v8 = [(CKNavbarCanvasViewController *)self contactsManager];
    uint64_t v9 = [v8 shouldAlwaysShowCallMenuForEntity:v7];

    id v10 = [(CKNavbarCanvasViewController *)self canvasView];
    uint64_t v11 = [v10 buttonViewFaceTimeAudio];
    [v11 setContextMenuIsPrimary:v9];

    if (v9)
    {
      id v15 = [(CKNavbarCanvasViewController *)self canvasView];
      BOOL v12 = [v15 buttonViewFaceTimeAudio];
      [v12 removeTarget:0 action:0 forControlEvents:64];
      goto LABEL_6;
    }
  }
  else
  {
    int v13 = [(CKNavbarCanvasViewController *)self canvasView];
    id v14 = [v13 buttonViewFaceTimeAudio];
    [v14 setContextMenuIsPrimary:0];
  }
  id v15 = [(CKNavbarCanvasViewController *)self canvasView];
  BOOL v12 = [v15 buttonViewFaceTimeAudio];
  [v12 addTarget:self action:sel__facetimeAudioButtonTapped_ forControlEvents:64];
LABEL_6:
}

- (void)_facetimeAudioButtonTapped:(id)a3
{
  id v4 = [(CKNavbarCanvasViewController *)self delegate];
  [v4 navbarCanvasViewControllerFaceTimeAudioButtonTapped:self];
}

- (void)_facetimeVideoButtonTapped:(id)a3
{
  id v4 = [(CKNavbarCanvasViewController *)self delegate];
  [v4 navbarCanvasViewControllerFaceTimeVideoButtonTapped:self];
}

- (void)_infoButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self delegate];
  [v5 navbarCanvasViewController:self infoButtonTapped:v4];
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKNavbarCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKNavbarCanvasViewController *)self delegate];
    [v7 navbarCanvasViewController:self didTapView:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    int64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(CKNavbarCanvasViewController *)self delegate];
      id v10 = [(CKNavbarCanvasViewController *)self delegate];
      char v11 = objc_opt_respondsToSelector();
      BOOL v12 = @"NO";
      if (v11) {
        BOOL v12 = @"YES";
      }
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      char v16 = v12;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Delegate (%@), respondsToSelector (%@)", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)shouldConfigureForJunkModal
{
  v2 = self;
  uint64_t v3 = [(CKNavbarCanvasViewController *)self delegate];
  LOBYTE(v2) = [v3 shouldConfigureForJunkModalInNavbarCanvasViewController:v2];

  return (char)v2;
}

- (BOOL)splitViewControllerIsCollapsed
{
  v2 = [(CKNavbarCanvasViewController *)self delegate];
  uint64_t v3 = [v2 splitViewController];
  char v4 = [v3 isCollapsed];

  return v4;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  v2 = [(CKNavbarCanvasViewController *)self delegate];
  char v3 = [v2 shouldUseMinimumSafeAreas];

  return v3;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3
{
  char v4 = [(CKNavbarCanvasViewController *)self delegate];
  [v4 systemMinimumLayoutMarginsForViewController:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (void)_handleAllowedByScreenTimeChatChanged:(id)a3
{
  id v5 = [(CKNavbarCanvasViewController *)self conversation];
  char v4 = [(CKNavbarCanvasViewController *)self navBarTitleFromConversation:v5];
  [(CKNavbarCanvasViewController *)self updateTitle:v4 animated:1];
}

- (void)persistentMenuManager:(id)a3 selectedChipAction:(id)a4
{
  id v8 = a4;
  id v5 = [(CKNavbarCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CKNavbarCanvasViewController *)self delegate];
    [v7 navbarCanvasViewController:self selectedChipAction:v8];
  }
}

- (void)_handleServiceChangedNotification:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isCarrierPigeonEnabled];

  if (v5)
  {
    id v8 = [(CKNavbarCanvasViewController *)self traitCollection];
    char v6 = [(CKNavbarCanvasViewController *)self _rightItemViewForTraitCollection:v8];
    double v7 = [(CKNavbarCanvasViewController *)self canvasView];
    [v7 setRightItemView:v6];
  }
}

- (void)persistentMenuManager:(id)a3 selectedSuggestedReply:(id)a4
{
  id v8 = a4;
  int v5 = [(CKNavbarCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CKNavbarCanvasViewController *)self delegate];
    [v7 navbarCanvasViewController:self selectedSuggestedReply:v8];
  }
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  char v4 = [(CKNavbarCanvasViewController *)self traitCollection];
  id v8 = [(CKNavbarCanvasViewController *)self _titleItemViewForTraitCollection:v4];

  id v5 = [(CKNavbarCanvasViewController *)self defaultLabel];

  char v6 = v8;
  if (v8 == v5)
  {
    [(CKNavbarCanvasViewController *)self setDefaultLabel:0];
    double v7 = [(CKNavbarCanvasViewController *)self traitCollection];
    [(CKNavbarCanvasViewController *)self _initializeForTraitCollection:v7];

    char v6 = v8;
  }
}

- (id)_KTTitleIconAttributedString
{
  char v3 = [(CKNavbarCanvasViewController *)self conversation];
  char v4 = [v3 sendingService];
  int v5 = [v4 supportsCapability:*MEMORY[0x1E4F6E070]];

  if (!v5)
  {
    double v10 = 0;
    goto LABEL_11;
  }
  char v6 = [(CKNavbarCanvasViewController *)self conversation];
  double v7 = [v6 chat];
  uint64_t v31 = 0;
  unint64_t v8 = [v7 keyTransparencyStatusForAffectedHandles:&v31];

  id v9 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v9 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  double v10 = 0;
  if (v8 > 0xE) {
    goto LABEL_9;
  }
  if (((1 << v8) & 0x748F) == 0)
  {
    if (((1 << v8) & 0xA60) != 0)
    {
      double v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.triangle.fill"];
      double v11 = [(CKNavbarCanvasViewController *)self defaultLabel];
      double v12 = v11;
      double v13 = @"WarningHeader";
    }
    else
    {
      double v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
      double v11 = [(CKNavbarCanvasViewController *)self defaultLabel];
      double v12 = v11;
      double v13 = @"VerifiedHeader";
    }
    [v11 setAccessibilityIdentifier:v13];

LABEL_9:
    double v14 = [MEMORY[0x1E4F428B8] systemGrayColor];
    double v15 = [v10 imageWithTintColor:v14];

    double v16 = +[CKUIBehavior sharedBehaviors];
    uint64_t v17 = [v16 noAvatarTitleFont];
    [v17 pointSize];
    double v19 = v18;

    [v15 size];
    double v21 = v20;
    [v15 size];
    double v23 = v19 * (v21 / v22);
    double v24 = +[CKUIBehavior sharedBehaviors];
    uint64_t v25 = [v24 noAvatarTitleFont];
    [v25 capHeight];
    double v27 = (v26 - v19) * 0.5;

    objc_msgSend(v9, "setBounds:", 0.0, v27, v23, v19);
    [v9 setImage:v15];
    double v28 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" "];
    double v29 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
    [v28 appendAttributedString:v29];

    double v10 = (void *)[v28 copy];
  }

LABEL_11:

  return v10;
}

- (void)setContactsManager:(id)a3
{
}

- (CKNavbarCanvasViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKNavbarCanvasViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setBackButtonView:(id)a3
{
}

- (void)setDetailsButton:(id)a3
{
}

- (void)setUnifiedCallButton:(id)a3
{
}

- (UIButton)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
}

- (void)setEditCancelButtonView:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (void)setCloseButton:(id)a3
{
}

- (void)setConversationIdentityView:(id)a3
{
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (BOOL)locationLabelHidden
{
  return self->_locationLabelHidden;
}

- (BOOL)canShowBackButtonView
{
  return self->_canShowBackButtonView;
}

- (BOOL)shouldShowDoneButton
{
  return self->_shouldShowDoneButton;
}

- (void)setShouldShowDoneButton:(BOOL)a3
{
  self->_shouldShowDoneButton = a3;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (int64_t)navBarContext
{
  return self->_navBarContext;
}

- (NSString)navbarTitle
{
  return self->_navbarTitle;
}

- (void)setNavbarTitle:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void)setDefaultLabel:(id)a3
{
}

- (void)setPersistentMenuManager:(id)a3
{
}

- (BOOL)hasConfiguredCallButtonAudioRouteActions
{
  return self->_hasConfiguredCallButtonAudioRouteActions;
}

- (void)setHasConfiguredCallButtonAudioRouteActions:(BOOL)a3
{
  self->_hasConfiguredCallButtonAudioRouteActions = a3;
}

- (UINavigationController)proxyNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyNavigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setProxyNavigationController:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (int64_t)indicatorType
{
  return self->_indicatorType;
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
}

- (BOOL)shouldDisplayParticipantLocationWhenAvailable
{
  return self->_shouldDisplayParticipantLocationWhenAvailable;
}

- (void)setShouldDisplayParticipantLocationWhenAvailable:(BOOL)a3
{
  self->_shouldDisplayParticipantLocationWhenAvailable = a3;
}

- (IMFindMyLocation)locationToDisplay
{
  return self->_locationToDisplay;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (NSDictionary)modernScreenSharingCapabilities
{
  return self->_modernScreenSharingCapabilities;
}

- (void)setModernScreenSharingCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_locationToDisplay, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_destroyWeak((id *)&self->_proxyNavigationController);
  objc_storeStrong((id *)&self->_persistentMenuManager, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_navbarTitle, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_conversationIdentityView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_editCancelButtonView, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_unifiedCallButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_backButtonView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactsManager, 0);

  objc_storeStrong((id *)&self->_detailsBarButton, 0);
}

@end