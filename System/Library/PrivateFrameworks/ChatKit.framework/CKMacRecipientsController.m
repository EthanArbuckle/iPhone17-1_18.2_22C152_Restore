@interface CKMacRecipientsController
- (BOOL)_shouldEnableScrolling;
- (BOOL)allowedByScreenTime;
- (BOOL)isEditable;
- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3;
- (CGRect)detailsToolbarItemFrame;
- (CGRect)faceTimeJoinCallToolbarItemFrame;
- (CGRect)faceTimeStartOrLaunchCallToolbarItemFrame;
- (CGRect)innermostToolbarItemFrame;
- (CKConversation)conversation;
- (CKDetailsContactsManager)contactsManager;
- (CKMacRecipientsController)initWithConversation:(id)a3;
- (CKMacRecipientsControllerDelegate)delegate;
- (CKManualUpdater)addressBookNotificationUpdater;
- (CNComposeRecipientTextView)toField;
- (STConversationContext)currentConversationContext;
- (UIScrollView)toFieldScrollView;
- (UIView)detailsPopoverPresentationSourceView;
- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3;
- (double)preferredMacToolbarHeight;
- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4;
- (id)handlesForScreenTimePolicyCheck;
- (id)recipients;
- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3;
- (unint64_t)numberOfRowsInToField;
- (void)_handleAddressBookChangedNotification:(id)a3;
- (void)_handleAddressBookPartialChangedNotification:(id)a3;
- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_notifyDelegatesToFieldHeightHasChanged;
- (void)_reloadCurrentRecipientData;
- (void)_showContactCardForEntity:(id)a3 sourceView:(id)a4;
- (void)_updateToFieldFrame;
- (void)addRecipients:(id)a3;
- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshRecipients;
- (void)reset;
- (void)setAddressBookNotificationUpdater:(id)a3;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setContactsManager:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentConversationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsPopoverPresentationSourceView:(id)a3;
- (void)setNumberOfRowsInToField:(unint64_t)a3;
- (void)setToFieldScrollView:(id)a3;
- (void)updateScreenTimePolicy;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CKMacRecipientsController

- (void)dealloc
{
  v3 = [(CKMacRecipientsController *)self currentConversationContext];

  if (v3)
  {
    v4 = [(CKMacRecipientsController *)self currentConversationContext];
    [v4 removeObserver:self forKeyPath:@"allowedByScreenTime"];
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6 = [(CKMacRecipientsController *)self toField];
  [v6 setDelegate:0];

  self->_numberOfRowsInToField = 1;
  v7.receiver = self;
  v7.super_class = (Class)CKMacRecipientsController;
  [(CKMacRecipientsController *)&v7 dealloc];
}

- (CKMacRecipientsController)initWithConversation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMacRecipientsController;
  v5 = [(CKMacRecipientsController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_conversation, v4);
    if (v4)
    {
      objc_super v7 = [[CKDetailsContactsManager alloc] initWithConversation:v4 delegate:v6];
      contactsManager = v6->_contactsManager;
      v6->_contactsManager = v7;
    }
    v6->_allowedByScreenTime = 1;
    v6->_numberOfRowsInToField = 1;
  }

  return v6;
}

- (BOOL)isEditable
{
  return 0;
}

- (double)preferredMacToolbarHeight
{
  v3 = [(CKMacRecipientsController *)self toField];
  uint64_t v4 = [v3 numberOfRowsOfTextInField];
  unint64_t v5 = [(CKMacRecipientsController *)self numberOfRowsInToField];

  if (v4 != v5)
  {
    v6 = [(CKMacRecipientsController *)self toField];
    -[CKMacRecipientsController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", [v6 numberOfRowsOfTextInField]);
  }
  if ([(CKMacRecipientsController *)self numberOfRowsInToField] < 2
    || [(CKMacRecipientsController *)self numberOfRowsInToField] > 3)
  {
    if ([(CKMacRecipientsController *)self numberOfRowsInToField] <= 3) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 3;
    }
  }
  else
  {
    unint64_t v7 = [(CKMacRecipientsController *)self numberOfRowsInToField];
  }

  [(CKMacRecipientsController *)self _toolbarHeightForNumberOfRows:v7];
  return result;
}

- (BOOL)_shouldEnableScrolling
{
  return ([(CKMacRecipientsController *)self numberOfRowsInToField] < 2
       || [(CKMacRecipientsController *)self numberOfRowsInToField] >= 4)
      && [(CKMacRecipientsController *)self numberOfRowsInToField] > 3;
}

- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3
{
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  [v4 macAppKitToolbarHeight];
  double v6 = v5;
  if (a3 >= 2)
  {
    [MEMORY[0x1E4F5A0C8] defaultHeight];
    double v6 = v6 + (double)(a3 - 1) * (v7 + 6.0);
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  double v5 = objc_msgSend(v3, "initWithFrame:");
  [(CKMacRecipientsController *)self setView:v5];

  double v6 = [(CKMacRecipientsController *)self view];
  [v6 setAutoresizingMask:18];

  double v7 = [(CKMacRecipientsController *)self view];
  v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setBackgroundColor:v8];

  v9 = [(CKMacRecipientsController *)self view];
  [v9 setClipsToBounds:1];

  id v10 = objc_alloc(MEMORY[0x1E4F42DB0]);
  v11 = [(CKMacRecipientsController *)self view];
  [v11 bounds];
  v12 = objc_msgSend(v10, "initWithFrame:");
  [(CKMacRecipientsController *)self setToFieldScrollView:v12];

  v13 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v13 setAutoresizingMask:18];

  v14 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v14 setAlwaysBounceVertical:1];

  v15 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v15 setShowsHorizontalScrollIndicator:0];

  v16 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v16 setAutomaticallyAdjustsScrollIndicatorInsets:0];

  v17 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v17 setContentInsetAdjustmentBehavior:2];

  v18 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v18 setScrollEnabled:0];

  v19 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v19 setShowsVerticalScrollIndicator:0];

  v20 = [(CKMacRecipientsController *)self view];
  v21 = [(CKMacRecipientsController *)self toFieldScrollView];
  [v20 addSubview:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F5A168]);
  v23 = (CNComposeRecipientTextView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  toField = self->_toField;
  self->_toField = v23;

  v25 = [(CKMacRecipientsController *)self toField];
  [v25 setAutoresizingMask:18];

  if (loadView_onceToken_0 != -1) {
    dispatch_once(&loadView_onceToken_0, &__block_literal_global_103);
  }
  v26 = [(CKMacRecipientsController *)self toField];
  v27 = [v26 labelView];
  [v27 setAttributedText:loadView_toText_0];

  v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v27) = [v28 isTranscriptSharingEnabled];

  if (v27)
  {
    v29 = [(CKMacRecipientsController *)self conversation];
    v30 = [v29 chat];
    int v31 = [v30 isStewieSharingChat];

    if (v31)
    {
      v32 = [(CKMacRecipientsController *)self toField];
      v33 = [v32 labelView];
      [v33 setHidden:1];
    }
  }
  v34 = [(CKMacRecipientsController *)self toField];
  v35 = [v34 addButton];
  [v35 setHidden:1];

  v36 = [(CKMacRecipientsController *)self toField];
  [v36 setSeparatorHidden:1];

  v37 = [(CKMacRecipientsController *)self toField];
  v38 = [MEMORY[0x1E4F428B8] clearColor];
  [v37 setBackgroundColor:v38];

  v39 = [(CKMacRecipientsController *)self toField];
  [v39 setDelegate:self];

  v40 = [(CKMacRecipientsController *)self toField];
  [v40 setExpandRecipientsInNamedGroups:0];

  v41 = [(CKMacRecipientsController *)self toField];
  [v41 setShowsAddButtonWhenExpanded:0];

  v42 = [(CKMacRecipientsController *)self toField];
  [v42 setUsingActiveAppearance:1];

  v43 = [(CKMacRecipientsController *)self toField];
  v44 = [v43 textView];
  [v44 setEditable:0];

  v45 = [(CKMacRecipientsController *)self toField];
  v46 = [v45 textView];
  [v46 setSelectable:0];

  [(CKMacRecipientsController *)self _updateToFieldFrame];
  v47 = [(CKMacRecipientsController *)self toFieldScrollView];
  v48 = [(CKMacRecipientsController *)self toField];
  [v47 addSubview:v48];

  id v49 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(CKMacRecipientsController *)self detailsToolbarItemFrame];
  v50 = objc_msgSend(v49, "initWithFrame:");
  [(CKMacRecipientsController *)self setDetailsPopoverPresentationSourceView:v50];

  v51 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
  [v51 setBackgroundColor:0];

  v52 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
  [v52 setOpaque:0];

  v53 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
  [v53 setUserInteractionEnabled:0];

  v54 = [(CKMacRecipientsController *)self view];
  v55 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
  [v54 addSubview:v55];

  [(CKMacRecipientsController *)self refreshRecipients];
  id v56 = [(CKMacRecipientsController *)self view];
  [v56 setUserInteractionEnabled:1];
}

