@interface IMItemsController
+ (id)_charactersToIgnoreWhenParsingTextContent;
- (BOOL)_isSentMessage:(id)a3;
- (BOOL)_trimIfNeeded;
- (BOOL)isMoreToLoad;
- (IMItemsController)init;
- (IMMessageItem)lastIncomingFinishedMessageItem;
- (NSArray)_items;
- (__CFArray)items;
- (id)_appendArchivedItemsToItemsArray:(id)a3;
- (id)_firstMessage;
- (id)_initWithItems:(id)a3;
- (id)_itemForGUID:(id)a3;
- (id)_lastFinishedMessage;
- (id)_lastIncomingFinishedMessageItemWithTextContent;
- (id)_lastIncomingMessage;
- (id)_lastInterworkedMessage;
- (id)_lastMessage;
- (id)_lastMessageItemMatchingCriteria:(id)a3;
- (id)_lastMessageItemWithService:(id)a3;
- (id)_lastMessageItemWithServiceCapability:(id)a3;
- (id)_lastPendingSatelliteSendMessage;
- (id)_lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3;
- (id)_lastSentMessage;
- (id)_sentMessagesSinceInterworking;
- (id)_typingMessage;
- (unint64_t)_indexOfItem:(id)a3;
- (unint64_t)capacity;
- (void)_didReplaceItem:(__CFArray *)a3 oldItem:(id)a4 idx:(int64_t)a5;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5;
- (void)_mergeItems:(id)a3;
- (void)_removeAllItems;
- (void)_removeItem:(id)a3;
- (void)_replaceAndSortItemsWithUnsortedItems:(id)a3;
- (void)_replaceItems:(id)a3;
- (void)_replaceItems:(id)a3 skipCallToItemsDidChange:(BOOL)a4;
- (void)_replaceStaleTypingMessage;
- (void)_resortItems;
- (void)_setSortID:(id)a3;
- (void)assignSortIDsToItems:(id)a3;
- (void)assignSortIDsToItems:(id)a3 shouldRecalculateSortIDForAllMessages:(BOOL)a4;
- (void)dealloc;
- (void)setCapacity:(unint64_t)a3;
- (void)setItems:(__CFArray *)a3;
@end

@implementation IMItemsController

- (void)setCapacity:(unint64_t)a3
{
  if (self->_capacity != a3)
  {
    self->_capacity = a3;
    if (objc_msgSend__trimIfNeeded(self, a2, a3, v3))
    {
      items = self->_items;
      objc_msgSend__itemsDidChange_(self, v5, (uint64_t)items, v6);
    }
  }
}

- (BOOL)_trimIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  items = self->_items;
  unint64_t Count = CFArrayGetCount(items);
  unint64_t v5 = self->_capacity + 5;
  if (Count > v5)
  {
    v19.location = 0;
    v19.length = Count - v5;
    CFArrayReplaceValues(items, v19, 0, 0);
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, Count, v8);
        v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v10, v5, v11);
        int v14 = 138412546;
        v15 = v9;
        __int16 v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "We are trimming items as our count (count: %@) is over the maxCapacity (maxCapacity: %@)", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  return Count > v5;
}

- (id)_initWithItems:(id)a3
{
  CFArrayRef v4 = (const __CFArray *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IMItemsController;
  unint64_t v5 = [(IMItemsController *)&v10 init];
  if (v5)
  {
    if (v4) {
      CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v4);
    }
    else {
      CFArrayRef MutableCopy = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    }
    v5->_items = MutableCopy;
    v5->_capacity = CFArrayGetCount(MutableCopy);
    objc_msgSend_assignSortIDsToItems_(v5, v7, (uint64_t)v4, v8);
  }

  return v5;
}

