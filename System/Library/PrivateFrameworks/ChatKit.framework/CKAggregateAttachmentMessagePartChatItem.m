@interface CKAggregateAttachmentMessagePartChatItem
- (BOOL)canCopy;
- (BOOL)canDelete;
- (BOOL)canExport;
- (BOOL)canForward;
- (BOOL)canPerformQuickAction;
- (BOOL)shouldCacheSize;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAggregateAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
- (CKMediaObjectAssetDataSource)dataSource;
- (Class)balloonViewClass;
- (Class)cellClass;
- (NSArray)aggregateChatItems;
- (NSArray)aggregatedNonTapbackVisibleAssociatedMessageChatItems;
- (NSArray)aggregatedVisibleAssociatedMessageChatItems;
- (NSArray)mediaObjects;
- (NSArray)transferGUIDs;
- (NSURL)momentShareURL;
- (UIEdgeInsets)stickerReactionInsets;
- (id)pasteboardItemProviders;
- (id)transcriptTraitCollection;
- (unint64_t)layoutType;
- (void)_generateMediaObjects;
- (void)setAggregateChatItems:(id)a3;
- (void)setAggregatedNonTapbackVisibleAssociatedMessageChatItems:(id)a3;
- (void)setAggregatedVisibleAssociatedMessageChatItems:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMediaObjects:(id)a3;
- (void)setMomentShareURL:(id)a3;
- (void)setTranscriptTraitCollection:(id)a3;
@end

@implementation CKAggregateAttachmentMessagePartChatItem

void __56__CKAggregateAttachmentMessagePartChatItem_mediaObjects__block_invoke(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 mediaObject];
  [a1[4] addObject:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(v3, "visibleAssociatedMessageChatItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [a1[5] addObject:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [a1[6] addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setTranscriptTraitCollection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(UITraitCollection *)self->_transcriptTraitCollection isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(CKAggregateAttachmentMessagePartChatItem *)self mediaObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setTranscriptTraitCollection:v5];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (unint64_t)layoutType
{
  if ([(CKChatItem *)self itemIsReply]) {
    return 12;
  }
  else {
    return 17;
  }
}

- (CKAggregateAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKAggregateAttachmentMessagePartChatItem;
  v4 = [(CKMessagePartChatItem *)&v7 initWithIMChatItem:a3 maxWidth:a4];
  id v5 = v4;
  if (v4) {
    [(CKAggregateAttachmentMessagePartChatItem *)v4 _generateMediaObjects];
  }
  return v5;
}

- (void)_generateMediaObjects
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKChatItem *)self IMChatItem];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = v3;
  id v5 = [v3 aggregateAttachmentParts];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        [(CKChatItem *)self maxWidth];
        double v12 = v11;
        [(CKChatItem *)self maxWidth];
        double v14 = v13;
        v15 = [(CKAggregateAttachmentMessagePartChatItem *)self transcriptTraitCollection];
        uint64_t v16 = +[CKChatItem chatItemWithIMChatItem:v10 balloonMaxWidth:v15 fullMaxWidth:0 transcriptTraitCollection:v12 overlayLayout:v14];

        [v4 addObject:v16];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  [(CKAggregateAttachmentMessagePartChatItem *)self setAggregateChatItems:v4];
}

- (NSArray)mediaObjects
{
  mediaObjects = self->_mediaObjects;
  if (!mediaObjects)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v5 = [(CKAggregateAttachmentMessagePartChatItem *)self aggregateChatItems];
    uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = [(CKAggregateAttachmentMessagePartChatItem *)self aggregateChatItems];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__CKAggregateAttachmentMessagePartChatItem_mediaObjects__block_invoke;
    v20[3] = &unk_1E562C6B8;
    id v21 = v6;
    id v22 = v7;
    id v23 = v8;
    id v10 = v8;
    id v11 = v7;
    id v12 = v6;
    [v9 enumerateObjectsUsingBlock:v20];

    double v13 = (NSArray *)[v12 copy];
    double v14 = self->_mediaObjects;
    self->_mediaObjects = v13;

    v15 = (NSArray *)[v11 copy];
    aggregatedVisibleAssociatedMessageChatItems = self->_aggregatedVisibleAssociatedMessageChatItems;
    self->_aggregatedVisibleAssociatedMessageChatItems = v15;

    v17 = (NSArray *)[v10 copy];
    aggregatedNonTapbackVisibleAssociatedMessageChatItems = self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems;
    self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems = v17;

    mediaObjects = self->_mediaObjects;
  }

  return mediaObjects;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v6, "previewBalloonSizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canCopy
{
  return 1;
}