void __37__CKMacRecipientsController_loadView__block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4FB06F8];
  v0 = +[CKUIBehavior sharedBehaviors];
  v1 = [v0 navbarToLabelFont];
  v16[0] = v1;
  v15[1] = *MEMORY[0x1E4FB0700];
  v2 = [MEMORY[0x1E4F428B8] grayColor];
  v16[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v4 = (void *)loadView_attributes_0;
  loadView_attributes_0 = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v6 = CKFrameworkBundle();
  double v7 = [v6 localizedStringForKey:@"TO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v8 = [v5 initWithString:v7 attributes:loadView_attributes_0];
  v9 = (void *)loadView_toText_0;
  loadView_toText_0 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11 = CKFrameworkBundle();
  v12 = [v11 localizedStringForKey:@"No Recipients" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v13 = [v10 initWithString:v12 attributes:loadView_attributes_0];
  v14 = (void *)loadView_placeHolderText_0;
  loadView_placeHolderText_0 = v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKMacRecipientsController;
  [(CKMacRecipientsController *)&v5 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleConversationPreferredServiceDidChangeNotification_ name:@"CKConversationPreferredServiceChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleAddressBookChangedNotification_ name:*MEMORY[0x1E4F6CA50] object:0];
  [v3 addObserver:self selector:sel__handleAddressBookPartialChangedNotification_ name:*MEMORY[0x1E4F6CA60] object:0];
  [v3 addObserver:self selector:sel__handleKeyTransparencyStatusChangedNotification_ name:*MEMORY[0x1E4F6B998] object:0];
  uint64_t v4 = [[CKManualUpdater alloc] initWithTarget:self action:sel__reloadCurrentRecipientData];
  [(CKMacRecipientsController *)self setAddressBookNotificationUpdater:v4];
}

- (void)viewWillLayoutSubviews
{
  [(CKMacRecipientsController *)self _updateToFieldFrame];
  [(CKMacRecipientsController *)self detailsToolbarItemFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
  [v11 frame];
  v31.origin.x = v12;
  v31.origin.y = v13;
  v31.size.width = v14;
  v31.size.height = v15;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  BOOL v16 = CGRectEqualToRect(v30, v31);

  if (!v16)
  {
    v17 = [(CKMacRecipientsController *)self detailsPopoverPresentationSourceView];
    objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);
  }
  if (CKIsRunningInMacCatalyst())
  {
    v18 = [(CKMacRecipientsController *)self toField];
    [v18 frame];
    double v20 = v19;
    v21 = [(CKMacRecipientsController *)self toField];
    [v21 frame];
    double v23 = v22 + 8.0;
    v24 = [(CKMacRecipientsController *)self toFieldScrollView];
    objc_msgSend(v24, "setContentSize:", v20, v23);

    BOOL v25 = [(CKMacRecipientsController *)self _shouldEnableScrolling];
    v26 = [(CKMacRecipientsController *)self toFieldScrollView];
    [v26 setScrollEnabled:v25];

    BOOL v27 = [(CKMacRecipientsController *)self _shouldEnableScrolling];
    id v28 = [(CKMacRecipientsController *)self toFieldScrollView];
    [v28 setShowsVerticalScrollIndicator:v27];
  }
}

- (void)setConversation:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversation);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    [(CKMacRecipientsController *)self reset];
    objc_storeWeak((id *)&self->_conversation, obj);
    if (obj)
    {
      double v6 = [[CKDetailsContactsManager alloc] initWithConversation:obj delegate:self];
      contactsManager = self->_contactsManager;
      self->_contactsManager = v6;

      double v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v9 = [v8 isKeyTransparencyEnabled];

      if (v9)
      {
        double v10 = [obj chat];
        [v10 fetchKTStatus];
      }
    }
    [(CKMacRecipientsController *)self refreshRecipients];
    double v5 = obj;
  }
}

