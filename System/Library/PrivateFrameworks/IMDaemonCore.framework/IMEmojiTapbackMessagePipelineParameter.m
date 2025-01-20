@interface IMEmojiTapbackMessagePipelineParameter
- (IMEmojiTapbackMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (IMEmojiTapbackMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4;
- (NSString)associatedMessageEmoji;
- (id)description;
- (id)messageSummaryInfoDictionaryWithBlastDoorBasicMessage:(id)a3;
- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3;
- (void)setAssociatedMessageEmoji:(id)a3;
@end

@implementation IMEmojiTapbackMessagePipelineParameter

- (IMEmojiTapbackMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMEmojiTapbackMessagePipelineParameter;
  v7 = [(IMAssociatedMessagePipelineParameter *)&v17 initWithBD:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 emojiTapback];

    v10 = [v9 associatedMessageEmoji];
    [(IMEmojiTapbackMessagePipelineParameter *)v7 setAssociatedMessageEmoji:v10];

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v11 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v11];

    v12 = [v9 associatedMessageFallbackHash];
    [(IMAssociatedMessagePipelineParameter *)v7 setAssociatedMessageFallbackHash:v12];

    uint64_t v13 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    v15 = [v9 plainTextBody];
    [(IMTextMessagePipelineParameter *)v7 setPlainTextBody:v15];
  }
  return v7;
}

- (IMEmojiTapbackMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMEmojiTapbackMessagePipelineParameter;
  v7 = [(IMAssociatedMessagePipelineParameter *)&v17 initWithBDBasic:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 emojiTapback];

    v10 = [v9 associatedMessageEmoji];
    [(IMEmojiTapbackMessagePipelineParameter *)v7 setAssociatedMessageEmoji:v10];

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v11 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v11];

    v12 = [v9 associatedMessageFallbackHash];
    [(IMAssociatedMessagePipelineParameter *)v7 setAssociatedMessageFallbackHash:v12];

    uint64_t v13 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    v15 = [v9 plainTextBody];
    [(IMTextMessagePipelineParameter *)v7 setPlainTextBody:v15];
  }
  return v7;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3
{
  id v4 = a3;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v27.receiver = self;
  v27.super_class = (Class)IMEmojiTapbackMessagePipelineParameter;
  id v6 = [(IMTextMessagePipelineParameter *)&v27 messageSummaryInfoDictionaryWithBlastDoorMessage:v4];
  [(__CFDictionary *)Mutable addEntriesFromDictionary:v6];

  v7 = NSNumber;
  v8 = [v4 messageSubType];
  v9 = [v8 emojiTapback];
  v10 = [v9 messageSummaryInfo];
  v11 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v10, "contentType"));

  if (v11) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D640], v11);
  }

  v12 = [v4 messageSubType];
  uint64_t v13 = [v12 emojiTapback];
  uint64_t v14 = [v13 messageSummaryInfo];
  v15 = [v14 summary];

  if (v15) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6A8], v15);
  }

  v16 = [v4 messageSubType];
  objc_super v17 = [v16 emojiTapback];
  v18 = [v17 messageSummaryInfo];
  v19 = [v18 pluginBundleID];

  if (v19) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D670], v19);
  }

  v20 = [v4 messageSubType];
  v21 = [v20 emojiTapback];
  v22 = [v21 messageSummaryInfo];
  v23 = [v22 pluginDisplayName];

  if (v23) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D678], v23);
  }

  if ([(__CFDictionary *)Mutable count]) {
    CFMutableDictionaryRef v24 = Mutable;
  }
  else {
    CFMutableDictionaryRef v24 = 0;
  }
  v25 = v24;

  return v25;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorBasicMessage:(id)a3
{
  id v4 = a3;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v19.receiver = self;
  v19.super_class = (Class)IMEmojiTapbackMessagePipelineParameter;
  id v6 = [(IMTextMessagePipelineParameter *)&v19 messageSummaryInfoDictionaryWithBlastDoorBasicMessage:v4];
  [(__CFDictionary *)Mutable addEntriesFromDictionary:v6];

  v7 = NSNumber;
  v8 = [v4 messageSubType];
  v9 = [v8 emojiTapback];
  v10 = [v9 messageSummaryInfo];
  v11 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v10, "contentType"));

  if (v11) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D640], v11);
  }

  v12 = [v4 messageSubType];
  uint64_t v13 = [v12 emojiTapback];
  uint64_t v14 = [v13 messageSummaryInfo];
  v15 = [v14 summary];

  if (v15) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6A8], v15);
  }

  if ([(__CFDictionary *)Mutable count]) {
    CFMutableDictionaryRef v16 = Mutable;
  }
  else {
    CFMutableDictionaryRef v16 = 0;
  }
  objc_super v17 = v16;

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(IMTextMessagePipelineParameter *)self GUID];
  int64_t v5 = [(IMAssociatedMessagePipelineParameter *)self associatedMessageType];
  id v6 = [(IMTextMessagePipelineParameter *)self associatedMessageGUID];
  v7 = [(IMTextMessagePipelineParameter *)self timestamp];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  v11 = [(IMTextMessagePipelineParameter *)self messageItems];
  v12 = [v3 stringWithFormat:@"<IMEmojiTapbackMessagePipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}", self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count")];

  return v12;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)setAssociatedMessageEmoji:(id)a3
{
}

- (void).cxx_destruct
{
}

@end