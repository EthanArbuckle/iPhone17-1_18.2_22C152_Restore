@interface CKComposeRecipientSelectionController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasExistingConversationWithAddedRecipient:(id)a3;
- (BOOL)_isOniMessageService:(id)a3;
- (BOOL)_shouldHideFromField;
- (BOOL)_updateBackfillForNewRecipients;
- (BOOL)alwaysShowSearchResultsTable;
- (BOOL)contactPreferredContextSelected;
- (BOOL)fromFieldIdentityChanged;
- (BOOL)hasBackfilledConversation;
- (BOOL)hasUserSetContextPreference;
- (BOOL)hasiMessageableContext;
- (BOOL)homogenizePreferredServiceForiMessage;
- (BOOL)isBeingPresentedInMacDetailsView;
- (BOOL)isFirstAppear;
- (BOOL)recipientIsiMessagable:(id)a3;
- (BOOL)shouldAtomizeToConversationName;
- (BOOL)shouldInvalidateIDSRequests;
- (BOOL)shouldSuppressSearchResultsTable;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CKComposeSubscriptionSelectorButton)subscriptionSelectorButton;
- (CTXPCServiceSubscriptionContext)selectedSubscriptionContext;
- (NSArray)expandedRecipients;
- (NSArray)proposedRecipients;
- (NSString)selectedLastAddressedOrDefaultHandle;
- (NSString)simID;
- (TUSenderIdentity)selectedSenderIdentity;
- (UILabel)fromTextLabel;
- (UIStackView)fromFieldContentStackView;
- (UIView)fromFieldContainerView;
- (UIView)fromFieldSeparator;
- (double)fromFieldHeight;
- (id)_bestSenderIdentityForRecipient:(id)a3;
- (id)_contactPreferredSenderIdentityForRecipient:(id)a3;
- (id)_defaultSubscriptionContext;
- (id)_defaultSubscriptionContextForiMessage;
- (id)_handlesForRecipients:(id)a3;
- (id)_pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:(id)a3;
- (id)_preferrediMessageAccountName;
- (id)_subscriptionContextForSimID:(id)a3 phoneNumber:(id)a4;
- (id)autocompleteResultIdentifier:(id)a3;
- (id)conversationGUIDForRecipient:(id)a3;
- (id)conversationList;
- (id)menuForSubscriptionSelector;
- (id)recipients;
- (id)sendBlock;
- (unint64_t)_fromFieldThemeForCurrentService;
- (void)CKComposeSubscriptionSelectorButtonWasTapped:(id)a3;
- (void)_atomizeToConversationNameIfNecessary:(unint64_t)a3;
- (void)_lastAddressedHandleChangedNotification:(id)a3;
- (void)_layoutFromFieldShouldHide:(BOOL)a3;
- (void)_legacyAddRecipient:(id)a3;
- (void)_recoverConversationIfJunk:(id)a3;
- (void)_updateBackfillForNewRecipients;
- (void)_updateContentsOfFromField;
- (void)_updateFromFieldIfNeeded;
- (void)_updateSubscriptionContextForRecipient:(id)a3 preferredService:(id)a4;
- (void)addRecipient:(id)a3;
- (void)atomizeAndInvokeBlock:(id)a3;
- (void)atomizeAndSendTimeoutHandler;
- (void)configureSubscriptionContextForRecipients:(id)a3;
- (void)conversationPreferredServiceDidChange;
- (void)dealloc;
- (void)loadView;
- (void)presentAlertForSubscriptionContext;
- (void)presentContextSelectionAlertWithCompletion:(id)a3;
- (void)recipientSelectionControllerDidChange;
- (void)reset;
- (void)setContactPreferredContextSelected:(BOOL)a3;
- (void)setFirstAppear:(BOOL)a3;
- (void)setFromFieldContainerView:(id)a3;
- (void)setFromFieldContentStackView:(id)a3;
- (void)setFromFieldIdentityChanged:(BOOL)a3;
- (void)setFromFieldSeparator:(id)a3;
- (void)setFromTextLabel:(id)a3;
- (void)setHasUserSetContextPreference:(BOOL)a3;
- (void)setSelectedSubscriptionContext:(id)a3;
- (void)setSendBlock:(id)a3;
- (void)setSimID:(id)a3;
- (void)setSubscriptionSelectorButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CKComposeRecipientSelectionController

- (void)dealloc
{
  [(CKComposeRecipientSelectionController *)self setSendBlock:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_atomizeAndSendTimeoutHandler object:0];
  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v3 dealloc];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v5 viewDidDisappear:a3];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_atomizeAndInvokeTimeoutHandler object:0];
  v4 = [(CKComposeRecipientSelectionController *)self presentedViewController];

  if (!v4) {
    [(CKComposeRecipientSelectionController *)self setHasUserSetContextPreference:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentAlertForSubscriptionContext
{
  if ([(CKComposeRecipientSelectionController *)self isFirstAppear])
  {
    if ([(CKComposeRecipientSelectionController *)self deviceHasMultipleSubscriptions])
    {
      objc_super v3 = [(CKRecipientSelectionController *)self toField];
      v4 = [v3 recipients];
      [(CKComposeRecipientSelectionController *)self configureSubscriptionContextForRecipients:v4];
    }
    [(CKComposeRecipientSelectionController *)self setFirstAppear:0];
  }
}

- (void)viewDidAppearDeferredSetup
{
  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v3 viewDidAppearDeferredSetup];
  [(CKComposeRecipientSelectionController *)self presentAlertForSubscriptionContext];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKComposeRecipientSelectionController *)&v3 viewDidLayoutSubviews];
  if ([(CKComposeRecipientSelectionController *)self deviceHasMultipleSubscriptions])
  {
    [(CKComposeRecipientSelectionController *)self _layoutFromFieldShouldHide:0];
    [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
  }
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v4 loadView];
  [(CKComposeRecipientSelectionController *)self setFirstAppear:1];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__lastAddressedHandleChangedNotification_ name:*MEMORY[0x1E4F6B9A0] object:0];
}

- (void)configureSubscriptionContextForRecipients:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKComposeRecipientSelectionController *)self deviceHasMultipleSubscriptions])
  {
    if ([(CKComposeRecipientSelectionController *)self hasBackfilledConversation])
    {
      [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
      goto LABEL_30;
    }
    if ([(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions])
    {
      [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
    }
    if (![v4 count])
    {
      v10 = [(CKComposeRecipientSelectionController *)self _defaultSubscriptionContext];
      [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v10];

      goto LABEL_30;
    }
    if (![(CKComposeRecipientSelectionController *)self hasUserSetContextPreference])
    {
      objc_super v5 = [(CKComposeRecipientSelectionController *)self simID];

      if (v5)
      {
        v6 = [MEMORY[0x1E4F6E668] sharedInstance];
        v7 = [v6 ctSubscriptionInfo];
        v8 = [(CKComposeRecipientSelectionController *)self simID];
        v9 = objc_msgSend(v7, "__im_subscriptionContextForForSimID:", v8);

        if (v9)
        {
          [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v9];
LABEL_29:

          goto LABEL_30;
        }
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v4;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v29 = v4;
        v30 = self;
        char v14 = 0;
        v15 = 0;
        uint64_t v16 = *(void *)v34;
        uint64_t v31 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            v18 = v15;
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v11);
            }
            v19 = -[CKComposeRecipientSelectionController _bestSenderIdentityForRecipient:](self, "_bestSenderIdentityForRecipient:", *(void *)(*((void *)&v33 + 1) + 8 * i), v29);
            v15 = v19;
            BOOL v20 = v19 == 0;
            if (v18)
            {
              if (v19)
              {
                [v19 accountUUID];
                v22 = id v21 = v11;
                [v18 accountUUID];
                uint64_t v23 = v13;
                v25 = v24 = v18;
                char v26 = [v22 isEqual:v25];

                v18 = v24;
                uint64_t v13 = v23;

                id v11 = v21;
                self = v30;
                uint64_t v16 = v31;
                if ((v26 & 1) == 0)
                {

                  char v14 = 1;
                  goto LABEL_25;
                }
              }
            }
            v14 |= v20;
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        if (v15)
        {
          v18 = v15;
LABEL_25:
          id v4 = v29;
          v27 = [MEMORY[0x1E4F6E668] sharedInstance];
          v28 = [v27 ctSubscriptionInfo];
          v9 = objc_msgSend(v28, "__im_subscriptionContextForSenderIdentity:", v18);

          [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v9];
          if ((v14 & 1) == 0) {
            goto LABEL_28;
          }
LABEL_26:
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __83__CKComposeRecipientSelectionController_configureSubscriptionContextForRecipients___block_invoke;
          v32[3] = &unk_1E562AFE0;
          v32[4] = self;
          [(CKComposeRecipientSelectionController *)self presentContextSelectionAlertWithCompletion:v32];
          goto LABEL_28;
        }
        [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:0];
        v9 = 0;
        v18 = 0;
        id v4 = v29;
        if (v14) {
          goto LABEL_26;
        }
      }
      else
      {

        [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:0];
        v9 = 0;
        v18 = 0;
      }
LABEL_28:

      goto LABEL_29;
    }
  }
LABEL_30:
}