- (void)refreshRecipients
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(CKMacRecipientsController *)self reset];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(CKMacRecipientsController *)v2 conversation];

  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v26 = v2;
    double v5 = [(CKMacRecipientsController *)v2 conversation];
    double v6 = [v5 recipients];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v27 + 1) + 8 * v10) defaultIMHandle];
          CGFloat v12 = v11;
          if (v11)
          {
            CGFloat v13 = [v11 normalizedID];
            if (CKIsValidAddress(v13))
            {
              CGFloat v14 = +[CKRecipientGenerator sharedRecipientGenerator];
              CGFloat v15 = [v14 recipientWithAddress:v13];

              if (v15)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  BOOL v16 = [(CKMacRecipientsController *)v26 conversation];
                  objc_msgSend(v15, "setUseAbbreviatedDisplayName:", objc_msgSend(v16, "isGroupConversation"));
                }
                [v3 addObject:v15];
              }
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    v2 = v26;
  }
  if ([v3 count])
  {
    v17 = [(CKMacRecipientsController *)v2 conversation];
    if ([v17 isGroupConversation])
    {
      v18 = [(CKMacRecipientsController *)v2 conversation];
      int v19 = [v18 hasDisplayName];

      if (!v19)
      {
LABEL_23:
        [(CKMacRecipientsController *)v2 addRecipients:v3];
        goto LABEL_24;
      }
      id v20 = objc_alloc(MEMORY[0x1E4F5A150]);
      v21 = [(CKMacRecipientsController *)v2 conversation];
      double v22 = [v21 displayName];
      v17 = (void *)[v20 initWithChildren:v3 displayString:v22];

      double v23 = (void *)MEMORY[0x1E4F1CA48];
      CGRect v31 = v17;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      uint64_t v25 = [v23 arrayWithArray:v24];

      double v3 = (void *)v25;
    }

    goto LABEL_23;
  }
LABEL_24:
}

- (CGRect)detailsToolbarItemFrame
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 macNSToolbarItemSize];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(CKMacRecipientsController *)self view];
  [v8 frame];
  double v10 = v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 macAppKitToolbarHeight];
  double v13 = v12;

  CGFloat v14 = [(CKMacRecipientsController *)self view];
  LODWORD(v11) = [v14 _shouldReverseLayoutDirection];

  CGFloat v15 = +[CKUIBehavior sharedBehaviors];
  [v15 macNSToolbarItemInterItemSpacing];
  double v17 = v16;

  double v18 = v10 - v17 - v5;
  if (v11) {
    double v18 = v17;
  }
  double v19 = v13 * 0.5 - v7 * 0.5;
  double v20 = v5;
  double v21 = v7;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)faceTimeStartOrLaunchCallToolbarItemFrame
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 macNSToolbarItemSize];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(CKMacRecipientsController *)self view];
  [v8 frame];
  double v10 = v9;

  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 macAppKitToolbarHeight];
  double v13 = v12;

  CGFloat v14 = +[CKUIBehavior sharedBehaviors];
  [v14 macNSToolbarItemInterItemSpacing];
  double v16 = v15;

  double v17 = v5 + v5 + v16 * 2.0;
  double v18 = [(CKMacRecipientsController *)self view];
  LODWORD(v14) = [v18 _shouldReverseLayoutDirection];

  double v19 = v10 - v17;
  if (v14) {
    double v19 = v17;
  }
  double v20 = v13 * 0.5 - v7 * 0.5;
  double v21 = v5;
  double v22 = v7;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)faceTimeJoinCallToolbarItemFrame
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 macNSToolbarItemSize];
  double v5 = v4;

  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 macJoinFaceTimeNSToolbarItemSize];
  double v8 = v7;
  double v10 = v9;

  v11 = [(CKMacRecipientsController *)self view];
  [v11 frame];
  double v13 = v12;

  CGFloat v14 = +[CKUIBehavior sharedBehaviors];
  [v14 macAppKitToolbarHeight];
  double v16 = v15;

  double v17 = +[CKUIBehavior sharedBehaviors];
  [v17 macNSToolbarItemInterItemSpacing];
  double v19 = v18;

  double v20 = v8 + v5 + v19 * 2.0;
  double v21 = [(CKMacRecipientsController *)self view];
  LODWORD(v17) = [v21 _shouldReverseLayoutDirection];

  double v22 = v13 - v20;
  if (v17) {
    double v22 = v20;
  }
  double v23 = v16 * 0.5 - v10 * 0.5;
  double v24 = v8;
  double v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)innermostToolbarItemFrame
{
  double v3 = [(CKMacRecipientsController *)self delegate];
  uint64_t v4 = [v3 innermostToolbarItemIdentifier];
  double v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = @"CKMacToolbarChatDetailsItemIdentifier";
  }
  double v7 = v6;

  if (![(__CFString *)v7 isEqualToString:@"CKMacToolbarChatDetailsItemIdentifier"])
  {
    if (([(__CFString *)v7 isEqualToString:@"CKMacToolbarFacetimeStartCallItemIdentifier"] & 1) != 0
      || [(__CFString *)v7 isEqualToString:@"CKMacToolbarFacetimeJoinedCallItemIdentifier"])
    {
      [(CKMacRecipientsController *)self faceTimeStartOrLaunchCallToolbarItemFrame];
      goto LABEL_9;
    }
    if ([(__CFString *)v7 isEqualToString:@"CKMacToolbarFacetimeJoinCallItemIdentifier"])
    {
      [(CKMacRecipientsController *)self faceTimeJoinCallToolbarItemFrame];
      goto LABEL_9;
    }
  }
  [(CKMacRecipientsController *)self detailsToolbarItemFrame];