- (void)assignSortIDsToItems:(id)a3 shouldRecalculateSortIDForAllMessages:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend_count(v6, v7, v8, v9) != 1)
  {
    id v16 = v6;
    CFRange v19 = v16;
    id v39 = v6;
    if (v4)
    {
      uint64_t v20 = objc_msgSend_sortedArrayUsingComparator_(v16, v17, (uint64_t)&unk_1EF8E51F8, v18);

      CFRange v19 = (void *)v20;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v21 = v19;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v40, (uint64_t)v44, 16);
    if (!v23)
    {
LABEL_20:

      id v6 = v39;
      goto LABEL_21;
    }
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v41;
    uint64_t v29 = 1;
LABEL_7:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v41 != v28) {
        objc_enumerationMutation(v21);
      }
      v31 = *(void **)(*((void *)&v40 + 1) + 8 * v30);
      int v35 = 0;
      if (objc_msgSend__shouldPinUnsentMessagesToBottom(self, v24, v25, v26) && !v4) {
        int v35 = objc_msgSend_unsentIsFromMeItem(v31, v32, v33, v34);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((objc_msgSend_isTypingMessage(v31, v36, v37, v38) | v35)) {
          goto LABEL_17;
        }
      }
      else if (v35)
      {
LABEL_17:
        objc_msgSend_setSortID_(v31, v36, 0, v38);
        goto LABEL_18;
      }
      objc_msgSend_setSortID_(v31, v36, v29++, v38);
LABEL_18:
      if (v27 == ++v30)
      {
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v40, (uint64_t)v44, 16);
        if (!v27) {
          goto LABEL_20;
        }
        goto LABEL_7;
      }
    }
  }
  v13 = objc_msgSend_firstObject(v6, v10, v11, v12);
  objc_msgSend_setSortID_(v13, v14, 1, v15);

LABEL_21:
}

- (void)assignSortIDsToItems:(id)a3
{
}

- (id)_lastFinishedMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_8:
    unint64_t v5 = 0;
  }
  else
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      unint64_t v5 = CFArrayGetValueAtIndex(items, v4 - 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend_isTypingMessage(v5, v6, v7, v8) & 1) == 0
        && (objc_msgSend_isSuggestedActionResponse(v5, v9, v10, v11) & 1) == 0
        && (objc_msgSend_isLastMessageCandidate(v5, v12, v13, v14) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_8;
      }
    }
  }

  return v5;
}

- (NSArray)_items
{
  return (NSArray *)self->_items;
}

- (id)_lastMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_6:
    unint64_t v5 = 0;
  }
  else
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      unint64_t v5 = CFArrayGetValueAtIndex(items, v4 - 2);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isLastMessageCandidate(v5, v6, v7, v8)) {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_6;
      }
    }
  }

  return v5;
}

- (IMItemsController)init
{
  return (IMItemsController *)((uint64_t (*)(IMItemsController *, char *, void))MEMORY[0x1F4181798])(self, sel__initWithItems_, 0);
}

- (void)dealloc
{
  items = self->_items;
  if (items) {
    CFRelease(items);
  }
  v4.receiver = self;
  v4.super_class = (Class)IMItemsController;
  [(IMItemsController *)&v4 dealloc];
}

- (BOOL)isMoreToLoad
{
  unint64_t capacity = self->_capacity;
  return capacity <= CFArrayGetCount(self->_items);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4
{
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  items = self->_items;
  uint64_t v9 = _IMItemsControllerGetTypingMessage(items);
  id v60 = v7;
  objc_opt_class();
  BOOL v13 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_associatedMessageType(v60, v10, v11, v12) == 3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char hasEditedParts = objc_msgSend_hasEditedParts(v60, v14, v15, v16);
  }
  else {
    char hasEditedParts = 0;
  }
  _IMItemsControllerHandleItem(self, items, v60, v13 | hasEditedParts, 1, v5);
  uint64_t v20 = _IMItemsControllerGetTypingMessage(items);
  if (v9 != v20)
  {
    if (v9) {
      objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v18, (uint64_t)self, (uint64_t)sel__replaceStaleTypingMessage, 0);
    }
    if (v20)
    {
      double v21 = _IMTypingMessageTimeout();
      uint64_t v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24);
      objc_msgSend_timeIntervalSinceReferenceDate(v25, v26, v27, v28);
      double v30 = v29;
      uint64_t v34 = objc_msgSend_time(v20, v31, v32, v33);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37);
      double v39 = v21 - (v30 - v38) + 1.0;
      double v40 = 0.0;
      if (v39 >= 0.0)
      {
        double v41 = _IMTypingMessageTimeout();
        uint64_t v45 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v42, v43, v44);
        objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48);
        double v50 = v49;
        v54 = objc_msgSend_time(v20, v51, v52, v53);
        objc_msgSend_timeIntervalSinceReferenceDate(v54, v55, v56, v57);
        double v40 = v41 - (v50 - v58) + 1.0;
      }
      objc_msgSend_performSelector_withObject_afterDelay_(self, v59, (uint64_t)sel__replaceStaleTypingMessage, 0, v40);
    }
  }
  objc_msgSend__itemsDidChange_(self, v18, (uint64_t)items, v19);
}

