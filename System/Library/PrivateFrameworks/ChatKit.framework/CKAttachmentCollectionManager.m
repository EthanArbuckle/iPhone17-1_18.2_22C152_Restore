@interface CKAttachmentCollectionManager
- (CKAttachmentCollectionManager)initWithChat:(id)a3;
- (CKAttachmentCollectionManager)initWithChat:(id)a3 photoTransferGUIDs:(id)a4;
- (CKAttachmentCollectionManagerDelegate)delegate;
- (IMChat)chat;
- (NSArray)otherContentsItems;
- (NSArray)photosVideosItems;
- (NSArray)webLinksItems;
- (NSSet)photoTransferGUIDs;
- (id)guidFromChatItem:(id)a3;
- (void)chatItemsChanged:(id)a3;
- (void)dealloc;
- (void)deleteAttachmentItems:(id)a3;
- (void)setChat:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOtherContentsItems:(id)a3;
- (void)setPhotoTransferGUIDs:(id)a3;
- (void)setPhotosVideosItems:(id)a3;
- (void)setWebLinksItems:(id)a3;
- (void)updateCollections;
@end

@implementation CKAttachmentCollectionManager

- (CKAttachmentCollectionManager)initWithChat:(id)a3 photoTransferGUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKAttachmentCollectionManager;
  v8 = [(CKAttachmentCollectionManager *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(CKAttachmentCollectionManager *)v8 setChat:v6];
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      photoTransferGUIDs = v9->_photoTransferGUIDs;
      v9->_photoTransferGUIDs = (NSSet *)v10;
    }
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F6B8D8];
    v14 = [(CKAttachmentCollectionManager *)v9 chat];
    [v12 addObserver:v9 selector:sel_chatItemsChanged_ name:v13 object:v14];

    [(CKAttachmentCollectionManager *)v9 updateCollections];
  }

  return v9;
}