void __83__CKComposeRecipientSelectionController_configureSubscriptionContextForRecipients___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = IMOSLoggingEnabled();
  if (v5 && a2)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [*(id *)(a1 + 32) selectedSubscriptionContext];
        int v14 = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", (uint8_t *)&v14, 0x16u);
      }
    }
    [*(id *)(a1 + 32) setHasUserSetContextPreference:1];
  }
  else
  {
    if (v6)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "No subscription info found (or user cancelled action). Setting to default context", (uint8_t *)&v14, 2u);
      }
    }
    v10 = [*(id *)(a1 + 32) selectedSubscriptionContext];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) _defaultSubscriptionContext];
    }
    id v13 = v12;

    id v5 = v13;
  }
  [*(id *)(a1 + 32) setSelectedSubscriptionContext:v5];
  [*(id *)(a1 + 32) _updateFromFieldIfNeeded];
}

- (TUSenderIdentity)selectedSenderIdentity
{
  objc_super v3 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
  selectedSenderIdentity = self->_selectedSenderIdentity;
  if (selectedSenderIdentity) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v7 = [v3 labelID];
    v8 = (void *)[v6 initWithUUIDString:v7];

    v9 = [MEMORY[0x1E4FADA90] sharedInstance];
    v10 = [v9 providerManager];

    id v11 = [v10 telephonyProvider];
    id v12 = [v11 senderIdentityForAccountUUID:v8];
    id v13 = self->_selectedSenderIdentity;
    self->_selectedSenderIdentity = v12;

    selectedSenderIdentity = self->_selectedSenderIdentity;
  }
  int v14 = selectedSenderIdentity;

  return v14;
}

- (CTXPCServiceSubscriptionContext)selectedSubscriptionContext
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) != 0 || IMIsRunningInUnitTesting())
  {
    objc_super v3 = [MEMORY[0x1E4F6E668] sharedInstance];
    id v4 = [v3 ctSubscriptionInfo];
    BOOL v5 = [v4 phoneNumbersOfActiveSubscriptions];

    id v6 = [(CKRecipientSelectionController *)self conversation];
    v7 = [v6 chat];
    v8 = [v7 lastAddressedHandleID];
    v9 = IMChatCanonicalIDSIDsForAddress();
    v10 = [v9 _stripFZIDPrefix];

    id v11 = [(CKRecipientSelectionController *)self conversation];
    id v12 = [v11 chat];
    id v13 = [v12 lastAddressedHandleID];
    if ((IMStringIsEmail() & 1) == 0
      && [v5 containsObject:v10]
      && [(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions]&& [(CKComposeRecipientSelectionController *)self hasBackfilledConversation])
    {
      int v14 = [(CKComposeRecipientSelectionController *)self recipients];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        long long v36 = [MEMORY[0x1E4F6E668] sharedInstance];
        long long v35 = [v36 ctSubscriptionInfo];
        __int16 v16 = [(CKRecipientSelectionController *)self conversation];
        v17 = [v16 chat];
        uint64_t v18 = [v17 lastAddressedSIMID];
        v19 = [(CKRecipientSelectionController *)self conversation];
        BOOL v20 = [v19 chat];
        id v21 = [v20 lastAddressedHandleID];
        objc_msgSend(v35, "__im_subscriptionContextForForSimID:phoneNumber:", v18, v21);
        uint64_t v38 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();

        if (self->_selectedSubscriptionContext != v38)
        {
          if (IMOSLoggingEnabled())
          {
            v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v37 = [(CKRecipientSelectionController *)self conversation];
              uint64_t v23 = [v37 chat];
              v24 = [v23 lastAddressedHandleID];
              v25 = @"YES";
              if ([(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions])
              {
                char v26 = @"YES";
              }
              else
              {
                char v26 = @"NO";
              }
              if (![(CKComposeRecipientSelectionController *)self hasBackfilledConversation])v25 = @"NO"; {
              v27 = [(CKComposeRecipientSelectionController *)self recipients];
              }
              *(_DWORD *)buf = 138413314;
              v40 = v24;
              __int16 v41 = 2112;
              v42 = v26;
              __int16 v43 = 2112;
              v44 = v25;
              __int16 v45 = 2048;
              uint64_t v46 = [v27 count];
              __int16 v47 = 2112;
              v48 = v38;
              _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Updating subscriptionContext for lastAddressedHandleID = %@, hasMultipleActiveSubscriptions = %@, hasBackfilledConversation = %@, recipientCount = %lu to: %@", buf, 0x34u);
            }
          }
          [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v38];
        }
      }
    }
    else
    {
    }
    if (!self->_selectedSubscriptionContext)
    {
      v28 = [(CKComposeRecipientSelectionController *)self _defaultSubscriptionContext];
      [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v28];

      if (IMOSLoggingEnabled())
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          selectedSubscriptionContext = self->_selectedSubscriptionContext;
          BOOL v31 = [(CKComposeRecipientSelectionController *)self hasiMessageableContext];
          v32 = @"NO";
          if (v31) {
            v32 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          v40 = selectedSubscriptionContext;
          __int16 v41 = 2112;
          v42 = v32;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "selectedSubscriptionContext was nil, default context is %@ hasiMessageableContext: %@", buf, 0x16u);
        }
      }
    }
    long long v33 = self->_selectedSubscriptionContext;
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

- (void)setSelectedSubscriptionContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (CTXPCServiceSubscriptionContext *)a3;
  p_selectedSubscriptionContext = (id *)&self->_selectedSubscriptionContext;
  if (self->_selectedSubscriptionContext != v5)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = *p_selectedSubscriptionContext;
        int v36 = 138412546;
        v37 = v5;
        __int16 v38 = 2112;
        id v39 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Updating selected subscription context to %@ from %@", (uint8_t *)&v36, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_selectedSubscriptionContext, a3);
    selectedSenderIdentity = self->_selectedSenderIdentity;
    self->_selectedSenderIdentity = 0;

    v10 = [*p_selectedSubscriptionContext labelID];
    id v11 = [*p_selectedSubscriptionContext phoneNumber];
    if (!v5) {
      goto LABEL_20;
    }
    id v12 = [(CKRecipientSelectionController *)self conversation];
    id v13 = [v12 selectedLastAddressedHandle];
    if (MEMORY[0x192FBAF60](v13, v11))
    {
      int v14 = [(CKRecipientSelectionController *)self conversation];
      uint64_t v15 = [v14 selectedLastAddressedSIMID];
      char v16 = MEMORY[0x192FBAF60](v15, v10);

      v17 = [(CKRecipientSelectionController *)self conversation];
      [v17 setSelectedLastAddressedHandle:v11];

      uint64_t v18 = [(CKRecipientSelectionController *)self conversation];
      [v18 setSelectedLastAddressedSIMID:v10];

      if (v16)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {

      v19 = [(CKRecipientSelectionController *)self conversation];
      [v19 setSelectedLastAddressedHandle:v11];

      BOOL v20 = [(CKRecipientSelectionController *)self conversation];
      [v20 setSelectedLastAddressedSIMID:v10];
    }
    if ([(CKComposeRecipientSelectionController *)self hasBackfilledConversation]
      && [(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions])
    {
      id v21 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      v22 = [v21 iMessageAccountForLastAddressedHandle:v11 simID:v10];

      if (v22)
      {
        uint64_t v23 = [v22 serviceName];
        int v24 = [v23 isEqualToString:*MEMORY[0x1E4F6E1B0]];

        if (v24)
        {
          v25 = [(CKRecipientSelectionController *)self conversation];
          char v26 = [v25 chat];
          [v26 forceCancelTypingIndicator];
        }
      }
      v27 = [(CKRecipientSelectionController *)self conversation];
      v28 = [v27 chat];
      [v28 setLastAddressedHandleID:v11];

      id v29 = [(CKRecipientSelectionController *)self conversation];
      v30 = [v29 chat];
      [v30 setLastAddressedSIMID:v10];

      BOOL v31 = [(CKRecipientSelectionController *)self conversation];
      [v31 refreshServiceForSending];

      v32 = [(CKRecipientSelectionController *)self conversation];
      long long v33 = [v32 chat];
      long long v34 = [(CTXPCServiceSubscriptionContext *)v5 label];
      [v33 updateLineSwitchedTo:v34];
    }
    long long v35 = [(CKRecipientSelectionController *)self _canonicalRecipientAddresses];
    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v35 withCompletionBlock:0];
    if (![(CKComposeRecipientSelectionController *)self fromFieldIdentityChanged])
    {
      [(CKComposeRecipientSelectionController *)self setFromFieldIdentityChanged:1];
      [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
    }

    goto LABEL_20;
  }
LABEL_21:
}