- (void)_removeItem:(id)a3
{
  items = self->_items;
  CFIndex v5 = _IMItemsControllerIndexOfExistingItem(items, a3, 0);
  if (v5 != -1)
  {
    CFArrayRemoveValueAtIndex(items, v5);
    objc_msgSend__itemsDidChange_(self, v6, (uint64_t)items, v7);
  }
}

- (void)_replaceItems:(id)a3 skipCallToItemsDidChange:(BOOL)a4
{
  id v17 = a3;
  items = self->_items;
  _IMItemsControllerReplaceItems(self, items, v17);
  unint64_t capacity = self->_capacity;
  if (capacity <= objc_msgSend_count(v17, v8, v9, v10)) {
    unint64_t v14 = objc_msgSend_count(v17, v11, v12, v13);
  }
  else {
    unint64_t v14 = self->_capacity;
  }
  self->_unint64_t capacity = v14;
  objc_msgSend_assignSortIDsToItems_(self, v11, (uint64_t)items, v13);
  if (!a4) {
    objc_msgSend__itemsDidChange_(self, v15, (uint64_t)items, v16);
  }
}

- (void)_replaceItems:(id)a3
{
}

- (void)_replaceAndSortItemsWithUnsortedItems:(id)a3
{
  CFArrayRef v10 = (const __CFArray *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
  if ((unint64_t)objc_msgSend_count(v10, v5, v6, v7) >= 2) {
    _IMItemsControllerSortItems(v10);
  }
  objc_msgSend__replaceItems_(self, v8, (uint64_t)v10, v9);
}

- (void)_removeAllItems
{
  items = self->_items;
  CFArrayRemoveAllValues(items);

  objc_msgSend__itemsDidChange_(self, v4, (uint64_t)items, v5);
}

- (void)_replaceStaleTypingMessage
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  items = self->_items;
  objc_super v4 = _IMItemsControllerGetTypingMessage(items);
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Replacing stale typing indicator: %@)", (uint8_t *)&v8, 0xCu);
      }
    }
    _IMItemsControllerHandleItem(self, items, v4, 0, 0, 0);
    objc_msgSend__itemsDidChange_(self, v6, (uint64_t)items, v7);
  }
}

- (void)_resortItems
{
  CFIndex Count = CFArrayGetCount(self->_items);
  CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, Count, self->_items);
  _IMItemsControllerSortItems(MutableCopy);
  objc_msgSend__replaceItems_(self, v5, (uint64_t)MutableCopy, v6);

  CFRelease(MutableCopy);
}

