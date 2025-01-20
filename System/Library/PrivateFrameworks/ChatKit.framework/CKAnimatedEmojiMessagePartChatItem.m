@interface CKAnimatedEmojiMessagePartChatItem
- (CKAnimatedEmojiMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4;
@end

@implementation CKAnimatedEmojiMessagePartChatItem

- (CKAnimatedEmojiMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKAnimatedEmojiMessagePartChatItem;
  v7 = [(CKAttachmentMessagePartChatItem *)&v17 initWithIMChatItem:v6 maxWidth:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(CKAttachmentMessagePartChatItem *)v7 mediaObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && [v9 needsAnimation])
    {
      v10 = [v6 message];
      v11 = objc_msgSend(v10, "__ck_context");
      v12 = (void *)[v11 mutableCopy];

      if (([v6 isFromMe] & 1) == 0) {
        objc_msgSend(v12, "setSpam:", objc_msgSend(v6, "parentChatIsSpam"));
      }
      v13 = [CKAnimatedEmojiMediaObject alloc];
      v14 = [v9 transfer];
      uint64_t v15 = [(CKAnimatedImageMediaObject *)v13 initWithTransfer:v14 context:v12 forceInlinePreview:0];

      [(CKAttachmentMessagePartChatItem *)v8 setMediaObject:v15];
      v9 = (void *)v15;
    }
  }
  return v8;
}

@end