- (id)_defaultSubscriptionContext
{
  if (![(CKComposeRecipientSelectionController *)self hasiMessageableContext]
    || ([(CKComposeRecipientSelectionController *)self _defaultSubscriptionContextForiMessage], (objc_super v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [MEMORY[0x1E4F6E668] sharedInstance];
    BOOL v5 = [v4 ctSubscriptionInfo];

    objc_super v3 = [v5 preferredOrDefaultSubscriptionContext];
  }

  return v3;
}

- (id)_preferrediMessageAccountName
{
  v2 = [MEMORY[0x1E4F6BDC0] iMessageService];
  objc_super v3 = IMPreferredAccountForService();
  id v4 = [v3 displayName];

  return v4;
}

- (id)_defaultSubscriptionContextForiMessage
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(CKComposeRecipientSelectionController *)self _preferrediMessageAccountName];
  objc_super v3 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v4 = [v3 ctSubscriptionInfo];
  BOOL v5 = objc_msgSend(v4, "__im_subscriptionContextForPhoneNumber:", v2);

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      v9 = v5;
      __int16 v10 = 2112;
      id v11 = v2;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Default subscription context for iMessage is %@ accountDisplayName: %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (BOOL)hasiMessageableContext
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6E668] sharedInstance];
  objc_super v3 = [v2 ctSubscriptionInfo];
  id v4 = [v3 subscriptions];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v10 = objc_msgSend(v9, "phoneNumber", (void)v16);
        id v11 = [v9 labelID];
        if ([MEMORY[0x1E4F6BDC0] iMessageEnabledForSenderLastAddressedHandle:v10 simID:v11])
        {
          if (IMOSLoggingEnabled())
          {
            int v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v21 = v10;
              __int16 v22 = 2112;
              uint64_t v23 = v11;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "At least one subscription is iMessage-capable with phoneNumber: %@ simID: %@", buf, 0x16u);
            }
          }
          BOOL v13 = 1;
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "No subscription is iMessage-capable", buf, 2u);
    }
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (NSString)selectedLastAddressedOrDefaultHandle
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKComposeRecipientSelectionController *)self hasiMessageableContext];
  id v4 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
  if (!v3) {
    goto LABEL_3;
  }
  id v5 = [(CKRecipientSelectionController *)self conversation];
  uint64_t v6 = [v5 sendingService];
  uint64_t v7 = [MEMORY[0x1E4F6BDB8] iMessageService];

  if (v6 == v7)
  {
    int v14 = [(CKComposeRecipientSelectionController *)self _preferrediMessageAccountName];
    if ((IMStringIsEmail() & 1) != 0 || !v4)
    {
      int v8 = v14;
    }
    else
    {
      int v8 = [v4 phoneNumber];
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412546;
          long long v17 = v8;
          __int16 v18 = 2112;
          long long v19 = v14;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Using selected subscription phone number %@ instead of %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
  }
  else
  {
LABEL_3:
    int v8 = 0;
  }
  if (!v8 && v4)
  {
    int v8 = [v4 phoneNumber];
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
      id v11 = (void *)v10;
      uint64_t v12 = @"NO";
      int v16 = 138412802;
      long long v17 = v8;
      __int16 v18 = 2112;
      if (v3) {
        uint64_t v12 = @"YES";
      }
      long long v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "selectedLastAddressedHandle: %@ hasiMessageableContext: %@ selectedSubscriptionContext: %@", (uint8_t *)&v16, 0x20u);
    }
  }

  return (NSString *)v8;
}

- (void)_layoutFromFieldShouldHide:(BOOL)a3
{
  v81[2] = *MEMORY[0x1E4F143B8];
  if (!self->_fromFieldContainerView)
  {
    id v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    fromFieldContainerView = self->_fromFieldContainerView;
    self->_fromFieldContainerView = v5;

    uint64_t v7 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(UIView *)self->_fromFieldContainerView setBackgroundColor:v7];

    int v8 = [(CKComposeRecipientSelectionController *)self view];
    [v8 addSubview:self->_fromFieldContainerView];
  }
  v9 = +[CKUIBehavior sharedBehaviors];
  [v9 toFieldPreferredHeight];
  double v11 = v10;

  uint64_t v12 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v12 origin];
  double v14 = v13;
  uint64_t v15 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v15 origin];
  double v17 = v16;
  __int16 v18 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v18 frame];
  double v20 = v17 + v19;
  uint64_t v21 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v21 frame];
  double v23 = v22;

  int v24 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  objc_msgSend(v24, "setFrame:", v14, v20, v23, v11);

  if (!self->_fromFieldSeparator)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F42FF0]);
    char v26 = [(CKComposeRecipientSelectionController *)self view];
    [v26 frame];
    double v28 = v27;
    if (CKPixelWidth_once_17 != -1) {
      dispatch_once(&CKPixelWidth_once_17, &__block_literal_global_428_0);
    }
    id v29 = (UIView *)objc_msgSend(v25, "initWithFrame:", 0.0, v11, v28, *(double *)&CKPixelWidth_sPixel_17);
    fromFieldSeparator = self->_fromFieldSeparator;
    self->_fromFieldSeparator = v29;

    [(UIView *)self->_fromFieldSeparator setAutoresizingMask:2];
    BOOL v31 = self->_fromFieldSeparator;
    v32 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
    [(UIView *)v31 setBackgroundColor:v32];

    long long v33 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
    [v33 addSubview:self->_fromFieldSeparator];
  }
  if (_layoutFromFieldShouldHide__onceToken != -1) {
    dispatch_once(&_layoutFromFieldShouldHide__onceToken, &__block_literal_global_218);
  }
  if (!self->_fromTextLabel)
  {
    long long v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    fromTextLabel = self->_fromTextLabel;
    self->_fromTextLabel = v34;

    [(UILabel *)self->_fromTextLabel setAttributedText:_layoutFromFieldShouldHide__fromText];
    int v36 = self->_fromTextLabel;
    v37 = [(CKRecipientSelectionController *)self toField];
    __int16 v38 = [v37 baseFont];
    [(UILabel *)v36 setFont:v38];

    [(UILabel *)self->_fromTextLabel sizeToFit];
  }
  if (!self->_subscriptionSelectorButton)
  {
    id v39 = objc_alloc_init(CKComposeSubscriptionSelectorButton);
    subscriptionSelectorButton = self->_subscriptionSelectorButton;
    self->_subscriptionSelectorButton = v39;

    [(CKComposeSubscriptionSelectorButton *)self->_subscriptionSelectorButton setDelegate:self];
    __int16 v41 = self->_subscriptionSelectorButton;
    v42 = [(CKRecipientSelectionController *)self toField];
    __int16 v43 = [v42 baseFont];
    [(CKComposeSubscriptionSelectorButton *)v41 updateTitleFont:v43];
  }
  v44 = [(CKComposeRecipientSelectionController *)self menuForSubscriptionSelector];
  __int16 v45 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
  [v45 setMenu:v44];

  if (!self->_fromFieldContentStackView)
  {
    id v46 = objc_alloc(MEMORY[0x1E4F42E20]);
    __int16 v47 = [(CKComposeRecipientSelectionController *)self fromTextLabel];
    v81[0] = v47;
    v48 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
    v81[1] = v48;
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    v50 = (UIStackView *)[v46 initWithArrangedSubviews:v49];
    fromFieldContentStackView = self->_fromFieldContentStackView;
    self->_fromFieldContentStackView = v50;

    [(UIStackView *)self->_fromFieldContentStackView setAlignment:3];
    [(UIStackView *)self->_fromFieldContentStackView setAxis:0];
    [(UIStackView *)self->_fromFieldContentStackView setDistribution:3];
    -[UIStackView setLayoutMargins:](self->_fromFieldContentStackView, "setLayoutMargins:", 4.0, 0.0, 4.0, 0.0);
    v52 = [(CKComposeRecipientSelectionController *)self fromFieldContentStackView];
    [v52 setLayoutMarginsRelativeArrangement:1];

    v53 = [(CKComposeRecipientSelectionController *)self fromFieldContentStackView];
    [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

    v54 = [(CKComposeRecipientSelectionController *)self fromFieldContentStackView];
    [v54 setUserInteractionEnabled:1];
  }
  v55 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  v56 = [(CKComposeRecipientSelectionController *)self fromFieldContentStackView];
  [v55 addSubview:v56];

  v57 = [(UIStackView *)self->_fromFieldContentStackView topAnchor];
  v58 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  v59 = [v58 topAnchor];
  v60 = [v57 constraintEqualToAnchor:v59];
  BOOL v61 = 1;
  [v60 setActive:1];

  v62 = [(UIStackView *)self->_fromFieldContentStackView bottomAnchor];
  v63 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  v64 = [v63 bottomAnchor];
  v65 = [v62 constraintEqualToAnchor:v64];
  [v65 setActive:1];

  v66 = [(UIStackView *)self->_fromFieldContentStackView leadingAnchor];
  v67 = [(CKRecipientSelectionController *)self toField];
  v68 = [v67 textView];
  v69 = [v68 leadingAnchor];
  v70 = [v66 constraintEqualToAnchor:v69];
  [v70 setActive:1];

  v71 = [(UIStackView *)self->_fromFieldContentStackView centerYAnchor];
  v72 = [(CKComposeRecipientSelectionController *)self fromTextLabel];
  v73 = [v72 centerYAnchor];
  v74 = [v71 constraintEqualToAnchor:v73];
  [v74 setActive:1];

  v75 = [(UIStackView *)self->_fromFieldContentStackView centerYAnchor];
  v76 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
  v77 = [v76 centerYAnchor];
  v78 = [v75 constraintEqualToAnchor:v77];
  [v78 setActive:1];

  if (!a3) {
    BOOL v61 = [(CKComposeRecipientSelectionController *)self _shouldHideFromField];
  }
  v79 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  [v79 setHidden:v61];

  v80 = [(CKRecipientSelectionController *)self delegate];
  [v80 recipientSelectionControllerDidLoadFromField];
}