- (void)_setSortID:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  uint64_t v6 = objc_msgSend__items(self, v3, v4, v5);
  objc_msgSend_lastObject(v6, v7, v8, v9);
  v110 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isTypingMessage(v110, v10, v11, v12)) {
    int v107 = objc_msgSend_isFromMe(v110, v13, v14, v15) ^ 1;
  }
  else {
    int v107 = 0;
  }
  objc_opt_class();
  BOOL v19 = (objc_opt_isKindOfClass() & 1) != 0
     && (objc_msgSend_isTypingMessage(v110, v16, v17, v18) & 1) == 0
     && objc_msgSend_sortID(v110, v16, v17, v18) == 0;
  if ((v107 | v19) == 1 && (objc_msgSend__shouldPinUnsentMessagesToBottom(self, v16, v17, v18) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = @"NO";
        if (v107) {
          uint64_t v25 = @"YES";
        }
        else {
          uint64_t v25 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v122 = v25;
        __int16 v123 = 2112;
        if (v19) {
          uint64_t v24 = @"YES";
        }
        uint64_t v124 = (uint64_t)v24;
        __int16 v125 = 2112;
        v126 = v110;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Setting the sort ID from item before the last item -- lastItemIsTypingMessage %@ lastItemIsErrorCase %@ Last item %@", buf, 0x20u);
      }
    }
    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        double v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "*** ---- Trying to fix a bad sort ID -- Printing All Items -- Please file a radar ---- ***", buf, 2u);
        }
      }
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      double v30 = objc_msgSend__items(self, v26, v27, v28);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v115, (uint64_t)v120, 16);
      if (v32)
      {
        uint64_t v33 = *(void *)v116;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v116 != v33) {
              objc_enumerationMutation(v30);
            }
            int v35 = *(__CFString **)(*((void *)&v115 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              uint64_t v37 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v122 = v35;
                _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "\t\t%@", buf, 0xCu);
              }
            }
          }
          uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v36, (uint64_t)&v115, (uint64_t)v120, 16);
        }
        while (v32);
      }
    }
    double v38 = objc_msgSend__items(self, v20, v21, v22);
    unint64_t v42 = objc_msgSend_count(v38, v39, v40, v41);

    BOOL v43 = v42 >= 2;
    uint64_t v44 = v42 - 2;
    if (v43)
    {
      uint64_t v45 = objc_msgSend__items(self, v16, v17, v18);
      uint64_t v48 = objc_msgSend_objectAtIndex_(v45, v46, v44, v47);

      v110 = (__CFString *)v48;
    }
  }
  if (objc_msgSend__shouldPinUnsentMessagesToBottom(self, v16, v17, v18))
  {
    if (objc_msgSend_unsentIsFromMeItem(v109, v49, v50, v51)) {
      goto LABEL_55;
    }
    uint64_t v55 = objc_msgSend_sortID(v110, v52, v53, v54);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v59 = objc_msgSend__items(self, v56, v57, v58);
    v63 = objc_msgSend_reverseObjectEnumerator(v59, v60, v61, v62);

    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v111, (uint64_t)v119, 16);
    if (v68)
    {
      uint64_t v69 = *(void *)v112;
      while (2)
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v112 != v69) {
            objc_enumerationMutation(v63);
          }
          v71 = *(void **)(*((void *)&v111 + 1) + 8 * j);
          if (objc_msgSend_sortID(v71, v65, v66, v67))
          {
            uint64_t v55 = objc_msgSend_sortID(v71, v65, v66, v67);
            goto LABEL_53;
          }
        }
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v65, (uint64_t)&v111, (uint64_t)v119, 16);
        if (v68) {
          continue;
        }
        break;
      }
    }
LABEL_53:
  }
  else
  {
    uint64_t v55 = objc_msgSend_sortID(v110, v49, v50, v51);
  }
  objc_msgSend_setSortID_(v109, v72, v55 + 1, v73);
LABEL_55:
  if (IMOSLoggingEnabled())
  {
    v74 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v78 = NSNumber;
      uint64_t v79 = objc_msgSend_sortID(v110, v75, v76, v77);
      objc_msgSend_numberWithUnsignedInteger_(v78, v80, v79, v81);
      v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v86 = objc_msgSend_guid(v110, v83, v84, v85);
      v87 = (void *)v86;
      v88 = @"NO";
      *(_DWORD *)buf = 138412802;
      v122 = v82;
      __int16 v123 = 2112;
      if (v107) {
        v88 = @"YES";
      }
      uint64_t v124 = v86;
      __int16 v125 = 2112;
      v126 = v88;
      _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "last item's sortID %@ guid %@ isTyping %@", buf, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v89 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      v93 = NSNumber;
      uint64_t v94 = objc_msgSend_sortID(v109, v90, v91, v92);
      objc_msgSend_numberWithUnsignedInteger_(v93, v95, v94, v96);
      v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_guid(v109, v98, v99, v100);
      id v101 = (id)objc_claimAutoreleasedReturnValue();
      int v105 = objc_msgSend_unsentIsFromMeItem(v109, v102, v103, v104);
      v106 = @"NO";
      *(_DWORD *)buf = 138412802;
      v122 = v97;
      __int16 v123 = 2112;
      if (v105) {
        v106 = @"YES";
      }
      uint64_t v124 = (uint64_t)v101;
      __int16 v125 = 2112;
      v126 = v106;
      _os_log_impl(&dword_1A4AF7000, v89, OS_LOG_TYPE_INFO, "set sortID %@ guid %@ itemIsUnsentAndFromMe %@", buf, 0x20u);
    }
  }
}

