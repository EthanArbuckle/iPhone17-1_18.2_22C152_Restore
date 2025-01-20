@interface IMInlineReplyChatItemRules
- (BOOL)_hasEarlierMessagesToLoad;
- (BOOL)_hasRecentMessagesToLoad;
- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5;
- (BOOL)_shouldAppendReplyCountIfNeeded;
- (BOOL)_shouldAppendServiceForChat:(id)a3 item:(id)a4 previousItem:(id)a5 chatStyle:(unsigned __int8)a6;
- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4;
- (BOOL)_supportsContiguousChatItems;
- (IMInlineReplyChatItemRules)initWithChat:(id)a3 threadIdentifier:(id)a4;
- (NSString)threadIdentifier;
- (NSString)threadOriginatorMessageGUID;
- (_NSRange)threadOriginatorRange;
- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 messageItem:(id)a4;
- (id)_filteredChatItemsForNewChatItems:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadOriginatorMessageGUID:(id)a3;
- (void)setThreadOriginatorRange:(_NSRange)a3;
@end

@implementation IMInlineReplyChatItemRules

- (IMInlineReplyChatItemRules)initWithChat:(id)a3 threadIdentifier:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMInlineReplyChatItemRules;
  v7 = [(IMTranscriptChatItemRules *)&v17 _initWithChat:a3];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setThreadIdentifier_(v7, v8, (uint64_t)v6, v9);
    v11 = IMMessageThreadIdentifierGetOriginatorGUID();
    objc_msgSend_setThreadOriginatorMessageGUID_(v10, v12, (uint64_t)v11, v13);

    uint64_t OriginatorRange = IMMessageThreadIdentifierGetOriginatorRange();
    objc_msgSend_setThreadOriginatorRange_(v10, v15, OriginatorRange, (uint64_t)v15);
  }

  return v10;
}

- (BOOL)_supportsContiguousChatItems
{
  return 1;
}

- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 messageItem:(id)a4
{
  id v4 = a3;

  return v4;
}

- (BOOL)_hasEarlierMessagesToLoad
{
  v5 = objc_msgSend_inlineReplyController(self, a2, v2, v3);

  if (!v5) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_inlineReplyController(self, v6, v7, v8);
  char hasEarlierMessagesToLoad = objc_msgSend_hasEarlierMessagesToLoad(v9, v10, v11, v12);

  return hasEarlierMessagesToLoad;
}

- (BOOL)_hasRecentMessagesToLoad
{
  v5 = objc_msgSend_inlineReplyController(self, a2, v2, v3);

  if (!v5) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_inlineReplyController(self, v6, v7, v8);
  char hasRecentMessagesToLoad = objc_msgSend_hasRecentMessagesToLoad(v9, v10, v11, v12);

  return hasRecentMessagesToLoad;
}

- (id)_filteredChatItemsForNewChatItems:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4BCD55C;
  aBlock[3] = &unk_1E5B7D218;
  aBlock[4] = self;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v4;
    id v6 = v4;
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
    v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v15 = v6;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v50, (uint64_t)v56, 16);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      uint64_t v42 = *(void *)v51;
      id v43 = v15;
      do
      {
        uint64_t v20 = 0;
        uint64_t v44 = v18;
        do
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
          v24 = v5[2](v5, v21);
          if (v24)
          {
            objc_msgSend_addObject_(v14, v22, (uint64_t)v24, v23);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v25 = v21;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v45 = v25;
              v29 = objc_msgSend_aggregateAttachmentParts(v25, v26, v27, v28);
              uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v46, (uint64_t)v55, 16);
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v47;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v47 != v33) {
                      objc_enumerationMutation(v29);
                    }
                    v37 = v5[2](v5, *(void **)(*((void *)&v46 + 1) + 8 * i));
                    if (v37) {
                      objc_msgSend_addObject_(v14, v35, (uint64_t)v37, v36);
                    }
                  }
                  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v38, (uint64_t)&v46, (uint64_t)v55, 16);
                }
                while (v32);
              }

              uint64_t v19 = v42;
              id v15 = v43;
              uint64_t v18 = v44;
            }
          }

          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v39, (uint64_t)&v50, (uint64_t)v56, 16);
      }
      while (v18);
    }

    id v4 = v41;
  }
  else
  {
    v14 = v5[2](v5, v4);
  }

  return v14;
}

- (BOOL)_shouldAppendServiceForChat:(id)a3 item:(id)a4 previousItem:(id)a5 chatStyle:(unsigned __int8)a6
{
  return 0;
}

- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4
{
  return 0;
}

- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  return 0;
}

- (BOOL)_shouldAppendReplyCountIfNeeded
{
  return 0;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSString)threadOriginatorMessageGUID
{
  return self->_threadOriginatorMessageGUID;
}

- (void)setThreadOriginatorMessageGUID:(id)a3
{
}

- (_NSRange)threadOriginatorRange
{
  p_threaduint64_t OriginatorRange = &self->_threadOriginatorRange;
  NSUInteger location = self->_threadOriginatorRange.location;
  NSUInteger length = p_threadOriginatorRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setThreadOriginatorRange:(_NSRange)a3
{
  self->_threaduint64_t OriginatorRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadOriginatorMessageGUID, 0);

  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end