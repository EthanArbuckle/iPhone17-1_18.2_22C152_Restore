@interface CKConversationListCollectionViewRecentlyDeletedConversationCell
- (BOOL)hasUnreadMessagesForConversation:(id)a3;
- (BOOL)shouldAlwaysHideAvatar;
- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3;
- (id)_attributedStringForRecoverableSummaryLabelWithText:(id)a3;
- (unint64_t)_daysUntilDeletion:(id)a3;
- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5;
@end

@implementation CKConversationListCollectionViewRecentlyDeletedConversationCell

- (void)updateSummaryLabel:(id)a3 conversation:(id)a4 fastPreview:(BOOL)a5
{
  id v23 = a4;
  id v7 = a3;
  v8 = [v23 chat];
  uint64_t v9 = [v8 recoverableMessagesCount];

  v10 = [v23 chat];
  int v11 = [v10 isDeletingIncomingMessages];

  if (v11)
  {
    v12 = [v23 chat];
    uint64_t v13 = [v12 unreadRecoverableMessagesCount];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = NSString;
  v15 = CKFrameworkBundle();
  v16 = [v15 localizedStringForKey:@"RECENTLY_DELETED_CONVERSATIONLIST_CELL_SUMMARY_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v9, v13);

  v18 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v19 = [v18 userInterfaceLayoutDirection];

  if (v19 == 1) {
    v20 = @"\u200F";
  }
  else {
    v20 = @"\u200E";
  }
  v21 = [(__CFString *)v20 stringByAppendingString:v17];

  v22 = [(CKConversationListCollectionViewRecentlyDeletedConversationCell *)self _attributedStringForRecoverableSummaryLabelWithText:v21];
  [v7 setAttributedText:v22];
}

- (id)_attributedStringForRecoverableSummaryLabelWithText:(id)a3
{
  id v4 = a3;
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 conversationListSummaryFont];

  id v7 = [(CKConversationListCollectionViewConversationCell *)self summaryLabelTextColor];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];

  uint64_t v9 = [v8 length];
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v6, 0, v9);
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v7, 0, v9);

  return v8;
}

- (unint64_t)_daysUntilDeletion:(id)a3
{
  v3 = [a3 chat];
  id v4 = [v3 earliestRecoverableMessageDeletionDate];
  unint64_t v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:v4];

  return v5;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  v3 = [a3 chat];
  char v4 = [v3 isDeletingIncomingMessages];

  return v4 ^ 1;
}

- (BOOL)shouldAlwaysHideAvatar
{
  return 0;
}

- (BOOL)hasUnreadMessagesForConversation:(id)a3
{
  id v3 = a3;
  char v4 = [v3 chat];
  if ([v4 unreadRecoverableMessagesCount])
  {
    unint64_t v5 = [v3 chat];
    char v6 = [v5 isDeletingIncomingMessages];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end