- (unint64_t)_indexOfItem:(id)a3
{
  unint64_t result = _IMItemsControllerIndexOfExistingItem(self->_items, a3, 0);
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)_itemForGUID:(id)a3
{
  id v4 = a3;
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_5:
    uint64_t v8 = 0;
  }
  else
  {
    CFIndex v7 = Count + 1;
    while (1)
    {
      uint64_t v8 = CFArrayGetValueAtIndex(items, v7 - 2);
      uint64_t v12 = objc_msgSend_guid(v8, v9, v10, v11);
      char isEqualToString = objc_msgSend_isEqualToString_(v4, v13, (uint64_t)v12, v14);

      if (isEqualToString) {
        break;
      }

      if ((unint64_t)--v7 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return v8;
}

- (void)_mergeItems:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v49, (uint64_t)v57, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_guid(v14, v8, v9, v10, (void)v49);
        uint64_t v18 = objc_msgSend__itemForGUID_(self, v16, (uint64_t)v15, v17);

        if (!v18) {
          objc_msgSend_addObject_(v5, v19, (uint64_t)v14, v20);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v49, (uint64_t)v57, 16);
    }
    while (v11);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = NSNumber;
      uint64_t v29 = objc_msgSend_count(v5, v25, v26, v27);
      uint64_t v32 = objc_msgSend_numberWithUnsignedInteger_(v28, v30, v29, v31);
      uint64_t v33 = NSNumber;
      uint64_t v37 = objc_msgSend_count(v6, v34, v35, v36);
      uint64_t v40 = objc_msgSend_numberWithUnsignedInteger_(v33, v38, v37, v39);
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = v32;
      __int16 v55 = 2112;
      uint64_t v56 = v40;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Merging %@ items of %@ items", buf, 0x16u);
    }
  }
  if (objc_msgSend_count(v5, v21, v22, v23, (void)v49))
  {
    BOOL v43 = objc_msgSend_arrayByAddingObjectsFromArray_(self->_items, v41, (uint64_t)v5, v42);
    CFArrayRef v47 = (const __CFArray *)objc_msgSend_mutableCopy(v43, v44, v45, v46);

    _IMItemsControllerSortItems(v47);
    objc_msgSend__replaceItems_skipCallToItemsDidChange_(self, v48, (uint64_t)v47, 1);
  }
}

- (id)_typingMessage
{
  return _IMItemsControllerGetTypingMessage(self->_items);
}

- (id)_firstMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_6:
    id v6 = 0;
  }
  else
  {
    CFIndex v4 = Count;
    CFIndex v5 = 0;
    while (1)
    {
      id v6 = CFArrayGetValueAtIndex(items, v5);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isFirstMessageCandidate(v6, v7, v8, v9)) {
        break;
      }

      if (v4 == ++v5) {
        goto LABEL_6;
      }
    }
  }

  return v6;
}

- (id)_lastInterworkedMessage
{
  return (id)objc_msgSend__lastMessageItemMatchingCriteria_(self, a2, (uint64_t)&unk_1EF8E5E18, v2);
}

- (id)_sentMessagesSinceInterworking
{
  CFIndex v5 = objc_msgSend__lastInterworkedMessage(self, a2, v2, v3);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v9 = objc_msgSend__indexOfItem_(self, v7, (uint64_t)v5, v8);
    for (unint64_t i = CFArrayGetCount(self->_items) - 1; i > v9; --i)
    {
      uint64_t v14 = CFArrayGetValueAtIndex(self->_items, i);
      if (objc_msgSend__isSentMessage_(self, v15, (uint64_t)v14, v16)) {
        objc_msgSend_addObject_(v6, v17, (uint64_t)v14, v18);
      }
    }
    BOOL v19 = objc_msgSend_copy(v6, v10, v11, v12);
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_isSentMessage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend_isTypingMessage(v3, v4, v5, v6) & 1) != 0
    || (objc_msgSend_isSuggestedActionResponse(v3, v7, v8, v9) & 1) != 0
    || !objc_msgSend_isFromMe(v3, v10, v11, v12))
  {
    char isLastMessageCandidate = 0;
  }
  else
  {
    char isLastMessageCandidate = objc_msgSend_isLastMessageCandidate(v3, v13, v14, v15);
  }

  return isLastMessageCandidate;
}

