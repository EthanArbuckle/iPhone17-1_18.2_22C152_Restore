@interface IMInlineReplyController
- (BOOL)disableItemInserts;
- (BOOL)hasEarlierMessagesToLoad;
- (BOOL)hasRecentMessagesToLoad;
- (BOOL)isUpdatingChatItems;
- (BOOL)itemMatchesThread:(id)a3;
- (IMChat)chat;
- (IMChatItemRules)chatItemRules;
- (IMInlineReplyController)initWithChat:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5;
- (IMMessage)firstMessage;
- (IMMessage)lastMessage;
- (IMMessageItem)threadOriginator;
- (IMScheduledUpdater)chatItemsUpdater;
- (NSArray)chatItems;
- (NSString)threadIdentifier;
- (id)itemsMatchingThread:(id)a3 guids:(id)a4;
- (void)_itemsDidChange:(id)a3;
- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8;
- (void)_postNotification:(id)a3 userInfo:(id)a4;
- (void)_replaceStaleChatItems;
- (void)_setupChatItemRules;
- (void)_updateChatItemsForChatItemUpdater;
- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4;
- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5;
- (void)dealloc;
- (void)insertHistoricalMessages:(id)a3 queryID:(id)a4 hasMessagesBefore:(BOOL)a5 hasMessagesAfter:(BOOL)a6 isReplacingItems:(BOOL)a7;
- (void)insertItem:(id)a3;
- (void)performActionDisallowingItemInsert:(id)a3;
- (void)removeItem:(id)a3;
- (void)replaceItems:(id)a3;
- (void)setChat:(id)a3;
- (void)setChatItemRules:(id)a3;
- (void)setChatItemsUpdater:(id)a3;
- (void)setDisableItemInserts:(BOOL)a3;
- (void)setHasEarlierMessagesToLoad:(BOOL)a3;
- (void)setHasRecentMessagesToLoad:(BOOL)a3;
- (void)setIsUpdatingChatItems:(BOOL)a3;
- (void)setNeedsUpdateChatItems;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadOriginator:(id)a3;
- (void)updateChatItemsIfNeeded;
@end

@implementation IMInlineReplyController

- (void)dealloc
{
  objc_msgSend_invalidate(self->_chatItemsUpdater, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMInlineReplyController;
  [(IMItemsController *)&v5 dealloc];
}

- (IMInlineReplyController)initWithChat:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IMInlineReplyController;
  v11 = [(IMItemsController *)&v29 init];
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setThreadIdentifier_(v11, v12, (uint64_t)v9, v13);
    objc_msgSend_setThreadOriginator_(v14, v15, (uint64_t)v10, v16);
    objc_msgSend_setChat_(v14, v17, (uint64_t)v8, v18);
    id v19 = objc_alloc(MEMORY[0x1E4F6C3D8]);
    uint64_t v21 = objc_msgSend_initWithTarget_action_(v19, v20, (uint64_t)v14, (uint64_t)sel__updateChatItemsForChatItemUpdater);
    chatItemsUpdater = v14->_chatItemsUpdater;
    v14->_chatItemsUpdater = (IMScheduledUpdater *)v21;

    if (v10)
    {
      uint64_t v26 = objc_msgSend_chatStyle(v8, v23, v24, v25);
      objc_msgSend__handleItem_forChatStyle_(v14, v27, (uint64_t)v10, v26);
    }
    v14->_hasEarlierMessagesToLoad = 0;
    v14->_hasRecentMessagesToLoad = 0;
  }

  return v14;
}