- (CKAttachmentCollectionManager)initWithChat:(id)a3
{
  return [(CKAttachmentCollectionManager *)self initWithChat:a3 photoTransferGUIDs:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCollectionManager;
  [(CKAttachmentCollectionManager *)&v4 dealloc];
}

- (void)chatItemsChanged:(id)a3
{
  id v4 = a3;
  v5 = [(CKAttachmentCollectionManager *)self photosVideosItems];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(CKAttachmentCollectionManager *)self otherContentsItems];
  v8 = (void *)[v7 mutableCopy];

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v9 = [v4 userInfo];
  uint64_t v10 = [v4 object];
  v11 = [v9 objectForKey:*MEMORY[0x1E4F6B8F0]];
  v12 = [v10 chatItems];
  uint64_t v13 = [v9 objectForKey:*MEMORY[0x1E4F6B8E0]];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke;
  v38[3] = &unk_1E562AB28;
  v38[4] = self;
  id v14 = v12;
  id v39 = v14;
  id v15 = v6;
  id v40 = v15;
  id v16 = v8;
  id v41 = v16;
  v42 = &v43;
  [v13 enumerateIndexesWithOptions:2 usingBlock:v38];
  v26 = v14;
  v27 = v13;
  v28 = v4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [v9 objectForKey:*MEMORY[0x1E4F6B908]];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_2;
  v35[3] = &unk_1E562AB50;
  v35[4] = self;
  id v19 = v11;
  id v36 = v19;
  id v20 = v17;
  id v37 = v20;
  [v18 enumerateIndexesUsingBlock:v35];
  if ([v20 count])
  {
    *((unsigned char *)v44 + 24) = 1;
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_3;
    v32[3] = &unk_1E562AB78;
    id v22 = v20;
    id v33 = v22;
    id v23 = v21;
    id v34 = v23;
    [v15 enumerateObjectsUsingBlock:v32];
    [v15 removeObjectsAtIndexes:v23];
    [v23 removeAllIndexes];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_4;
    v29[3] = &unk_1E562AB78;
    id v30 = v22;
    id v24 = v23;
    id v31 = v24;
    [v16 enumerateObjectsUsingBlock:v29];
    [v16 removeObjectsAtIndexes:v24];
  }
  if (*((unsigned char *)v44 + 24))
  {
    [(CKAttachmentCollectionManager *)self setPhotosVideosItems:v15];
    [(CKAttachmentCollectionManager *)self setOtherContentsItems:v16];
    v25 = [(CKAttachmentCollectionManager *)self delegate];
    [v25 attachmentCollectionManagerDidUpdateAttachmentItems:self];
  }
  _Block_object_dispose(&v43, 8);
}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v17 = [v3 guidFromChatItem:v4];

  v5 = v17;
  if (v17)
  {
    id v6 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    id v7 = [v6 transferForGUID:v17];

    v8 = [v7 localPath];
    v9 = objc_msgSend(v8, "__ck_stringByExpandingTildeInPath");

    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    v11 = [v7 createdDate];
    v12 = [v7 shareURL];
    uint64_t v13 = +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v10, v17, v17, v11, v12, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    if (v13)
    {
      CFStringRef v14 = (const __CFString *)[v13 UTIType];
      if (UTTypeConformsTo(v14, (CFStringRef)*MEMORY[0x1E4F225F8])
        || UTTypeConformsTo(v14, (CFStringRef)*MEMORY[0x1E4F22660]))
      {
        id v15 = (id *)(a1 + 48);
      }
      else
      {
        id v15 = (id *)(a1 + 56);
      }
      id v16 = *v15;
      [v16 addObject:v13];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;

    v5 = v17;
  }
}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v6 = [v3 guidFromChatItem:v4];

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
    v5 = v6;
  }
}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = [a2 guid];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = [a2 guid];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (id)guidFromChatItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transferGUID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateCollections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(CKAttachmentCollectionManager *)self chat];
  id v6 = [v5 chatItems];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke;
  v16[3] = &unk_1E5623AF8;
  id v17 = v3;
  id v18 = v4;
  id v7 = v4;
  id v8 = v3;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v16];

  [(CKAttachmentCollectionManager *)self setPhotosVideosItems:v8];
  [(CKAttachmentCollectionManager *)self setOtherContentsItems:v7];
  v9 = [(CKAttachmentCollectionManager *)self delegate];
  [v9 attachmentCollectionManagerDidUpdateAttachmentItems:self];

  id v10 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v10 startTimingForKey:@"loadAttachments Query"];
  v11 = [(CKAttachmentCollectionManager *)self chat];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke_2;
  v13[3] = &unk_1E562ABC8;
  id v14 = v10;
  id v15 = self;
  id v12 = v10;
  [v11 loadAttachments:v13];
}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v19;
  if (isKindOfClass)
  {
    v5 = [v19 transferGUID];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      id v7 = [v6 transferForGUID:v5];

      id v8 = [v7 localPath];
      v9 = objc_msgSend(v8, "__ck_stringByExpandingTildeInPath");

      id v10 = v5;
      v11 = v10;
      if ([v7 isSticker])
      {
        v11 = CKStickerPreviewCacheKeyForFileTransfer(v7);
      }
      if (v9)
      {
        id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
        uint64_t v13 = [v7 createdDate];
        id v14 = [v7 shareURL];
        id v15 = +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v12, v10, v11, v13, v14, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

        if (v15)
        {
          CFStringRef v16 = (const __CFString *)[v15 UTIType];
          if (UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E4F225F8])
            || UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E4F22660]))
          {
            id v17 = (id *)(a1 + 32);
          }
          else
          {
            id v17 = (id *)(a1 + 40);
          }
          id v18 = *v17;
          [v18 addObject:v15];
        }
      }
    }
    id v4 = v19;
  }
}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) stopTimingForKey:@"loadAttachments Query"];
  if (a2)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) startTimingForKey:@"loadAttachments buildup attachments"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke_3;
    v16[3] = &unk_1E562ABA0;
    void v16[4] = *(void *)(a1 + 40);
    id v11 = v9;
    id v17 = v11;
    id v12 = v10;
    id v18 = v12;
    [v7 enumerateObjectsWithOptions:2 usingBlock:v16];
    [*(id *)(a1 + 32) stopTimingForKey:@"loadAttachments buildup attachments"];
    [*(id *)(a1 + 40) setPhotosVideosItems:v11];
    [*(id *)(a1 + 40) setOtherContentsItems:v12];
    uint64_t v13 = [*(id *)(a1 + 40) delegate];
    [v13 attachmentCollectionManagerDidUpdateAttachmentItems:*(void *)(a1 + 40)];

    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v15;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "timing = %@", buf, 0xCu);
      }
    }
  }
}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke_3(id *a1, void *a2)
{
  id v20 = a2;
  id v3 = [v20 path];
  id v4 = objc_msgSend(v3, "__ck_stringByExpandingTildeInPath");

  v5 = [v20 guid];
  if (([v20 isSticker] & 1) != 0 || !objc_msgSend(v20, "isTransferComplete"))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
    uint64_t v7 = [a1[4] photoTransferGUIDs];
    if (!v7
      || (id v8 = (void *)v7,
          [a1[4] photoTransferGUIDs],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 containsObject:v6],
          v9,
          v8,
          v10))
    {
      id v11 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      id v12 = [v11 transferForGUID:v6];

      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
      id v14 = [v20 createdDate];
      uint64_t v15 = [v12 shareURL];
      CFStringRef v16 = +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v13, v6, v6, v14, v15, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

      if (v16)
      {
        CFStringRef v17 = (const __CFString *)[v16 UTIType];
        if (UTTypeConformsTo(v17, (CFStringRef)*MEMORY[0x1E4F225F8])
          || UTTypeConformsTo(v17, (CFStringRef)*MEMORY[0x1E4F22660]))
        {
          id v18 = a1 + 5;
        }
        else
        {
          id v18 = a1 + 6;
        }
        id v19 = *v18;
        [v19 addObject:v16];
        objc_msgSend(v16, "setIsSticker:", objc_msgSend(v20, "isSticker"));
      }
    }
  }
}

