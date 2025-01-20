@interface CKPinnedConversationMediaObjectActivityItem
+ (BOOL)_mediaTypeSupportedForPinningPreview:(int)a3;
+ (id)previewImageForMediaObject:(id)a3;
+ (id)previewableMediaObjectFromMessage:(id)a3;
- (BOOL)activityItemAppearsWithAnimation;
- (BOOL)activityItemDisappearsWithAnimation;
- (CKMediaObject)mediaObject;
- (CKPinnedConversationMediaObjectActivityItem)initWithMessage:(id)a3 mediaObject:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6;
- (IMMessage)message;
- (NSString)activityItemIdentifier;
- (NSString)attachedContactItemIdentifier;
- (double)activityItemContentScale;
- (id)activityItemView;
@end

@implementation CKPinnedConversationMediaObjectActivityItem

- (CKPinnedConversationMediaObjectActivityItem)initWithMessage:(id)a3 mediaObject:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationMediaObjectActivityItem;
  v14 = [(CKPinnedConversationMediaObjectActivityItem *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_mediaObject, a4);
    v15->_activityItemContentScale = a5;
    uint64_t v16 = [v13 copy];
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;
  }
  return v15;
}

- (NSString)activityItemIdentifier
{
  return (NSString *)[(IMMessage *)self->_message guid];
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 1;
}

- (id)activityItemView
{
  v2 = [[CKPinnedConversationMediaObjectBubble alloc] initWithMediaObjectActivityItem:self];

  return v2;
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

+ (id)previewableMediaObjectFromMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "__ck_mediaObjects");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "isPreviewable", (void)v20))
        {
          v10 = [v9 transfer];
          uint64_t v11 = [v10 commSafetySensitive];

          if ((unint64_t)(v11 - 1) >= 2)
          {
            if (objc_msgSend(a1, "_mediaTypeSupportedForPinningPreview:", objc_msgSend(v9, "mediaType")))
            {
              id v12 = [v9 transfer];
              int v13 = [v12 isFileDataReady];

              if (v13)
              {
                v14 = [v9 transfer];
                char v15 = [v14 isAdaptiveImageGlyph];

                if ((v15 & 1) == 0)
                {
                  uint64_t v16 = [a1 previewImageForMediaObject:v9];
                  if (v16)
                  {
                    v18 = (void *)v16;
                    id v17 = v9;

                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_16:

  return v17;
}

+ (BOOL)_mediaTypeSupportedForPinningPreview:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

+ (id)previewImageForMediaObject:(id)a3
{
  id v3 = a3;
  id v4 = +[CKUIBehavior sharedBehaviors];
  [v4 previewMaxWidth];
  double v6 = v5;

  uint64_t v7 = [v3 previewForWidth:0 orientation:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 image];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end