- (IMMessage)firstMessage
{
  v4 = objc_msgSend__firstMessage(self, a2, v2, v3);
  id v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (IMMessage)lastMessage
{
  v4 = objc_msgSend__lastMessage(self, a2, v2, v3);
  id v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (NSArray)chatItems
{
  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    objc_msgSend__setupChatItemRules(self, a2, v2, v3);
    chatItemRules = self->_chatItemRules;
  }

  return (NSArray *)objc_msgSend__chatItems(chatItemRules, a2, v2, v3);
}

- (void)insertHistoricalMessages:(id)a3 queryID:(id)a4 hasMessagesBefore:(BOOL)a5 hasMessagesAfter:(BOOL)a6 isReplacingItems:(BOOL)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = NSNumber;
      uint64_t v19 = objc_msgSend_count(v12, v15, v16, v17);
      v22 = objc_msgSend_numberWithUnsignedInteger_(v18, v20, v19, v21);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[IMInlineReplyController insertHistoricalMessages:queryID:hasMessagesBefore:hasMessagesAfter"
                           ":isReplacingItems:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "%s archivedMessages: %@", buf, 0x16u);
    }
  }
  self->_hasEarlierMessagesToLoad = a5;
  self->_hasRecentMessagesToLoad = a6;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v38 = sub_1A4B345FC;
  v39 = sub_1A4B343E4;
  id v40 = 0;
  id v23 = v12;
  id v40 = v23;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  objc_super v29 = sub_1A4C63E70;
  v30 = &unk_1E5B7F1A8;
  id v24 = v13;
  v32 = self;
  v33 = buf;
  BOOL v34 = a5;
  BOOL v35 = a6;
  BOOL v36 = a7;
  id v31 = v24;
  uint64_t v25 = _Block_copy(&v27);
  objc_msgSend__updateChatItemsWithReason_block_(self, v26, @"history query", (uint64_t)v25, v27, v28, v29, v30);

  _Block_object_dispose(buf, 8);
}

- (void)_itemsDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMInlineReplyController;
  [(IMItemsController *)&v7 _itemsDidChange:a3];
  objc_msgSend_setNeedsUpdate(self->_chatItemsUpdater, v4, v5, v6);
}

- (void)insertItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_itemMatchesThread_(self, v5, (uint64_t)v4, v6))
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend_guid(v4, v11, v12, v13);
        int v21 = 136315394;
        v22 = "-[IMInlineReplyController insertItem:]";
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "%s inserting %@, threadIdentifier matches", (uint8_t *)&v21, 0x16u);
      }
    }
    v15 = objc_msgSend_chat(self, v7, v8, v9);
    uint64_t v19 = objc_msgSend_chatStyle(v15, v16, v17, v18);
    objc_msgSend__handleItem_forChatStyle_(self, v20, (uint64_t)v4, v19);
  }
}

- (void)removeItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_itemMatchesThread_(self, v5, (uint64_t)v4, v6))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = objc_msgSend_guid(v4, v10, v11, v12);
        int v14 = 136315394;
        v15 = "-[IMInlineReplyController removeItem:]";
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "%s removing %@", (uint8_t *)&v14, 0x16u);
      }
    }
    objc_msgSend__removeItem_(self, v7, (uint64_t)v4, v8);
  }
}

- (void)replaceItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v7 = objc_msgSend_itemsMatchingThread_guids_(self, v6, (uint64_t)v4, (uint64_t)v5);
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = objc_msgSend_componentsJoinedByString_(v5, v14, @",", v15);
        int v17 = 136315394;
        uint64_t v18 = "-[IMInlineReplyController replaceItems:]";
        __int16 v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "%s replacing items %@", (uint8_t *)&v17, 0x16u);
      }
    }
    objc_msgSend__replaceItems_(self, v11, (uint64_t)v7, v12);
  }
}

- (BOOL)itemMatchesThread:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_disableItemInserts(self, v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v82 = 136315138;
        v83 = "-[IMInlineReplyController itemMatchesThread:]";
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "%s returning NO, disableItemInserts enabled", (uint8_t *)&v82, 0xCu);
      }
      goto LABEL_33;
    }
