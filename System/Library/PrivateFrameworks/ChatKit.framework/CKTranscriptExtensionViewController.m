@interface CKTranscriptExtensionViewController
+ (void)initialize;
- (CKDetailsNavigationController)detailsNavigationController;
- (NSExtension)weakExtension;
- (NSUUID)requestUUID;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (void)doneButtonPressedForChatController:(id)a3;
- (void)presentConversationWithMessageGUID:(id)a3 attachmentGUID:(id)a4;
- (void)setDetailsNavigationController:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setWeakExtension:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKTranscriptExtensionViewController

+ (void)initialize
{
  if (CKIsRunningInMessagesTranscriptExtension())
  {
    if (initialize_token != -1) {
      dispatch_once(&initialize_token, &__block_literal_global_254);
    }
    v2 = dispatch_get_global_queue(2, 0);
    dispatch_async(v2, &__block_literal_global_75_1);

    v3 = MEMORY[0x1E4F14428];
    dispatch_async(v3, &__block_literal_global_78_0);
  }
}

void __49__CKTranscriptExtensionViewController_initialize__block_invoke()
{
  v0 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v0 addListenerID:@"com.apple.MobileSMS.MessagesTranscriptExtension" capabilities:*MEMORY[0x1E4F6C540] | *MEMORY[0x1E4F6C528] | *MEMORY[0x1E4F6C508] | *MEMORY[0x1E4F6C518] | *MEMORY[0x1E4F6C520] | *MEMORY[0x1E4F6C548] | *MEMORY[0x1E4F6C530] | (*MEMORY[0x1E4F6C538] | *MEMORY[0x1E4F6C560])];

  v1 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v1 blockUntilConnected];

  id v2 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v2 _setBlocksConnectionAtResume:1];
}

id __49__CKTranscriptExtensionViewController_initialize__block_invoke_2()
{
  return (id)[MEMORY[0x1E4F6BC18] sharedInstance];
}

uint64_t __49__CKTranscriptExtensionViewController_initialize__block_invoke_3()
{
  return +[CKSocialLayerChatController initialize];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptExtensionViewController;
  [(CKTranscriptExtensionViewController *)&v12 viewDidLoad];
  v3 = [(CKTranscriptExtensionViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [v5 userInfo];
    v7 = [v6 valueForKey:@"messageGUID"];

    v8 = [v5 userInfo];
    v9 = [v8 valueForKey:@"attachmentGUID"];

    if (![v7 length])
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "chatGUID or messageGUID key not provided in extension context", v11, 2u);
        }
      }
      exit(0);
    }
    [(CKTranscriptExtensionViewController *)self presentConversationWithMessageGUID:v7 attachmentGUID:v9];
  }
}

- (void)presentConversationWithMessageGUID:(id)a3 attachmentGUID:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[CKSocialLayerChatController chatIdentifierForMessageWithGUID:v6];
  v9 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v10 = [v9 existingChatWithChatIdentifier:v8];

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "The messageGUID %@ doesn't correspond to a chat. Nothing to present.", (uint8_t *)&v15, 0xCu);
      }
    }
    exit(0);
  }
  v11 = [[CKConversation alloc] initWithChat:v10];
  [(CKConversation *)v11 setLoadedMessageCount:50];
  objc_super v12 = [[CKSocialLayerChatController alloc] initWithConversation:v11];
  [(CKSocialLayerChatController *)v12 setMessageGUID:v6];
  [(CKSocialLayerChatController *)v12 setAttachmentGUID:v7];
  [(CKCoreChatController *)v12 setDelegate:self];
  v17[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [(CKTranscriptExtensionViewController *)self setViewControllers:v13];
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  double v3 = [(CKTranscriptExtensionViewController *)self extensionContext];
  double v4 = [v3 _auxiliaryConnection];
  id v5 = [v4 remoteObjectProxy];

  [v5 requestDismissal];
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSExtension)weakExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakExtension);

  return (NSExtension *)WeakRetained;
}

- (void)setWeakExtension:(id)a3
{
}

- (CKDetailsNavigationController)detailsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsNavigationController);

  return (CKDetailsNavigationController *)WeakRetained;
}

- (void)setDetailsNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailsNavigationController);
  objc_destroyWeak((id *)&self->_weakExtension);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end