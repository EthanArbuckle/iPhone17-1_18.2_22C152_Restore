@interface IMStickerTapbackMessagePipelineParameter
- (BOOL)supportsStickerAttributesInMessageBody;
- (IMStickerTapbackMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (id)description;
- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3;
@end

@implementation IMStickerTapbackMessagePipelineParameter

- (IMStickerTapbackMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMStickerTapbackMessagePipelineParameter;
  v7 = [(IMAssociatedMessagePipelineParameter *)&v18 initWithBD:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 stickerTapback];

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v10 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v10];

    uint64_t v11 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v11, v12);
    v13 = [v9 associatedMessageFallbackHash];
    [(IMAssociatedMessagePipelineParameter *)v7 setAssociatedMessageFallbackHash:v13];

    uint64_t v14 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v14, v15);
    v16 = [v9 plainTextBody];
    [(IMTextMessagePipelineParameter *)v7 setPlainTextBody:v16];
  }
  return v7;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3
{
  id v4 = a3;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v27.receiver = self;
  v27.super_class = (Class)IMStickerTapbackMessagePipelineParameter;
  id v6 = [(IMTextMessagePipelineParameter *)&v27 messageSummaryInfoDictionaryWithBlastDoorMessage:v4];
  [(__CFDictionary *)Mutable addEntriesFromDictionary:v6];

  v7 = NSNumber;
  v8 = [v4 messageSubType];
  v9 = [v8 stickerTapback];
  v10 = [v9 messageSummaryInfo];
  uint64_t v11 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v10, "contentType"));

  if (v11) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D640], v11);
  }

  uint64_t v12 = [v4 messageSubType];
  v13 = [v12 stickerTapback];
  uint64_t v14 = [v13 messageSummaryInfo];
  uint64_t v15 = [v14 summary];

  if (v15) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6A8], v15);
  }

  v16 = [v4 messageSubType];
  v17 = [v16 stickerTapback];
  objc_super v18 = [v17 messageSummaryInfo];
  v19 = [v18 pluginBundleID];

  if (v19) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D670], v19);
  }

  v20 = [v4 messageSubType];
  v21 = [v20 stickerTapback];
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

- (BOOL)supportsStickerAttributesInMessageBody
{
  return 1;
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
  uint64_t v11 = [(IMTextMessagePipelineParameter *)self messageItems];
  uint64_t v12 = [v3 stringWithFormat:@"<IMStickerTapbackMessagePipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}", self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count")];

  return v12;
}

@end