LABEL_34:
    BOOL v39 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v8 = v4;
  uint64_t v12 = objc_msgSend_threadIdentifier(v8, v9, v10, v11);
  if (v12)
  {

    goto LABEL_10;
  }
  __int16 v19 = objc_msgSend_guid(v8, v13, v14, v15);
  __int16 v23 = objc_msgSend_threadOriginator(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend_guid(v23, v24, v25, v26);
  char isEqualToString = objc_msgSend_isEqualToString_(v19, v28, (uint64_t)v27, v29);

  if ((isEqualToString & 1) == 0)
  {
LABEL_10:
    id v31 = objc_msgSend_threadIdentifier(self, v16, v17, v18);
    BOOL v35 = objc_msgSend_threadIdentifier(v8, v32, v33, v34);
    char v38 = objc_msgSend_isEqualToString_(v31, v36, (uint64_t)v35, v37);

    if (v38) {
      goto LABEL_11;
    }
    if (IMOSLoggingEnabled())
    {
      v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v47 = objc_msgSend_guid(v8, v44, v45, v46);
        int v82 = 136315394;
        v83 = "-[IMInlineReplyController itemMatchesThread:]";
        __int16 v84 = 2112;
        v85 = v47;
        _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "%s threadIdentifier does not match for item %@", (uint8_t *)&v82, 0x16u);
      }
    }
    v48 = objc_msgSend_threadIdentifier(v8, v40, v41, v42);
    BOOL v49 = v48 == 0;

    if (!v49) {
      goto LABEL_33;
    }
    v53 = objc_msgSend_associatedMessageGUID(v8, v50, v51, v52);
    v57 = objc_msgSend_threadIdentifier(self, v54, v55, v56);
    AssociatedMessageGUIDFromThreadIdentifier = (void *)IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier();

    v62 = IMAssociatedMessageDecodeGUID();
    if (v53)
    {
      v63 = IMAssociatedMessageDecodeGUID();
      if (objc_msgSend_isEqualToString_(v62, v64, (uint64_t)v63, v65)) {
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        v76 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          v80 = objc_msgSend_guid(v8, v77, v78, v79);
          int v82 = 136315906;
          v83 = "-[IMInlineReplyController itemMatchesThread:]";
          __int16 v84 = 2112;
          v85 = v62;
          __int16 v86 = 2112;
          v87 = v63;
          __int16 v88 = 2112;
          v89 = v80;
          _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_INFO, "%s guidFromThreadIdentifier %@ does not match guidFromAssociateMessageGUID %@ for item %@", (uint8_t *)&v82, 0x2Au);
        }
      }
    }
    else
    {
      v63 = objc_msgSend_syndicationRanges(v8, v59, v60, v61);
      if (objc_msgSend_count(v63, v66, v67, v68))
      {
        v72 = objc_msgSend_guid(v8, v69, v70, v71);
        int v75 = objc_msgSend_isEqualToString_(v62, v73, (uint64_t)v72, v74);

        if (v75)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_20;
          }
          v63 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            int v82 = 136315394;
            v83 = "-[IMInlineReplyController itemMatchesThread:]";
            __int16 v84 = 2112;
            v85 = v62;
            _os_log_impl(&dword_1A4AF7000, v63, OS_LOG_TYPE_INFO, "%s guidFromThreadIdentifier %@ is the same as the item given, and it has syndication ranges.", (uint8_t *)&v82, 0x16u);
          }
LABEL_19:

LABEL_20:
          goto LABEL_11;
        }
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }

    goto LABEL_32;
  }
LABEL_11:

  BOOL v39 = 1;
LABEL_35:

  return v39;
}

- (id)itemsMatchingThread:(id)a3 guids:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1A4C64A54;
  v12[3] = &unk_1E5B7F1D0;
  v12[4] = self;
  id v13 = v6;
  id v7 = v6;
  uint64_t v10 = objc_msgSend___imArrayByApplyingBlock_(a3, v8, (uint64_t)v12, v9);

  return v10;
}

- (void)setNeedsUpdateChatItems
{
  objc_msgSend_setNeedsUpdate(self->_chatItemsUpdater, a2, v2, v3);
}

- (void)updateChatItemsIfNeeded
{
}

- (void)performActionDisallowingItemInsert:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_msgSend_setDisableItemInserts_(self, v5, 1, v6);
  v4[2](v4);

  objc_msgSend_setDisableItemInserts_(self, v7, 0, v8);
}

