@interface IMStickerMessagePipelineParameter
- (BOOL)supportsStickerAttributesInMessageBody;
- (IMStickerMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (id)description;
@end

@implementation IMStickerMessagePipelineParameter

- (IMStickerMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMStickerMessagePipelineParameter;
  v7 = [(IMAssociatedMessagePipelineParameter *)&v15 initWithBD:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 sticker];

    v10 = [v9 associatedMessageGUID];

    if (v10)
    {
      [(IMAssociatedMessagePipelineParameter *)v7 setAssociatedMessageType:1000];
      v11 = [v9 associatedMessageGUID];
      [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v11];

      uint64_t v12 = [v9 associatedMessageRange];
      -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v12, v13);
    }
  }
  return v7;
}

- (BOOL)supportsStickerAttributesInMessageBody
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMTextMessagePipelineParameter *)self GUID];
  int64_t v5 = [(IMAssociatedMessagePipelineParameter *)self associatedMessageType];
  id v6 = [(IMTextMessagePipelineParameter *)self associatedMessageGUID];
  v7 = [(IMTextMessagePipelineParameter *)self timestamp];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  v11 = [(IMTextMessagePipelineParameter *)self messageItems];
  uint64_t v12 = [v3 stringWithFormat:@"<IMStickerMessagePipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}", self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count")];

  return v12;
}

@end