@interface CKSpringBoardActionManager
+ (id)sharedInstance;
- (BOOL)shouldHideGroupsDonations;
- (CKContactsSearchManager)contactsSearchManager;
- (CKSpringBoardActionManager)init;
- (NSArray)conversationCache;
- (void)_refreshConversationCache;
- (void)chatStateChanged:(id)a3;
- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4;
- (void)dealloc;
- (void)setContactsSearchManager:(id)a3;
- (void)setConversationCache:(id)a3;
- (void)setShouldHideGroupsDonations:(BOOL)a3;
- (void)updateShortcutItems;
@end

@implementation CKSpringBoardActionManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_80);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

void __44__CKSpringBoardActionManager_sharedInstance__block_invoke()
{
  if (!CKIsRunningInMacCatalyst())
  {
    v0 = objc_alloc_init(CKSpringBoardActionManager);
    v1 = (void *)sharedInstance_sSharedInstance;
    sharedInstance_sSharedInstance = (uint64_t)v0;
  }
}

- (CKSpringBoardActionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKSpringBoardActionManager;
  v2 = [(CKSpringBoardActionManager *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_chatStateChanged_ name:@"CKConversationJoinStateDidChangeNotification" object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_chatStateChanged_ name:@"CKConversationParticipantsDidChangeNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_chatStateChanged_ name:*MEMORY[0x1E4F6B898] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_chatStateChanged_ name:@"CKConversationListFinishedLoadingNotification" object:0];

    v2->shouldHideGroupsDonations = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKContactsSearchManager *)self->_contactsSearchManager setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)CKSpringBoardActionManager;
  [(CKSpringBoardActionManager *)&v4 dealloc];
}

- (CKContactsSearchManager)contactsSearchManager
{
  contactsSearchManager = self->_contactsSearchManager;
  if (!contactsSearchManager)
  {
    objc_super v4 = objc_alloc_init(CKContactsSearchManager);
    v5 = self->_contactsSearchManager;
    self->_contactsSearchManager = v4;

    [(CKContactsSearchManager *)self->_contactsSearchManager setBiasForOutgoingInteraction:1];
    [(CKContactsSearchManager *)self->_contactsSearchManager setDelegate:self];
    [(CKContactsSearchManager *)self->_contactsSearchManager setSuppressGroupSuggestions:1];
    contactsSearchManager = self->_contactsSearchManager;
  }

  return contactsSearchManager;
}

- (void)updateShortcutItems
{
  v3 = +[CKConversationList sharedConversationList];
  objc_super v4 = [v3 pinnedConversations];
  v5 = (void *)[v4 copy];

  if ([v5 count])
  {
    v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke;
    block[3] = &unk_1E5620C40;
    id v9 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = [(CKSpringBoardActionManager *)self contactsSearchManager];
    [v7 searchWithText:&stru_1EDE4CA38];
  }
}

void __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F427A0], "ck_shortcutItemsForConversations:maximumNumberOfShortcuts:", *(void *)(a1 + 32), 3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke_2;
  block[3] = &unk_1E5620C40;
  id v4 = v1;
  id v2 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__CKSpringBoardActionManager_updateShortcutItems__block_invoke_2(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4F43630] setShortcutItems:*(void *)(a1 + 32)];
}

- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    uint64_t v31 = *(void *)v39;
    id v32 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v33 = v8;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = +[CKConversationList sharedConversationList];
          v14 = [v12 conversationGUID];

          v15 = [v13 conversationForExistingChatWithGUID:v14];
          id v16 = 0;
        }
        else
        {
          if ([v11 isGroup])
          {
            [v11 children];
          }
          else
          {
            v43 = v11;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
          }
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v15 = 0;
            goto LABEL_29;
          }
          v14 = [MEMORY[0x1E4F1CA48] array];
          v17 = [MEMORY[0x1E4F6BBD8] sharedInstance];
          v18 = [MEMORY[0x1E4F6BDB8] iMessageService];
          v13 = objc_msgSend(v17, "__ck_defaultAccountForService:", v18);

          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v16 = v16;
          uint64_t v19 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v35;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v35 != v21) {
                  objc_enumerationMutation(v16);
                }
                v23 = [*(id *)(*((void *)&v34 + 1) + 8 * i) rawAddress];
                v24 = IMStripFormattingFromAddress();

                if (v24)
                {
                  uint64_t v25 = [v13 imHandleWithID:v24 alreadyCanonical:0];
                  if (!v25)
                  {

                    v15 = 0;
                    v14 = v16;
                    goto LABEL_26;
                  }
                  v26 = (void *)v25;
                  [v14 addObject:v25];
                }
              }
              uint64_t v20 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          if (!v14)
          {
            v15 = 0;
            id v6 = v32;
            uint64_t v8 = v33;
            uint64_t v9 = v31;
            goto LABEL_28;
          }
          v27 = +[CKConversationList sharedConversationList];
          v15 = [v27 conversationForHandles:v14 displayName:0 joinedChatsOnly:1 create:0];

LABEL_26:
          id v6 = v32;
          uint64_t v8 = v33;
          uint64_t v9 = v31;
        }

LABEL_28:
LABEL_29:
        v28 = objc_msgSend(MEMORY[0x1E4F427A0], "ck_shortcutItemForConversation:", v15);
        if (v28) {
          [v5 addObject:v28];
        }
        uint64_t v29 = [v5 count];

        if (v29 == 3) {
          goto LABEL_36;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v30 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
      uint64_t v8 = v30;
    }
    while (v30);
  }
LABEL_36:

  [(id)*MEMORY[0x1E4F43630] setShortcutItems:v5];
}

- (NSArray)conversationCache
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  conversationCache = self->_conversationCache;
  if (!conversationCache)
  {
    v28 = self;
    uint64_t v30 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v4 = +[CKConversationList sharedConversationList];
    v5 = [v4 conversations];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v39;
      uint64_t v29 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        uint64_t v31 = v7;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
          if ((([v10 isGroupConversation] & 1) != 0
             || [v10 isBusinessConversation])
            && ([v10 hasLeft] & 1) == 0)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v12 = [v10 chat];
            v13 = [v12 guid];
            uint64_t v14 = [v13 copy];

            uint64_t v33 = (void *)v14;
            [v11 setObject:v14 forKey:@"CKConversationGUIDKey"];
            v15 = [v10 displayName];
            id v16 = (void *)[v15 copy];

            if ([v16 length]) {
              [v11 setObject:v16 forKey:@"CKConversationDisplayNameKey"];
            }
            v17 = [MEMORY[0x1E4F1CA48] array];
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            v18 = [v10 chat];
            uint64_t v19 = [v18 participants];

            uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v35 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = [*(id *)(*((void *)&v34 + 1) + 8 * i) name];
                  uint64_t v25 = (void *)[v24 copy];

                  [v17 addObject:v25];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v21);
            }

            [v11 setObject:v17 forKey:@"CKConversationEntityNamesKey"];
            [(NSArray *)v30 addObject:v11];

            uint64_t v8 = v29;
            uint64_t v7 = v31;
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v7);
    }

    v26 = v28->_conversationCache;
    v28->_conversationCache = v30;

    conversationCache = v28->_conversationCache;
  }

  return conversationCache;
}

- (void)_refreshConversationCache
{
  [(CKSpringBoardActionManager *)self setConversationCache:0];
  id v3 = [(CKSpringBoardActionManager *)self conversationCache];
}

- (void)chatStateChanged:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__refreshConversationCache object:0];

  [(CKSpringBoardActionManager *)self performSelector:sel__refreshConversationCache withObject:0 afterDelay:1.0];
}

- (BOOL)shouldHideGroupsDonations
{
  return self->shouldHideGroupsDonations;
}

- (void)setShouldHideGroupsDonations:(BOOL)a3
{
  self->shouldHideGroupsDonations = a3;
}

- (void)setContactsSearchManager:(id)a3
{
}

- (void)setConversationCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationCache, 0);

  objc_storeStrong((id *)&self->_contactsSearchManager, 0);
}

@end