- (void)_updateChatItemsForChatItemUpdater
{
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4
{
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5
{
  BOOL v220 = a5;
  uint64_t v243 = *MEMORY[0x1E4F143B8];
  id v223 = a3;
  v225 = (void (**)(void))a4;
  id v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v7);

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = objc_msgSend_chat(self, v10, v11, v12);
      uint64_t v17 = objc_msgSend_guid(v13, v14, v15, v16);
      *(_DWORD *)buf = 138412546;
      id v240 = v17;
      __int16 v241 = 2112;
      id v242 = v223;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Update chat items (chatGUID: %@), reason: %@", buf, 0x16u);
    }
  }
  v227 = self->_chatItemRules;
  if (self->_isUpdatingChatItems)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Update already in progress, executing update block", buf, 2u);
      }
    }
    v225[2]();
  }
  else
  {
    v229 = self;
    self->_isUpdatingChatItems = 1;
    v225[2]();
    objc_msgSend_setNeedsUpdate_(self->_chatItemsUpdater, v19, 0, v20);
    self->_isUpdatingChatItems = 0;
    if (v227)
    {
      v219 = objc_msgSend__items(self, v21, v22, v23);
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          id v31 = NSNumber;
          uint64_t v32 = objc_msgSend_count(v219, v28, v29, v30);
          BOOL v35 = objc_msgSend_numberWithUnsignedInteger_(v31, v33, v32, v34);
          *(_DWORD *)buf = 138412290;
          id v240 = v35;
          _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "\tIMItem count = %@", buf, 0xCu);
        }
      }
      BOOL v36 = objc_msgSend__chatItems(v227, v24, v25, v26);
      id v40 = objc_msgSend_copy(v36, v37, v38, v39);
      _IMChatItemsReplaceWithChatItemsForItems(v36, v227, v219);
      objc_msgSend__didProcessChatItems_(v227, v41, (uint64_t)v36, v42);
      if (v40)
      {
        id v46 = v40;
      }
      else
      {
        objc_msgSend_array(MEMORY[0x1E4F1CA48], v43, v44, v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
      }
      v228 = v46;

      if (v36)
      {
        id v51 = v36;
      }
      else
      {
        objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v52 = v51;

      v218 = objc_msgSend_differenceFromArray_(v52, v53, (uint64_t)v228, v54);
      id v236 = 0;
      id v237 = 0;
      IMIndexesFromOrderedCollectionDifference(v218, &v237, &v236);
      id v222 = v237;
      id v221 = v236;
      v217 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v55, v56, v57);
      if (objc_msgSend_count(v222, v58, v59, v60))
      {
        v234[0] = MEMORY[0x1E4F143A8];
        v234[1] = 3221225472;
        v234[2] = sub_1A4C65898;
        v234[3] = &unk_1E5B7D978;
        id v235 = v217;
        objc_msgSend_enumerateObjectsAtIndexes_options_usingBlock_(v52, v64, (uint64_t)v222, 0, v234);
      }
      v224 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v61, v62, v63);
      v226 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v65, v66, v67);
      id v68 = objc_alloc(MEMORY[0x1E4F28E60]);
      uint64_t v72 = objc_msgSend_count(v228, v69, v70, v71);
      uint64_t v74 = objc_msgSend_initWithIndexesInRange_(v68, v73, 0, v72);
      id v75 = objc_alloc(MEMORY[0x1E4F28E60]);
      uint64_t v79 = objc_msgSend_count(v52, v76, v77, v78);
      v81 = objc_msgSend_initWithIndexesInRange_(v75, v80, 0, v79);
      objc_msgSend_removeIndexes_(v74, v82, (uint64_t)v221, v83);
      objc_msgSend_removeIndexes_(v81, v84, (uint64_t)v222, v85);
      uint64_t Index = objc_msgSend_firstIndex(v74, v86, v87, v88);
      uint64_t v93 = objc_msgSend_firstIndex(v81, v90, v91, v92);
      if (Index != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v96 = v93;
        if (v93 != 0x7FFFFFFFFFFFFFFFLL)
        {
          do
          {
            v97 = objc_msgSend_objectAtIndex_(v228, v94, Index, v95);
            v102 = objc_msgSend_objectAtIndex_(v52, v98, v96, v99);
            if (v97 != v102)
            {
              objc_msgSend_addIndex_(v226, v100, v96, v101);
              v106 = objc_msgSend__timeAdded(v97, v103, v104, v105);
              objc_msgSend__setTimeAdded_(v102, v107, (uint64_t)v106, v108);
            }
            if (objc_msgSend__shouldReloadChatItem_oldChatItem_(self->_chatItemRules, v100, (uint64_t)v102, (uint64_t)v97))objc_msgSend_addIndex_(v224, v109, v96, v110); {
            uint64_t Index = objc_msgSend_indexGreaterThanIndex_(v74, v109, Index, v110);
            }
            uint64_t v96 = objc_msgSend_indexGreaterThanIndex_(v81, v111, v96, v112);
          }
          while (Index != 0x7FFFFFFFFFFFFFFFLL && v96 != 0x7FFFFFFFFFFFFFFFLL);
        }
      }

      long long v232 = 0u;
      long long v233 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      id v113 = v52;
      uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v114, (uint64_t)&v230, (uint64_t)v238, 16);
      if (v118)
      {
        v119 = 0;
        uint64_t v120 = *(void *)v231;
        do
        {
          for (uint64_t i = 0; i != v118; ++i)
          {
            if (*(void *)v231 != v120) {
              objc_enumerationMutation(v113);
            }
            v122 = objc_msgSend__timeStale(*(void **)(*((void *)&v230 + 1) + 8 * i), v115, v116, v117);
            v125 = v122;
            if (v122)
            {
              v126 = objc_msgSend_earlierDate_(v122, v123, (uint64_t)v119, v124);
              BOOL v127 = v126 == v125;

              if (v127)
              {
                id v128 = v125;

                v119 = v128;
              }
            }
          }
          uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v115, (uint64_t)&v230, (uint64_t)v238, 16);
        }
        while (v118);

        if (v119)
        {
          v132 = objc_msgSend__nextStaleTime(v227, v129, v130, v131);
          char isEqualToDate = objc_msgSend_isEqualToDate_(v119, v133, (uint64_t)v132, v134);

          if ((isEqualToDate & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              v138 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v240 = v119;
                _os_log_impl(&dword_1A4AF7000, v138, OS_LOG_TYPE_INFO, "\tSchedule _replaceStaleChatItems for nextStaleTime:%@", buf, 0xCu);
              }
            }
            objc_msgSend__setNextStaleTime_(v227, v136, (uint64_t)v119, v137);
            objc_msgSend_timeIntervalSinceReferenceDate(v119, v139, v140, v141);
            double v143 = v142;
            objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v144, v145, v146);
            double v151 = v143 - v150;
            double v152 = 0.0;
            if (v151 > 0.0)
            {
              objc_msgSend_timeIntervalSinceReferenceDate(v119, v147, v148, v149);
              double v154 = v153;
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v155, v156, v157);
              double v152 = v154 - v158;
            }
            objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v147, (uint64_t)v229, (uint64_t)sel__replaceStaleChatItems, 0);
            objc_msgSend_performSelector_withObject_afterDelay_(v229, v159, (uint64_t)sel__replaceStaleChatItems, 0, v152);
          }
        }
      }
      else
      {

        v119 = 0;
      }
      if (objc_msgSend_count(v221, v129, v130, v131)
        || objc_msgSend_count(v222, v160, v161, v162)
        || objc_msgSend_count(v224, v163, v164, v165)
        || objc_msgSend_count(v226, v166, v167, v168))
      {
        if (IMOSLoggingEnabled())
        {
          v172 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
          {
            v176 = objc_msgSend_chat(v229, v173, v174, v175);
            v180 = objc_msgSend_chat(v229, v177, v178, v179);
            v184 = objc_msgSend_guid(v180, v181, v182, v183);
            *(_DWORD *)buf = 138412546;
            id v240 = v176;
            __int16 v241 = 2112;
            id v242 = v184;
            _os_log_impl(&dword_1A4AF7000, v172, OS_LOG_TYPE_INFO, "\tchat: %@, guid: %@", buf, 0x16u);
          }
        }
        if (objc_msgSend_count(v222, v169, v170, v171) && IMOSLoggingEnabled())
        {
          v188 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v240 = v222;
            _os_log_impl(&dword_1A4AF7000, v188, OS_LOG_TYPE_INFO, "\tinserted: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend_count(v221, v185, v186, v187) && IMOSLoggingEnabled())
        {
          v192 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v240 = v221;
            _os_log_impl(&dword_1A4AF7000, v192, OS_LOG_TYPE_INFO, "\tremoved: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend_count(v224, v189, v190, v191) && IMOSLoggingEnabled())
        {
          v196 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v240 = v224;
            _os_log_impl(&dword_1A4AF7000, v196, OS_LOG_TYPE_INFO, "\treload: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend_count(v226, v193, v194, v195) && IMOSLoggingEnabled())
        {
          v197 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v240 = v226;
            _os_log_impl(&dword_1A4AF7000, v197, OS_LOG_TYPE_INFO, "\tregenerate: %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v199 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
          {
            v203 = NSNumber;
            uint64_t v204 = objc_msgSend_count(v228, v200, v201, v202);
            v207 = objc_msgSend_numberWithUnsignedInteger_(v203, v205, v204, v206);
            v208 = NSNumber;
            uint64_t v212 = objc_msgSend_count(v113, v209, v210, v211);
            v215 = objc_msgSend_numberWithUnsignedInteger_(v208, v213, v212, v214);
            *(_DWORD *)buf = 138412546;
            id v240 = v207;
            __int16 v241 = 2112;
            id v242 = v215;
            _os_log_impl(&dword_1A4AF7000, v199, OS_LOG_TYPE_INFO, "\toldChatItems: %@, newChatItems: %@", buf, 0x16u);
          }
        }
        if (v220) {
          objc_msgSend__postIMChatItemsDidChangeNotificationWithInserted_removed_reload_regenerate_oldChatItems_newChatItems_(v229, v198, (uint64_t)v222, (uint64_t)v221, v224, v226, v228, v113);
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v216 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v216, OS_LOG_TYPE_INFO, "\tDon't post update, no significant updates to chatItems.", buf, 2u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "ChatItem Rules undefined, skipping update.", buf, 2u);
      }
    }
  }
}

- (void)_replaceStaleChatItems
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "(IMInlineReplyController) _replaceStaleChatItems", buf, 2u);
    }
  }
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v7 = objc_msgSend_chatItems(self, v4, v5, v6);
  uint64_t v9 = 0;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v64, (uint64_t)v70, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend__timeStale(v16, v10, v11, v12);
        if (v20)
        {
          uint64_t v21 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18, v19);
          objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24);
          double v26 = v25;
          objc_msgSend_timeIntervalSinceReferenceDate(v20, v27, v28, v29);
          BOOL v31 = v26 < v30;

          if (!v31)
          {
            BOOL v35 = objc_msgSend__item(v16, v32, v33, v34);
            if (v9 == v35)
            {
              id v36 = v9;
            }
            else
            {
              id v36 = v35;

              uint64_t v9 = objc_msgSend__copy(v36, v37, v38, v39);
              objc_msgSend_addObject_(v59, v40, (uint64_t)v9, v41);
            }

            uint64_t v9 = v36;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v64, (uint64_t)v70, 16);
    }
    while (v13);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v42 = v59;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v60, (uint64_t)v69, 16);
  if (v47)
  {
    uint64_t v48 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(v42);
        }
        uint64_t v50 = *(void *)(*((void *)&v60 + 1) + 8 * j);
        id v51 = objc_msgSend_chat(self, v44, v45, v46);
        uint64_t v55 = objc_msgSend_chatStyle(v51, v52, v53, v54);
        objc_msgSend__handleItem_forChatStyle_(self, v56, v50, v55);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v60, (uint64_t)v69, 16);
    }
    while (v47);
  }

  objc_msgSend__setNextStaleTime_(self->_chatItemRules, v57, 0, v58);
}

