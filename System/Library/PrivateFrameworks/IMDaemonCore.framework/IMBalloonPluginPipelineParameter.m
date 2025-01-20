@interface IMBalloonPluginPipelineParameter
+ (id)logger;
- (IMBalloonPluginPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (NSData)balloonPluginPayload;
- (NSDictionary)combinedPayloadAttachmentDictionary;
- (NSString)balloonPluginBundleID;
- (_NSRange)associatedMessageRange;
- (int64_t)associatedMessageType;
- (void)setAssociatedMessageRange:(_NSRange)a3;
- (void)setAssociatedMessageType:(int64_t)a3;
- (void)setBalloonPluginBundleID:(id)a3;
- (void)setBalloonPluginPayload:(id)a3;
- (void)setCombinedPayloadAttachmentDictionary:(id)a3;
@end

@implementation IMBalloonPluginPipelineParameter

+ (id)logger
{
  if (qword_1EBE2BB70 != -1) {
    dispatch_once(&qword_1EBE2BB70, &unk_1F3391520);
  }
  v2 = (void *)qword_1EBE2BB60;

  return v2;
}

- (IMBalloonPluginPipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IMBalloonPluginPipelineParameter;
  v7 = [(IMTextMessagePipelineParameter *)&v44 initWithBD:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 balloonPlugin];

    v10 = [v9 payload];
    uint64_t v11 = [v10 type];

    switch(v11)
    {
      case 0:
        v12 = [v9 payload];
        uint64_t v13 = [v12 messagesAppBalloon];
        goto LABEL_12;
      case 1:
        v12 = [v9 payload];
        uint64_t v13 = [v12 handwriting];
        goto LABEL_12;
      case 2:
        v12 = [v9 payload];
        uint64_t v13 = [v12 linkPresentation];
        goto LABEL_12;
      case 3:
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v17 = [v9 payload];
        v12 = [v17 combinedPluginAttachmentInfo];

        v18 = [v12 ownerID];
        if (v18)
        {
          CFDictionarySetValue(Mutable, @"o", v18);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1D9903230();
        }

        v20 = [v12 signature];
        if (v20)
        {
          CFDictionarySetValue(Mutable, @"s", v20);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1D99031A8();
        }

        v21 = [v12 attachmentURL];
        v22 = [v21 absoluteString];

        if (v22)
        {
          CFDictionarySetValue(Mutable, @"r", v22);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1D9903120();
        }

        v23 = [v12 encryptionKey];
        if (v23)
        {
          CFDictionarySetValue(Mutable, @"e", v23);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1D9903098();
        }

        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject expectedFileSize](v12, "expectedFileSize"));
        if (v24)
        {
          CFDictionarySetValue(Mutable, @"f", v24);
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sub_1D9903010();
        }

        goto LABEL_32;
      case 4:
        v12 = [v9 payload];
        uint64_t v13 = [v12 digitalTouchBalloon];
LABEL_12:
        v19 = (void *)v13;
        Mutable = 0;
        break;
      default:
        v12 = +[IMBalloonPluginPipelineParameter logger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v9 payload];
          uint64_t v15 = [v14 type];
          *(_DWORD *)buf = 134217984;
          uint64_t v46 = v15;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to handle unknown payload type (type: %tu).", buf, 0xCu);
        }
        Mutable = 0;
LABEL_32:
        v19 = 0;
        break;
    }

    v25 = [v9 attachments];
    v26 = [v25 contents];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      v43 = +[IMDFileTransferCenter sharedInstance];
      v28 = [v9 attachments];
      v29 = [v6 metadata];
      [v29 messageGUID];
      v30 = v7;
      v31 = v9;
      v32 = v19;
      id v33 = v6;
      v35 = v34 = Mutable;
      v36 = [v35 UUIDString];
      v37 = [v43 guidsForStoredAttachmentBlastDoorPayloadData:v28 messageGUID:v36];

      Mutable = v34;
      id v6 = v33;
      v19 = v32;
      v9 = v31;
      v7 = v30;

      [(IMTextMessagePipelineParameter *)v30 setFileTransferGUIDs:v37];
    }
    -[IMTextMessagePipelineParameter setExpirable:](v7, "setExpirable:", [v9 isExpirable]);
    v38 = [v9 bundleID];
    [(IMBalloonPluginPipelineParameter *)v7 setBalloonPluginBundleID:v38];

    [(IMBalloonPluginPipelineParameter *)v7 setBalloonPluginPayload:v19];
    [(IMBalloonPluginPipelineParameter *)v7 setCombinedPayloadAttachmentDictionary:Mutable];
    -[IMBalloonPluginPipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v39 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v39];

    uint64_t v40 = [v9 associatedMessageRange];
    -[IMBalloonPluginPipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v40, v41);
  }
  return v7;
}

- (NSString)balloonPluginBundleID
{
  return self->_balloonPluginBundleID;
}

- (void)setBalloonPluginBundleID:(id)a3
{
}

- (NSData)balloonPluginPayload
{
  return self->_balloonPluginPayload;
}

- (void)setBalloonPluginPayload:(id)a3
{
}

- (NSDictionary)combinedPayloadAttachmentDictionary
{
  return self->_combinedPayloadAttachmentDictionary;
}

- (void)setCombinedPayloadAttachmentDictionary:(id)a3
{
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (_NSRange)associatedMessageRange
{
  p_associatedMessageRange = &self->_associatedMessageRange;
  NSUInteger location = self->_associatedMessageRange.location;
  NSUInteger length = p_associatedMessageRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedPayloadAttachmentDictionary, 0);
  objc_storeStrong((id *)&self->_balloonPluginPayload, 0);

  objc_storeStrong((id *)&self->_balloonPluginBundleID, 0);
}

@end