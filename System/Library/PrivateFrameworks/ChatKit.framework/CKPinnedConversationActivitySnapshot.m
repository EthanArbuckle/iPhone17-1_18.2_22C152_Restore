@interface CKPinnedConversationActivitySnapshot
+ (id)emptySnapshot;
- (CKPinnedConversationActivitySnapshot)initWithActivityItems:(id)a3 contactItems:(id)a4;
- (CKPinnedConversationActivitySnapshot)initWithConversation:(id)a3 recentMessagesInPinnedConversations:(id)a4 previousSnapshot:(id)a5;
- (NSArray)activityItems;
- (NSArray)contactItems;
- (double)_contentScaleForContactItemAtIndex:(int64_t)a3 withMessageContentScale:(double)a4;
- (double)_contentScaleForMessage:(id)a3 amongRecentMessagesInPinnedConversations:(id)a4;
- (id)_contactItemMatchingIdentifier:(id)a3;
- (int64_t)_contactItemAlignmentForItemAtIndex:(int64_t)a3 firstItemAlignment:(int64_t)a4;
- (int64_t)_firstContactItemAlignmentForContactItem:(id)a3 previousSnapshot:(id)a4 totalNumberOfContactItemIdentifiersWithUnreadMessages:(int64_t)a5;
@end

@implementation CKPinnedConversationActivitySnapshot

+ (id)emptySnapshot
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithActivityItems:MEMORY[0x1E4F1CBF0] contactItems:MEMORY[0x1E4F1CBF0]];

  return v3;
}

- (CKPinnedConversationActivitySnapshot)initWithActivityItems:(id)a3 contactItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKPinnedConversationActivitySnapshot;
  v8 = [(CKPinnedConversationActivitySnapshot *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    activityItems = v8->_activityItems;
    v8->_activityItems = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    contactItems = v8->_contactItems;
    v8->_contactItems = (NSArray *)v11;
  }
  return v8;
}