void __68__CKComposeRecipientSelectionController__layoutFromFieldShouldHide___block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4FB06F8];
  v0 = +[CKUIBehavior sharedBehaviors];
  v1 = [v0 navbarToLabelFont];
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E4FB0700];
  v2 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v11[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v4 = (void *)_layoutFromFieldShouldHide__attributes;
  _layoutFromFieldShouldHide__attributes = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v6 = CKFrameworkBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"FROM" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v8 = [v5 initWithString:v7 attributes:_layoutFromFieldShouldHide__attributes];
  v9 = (void *)_layoutFromFieldShouldHide__fromText;
  _layoutFromFieldShouldHide__fromText = v8;
}

- (double)fromFieldHeight
{
  if ([(CKComposeRecipientSelectionController *)self _shouldHideFromField]) {
    return 0.0;
  }
  uint64_t v3 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  [v3 frame];
  double v5 = v4;

  if (v5 <= 0.0) {
    return 0.0;
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v10 = [(CKComposeRecipientSelectionController *)self traitCollection];
  int v5 = [v10 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v5)
  {
    uint64_t v6 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];

    if (!v6) {
      return;
    }
    uint64_t v7 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
    uint64_t v8 = [v7 contextMenuInteraction];
    [v8 dismissMenu];

    id v10 = [(CKComposeRecipientSelectionController *)self menuForSubscriptionSelector];
    v9 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
    [v9 setMenu:v10];
  }
}

- (id)menuForSubscriptionSelector
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v4 = [v3 ctSubscriptionInfo];
  double v22 = [v4 subscriptions];

  int v5 = v22;
  if ([v22 count])
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v22;
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v10 = CKFrameworkBundle();
          double v11 = [v9 label];
          uint64_t v12 = [v10 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit"];

          id location = 0;
          objc_initWeak(&location, self);
          double v13 = (void *)MEMORY[0x1E4F426E8];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __68__CKComposeRecipientSelectionController_menuForSubscriptionSelector__block_invoke;
          v25[3] = &unk_1E5621240;
          v25[4] = v9;
          v25[5] = self;
          objc_copyWeak(&v26, &location);
          double v14 = [v13 actionWithTitle:v12 image:0 identifier:0 handler:v25];
          uint64_t v15 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
          objc_msgSend(v14, "setState:", objc_msgSend(v15, "isEqual:", v9));

          double v16 = CKLocalizedShortNameForContext(v9);
          double v17 = objc_msgSend(MEMORY[0x1E4F42A80], "__ck_actionImageForSubscriptionShortName:isFilled:", v16, 0);
          [v14 setImage:v17];

          [v24 addObject:v14];
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v6);
    }

    __int16 v18 = (void *)MEMORY[0x1E4F42B80];
    double v19 = (void *)[v24 copy];
    double v20 = [v18 menuWithChildren:v19];

    int v5 = v22;
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

void __68__CKComposeRecipientSelectionController_menuForSubscriptionSelector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) selectedSubscriptionContext];
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", (uint8_t *)&v9, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedSubscriptionContext:*(void *)(a1 + 32)];

  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  [v8 setHasUserSetContextPreference:1];
}

- (void)CKComposeSubscriptionSelectorButtonWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6E668] sharedInstance];
  uint64_t v6 = [v5 ctSubscriptionInfo];
  uint64_t v7 = [v6 subscriptions];

  if (![v7 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "No subscription info found, hiding container view", v10, 2u);
      }
    }
    int v9 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
    [v9 setHidden:1];

    [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:0];
  }
}

- (void)_lastAddressedHandleChangedNotification:(id)a3
{
  if ([(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions])
  {
    [(CKComposeRecipientSelectionController *)self setFromFieldIdentityChanged:1];
    [(CKComposeRecipientSelectionController *)self _updateContentsOfFromField];
  }
}

- (void)_updateFromFieldIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
  BOOL v4 = [(CKComposeRecipientSelectionController *)self _shouldHideFromField];
  uint64_t v5 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
  if ([v5 isHidden] ^ 1 | v4)
  {
    uint64_t v6 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
    int v7 = v4 & ~[v6 isHidden];
  }
  else
  {
    int v7 = 1;
  }

  id v8 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
  uint64_t v9 = [v8 theme];
  unint64_t v10 = [(CKComposeRecipientSelectionController *)self _fromFieldThemeForCurrentService];

  if ((([(CKComposeRecipientSelectionController *)self fromFieldIdentityChanged] | v7) & 1) != 0
    || v9 != v10)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = @"NO";
        if (v4) {
          uint64_t v12 = @"YES";
        }
        int v16 = 138412546;
        double v17 = v12;
        __int16 v18 = 2112;
        double v19 = v3;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Updating From field - hideFromField %@ selectedSubscriptionContext %@", (uint8_t *)&v16, 0x16u);
      }
    }
    if (v4)
    {
      uint64_t v13 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
      double v14 = [v13 contextMenuInteraction];
      [v14 dismissMenu];
    }
    else
    {
      [(CKComposeRecipientSelectionController *)self _updateContentsOfFromField];
    }
    uint64_t v15 = [(CKComposeRecipientSelectionController *)self fromFieldContainerView];
    [v15 setHidden:v4];

    [(CKComposeRecipientSelectionController *)self setFromFieldIdentityChanged:0];
  }
}

- (id)recipients
{
  v2 = [(CKRecipientSelectionController *)self toField];
  id v3 = [v2 recipients];

  return v3;
}