- (BOOL)canForward
{
  return 1;
}

- (BOOL)canDelete
{
  return 1;
}

- (BOOL)canExport
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CKAggregateAttachmentMessagePartChatItem *)self mediaObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) canExport])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)canPerformQuickAction
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(CKMessagePartChatItem *)self isReplyContextPreview])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [(CKAggregateAttachmentMessagePartChatItem *)self mediaObjects];
    uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) canPerformQuickAction])
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (UIEdgeInsets)stickerReactionInsets
{
  BOOL v2 = [(CKMessagePartChatItem *)self isFromMe];
  double v3 = 0.0;
  if (v2) {
    double v4 = 90.0;
  }
  else {
    double v4 = 0.0;
  }
  if (v2) {
    double v5 = 0.0;
  }
  else {
    double v5 = 90.0;
  }
  double v6 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (NSArray)transferGUIDs
{
  BOOL v2 = [(CKChatItem *)self IMChatItem];
  double v3 = [v2 transferGUIDs];

  return (NSArray *)v3;
}

- (CKMediaObjectAssetDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    double v4 = [CKMediaObjectAssetDataSource alloc];
    double v5 = [(CKAggregateAttachmentMessagePartChatItem *)self aggregateChatItems];
    double v6 = [(CKChatItem *)self IMChatItem];
    long long v7 = [v6 guid];
    long long v8 = [(CKMediaObjectAssetDataSource *)v4 initWithChatItems:v5 parentChatItemGUID:v7];
    long long v9 = self->_dataSource;
    self->_dataSource = v8;

    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (NSURL)momentShareURL
{
  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    if (self->_hasCheckedForMomentShareURL)
    {
      momentShareURL = 0;
    }
    else
    {
      self->_hasCheckedForMomentShareURL = 1;
      double v4 = [(CKAggregateAttachmentMessagePartChatItem *)self mediaObjects];
      CKMomentShareURLForMediaObjects(v4);
      double v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      double v6 = self->_momentShareURL;
      self->_momentShareURL = v5;

      momentShareURL = self->_momentShareURL;
    }
  }

  return momentShareURL;
}

- (id)pasteboardItemProviders
{
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  double v4 = [(CKAggregateAttachmentMessagePartChatItem *)self aggregateChatItems];
  double v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  double v6 = [(CKAggregateAttachmentMessagePartChatItem *)self aggregateChatItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CKAggregateAttachmentMessagePartChatItem_pasteboardItemProviders__block_invoke;
  v9[3] = &unk_1E5627290;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __67__CKAggregateAttachmentMessagePartChatItem_pasteboardItemProviders__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [a2 pasteboardItemProviders];
  [v2 addObjectsFromArray:v3];
}

- (id)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (NSArray)aggregateChatItems
{
  return self->_aggregateChatItems;
}

- (void)setAggregateChatItems:(id)a3
{
}

- (void)setMediaObjects:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setMomentShareURL:(id)a3
{
}

- (NSArray)aggregatedVisibleAssociatedMessageChatItems
{
  return self->_aggregatedVisibleAssociatedMessageChatItems;
}

- (void)setAggregatedVisibleAssociatedMessageChatItems:(id)a3
{
}

- (NSArray)aggregatedNonTapbackVisibleAssociatedMessageChatItems
{
  return self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems;
}

- (void)setAggregatedNonTapbackVisibleAssociatedMessageChatItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedNonTapbackVisibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_aggregatedVisibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
  objc_storeStrong((id *)&self->_aggregateChatItems, 0);

  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
}

@end