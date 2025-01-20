@interface IMMessage(CKAdditions)
- (BOOL)__ck_isAcknowledgmentMessage;
- (BOOL)__ck_isEqualToMessageUsingGUID:()CKAdditions;
- (BOOL)__ck_isRemovedAcknowledgmentMessage;
- (CKMutableMessageContext)__ck_context;
- (id)__ck_attachmentPreviewTextForAttachmentAtIndex:()CKAdditions;
- (id)__ck_criticalMessage;
- (id)__ck_downgradedMessage;
- (id)__ck_mediaObjects;
- (id)__ck_previewTextWithChat:()CKAdditions ignorePluginContent:;
- (id)__ck_richCardsPreviewText;
- (id)__ck_service;
- (id)__ck_sosMessage;
- (id)__ck_suggestedReplyPreviewText;
- (id)__ck_undowngradedMessage;
- (uint64_t)__ck_isSMS;
- (uint64_t)__ck_isiMessage;
- (uint64_t)__ck_previewTextWithChat:()CKAdditions;
@end

@implementation IMMessage(CKAdditions)

- (id)__ck_richCardsPreviewText
{
  v1 = [a1 text];
  v2 = objc_msgSend(v1, "__im_richCardsPreviewText");

  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)__ck_suggestedReplyPreviewText
{
  v1 = [a1 text];
  v2 = objc_msgSend(v1, "__im_suggestedReplyPreviewText");

  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)__ck_previewTextWithChat:()CKAdditions ignorePluginContent:
{
  return CKPreviewTextFromMessage(a1, a3, a4);
}

- (BOOL)__ck_isEqualToMessageUsingGUID:()CKAdditions
{
  return a3 && [a1 compare:a3 comparisonType:1] == 0;
}

- (id)__ck_service
{
  if ([a1 wasDowngraded])
  {
    v2 = [MEMORY[0x1E4F6BDB8] smsService];
  }
  else
  {
    v3 = [a1 sender];
    v2 = [v3 service];
  }

  return v2;
}

- (uint64_t)__ck_isiMessage
{
  v1 = objc_msgSend(a1, "__ck_service");
  uint64_t v2 = objc_msgSend(v1, "__ck_isiMessage");

  return v2;
}

- (uint64_t)__ck_isSMS
{
  v1 = objc_msgSend(a1, "__ck_service");
  uint64_t v2 = objc_msgSend(v1, "__ck_isSMS");

  return v2;
}

- (uint64_t)__ck_previewTextWithChat:()CKAdditions
{
  return objc_msgSend(a1, "__ck_previewTextWithChat:ignorePluginContent:", a3, 0);
}

- (id)__ck_attachmentPreviewTextForAttachmentAtIndex:()CKAdditions
{
  v5 = [a1 fileTransferGUIDs];
  if ([v5 count] <= a3) {
    goto LABEL_4;
  }
  v6 = +[CKMediaObjectManager sharedInstance];
  v7 = [v5 objectAtIndexedSubscript:a3];
  v8 = [v6 mediaObjectWithTransferGUID:v7 imMessage:a1];

  if (v8)
  {
    v9 = CKAttachmentSummaryForOneMediaObject(v8);
  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (CKMutableMessageContext)__ck_context
{
  if ([a1 isFromMe])
  {
    uint64_t v2 = +[CKMessageContext selfContext];
  }
  else
  {
    uint64_t v2 = objc_alloc_init(CKMutableMessageContext);
    -[CKMutableMessageContext setSenderUnknown:](v2, "setSenderUnknown:", [a1 isSenderUnknown]);
    v3 = objc_msgSend(a1, "__ck_service");
    v4 = [v3 name];

    [(CKMutableMessageContext *)v2 setServiceName:v4];
    if ((objc_msgSend(a1, "__ck_isiMessage") & 1) == 0) {
      [(CKMutableMessageContext *)v2 setSenderUnauthenticated:1];
    }
  }
  -[CKMutableMessageContext setAudioMessage:](v2, "setAudioMessage:", [a1 isAudioMessage]);

  return v2;
}

- (id)__ck_mediaObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 fileTransferGUIDs];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = +[CKMediaObjectManager sharedInstance];
        v11 = [v10 mediaObjectWithTransferGUID:v9 imMessage:a1];

        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)__ck_downgradedMessage
{
  v1 = objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x80000);
  uint64_t v2 = [v1 _imMessageItem];
  v3 = [v2 service];
  [v2 setOriginalServiceName:v3];

  id v4 = [v2 message];

  return v4;
}

- (id)__ck_undowngradedMessage
{
  v1 = objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") & 0xFFFFFFFFFFF7FFFFLL);

  return v1;
}

- (id)__ck_sosMessage
{
  v1 = objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x8000000000);

  return v1;
}

- (id)__ck_criticalMessage
{
  v1 = objc_msgSend(a1, "_copyWithFlags:", objc_msgSend(a1, "flags") | 0x4000000000);

  return v1;
}

- (BOOL)__ck_isAcknowledgmentMessage
{
  return (unint64_t)([a1 associatedMessageType] - 2000) < 6;
}

- (BOOL)__ck_isRemovedAcknowledgmentMessage
{
  return (unint64_t)([a1 associatedMessageType] - 3000) < 6;
}

@end