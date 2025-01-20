@interface CKTranscriptModel
+ (id)transcriptSectionIdentifier;
- (CKConversation)conversation;
- (CKTranscriptModel)initWithConversation:(id)a3 delegate:(id)a4;
- (CKTranscriptModelDelegate)delegate;
- (NSArray)chatItems;
- (NSDictionary)supplementaryKindToChatItemMap;
- (NSDiffableDataSourceSnapshot)snapshot;
- (id)chatItemWithIMChatItem:(id)a3 traitCollection:(id)a4;
- (id)chatItemsWithIMChatItems:(id)a3;
- (void)reload;
- (void)setChatItems:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupplementaryKindToChatItemMap:(id)a3;
@end

@implementation CKTranscriptModel

- (CKTranscriptModel)initWithConversation:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)CKTranscriptModel;
    v8 = [(CKTranscriptModel *)&v13 init];
    v9 = v8;
    if (v8)
    {
      [(CKTranscriptModel *)v8 setDelegate:v7];
      [(CKTranscriptModel *)v9 setConversation:v6];
    }
    self = v9;
    v10 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKTranscriptModel - Initialized with nil conversation", buf, 2u);
      }
    }
    v10 = 0;
  }

  return v10;
}

+ (id)transcriptSectionIdentifier
{
  return @"Transcript";
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() transcriptSectionIdentifier];
  id v4 = objc_alloc_init(MEMORY[0x1E4F42650]);
  v9[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  id v6 = [(CKTranscriptModel *)self chatItems];
  id v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_108);

  [v4 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:v3];

  return (NSDiffableDataSourceSnapshot *)v4;
}

id __29__CKTranscriptModel_snapshot__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 IMChatItem];
  v3 = [v2 guid];

  return v3;
}

- (void)reload
{
  [(CKTranscriptModel *)self setChatItems:0];
  v3 = [(CKTranscriptModel *)self conversation];
  id v4 = [v3 chat];
  id v6 = [v4 chatItems];

  v5 = [(CKTranscriptModel *)self chatItemsWithIMChatItems:v6];
  [(CKTranscriptModel *)self setChatItems:v5];
}

- (id)chatItemsWithIMChatItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [(CKTranscriptModel *)self delegate];
  id v7 = [v6 traitCollectionForModel:self];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = -[CKTranscriptModel chatItemWithIMChatItem:traitCollection:](self, "chatItemWithIMChatItem:traitCollection:", *(void *)(*((void *)&v15 + 1) + 8 * i), v7, (void)v15);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)chatItemWithIMChatItem:(id)a3 traitCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKTranscriptModel *)self delegate];
  [v8 itemMaxWidthForModel:self];
  double v10 = v9;

  uint64_t v11 = [(CKTranscriptModel *)self delegate];
  [v11 balloonMaxWidthForModel:self];
  double v13 = v12;

  v14 = +[CKChatItem chatItemWithIMChatItem:v7 balloonMaxWidth:v6 fullMaxWidth:0 transcriptTraitCollection:v13 overlayLayout:v10];

  return v14;
}

- (void)setChatItems:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v5 = (NSArray *)a3;
  if (self->_chatItems != v5)
  {
    v19 = self;
    objc_storeStrong((id *)&self->_chatItems, a3);
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](v5, "count"));
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = v5;
    obuint64_t j = v5;
    uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v9 = v23;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                long long v15 = objc_msgSend(v8, "IMChatItem", v19);
                long long v16 = [v15 guid];
                long long v17 = [v14 supplementaryViewKindForGUID:v16];

                [v6 setObject:v8 forKey:v17];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v11);
          }
        }
        uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v24);
    }

    long long v18 = (void *)[v6 copy];
    [(CKTranscriptModel *)v19 setSupplementaryKindToChatItemMap:v18];

    v5 = v20;
  }
}

- (CKTranscriptModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (NSArray)chatItems
{
  return self->_chatItems;
}

- (NSDictionary)supplementaryKindToChatItemMap
{
  return self->_supplementaryKindToChatItemMap;
}

- (void)setSupplementaryKindToChatItemMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryKindToChatItemMap, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end