- (CKPinnedConversationActivitySnapshot)initWithConversation:(id)a3 recentMessagesInPinnedConversations:(id)a4 previousSnapshot:(id)a5
{
  id v8 = a3;
  id v48 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v13 = [v8 chat];
  objc_super v14 = [v13 lastIncomingMessage];
  if ([v8 isGroupConversation]) {
    int v15 = [v8 isAdHocGroupConversation] ^ 1;
  }
  else {
    int v15 = 0;
  }
  if ([v14 isTypingMessage])
  {
    v16 = objc_alloc_init(CKPinnedConversationTypingBubbleActivityItem);
    [v10 addObject:v16];

    double v17 = 1.0;
    goto LABEL_35;
  }
  double v17 = 1.0;
  if ([v8 hasUnreadMessages])
  {
    v18 = [v13 lastIncomingFinishedMessage];
    if ([v18 isRead] & 1) != 0 || (objc_msgSend(v18, "isTypingMessage"))
    {
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v19 = [v18 sender];
    v45 = (void *)v19;
    if (!v19)
    {
      _IMWarn();
      uint64_t v19 = 0;
    }
    uint64_t v20 = [v8 entityMatchingHandle:v19];
    v42 = (void *)v20;
    if (v15)
    {
      v43 = +[CKPinnedConversationContactItemProvider contactItemFromEntity:v20];
      [v11 addObject:v43];
      v46 = [v43 contactItemIdentifier];
      objc_msgSend(v12, "addObject:");
    }
    else
    {
      v46 = 0;
    }
    [(CKPinnedConversationActivitySnapshot *)self _contentScaleForMessage:v18 amongRecentMessagesInPinnedConversations:v48];
    double v17 = v21;
    v41 = [v18 expressiveSendStyleID];
    int v39 = [v41 isEqualToString:*MEMORY[0x1E4F6D4E0]];
    if (([v18 associatedMessageType] & 0xFFFFFFFFFFFFFFF8) == 0x7D0)
    {
      v44 = [[CKPinnedConversationTapbackBubbleActivityItem alloc] initWithMessage:v18 contentScale:v46 attachedContactItemIdentifier:v17];
      [v10 addObject:v44];
      goto LABEL_30;
    }
    if ([v18 isRichLinkMessage]
      && (([v18 isSenderUnknown] | v39) & 1) == 0)
    {
      v44 = [MEMORY[0x1E4F6BD48] chatContextForPinnedChat:v13];
      v40 = [[CKPinnedConversationRichLinkActivityItem alloc] initWithMessage:v18 chatContext:v44 contentScale:v46 attachedContactItemIdentifier:v17];
      [v10 addObject:v40];
    }
    else
    {
      uint64_t v22 = +[CKPinnedConversationMediaObjectActivityItem previewableMediaObjectFromMessage:](CKPinnedConversationMediaObjectActivityItem, "previewableMediaObjectFromMessage:", v18, v9);
      if (v22) {
        char v23 = v39;
      }
      else {
        char v23 = 1;
      }
      v44 = (CKPinnedConversationTapbackBubbleActivityItem *)v22;
      if ((v23 & 1) == 0)
      {
        v25 = [[CKPinnedConversationMediaObjectActivityItem alloc] initWithMessage:v18 mediaObject:v22 contentScale:v46 attachedContactItemIdentifier:v17];
        [v10 addObject:v25];
        v26 = v25;
        id v9 = v38;
LABEL_29:

LABEL_30:
        if (v15 && [v8 limitToLoad] >= 2)
        {
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke;
          v53[3] = &unk_1E5628270;
          id v54 = v8;
          id v55 = v12;
          uint64_t v57 = 3;
          id v56 = v11;
          [v54 enumerateMessagesWithOptions:2 usingBlock:v53];
        }
        goto LABEL_34;
      }
      objc_msgSend(v18, "__ck_previewTextWithChat:", v13);
      v40 = (CKPinnedConversationRichLinkActivityItem *)objc_claimAutoreleasedReturnValue();
      if ([(CKPinnedConversationRichLinkActivityItem *)v40 length])
      {
        v24 = [[CKPinnedConversationSummaryBubbleActivityItem alloc] initWithMessage:v18 chat:v13 contentScale:v46 attachedContactItemIdentifier:v17];
        [v10 addObject:v24];
      }
      else
      {
        _IMWarn();
      }
      id v9 = v38;
    }
    v26 = v40;
    goto LABEL_29;
  }
LABEL_35:
  v47 = v8;
  v27 = v10;
  v28 = v13;
  v29 = v14;
  v30 = v11;
  v31 = [v11 firstObject];
  if (v31)
  {
    int64_t v32 = -[CKPinnedConversationActivitySnapshot _firstContactItemAlignmentForContactItem:previousSnapshot:totalNumberOfContactItemIdentifiersWithUnreadMessages:](self, "_firstContactItemAlignmentForContactItem:previousSnapshot:totalNumberOfContactItemIdentifiersWithUnreadMessages:", v31, v9, [v12 count]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke_2;
    v49[3] = &unk_1E5628298;
    v50 = self;
    int64_t v51 = v32;
    double v52 = v17;
    [v30 enumerateObjectsUsingBlock:v49];
  }
  v33 = (void *)[v27 copy];
  v34 = v9;
  v35 = (void *)[v30 copy];
  v36 = [(CKPinnedConversationActivitySnapshot *)self initWithActivityItems:v33 contactItems:v35];

  return v36;
}

void __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  if (([v9 isFromMe] & 1) != 0 || objc_msgSend(v9, "isRead"))
  {
    *a3 = 1;
  }
  else if (([v9 isTypingMessage] & 1) == 0)
  {
    v5 = [v9 sender];
    if (!v5) {
      _IMWarn();
    }
    id v6 = [*(id *)(a1 + 32) entityMatchingHandle:v5];
    id v7 = [v6 pinnedConversationContactItemIdentifier];
    if ([v7 length] && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
    {
      if ((unint64_t)[*(id *)(a1 + 40) count] < *(void *)(a1 + 56))
      {
        id v8 = +[CKPinnedConversationContactItemProvider contactItemFromEntity:v6];
        [*(id *)(a1 + 48) addObject:v8];
      }
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void __114__CKPinnedConversationActivitySnapshot_initWithConversation_recentMessagesInPinnedConversations_previousSnapshot___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = a2;
  uint64_t v7 = [v5 _contactItemAlignmentForItemAtIndex:a3 firstItemAlignment:v6];
  [*(id *)(a1 + 32) _contentScaleForContactItemAtIndex:a3 withMessageContentScale:*(double *)(a1 + 48)];
  double v9 = v8;
  [v10 setContactItemAlignment:v7];
  [v10 setContentScale:v9];
}

- (double)_contentScaleForContactItemAtIndex:(int64_t)a3 withMessageContentScale:(double)a4
{
  uint64_t v4 = 1;
  if (a3) {
    uint64_t v4 = 2;
  }
  return pow((double)v4, -0.7892) * a4;
}

- (int64_t)_contactItemAlignmentForItemAtIndex:(int64_t)a3 firstItemAlignment:(int64_t)a4
{
  return a3 & 1 ^ (a4 != 0);
}

- (int64_t)_firstContactItemAlignmentForContactItem:(id)a3 previousSnapshot:(id)a4 totalNumberOfContactItemIdentifiersWithUnreadMessages:(int64_t)a5
{
  id v7 = a4;
  double v8 = [a3 contactItemIdentifier];
  double v9 = [v7 _contactItemMatchingIdentifier:v8];

  if (v9) {
    int64_t v10 = [v9 contactItemAlignment];
  }
  else {
    int64_t v10 = (a5 & 0x8000000000000001) != 1;
  }

  return v10;
}

- (id)_contactItemMatchingIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_contactItems;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int64_t v10 = objc_msgSend(v9, "contactItemIdentifier", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)_contentScaleForMessage:(id)a3 amongRecentMessagesInPinnedConversations:(id)a4
{
  id v5 = a4;
  id v6 = [a3 guid];
  if ([v6 length])
  {
    uint64_t v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_116);
    uint64_t v8 = [v7 indexOfObject:v6];
    uint64_t v9 = [v7 count];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = +[CKUIBehavior sharedBehaviors];
      int v11 = v10;
LABEL_9:
      [v10 pinnedConversationActivitySnapshotContentScaleNonRecent];
      goto LABEL_10;
    }
    if (v8 == v9 - 1)
    {
      int v11 = +[CKUIBehavior sharedBehaviors];
      [v11 pinnedConversationActivitySnapshotContentScaleMostRecent];
    }
    else
    {
      uint64_t v15 = v9 - 2;
      int64_t v10 = +[CKUIBehavior sharedBehaviors];
      int v11 = v10;
      if (v8 != v15) {
        goto LABEL_9;
      }
      [v10 pinnedConversationActivitySnapshotContentScaleSecondMostRecent];
    }
LABEL_10:
    double v13 = v14;

    goto LABEL_11;
  }
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  [v7 pinnedConversationActivitySnapshotContentScaleNonRecent];
  double v13 = v12;
LABEL_11:

  return v13;
}

__CFString *__105__CKPinnedConversationActivitySnapshot__contentScaleForMessage_amongRecentMessagesInPinnedConversations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 guid];
  v3 = v2;
  if (!v2) {
    id v2 = &stru_1EDE4CA38;
  }
  id v4 = v2;

  return v4;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactItems, 0);

  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end