- (BOOL)hasBackfilledConversation
{
  v2 = [(CKRecipientSelectionController *)self conversation];
  id v3 = [v2 groupID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_shouldHideFromField
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKComposeRecipientSelectionController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  unint64_t v6 = [v5 interfaceOrientation] - 3;

  if (v6 >= 2)
  {
    id v8 = [(CKComposeRecipientSelectionController *)self selectedSenderIdentity];
    uint64_t v9 = [(CKComposeRecipientSelectionController *)self recipients];
    uint64_t v10 = [v9 count];

    BOOL v11 = [(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions];
    BOOL v12 = [(CKComposeRecipientSelectionController *)self hasBackfilledConversation];
    int v13 = !v11;
    if (!v8) {
      int v13 = 1;
    }
    if (v10) {
      BOOL v7 = v13;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      BOOL v14 = v12;
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = @"NO";
          int v19 = 138413058;
          if (v11) {
            double v17 = @"YES";
          }
          else {
            double v17 = @"NO";
          }
          uint64_t v20 = v17;
          __int16 v21 = 2112;
          double v22 = v8;
          if (v14) {
            int v16 = @"YES";
          }
          __int16 v23 = 2112;
          id v24 = v16;
          __int16 v25 = 2048;
          uint64_t v26 = v10;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Should hide fromField, hasMultipleActiveSubscriptions = %@, senderIdentity = %@, hasBackfilledConversation = %@, recipientCount = %lu", (uint8_t *)&v19, 0x2Au);
        }
      }
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_updateContentsOfFromField
{
  id v7 = [(CKComposeRecipientSelectionController *)self subscriptionSelectorButton];
  id v3 = [(CKComposeRecipientSelectionController *)self selectedSenderIdentity];
  if (v7 && v3)
  {
    BOOL v4 = [v3 localizedName];
    uint64_t v5 = [v3 localizedShortName];
    objc_msgSend(v7, "updateContentsWithTitle:badgeText:theme:", v4, v5, -[CKComposeRecipientSelectionController _fromFieldThemeForCurrentService](self, "_fromFieldThemeForCurrentService"));

    unint64_t v6 = [(CKComposeRecipientSelectionController *)self menuForSubscriptionSelector];
    [v7 setMenu:v6];
  }
}

- (BOOL)_isOniMessageService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 labelID];
  BOOL v4 = [MEMORY[0x1E4F6E668] sharedInstance];
  uint64_t v5 = [v4 registeredSIMIDs];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= objc_msgSend(v3, "isEqualToString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (unint64_t)_fromFieldThemeForCurrentService
{
  v2 = [(CKRecipientSelectionController *)self conversation];
  id v3 = [v2 sendingService];
  BOOL v4 = [MEMORY[0x1E4F6BDB8] iMessageService];

  if (v3 == v4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (NSArray)expandedRecipients
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(CKRecipientSelectionController *)self toField];
  uint64_t v5 = [v4 recipients];
  id v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(CKRecipientSelectionController *)self toField];
  uint64_t v8 = [v7 recipients];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 isGroup])
        {
          long long v14 = [v13 children];
          [v6 addObjectsFromArray:v14];
        }
        else
        {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return (NSArray *)v6;
}

- (NSArray)proposedRecipients
{
  id v3 = [(CKComposeRecipientSelectionController *)self recipients];
  if (!v3)
  {
    BOOL v4 = [(CKRecipientSelectionController *)self toField];
    uint64_t v5 = [v4 text];

    if ([v5 length])
    {
      id v6 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v7 = +[CKRecipientGenerator sharedRecipientGenerator];
      uint64_t v8 = [v7 recipientWithAddress:v5];
      id v3 = [v6 arrayWithObject:v8];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSArray *)v3;
}

- (void)_atomizeToConversationNameIfNecessary:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CKComposeRecipientSelectionController *)self shouldAtomizeToConversationName];
  if (a3 && v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [(CKRecipientSelectionController *)self toField];
    uint64_t v7 = [v6 recipients];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if ([(CKRecipientSelectionController *)self _recipientIsGroup:v12])
          {
            long long v13 = [(CKRecipientSelectionController *)self toField];
            [v13 removeRecipient:v12];

            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v14 = [(CKRecipientSelectionController *)self _expandedRecipientsForGroupRecipient:v12];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v23;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v23 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
                  uint64_t v20 = [(CKRecipientSelectionController *)self toField];
                  [v20 addRecipient:v19];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v16);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }
  }
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  if ([(CKComposeRecipientSelectionController *)self deviceHasMultipleSubscriptions])
  {
    if ([(CKComposeRecipientSelectionController *)self _hasExistingConversationWithAddedRecipient:v4])
    {
      v31.receiver = self;
      v31.super_class = (Class)CKComposeRecipientSelectionController;
      [(CKRecipientSelectionController *)&v31 addRecipient:v4];
    }
    else
    {
      uint64_t v19 = [(CKComposeRecipientSelectionController *)self _bestSenderIdentityForRecipient:v4];
      BOOL v5 = [(CKRecipientSelectionController *)self toField];
      id v6 = [v5 recipients];
      uint64_t v7 = [v6 count];

      uint64_t v8 = [(CKRecipientSelectionController *)self conversation];
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__61;
      v29[4] = __Block_byref_object_dispose__61;
      id v30 = 0;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v10 = [v4 IDSCanonicalAddress];
      if (v10) {
        [v9 addObject:v10];
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__CKComposeRecipientSelectionController_addRecipient___block_invoke;
      v25[3] = &unk_1E562B008;
      BOOL v28 = v7 == 0;
      long long v27 = v29;
      v25[4] = self;
      id v11 = v4;
      id v26 = v11;
      [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v9 withCompletionBlock:v25];
      if (v7)
      {
        uint64_t v12 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];

        if (!v12 && v8)
        {
          long long v13 = [v8 lastAddressedSIMID];
          long long v14 = [v8 lastAddressedHandle];
          uint64_t v15 = [(CKComposeRecipientSelectionController *)self _subscriptionContextForSimID:v13 phoneNumber:v14];
          [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v15];
        }
        [(CKComposeRecipientSelectionController *)self _atomizeToConversationNameIfNecessary:v7];
        uint64_t v16 = [(CKComposeRecipientSelectionController *)self presentedViewController];

        if (v16)
        {
          [(CKComposeRecipientSelectionController *)self setFirstAppear:1];
          v23.receiver = self;
          v23.super_class = (Class)CKComposeRecipientSelectionController;
          [(CKRecipientSelectionController *)&v23 addRecipient:v11];
          [(CKComposeRecipientSelectionController *)self performSelector:sel_presentAlertForSubscriptionContext withObject:0 afterDelay:0.5];
        }
        else
        {
          uint64_t v17 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
          long long v18 = (void *)v17;
          if (!v19
            || v17
            && [MEMORY[0x1E4F6E958] isTUSenderIdentity:v19 equalToSubscriptionContext:v17])
          {
            v22.receiver = self;
            v22.super_class = (Class)CKComposeRecipientSelectionController;
            [(CKRecipientSelectionController *)&v22 addRecipient:v11];
          }
          else
          {
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __54__CKComposeRecipientSelectionController_addRecipient___block_invoke_2;
            v20[3] = &unk_1E562B030;
            v20[4] = self;
            id v21 = v11;
            [(CKComposeRecipientSelectionController *)self presentContextSelectionAlertWithCompletion:v20];
          }
        }
      }
      else
      {
        v24.receiver = self;
        v24.super_class = (Class)CKComposeRecipientSelectionController;
        [(CKRecipientSelectionController *)&v24 addRecipient:v11];
      }

      _Block_object_dispose(v29, 8);
    }
  }
  else
  {
    [(CKComposeRecipientSelectionController *)self _legacyAddRecipient:v4];
  }
}

void __54__CKComposeRecipientSelectionController_addRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) _updateSubscriptionContextForRecipient:*(void *)(a1 + 40) preferredService:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  [*(id *)(a1 + 32) _updateFromFieldIfNeeded];
}

void __54__CKComposeRecipientSelectionController_addRecipient___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [*(id *)(a1 + 32) selectedSubscriptionContext];
          *(_DWORD *)buf = 138412546;
          id v13 = v5;
          __int16 v14 = 2112;
          uint64_t v15 = v8;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Selected new subscription info is now %@ from %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 32) setSelectedSubscriptionContext:v5];
      [*(id *)(a1 + 32) setHasUserSetContextPreference:1];
    }
    else
    {
      if (v6)
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "No subscription info found", buf, 2u);
        }
      }
      [*(id *)(a1 + 32) setSelectedSubscriptionContext:0];
    }
    uint64_t v10 = *(void *)(a1 + 40);
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)CKComposeRecipientSelectionController;
    objc_msgSendSuper2(&v11, sel_addRecipient_, v10);
  }
}