- (void)deleteAttachmentItems:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v12 = [v11 transferGUID];

        if (v12)
        {
          uint64_t v13 = [v11 transferGUID];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v14 = [(CKAttachmentCollectionManager *)self photosVideosItems];
    id v36 = (void *)[v14 mutableCopy];

    uint64_t v15 = [(CKAttachmentCollectionManager *)self otherContentsItems];
    CFStringRef v16 = (void *)[v15 mutableCopy];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v35 = self;
    CFStringRef v17 = [(CKAttachmentCollectionManager *)self photosVideosItems];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          id v23 = [v22 transferGUID];
          int v24 = [v5 containsObject:v23];

          if (v24) {
            [v36 removeObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v19);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v25 = [(CKAttachmentCollectionManager *)v35 otherContentsItems];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v37 + 1) + 8 * k);
          id v31 = [v30 transferGUID];
          int v32 = [v5 containsObject:v31];

          if (v32) {
            [v16 removeObject:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v27);
    }

    [(CKAttachmentCollectionManager *)v35 setPhotosVideosItems:v36];
    [(CKAttachmentCollectionManager *)v35 setOtherContentsItems:v16];
    id v33 = [(CKAttachmentCollectionManager *)v35 chat];
    [v33 deleteTransfers:v5];

    id v34 = [(CKAttachmentCollectionManager *)v35 delegate];
    [v34 attachmentCollectionManagerDidUpdateAttachmentItems:v35];
  }
}

- (CKAttachmentCollectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAttachmentCollectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)photosVideosItems
{
  return self->_photosVideosItems;
}

- (void)setPhotosVideosItems:(id)a3
{
}

- (NSArray)webLinksItems
{
  return self->_webLinksItems;
}

- (void)setWebLinksItems:(id)a3
{
}

- (NSArray)otherContentsItems
{
  return self->_otherContentsItems;
}

- (void)setOtherContentsItems:(id)a3
{
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (NSSet)photoTransferGUIDs
{
  return self->_photoTransferGUIDs;
}

- (void)setPhotoTransferGUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_otherContentsItems, 0);
  objc_storeStrong((id *)&self->_webLinksItems, 0);
  objc_storeStrong((id *)&self->_photosVideosItems, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end