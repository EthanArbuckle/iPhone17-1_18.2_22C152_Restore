@interface CKStickerDropCommSafetySendContext
+ (id)contextKey;
+ (id)contextWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7;
- (CKComposition)composition;
- (CKMediaObject)mediaObject;
- (CKMessagePartChatItem)parentMessagePartChatItem;
- (CKStickerDropCommSafetySendContext)initWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7;
- (IMSticker)sticker;
- (NSDictionary)messageSummaryInfo;
@end

@implementation CKStickerDropCommSafetySendContext

+ (id)contextKey
{
  return @"CKCommSafetyContextKeyStickerDropSend";
}

+ (id)contextWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[CKStickerDropCommSafetySendContext alloc] initWithSticker:v15 composition:v14 mediaObject:v13 parentMessagePartChatItem:v12 messageSummaryInfo:v11];

  return v16;
}

- (CKStickerDropCommSafetySendContext)initWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKStickerDropCommSafetySendContext;
  v17 = [(CKStickerDropCommSafetySendContext *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sticker, a3);
    objc_storeStrong((id *)&v18->_composition, a4);
    objc_storeStrong((id *)&v18->_mediaObject, a5);
    objc_storeStrong((id *)&v18->_parentMessagePartChatItem, a6);
    objc_storeStrong((id *)&v18->_messageSummaryInfo, a7);
  }

  return v18;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (CKComposition)composition
{
  return self->_composition;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (CKMessagePartChatItem)parentMessagePartChatItem
{
  return self->_parentMessagePartChatItem;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_parentMessagePartChatItem, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_composition, 0);

  objc_storeStrong((id *)&self->_sticker, 0);
}

@end