- (void)_postNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedRegistry(IMChatRegistry, v8, v9, v10);
  char isFirstLoad = objc_msgSend_isFirstLoad(v11, v12, v13, v14);

  if ((isFirstLoad & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Notification posted: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v20, v21, (uint64_t)v6, (uint64_t)self, v7);
  }
}

- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8
{
  v35[6] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v21 = a8;
  v34[0] = @"__kIMChatItemsInserted";
  uint64_t v22 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v22 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  BOOL v31 = (void *)v22;
  v35[0] = v22;
  v34[1] = @"__kIMChatItemsRemoved";
  uint64_t v23 = (uint64_t)v14;
  if (!v14)
  {
    uint64_t v23 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  double v30 = (void *)v23;
  v35[1] = v23;
  v34[2] = @"__kIMChatItemsReload";
  uint64_t v24 = v15;
  if (!v15)
  {
    uint64_t v24 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  uint64_t v33 = v13;
  v35[2] = v24;
  v34[3] = @"__kIMChatItemsRegenerate";
  double v25 = v16;
  if (!v16)
  {
    double v25 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  v35[3] = v25;
  v34[4] = @"__kIMChatItemsOldItems";
  double v26 = v17;
  if (!v17)
  {
    double v26 = objc_msgSend_array(MEMORY[0x1E4F1C978], v18, v19, v20);
  }
  v35[4] = v26;
  v34[5] = @"__kIMChatItemsNewItems";
  uint64_t v27 = v21;
  if (!v21)
  {
    uint64_t v27 = objc_msgSend_array(MEMORY[0x1E4F1C978], v18, v19, v20);
  }
  v35[5] = v27;
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v35, (uint64_t)v34, 6);
  if (v21)
  {
    if (v17) {
      goto LABEL_15;
    }
LABEL_21:

    if (v16) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }

  if (!v17) {
    goto LABEL_21;
  }
LABEL_15:
  if (v16) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:
  if (v15)
  {
    if (v14) {
      goto LABEL_18;
    }
LABEL_24:

    if (v33) {
      goto LABEL_19;
    }
LABEL_25:

    goto LABEL_19;
  }

  if (!v14) {
    goto LABEL_24;
  }
LABEL_18:
  if (!v33) {
    goto LABEL_25;
  }
LABEL_19:
  objc_msgSend__postNotification_userInfo_(self, v28, @"__kIMInlineReplyChatItemsDidChangeNotification", (uint64_t)v29);
}

- (void)_setupChatItemRules
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_IMCoreSetupTimingCollection(MEMORY[0x1E4F6C3F8], a2, v2, v3);
  objc_msgSend_startTimingForKey_(v5, v6, @"IMInlineReplySetup: Generate chat items", v7);
  id v8 = [IMInlineReplyChatItemRules alloc];
  uint64_t v12 = objc_msgSend_chat(self, v9, v10, v11);
  id v16 = objc_msgSend_threadIdentifier(self, v13, v14, v15);
  uint64_t v18 = (IMChatItemRules *)objc_msgSend_initWithChat_threadIdentifier_(v8, v17, (uint64_t)v12, (uint64_t)v16);
  p_chatItemRules = &self->_chatItemRules;
  chatItemRules = self->_chatItemRules;
  self->_chatItemRules = v18;

  uint64_t v24 = objc_msgSend__items(self, v21, v22, v23);
  double v25 = *p_chatItemRules;
  uint64_t v29 = objc_msgSend__chatItems(v25, v26, v27, v28);
  _IMChatItemsReplaceWithChatItemsForItems(v29, v25, v24);
  objc_msgSend__didProcessChatItems_(v25, v30, (uint64_t)v29, v31);
  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = NSNumber;
      uint64_t v39 = objc_msgSend_count(v29, v35, v36, v37);
      id v42 = objc_msgSend_numberWithUnsignedInteger_(v38, v40, v39, v41);
      int v43 = 136315394;
      uint64_t v44 = "-[IMInlineReplyController _setupChatItemRules]";
      __int16 v45 = 2112;
      uint64_t v46 = v42;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "%s Configuring chatItemRules and chatItems, count: %@", (uint8_t *)&v43, 0x16u);
    }
  }
  objc_msgSend_stopTimingForKey_(v5, v32, @"IMInlineReplySetup: Generate chat items", v33);
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (IMChat)chat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);

  return (IMChat *)WeakRetained;
}