LABEL_9:
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_updateToFieldFrame
{
  double v3 = [(CKMacRecipientsController *)self view];
  int v4 = [v3 _shouldReverseLayoutDirection];

  [(CKMacRecipientsController *)self innermostToolbarItemFrame];
  double v6 = v5;
  CGFloat v44 = v7;
  CGFloat v45 = v8;
  CGFloat rect = v9;
  double v10 = [(CKMacRecipientsController *)self view];
  [v10 frame];
  double v43 = v11;

  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 toFieldScrollViewInsets];
  double v14 = v13;
  double v16 = v15;

  [(CKMacRecipientsController *)self _toolbarHeightForNumberOfRows:[(CKMacRecipientsController *)self numberOfRowsInToField]];
  double v18 = v17;
  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 toFieldXOffset];
  double v21 = v20;

  double v22 = [(CNComposeRecipientTextView *)self->_toField labelView];
  [v22 sizeToFit];

  toField = self->_toField;
  double v24 = [(CNComposeRecipientTextView *)toField labelView];
  [v24 frame];
  -[CNComposeRecipientTextView convertRect:toView:](toField, "convertRect:toView:", self->_toField);

  double v25 = +[CKUIBehavior sharedBehaviors];
  [v25 toFieldPreferredHeight];

  v26 = +[CKUIBehavior sharedBehaviors];
  [v26 toFieldYOffset];
  long long v27 = [(CKMacRecipientsController *)self traitCollection];
  [v27 displayScale];
  UIRoundToScale();
  double v29 = v28;

  if (v4)
  {
    v48.origin.x = v6;
    v48.origin.y = v44;
    v48.size.height = v45;
    v48.size.width = rect;
    double MaxX = CGRectGetMaxX(v48);
    double v6 = v43 - MaxX;
  }
  else
  {
    double MaxX = v14 + v21;
    double v16 = v14;
  }
  double v31 = v6 - v21 - v16;
  v32 = [(CKMacRecipientsController *)self view];
  uint64_t v33 = [v32 traitCollection];
  [v33 displayScale];
  double v35 = round(MaxX * v34) / v34;
  double v36 = round(v29 * v34) / v34;
  double v37 = round(v31 * v34) / v34;
  double v38 = round(v18 * v34) / v34;

  [(CNComposeRecipientTextView *)self->_toField frame];
  v50.origin.x = v39;
  v50.origin.y = v40;
  v50.size.width = v41;
  v50.size.height = v42;
  v49.origin.x = v35;
  v49.origin.y = v36;
  v49.size.width = v37;
  v49.size.height = v38;
  if (!CGRectEqualToRect(v49, v50)) {
    -[CNComposeRecipientTextView setFrame:](self->_toField, "setFrame:", v35, v36, v37, v38);
  }

  [(CKMacRecipientsController *)self _notifyDelegatesToFieldHeightHasChanged];
}