- (void)_updateSubscriptionContextForRecipient:(id)a3 preferredService:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F6E6D8];
  uint64_t v8 = [v17 contact];
  LODWORD(v7) = [v7 isCNContactAKnownContact:v8];

  if (v7)
  {
    uint64_t v9 = [(CKComposeRecipientSelectionController *)self _contactPreferredSenderIdentityForRecipient:v17];
    uint64_t v10 = [MEMORY[0x1E4F6E668] sharedInstance];
    objc_super v11 = [v10 ctSubscriptionInfo];
    uint64_t v12 = objc_msgSend(v11, "__im_subscriptionContextForSenderIdentity:", v9);

    if (v9)
    {
      [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v12];
      [(CKComposeRecipientSelectionController *)self setContactPreferredContextSelected:1];
LABEL_8:

      goto LABEL_9;
    }
    if (![(CKComposeRecipientSelectionController *)self hasiMessageableContext]) {
      goto LABEL_8;
    }
    id v16 = [MEMORY[0x1E4F6BDC0] iMessageService];

    if (v16 != v6) {
      goto LABEL_8;
    }
    __int16 v14 = [(CKComposeRecipientSelectionController *)self _defaultSubscriptionContextForiMessage];
    [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v14];
LABEL_7:

    goto LABEL_8;
  }
  if (![(CKComposeRecipientSelectionController *)self hasiMessageableContext]
    || ([MEMORY[0x1E4F6BDC0] iMessageService],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 != v6))
  {
    uint64_t v9 = [(CKComposeRecipientSelectionController *)self _bestSenderIdentityForRecipient:v17];
    uint64_t v12 = [MEMORY[0x1E4F6E668] sharedInstance];
    __int16 v14 = [v12 ctSubscriptionInfo];
    uint64_t v15 = objc_msgSend(v14, "__im_subscriptionContextForSenderIdentity:", v9);
    [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v15];

    goto LABEL_7;
  }
  uint64_t v9 = [(CKComposeRecipientSelectionController *)self _defaultSubscriptionContextForiMessage];
  [(CKComposeRecipientSelectionController *)self setSelectedSubscriptionContext:v9];
LABEL_9:
}

- (id)_subscriptionContextForSimID:(id)a3 phoneNumber:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F6E668];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedInstance];
  uint64_t v9 = [v8 ctSubscriptionInfo];
  uint64_t v10 = objc_msgSend(v9, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v6);

  return v10;
}

- (void)_legacyAddRecipient:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKComposeRecipientSelectionController *)self shouldAtomizeToConversationName])
  {
    id v5 = [(CKRecipientSelectionController *)self toField];
    id v6 = [v5 recipients];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v23 = v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = [(CKRecipientSelectionController *)self toField];
      uint64_t v9 = [v8 recipients];

      id obj = v9;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            if ([(CKRecipientSelectionController *)self _recipientIsGroup:v14])
            {
              uint64_t v15 = [(CKRecipientSelectionController *)self toField];
              [v15 removeRecipient:v14];

              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              id v16 = [(CKRecipientSelectionController *)self _expandedRecipientsForGroupRecipient:v14];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v27;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v27 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                    objc_super v22 = [(CKRecipientSelectionController *)self toField];
                    [v22 addRecipient:v21];
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
                }
                while (v18);
              }
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v11);
      }

      id v4 = v23;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v25 addRecipient:v4];
}

- (void)atomizeAndInvokeBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = [(CKRecipientSelectionController *)self toField];
  int v6 = [v5 finishEnteringRecipient];

  uint64_t v7 = [(CKRecipientSelectionController *)self toField];
  uint64_t v8 = [v7 recipients];
  if ([v8 count] == 1)
  {
    uint64_t v9 = [(CKRecipientSelectionController *)self toField];
    uint64_t v10 = [v9 recipients];
    uint64_t v11 = [v10 firstObject];
    int v12 = [v11 isGroup];
  }
  else
  {
    int v12 = 0;
  }

  int v13 = [(CKComposeRecipientSelectionController *)self homogenizePreferredServiceForiMessage] | v12;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v33 = v13 ^ 1;
      __int16 v34 = 1024;
      int v35 = v6;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Calling atomizeAndInvokeBlock with deferSend = %d, addedRecipient = %d", buf, 0xEu);
    }
  }
  int v15 = IMOSLoggingEnabled();
  if ((v13 & v6) != 0)
  {
    if (v15)
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Added recipient and send not deferred", buf, 2u);
      }
    }
    uint64_t v17 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (![(CKRecipientSelectionController *)self isGameCenterRecipient:v23])
          {
            objc_super v24 = [v23 IDSCanonicalAddress];
            if (v24) {
              [v18 addObject:v24];
            }
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__CKComposeRecipientSelectionController_atomizeAndInvokeBlock___block_invoke;
    v26[3] = &unk_1E562B058;
    v26[4] = self;
    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v18 withCompletionBlock:v26];
    [(CKComposeRecipientSelectionController *)self setSendBlock:v4];
    [(CKComposeRecipientSelectionController *)self performSelector:sel_atomizeAndSendTimeoutHandler withObject:0 afterDelay:0.5];
  }
  else
  {
    if (v15)
    {
      objc_super v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Perform block.", buf, 2u);
      }
    }
    v4[2](v4);
  }
}

uint64_t __63__CKComposeRecipientSelectionController_atomizeAndInvokeBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(result + 32) selector:sel_atomizeAndSendTimeoutHandler object:0];
    id v5 = *(void **)(v4 + 32);
    return [v5 atomizeAndSendTimeoutHandler];
  }
  return result;
}

- (void)atomizeAndSendTimeoutHandler
{
  id v3 = [(CKComposeRecipientSelectionController *)self sendBlock];

  if (v3)
  {
    uint64_t v4 = [(CKComposeRecipientSelectionController *)self sendBlock];
    v4[2]();

    [(CKComposeRecipientSelectionController *)self setSendBlock:0];
  }
}

- (id)_bestSenderIdentityForRecipient:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E6D8];
  id v4 = a3;
  id v5 = [v3 keysForCNContact];
  int v6 = [v4 contactWithKeysToFetch:v5];

  uint64_t v7 = [MEMORY[0x1E4F6E958] sharedInstance];
  uint64_t v8 = [v4 normalizedAddress];

  uint64_t v9 = [v7 bestSenderIdentityForHandleID:v8 contact:v6];

  return v9;
}

- (id)_contactPreferredSenderIdentityForRecipient:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E6D8];
  id v4 = a3;
  id v5 = [v3 keysForCNContact];
  int v6 = [v4 contactWithKeysToFetch:v5];

  uint64_t v7 = [MEMORY[0x1E4F6E958] sharedInstance];
  uint64_t v8 = [v4 normalizedAddress];

  uint64_t v9 = [v7 contactPreferredSenderIdentityForHandleID:v8 contact:v6];

  return v9;
}

- (void)presentContextSelectionAlertWithCompletion:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v5 = [v4 ctSubscriptionInfo];
  int v6 = [v5 subscriptions];

  if (IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive())
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42728];
    uint64_t v8 = CKFrameworkBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"COMPOSE_TO_MULTIPLE_RECIPIENTS_DIFFERENT_SENDER_IDENTITIES_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v37 = [v7 alertControllerWithTitle:v9 message:0 preferredStyle:0];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v35 = v6;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = v3;
          int v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          BOOL v16 = [(CKComposeRecipientSelectionController *)self _isOniMessageService:v15];
          uint64_t v17 = NSString;
          uint64_t v18 = CKFrameworkBundle();
          id v19 = v18;
          if (v16) {
            uint64_t v20 = @"COMPOSE_TO_MULTIPLE_RECIPIENTS_SELECT_SENDER_IDENTITY_%@";
          }
          else {
            uint64_t v20 = @"COMPOSE_TO_MULTIPLE_RECIPIENTS_SELECT_SENDER_IDENTITY_TEXT_MESSAGE_%@";
          }
          uint64_t v21 = [v18 localizedStringForKey:v20 value:&stru_1EDE4CA38 table:@"ChatKit"];
          objc_super v22 = [v15 label];
          id v23 = objc_msgSend(v17, "stringWithFormat:", v21, v22);

          objc_super v24 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v25 = [v24 userInterfaceLayoutDirection];

          if (v25 == 1) {
            long long v26 = @"\u200F";
          }
          else {
            long long v26 = @"\u200E";
          }
          long long v27 = [(__CFString *)v26 stringByAppendingString:v23];
          id v3 = v14;

          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke;
          aBlock[3] = &unk_1E5628118;
          id v28 = v14;
          aBlock[4] = v15;
          id v42 = v28;
          long long v29 = _Block_copy(aBlock);
          long long v30 = [MEMORY[0x1E4F42720] actionWithTitle:v27 style:0 handler:v29];
          [v37 addAction:v30];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);
    }

    long long v31 = (void *)MEMORY[0x1E4F42720];
    long long v32 = CKFrameworkBundle();
    int v33 = [v32 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke_2;
    v39[3] = &unk_1E5621380;
    id v40 = v3;
    __int16 v34 = [v31 actionWithTitle:v33 style:1 handler:v39];

    [v37 addAction:v34];
    [(CKComposeRecipientSelectionController *)self presentViewController:v37 animated:1 completion:0];

    int v6 = v35;
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
  }
}