- (void)setChat:(id)a3
{
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (void)setThreadOriginator:(id)a3
{
}

- (BOOL)hasEarlierMessagesToLoad
{
  return self->_hasEarlierMessagesToLoad;
}

- (void)setHasEarlierMessagesToLoad:(BOOL)a3
{
  self->_hasEarlierMessagesToLoad = a3;
}

- (BOOL)hasRecentMessagesToLoad
{
  return self->_hasRecentMessagesToLoad;
}

- (void)setHasRecentMessagesToLoad:(BOOL)a3
{
  self->_hasRecentMessagesToLoad = a3;
}

- (BOOL)disableItemInserts
{
  return self->_disableItemInserts;
}

- (void)setDisableItemInserts:(BOOL)a3
{
  self->_disableItemInserts = a3;
}

- (IMChatItemRules)chatItemRules
{
  return self->_chatItemRules;
}

- (void)setChatItemRules:(id)a3
{
}

- (IMScheduledUpdater)chatItemsUpdater
{
  return self->_chatItemsUpdater;
}

- (void)setChatItemsUpdater:(id)a3
{
}

- (BOOL)isUpdatingChatItems
{
  return self->_isUpdatingChatItems;
}

- (void)setIsUpdatingChatItems:(BOOL)a3
{
  self->_isUpdatingChatItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItemsUpdater, 0);
  objc_storeStrong((id *)&self->_chatItemRules, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_destroyWeak((id *)&self->_chat);

  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end