- (id)_lastSentMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_5:
    uint64_t v6 = 0;
  }
  else
  {
    CFIndex v5 = Count + 1;
    while (1)
    {
      uint64_t v6 = CFArrayGetValueAtIndex(items, v5 - 2);
      if (objc_msgSend__isSentMessage_(self, v7, (uint64_t)v6, v8)) {
        break;
      }

      if ((unint64_t)--v5 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return v6;
}

- (id)_lastPendingSatelliteSendMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_10:
    CFIndex v5 = 0;
  }
  else
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      CFIndex v5 = CFArrayGetValueAtIndex(items, v4 - 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend_isTypingMessage(v5, v6, v7, v8) & 1) == 0
        && (objc_msgSend_isSuggestedActionResponse(v5, v9, v10, v11) & 1) == 0
        && objc_msgSend_isFromMe(v5, v12, v13, v14)
        && objc_msgSend_isLastMessageCandidate(v5, v15, v16, v17)
        && (objc_msgSend_isPendingSatelliteSend(v5, v18, v19, v20) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_10;
      }
    }
  }

  return v5;
}

- (id)_lastIncomingMessage
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_7:
    CFIndex v5 = 0;
  }
  else
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      CFIndex v5 = CFArrayGetValueAtIndex(items, v4 - 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend_isFromMe(v5, v6, v7, v8) & 1) == 0
        && (objc_msgSend_isLastMessageCandidate(v5, v9, v10, v11) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_7;
      }
    }
  }

  return v5;
}

- (IMMessageItem)lastIncomingFinishedMessageItem
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_8:
    CFIndex v5 = 0;
  }
  else
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      CFIndex v5 = CFArrayGetValueAtIndex(items, v4 - 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend_isFromMe(v5, v6, v7, v8) & 1) == 0
        && (objc_msgSend_isTypingMessage(v5, v9, v10, v11) & 1) == 0
        && (objc_msgSend_isLastMessageCandidate(v5, v12, v13, v14) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v4 <= 1) {
        goto LABEL_8;
      }
    }
  }

  return (IMMessageItem *)v5;
}

+ (id)_charactersToIgnoreWhenParsingTextContent
{
  if (qword_1E965E730 != -1) {
    dispatch_once(&qword_1E965E730, &unk_1EF8E4170);
  }
  uint64_t v2 = (void *)qword_1E965E728;

  return v2;
}

- (id)_lastIncomingFinishedMessageItemWithTextContent
{
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_10:
    CFIndex v5 = 0;
    goto LABEL_11;
  }
  CFIndex v4 = Count + 1;
  while (1)
  {
    CFIndex v5 = CFArrayGetValueAtIndex(items, v4 - 2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_isLastMessageCandidate(v5, v6, v7, v8)) {
      goto LABEL_9;
    }
    uint64_t v12 = objc_msgSend_body(v5, v9, v10, v11);
    uint64_t v16 = objc_msgSend_string(v12, v13, v14, v15);
    uint64_t v20 = objc_msgSend__charactersToIgnoreWhenParsingTextContent(IMItemsController, v17, v18, v19);
    uint64_t v23 = objc_msgSend_stringByRemovingCharactersFromSet_(v16, v21, (uint64_t)v20, v22);

    if ((objc_msgSend_isFromMe(v5, v24, v25, v26) & 1) == 0
      && (objc_msgSend_isTypingMessage(v5, v27, v28, v29) & 1) == 0
      && objc_msgSend_length(v23, v30, v31, v32))
    {
      break;
    }

LABEL_9:
    if ((unint64_t)--v4 <= 1) {
      goto LABEL_10;
    }
  }

LABEL_11:

  return v5;
}