uint64_t __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

uint64_t __84__CKComposeRecipientSelectionController_presentContextSelectionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reset
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "resetting", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v5 reset];
  id v4 = +[CKConversation newPendingConversation];
  [(CKRecipientSelectionController *)self setConversation:v4];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_atomizeAndInvokeTimeoutHandler object:0];
  [(CKComposeRecipientSelectionController *)self setSendBlock:0];
}

- (void)recipientSelectionControllerDidChange
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "recipientSelectionControllerDidChange", buf, 2u);
    }
  }
  [(CKComposeRecipientSelectionController *)self _updateBackfillForNewRecipients];
  [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)CKComposeRecipientSelectionController;
  [(CKRecipientSelectionController *)&v4 recipientSelectionControllerDidChange];
}

- (BOOL)shouldAtomizeToConversationName
{
  return 1;
}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return [MEMORY[0x1E4F6BDC0] smsEnabled];
}

- (BOOL)shouldSuppressSearchResultsTable
{
  v2 = [(CKRecipientSelectionController *)self toField];
  id v3 = [v2 text];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)alwaysShowSearchResultsTable
{
  return 0;
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return 0;
}

- (void)conversationPreferredServiceDidChange
{
  if ([(CKComposeRecipientSelectionController *)self hasMultipleActiveSharedSubscriptions])
  {
    [(CKComposeRecipientSelectionController *)self setFromFieldIdentityChanged:1];
    [(CKComposeRecipientSelectionController *)self _updateFromFieldIfNeeded];
  }
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (BOOL)_hasExistingConversationWithAddedRecipient:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
  [v5 startTimingForKey:@"_hasExistingConversationWithAddedRecipient"];

  if (CKIsRunningInMessagesViewService()) {
    BOOL v6 = !CKIsScreenLocked();
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = 0;
  if (v4 && v6)
  {
    uint64_t v8 = [(CKRecipientSelectionController *)self toField];
    uint64_t v9 = [v8 recipients];
    uint64_t v10 = [v9 arrayByAddingObject:v4];

    if ([v10 count] == 1
      && ([v10 firstObject],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          BOOL v12 = [(CKRecipientSelectionController *)self _recipientIsGroup:v11],
          v11,
          v12))
    {
      BOOL v7 = 1;
    }
    else
    {
      int v13 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
      uint64_t v14 = [v13 arrayByAddingObject:v4];

      int v15 = [(CKComposeRecipientSelectionController *)self _handlesForRecipients:v14];
      BOOL v16 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      uint64_t v17 = [v16 existingChatWithHandles:v15 allowAlternativeService:1 groupID:0 displayName:0 joinedChatsOnly:1];

      uint64_t v18 = [(CKComposeRecipientSelectionController *)self conversationList];
      id v19 = [v18 conversationForExistingChat:v17];

      BOOL v7 = v19 != 0;
      uint64_t v10 = (void *)v14;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
  [v20 stopTimingForKey:@"_hasExistingConversationWithAddedRecipient"];

  return v7;
}

- (BOOL)shouldInvalidateIDSRequests
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CKRecipientSelectionController *)self toField];
  id v3 = [v2 recipients];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) address];

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (id)autocompleteResultIdentifier:(id)a3
{
  id v3 = [a3 autocompleteResult];
  uint64_t v4 = [v3 identifier];

  return v4;
}

- (id)conversationGUIDForRecipient:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 conversationGUID];
LABEL_5:
    uint64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isGroup])
  {
    uint64_t v5 = [(CKComposeRecipientSelectionController *)self autocompleteResultIdentifier:v4];
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (id)_pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CKIsRunningInMessagesViewService() && CKIsScreenLocked())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Not looking up conversations for backfill while device is passcode locked", (uint8_t *)&v21, 2u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  uint64_t v6 = [(CKRecipientSelectionController *)self toField];
  BOOL v7 = [v6 recipients];
  uint64_t v8 = [v7 count];

  if (!v4 && !v8)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Conversation look up will fail with no recipients and no conversation guid. Early returning.", (uint8_t *)&v21, 2u);
      }
      goto LABEL_12;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_24;
  }
  if (!v4
    || ([(CKComposeRecipientSelectionController *)self conversationList],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 conversationForExistingChatWithGUID:v4],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    long long v12 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
    long long v13 = [(CKComposeRecipientSelectionController *)self _handlesForRecipients:v12];
    if (CKHasBlackholeEnabledOrHasBlackholeChats())
    {
      long long v14 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      id v15 = (id)[v14 unblackholeAndLoadChatWithIMHandles:v13];
    }
    uint64_t v16 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v17 = [v16 existingChatWithHandles:v13 allowAlternativeService:1 groupID:0 displayName:0 joinedChatsOnly:1 findMatchingNamedGroups:0];

    uint64_t v18 = [(CKComposeRecipientSelectionController *)self conversationList];
    long long v11 = [v18 conversationForExistingChat:v17];

    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412802;
        id v22 = v4;
        __int16 v23 = 2112;
        objc_super v24 = v11;
        __int16 v25 = 2112;
        long long v26 = v13;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Unable to find conversation for existing chat with GUID: %@. Using recipient lookup fallback and found conversation: %@ (handles: %@)", (uint8_t *)&v21, 0x20u);
      }
    }
  }
  [(CKComposeRecipientSelectionController *)self _recoverConversationIfJunk:v11];
  BOOL v9 = (void *)[v11 copyForPendingConversation];

LABEL_24:

  return v9;
}