- (void)_reloadCurrentRecipientData
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKMacRecipientsController *)self recipients];
  int v4 = (void *)[v3 copy];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v5 = *(void *)v34;
    uint64_t v24 = *(void *)v34;
    double v25 = v2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        double v8 = [(CKMacRecipientsController *)v2 toField];
        [v8 removeRecipient:v7];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v7 children], double v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
        {
          double v10 = [MEMORY[0x1E4F1CA48] array];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v27 = v7;
          double v11 = [v7 children];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v30;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v30 != v14) {
                  objc_enumerationMutation(v11);
                }
                double v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
                double v17 = +[CKRecipientGenerator sharedRecipientGenerator];
                double v18 = [v16 normalizedAddress];
                double v19 = [v17 recipientWithAddress:v18];

                if (v19) {
                  [v10 addObject:v19];
                }

                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v13);
          }

          id v20 = objc_alloc(MEMORY[0x1E4F5A150]);
          double v21 = [v27 displayString];
          double v22 = (void *)[v20 initWithChildren:v10 displayString:v21];
          uint64_t v5 = v24;
          v2 = v25;
        }
        else
        {
          double v10 = +[CKRecipientGenerator sharedRecipientGenerator];
          double v21 = [v7 normalizedAddress];
          double v22 = [v10 recipientWithAddress:v21];
        }

        double v23 = [(CKMacRecipientsController *)v2 toField];
        [v23 addRecipient:v22];

        ++v6;
      }
      while (v6 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }

  [(CKMacRecipientsController *)v2 _notifyDelegatesToFieldHeightHasChanged];
}

- (id)recipients
{
  v2 = [(CKMacRecipientsController *)self toField];
  double v3 = [v2 recipients];

  return v3;
}

- (void)addRecipients:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          uint64_t v12 = [(CKMacRecipientsController *)self toField];
          [v12 addRecipient:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(CKMacRecipientsController *)self updateScreenTimePolicy];
  }
  [(CKMacRecipientsController *)self _notifyDelegatesToFieldHeightHasChanged];
}

- (void)reset
{
  double v3 = [(CKMacRecipientsController *)self toField];
  id v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(CKMacRecipientsController *)self toField];
    uint64_t v7 = [MEMORY[0x1E4F1C978] array];
    [v6 setRecipients:v7];

    uint64_t v8 = [(CKMacRecipientsController *)self toField];
    uint64_t v9 = [MEMORY[0x1E4F1C978] array];
    [v8 setAddresses:v9];

    id v10 = [(CKMacRecipientsController *)self toField];
    [v10 clearText];
  }
}