- (id)_lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3
{
  CFIndex v5 = objc_msgSend__lastIncomingFinishedMessageItemWithTextContent(self, a2, a3, v3);
  if (!v5)
  {
    id v60 = 0;
    goto LABEL_27;
  }
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
    uint64_t v11 = 0;
    goto LABEL_23;
  }
  uint64_t v11 = 0;
  char v12 = 0;
  CFIndex v13 = Count + 1;
  while (1)
  {
    uint64_t v14 = CFArrayGetValueAtIndex(items, v13 - 2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_isLastMessageCandidate(v14, v15, v16, v17)) {
      goto LABEL_18;
    }
    uint64_t v21 = (uint64_t)v11;
    uint64_t v22 = objc_msgSend_body(v14, v18, v19, v20);
    uint64_t v26 = objc_msgSend_string(v22, v23, v24, v25);
    objc_msgSend__charactersToIgnoreWhenParsingTextContent(IMItemsController, v27, v28, v29);
    v31 = double v30 = v5;
    uint64_t v34 = objc_msgSend_stringByRemovingCharactersFromSet_(v26, v32, (uint64_t)v31, v33);

    CFIndex v5 = v30;
    if (v14 == v30)
    {
      objc_msgSend_addObject_(v65, v35, (uint64_t)v34, v37);
      double v38 = objc_msgSend_time(v30, v57, v58, v59);
      uint64_t v11 = (void *)v21;
      goto LABEL_15;
    }
    uint64_t v11 = (void *)v21;
    if ((v12 & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_17;
    }
    double v38 = objc_msgSend_time(v14, v35, v36, v37);
    objc_msgSend_timeIntervalSinceDate_(v38, v39, v21, v40);
    double v42 = v41;
    if ((objc_msgSend_isFromMe(v14, v43, v44, v45) & 1) != 0
      || (objc_msgSend_isTypingMessage(v14, v46, v47, v48) & 1) != 0
      || !objc_msgSend_length(v34, v49, v50, v51)
      || fabs(v42) > 60.0
      || objc_msgSend_count(v65, v52, v53, v54) >= (unint64_t)a3)
    {
      break;
    }
    objc_msgSend_addObject_(v65, v55, (uint64_t)v34, v56);
LABEL_15:

    char v12 = 1;
    uint64_t v11 = v38;
LABEL_17:

LABEL_18:
    if ((unint64_t)--v13 <= 1) {
      goto LABEL_23;
    }
  }

LABEL_23:
  if (objc_msgSend_count(v65, v8, v9, v10))
  {
    id v61 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = sub_1A4B6EAF4;
    v66[3] = &unk_1E5B7BBE8;
    id v60 = v61;
    id v67 = v60;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v65, v62, 2, (uint64_t)v66);
  }
  else
  {
    id v60 = 0;
  }

LABEL_27:

  return v60;
}

- (id)_appendArchivedItemsToItemsArray:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "appending archived items to current items array", buf, 2u);
    }
  }
  uint64_t v9 = objc_msgSend__items(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

  if (!v13)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    uint64_t v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      __int16 v96 = 0;
      uint64_t v57 = "Cannot append to either beginning or end as there are no previous items to append to";
      uint64_t v58 = (uint8_t *)&v96;
LABEL_27:
      _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, v57, v58, 2u);
    }
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v17 = objc_msgSend_firstObject(v4, v14, v15, v16);
  uint64_t v21 = objc_msgSend_messageID(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend__items(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_lastMessageItem(v25, v26, v27, v28);
  uint64_t v33 = objc_msgSend_messageID(v29, v30, v31, v32);

  if (v21 == v33)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v95 = 0;
        _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Going to append the incoming messages to the end of the _items array", v95, 2u);
      }
    }
    id v38 = objc_alloc(MEMORY[0x1E4F28D60]);
    uint64_t v42 = objc_msgSend_count(v4, v39, v40, v41);
    uint64_t v44 = objc_msgSend_initWithIndexesInRange_(v38, v43, 1, v42 - 1);
    uint64_t v48 = objc_msgSend__items(self, v45, v46, v47);
    uint64_t v51 = objc_msgSend_objectsAtIndexes_(v4, v49, (uint64_t)v44, v50);
