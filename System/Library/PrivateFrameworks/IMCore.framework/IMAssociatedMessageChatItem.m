@interface IMAssociatedMessageChatItem
- (BOOL)failed;
- (BOOL)isEmojiSticker;
- (BOOL)isFromMe;
- (BOOL)isReaction;
- (BOOL)parentMessageIsFromMe;
- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor;
- (IMEmojiSticker)emojiSticker;
- (IMHandle)sender;
- (IMTapback)tapback;
- (NSDate)time;
- (NSDictionary)messageSummaryInfo;
- (NSString)associatedMessageEmoji;
- (NSString)associatedMessageGUID;
- (_NSRange)associatedMessageRange;
- (id)_initWithItem:(id)a3 sender:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)message;
- (int64_t)associatedMessageType;
- (unint64_t)stickerEffectType;
- (unint64_t)stickerPositionVersion;
- (void)_setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3;
- (void)_setParentMessageIsFromMe:(BOOL)a3;
- (void)setEmojiSticker:(id)a3;
- (void)setIsReaction:(BOOL)a3;
- (void)setStickerEffectType:(unint64_t)a3;
- (void)setTapback:(id)a3;
@end

@implementation IMAssociatedMessageChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IMAssociatedMessageChatItem alloc];
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_sender(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend__initWithItem_sender_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  long long v16 = *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth;
  long long v15 = *(_OWORD *)&self->_geometryDescriptor.yScalar;
  long long v17 = *(_OWORD *)&self->_geometryDescriptor.layoutIntent;
  *(double *)(v14 + 152) = self->_geometryDescriptor.rotation;
  *(_OWORD *)(v14 + 104) = v17;
  *(_OWORD *)(v14 + 120) = v16;
  *(_OWORD *)(v14 + 136) = v15;
  objc_storeStrong((id *)(v14 + 64), self->_sender);
  objc_storeStrong((id *)(v14 + 72), self->_tapback);
  objc_storeStrong((id *)(v14 + 80), self->_emojiSticker);
  return (id)v14;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13 = (id *)objc_msgSend__initWithItem_(self, v8, (uint64_t)v6, v9);
  if (v13)
  {
    uint64_t v14 = objc_msgSend_guid(v6, v10, v11, v12);
    long long v15 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v13, v16, (uint64_t)v15, v17);
    objc_storeStrong(v13 + 8, a4);
  }
  return v13;
}

- (id)message
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_message(v4, v5, v6, v7);

  return v8;
}

- (NSDate)time
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_time(v4, v5, v6, v7);

  return (NSDate *)v8;
}

- (BOOL)isFromMe
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (NSString)associatedMessageGUID
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  char v8 = objc_msgSend_associatedMessageGUID(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (int64_t)associatedMessageType
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_associatedMessageType(v4, v5, v6, v7);

  return v8;
}

- (_NSRange)associatedMessageRange
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_associatedMessageRange(v4, v5, v6, v7);
  NSUInteger v10 = v9;

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (NSString)associatedMessageEmoji
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_associatedMessageEmoji(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (BOOL)failed
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_errorCode(v4, v5, v6, v7) != 0;

  return v8;
}

- (NSDictionary)messageSummaryInfo
{
  v4 = objc_msgSend__imAssociatedMessageItem(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_messageSummaryInfo(v4, v5, v6, v7);

  return (NSDictionary *)v8;
}

- (void)_setParentMessageIsFromMe:(BOOL)a3
{
  self->_parentMessageIsFromMe = a3;
}

- (void)_setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  long long v4 = *(_OWORD *)&a3->parentPreviewWidth;
  long long v3 = *(_OWORD *)&a3->yScalar;
  long long v5 = *(_OWORD *)&a3->layoutIntent;
  self->_geometryDescriptor.rotation = a3->rotation;
  *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth = v4;
  *(_OWORD *)&self->_geometryDescriptor.yScalar = v3;
  *(_OWORD *)&self->_geometryDescriptor.layoutIntent = v5;
}

- (void)setTapback:(id)a3
{
}

- (void)setEmojiSticker:(id)a3
{
}

- (BOOL)isEmojiSticker
{
  return self->_emojiSticker != 0;
}

- (BOOL)parentMessageIsFromMe
{
  return self->_parentMessageIsFromMe;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  long long v3 = *(_OWORD *)&self[2].associatedLayoutIntent;
  *(_OWORD *)&retstr->layoutIntent = *(_OWORD *)&self[1].rotation;
  *(_OWORD *)&retstr->parentPreviewWidth = v3;
  *(_OWORD *)&retstr->yScalar = *(_OWORD *)&self[2].xScalar;
  retstr->rotation = self[2].scale;
  return self;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMTapback)tapback
{
  return self->_tapback;
}

- (IMEmojiSticker)emojiSticker
{
  return self->_emojiSticker;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

- (void)setIsReaction:(BOOL)a3
{
  self->_isReaction = a3;
}

- (unint64_t)stickerPositionVersion
{
  return self->_stickerPositionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSticker, 0);
  objc_storeStrong((id *)&self->_tapback, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end