- (void)_notifyDelegatesToFieldHeightHasChanged
{
  unint64_t v3 = [(CKMacRecipientsController *)self numberOfRowsInToField];
  id v4 = [(CKMacRecipientsController *)self toField];
  uint64_t v5 = [v4 numberOfRowsOfTextInField];

  if (v3 != v5)
  {
    id v6 = [(CKMacRecipientsController *)self toField];
    -[CKMacRecipientsController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", [v6 numberOfRowsOfTextInField]);

    id v7 = [(CKMacRecipientsController *)self delegate];
    [v7 macRecipientsControllerDidUpdateToFieldSizing:self];
  }
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  id v4 = [(CKMacRecipientsController *)self addressBookNotificationUpdater];
  [v4 setNeedsUpdate];

  id v5 = [(CKMacRecipientsController *)self addressBookNotificationUpdater];
  [v5 updateIfNeeded];
}

- (void)_handleAddressBookPartialChangedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA90]];

  if ([v6 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(CKMacRecipientsController *)self recipients];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) normalizedAddress];
          int v13 = [v6 isEqualToString:v12];

          if (v13)
          {
            [(CKMacRecipientsController *)self _handleAddressBookChangedNotification:v4];
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMacRecipientsController *)self conversation];
  id v6 = [v4 object];

  LODWORD(v4) = [v5 isEqual:v6];
  if (v4)
  {
    id v7 = [(CKMacRecipientsController *)self toField];
    [v7 invalidateAtomPresentationOptions];
  }
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 address];

  if (v5)
  {
    if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
    {
      id v6 = [(CKMacRecipientsController *)self currentConversationContext];

      if (v6)
      {
        id v7 = [(CKMacRecipientsController *)self currentConversationContext];
        uint64_t v8 = [v7 allowedByContactsHandle];
        uint64_t v9 = [v4 normalizedAddress];
        uint64_t v10 = [v8 objectForKey:v9];

        if (v10 && ![v10 BOOLValue])
        {

          unint64_t v21 = 0x2000;
          goto LABEL_18;
        }
      }
    }
    uint64_t v11 = [(CKMacRecipientsController *)self conversation];

    if (v11)
    {
      uint64_t v12 = [(CKMacRecipientsController *)self conversation];
      int v13 = [v12 sendingService];
      long long v14 = [MEMORY[0x1E4F6BDB8] iMessageService];

      if (v13 == v14)
      {
        unint64_t v21 = 0;
        goto LABEL_18;
      }
      long long v15 = [(CKMacRecipientsController *)self conversation];
      uint64_t v16 = [v15 sendingService];
      if (v16)
      {
        long long v17 = (void *)v16;
        uint64_t v18 = [(CKMacRecipientsController *)self conversation];
        uint64_t v19 = [v18 sendingService];
        id v20 = [MEMORY[0x1E4F6BDB8] facetimeService];

        if (v19 != v20)
        {
          unint64_t v21 = 2;
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    unint64_t v21 = 1;
    goto LABEL_18;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  unint64_t v21 = 4;
LABEL_18:

  return v21;
}

- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMacRecipientsController *)self conversation];
  id v6 = [v5 chat];
  BOOL v7 = +[CKContactKeyVerificationRecipientsHelper shouldShowVerifiedIconForRecipient:v4 inChat:v6];

  return v7;
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    BOOL v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F6B988]];

    uint64_t v9 = [(CKMacRecipientsController *)self recipients];
    uint64_t v10 = [(CKMacRecipientsController *)self conversation];
    uint64_t v11 = +[CKContactKeyVerificationRecipientsHelper recipientsToUpdateForUpdatedCKVHandles:v8 recipients:v9 inConversation:v10];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
          uint64_t v18 = [(CKMacRecipientsController *)self toField];
          [v18 invalidateAtomPresentationOptionsForRecipient:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKMacRecipientsController *)self toField];

  if (v8 != v6) {
    goto LABEL_2;
  }
  uint64_t v11 = [v7 recipient];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v39 = v7;
    uint64_t v14 = [v7 recipient];
    uint64_t v15 = [v14 children];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v42 + 1) + 8 * i) normalizedAddress];
          long long v21 = +[CKEntity entityForAddress:v20];
          [v13 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }

    long long v22 = [(CKMacRecipientsController *)self conversation];
    double v23 = [v22 recipients];
    int v24 = [v23 isEqualToArray:v13];

    if (v24)
    {
      double v25 = [(CKMacRecipientsController *)self conversation];
      v26 = [(CKMacRecipientsController *)self contactsManager];
      uint64_t v9 = +[CKContextMenuGenerator menuForNamedGroupConversation:v25 andContactsManager:v26];
    }
    else
    {
      uint64_t v9 = 0;
    }

    id v7 = v39;
  }
  else
  {
    long long v27 = [(CKMacRecipientsController *)self contactsManager];
    int v28 = [v27 conformsToProtocol:&unk_1EE096660];

    if (!v28) {
      goto LABEL_2;
    }
    uint64_t v29 = [v7 recipient];
    if (!v29) {
      goto LABEL_2;
    }
    long long v30 = (void *)v29;
    long long v31 = [v7 recipient];
    long long v32 = [v31 normalizedAddress];

    if (!v32)
    {
LABEL_2:
      uint64_t v9 = 0;
      goto LABEL_3;
    }
    long long v33 = [v7 recipient];
    long long v34 = [v33 normalizedAddress];
    long long v35 = +[CKEntity entityForAddress:v34];

    long long v36 = [(CKMacRecipientsController *)self contactsManager];
    uint64_t v9 = [v36 contextMenuForEntity:v35 atom:v7];
  }
  if (v9)
  {
    double v37 = (void *)MEMORY[0x1E4F428F0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __82__CKMacRecipientsController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke;
    v40[3] = &unk_1E56212E0;
    id v41 = v9;
    id v38 = v9;
    uint64_t v9 = [v37 configurationWithIdentifier:0 previewProvider:0 actionProvider:v40];
  }
LABEL_3:

  return v9;
}

id __82__CKMacRecipientsController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v17 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    id v5 = [v17 recipient];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = [v17 recipient];
      id v8 = [v7 normalizedAddress];
      uint64_t v9 = +[CKEntity entityForAddress:v8];

      uint64_t v10 = [(CKMacRecipientsController *)self conversation];
      LODWORD(v8) = [v10 isGroupConversation];

      if (v8)
      {
        uint64_t v11 = NSString;
        id v12 = [v9 defaultIMHandle];
        uint64_t v13 = [v12 ID];
        uint64_t v14 = [v11 stringWithFormat:@"sms://open?addresses=%@", v13];

        uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
        uint64_t v16 = [MEMORY[0x1E4F42738] sharedApplication];
        [v16 openURL:v15 options:MEMORY[0x1E4F1CC08] completionHandler:0];
      }
      else
      {
        [(CKMacRecipientsController *)self _showContactCardForEntity:v9 sourceView:v17];
      }
    }
  }
}