LABEL_12:
    uint64_t v54 = (void *)v51;
    objc_msgSend_arrayByAddingObjectsFromArray_(v48, v52, v51, v53);
    id v55 = (id)objc_claimAutoreleasedReturnValue();

    if (v55) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  uint64_t v59 = objc_msgSend_lastObject(v4, v34, v35, v36);
  uint64_t v63 = objc_msgSend_messageID(v59, v60, v61, v62);
  id v67 = objc_msgSend__items(self, v64, v65, v66);
  v71 = objc_msgSend_firstMessageItem(v67, v68, v69, v70);
  uint64_t v75 = objc_msgSend_messageID(v71, v72, v73, v74);

  int v76 = IMOSLoggingEnabled();
  if (v63 != v75)
  {
    if (!v76) {
      goto LABEL_29;
    }
    uint64_t v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      __int16 v93 = 0;
      uint64_t v57 = "Cannot append to either beginning or end as there is a mismatch in messageIDs";
      uint64_t v58 = (uint8_t *)&v93;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  if (v76)
  {
    v80 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v94 = 0;
      _os_log_impl(&dword_1A4AF7000, v80, OS_LOG_TYPE_INFO, "Going to append the incoming messages to the beginning of the _items array", v94, 2u);
    }
  }
  if ((unint64_t)objc_msgSend_count(v4, v77, v78, v79) >= 2)
  {
    uint64_t v84 = objc_msgSend_count(v4, v81, v82, v83) - 1;
    id v85 = objc_alloc(MEMORY[0x1E4F28D60]);
    uint64_t v44 = objc_msgSend_initWithIndexesInRange_(v85, v86, 0, v84);
    uint64_t v48 = objc_msgSend_objectsAtIndexes_(v4, v87, (uint64_t)v44, v88);
    uint64_t v51 = objc_msgSend__items(self, v89, v90, v91);
    goto LABEL_12;
  }
  objc_msgSend__items(self, v81, v82, v83);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  if (!v55) {
LABEL_29:
  }
    id v55 = v4;
LABEL_30:

  return v55;
}

- (id)_lastMessageItemMatchingCriteria:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  items = self->_items;
  CFIndex Count = CFArrayGetCount(items);
  if (Count < 1)
  {
LABEL_7:
    uint64_t v8 = 0;
  }
  else
  {
    CFIndex v7 = Count + 1;
    while (1)
    {
      uint64_t v8 = CFArrayGetValueAtIndex(items, v7 - 2);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend_isLastMessageCandidate(v8, v9, v10, v11)
        && (v4[2](v4, v8) & 1) != 0)
      {
        break;
      }

      if ((unint64_t)--v7 <= 1) {
        goto LABEL_7;
      }
    }
  }

  return v8;
}

- (id)_lastMessageItemWithService:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B6F0A0;
  v10[3] = &unk_1E5B7BC10;
  id v11 = v4;
  id v5 = v4;
  uint64_t v8 = objc_msgSend__lastMessageItemMatchingCriteria_(self, v6, (uint64_t)v10, v7);

  return v8;
}

- (id)_lastMessageItemWithServiceCapability:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B6F194;
  v10[3] = &unk_1E5B7BC10;
  id v11 = v4;
  id v5 = v4;
  uint64_t v8 = objc_msgSend__lastMessageItemMatchingCriteria_(self, v6, (uint64_t)v10, v7);

  return v8;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (__CFArray)items
{
  return self->_items;
}

- (void)setItems:(__CFArray *)a3
{
  self->_items = a3;
}

- (void)_didReplaceItem:(__CFArray *)a3 oldItem:(id)a4 idx:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = CFArrayGetValueAtIndex(a3, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = sub_1A4C37C7C;
    v43[3] = &unk_1E5B7E990;
    id v44 = v12;
    uint64_t v46 = a3;
    int64_t v47 = a5;
    id v45 = v7;
    uint64_t v13 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v43);
    v13[2](v13, v14, v15, v16);
  }
  else if (objc_msgSend_associatedMessageType(v7, v9, v10, v11) == 2 {
         && objc_msgSend_associatedMessageType(v8, v17, v18, v19) == 2)
  }
  {
    uint64_t v23 = objc_msgSend_associatedMessageGUID(v7, v20, v21, v22);
    uint64_t v27 = objc_msgSend_associatedMessageGUID(v8, v24, v25, v26);
    if (objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29))
    {
      uint64_t v33 = objc_msgSend_consumedSessionPayloads(v7, v30, v31, v32);
      uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);

      if (!v37) {
        goto LABEL_10;
      }
      uint64_t v23 = objc_msgSend_consumedSessionPayloads(v7, v38, v39, v40);
      objc_msgSend_setConsumedSessionPayloads_(v8, v41, (uint64_t)v23, v42);
    }
    else
    {
    }
  }
LABEL_10:
}

@end