@interface CKTranscriptGroupHeaderViewController
- (BOOL)shouldInvalidateOnAddressBookChange;
- (UIButton)headerButton;
- (id)_groupHeaderComposeRecipients;
- (void)_handleConversationRecipientsChanged:(id)a3;
- (void)dealloc;
- (void)loadView;
@end

@implementation CKTranscriptGroupHeaderViewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptGroupHeaderViewController;
  [(CKTranscriptGroupHeaderViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [CKTranscriptGroupHeaderView alloc];
  objc_super v4 = [(CKTranscriptHeaderViewController *)self conversation];
  v10 = -[CKTranscriptGroupHeaderView initWithFrame:conversation:](v3, "initWithFrame:conversation:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(CKTranscriptGroupHeaderViewController *)self setView:v10];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [(CKTranscriptHeaderViewController *)self conversation];
  [v5 addObserver:self selector:sel__handleConversationRecipientsChanged_ name:@"CKConversationParticipantsDidChangeNotification" object:v6];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleConversationRecipientsChanged_ name:*MEMORY[0x1E4F6CA50] object:0];

  v8 = [(CKTranscriptGroupHeaderView *)v10 textView];
  v9 = [(CKTranscriptGroupHeaderViewController *)self _groupHeaderComposeRecipients];
  [v8 setRecipients:v9];
}

- (BOOL)shouldInvalidateOnAddressBookChange
{
  return 0;
}

- (UIButton)headerButton
{
  v2 = [(CKTranscriptGroupHeaderViewController *)self view];
  v3 = [v2 actionButton];

  return (UIButton *)v3;
}

- (id)_groupHeaderComposeRecipients
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  objc_super v4 = [(CKTranscriptHeaderViewController *)self conversation];
  v5 = [v4 handles];
  v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v7 = [(CKTranscriptHeaderViewController *)self conversation];
  v8 = [v7 handles];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CKTranscriptGroupHeaderViewController__groupHeaderComposeRecipients__block_invoke;
  v13[3] = &unk_1E562AA40;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  [v8 enumerateObjectsUsingBlock:v13];

  v10 = v14;
  id v11 = v9;

  return v11;
}

void __70__CKTranscriptGroupHeaderViewController__groupHeaderComposeRecipients__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7 = [(CKIMComposeRecipient *)[CKIMGroupHeaderRecipient alloc] initWithHandle:v3];
  objc_super v4 = [*(id *)(a1 + 32) conversation];
  v5 = [v4 chat];
  v6 = [v3 displayNameForChat:v5];

  [(CKIMGroupHeaderRecipient *)v7 setDisplayString:v6];
  [*(id *)(a1 + 40) addObject:v7];
}

- (void)_handleConversationRecipientsChanged:(id)a3
{
  id v6 = [(CKTranscriptGroupHeaderViewController *)self view];
  objc_super v4 = [v6 textView];
  v5 = [(CKTranscriptGroupHeaderViewController *)self _groupHeaderComposeRecipients];
  [v4 setRecipients:v5];
}

@end