- (void)_showContactCardForEntity:(id)a3 sourceView:(id)a4
{
  id v4 = [a3 rawAddress];
  IMStripFormattingFromAddress();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  id v6 = objc_msgSend(v5, "__ck_bestAccountForAddress:", v13);
  id v7 = [v6 imHandleWithID:v13 alreadyCanonical:0];

  id v8 = [v7 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  if (CKIsRunningInMacCatalyst()
    && [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v8])
  {
    uint64_t v9 = [MEMORY[0x1E4F28E78] stringWithString:@"addressbook://"];
    uint64_t v10 = [v8 identifier];
    [v9 appendString:v10];

    uint64_t v11 = [MEMORY[0x1E4F42738] sharedApplication];
    id v12 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    [v11 openURL:v12 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (id)handlesForScreenTimePolicyCheck
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    unint64_t v3 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(CKMacRecipientsController *)self toField];
    id v5 = [v4 recipients];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) normalizedAddress];
          if (v10) {
            [v3 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)updateScreenTimePolicy
{
  unint64_t v3 = [(CKMacRecipientsController *)self currentConversationContext];

  if (v3)
  {
    id v4 = [(CKMacRecipientsController *)self currentConversationContext];
    [v4 removeObserver:self forKeyPath:@"allowedByScreenTime"];

    [(CKMacRecipientsController *)self setCurrentConversationContext:0];
  }
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    id v5 = [(CKMacRecipientsController *)self handlesForScreenTimePolicyCheck];
    uint64_t v6 = [MEMORY[0x1E4F6BCB0] sharedInstance];
    id v11 = 0;
    uint64_t v7 = [v6 allowedToShowConversationWithHandleIDs:v5 sync:1 context:&v11];
    id v8 = v11;

    [(CKMacRecipientsController *)self setCurrentConversationContext:v8];
    if (v7 != [(CKMacRecipientsController *)self allowedByScreenTime])
    {
      uint64_t v9 = [(CKMacRecipientsController *)self toField];
      [v9 invalidateAtomPresentationOptions];
    }
    [(CKMacRecipientsController *)self setAllowedByScreenTime:v7];
    uint64_t v10 = [(CKMacRecipientsController *)self currentConversationContext];
    [v10 addObserver:self forKeyPath:@"allowedByScreenTime" options:1 context:ctxAllowedByScreenTime_0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = v10;
  if ((void *)ctxAllowedByScreenTime_0 == a6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__CKMacRecipientsController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5620AF8;
    id v14 = v10;
    long long v15 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKMacRecipientsController;
    [(CKMacRecipientsController *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

void __76__CKMacRecipientsController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setAllowedByScreenTime:", objc_msgSend(v2, "allowedByScreenTime"));
  id v3 = [*(id *)(a1 + 40) toField];

  [v3 invalidateAtomPresentationOptions];
}

- (CKConversation)conversation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversation);

  return (CKConversation *)WeakRetained;
}

- (CNComposeRecipientTextView)toField
{
  return self->_toField;
}

- (UIView)detailsPopoverPresentationSourceView
{
  return self->_detailsPopoverPresentationSourceView;
}

- (void)setDetailsPopoverPresentationSourceView:(id)a3
{
}

- (STConversationContext)currentConversationContext
{
  return self->_currentConversationContext;
}

- (void)setCurrentConversationContext:(id)a3
{
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (CKMacRecipientsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMacRecipientsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (UIScrollView)toFieldScrollView
{
  return self->_toFieldScrollView;
}

- (void)setToFieldScrollView:(id)a3
{
}

- (CKManualUpdater)addressBookNotificationUpdater
{
  return self->_addressBookNotificationUpdater;
}

- (void)setAddressBookNotificationUpdater:(id)a3
{
}

- (unint64_t)numberOfRowsInToField
{
  return self->_numberOfRowsInToField;
}

- (void)setNumberOfRowsInToField:(unint64_t)a3
{
  self->_numberOfRowsInToField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, 0);
  objc_storeStrong((id *)&self->_toFieldScrollView, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentConversationContext, 0);
  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, 0);
  objc_storeStrong((id *)&self->_toField, 0);

  objc_destroyWeak((id *)&self->_conversation);
}

@end