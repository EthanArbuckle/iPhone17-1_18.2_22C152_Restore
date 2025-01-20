@interface IMMutableChatContext
+ (id)chatContextForPinnedChat:(id)a3;
- (void)setActiveTelephonyConversationUUID:(id)a3;
- (void)setFilterCategory:(int64_t)a3;
- (void)setIsChatBot:(BOOL)a3;
- (void)setResponded:(BOOL)a3;
- (void)setSendersUnknown:(BOOL)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3;
- (void)setSpam:(BOOL)a3;
@end

@implementation IMMutableChatContext

- (void)setServiceType:(int64_t)a3
{
  self->super._serviceType = a3;
}

- (void)setFilterCategory:(int64_t)a3
{
  self->super._filterCategory = a3;
}

- (void)setSpam:(BOOL)a3
{
  self->super._spam = a3;
}

- (void)setSendersUnknown:(BOOL)a3
{
  self->super._sendersUnknown = a3;
}

- (void)setResponded:(BOOL)a3
{
  self->super._responded = a3;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
}

- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3
{
}

- (void)setIsChatBot:(BOOL)a3
{
  self->super._isChatBot = a3;
}

+ (id)chatContextForPinnedChat:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IMMutableChatContext);
  if (objc_msgSend_isBusinessChat(v3, v5, v6, v7))
  {
    uint64_t v11 = 3;
  }
  else if (objc_msgSend_isSMS(v3, v8, v9, v10))
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 2;
  }
  if (objc_msgSend_isStewieChat(v3, v8, v9, v10)) {
    uint64_t v11 = 4;
  }
  if (objc_msgSend_isStewieSharingChat(v3, v12, v13, v14)) {
    objc_msgSend_setServiceType_(v4, v15, 5, v16);
  }
  else {
    objc_msgSend_setServiceType_(v4, v15, v11, v16);
  }
  objc_msgSend_setFilterCategory_(v4, v17, 0, v18);
  objc_msgSend_setSpam_(v4, v19, 0, v20);
  int hasKnownParticipantsCache = objc_msgSend_hasKnownParticipantsCache(v3, v21, v22, v23);
  objc_msgSend_setSendersUnknown_(v4, v25, hasKnownParticipantsCache ^ 1u, v26);
  uint64_t v30 = objc_msgSend_repliedToChat(v3, v27, v28, v29);
  objc_msgSend_setResponded_(v4, v31, v30, v32);
  v36 = objc_msgSend_conversation(v3, v33, v34, v35);
  v40 = objc_msgSend_UUID(v36, v37, v38, v39);
  objc_msgSend_setActiveTelephonyConversationUUID_(v4, v41, (uint64_t)v40, v42);

  v46 = objc_msgSend_showingEditHistoryForChatItemGUIDs(v3, v43, v44, v45);
  objc_msgSend_setShowingEditHistoryForChatItemGUIDs_(v4, v47, (uint64_t)v46, v48);

  uint64_t isChatBot = objc_msgSend_isChatBot(v3, v49, v50, v51);
  objc_msgSend_setIsChatBot_(v4, v53, isChatBot, v54);

  return v4;
}

@end