- (BOOL)_updateBackfillForNewRecipients
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
  [v3 startTimingForKey:@"_updateBackfillForNewRecipients"];

  id v4 = [(CKRecipientSelectionController *)self toField];
  [v4 clearText];

  uint64_t v5 = [(CKRecipientSelectionController *)self searchListController];
  [v5 cancelSearch];

  uint64_t v6 = [(CKRecipientSelectionController *)self searchListController];
  BOOL v7 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
  [v6 setEnteredRecipients:v7];

  uint64_t v8 = [(CKRecipientSelectionController *)self searchListController];
  BOOL v9 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
  objc_msgSend(v8, "setSuppressGroupSuggestions:", objc_msgSend(v9, "count") != 0);

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v10 = [(CKRecipientSelectionController *)self toField];
  long long v11 = [v10 recipients];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v65;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v65 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = [(CKComposeRecipientSelectionController *)self conversationGUIDForRecipient:*(void *)(*((void *)&v64 + 1) + 8 * v14)];
      if (v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v15 = 0;
  }
  uint64_t v57 = v15;

  v59 = [(CKComposeRecipientSelectionController *)self _pendingConversationForExistingChatWithGUIDUsingRecipientLookupFallback:v57];
  if (v59)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v59 chat];
        uint64_t v18 = [v17 guid];
        *(_DWORD *)buf = 138412546;
        v70 = v18;
        __int16 v71 = 2112;
        uint64_t v72 = v57;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Found backfill conversation %@ for conversationGUID: %@", buf, 0x16u);
      }
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v19 = [(CKComposeRecipientSelectionController *)self recipients];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v19);
          }
          __int16 v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          objc_super v24 = [(CKRecipientSelectionController *)self toField];
          __int16 v25 = [v24 atomViewForRecipient:v23];

          if (v25 && [v25 presentationOptions] == 4)
          {
            if (IMOSLoggingEnabled())
            {
              long long v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v70 = v23;
                _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "invalidating previously set pending presentation option for recipient: %@)", buf, 0xCu);
              }
            }
            uint64_t v27 = [(CKRecipientSelectionController *)self toField];
            [v27 invalidateAtomPresentationOptionsForRecipient:v23];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v20);
    }
    id v28 = v59;
  }
  else
  {
    id v28 = +[CKConversation newPendingConversation];
    id v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(CKComposeRecipientSelectionController *)v57 _updateBackfillForNewRecipients];
    }
  }

  if ([(CKComposeRecipientSelectionController *)self deviceHasMultipleSubscriptions])
  {
    long long v29 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
    long long v30 = [v29 phoneNumber];
    long long v31 = IMChatCanonicalIDSIDsForAddress();

    long long v32 = [(CKComposeRecipientSelectionController *)self selectedSubscriptionContext];
    int v33 = [v32 labelID];

    [v28 setSelectedLastAddressedHandle:v31];
    [v28 setSelectedLastAddressedSIMID:v33];
    if (IMOSLoggingEnabled())
    {
      __int16 v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v70 = v31;
        __int16 v71 = 2112;
        uint64_t v72 = (uint64_t)v33;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Update backfill for new recipients selectedLastAddressedHandle: %@ selectedLastAddressedSIMD: %@", buf, 0x16u);
      }
    }
  }
  int v35 = [(CKRecipientSelectionController *)self conversation];
  uint64_t v36 = [v35 sendingService];
  [v28 setPreviousSendingService:v36];

  objc_msgSend(v28, "setForceMMS:", -[CKRecipientSelectionController forceMMS](self, "forceMMS"));
  v37 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
  [v28 setPendingComposeRecipients:v37];

  __int16 v38 = [(CKComposeRecipientSelectionController *)self expandedRecipients];
  if ([v38 count] == 1)
  {
    id v39 = [v38 objectAtIndex:0];
    BOOL v40 = [(CKComposeRecipientSelectionController *)self recipientIsiMessagable:v39];
  }
  else
  {
    BOOL v40 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      id v42 = [v28 chat];
      long long v43 = [v42 guid];
      long long v44 = [v28 recipients];
      uint64_t v45 = [v44 count];
      *(_DWORD *)buf = 138412546;
      v70 = v43;
      __int16 v71 = 2048;
      uint64_t v72 = v45;
      _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Selecting conversation guid={%@} recipientCount={%lu} after backfill attempt.", buf, 0x16u);
    }
  }
  long long v46 = [(CKRecipientSelectionController *)self delegate];
  [v46 recipientSelectionController:self didSelectConversation:v28 isiMessagable:v40];

  if ([(CKComposeRecipientSelectionController *)self shouldInvalidateIDSRequests])
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "Invalidate IDS results since we have resolved all the requests for recipients in to field.", buf, 2u);
      }
    }
    [(CKRecipientSelectionController *)self invalidateOutstandingIDStatusRequests];
  }
  [(CKRecipientSelectionController *)self setConversation:v28];
  if (![(CKComposeRecipientSelectionController *)self contactPreferredContextSelected])goto LABEL_53; {
  uint64_t v48 = [(CKRecipientSelectionController *)self conversation];
  }
  uint64_t v49 = [v48 sendingService];
  v50 = [MEMORY[0x1E4F6BDC0] smsService];
  BOOL v51 = v49 == v50;

  if (!v51)
  {
LABEL_53:
    v52 = [(CKRecipientSelectionController *)self conversation];
    v53 = [v52 handles];
    v54 = objc_msgSend(v53, "__imArrayByApplyingBlock:", &__block_literal_global_220_1);

    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v54 withCompletionBlock:0];
  }
  v55 = [MEMORY[0x1E4F6C3F8] globalTimingCollectionForKey:@"CKBackfillTimingKey"];
  [v55 stopTimingForKey:@"_updateBackfillForNewRecipients"];

  [MEMORY[0x1E4F6C3F8] logTimingCollectionForKey:@"CKBackfillTimingKey"];
  [MEMORY[0x1E4F6C3F8] invalidateGlobalTimingCollectionForKey:@"CKBackfillTimingKey"];

  return v59 != 0;
}

id __72__CKComposeRecipientSelectionController__updateBackfillForNewRecipients__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 ID];
  id v3 = IMChatCanonicalIDSIDsForAddress();

  return v3;
}

- (void)_recoverConversationIfJunk:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 chat];
  if ([v4 isFiltered] != 2) {
    goto LABEL_4;
  }
  int v5 = IMIsOscarEnabled();

  if (v5)
  {
    id v4 = +[CKConversationList sharedConversationList];
    v7[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 recoverJunkMessagesInConversations:v6];

LABEL_4:
  }
}

- (BOOL)recipientIsiMessagable:(id)a3
{
  id v4 = a3;
  int v5 = [v4 normalizedAddress];
  uint64_t v6 = [v4 IDSCanonicalAddressForAddress:v5];

  BOOL v7 = [(CKRecipientSelectionController *)self searchListController];
  uint64_t v8 = [v7 idsStatusForAddress:v6];

  return v8 == 1;
}

- (id)_handlesForRecipients:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (CKIsRunningUITests())
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v34 + 1) + 8 * i) rawAddress];
          if ([v12 _appearsToBePhoneNumber])
          {
            uint64_t v13 = IMInternationalForPhoneNumberWithOptions();

            uint64_t v12 = (void *)v13;
          }
          uint64_t v14 = IMStripFormattingFromAddress();
          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    uint64_t v16 = objc_msgSend(v15, "__ck_bestAccountForAddresses:", v6);
  }
  else
  {
    uint64_t v17 = [(CKRecipientSelectionController *)self conversation];
    uint64_t v6 = [v17 sendingService];

    uint64_t v15 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    uint64_t v16 = objc_msgSend(v15, "__ck_defaultAccountForService:", v6);
  }
  uint64_t v18 = (void *)v16;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_super v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if (!-[CKRecipientSelectionController isGameCenterRecipient:](self, "isGameCenterRecipient:", v24, (void)v30))
        {
          __int16 v25 = [v24 rawAddress];
          long long v26 = IMStripFormattingFromAddress();

          if (v26)
          {
            uint64_t v27 = [v18 imHandleWithID:v26 alreadyCanonical:0];
            if (v27) {
              [v5 addObject:v27];
            }
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  id v28 = (void *)[v5 copy];

  return v28;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self delegate];
  [v4 recipientSelectionControllerReturnPressed:self];

  return 0;
}

- (UIView)fromFieldContainerView
{
  return self->_fromFieldContainerView;
}

- (void)setFromFieldContainerView:(id)a3
{
}

- (NSString)simID
{
  return self->_simID;
}

- (void)setSimID:(id)a3
{
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void)setSendBlock:(id)a3
{
}

- (UIView)fromFieldSeparator
{
  return self->_fromFieldSeparator;
}

- (void)setFromFieldSeparator:(id)a3
{
}

- (UILabel)fromTextLabel
{
  return self->_fromTextLabel;
}

- (void)setFromTextLabel:(id)a3
{
}

- (CKComposeSubscriptionSelectorButton)subscriptionSelectorButton
{
  return self->_subscriptionSelectorButton;
}

- (void)setSubscriptionSelectorButton:(id)a3
{
}

- (UIStackView)fromFieldContentStackView
{
  return self->_fromFieldContentStackView;
}

- (void)setFromFieldContentStackView:(id)a3
{
}

- (BOOL)fromFieldIdentityChanged
{
  return self->_fromFieldIdentityChanged;
}

- (void)setFromFieldIdentityChanged:(BOOL)a3
{
  self->_fromFieldIdentityChanged = a3;
}

- (BOOL)hasUserSetContextPreference
{
  return self->_hasUserSetContextPreference;
}

- (void)setHasUserSetContextPreference:(BOOL)a3
{
  self->_hasUserSetContextPreference = a3;
}

- (BOOL)isFirstAppear
{
  return self->_firstAppear;
}

- (void)setFirstAppear:(BOOL)a3
{
  self->_firstAppear = a3;
}

- (BOOL)contactPreferredContextSelected
{
  return self->_contactPreferredContextSelected;
}

- (void)setContactPreferredContextSelected:(BOOL)a3
{
  self->_contactPreferredContextSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromFieldContentStackView, 0);
  objc_storeStrong((id *)&self->_subscriptionSelectorButton, 0);
  objc_storeStrong((id *)&self->_fromTextLabel, 0);
  objc_storeStrong((id *)&self->_fromFieldSeparator, 0);
  objc_storeStrong(&self->_sendBlock, 0);
  objc_storeStrong((id *)&self->_simID, 0);
  objc_storeStrong((id *)&self->_fromFieldContainerView, 0);
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);

  objc_storeStrong((id *)&self->_selectedSubscriptionContext, 0);
}

- (void)_updateBackfillForNewRecipients
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to find a conversation to backfill for conversationGUID: %@. Making empty new compose conversation", (uint8_t *)&v2, 0xCu);
}

@end