@interface IMTranscriptChatItemRules
+ (BOOL)testShouldShowReportSpamForChat:(id)a3 items:(id)a4;
+ (BOOL)testShouldShowSMSSpamForChat:(id)a3 items:(id)a4;
- (BOOL)_hasEarlierMessagesToLoad;
- (BOOL)_hasMultipleActiveSubscriptions;
- (BOOL)_hasRecentMessagesToLoad;
- (BOOL)_shouldAdjustNewDeliveredItemIndex:(int64_t)a3 chatItems:(id)a4;
- (BOOL)_shouldAppendBlockContacts;
- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4;
- (BOOL)_shouldAppendNumberChangedForItem:(id)a3 previousItem:(id)a4 lastChatItem:(id)a5 outPhoneNumber:(id *)a6;
- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5;
- (BOOL)_shouldAppendReplyCountIfNeeded;
- (BOOL)_shouldAppendScheduledSectionDateForItem:(id)a3 previousItem:(id)a4;
- (BOOL)_shouldAppendScheduledSectionLabelForItem:(id)a3 previousItem:(id)a4;
- (BOOL)_shouldAppendSendViaSatelliteForChat:(id)a3 item:(id)a4 previousItem:(id)a5;
- (BOOL)_shouldAppendSentViaSatelliteForChat:(id)a3 message:(id)a4;
- (BOOL)_shouldAppendServiceForChat:(id)a3 item:(id)a4 previousItem:(id)a5 chatStyle:(unsigned __int8)a6;
- (BOOL)_shouldAppendStewieSharingSummaryForChat:(id)a3 item:(id)a4 previousItem:(id)a5;
- (BOOL)_shouldAppendStoppedSharingForChat:(id)a3 item:(id)a4 previousItem:(id)a5;
- (BOOL)_shouldDisplayAttributionInfo:(id)a3;
- (BOOL)_shouldRegenerateChatItemsForItem:(id)a3 previousItem:(id)a4 oldPreviousItem:(id)a5;
- (BOOL)_shouldReloadChatItem:(id)a3 oldChatItem:(id)a4;
- (BOOL)_shouldReloadChatItemWithAssociatedChatItems:(id)a3 oldAssociatedChatItems:(id)a4;
- (BOOL)_shouldReloadSatelliteChatItems:(id)a3;
- (BOOL)_shouldShowBlockContactForChat:(id)a3 withItems:(id)a4;
- (BOOL)_shouldShowEffectPlayButtonForMessage:(id)a3;
- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4;
- (BOOL)_shouldShowStewieResumeButtonsForChat:(id)a3;
- (BOOL)_supportsContiguousChatItems;
- (BOOL)_updateAggregateAttachmentMessagePartAssociatedItems:(id)a3 map:(id)a4;
- (BOOL)isDeliveredStatusItem:(id)a3;
- (BOOL)isDeliveredStatusType:(int64_t)a3;
- (BOOL)isReadStatusItem:(id)a3;
- (BOOL)isReadStatusType:(int64_t)a3;
- (BOOL)shouldShowExpressiveMessageTextAsText:(id)a3;
- (BOOL)shouldShowRaiseMessageStatus;
- (IMChat)chat;
- (NSArray)items;
- (NSDate)nextStaleTime;
- (NSMutableArray)chatItems;
- (id)_attributionChatItemForChatItem:(id)a3;
- (id)_chatItems;
- (id)_chatItemsForItem:(id)a3 previousItem:(id)a4;
- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 parentItem:(id)a4 threadOriginatorItem:(id)a5;
- (id)_currentChatSubscriptionLabel;
- (id)_editedStatusItemForEditedMessagePartChatItem:(id)a3 combiningStatusType:(int64_t)a4;
- (id)_effectControlForChatItem:(id)a3;
- (id)_filteredChatItemsForNewChatItems:(id)a3;
- (id)_historyToDisplayForMessageItem:(id)a3 partIndex:(int64_t)a4;
- (id)_initWithChat:(id)a3;
- (id)_itemWithChatItemsDeleted:(id)a3 fromItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapOfItemsDeleted:(id *)a6;
- (id)_items;
- (id)_newDeliveredChatItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5;
- (id)_newiMessageLiteSentItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5;
- (id)_nextStaleTime;
- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 threadOriginatorMessageItem:(id)a8;
- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadOriginatorMessageItem:(id)a5;
- (id)_updateOrRemoveDeliveredStatusItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4;
- (id)_updateOrRemoveiMessageLiteSentItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4;
- (id)chatItemForIMChatItem:(id)a3;
- (id)inlineReplyController;
- (id)serviceForChatItems:(id)a3;
- (id)testChatItems;
- (int64_t)_lastItemIndexExcludingScheduledSection:(id)a3;
- (int64_t)_lastItemIndexExcludingWatchReplyOptions:(id)a3;
- (void)_insertOrMoveChatItemToEndOfChatItems:(id)a3 chatItemClass:(Class)a4 shouldInsert:(BOOL)a5 chatItemCreationBlock:(id)a6;
- (void)_invalidateSpamIndicatorCachedValues;
- (void)_manageMomentShareAndAggregateItemsForChatItems:(id)a3;
- (void)_processChatItemsForAttribution:(id)a3;
- (void)_processChatItemsForBreadcrumbs:(id)a3;
- (void)_processChatItemsForDownloadingPendingMessages:(id)a3;
- (void)_processChatItemsForEditedStatus:(id)a3;
- (void)_processChatItemsForExpandedEditedMessageHistory:(id)a3;
- (void)_processChatItemsForIsShowingEditHistory:(id)a3;
- (void)_processChatItemsForJunkRecoveryItem:(id)a3 inChat:(id)a4;
- (void)_processChatItemsForKeyTransparencyStatus:(id)a3;
- (void)_processChatItemsForMessageStatusSequenceNumber:(id)a3;
- (void)_processChatItemsForReplayButton:(id)a3;
- (void)_processChatItemsForSMSFallbackStatusIndicator:(id)a3;
- (void)_processChatItemsForSatelliteAvailabilityIndicator:(id)a3;
- (void)_processChatItemsForSatelliteNoDeliveryStatusIndicator:(id)a3;
- (void)_processChatItemsForStewieResumeButtons:(id)a3 inChat:(id)a4;
- (void)_processChatItemsForSuggestedReplies:(id)a3 inChat:(id)a4;
- (void)_processChatItemsForUnavailabilityIndicator:(id)a3;
- (void)_processChatItemsForUnknownInternationalSender:(id)a3;
- (void)_processSuggestedActionResponses:(id)a3;
- (void)_setItems:(id)a3;
- (void)_setNextStaleTime:(id)a3;
- (void)addChatItem:(id)a3 toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:(id)a4;
- (void)setChat:(id)a3;
- (void)setChatItems:(id)a3;
- (void)setItems:(id)a3;
- (void)setNextStaleTime:(id)a3;
@end

@implementation IMTranscriptChatItemRules

- (id)chatItemForIMChatItem:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)shouldShowRaiseMessageStatus
{
  return 0;
}

- (BOOL)shouldShowExpressiveMessageTextAsText:(id)a3
{
  return 0;
}

- (BOOL)_shouldShowEffectPlayButtonForMessage:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_errorCode(v3, v4, v5, v6))
  {
    char v10 = 0;
  }
  else
  {
    v11 = objc_msgSend_expressiveSendStyleID(v3, v7, v8, v9);
    if (objc_msgSend_length(v11, v12, v13, v14)
      && ((objc_msgSend_containsString_(v11, v15, *MEMORY[0x1E4F6D4D8], v17) & 1) != 0
       || objc_msgSend_containsString_(v11, v15, *MEMORY[0x1E4F6D480], v17)))
    {
      int v18 = objc_msgSend_containsString_(v11, v15, *MEMORY[0x1E4F6D4E0], v17) ^ 1;
    }
    else
    {
      LOBYTE(v18) = 0;
    }
    v19 = objc_msgSend_message(v3, v15, v16, v17);
    v23 = objc_msgSend_text(v19, v20, v21, v22);

    if (objc_msgSend_im_containsIMTextEffect(v23, v24, v25, v26)) {
      BOOL v27 = _AXSReduceMotionAutoplayMessagesEffectsEnabled() == 0;
    }
    else {
      BOOL v27 = 0;
    }
    char v10 = v18 | v27;
  }
  return v10;
}

- (id)inlineReplyController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  uint64_t v6 = objc_msgSend_inlineReplyController(WeakRetained, v3, v4, v5);

  return v6;
}

- (id)_items
{
  return self->_items;
}

- (void)_setItems:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  items = self->_items;
  p_items = &self->_items;
  if (items != v4)
  {
    v11 = v4;
    char v10 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7);

    objc_storeStrong((id *)p_items, v10);
    uint64_t v4 = v10;
  }
}

- (id)_chatItems
{
  return self->_chatItems;
}

- (void)_setNextStaleTime:(id)a3
{
  uint64_t v5 = (NSDate *)a3;
  nextStaleTime = self->_nextStaleTime;
  p_nextStaleTime = &self->_nextStaleTime;
  if (nextStaleTime != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_nextStaleTime, a3);
    uint64_t v5 = v8;
  }
}

- (id)_nextStaleTime
{
  return self->_nextStaleTime;
}

- (id)_currentChatSubscriptionLabel
{
  p_chat = &self->_chat;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  uint64_t v7 = objc_msgSend_lastAddressedSIMID(WeakRetained, v4, v5, v6);

  id v8 = objc_loadWeakRetained((id *)p_chat);
  v12 = objc_msgSend_lastAddressedHandleID(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v13, v14, v15);
  v20 = objc_msgSend_ctSubscriptionInfo(v16, v17, v18, v19);
  uint64_t v22 = objc_msgSend___im_subscriptionContextForForSimID_phoneNumber_(v20, v21, (uint64_t)v7, (uint64_t)v12);

  uint64_t v26 = objc_msgSend_label(v22, v23, v24, v25);

  return v26;
}

- (id)_chatItemsForItem:(id)a3 previousItem:(id)a4
{
  v886[2] = *MEMORY[0x1E4F143B8];
  id v848 = a3;
  id v847 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7);
  theArray = (__CFArray *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_shouldGenerateTopLevelChatItem(v848, v8, v9, v10)) {
    goto LABEL_303;
  }
  location = (id *)&self->_chat;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  unsigned int v837 = objc_msgSend_chatStyle(WeakRetained, v15, v16, v17);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = objc_msgSend__items(self, v18, v19, v20);
    id v22 = objc_loadWeakRetained(location);
    int v26 = objc_msgSend_isInScrutinyMode(v22, v23, v24, v25);

    v33 = objc_msgSend_guid(v848, v27, v28, v29);
    if (v26)
    {
      v34 = objc_msgSend_guid(v848, v30, v31, v32);
      objc_msgSend_storeGUIDInAttemptingListInScrutinyMode_(IMChat, v35, (uint64_t)v34, v36);
    }
    id v37 = objc_loadWeakRetained(location);
    objc_msgSend_loadParticipantContactsIfNecessary(v37, v38, v39, v40);

    id v41 = objc_loadWeakRetained(location);
    v42 = sub_1A4C141F4(v41, v21);

    v45 = objc_msgSend__newChatItemsWithChatContext_(v848, v43, (uint64_t)v42, v44);
    if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend_count(v45, v46, v47, v48))
    {
      if (IMOSLoggingEnabled())
      {
        v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_guid(v848, v50, v51, v52);
          id v53 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(void *)v879 = v53;
          _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "Generated no chat items for IMMessageItem with GUID: %@", buf, 0xCu);
        }
      }
    }
    if (v26) {
      objc_msgSend_removeGUIDInAttemptingListInScrutinyMode_(IMChat, v46, (uint64_t)v33, v48);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = objc_msgSend__items(self, v54, v55, v56);
      id v58 = objc_loadWeakRetained(location);
      v59 = sub_1A4C141F4(v58, v57);

      v45 = objc_msgSend__newChatItemsWithChatContext_(v848, v60, (uint64_t)v59, v61);
    }
    else
    {
      v45 = objc_msgSend__newChatItems(v848, v54, v55, v56);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend_changeType(v45, v62, v63, v64))
  {
    v68 = objc_msgSend_sender(v45, v65, v66, v67);
    v72 = objc_msgSend_ID(v68, v69, v70, v71);

    v76 = objc_msgSend_otherHandle(v45, v73, v74, v75);
    v80 = objc_msgSend_ID(v76, v77, v78, v79);

    if (objc_msgSend_isEqualToString_(v72, v81, (uint64_t)v80, v82))
    {
      id v83 = objc_loadWeakRetained(location);
      objc_msgSend_setIsSubscriptionSwitchParticipantAddTypeFound_(v83, v84, 1, v85);

      id v86 = objc_loadWeakRetained(location);
      objc_msgSend_setSubscriptionSwitchParticipantAddChatItem_(v86, v87, (uint64_t)v45, v88);

      v45 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_changeType(v45, v89, v90, v91) != 1)
  {
    int v177 = 1;
LABEL_31:
    objc_msgSend__chatItemsWithReplyCountsForNewChatItems_parentItem_threadOriginatorItem_(self, v89, (uint64_t)v45, (uint64_t)v848, v848);
    goto LABEL_32;
  }
  v92 = objc_loadWeakRetained(location);
  if (objc_msgSend_isSubscriptionSwitchParticipantAddTypeFound(v92, v93, v94, v95))
  {
    id v96 = objc_loadWeakRetained(location);
    v100 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v96, v97, v98, v99);
    BOOL v101 = v100 == 0;

    if (v101)
    {
      int v177 = 1;
      goto LABEL_222;
    }
    id v102 = objc_loadWeakRetained(location);
    v106 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v102, v103, v104, v105);
    v110 = objc_msgSend_sender(v106, v107, v108, v109);
    v92 = objc_msgSend_ID(v110, v111, v112, v113);

    v117 = objc_msgSend_sender(v45, v114, v115, v116);
    v121 = objc_msgSend_ID(v117, v118, v119, v120);

    v125 = objc_msgSend_sender(v45, v122, v123, v124);
    v129 = objc_msgSend_name(v125, v126, v127, v128);

    v133 = objc_msgSend_otherHandle(v45, v130, v131, v132);
    v137 = objc_msgSend_name(v133, v134, v135, v136);

    if (objc_msgSend_isEqualToString_(v92, v138, (uint64_t)v121, v139))
    {
      int isEqualToString = objc_msgSend_isEqualToString_(v129, v140, (uint64_t)v137, v141);
      if (isEqualToString)
      {
        v843 = objc_msgSend__item(v45, v142, v143, v144);
        v146 = [IMParticipantSubscriptionSwitchChatItem alloc];
        v150 = objc_msgSend_sender(v45, v147, v148, v149);
        v154 = objc_msgSend_otherHandle(v45, v151, v152, v153);
        v841 = objc_msgSend__initWithItem_sender_otherHandle_(v146, v155, (uint64_t)v843, (uint64_t)v150, v154);

        v156 = [IMDateChatItem alloc];
        id v157 = objc_loadWeakRetained(location);
        v161 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v157, v158, v159, v160);
        v165 = objc_msgSend__item(v161, v162, v163, v164);
        v168 = objc_msgSend__initWithItem_(v156, v166, (uint64_t)v165, v167);

        v886[0] = v168;
        v886[1] = v841;
        uint64_t v170 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v169, (uint64_t)v886, 2);

        id v171 = objc_loadWeakRetained(location);
        objc_msgSend_setIsSubscriptionSwitchParticipantAddTypeFound_(v171, v172, 0, v173);

        v174 = objc_loadWeakRetained(location);
        objc_msgSend_setSubscriptionSwitchParticipantAddChatItem_(v174, v175, 0, v176);
        v45 = (void *)v170;
      }
      else
      {
        v843 = objc_msgSend_otherHandle(v45, v142, v143, v144);
        v841 = objc_msgSend_sender(v45, v599, v600, v601);
        id v602 = objc_loadWeakRetained(location);
        v606 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v602, v603, v604, v605);
        v168 = objc_msgSend__item(v606, v607, v608, v609);

        v610 = [IMParticipantChangeChatItem alloc];
        id v611 = objc_loadWeakRetained(location);
        v612 = sub_1A4C141F4(v611, self->_items);
        v174 = objc_msgSend__initWithItem_sender_otherHandle_context_(v610, v613, (uint64_t)v168, (uint64_t)v843, v841, v612);

        id v614 = objc_loadWeakRetained(location);
        objc_msgSend_setSubscriptionSwitchParticipantAddChatItem_(v614, v615, (uint64_t)v174, v616);
      }
      int v177 = isEqualToString ^ 1;
    }
    else
    {
      int v177 = 1;
    }
  }
  else
  {
    int v177 = 1;
  }

LABEL_222:
  id v617 = objc_loadWeakRetained(location);
  int isSubscriptionSwitchParticipantAddTypeFound = objc_msgSend_isSubscriptionSwitchParticipantAddTypeFound(v617, v618, v619, v620);

  if (!isSubscriptionSwitchParticipantAddTypeFound) {
    goto LABEL_31;
  }
  v622 = [IMDateChatItem alloc];
  id v623 = objc_loadWeakRetained(location);
  v627 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v623, v624, v625, v626);
  v631 = objc_msgSend__item(v627, v628, v629, v630);
  v634 = objc_msgSend__initWithItem_(v622, v632, (uint64_t)v631, v633);

  v885[0] = v634;
  id v635 = objc_loadWeakRetained(location);
  v639 = objc_msgSend_subscriptionSwitchParticipantAddChatItem(v635, v636, v637, v638);
  v885[1] = v639;
  v643 = objc_msgSend__newChatItems(v848, v640, v641, v642);
  v885[2] = v643;
  uint64_t v645 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v644, (uint64_t)v885, 3);

  id v646 = objc_loadWeakRetained(location);
  objc_msgSend_setIsSubscriptionSwitchParticipantAddTypeFound_(v646, v647, 0, v648);

  id v649 = objc_loadWeakRetained(location);
  objc_msgSend_setSubscriptionSwitchParticipantAddChatItem_(v649, v650, 0, v651);

  int v177 = 0;
  v45 = (void *)v645;
  objc_msgSend__chatItemsWithReplyCountsForNewChatItems_parentItem_threadOriginatorItem_(self, v652, v645, (uint64_t)v848, v848);
  v178 = LABEL_32:;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v842 = 0;
  }
  else
  {
    id v842 = v178;

    v178 = 0;
  }
  v840 = objc_msgSend__filteredChatItemsForNewChatItems_(self, v179, (uint64_t)v178, v180);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (theArray)
    {
      v184 = objc_msgSend_chatItemForIMChatItem_(self, v181, (uint64_t)v842, v183);
      BOOL v185 = v184 == 0;

      if (!v185)
      {
        valuea = objc_msgSend_chatItemForIMChatItem_(self, v186, (uint64_t)v842, v187);
        CFArrayAppendValue(theArray, valuea);
      }
    }
    goto LABEL_302;
  }
  hasMessageChatIteuint64_t m = objc_msgSend__hasMessageChatItem(v848, v181, v182, v183);
  id v188 = objc_loadWeakRetained(location);
  if (objc_msgSend_isMapKitBusinessChat(v188, v189, v190, v191))
  {
    id v192 = objc_loadWeakRetained(location);
    int isStewieSharingChat = objc_msgSend_isStewieSharingChat(v192, v193, v194, v195);

    if (!isStewieSharingChat) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  id v200 = objc_loadWeakRetained(location);
  int shouldAppendServiceForChat_item_previousItem_chatStyle = objc_msgSend__shouldAppendServiceForChat_item_previousItem_chatStyle_(self, v201, (uint64_t)v200, (uint64_t)v848, v847, v837);

  if (shouldAppendServiceForChat_item_previousItem_chatStyle)
  {
    id v203 = objc_loadWeakRetained(location);
    v207 = objc_msgSend_participants(v203, v204, v205, v206);
    v211 = objc_msgSend_firstObject(v207, v208, v209, v210);

    v212 = [IMServiceChatItem alloc];
    v216 = objc_msgSend__service(v848, v213, v214, v215);
    v218 = objc_msgSend__initWithItem_service_handle_(v212, v217, (uint64_t)v848, (uint64_t)v216, v211);

    v222 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v219, v220, v221);
    LODWORD(v212) = objc_msgSend_isCarrierPigeonEnabled(v222, v223, v224, v225);

    if (v212)
    {
      v229 = objc_msgSend__service(v848, v226, v227, v228);
      v233 = objc_msgSend_satelliteSMSService(IMService, v230, v231, v232);
      BOOL v234 = v229 == v233;

      if (v234)
      {
        id v235 = objc_loadWeakRetained(location);
        uint64_t isRecipientAbleToDowngradeToSMS = objc_msgSend_isRecipientAbleToDowngradeToSMS(v235, v236, v237, v238);
        objc_msgSend_setLiteServiceCapable_(v218, v240, isRecipientAbleToDowngradeToSMS, v241);
      }
    }
    v242 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v226, v227, v228);
    int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v242, v243, v244, v245);

    if (isTranscriptSharingEnabled)
    {
      id v249 = objc_loadWeakRetained(location);
      uint64_t v253 = objc_msgSend_isStewieSharingChat(v249, v250, v251, v252);
      objc_msgSend_setStewieSharingChat_(v218, v254, v253, v255);
    }
    if (theArray)
    {
      v256 = objc_msgSend_chatItemForIMChatItem_(self, v247, (uint64_t)v218, v248);
      BOOL v257 = v256 == 0;

      if (!v257)
      {
        v260 = objc_msgSend_chatItemForIMChatItem_(self, v258, (uint64_t)v218, v259);
        CFArrayAppendValue(theArray, v260);
      }
    }
  }
LABEL_53:
  value = objc_msgSend_time(v848, v197, v198, v199);
  if (value)
  {
    if (objc_msgSend__shouldAppendScheduledSectionDateForItem_previousItem_(self, v261, (uint64_t)v848, (uint64_t)v847))
    {
      v264 = [IMScheduledSectionDateChatItem alloc];
      v267 = objc_msgSend_initWithItem_(v264, v265, (uint64_t)v848, v266);
      if (objc_msgSend__shouldAppendScheduledSectionLabelForItem_previousItem_(self, v268, (uint64_t)v267, (uint64_t)v847))
      {
        v271 = [IMScheduledSectionLabelChatItem alloc];
        v276 = objc_msgSend_initWithAssociatedDateChatItem_(v271, v272, (uint64_t)v267, v273);
        if (theArray)
        {
          v277 = objc_msgSend_chatItemForIMChatItem_(self, v274, (uint64_t)v276, v275);
          BOOL v278 = v277 == 0;

          if (!v278)
          {
            v281 = objc_msgSend_chatItemForIMChatItem_(self, v279, (uint64_t)v276, v280);
            CFArrayAppendValue(theArray, v281);
          }
        }
      }
      if (!theArray) {
        goto LABEL_67;
      }
    }
    else
    {
      if (!v177
        || !objc_msgSend__shouldAppendDateForItem_previousItem_(self, v261, (uint64_t)v848, (uint64_t)v847))
      {
        goto LABEL_68;
      }
      v282 = [IMDateChatItem alloc];
      v267 = objc_msgSend__initWithItem_(v282, v283, (uint64_t)v848, v284);
      if (!theArray) {
        goto LABEL_67;
      }
    }
    v285 = objc_msgSend_chatItemForIMChatItem_(self, v269, (uint64_t)v267, v270);
    BOOL v286 = v285 == 0;

    if (!v286)
    {
      v289 = objc_msgSend_chatItemForIMChatItem_(self, v287, (uint64_t)v267, v288);
      CFArrayAppendValue(theArray, v289);
    }
LABEL_67:
  }
LABEL_68:
  v290 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v261, v262, v263);
  int v294 = objc_msgSend_isTranscriptSharingEnabled(v290, v291, v292, v293);

  if (v294)
  {
    v298 = objc_msgSend_chat(self, v295, v296, v297);
    int shouldAppendStewieSharingSummaryForChat_item_previousItem = objc_msgSend__shouldAppendStewieSharingSummaryForChat_item_previousItem_(self, v299, (uint64_t)v298, (uint64_t)v848, v847);

    if (shouldAppendStewieSharingSummaryForChat_item_previousItem)
    {
      v304 = [IMStewieSharingSummaryChatItem alloc];
      id v305 = objc_loadWeakRetained(location);
      v309 = objc_msgSend_emergencyUserHandle(v305, v306, v307, v308);
      id v310 = objc_loadWeakRetained(location);
      v312 = objc_msgSend__initWithItem_emergencyUserHandle_chat_(v304, v311, (uint64_t)v848, (uint64_t)v309, v310);

      if (theArray)
      {
        v315 = objc_msgSend_chatItemForIMChatItem_(self, v313, (uint64_t)v312, v314);
        BOOL v316 = v315 == 0;

        if (!v316)
        {
          v319 = objc_msgSend_chatItemForIMChatItem_(self, v317, (uint64_t)v312, v318);
          CFArrayAppendValue(theArray, v319);
        }
      }
    }
    v320 = objc_msgSend_chat(self, v301, v302, v303);
    int shouldAppendStoppedSharingForChat_item_previousItem = objc_msgSend__shouldAppendStoppedSharingForChat_item_previousItem_(self, v321, (uint64_t)v320, (uint64_t)v848, v847);

    if (shouldAppendStoppedSharingForChat_item_previousItem)
    {
      v323 = [IMStewieStoppedSharingChatItem alloc];
      id v324 = objc_loadWeakRetained(location);
      v328 = objc_msgSend_emergencyUserHandle(v324, v325, v326, v327);
      id v329 = objc_loadWeakRetained(location);
      v331 = objc_msgSend__initWithItem_emergencyUserHandle_chat_(v323, v330, (uint64_t)v848, (uint64_t)v328, v329);

      if (theArray)
      {
        v334 = objc_msgSend_chatItemForIMChatItem_(self, v332, (uint64_t)v331, v333);
        BOOL v335 = v334 == 0;

        if (!v335)
        {
          v338 = objc_msgSend_chatItemForIMChatItem_(self, v336, (uint64_t)v331, v337);
          CFArrayAppendValue(theArray, v338);
        }
      }
      v339 = theArray;

      v340 = theArray;
      goto LABEL_309;
    }
  }
  v341 = self;
  if ((hasMessageChatItem & 1) == 0)
  {
    if (v840)
    {
      long long v874 = 0u;
      long long v875 = 0u;
      long long v872 = 0u;
      long long v873 = 0u;
      id v342 = v840;
      uint64_t v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v343, (uint64_t)&v872, (uint64_t)v884, 16);
      if (v346)
      {
        uint64_t v347 = *(void *)v873;
        do
        {
          for (uint64_t i = 0; i != v346; ++i)
          {
            if (*(void *)v873 != v347) {
              objc_enumerationMutation(v342);
            }
            if (theArray)
            {
              uint64_t v349 = *(void *)(*((void *)&v872 + 1) + 8 * i);
              v350 = objc_msgSend_chatItemForIMChatItem_(self, v344, v349, v345);
              BOOL v351 = v350 == 0;

              if (!v351)
              {
                v352 = objc_msgSend_chatItemForIMChatItem_(self, v344, v349, v345);
                CFArrayAppendValue(theArray, v352);
              }
            }
          }
          uint64_t v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v344, (uint64_t)&v872, (uint64_t)v884, 16);
        }
        while (v346);
      }
      goto LABEL_96;
    }
    if (theArray)
    {
      v353 = objc_msgSend_chatItemForIMChatItem_(self, v295, (uint64_t)v842, v297);
      BOOL v354 = v353 == 0;

      v341 = self;
      if (!v354)
      {
        objc_msgSend_chatItemForIMChatItem_(self, v295, (uint64_t)v842, v355);
        id v342 = (id)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue(theArray, v342);
LABEL_96:

        v341 = self;
      }
    }
  }
  if (objc_msgSend__shouldAppendReplyContextForItem_previousItem_chatStyle_(v341, v295, (uint64_t)v848, (uint64_t)v847, v837))
  {
    id v844 = v848;
    v834 = objc_msgSend_threadIdentifier(v844, v359, v360, v361);
    v831 = objc_msgSend_threadOriginator(v844, v362, v363, v364);
    if (v831)
    {
      uint64_t OriginatorRange = IMMessageThreadIdentifierGetOriginatorRange();
      v367 = v366;
      uint64_t OriginatorMessagePart = IMMessageThreadIdentifierGetOriginatorMessagePart();
      v830 = objc_msgSend__items(self, v368, v369, v370);
      v371 = objc_opt_new();
      id v372 = objc_loadWeakRetained(location);
      v832 = sub_1A4C141F4(v372, v830);

      v829 = objc_msgSend__newChatItemsWithChatContext_(v831, v373, (uint64_t)v832, v374);
      if (v829)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v376 = v829;
        }
        else
        {
          v883 = v829;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v375, (uint64_t)&v883, 1);
          id v376 = (id)objc_claimAutoreleasedReturnValue();
        }
        long long v870 = 0u;
        long long v871 = 0u;
        long long v868 = 0u;
        long long v869 = 0u;
        id v401 = v376;
        uint64_t v403 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v402, (uint64_t)&v868, (uint64_t)v882, 16);
        if (v403)
        {
          uint64_t v404 = *(void *)v869;
          do
          {
            for (uint64_t j = 0; j != v403; ++j)
            {
              if (*(void *)v869 != v404) {
                objc_enumerationMutation(v401);
              }
              v406 = *(void **)(*((void *)&v868 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v409 = v406;
                if (objc_msgSend_messagePartRange(v409, v410, v411, v412) == OriginatorRange && v413 == v367)
                {
                  objc_msgSend_addObject_(v371, v413, (uint64_t)v409, v415);
                }
                else
                {
                  v417 = objc_msgSend_aggregateAttachmentParts(v409, v413, v414, v415);
                  objc_msgSend_addObjectsFromArray_(v371, v418, (uint64_t)v417, v419);
                }
              }
              else
              {
                objc_msgSend_addObject_(v371, v407, (uint64_t)v406, v408);
              }
            }
            uint64_t v403 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v420, (uint64_t)&v868, (uint64_t)v882, 16);
          }
          while (v403);
        }
      }
      long long v866 = 0u;
      long long v867 = 0u;
      long long v864 = 0u;
      long long v865 = 0u;
      id v399 = v371;
      uint64_t v422 = objc_msgSend_countByEnumeratingWithState_objects_count_(v399, v421, (uint64_t)&v864, (uint64_t)v881, 16);
      if (!v422) {
        goto LABEL_159;
      }
      uint64_t v423 = *(void *)v865;
LABEL_133:
      uint64_t v424 = 0;
      while (1)
      {
        if (*(void *)v865 != v423) {
          objc_enumerationMutation(v399);
        }
        v425 = *(void **)(*((void *)&v864 + 1) + 8 * v424);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v444 = v425;
          uint64_t v448 = objc_msgSend_isFromMe(v444, v445, v446, v447);
          if (objc_msgSend_partIndex(v444, v449, v450, v451) == OriginatorMessagePart)
          {
            v452 = [IMReplyContextDeletedMessageChatItem alloc];
            v436 = objc_msgSend_guid(v844, v453, v454, v455);
            uint64_t v459 = objc_msgSend_isFromMe(v844, v456, v457, v458);
            uint64_t v442 = objc_msgSend__initWithReplyItem_threadIdentifier_replyMessageGUID_replyIsFromMe_deletedMessageIsFromMe_(v452, v460, (uint64_t)v844, (uint64_t)v834, v436, v459, v448);
LABEL_143:
            v431 = (void *)v442;

LABEL_145:
            if (v431)
            {
              if (theArray) {
                CFArrayAppendValue(theArray, v431);
              }
              if (objc_msgSend__shouldAppendReplyCountIfNeeded(self, v443, v461, v462))
              {
                v466 = objc_msgSend_guid(v844, v463, v464, v465);
                uint64_t v470 = objc_msgSend_isFromMe(v844, v467, v468, v469);
                v472 = objc_msgSend__replyCountChatItemForChatItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_threadOriginatorMessageItem_(self, v471, (uint64_t)v431, (uint64_t)v844, v834, v466, v470, v831);

                if (v472) {
                  BOOL v473 = theArray != 0;
                }
                else {
                  BOOL v473 = 0;
                }
                if (v473) {
                  CFArrayAppendValue(theArray, v472);
                }
              }
              goto LABEL_159;
            }
            goto LABEL_146;
          }
LABEL_144:
          v431 = 0;
          goto LABEL_145;
        }
LABEL_146:
        if (v422 == ++v424)
        {
          uint64_t v422 = objc_msgSend_countByEnumeratingWithState_objects_count_(v399, v443, (uint64_t)&v864, (uint64_t)v881, 16);
          if (v422) {
            goto LABEL_133;
          }
LABEL_159:

LABEL_160:
          goto LABEL_161;
        }
      }
      id v426 = v425;
      if (objc_msgSend_index(v426, v427, v428, v429) == OriginatorMessagePart)
      {
        v431 = objc_msgSend_replyContextPreviewChatItemForReply_chatContext_(v426, v430, (uint64_t)v844, (uint64_t)v832);
        if (!v431)
        {
          v432 = [IMReplyContextDeletedMessageChatItem alloc];
          v436 = objc_msgSend_guid(v844, v433, v434, v435);
          uint64_t v440 = objc_msgSend_isFromMe(v844, v437, v438, v439);
          uint64_t v442 = objc_msgSend__initWithReplyItem_threadIdentifier_replyMessageGUID_replyIsFromMe_deletedMessageIsFromMe_(v432, v441, (uint64_t)v844, (uint64_t)v834, v436, v440, 0);
          goto LABEL_143;
        }
        goto LABEL_145;
      }
      goto LABEL_144;
    }
    v377 = [IMReplyContextDeletedMessageChatItem alloc];
    v381 = objc_msgSend_guid(v844, v378, v379, v380);
    uint64_t v385 = objc_msgSend_isFromMe(v844, v382, v383, v384);
    v830 = objc_msgSend__initWithReplyItem_threadIdentifier_replyMessageGUID_replyIsFromMe_deletedMessageIsFromMe_(v377, v386, (uint64_t)v844, (uint64_t)v834, v381, v385, 0);

    if (theArray && v830) {
      CFArrayAppendValue(theArray, v830);
    }
    if (objc_msgSend__shouldAppendReplyCountIfNeeded(self, v387, v388, v389))
    {
      v393 = objc_msgSend_guid(v844, v390, v391, v392);
      uint64_t v397 = objc_msgSend_isFromMe(v844, v394, v395, v396);
      objc_msgSend__replyCountChatItemForChatItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_threadOriginatorMessageItem_(self, v398, (uint64_t)v830, (uint64_t)v844, v834, v393, v397, 0);
      id v399 = (id)objc_claimAutoreleasedReturnValue();

      if (v399) {
        BOOL v400 = theArray != 0;
      }
      else {
        BOOL v400 = 0;
      }
      if (v400) {
        CFArrayAppendValue(theArray, v399);
      }
      goto LABEL_160;
    }
LABEL_161:
  }
  v474 = objc_msgSend_lastObject(self->_chatItems, v356, v357, v358);
  id v863 = 0;
  int shouldAppendNumberChangedForItem_previousItem_lastChatItem_outPhoneNumber = objc_msgSend__shouldAppendNumberChangedForItem_previousItem_lastChatItem_outPhoneNumber_(self, v475, (uint64_t)v848, (uint64_t)v847, v474, &v863);
  id v845 = v863;

  if (shouldAppendNumberChangedForItem_previousItem_lastChatItem_outPhoneNumber)
  {
    if (objc_msgSend_length(v845, v477, v478, v479))
    {
      v480 = [IMNumberChangedChatItem alloc];
      v484 = objc_msgSend__initWithItem_senderHandle_(v480, v481, (uint64_t)v848, (uint64_t)v845);
      if (theArray)
      {
        v485 = objc_msgSend_chatItemForIMChatItem_(self, v482, (uint64_t)v484, v483);
        BOOL v486 = v485 == 0;

        if (!v486)
        {
          v489 = objc_msgSend_chatItemForIMChatItem_(self, v487, (uint64_t)v484, v488);
          CFArrayAppendValue(theArray, v489);
        }
      }
    }
    else
    {
      v484 = IMLogHandleForCategory();
      if (os_log_type_enabled(v484, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB9328(v484);
      }
    }
  }
  id v490 = objc_loadWeakRetained(location);
  int v491 = sub_1A4C14370(v490, v848, v847, v837);

  if (v491)
  {
    if (objc_msgSend_isReply(v848, v492, v493, v494))
    {
      id v495 = v848;
      v496 = [IMReplySenderChatItem alloc];
      v500 = objc_msgSend__senderHandle(v495, v497, v498, v499);
      v504 = objc_msgSend_threadIdentifier(v495, v501, v502, v503);
      v506 = objc_msgSend__initWithItem_handle_threadIdentifier_(v496, v505, (uint64_t)v495, (uint64_t)v500, v504);

      if (theArray)
      {
        v509 = objc_msgSend_chatItemForIMChatItem_(self, v507, (uint64_t)v506, v508);
        BOOL v510 = v509 == 0;

        if (!v510)
        {
          v513 = objc_msgSend_chatItemForIMChatItem_(self, v511, (uint64_t)v506, v512);
          CFArrayAppendValue(theArray, v513);
        }
      }
    }
    else
    {
      id v514 = objc_loadWeakRetained(location);
      int v518 = objc_msgSend_isStewieSharingChat(v514, v515, v516, v517);

      if (v518)
      {
        v522 = objc_msgSend__senderHandle(v848, v519, v520, v521);
        id v523 = objc_loadWeakRetained(location);
        v526 = objc_msgSend_displayNameForChat_(v522, v524, (uint64_t)v523, v525);

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v530 = objc_msgSend_transcriptSharingMessageType(v848, v527, v528, v529);
        }
        else {
          uint64_t v530 = 1;
        }
        v536 = [IMSenderChatItem alloc];
        v540 = objc_msgSend__senderHandle(v848, v537, v538, v539);
        id v495 = (id)objc_msgSend__initWithItem_handle_displayName_transcriptSharingMessageType_(v536, v541, (uint64_t)v848, (uint64_t)v540, v526, v530);
      }
      else
      {
        v531 = [IMSenderChatItem alloc];
        v526 = objc_msgSend__senderHandle(v848, v532, v533, v534);
        id v495 = (id)objc_msgSend__initWithItem_handle_(v531, v535, (uint64_t)v848, (uint64_t)v526);
      }

      if (!theArray) {
        goto LABEL_185;
      }
      v544 = objc_msgSend_chatItemForIMChatItem_(self, v542, (uint64_t)v495, v543);
      BOOL v545 = v544 == 0;

      if (v545) {
        goto LABEL_185;
      }
      v506 = objc_msgSend_chatItemForIMChatItem_(self, v546, (uint64_t)v495, v547);
      CFArrayAppendValue(theArray, v506);
    }

LABEL_185:
  }
  if (!hasMessageChatItem) {
    goto LABEL_301;
  }
  if (v840)
  {
    long long v861 = 0u;
    long long v862 = 0u;
    long long v859 = 0u;
    long long v860 = 0u;
    id v548 = v840;
    uint64_t v552 = objc_msgSend_countByEnumeratingWithState_objects_count_(v548, v549, (uint64_t)&v859, (uint64_t)v880, 16);
    if (v552)
    {
      uint64_t v553 = *(void *)v860;
      do
      {
        for (uint64_t k = 0; k != v552; ++k)
        {
          if (*(void *)v860 != v553) {
            objc_enumerationMutation(v548);
          }
          uint64_t v555 = *(void *)(*((void *)&v859 + 1) + 8 * k);
          v556 = objc_msgSend_chatItemForIMChatItem_(self, v550, v555, v551);
          v560 = objc_msgSend_lastObject(theArray, v557, v558, v559);
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();

          objc_opt_class();
          if (isKindOfClass & objc_opt_isKindOfClass())
          {
            uint64_t v565 = objc_msgSend_count(theArray, v562, v563, v564);
            objc_msgSend_insertObject_atIndex_(theArray, v566, v555, v565 - 1);
          }
          else if (theArray && v556)
          {
            CFArrayAppendValue(theArray, v556);
          }
        }
        uint64_t v552 = objc_msgSend_countByEnumeratingWithState_objects_count_(v548, v550, (uint64_t)&v859, (uint64_t)v880, 16);
      }
      while (v552);
    }
    goto LABEL_204;
  }
  if (theArray)
  {
    v567 = objc_msgSend_chatItemForIMChatItem_(self, v492, (uint64_t)v842, v494);
    BOOL v568 = v567 == 0;

    if (!v568)
    {
      objc_msgSend_chatItemForIMChatItem_(self, v569, (uint64_t)v842, v570);
      id v548 = (id)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(theArray, v548);
LABEL_204:
    }
  }
  objc_opt_class();
  char v571 = objc_opt_isKindOfClass();
  if (sub_1A4C146DC(v848) || (v571 & 1) == 0) {
    goto LABEL_301;
  }
  id v572 = v848;
  uint64_t v579 = objc_msgSend_expireState(v572, v573, v574, v575);
  if (v579 == 1)
  {
    if ((objc_msgSend_isFromMe(v572, v576, v577, v578) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v580 >= 3.0))
    {
      uint64_t v581 = 3;
    }
    else
    {
      uint64_t v581 = 2;
    }
    uint64_t v839 = v581;
  }
  else
  {
    uint64_t v839 = 0;
  }

  if (objc_msgSend_isFromMe(v572, v582, v583, v584))
  {
    if (objc_msgSend_errorCode(v572, v585, v586, v587))
    {
      if (objc_msgSend_errorCode(v572, v588, v589, v590) == 43)
      {
        v591 = [IMMessageStatusChatItem alloc];
        v595 = objc_msgSend_time(v572, v592, v593, v594);
        uint64_t v597 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v591, v596, (uint64_t)v572, 16, v595, 0, v839, 0);
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v687 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v687, OS_LOG_TYPE_INFO))
          {
            int v691 = objc_msgSend_errorCode(v572, v688, v689, v690);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v879 = v691;
            *(_WORD *)&v879[4] = 2112;
            *(void *)&v879[6] = v572;
            _os_log_impl(&dword_1A4AF7000, v687, OS_LOG_TYPE_INFO, "Generating not delivered status item with error code %d for message %@", buf, 0x12u);
          }
        }
        v692 = [IMMessageStatusChatItem alloc];
        v595 = objc_msgSend_time(v572, v693, v694, v695);
        uint64_t v597 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v692, v696, (uint64_t)v572, 10, v595, 0, v839, 0);
      }
    }
    else
    {
      if (!objc_msgSend_wasDowngraded(v572, v588, v589, v590)
        || !objc_msgSend__canShowDowngradeBreadcrumb(v572, v653, v654, v655))
      {
        v697 = 0;
LABEL_246:
        v698 = objc_msgSend_chat(self, v653, v654, v655);
        int shouldAppendSendViaSatelliteForChat_item_previousItem = objc_msgSend__shouldAppendSendViaSatelliteForChat_item_previousItem_(self, v699, (uint64_t)v698, (uint64_t)v572, v847);

        if (shouldAppendSendViaSatelliteForChat_item_previousItem)
        {
          v701 = [IMMessageStatusChatItem alloc];
          v705 = objc_msgSend_time(v572, v702, v703, v704);
          v598 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v701, v706, (uint64_t)v572, 33, v705, 0, v839, 0);

          id v707 = objc_loadWeakRetained(location);
          v711 = objc_msgSend_participants(v707, v708, v709, v710);
          v715 = objc_msgSend_firstObject(v711, v712, v713, v714);
          v719 = objc_msgSend__displayNameWithAbbreviation(v715, v716, v717, v718);
          objc_msgSend_setRecipientDisplayName_(v598, v720, (uint64_t)v719, v721);
        }
        else
        {
          v598 = v697;
        }
        goto LABEL_249;
      }
      long long v857 = 0u;
      long long v858 = 0u;
      long long v855 = 0u;
      long long v856 = 0u;
      id v656 = objc_loadWeakRetained(location);
      v660 = objc_msgSend_participants(v656, v657, v658, v659);

      uint64_t v665 = objc_msgSend_countByEnumeratingWithState_objects_count_(v660, v661, (uint64_t)&v855, (uint64_t)v877, 16);
      if (v665)
      {
        uint64_t v666 = *(void *)v856;
        uint64_t v667 = 9;
LABEL_228:
        uint64_t v668 = 0;
        while (1)
        {
          if (*(void *)v856 != v666) {
            objc_enumerationMutation(v660);
          }
          v669 = objc_msgSend_ID(*(void **)(*((void *)&v855 + 1) + 8 * v668), v662, v663, v664);
          char v673 = objc_msgSend__appearsToBeEmail(v669, v670, v671, v672);

          if (v673) {
            break;
          }
          if (v665 == ++v668)
          {
            uint64_t v665 = objc_msgSend_countByEnumeratingWithState_objects_count_(v660, v662, (uint64_t)&v855, (uint64_t)v877, 16);
            if (v665) {
              goto LABEL_228;
            }
            goto LABEL_234;
          }
        }
      }
      else
      {
LABEL_234:
        uint64_t v667 = 7;
      }

      v677 = objc_msgSend_originalServiceName(v572, v674, v675, v676);
      int v680 = objc_msgSend_isEqualToString_(v677, v678, *MEMORY[0x1E4F6E198], v679);

      if (v680) {
        uint64_t v681 = 8;
      }
      else {
        uint64_t v681 = v667;
      }
      v682 = [IMMessageStatusChatItem alloc];
      v595 = objc_msgSend_time(v572, v683, v684, v685);
      uint64_t v597 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v682, v686, (uint64_t)v572, v681, v595, 0, v839, 0);
    }
    v697 = (void *)v597;

    goto LABEL_246;
  }
  v598 = 0;
LABEL_249:
  long long v853 = 0u;
  long long v854 = 0u;
  long long v851 = 0u;
  long long v852 = 0u;
  v722 = objc_msgSend_syndicationRanges(v572, v585, v586, v587);
  uint64_t v727 = objc_msgSend_countByEnumeratingWithState_objects_count_(v722, v723, (uint64_t)&v851, (uint64_t)v876, 16);
  if (!v727) {
    goto LABEL_265;
  }
  uint64_t v728 = *(void *)v852;
  do
  {
    for (uint64_t m = 0; m != v727; ++m)
    {
      if (*(void *)v852 != v728) {
        objc_enumerationMutation(v722);
      }
      uint64_t v730 = objc_msgSend_syndicationStatus(*(void **)(*((void *)&v851 + 1) + 8 * m), v724, v725, v726);
      if (v730 == 1)
      {
        uint64_t v732 = 0;
      }
      else
      {
        v731 = 0;
        if (v730 != 2) {
          goto LABEL_263;
        }
        uint64_t v732 = 1;
      }
      v733 = [IMSyndicationStatusChatItem alloc];
      v731 = objc_msgSend__initWithItem_withSyndicationStatus_statusItemSequenceNumber_(v733, v734, (uint64_t)v572, v732, 0);
      if (v731) {
        BOOL v735 = theArray == 0;
      }
      else {
        BOOL v735 = 1;
      }
      if (!v735) {
        CFArrayAppendValue(theArray, v731);
      }
LABEL_263:
    }
    uint64_t v727 = objc_msgSend_countByEnumeratingWithState_objects_count_(v722, v724, (uint64_t)&v851, (uint64_t)v876, 16);
  }
  while (v727);
LABEL_265:

  BOOL v739 = v579 != 1;
  if (v598) {
    BOOL v739 = 1;
  }
  if (!v739)
  {
    v740 = [IMMessageStatusChatItem alloc];
    v598 = objc_msgSend__initWithItem_expireStatusType_count_statusItemSequenceNumber_(v740, v741, (uint64_t)v572, v839, 0, 0);
  }
  if (v598)
  {
    if (theArray)
    {
      v742 = objc_msgSend_chatItemForIMChatItem_(self, v736, (uint64_t)v598, v738);
      BOOL v743 = v742 == 0;

      if (!v743)
      {
        v744 = objc_msgSend_chatItemForIMChatItem_(self, v736, (uint64_t)v598, v738);
        CFArrayAppendValue(theArray, v744);
      }
    }
  }
  v745 = objc_msgSend_balloonBundleID(v572, v736, v737, v738);
  if (!objc_msgSend_length(v745, v746, v747, v748)) {
    goto LABEL_283;
  }
  BOOL v752 = objc_msgSend_associatedMessageType(v572, v749, v750, v751) == 3;

  if (!v752)
  {
    v756 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v753, v754, v755);
    v760 = objc_msgSend_pluginSessionGUID(v572, v757, v758, v759);
    v764 = objc_msgSend_balloonBundleID(v572, v761, v762, v763);
    v745 = objc_msgSend_existingDataSourceForMessageGUID_bundleID_(v756, v765, (uint64_t)v760, (uint64_t)v764);

    if (objc_msgSend_wantsStatusItem(v745, v766, v767, v768))
    {
      v772 = objc_msgSend_pluginPayload(v745, v769, v770, v771);
      v776 = objc_msgSend_pluginBundleID(v772, v773, v774, v775);
      int v779 = objc_msgSend_isEqualToString_(v776, v777, *MEMORY[0x1E4F6CC10], v778);

      if (v779)
      {
        v780 = [IMTranscriptPluginStatusChatItem alloc];
        v784 = objc_msgSend__initWithItem_dataSource_statusItemSequenceNumber_(v780, v781, (uint64_t)v572, (uint64_t)v745, 0);
        if (theArray) {
          goto LABEL_280;
        }
      }
      else
      {
        v785 = [IMTranscriptPluginBreadcrumbChatItem alloc];
        v789 = objc_msgSend_statusString(v745, v786, v787, v788);
        v784 = objc_msgSend__initWithItem_datasource_statusText_optionFlags_(v785, v790, (uint64_t)v572, (uint64_t)v745, v789, 0);

        if (theArray)
        {
LABEL_280:
          v791 = objc_msgSend_chatItemForIMChatItem_(self, v782, (uint64_t)v784, v783);
          BOOL v792 = v791 == 0;

          if (!v792)
          {
            v795 = objc_msgSend_chatItemForIMChatItem_(self, v793, (uint64_t)v784, v794);
            CFArrayAppendValue(theArray, v795);
          }
        }
      }
    }
LABEL_283:
  }
  v796 = objc_msgSend_expressiveSendStyleID(v572, v753, v754, v755);
  int shouldShowExpressiveMessageTextAsText = objc_msgSend_shouldShowExpressiveMessageTextAsText_(self, v797, (uint64_t)v796, v798);

  if (shouldShowExpressiveMessageTextAsText)
  {
    v803 = objc_msgSend__localizedBackwardsCompatibleExpressiveSendText(v572, v800, v801, v802);
    if (v803)
    {
      v804 = [IMExpressiveSendAsTextChatItem alloc];
      v808 = objc_msgSend__initWithItem_text_(v804, v805, (uint64_t)v572, (uint64_t)v803);
      if (v808) {
        BOOL v809 = theArray == 0;
      }
      else {
        BOOL v809 = 1;
      }
      if (!v809)
      {
        v810 = objc_msgSend_chatItemForIMChatItem_(self, v806, (uint64_t)v808, v807);
        BOOL v811 = v810 == 0;

        if (!v811)
        {
          v814 = objc_msgSend_chatItemForIMChatItem_(self, v812, (uint64_t)v808, v813);
          CFArrayAppendValue(theArray, v814);
        }
      }
    }
    goto LABEL_299;
  }
  if (objc_msgSend__shouldShowEffectPlayButtonForMessage_(self, v800, (uint64_t)v572, v802))
  {
    v815 = [IMMessageEffectControlChatItem alloc];
    v819 = objc_msgSend_expressiveSendStyleID(v572, v816, v817, v818);
    v803 = objc_msgSend__initWithItem_effectStyleID_statusItemSequenceNumber_(v815, v820, (uint64_t)v572, (uint64_t)v819, 0);

    if (v803) {
      BOOL v821 = theArray == 0;
    }
    else {
      BOOL v821 = 1;
    }
    if (!v821) {
      CFArrayAppendValue(theArray, v803);
    }
LABEL_299:
  }
LABEL_301:

LABEL_302:
LABEL_303:
  if (!objc_msgSend_count(theArray, v11, v12, v13) && IMOSLoggingEnabled())
  {
    v822 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v822, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_guid(v848, v823, v824, v825);
      id v826 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)v879 = v826;
      _os_log_impl(&dword_1A4AF7000, v822, OS_LOG_TYPE_INFO, "Generated no final chat items for item with GUID: %@", buf, 0xCu);
    }
  }
  v340 = theArray;
  v827 = theArray;
LABEL_309:

  return theArray;
}

- (id)_chatItemsWithReplyCountsForNewChatItems:(id)a3 parentItem:(id)a4 threadOriginatorItem:(id)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((objc_msgSend__shouldAppendReplyCountIfNeeded(self, v11, v12, v13) & 1) == 0)
  {
    id v33 = v8;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  uint64_t v19 = v15;
  if (v15
    && (objc_msgSend_replyCountsByPart(v15, v16, v17, v18),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v24 = objc_msgSend_count(v20, v21, v22, v23),
        v20,
        v24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = sub_1A4C149F0;
      v40[3] = &unk_1E5B7E3B8;
      v40[4] = self;
      id v41 = v9;
      id v42 = v19;
      id v43 = v25;
      id v26 = v25;
      objc_msgSend_enumerateObjectsUsingBlock_(v8, v27, (uint64_t)v40, v28);
      if (objc_msgSend_count(v26, v29, v30, v31)) {
        uint64_t v32 = v26;
      }
      else {
        uint64_t v32 = 0;
      }
      id v33 = v32;

      goto LABEL_17;
    }
    id v26 = v8;
    uint64_t v36 = objc_msgSend__replyCountChatItemForChatItem_parentItem_threadOriginatorMessageItem_(self, v35, (uint64_t)v26, (uint64_t)v9, v19);
    if (v36)
    {
      v38 = (void *)v36;
      v44[0] = v26;
      v44[1] = v36;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v44, 2);
      id v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }

    id v34 = v26;
  }
  else
  {
    id v34 = v8;
  }
  id v33 = v34;
LABEL_18:

LABEL_19:

  return v33;
}

- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadOriginatorMessageItem:(id)a5
{
  return (id)objc_msgSend__replyCountChatItemForChatItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_threadOriginatorMessageItem_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, a5);
}

- (id)_replyCountChatItemForChatItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 threadOriginatorMessageItem:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;
  uint64_t v23 = objc_msgSend_replyCount(v19, v20, v21, v22);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v25 = 0;
  if (v23 && (isKindOfClass & 1) == 0)
  {
    if (!v15)
    {
      IMCreateThreadIdentifierForMessagePartChatItem(v19);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v26 = [IMMessageReplyCountChatItem alloc];
    id v25 = objc_msgSend__initWithItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_count_statusItemSequenceNumber_(v26, v27, (uint64_t)v17, (uint64_t)v14, v15, v16, v9, v23, 0);
  }

  return v25;
}

- (BOOL)_shouldRegenerateChatItemsForItem:(id)a3 previousItem:(id)a4 oldPreviousItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 == v10)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    LOBYTE(v12) = 1;
    if (v9 && v10)
    {
      p_chat = &self->_chat;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
      uint64_t v18 = objc_msgSend_chatStyle(WeakRetained, v15, v16, v17);

      id v19 = objc_loadWeakRetained((id *)&self->_chat);
      int shouldAppendServiceForChat_item_previousItem_chatStyle = objc_msgSend__shouldAppendServiceForChat_item_previousItem_chatStyle_(self, v20, (uint64_t)v19, (uint64_t)v8, v9, v18);
      id v22 = objc_loadWeakRetained((id *)&self->_chat);
      int v24 = objc_msgSend__shouldAppendServiceForChat_item_previousItem_chatStyle_(self, v23, (uint64_t)v22, (uint64_t)v8, v11, v18);

      if (shouldAppendServiceForChat_item_previousItem_chatStyle == v24
        && (shouldAppendDateForItem_previousIteuint64_t m = objc_msgSend__shouldAppendDateForItem_previousItem_(self, v25, (uint64_t)v8, (uint64_t)v9), shouldAppendDateForItem_previousItem == objc_msgSend__shouldAppendDateForItem_previousItem_(self, v27, (uint64_t)v8, (uint64_t)v11))&& (shouldAppendReplyContextForItem_previousItem_chatStyle = objc_msgSend__shouldAppendReplyContextForItem_previousItem_chatStyle_(self, v28, (uint64_t)v8, (uint64_t)v9, v18), shouldAppendReplyContextForItem_previousItem_chatStyle == objc_msgSend__shouldAppendReplyContextForItem_previousItem_chatStyle_(self, v30, (uint64_t)v8,
                                                                                      (uint64_t)v11,
                                                                                      v18)))
      {
        id v32 = objc_loadWeakRetained((id *)&self->_chat);
        int v33 = sub_1A4C14370(v32, v8, v9, v18);
        id v34 = objc_loadWeakRetained((id *)p_chat);
        int v12 = v33 ^ sub_1A4C14370(v34, v8, v11, v18);
      }
      else
      {
        LOBYTE(v12) = 1;
      }
    }
  }

  return v12;
}

- (BOOL)_supportsContiguousChatItems
{
  return 1;
}

- (BOOL)_hasEarlierMessagesToLoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  char hasMoreMessagesToLoad = objc_msgSend_hasMoreMessagesToLoad(WeakRetained, v3, v4, v5);

  return hasMoreMessagesToLoad;
}

- (BOOL)_hasRecentMessagesToLoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  char hasMoreRecentMessagesToLoad = objc_msgSend_hasMoreRecentMessagesToLoad(WeakRetained, v3, v4, v5);

  return hasMoreRecentMessagesToLoad;
}

- (BOOL)_shouldAppendReplyContextForItem:(id)a3 previousItem:(id)a4 chatStyle:(unsigned __int8)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  if objc_msgSend_isReply(v8, v10, v11, v12) && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!_IMScheduledMessageShouldBePinnedToBottom(v8) || _IMScheduledMessageShouldBePinnedToBottom(v9)))
    {
      uint64_t v16 = objc_msgSend_threadIdentifier(v8, v13, v14, v15);
      uint64_t v17 = IMMessageThreadIdentifierGetOriginatorGUID();
      uint64_t v21 = objc_msgSend_message(v9, v18, v19, v20);
      id v25 = objc_msgSend_guid(v21, v22, v23, v24);
      int isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)v17, v27);

      if (isEqualToString)
      {
        if (!sub_1A4C146DC(v9))
        {
          uint64_t OriginatorMessagePart = IMMessageThreadIdentifierGetOriginatorMessagePart();
          uint64_t v60 = 0;
          uint64_t v61 = &v60;
          uint64_t v62 = 0x2020000000;
          uint64_t v63 = 0;
          uint64_t v36 = objc_msgSend_text(v21, v33, v34, v35);
          uint64_t v40 = objc_msgSend_length(v36, v37, v38, v39);
          uint64_t v41 = *MEMORY[0x1E4F6C1F8];
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = sub_1A4C150A4;
          v59[3] = &unk_1E5B7E3E0;
          v59[4] = &v60;
          objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v36, v42, v41, 0, v40, 2, v59);
          BOOL v43 = v61[3] != OriginatorMessagePart;

          _Block_object_dispose(&v60, 8);
LABEL_18:

          goto LABEL_10;
        }
      }
      else
      {
        if (objc_msgSend_isReply(v9, v29, v30, v31))
        {
          uint64_t v48 = objc_msgSend_threadIdentifier(v9, v45, v46, v47);
          char v51 = objc_msgSend_isEqualToString_(v48, v49, (uint64_t)v16, v50);

          if (v51)
          {
            BOOL v43 = 0;
            goto LABEL_18;
          }
        }
        if (sub_1A4C146DC(v8))
        {
          uint64_t v55 = objc_msgSend_threadOriginator(v8, v52, v53, v54);
          uint64_t v56 = IMMessageThreadIdentifierGetOriginatorMessagePart();
          BOOL v43 = objc_msgSend_replyCountForPartIndex_(v55, v57, v56, v58) != 0;

          goto LABEL_18;
        }
      }
      BOOL v43 = 1;
      goto LABEL_18;
    }
    BOOL v43 = 1;
  }
  else
  {
    BOOL v43 = 0;
  }
LABEL_10:

  return v43;
}

- (BOOL)_shouldAppendReplyCountIfNeeded
{
  return 1;
}

- (BOOL)_shouldAppendBlockContacts
{
  return 1;
}

- (id)_filteredChatItemsForNewChatItems:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)_shouldAppendScheduledSectionLabelForItem:(id)a3 previousItem:(id)a4
{
  id v4 = a4;
  id v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isScheduledMessagesEnabled = objc_msgSend_isScheduledMessagesEnabled(v8, v9, v10, v11);

  if (isScheduledMessagesEnabled)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v4;
      if (objc_msgSend_scheduleType(v13, v14, v15, v16) == 2)
      {
        unint64_t v20 = objc_msgSend_scheduleState(v13, v17, v18, v19);
        if (v20 <= 5) {
          int isScheduledMessagesEnabled = (9u >> v20) & 1;
        }
        else {
          LOBYTE(isScheduledMessagesEnabled) = 1;
        }
      }
      else
      {
        LOBYTE(isScheduledMessagesEnabled) = 1;
      }
    }
    else
    {
      LOBYTE(isScheduledMessagesEnabled) = 1;
    }
  }

  return isScheduledMessagesEnabled;
}

- (BOOL)_shouldAppendScheduledSectionDateForItem:(id)a3 previousItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v9, v10, v11);
  int isScheduledMessagesEnabled = objc_msgSend_isScheduledMessagesEnabled(v12, v13, v14, v15);

  if (isScheduledMessagesEnabled)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    if (objc_msgSend_changeType(v7, v17, v18, v19)) {
      goto LABEL_6;
    }
    uint64_t v23 = objc_msgSend__senderHandle(v7, v20, v21, v22);
    uint64_t v27 = objc_msgSend_ID(v23, v24, v25, v26);

    uint64_t v31 = objc_msgSend__otherHandle(v7, v28, v29, v30);
    uint64_t v35 = objc_msgSend_ID((void *)v31, v32, v33, v34);

    LOBYTE(v31) = objc_msgSend_isEqualToString_(v27, v36, (uint64_t)v35, v37);
    if ((v31 & 1) == 0)
    {
LABEL_6:
      id v39 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_scheduleType(v39, v40, v41, v42) != 2)
      {
        BOOL v38 = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v46 = objc_msgSend_scheduleState(v39, v43, v44, v45);
      BOOL v38 = 0;
      if (!v46 || v46 == 3) {
        goto LABEL_17;
      }
      uint64_t v50 = objc_msgSend_time(v39, v47, v48, v49);
      uint64_t v54 = objc_msgSend_time(v8, v51, v52, v53);
      objc_msgSend_timeIntervalSinceDate_(v50, v55, (uint64_t)v54, v56);
      BOOL v58 = fabs(v57) >= 300.0;

      id v59 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_scheduleType(v59, v60, v61, v62) == 2)
      {
        uint64_t v66 = objc_msgSend_scheduleState(v59, v63, v64, v65);
        if ((unint64_t)(v66 - 4) >= 2)
        {
          BOOL v38 = 1;
          if (!v66 || v66 == 3) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
        uint64_t v71 = objc_msgSend_scheduleState(v39, v67, v68, v69);
        if (v71 == objc_msgSend_scheduleState(v59, v72, v73, v74))
        {
LABEL_20:
          BOOL v38 = v58;
LABEL_22:

          goto LABEL_17;
        }
      }
      BOOL v38 = 1;
      goto LABEL_22;
    }
  }
  BOOL v38 = 0;
LABEL_18:

  return v38;
}

- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4
{
  return sub_1A4C1546C(a3, a4);
}

- (BOOL)_shouldAppendServiceForChat:(id)a3 item:(id)a4 previousItem:(id)a5 chatStyle:(unsigned __int8)a6
{
  return sub_1A4C155B4(a3, a4, a5);
}

- (BOOL)_shouldAppendStewieSharingSummaryForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  BOOL result = objc_msgSend_isStewieSharingChat(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (a5) {
    return 0;
  }
  return result;
}

- (BOOL)_shouldAppendStoppedSharingForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  id v6 = a4;
  if (objc_msgSend_isStewieSharingChat(a3, v7, v8, v9))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldShowReportSpamForChat:(id)a3 withItems:(id)a4
{
  return sub_1A4C158B0(a3, a4);
}

- (BOOL)_shouldAppendSendViaSatelliteForChat:(id)a3 item:(id)a4 previousItem:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v11, v12, v13, v14);

  if (isCarrierPigeonEnabled
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend_isPendingSatelliteSend(v7, v16, v17, v18))
  {
    uint64_t v22 = objc_msgSend_message(v7, v19, v20, v21);
    uint64_t v26 = objc_msgSend_lastPendingSatelliteSendMessage(v6, v23, v24, v25);
    BOOL v27 = v22 == v26;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)_shouldAppendSentViaSatelliteForChat:(id)a3 message:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v10, v11, v12, v13);

  if (!isCarrierPigeonEnabled) {
    goto LABEL_27;
  }
  uint64_t v18 = objc_msgSend__service(v6, v15, v16, v17);
  uint64_t v22 = objc_msgSend_name(v18, v19, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x1E4F6E1B8], v24);

  if (!isEqualToString) {
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = objc_msgSend_guid(v6, v30, v31, v32);
      int v46 = 138412290;
      uint64_t v47 = v33;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Checking if we should append sent via satellite for message: %@", (uint8_t *)&v46, 0xCu);
    }
  }
  if ((objc_msgSend_sentOrReceivedOffGrid(v6, v26, v27, v28) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Message was not sent off grid", (uint8_t *)&v46, 2u);
      }
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (objc_msgSend_isPendingSatelliteSend(v6, v34, v35, v36))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Message is pending", (uint8_t *)&v46, 2u);
      }
LABEL_26:

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  char isSent = objc_msgSend_isSent(v6, v37, v38, v39);
  int v42 = IMOSLoggingEnabled();
  if ((isSent & 1) == 0)
  {
    if (v42)
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Message is not sent yet", (uint8_t *)&v46, 2u);
      }
      goto LABEL_26;
    }
LABEL_27:
    BOOL v44 = 0;
    goto LABEL_28;
  }
  if (v42)
  {
    BOOL v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Appending sent via satellite for message", (uint8_t *)&v46, 2u);
    }
  }
  BOOL v44 = 1;
LABEL_28:

  return v44;
}

- (BOOL)_shouldShowStewieResumeButtonsForChat:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isStewieEmergencyChat(v3, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_sharedInstance(IMChorosMonitor, v7, v8, v9);
    char isStewieEmergencyActive = objc_msgSend_isStewieEmergencyActive(v10, v11, v12, v13);
  }
  else
  {
    if (!objc_msgSend_isStewieRoadsideChat(v3, v7, v8, v9))
    {
      char v21 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = objc_msgSend_sharedInstance(IMChorosMonitor, v15, v16, v17);
    char isStewieEmergencyActive = objc_msgSend_isStewieRoadsideActive(v10, v18, v19, v20);
  }
  char v21 = isStewieEmergencyActive ^ 1;

LABEL_7:
  return v21;
}

- (BOOL)_shouldShowBlockContactForChat:(id)a3 withItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E6D0], v9, v10, v11);
  uint64_t v16 = objc_msgSend_enablementGroup(v12, v13, v14, v15);

  if (v16 == 1 && (objc_msgSend_allParticipantsBlocked(v7, v17, v18, v19) & 1) == 0)
  {
    uint64_t v23 = objc_msgSend___imArrayByFilteringWithBlock_(v8, v20, (uint64_t)&unk_1EF8E6768, v21);
    if (objc_msgSend_count(v23, v24, v25, v26)
      && (objc_msgSend_chatStyle(v7, v27, v28, v29) != 43 || objc_msgSend_joinState(v7, v30, v31, v32)))
    {
      if (objc_msgSend_hasCommSafetySensitiveMessage(v7, v30, v31, v32)
        && (objc_msgSend_isCommSafetySensitiveMessageRecent(v7, v33, v34, v35) & 1) != 0)
      {
        BOOL v22 = 1;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend_shouldBeAllowListed(v7, v33, v34, v35);
    }
    BOOL v22 = 0;
    goto LABEL_12;
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)_shouldAppendNumberChangedForItem:(id)a3 previousItem:(id)a4 lastChatItem:(id)a5 outPhoneNumber:(id *)a6
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  char isStewieChat = objc_msgSend_isStewieChat(WeakRetained, v13, v14, v15);

  if ((isStewieChat & 1) != 0 || !objc_msgSend__hasMultipleActiveSubscriptions(self, v17, v18, v19)) {
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  uint64_t v27 = objc_msgSend_destinationCallerID(v10, v20, v21, v22);
  if (v27)
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F6B3E8];
    uint64_t v29 = objc_msgSend_destinationCallerID(v9, v24, v25, v26);
    uint64_t v33 = objc_msgSend_destinationCallerID(v10, v30, v31, v32);
    if (objc_msgSend_isPhoneNumber_equivalentToExistingPhoneNumber_(v28, v34, (uint64_t)v29, (uint64_t)v33))
    {
      uint64_t v108 = objc_msgSend_accountID(v9, v35, v36, v37);
      uint64_t v41 = objc_msgSend_accountID(v10, v38, v39, v40);
      int v42 = v9;
      id v43 = v11;
      int v44 = isKindOfClass;
      int isKindOfClass = objc_msgSend_isEqualToString_(v108, v45, (uint64_t)v41, v46) ^ 1;
    }
    else
    {
      int v42 = v9;
      id v43 = v11;
      int v44 = isKindOfClass;
      int isKindOfClass = 1;
    }

    int v50 = v44 & isKindOfClass;
    LOBYTE(isKindOfClass) = v44;
    id v11 = v43;
    id v9 = v42;
    if (v50 == 1)
    {
      char v51 = objc_msgSend_destinationCallerID(v10, v47, v48, v49);
      objc_msgSend_setDestinationCallerID_(v42, v52, (uint64_t)v51, v53);

      double v57 = objc_msgSend_accountID(v10, v54, v55, v56);
      objc_msgSend_setAccountID_(v42, v58, (uint64_t)v57, v59);
    }
  }
  uint64_t v60 = objc_opt_class();
  if (v60 == objc_opt_class()) {
    goto LABEL_22;
  }
  uint64_t v61 = objc_opt_class();
  if (!((v61 != objc_opt_class()) | isKindOfClass & 1))
  {
    objc_msgSend__currentChatSubscriptionLabel(self, v62, v63, v64);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    if (!IMOSLoggingEnabled())
    {
LABEL_33:
      BOOL v93 = 1;
      goto LABEL_23;
    }
    v77 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      id v95 = *a6;
      *(_DWORD *)buf = 138412290;
      id v111 = v95;
      _os_log_impl(&dword_1A4AF7000, v77, OS_LOG_TYPE_INFO, "Found a SIM switch item with label %@, replacing it with Number Changed item", buf, 0xCu);
    }
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v68 = objc_msgSend_destinationCallerID(v9, v62, v63, v64);
  if (!v68) {
    goto LABEL_22;
  }
  uint64_t v69 = objc_msgSend_destinationCallerID(v9, v65, v66, v67);
  int IsPhoneNumber = objc_msgSend_destinationIdIsPhoneNumber(v69, v70, v71, v72);

  if (!IsPhoneNumber) {
    goto LABEL_22;
  }
  v77 = objc_msgSend_destinationCallerID(v9, v74, v75, v76);
  uint64_t v78 = (void *)MEMORY[0x1E4F6B3E8];
  uint64_t v82 = objc_msgSend_destinationCallerID(v10, v79, v80, v81);
  char isPhoneNumber_equivalentToExistingPhoneNumber = objc_msgSend_isPhoneNumber_equivalentToExistingPhoneNumber_(v78, v83, (uint64_t)v77, (uint64_t)v82);

  uint64_t v88 = objc_msgSend_destinationCallerID(v10, v85, v86, v87);
  if (v88) {
    char v89 = isPhoneNumber_equivalentToExistingPhoneNumber;
  }
  else {
    char v89 = 1;
  }

  if ((v89 & 1) == 0)
  {
    id v96 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v90, v91, v92);
    v100 = objc_msgSend_ctSubscriptionInfo(v96, v97, v98, v99);
    objc_msgSend___im_labelForPhoneNumber_simID_(v100, v101, (uint64_t)v77, (uint64_t)v77);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      id v102 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
      {
        v106 = objc_msgSend_destinationCallerID(v10, v103, v104, v105);
        id v107 = *a6;
        *(_DWORD *)buf = 138412802;
        id v111 = v106;
        __int16 v112 = 2112;
        uint64_t v113 = v77;
        __int16 v114 = 2112;
        id v115 = v107;
        _os_log_impl(&dword_1A4AF7000, v102, OS_LOG_TYPE_INFO, "Destination caller ID changed from: %@ to: %@, label: %@", buf, 0x20u);
      }
    }
    goto LABEL_32;
  }

LABEL_22:
  BOOL v93 = 0;
LABEL_23:

  return v93;
}

- (BOOL)_hasMultipleActiveSubscriptions
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], a2, v2, v3);
  id v8 = objc_msgSend_ctSubscriptionInfo(v4, v5, v6, v7);

  if (v8) {
    char HasActiveSlots = objc_msgSend___im_onlyHasActiveSlots(v8, v9, v10, v11);
  }
  else {
    char HasActiveSlots = 0;
  }

  return HasActiveSlots;
}

- (BOOL)_updateAggregateAttachmentMessagePartAssociatedItems:(id)a3 map:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v39 = v6;
    objc_msgSend_aggregateAttachmentParts(v6, v8, v9, v10);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v13)
    {
      uint64_t v14 = v13;
      char v11 = 0;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = sub_1A4C16BDC(v17, v7);
          if (v18)
          {
            uint64_t v22 = v18;
            uint64_t v23 = sub_1A4C16E78(v18);
          }
          else
          {
            uint64_t v23 = 0;
          }
          uint64_t v24 = objc_msgSend_visibleAssociatedMessageChatItems(v17, v19, v20, v21);
          int shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems = objc_msgSend__shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems_(self, v25, (uint64_t)v23, (uint64_t)v24);

          if (shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems)
          {
            if (v23)
            {
              objc_msgSend__setVisibleAssociatedMessageChatItems_(v17, v27, (uint64_t)v23, v29);
            }
            else
            {
              uint64_t v30 = objc_msgSend_visibleAssociatedMessageChatItems(v17, v27, v28, v29);
              uint64_t v34 = objc_msgSend_count(v30, v31, v32, v33);

              if (v34) {
                objc_msgSend__setVisibleAssociatedMessageChatItems_(v17, v35, 0, v36);
              }
            }
            char v11 = 1;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v14);
    }
    else
    {
      char v11 = 0;
    }

    id v6 = v39;
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

- (id)_newDeliveredChatItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  char v11 = objc_msgSend_objectAtIndex_(v8, v9, a4 - 1, v10);
  uint64_t v15 = objc_msgSend__item(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_timeDelivered(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_time(v15, v20, v21, v22);
  uint64_t v26 = objc_msgSend_laterDate_(v19, v24, (uint64_t)v23, v25);

  id v27 = v15;
  uint64_t v34 = objc_msgSend_expireState(v27, v28, v29, v30);
  if (v34 == 1)
  {
    if ((objc_msgSend_isFromMe(v27, v31, v32, v33) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v35 >= 3.0))
    {
      uint64_t v36 = 3;
    }
    else
    {
      uint64_t v36 = 2;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }

  uint64_t v37 = [IMMessageStatusChatItem alloc];
  id v39 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v37, v38, (uint64_t)v27, a3, v26, 0, v36, 0);
  uint64_t v45 = objc_msgSend_chatItemForIMChatItem_(self, v40, (uint64_t)v39, v41);
  if (v34 == 1)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend_count(v8, v42, v43, v44) <= (unint64_t)a4 || !v45)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          int v52 = 134218498;
          int64_t v53 = a4;
          __int16 v54 = 2048;
          uint64_t v55 = objc_msgSend_count(v8, v47, v48, v49);
          __int16 v56 = 2112;
          double v57 = v45;
          _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "_processChatItems couldn't replace Delivered object at index %lu, chatItems count: %lu, item %@", (uint8_t *)&v52, 0x20u);
        }
      }
    }
    else
    {
      objc_msgSend_replaceObjectAtIndex_withObject_(v8, v50, a4, (uint64_t)v45);

      uint64_t v45 = 0;
    }
  }

  return v45;
}

- (id)_newiMessageLiteSentItemWithStatusType:(int64_t)a3 atIndex:(int64_t)a4 chatItems:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  char v11 = objc_msgSend_objectAtIndex_(v8, v9, a4 - 1, v10);
  uint64_t v15 = objc_msgSend__item(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_timeDelivered(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_time(v15, v20, v21, v22);
  uint64_t v26 = objc_msgSend_laterDate_(v19, v24, (uint64_t)v23, v25);

  id v27 = v15;
  uint64_t v34 = objc_msgSend_expireState(v27, v28, v29, v30);
  if (v34 == 1)
  {
    if ((objc_msgSend_isFromMe(v27, v31, v32, v33) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v35 >= 3.0))
    {
      uint64_t v36 = 3;
    }
    else
    {
      uint64_t v36 = 2;
    }
  }
  else
  {
    uint64_t v36 = 0;
  }

  uint64_t v37 = [IMMessageStatusChatItem alloc];
  id v39 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v37, v38, (uint64_t)v27, a3, v26, 0, v36, 0);
  uint64_t v45 = objc_msgSend_chatItemForIMChatItem_(self, v40, (uint64_t)v39, v41);
  if (v34 == 1)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend_count(v8, v42, v43, v44) <= (unint64_t)a4 || !v45)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          int v52 = 134218498;
          int64_t v53 = a4;
          __int16 v54 = 2048;
          uint64_t v55 = objc_msgSend_count(v8, v47, v48, v49);
          __int16 v56 = 2112;
          double v57 = v45;
          _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "_processChatItems couldn't replace Delivered object at index %lu, chatItems count: %lu, item %@", (uint8_t *)&v52, 0x20u);
        }
      }
    }
    else
    {
      objc_msgSend_replaceObjectAtIndex_withObject_(v8, v50, a4, (uint64_t)v45);

      uint64_t v45 = 0;
    }
  }

  return v45;
}

- (id)_updateOrRemoveDeliveredStatusItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4
{
  id v5 = objc_msgSend_objectAtIndex_(a4, a2, a3, (uint64_t)a4);
  objc_msgSend__item(v5, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expireState(v9, v10, v11, v12) == 1)
  {
    if ((objc_msgSend_isFromMe(v9, v13, v14, v15) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v16 >= 3.0))
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 2;
    }

    uint64_t v20 = [IMMessageStatusChatItem alloc];
    uint64_t v19 = objc_msgSend__initWithItem_expireStatusType_count_statusItemSequenceNumber_(v20, v21, (uint64_t)v9, v17, 0, 0);
    uint64_t v18 = objc_msgSend_chatItemForIMChatItem_(self, v22, (uint64_t)v19, v23);
  }
  else
  {

    uint64_t v18 = 0;
    uint64_t v19 = v9;
  }

  return v18;
}

- (id)_updateOrRemoveiMessageLiteSentItemMovingFromOldIndex:(int64_t)a3 chatItems:(id)a4
{
  id v5 = objc_msgSend_objectAtIndex_(a4, a2, a3, (uint64_t)a4);
  objc_msgSend__item(v5, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_expireState(v9, v10, v11, v12) == 1)
  {
    if ((objc_msgSend_isFromMe(v9, v13, v14, v15) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v16 >= 3.0))
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 2;
    }

    uint64_t v20 = [IMMessageStatusChatItem alloc];
    uint64_t v19 = objc_msgSend__initWithItem_expireStatusType_count_statusItemSequenceNumber_(v20, v21, (uint64_t)v9, v17, 0, 0);
    uint64_t v18 = objc_msgSend_chatItemForIMChatItem_(self, v22, (uint64_t)v19, v23);
  }
  else
  {

    uint64_t v18 = 0;
    uint64_t v19 = v9;
  }

  return v18;
}

- (BOOL)_shouldAdjustNewDeliveredItemIndex:(int64_t)a3 chatItems:(id)a4
{
  id v5 = a4;
  id v9 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend_count(v5, v6, v7, v8) <= (unint64_t)a3)
  {
    char isKindOfClass = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend_objectAtIndex_(v9, v10, a3 - 1, v11);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = objc_msgSend_objectAtIndex_(v9, v13, a3, v14);

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v12 = (void *)v15;
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (void)_processSuggestedActionResponses:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v4, v5, v6);
  int isLazuliEnabled = objc_msgSend_isLazuliEnabled(v7, v8, v9, v10);

  if (isLazuliEnabled)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_1A4B3458C;
    uint64_t v20 = sub_1A4B343AC;
    id v21 = 0;
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1A4C2C224;
    v15[3] = &unk_1E5B7E608;
    v15[4] = &v16;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v3, v12, 2, (uint64_t)v15);
    objc_msgSend_removeObjectsAtIndexes_(v3, v13, v17[5], v14);
    _Block_object_dispose(&v16, 8);
  }
}

- (void)_processChatItemsForBreadcrumbs:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1A4B3458C;
  id v21 = sub_1A4B343AC;
  id v22 = 0;
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1A4B3458C;
  v15[4] = sub_1A4B343AC;
  id v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_1A4B3458C;
  v13[4] = sub_1A4B343AC;
  id v14 = 0;
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v5, v6, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4C2C4FC;
  v11[3] = &unk_1E5B7E630;
  v11[6] = &v17;
  v11[7] = v15;
  v11[8] = v12;
  v11[4] = self;
  v11[5] = v13;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v8, 2, (uint64_t)v11);
  objc_msgSend_removeObjectsAtIndexes_(v4, v9, v18[5], v10);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
}

- (void)_manageMomentShareAndAggregateItemsForChatItems:(id)a3
{
  *(void *)((char *)&v198[1] + 4) = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(IMPhotoLibraryPersistenceManager, v5, v6, v7);
  location = (id *)&self->_chat;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend_unregisterPhotoLibraryPersistenceManagerListener_(v8, v10, (uint64_t)WeakRetained, v11);

  uint64_t v15 = objc_msgSend_count(v4, v12, v13, v14);
  if (v15 >= 1)
  {
    unint64_t v18 = v15;
    v181 = v4;
    while (1)
    {
      uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v4, v16, v18 - 1, v17);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v24 = v18 - 1;
      if (v18 == 1 || (isKindOfClass & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v4, v21, v18 - 2, v23);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_msgSend_removeObjectAtIndex_(v4, v26, v18 - 1, v27);
LABEL_61:

LABEL_62:
      --v18;
      if ((unint64_t)(v24 + 1) <= 1) {
        goto LABEL_63;
      }
    }

LABEL_7:
    char isReplyContextPreview = objc_msgSend_isReplyContextPreview(v19, v21, v22, v23);
    char isEditedMessageHistory = objc_msgSend_isEditedMessageHistory(v19, v29, v30, v31);
    if (isReplyContextPreview & 1) != 0 || (isEditedMessageHistory) {
      goto LABEL_62;
    }
    id v33 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v37 = objc_msgSend_message(v33, v34, v35, v36);
      uint64_t v38 = IMCoreMomentShareURLForMessage(v37);
      long long v42 = v38;
      BOOL v43 = v38 != 0;
      if (v38)
      {
        objc_msgSend_absoluteString(v38, v39, v40, v41);
        id v44 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v44 = 0;
      }
    }
    else
    {
      id v44 = 0;
      BOOL v43 = 0;
    }

    id v45 = v44;
    uint64_t v25 = v45;
    if (!v43)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v69 = objc_msgSend_aggregateAttachmentParts(v33, v66, v67, v68);
        unint64_t v73 = objc_msgSend_count(v69, v70, v71, v72);
        unint64_t v77 = objc_msgSend__attachmentStackAggregationThreshold(IMMessagePartChatItem, v74, v75, v76);

        if (v73 > v77)
        {
          uint64_t v81 = objc_msgSend_sharedInstance(IMPhotoLibraryPersistenceManager, v78, v79, v80);
          id v82 = objc_loadWeakRetained(location);
          objc_msgSend_registerPhotoLibraryPersistenceManagerListener_(v81, v83, (uint64_t)v82, v84);

          uint64_t v195 = 0;
          uint64_t v196 = 0;
          uint64_t v194 = 0;
          sub_1A4C2D0AC(v33, &v196, &v195, &v194);
          sub_1A4C2CF64(v4, v33, v18 - 1, v196, v195, v194);
        }
      }
      goto LABEL_61;
    }
    id v186 = v45;
    if (objc_msgSend_length(v45, v46, v47, v48))
    {
      id v49 = objc_loadWeakRetained(location);
      int64_t v53 = objc_msgSend_momentShareCache(v49, v50, v51, v52);
      id v193 = 0;
      uint64_t v55 = objc_msgSend_momentShareForURLString_error_(v53, v54, (uint64_t)v25, (uint64_t)&v193);
      id v191 = v193;

      if (v55)
      {
        id v56 = objc_loadWeakRetained(location);
        uint64_t v60 = objc_msgSend_momentSharePresentationCache(v56, v57, v58, v59);
        uint64_t v63 = objc_msgSend_statusPresentationForMomentShareURLString_(v60, v61, (uint64_t)v25, v62);

        char v64 = 0;
        BOOL IsPermanent = 0;
        goto LABEL_28;
      }
      uint64_t v86 = IMLogHandleForCategory();
      uint64_t v85 = v191;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB936C(v197, v191, v198, v86);
      }
    }
    else
    {
      uint64_t v85 = 0;
    }
    id v191 = v85;
    BOOL IsPermanent = IMMomentShareCacheErrorIsPermanent(v85);
    uint64_t v63 = 0;
    uint64_t v55 = 0;
    char v64 = 1;
LABEL_28:
    id v87 = v33;
    id v88 = v55;
    id v89 = v63;
    BOOL v93 = v89;
    uint64_t v195 = 0;
    uint64_t v196 = 0;
    uint64_t v194 = 0;
    if (v64)
    {
      if (IsPermanent)
      {
        objc_opt_class();
        uint64_t v25 = v186;
        if (objc_opt_isKindOfClass())
        {
          sub_1A4C2D0AC(v87, &v196, &v195, &v194);
          uint64_t v94 = 0;
          id v95 = 0;
          BOOL v182 = 0;
          uint64_t v184 = v195;
          uint64_t v185 = v196;
          uint64_t v183 = v194;
        }
        else
        {
          uint64_t v183 = 0;
          uint64_t v184 = 0;
          uint64_t v185 = 0;
          uint64_t v94 = 0;
          id v95 = 0;
          BOOL v182 = 0;
        }
LABEL_37:
        id v115 = v94;
        id v116 = v95;

        uint64_t v187 = v93;
        id v188 = v88;

        id v117 = v115;
        id v118 = v116;
        id v4 = v181;
        id v119 = v181;
        id v120 = v87;
        id v121 = v117;
        id v122 = v118;
        id v192 = objc_msgSend__item(v120, v123, v124, v125);
        v189 = v121;
        uint64_t v190 = v122;
        if (v18 >= objc_msgSend_count(v119, v126, v127, v128))
        {
          uint64_t v131 = 0;
        }
        else
        {
          uint64_t v131 = objc_msgSend_objectAtIndexedSubscript_(v119, v129, v18, v130);
          if (v131)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ((objc_msgSend_wouldBeEqualIfInitializedWithItem_activityTitle_expirationDate_(v131, v132, (uint64_t)v192, (uint64_t)v121, v122) & 1) == 0)
              {
                v133 = [IMMomentShareStatusChatItem alloc];
                id v135 = (id)objc_msgSend__initWithItem_activityTitle_expirationDate_(v133, v134, (uint64_t)v192, (uint64_t)v121, v122);
                objc_msgSend_replaceObjectAtIndex_withObject_(v119, v136, v18, (uint64_t)v135);
LABEL_53:

                id v4 = v181;
              }
LABEL_54:

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v160 = v120;
                objc_msgSend_setNumberOfMomentShareSavedAssets_(v160, v161, v183, v162);
                objc_msgSend_setNumberOfMomentSharePhotos_(v160, v163, v185, v164);
                objc_msgSend_setNumberOfMomentShareVideos_(v160, v165, v184, v166);
              }
              unint64_t v167 = objc_msgSend__attachmentStackAggregationThreshold(IMMessagePartChatItem, v157, v158, v159);
              int v171 = v182;
              if (v185 + v184 > v167) {
                int v171 = 1;
              }
              if (v171 == 1)
              {
                v172 = objc_msgSend_sharedInstance(IMPhotoLibraryPersistenceManager, v168, v169, v170);
                id v173 = objc_loadWeakRetained(location);
                objc_msgSend_registerPhotoLibraryPersistenceManagerListener_(v172, v174, (uint64_t)v173, v175);

                sub_1A4C2CF64(v119, v120, v24, v185, v184, v183);
              }

              goto LABEL_61;
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_54;
        }
        id v137 = v120;
        id v179 = v119;
        id v135 = v137;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v18 < objc_msgSend_count(v179, v138, v139, v140))
        {
          uint64_t v143 = objc_msgSend_objectAtIndexedSubscript_(v179, v141, v18, v142);
          objc_opt_class();
          v178 = v143;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v176 = objc_msgSend_layoutGroupIdentifier(v143, v144, v145, v146);
            v150 = objc_msgSend_layoutGroupIdentifier(v135, v147, v148, v149);
            char isEqualToString = objc_msgSend_isEqualToString_(v176, v151, (uint64_t)v150, v152);

            if (isEqualToString)
            {
              id v122 = v190;
              goto LABEL_53;
            }
LABEL_52:
            uint64_t v153 = [IMMomentShareStatusChatItem alloc];
            id v122 = v190;
            v155 = objc_msgSend__initWithItem_activityTitle_expirationDate_(v153, v154, (uint64_t)v192, (uint64_t)v121, v190);
            objc_msgSend_insertObject_atIndex_(v179, v156, (uint64_t)v155, v18);

            id v121 = v189;
            goto LABEL_53;
          }
        }
        goto LABEL_52;
      }
      uint64_t v183 = 0;
      uint64_t v184 = 0;
      uint64_t v185 = 0;
      uint64_t v94 = 0;
      id v95 = 0;
    }
    else
    {
      uint64_t v94 = objc_msgSend_activityTitle(v89, v90, v91, v92);
      id v95 = objc_msgSend_expiryDate(v88, v96, v97, v98);
      uint64_t v185 = objc_msgSend_photosCount(v88, v99, v100, v101);
      uint64_t v105 = objc_msgSend_videosCount(v88, v102, v103, v104);
      uint64_t v183 = objc_msgSend_numberOfAssetsCopied(v93, v106, v107, v108);
      uint64_t v184 = v105;
      if (objc_msgSend_type(v93, v109, v110, v111) == 1)
      {
        BOOL v182 = objc_msgSend_state(v93, v112, v113, v114) == 2;
LABEL_36:
        uint64_t v25 = v186;
        goto LABEL_37;
      }
    }
    BOOL v182 = 0;
    goto LABEL_36;
  }
LABEL_63:
}

- (BOOL)_shouldDisplayAttributionInfo:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E4F6D3D0], v5);
  if (objc_msgSend_length(v6, v7, v8, v9))
  {
    uint64_t v12 = *MEMORY[0x1E4F6D3E0];
    uint64_t v13 = objc_msgSend_objectForKey_(v3, v10, *MEMORY[0x1E4F6D3E0], v11);
    if (objc_msgSend_length(v13, v14, v15, v16))
    {
      uint64_t v20 = objc_msgSend_sharedInstance(IMBalloonPluginAttributionController, v17, v18, v19);
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v3, v21, v12, v22);
      char shouldShowAttributionForBundleID = objc_msgSend_shouldShowAttributionForBundleID_(v20, v24, (uint64_t)v23, v25);
    }
    else
    {
      char shouldShowAttributionForBundleID = 0;
    }
  }
  else
  {
    char shouldShowAttributionForBundleID = 0;
  }

  return shouldShowAttributionForBundleID;
}

- (id)_editedStatusItemForEditedMessagePartChatItem:(id)a3 combiningStatusType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend__item(v6, v7, v8, v9);
  int isFailedEditMessagePart = objc_msgSend_isFailedEditMessagePart(v6, v11, v12, v13);
  int isFailedRetractMessagePart = objc_msgSend_isFailedRetractMessagePart(v6, v15, v16, v17);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  uint64_t v23 = objc_msgSend_guid(v6, v20, v21, v22);
  int isShowingEditHistoryForChatItemGUID = objc_msgSend_isShowingEditHistoryForChatItemGUID_(WeakRetained, v24, (uint64_t)v23, v25);

  uint64_t v30 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v27, v28, v29);
  LODWORD(v23) = objc_msgSend_isScheduledMessagesEnabled(v30, v31, v32, v33);

  if (v23 && objc_msgSend_scheduleType(v6, v34, v35, v36) == 2)
  {
    if ((isFailedEditMessagePart | isFailedRetractMessagePart) != 1)
    {
      uint64_t v37 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    int isFailedRetractMessagePart = 0;
  }
  if ((unint64_t)a4 > 0x20)
  {
LABEL_27:
    uint64_t v46 = 21;
    if (isFailedRetractMessagePart) {
      uint64_t v46 = 35;
    }
    uint64_t v47 = 24;
    if (!isShowingEditHistoryForChatItemGUID) {
      uint64_t v47 = v46;
    }
    int isShowingEditHistoryForChatItemGUID = 0;
    if (isFailedEditMessagePart) {
      uint64_t v41 = 27;
    }
    else {
      uint64_t v41 = v47;
    }
    goto LABEL_34;
  }
  if (((1 << a4) & 0x1E4800002) != 0)
  {
    uint64_t v38 = 23;
    if (isShowingEditHistoryForChatItemGUID) {
      uint64_t v38 = 26;
    }
    BOOL v39 = isFailedEditMessagePart == 0;
    uint64_t v40 = 29;
LABEL_11:
    if (v39) {
      uint64_t v41 = v38;
    }
    else {
      uint64_t v41 = v40;
    }
    goto LABEL_14;
  }
  if (((1 << a4) & 0x12400010) == 0)
  {
    if (a4 == 2)
    {
      uint64_t v38 = 30;
      if (isShowingEditHistoryForChatItemGUID) {
        uint64_t v38 = 31;
      }
      BOOL v39 = isFailedEditMessagePart == 0;
      uint64_t v40 = 32;
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  if (isFailedEditMessagePart)
  {
    uint64_t v41 = 28;
LABEL_35:
    uint64_t v42 = objc_msgSend_timeRead(v10, v34, v35, v36);
    goto LABEL_36;
  }
  if (isShowingEditHistoryForChatItemGUID) {
    uint64_t v41 = 25;
  }
  else {
    uint64_t v41 = 22;
  }
  if ((isShowingEditHistoryForChatItemGUID ^ 1)) {
    goto LABEL_35;
  }
LABEL_34:
  if (isShowingEditHistoryForChatItemGUID) {
    goto LABEL_35;
  }
LABEL_14:
  uint64_t v42 = objc_msgSend_timeDelivered(v10, v34, v35, v36);
LABEL_36:
  uint64_t v48 = (void *)v42;
  id v49 = objc_msgSend_time(v10, v43, v44, v45);
  uint64_t v52 = objc_msgSend_laterDate_(v48, v50, (uint64_t)v49, v51);

  id v53 = v10;
  if (objc_msgSend_expireState(v53, v54, v55, v56) == 1)
  {
    if ((objc_msgSend_isFromMe(v53, v57, v58, v59) & 1) != 0
      || (IMMessageItemTimeIntervalSinceStartedExpiring(), v60 >= 3.0))
    {
      uint64_t v61 = 3;
    }
    else
    {
      uint64_t v61 = 2;
    }
  }
  else
  {
    uint64_t v61 = 0;
  }

  uint64_t v62 = [IMMessageStatusChatItem alloc];
  char v64 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v62, v63, (uint64_t)v53, v41, v52, 0, v61, 0);
  uint64_t v37 = objc_msgSend_chatItemForIMChatItem_(self, v65, (uint64_t)v64, v66);

LABEL_43:

  return v37;
}

- (id)_attributionChatItemForChatItem:(id)a3
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  uint64_t v163 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend_isReplyContextPreview(v3, v4, v5, v6) & 1) != 0
    || (objc_msgSend_isEditedMessageHistory(v3, v7, v8, v9) & 1) != 0)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  id v162 = v3;
  uint64_t v184 = 0;
  uint64_t v185 = &v184;
  uint64_t v186 = 0x2020000000;
  uint64_t v187 = 0;
  uint64_t v180 = 0;
  v181 = &v180;
  uint64_t v182 = 0x2020000000;
  char v183 = 0;
  uint64_t v166 = objc_msgSend_sharedInstance(IMFileTransferCenter, v12, v13, v14);
  uint64_t v18 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E6D0], v15, v16, v17);
  int isFeatureEnabled = objc_msgSend_isFeatureEnabled(v18, v19, v20, v21);

  uint64_t v26 = objc_msgSend_visibleAssociatedMessageChatItems(v162, v23, v24, v25);
  BOOL v30 = objc_msgSend_count(v26, v27, v28, v29) == 0;

  if (v30)
  {
    uint64_t v164 = 0;
    unint64_t v167 = 0;
    goto LABEL_38;
  }
  objc_msgSend__visibleAssociatedChatItemsByFlatteningAggregateChatItems(v162, v31, v32, v33);
  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v176, (uint64_t)v191, 16);
  if (!v39)
  {
    uint64_t v164 = 0;
    unint64_t v167 = 0;
    goto LABEL_37;
  }
  uint64_t v164 = 0;
  unint64_t v167 = 0;
  uint64_t v40 = *(void *)v177;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v177 != v40) {
        objc_enumerationMutation(v34);
      }
      uint64_t v42 = *(void **)(*((void *)&v176 + 1) + 8 * i);
      uint64_t v43 = objc_msgSend_associatedMessageType(v42, v36, v37, v38);
      if (isFeatureEnabled)
      {
        uint64_t v44 = v43;
        if ((objc_msgSend_isFromMe(v42, v36, v37, v38) & 1) == 0 && (v44 == 2007 || v44 == 1000))
        {
          uint64_t v45 = objc_msgSend_commSafetyTransferGUID(v42, v36, v37, v38);
          uint64_t v48 = objc_msgSend_transferForGUID_(v166, v46, (uint64_t)v45, v47);
          uint64_t v52 = objc_msgSend_attributionInfo(v48, v49, v50, v51);
          if (objc_msgSend_commSafetySensitive(v48, v53, v54, v55) == 1)
          {
            uint64_t v59 = v181 + 3;
            uint64_t v60 = 8;
            if (*((unsigned char *)v181 + 24)) {
              uint64_t v60 = 9;
            }
            v185[3] = v60;
LABEL_24:
            unsigned char *v59 = 1;
          }
          else if (objc_msgSend_commSafetySensitive(v48, v56, v57, v58) == 2)
          {
            v185[3] = 11;
            uint64_t v59 = v181 + 3;
            goto LABEL_24;
          }
          if (v167)
          {
            uint64_t v61 = objc_msgSend_time(v42, v56, v57, v58);
            BOOL v62 = v61 >= v167;
          }
          else
          {
            BOOL v62 = 1;
          }
          if (!*((unsigned char *)v181 + 24)
            && (objc_msgSend__shouldDisplayAttributionInfo_(self, v56, (uint64_t)v52, v58) & v62) == 1)
          {
            id v63 = v52;

            v185[3] = 4;
            uint64_t v67 = objc_msgSend_time(v42, v64, v65, v66);

            uint64_t v164 = v63;
            unint64_t v167 = (void *)v67;
          }

          continue;
        }
      }
    }
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v176, (uint64_t)v191, 16);
  }
  while (v39);
LABEL_37:

LABEL_38:
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v72 = v185[3];
  if (v72) {
    int v73 = 0;
  }
  else {
    int v73 = isFeatureEnabled;
  }
  if ((v73 & isKindOfClass) == 1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4C2DFE0;
    aBlock[3] = &unk_1E5B7E658;
    id v175 = v166;
    uint64_t v74 = _Block_copy(aBlock);
    id v75 = v162;
    uint64_t v79 = objc_msgSend_text(v75, v76, v77, v78);
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = sub_1A4C2DFEC;
    v172[3] = &unk_1E5B7E680;
    char v173 = isFeatureEnabled;
    v172[4] = &v180;
    v172[5] = &v184;
    objc_msgSend___im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider_block_(v79, v80, (uint64_t)v74, (uint64_t)v172);

    uint64_t v72 = v185[3];
  }
  if (!v72)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v81 = v162;
      uint64_t v85 = objc_msgSend_type(v81, v82, v83, v84);
      char v88 = objc_msgSend_containsString_(v85, v86, *MEMORY[0x1E4F6CC00], v87);

      if ((v88 & 1) == 0 && !v185[3] && (objc_msgSend_isFromMe(v81, v89, v90, v91) & 1) == 0)
      {
        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        id v95 = objc_msgSend__item(v81, v92, v93, v94);
        objc_msgSend_fileTransferGUIDs(v95, v96, v97, v98);
        id v99 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v168, (uint64_t)v190, 16);
        if (v104)
        {
          uint64_t v105 = *(void *)v169;
          while (2)
          {
            for (uint64_t j = 0; j != v104; ++j)
            {
              if (*(void *)v169 != v105) {
                objc_enumerationMutation(v99);
              }
              uint64_t v107 = *(void *)(*((void *)&v168 + 1) + 8 * j);
              uint64_t v108 = objc_msgSend_sharedInstance(IMFileTransferCenter, v101, v102, v103);
              uint64_t v111 = objc_msgSend_transferForGUID_(v108, v109, v107, v110);
              id v115 = objc_msgSend_attributionInfo(v111, v112, v113, v114);

              if (objc_msgSend__shouldDisplayAttributionInfo_(self, v116, (uint64_t)v115, v117))
              {

                uint64_t v136 = 1;
                goto LABEL_64;
              }
            }
            uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v101, (uint64_t)&v168, (uint64_t)v190, 16);
            if (v104) {
              continue;
            }
            break;
          }
        }
        goto LABEL_65;
      }
      goto LABEL_66;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isFromMe(v162, v69, v70, v71) & 1) == 0)
    {
      id v118 = objc_msgSend_sharedInstance(IMFileTransferCenter, v69, v70, v71);
      id v122 = objc_msgSend_transferGUID(v162, v119, v120, v121);
      objc_msgSend_transferForGUID_(v118, v123, (uint64_t)v122, v124);
      id v81 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_attributionInfo(v81, v125, v126, v127);
      id v99 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend__shouldDisplayAttributionInfo_(self, v128, (uint64_t)v99, v129))
      {
        id v99 = v99;

        uint64_t v132 = objc_msgSend_objectForKey_(v99, v130, *MEMORY[0x1E4F6D3E0], v131);
        int v135 = objc_msgSend_containsString_(v132, v133, *MEMORY[0x1E4F6CC18], v134);

        uint64_t v136 = 2;
        if (!v135) {
          uint64_t v136 = 3;
        }
        id v115 = v99;
LABEL_64:
        v185[3] = v136;
        uint64_t v164 = v115;
      }
LABEL_65:

LABEL_66:
    }
  }
  id v137 = v185;
  if (!v185[3])
  {
    if (objc_msgSend_requiresSiriAttribution(v162, v69, v70, v71))
    {
      id v137 = v185;
      uint64_t v141 = 6;
      goto LABEL_72;
    }
    if (objc_msgSend_requiresFaceTimeAttribution(v162, v138, v139, v140))
    {
      id v137 = v185;
      uint64_t v141 = 7;
LABEL_72:
      v137[3] = v141;
    }
    else
    {
      int v151 = objc_msgSend_requiresCriticalMessagingAPIAttribution(v162, v142, v143, v144);
      id v137 = v185;
      if (v151)
      {
        v185[3] = 10;
        uint64_t v188 = *MEMORY[0x1E4F6D3D0];
        v155 = objc_msgSend_messageItem(v162, v152, v153, v154);
        uint64_t v159 = objc_msgSend_criticalMessagingAppName(v155, v156, v157, v158);
        v189 = v159;
        uint64_t v161 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v160, (uint64_t)&v189, (uint64_t)&v188, 1);

        id v137 = v185;
        uint64_t v164 = (void *)v161;
      }
    }
  }
  if (v137[3])
  {
    uint64_t v145 = [IMMessageAttributionChatItem alloc];
    uint64_t v149 = objc_msgSend__item(v162, v146, v147, v148);
    uint64_t v10 = objc_msgSend__initWithItem_attributionInfo_attributionType_showsLearnMoreLink_statusItemSequenceNumber_(v145, v150, (uint64_t)v149, (uint64_t)v164, v185[3], 0, 0);
  }
  else
  {
    uint64_t v10 = 0;
  }

  _Block_object_dispose(&v180, 8);
  _Block_object_dispose(&v184, 8);

LABEL_5:

  return v10;
}

- (id)_effectControlForChatItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend__item(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_expressiveSendStyleID(v8, v9, v10, v11);
    if (objc_msgSend__shouldShowEffectPlayButtonForMessage_(self, v13, (uint64_t)v8, v14))
    {
      uint64_t v15 = [IMMessageEffectControlChatItem alloc];
      uint64_t v17 = objc_msgSend__initWithItem_effectStyleID_statusItemSequenceNumber_(v15, v16, (uint64_t)v8, (uint64_t)v12, 0);
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (void)_processChatItemsForIsShowingEditHistory:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_1A4B3458C;
  uint64_t v36 = sub_1A4B343AC;
  id v37 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v5, v6, v7);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1A4B3458C;
  BOOL v30 = sub_1A4B343AC;
  id v31 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1A4C2E30C;
  v25[3] = &unk_1E5B7E6A8;
  v25[4] = self;
  v25[5] = &v32;
  v25[6] = &v26;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v11, (uint64_t)v25, v12);
  if (objc_msgSend_count((void *)v33[5], v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_copy((void *)v33[5], v16, v17, v18);
    uint64_t v23 = objc_msgSend_copy((void *)v27[5], v20, v21, v22);
    objc_msgSend_replaceObjectsAtIndexes_withObjects_(v4, v24, (uint64_t)v19, (uint64_t)v23);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)_processChatItemsForEditedStatus:(id)a3
{
  id v4 = a3;
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x3032000000;
  uint64_t v72 = sub_1A4B3458C;
  int v73 = sub_1A4B343AC;
  id v74 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v5, v6, v7);
  id v74 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = 0;
  char v64 = &v63;
  uint64_t v65 = 0x3032000000;
  uint64_t v66 = sub_1A4B3458C;
  uint64_t v67 = sub_1A4B343AC;
  id v68 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = sub_1A4B3458C;
  uint64_t v61 = sub_1A4B343AC;
  id v62 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v11, v12, v13);
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = sub_1A4B3458C;
  uint64_t v55 = sub_1A4B343AC;
  id v56 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  uint64_t v43 = sub_1A4C2E7BC;
  uint64_t v44 = &unk_1E5B7E6D0;
  id v17 = v4;
  id v45 = v17;
  uint64_t v46 = self;
  uint64_t v47 = &v57;
  uint64_t v48 = &v51;
  id v49 = &v69;
  uint64_t v50 = &v63;
  objc_msgSend_enumerateObjectsUsingBlock_(v17, v18, (uint64_t)&v41, v19);
  if (objc_msgSend_count((void *)v58[5], v20, v21, v22, v41, v42, v43, v44))
  {
    uint64_t v26 = objc_msgSend_count((void *)v58[5], v23, v24, v25);
    if (v26 == objc_msgSend_count((void *)v52[5], v27, v28, v29))
    {
      objc_msgSend_replaceObjectsAtIndexes_withObjects_(v17, v30, v58[5], v52[5]);
    }
    else
    {
      id v31 = IMLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        sub_1A4CB944C();
      }
    }
  }
  if (objc_msgSend_count((void *)v70[5], v23, v24, v25))
  {
    uint64_t v35 = objc_msgSend_count((void *)v70[5], v32, v33, v34);
    if (v35 == objc_msgSend_count((void *)v64[5], v36, v37, v38))
    {
      objc_msgSend_insertObjects_atIndexes_(v17, v39, v64[5], v70[5]);
    }
    else
    {
      uint64_t v40 = IMLogHandleForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_1A4CB93E4();
      }
    }
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
}

- (BOOL)isReadStatusItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_statusType(v4, v5, v6, v7);
    char StatusType = objc_msgSend_isReadStatusType_(self, v9, v8, v10);
  }
  else
  {
    char StatusType = 0;
  }

  return StatusType;
}

- (BOOL)isReadStatusType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1D) & (0x12400010u >> a3);
}

- (BOOL)isDeliveredStatusItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_statusType(v4, v5, v6, v7);
    isDeliveredchar StatusType = objc_msgSend_isDeliveredStatusType_(self, v9, v8, v10);
  }
  else
  {
    isDeliveredchar StatusType = 0;
  }

  return isDeliveredStatusType;
}

- (BOOL)isDeliveredStatusType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x21) & (0x1E4800006uLL >> a3);
}

- (id)serviceForChatItems:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7)) {
    goto LABEL_4;
  }
  uint64_t v11 = objc_msgSend_lastObject(v4, v8, v9, v10);
  uint64_t v15 = objc_msgSend__item(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_service(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);

  if (v23)
  {
    id WeakRetained = objc_msgSend_lastObject(v4, v24, v25, v26);
    id v31 = objc_msgSend__item(WeakRetained, v28, v29, v30);
    uint64_t v35 = objc_msgSend_service(v31, v32, v33, v34);
    uint64_t v38 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v36, (uint64_t)v35, v37);
  }
  else
  {
LABEL_4:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
    id v31 = objc_msgSend_account(WeakRetained, v39, v40, v41);
    uint64_t v38 = objc_msgSend_service(v31, v42, v43, v44);
  }

  return v38;
}

- (void)_processChatItemsForReplayButton:(id)a3
{
  id v4 = a3;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_1A4B3458C;
  uint64_t v41 = sub_1A4B343AC;
  id v42 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v5, v6, v7);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_1A4B3458C;
  uint64_t v35 = sub_1A4B343AC;
  id v36 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1A4C2EEFC;
  v25[3] = &unk_1E5B7E6F8;
  id v11 = v4;
  id v26 = v11;
  uint64_t v27 = self;
  uint64_t v28 = &v43;
  uint64_t v29 = &v31;
  uint64_t v30 = &v37;
  objc_msgSend_enumerateObjectsUsingBlock_(v11, v12, (uint64_t)v25, v13);
  uint64_t v16 = v44[3];
  if (v16) {
    objc_msgSend_removeObjectAtIndex_(v11, v14, v16, v15);
  }
  uint64_t v17 = objc_msgSend_count((void *)v38[5], v14, v16, v15);
  if (v17 == objc_msgSend_count((void *)v32[5], v18, v19, v20) && objc_msgSend_count((void *)v32[5], v21, v22, v23)) {
    objc_msgSend_insertObjects_atIndexes_(v11, v24, v32[5], v38[5]);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

- (void)_processChatItemsForMessageStatusSequenceNumber:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4C2F1A8;
  v9[3] = &unk_1E5B7E720;
  id v10 = v4;
  id v11 = v3;
  id v5 = v3;
  id v6 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v7, (uint64_t)v9, v8);
}

- (int64_t)_lastItemIndexExcludingScheduledSection:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v4, v5, v6);
  int isScheduledMessagesCoreEnabled = objc_msgSend_isScheduledMessagesCoreEnabled(v7, v8, v9, v10);

  if (isScheduledMessagesCoreEnabled)
  {
    uint64_t v15 = objc_msgSend_lastObject(v3, v12, v13, v14);
    uint64_t v19 = objc_msgSend__item(v15, v16, v17, v18);

    objc_opt_class();
    BOOL v23 = (objc_opt_isKindOfClass() & 1) != 0 && _IMScheduledMessageShouldBePinnedToBottom(v19);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v33 = objc_msgSend_count(v3, v20, v21, v22);
    if (v23)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1A4C2F424;
      v29[3] = &unk_1E5B7E608;
      v29[4] = &v30;
      objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v3, v26, 2, (uint64_t)v29);
    }
    uint64_t v27 = v31[3];
    if (v27) {
      int64_t v25 = v27 - 1;
    }
    else {
      int64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    }
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v24 = objc_msgSend_count(v3, v12, v13, v14);
    if (v24) {
      int64_t v25 = v24 - 1;
    }
    else {
      int64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v25;
}

- (int64_t)_lastItemIndexExcludingWatchReplyOptions:(id)a3
{
  uint64_t v4 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  if (v4) {
    return v4 - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)addChatItem:(id)a3 toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems:(id)a4
{
  uint64_t v19 = (char *)a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  int isScheduledMessagesCoreEnabled = objc_msgSend_isScheduledMessagesCoreEnabled(v10, v11, v12, v13);

  if (isScheduledMessagesCoreEnabled)
  {
    uint64_t ItemIndexExcludingScheduledSection = objc_msgSend__lastItemIndexExcludingScheduledSection_(self, v15, (uint64_t)v6, v16);
    if (ItemIndexExcludingScheduledSection == 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend_addObject_(v6, v19, (uint64_t)v19, v18);
    }
    else {
      objc_msgSend_insertObject_atIndex_(v6, v19, (uint64_t)v19, ItemIndexExcludingScheduledSection + 1);
    }
  }
  else
  {
    objc_msgSend_addObject_(v6, v15, (uint64_t)v19, v16);
  }
}

- (void)_processChatItemsForKeyTransparencyStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v6, v7, v8);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1A4C2F75C;
  v39[3] = &unk_1E5B7E748;
  uint64_t v41 = v5;
  id v10 = v9;
  id v40 = v10;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v11, 2, (uint64_t)v39);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  id v38 = 0;
  unint64_t v15 = objc_msgSend_keyTransparencyStatusForAffectedHandles_(WeakRetained, v13, (uint64_t)&v38, v14);
  id v16 = v38;

  if (v15 <= 0xB && ((1 << v15) & 0xA60) != 0)
  {
    uint64_t v20 = [IMKeyTransparencyStatusChangedChatItem alloc];
    id v21 = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t isGroupChat = objc_msgSend_isGroupChat(v21, v22, v23, v24);
    uint64_t v27 = objc_msgSend__initWithHandles_status_isGroupChat_(v20, v26, (uint64_t)v16, v15, isGroupChat);

    uint64_t v30 = objc_msgSend_chatItemForIMChatItem_(self, v28, (uint64_t)v27, v29);
    if (objc_msgSend_count(v10, v31, v32, v33)) {
      objc_msgSend_removeObjectsAtIndexes_(v4, v34, (uint64_t)v10, v35);
    }
    if (v30) {
      objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v34, (uint64_t)v30, (uint64_t)v4);
    }
  }
  else if (objc_msgSend_count(v10, v17, v18, v19))
  {
    objc_msgSend_removeObjectsAtIndexes_(v4, v36, (uint64_t)v10, v37);
  }
}

- (void)_processChatItemsForExpandedEditedMessageHistory:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  uint64_t v6 = objc_opt_class();
  id v10 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v7, v8, v9);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1A4C2FA40;
  v35[3] = &unk_1E5B7E748;
  uint64_t v37 = v6;
  id v11 = v10;
  id v36 = v11;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v12, 0, (uint64_t)v35);
  objc_msgSend_removeObjectsAtIndexes_(v4, v13, (uint64_t)v11, v14);
  if (objc_msgSend_isShowingEditHistoryForAnyChatItem(WeakRetained, v15, v16, v17))
  {
    uint64_t v18 = objc_opt_class();
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id location = 0;
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1A4C2FA9C;
    v29[3] = &unk_1E5B7E798;
    v33[1] = v18;
    id v30 = WeakRetained;
    objc_copyWeak(v33, &location);
    id v21 = v19;
    id v31 = v21;
    id v22 = v20;
    id v32 = v22;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v23, 0, (uint64_t)v29);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A4C2FCDC;
    v26[3] = &unk_1E5B7E7E8;
    id v24 = v22;
    id v27 = v24;
    id v28 = v4;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v21, v25, 2, (uint64_t)v26);

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
}

- (id)_historyToDisplayForMessageItem:(id)a3 partIndex:(int64_t)a4
{
  id v4 = objc_msgSend_historyForMessagePart_(a3, a2, a4, a4);
  uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
  if (objc_msgSend_count(v8, v9, v10, v11)) {
    objc_msgSend_removeLastObject(v8, v12, v13, v14);
  }
  unint64_t v15 = objc_msgSend_copy(v8, v12, v13, v14);

  return v15;
}

- (void)_processChatItemsForSatelliteAvailabilityIndicator:(id)a3
{
  id v4 = a3;
  if ((IMGetDomainBoolForKey() & 1) != 0
    || (id v5 = objc_loadWeakRetained((id *)&self->_chat),
        uint64_t shouldDisplayOffGridModeStatus = objc_msgSend_shouldDisplayOffGridModeStatus(v5, v6, v7, v8),
        v5,
        shouldDisplayOffGridModeStatus))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
    int v14 = objc_msgSend_chatStyle(WeakRetained, v11, v12, v13);

    if (v14 == 45)
    {
      uint64_t v18 = objc_msgSend___imLastMessageItem(v4, v15, v16, v17);
      if (objc_msgSend_isPendingSatelliteSend(v18, v19, v20, v21))
      {
        uint64_t shouldDisplayOffGridModeStatus = 0;
      }
      else
      {
        int64_t v25 = objc_msgSend_service(v18, v22, v23, v24);
        id v26 = (uint64_t *)MEMORY[0x1E4F6E1B8];
        if (objc_msgSend_isEqualToString_(v25, v27, *MEMORY[0x1E4F6E1B8], v28))
        {
          uint64_t shouldDisplayOffGridModeStatus = 0;
        }
        else
        {
          id v29 = objc_loadWeakRetained((id *)&self->_chat);
          uint64_t v33 = objc_msgSend_account(v29, v30, v31, v32);
          uint64_t v37 = objc_msgSend_service(v33, v34, v35, v36);
          uint64_t v41 = objc_msgSend_internalName(v37, v38, v39, v40);
          uint64_t shouldDisplayOffGridModeStatus = objc_msgSend_isEqualToString_(v41, v42, *v26, v43) ^ 1;
        }
      }
    }
    else
    {
      uint64_t shouldDisplayOffGridModeStatus = 0;
    }
  }
  uint64_t v44 = objc_opt_class();
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1A4C2FFE4;
  v46[3] = &unk_1E5B7E4C8;
  v46[4] = self;
  objc_msgSend__insertOrMoveChatItemToEndOfChatItems_chatItemClass_shouldInsert_chatItemCreationBlock_(self, v45, (uint64_t)v4, v44, shouldDisplayOffGridModeStatus, v46);
}

- (void)_processChatItemsForSatelliteNoDeliveryStatusIndicator:(id)a3
{
  p_chat = &self->_chat;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_chat);
  uint64_t v10 = objc_msgSend_lastSentMessage(WeakRetained, v7, v8, v9);

  id v11 = objc_loadWeakRetained((id *)p_chat);
  unint64_t v15 = objc_msgSend_account(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_service(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_internalName((void *)v19, v20, v21, v22);
  uint64_t v24 = (uint64_t *)MEMORY[0x1E4F6E1B8];
  int isEqualToString = objc_msgSend_isEqualToString_(v23, v25, *MEMORY[0x1E4F6E1B8], v26);

  uint64_t v31 = objc_msgSend_sharedInstance(IMChorosMonitor, v28, v29, v30);
  LOBYTE(v19) = objc_msgSend_isSatelliteConnectionActive(v31, v32, v33, v34);

  int v38 = objc_msgSend_sentOrReceivedOffGrid(v10, v35, v36, v37);
  uint64_t v42 = 0;
  if ((v19 & 1) == 0 && isEqualToString)
  {
    if ((objc_msgSend_isDelivered(v10, v39, v40, v41) | v38))
    {
      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v46 = objc_msgSend__imMessageItem(v10, v43, v44, v45);
      uint64_t v50 = objc_msgSend_service(v46, v47, v48, v49);
      uint64_t v42 = objc_msgSend_isEqualToString_(v50, v51, *v24, v52);
    }
  }
  uint64_t v53 = objc_opt_class();
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1A4C30228;
  v55[3] = &unk_1E5B7E4C8;
  v55[4] = self;
  objc_msgSend__insertOrMoveChatItemToEndOfChatItems_chatItemClass_shouldInsert_chatItemCreationBlock_(self, v54, (uint64_t)v5, v53, v42, v55);
}

- (void)_insertOrMoveChatItemToEndOfChatItems:(id)a3 chatItemClass:(Class)a4 shouldInsert:(BOOL)a5 chatItemCreationBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  unint64_t v15 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v12, v13, v14);
  uint64_t v39 = MEMORY[0x1E4F143A8];
  uint64_t v40 = 3221225472;
  uint64_t v41 = sub_1A4C3043C;
  uint64_t v42 = &unk_1E5B7E748;
  Class v44 = a4;
  id v16 = v15;
  id v43 = v16;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v10, v17, 2, (uint64_t)&v39);
  uint64_t v21 = objc_msgSend_count(v16, v18, v19, v20, v39, v40, v41, v42);
  if (v7)
  {
    if (v21)
    {
      uint64_t v25 = objc_msgSend_count(v10, v22, v23, v24) - 1;
      uint64_t Index = objc_msgSend_lastIndex(v16, v26, v27, v28);
      if (v25 == Index) {
        goto LABEL_10;
      }
      uint64_t v32 = objc_msgSend_objectAtIndex_(v10, v30, Index, v31);
      objc_msgSend_removeObjectsAtIndexes_(v10, v33, (uint64_t)v16, v34);
      if (!v32) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v36 = v11[2](v11);
      uint64_t v32 = objc_msgSend_chatItemForIMChatItem_(self, v37, (uint64_t)v36, v38);

      if (!v32) {
        goto LABEL_10;
      }
    }
    objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v35, (uint64_t)v32, (uint64_t)v10);

    goto LABEL_10;
  }
  if (v21) {
    objc_msgSend_removeObjectsAtIndexes_(v10, v22, (uint64_t)v16, v24);
  }
LABEL_10:
}

- (void)_processChatItemsForUnknownInternationalSender:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!IMIsInternationalFilteringAccount((uint64_t)v4, v5, v6, v7)) {
    goto LABEL_42;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  int hasKnownParticipants = objc_msgSend_hasKnownParticipants(WeakRetained, v9, v10, v11);

  if (!hasKnownParticipants)
  {
    uint64_t v72 = v4;
    uint64_t v71 = objc_opt_class();
    uint64_t v70 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v14, v15, v16);
    uint64_t v20 = objc_msgSend__items(self, v17, v18, v19);
    uint64_t v23 = objc_msgSend___imArrayByFilteringWithBlock_(v20, v21, (uint64_t)&unk_1EF8E3488, v22);

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v24 = v23;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v76, (uint64_t)v84, 16);
    if (v26)
    {
      uint64_t v27 = *(void *)v77;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v77 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v34 = objc_msgSend_originalUnformattedID(v29, v30, v31, v32);
            if (v34)
            {
              char shouldShowInternationalSenderWarningForHandleID = objc_msgSend_shouldShowInternationalSenderWarningForHandleID_(MEMORY[0x1E4F6EAB0], v30, (uint64_t)v34, v33);

              if (shouldShowInternationalSenderWarningForHandleID)
              {
                LODWORD(v26) = 1;
                goto LABEL_19;
              }
            }
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v30, (uint64_t)&v76, (uint64_t)v84, 16);
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = sub_1A4C30988;
    v73[3] = &unk_1E5B7E748;
    uint64_t v75 = v71;
    id v36 = v70;
    id v74 = v36;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v72, v37, 2, (uint64_t)v73);
    id v38 = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t isFiltered = objc_msgSend_isFiltered(v38, v39, v40, v41);

    int v43 = IMOSLoggingEnabled();
    if ((v26 & (isFiltered != 0)) == 0)
    {
      if (v43)
      {
        id v62 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = @"NO";
          if (isFiltered) {
            char v64 = @"YES";
          }
          else {
            char v64 = @"NO";
          }
          if (v26) {
            uint64_t v63 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          id v81 = v64;
          __int16 v82 = 2112;
          uint64_t v83 = v63;
          _os_log_impl(&dword_1A4AF7000, v62, OS_LOG_TYPE_INFO, "Not showing unknown international status item. chat.isFiltered=%@ and hasUnknownInternationalParticipant=%@", buf, 0x16u);
        }
      }
      if (objc_msgSend_count(v36, v44, v45, v46)) {
        objc_msgSend_removeObjectsAtIndexes_(v72, v65, (uint64_t)v36, v66);
      }
      goto LABEL_41;
    }
    if (v43)
    {
      uint64_t v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "Chat has unknown international participant, inserting status item for unknown international number.", buf, 2u);
      }
    }
    if (objc_msgSend_count(v36, v44, v45, v46))
    {
      uint64_t v51 = objc_msgSend_count(v72, v48, v49, v50);
      uint64_t Index = objc_msgSend_lastIndex(v36, v52, v53, v54);
      if (v51 - 1 == Index) {
        goto LABEL_41;
      }
      uint64_t v58 = objc_msgSend_objectAtIndex_(v72, v55, Index, v57);
      objc_msgSend_removeObjectsAtIndexes_(v72, v59, (uint64_t)v36, v60);
      if (!v58) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v67 = [IMUnknownInternationalSenderChatItem alloc];
      uint64_t v58 = objc_msgSend__initWithItem_(v67, v68, 0, v69);
      if (!v58)
      {
LABEL_41:

        id v4 = v72;
        goto LABEL_42;
      }
    }
    objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v61, (uint64_t)v58, (uint64_t)v72);

    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Not showing unknown international status item because chat has known participants.", buf, 2u);
    }
  }
LABEL_42:
}

- (void)_processChatItemsForSMSFallbackStatusIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v8, v9, v10, v11);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v69 = 0;
    uint64_t v70 = &v69;
    uint64_t v71 = 0x3032000000;
    uint64_t v72 = sub_1A4B3458C;
    int v73 = sub_1A4B343AC;
    id v74 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t v17 = objc_msgSend_account(WeakRetained, v14, v15, v16);
    uint64_t v21 = objc_msgSend_service(v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_internalName(v21, v22, v23, v24);
    uint64_t v26 = (uint64_t *)MEMORY[0x1E4F6E1A8];
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v25, v27, *MEMORY[0x1E4F6E1A8], v28);
    if (isEqualToString)
    {
      id v30 = objc_loadWeakRetained((id *)&self->_chat);
      char isGroupChat = objc_msgSend_isGroupChat(v30, v31, v32, v33);

      if (isGroupChat) {
        goto LABEL_6;
      }
      uint64_t v35 = objc_opt_class();
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = sub_1A4C30CE8;
      v68[3] = &unk_1E5B7E830;
      v68[4] = &v69;
      v68[5] = v35;
      objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v36, 2, (uint64_t)v68);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_6;
      }
      uint64_t v40 = objc_msgSend__item((void *)v70[5], v37, v38, v39);
      Class v44 = objc_msgSend__service(v40, v41, v42, v43);
      uint64_t v48 = objc_msgSend_name(v44, v45, v46, v47);
      char v51 = objc_msgSend_isEqualToString_(v48, v49, *v26, v50);

      if (v51)
      {
LABEL_6:
        uint64_t isEqualToString = 0;
        uint64_t v55 = 0;
LABEL_9:
        uint64_t v56 = objc_opt_class();
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = sub_1A4C30D64;
        v65[3] = &unk_1E5B7E4A0;
        v65[4] = self;
        uint64_t v67 = &v69;
        id v57 = v55;
        id v66 = v57;
        objc_msgSend__insertOrMoveChatItemToEndOfChatItems_chatItemClass_shouldInsert_chatItemCreationBlock_(self, v58, (uint64_t)v4, v56, isEqualToString, v65);

        _Block_object_dispose(&v69, 8);
        goto LABEL_10;
      }
      id WeakRetained = objc_msgSend__item((void *)v70[5], v52, v53, v54);
      uint64_t v17 = objc_msgSend__service(WeakRetained, v59, v60, v61);
      uint64_t v55 = objc_msgSend_internalName(v17, v62, v63, v64);
    }
    else
    {

      uint64_t v55 = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_processChatItemsForUnavailabilityIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v11 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v8, v9, v10);
  uint64_t v111 = 0;
  __int16 v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 0;
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x2020000000;
  char v110 = 0;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  char v108 = 0;
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = sub_1A4C312E0;
  v97[3] = &unk_1E5B7E858;
  uint64_t v102 = v5;
  id v12 = v11;
  id v98 = v12;
  id v99 = &v105;
  uint64_t v100 = &v111;
  uint64_t v101 = v109;
  uint64_t v103 = v6;
  uint64_t v104 = v7;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v13, 2, (uint64_t)v97);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  int shouldDisplayUnavailabilityIndicator = objc_msgSend_shouldDisplayUnavailabilityIndicator(WeakRetained, v15, v16, v17);

  if (*((unsigned char *)v112 + 24))
  {
    id v22 = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t v25 = objc_msgSend_supportsCapabilities_(v22, v23, 0x200000, v24);

    if (shouldDisplayUnavailabilityIndicator) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (shouldDisplayUnavailabilityIndicator)
    {
LABEL_3:
      if (objc_msgSend_count(v12, v19, v20, v21))
      {
        uint64_t v29 = objc_msgSend_count(v4, v26, v27, v28);
        uint64_t Index = objc_msgSend_lastIndex(v12, v30, v31, v32);
        id v36 = objc_msgSend_objectAtIndex_(v4, v34, Index, v35);
        objc_msgSend_setDisplayNotifyAnywayButton_(v36, v37, v25, v38);
        if (v29 - 1 != Index || (unint64_t)objc_msgSend_count(v12, v39, v40, v41) >= 2)
        {
          objc_msgSend_removeObjectsAtIndexes_(v4, v39, (uint64_t)v12, v41);
          objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v42, (uint64_t)v36, (uint64_t)v4);
        }
      }
      else
      {
        id v46 = objc_loadWeakRetained((id *)&self->_chat);
        uint64_t v49 = objc_msgSend_participantsWithState_(v46, v47, 16, v48);
        id v36 = objc_msgSend_firstObject(v49, v50, v51, v52);

        uint64_t v53 = [IMUnavailabilityIndicatorChatItem alloc];
        uint64_t v55 = objc_msgSend__initWithHandle_displayNotifyAnywayButton_(v53, v54, (uint64_t)v36, v25);
        uint64_t v59 = objc_msgSend_chatItemForIMChatItem_(self, v56, (uint64_t)v55, v57);
        if (v59) {
          objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v58, (uint64_t)v59, (uint64_t)v4);
        }
      }
      if ((v25 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_17:
      uint64_t v60 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v43, v44, v45);
      uint64_t v91 = MEMORY[0x1E4F143A8];
      uint64_t v92 = 3221225472;
      uint64_t v93 = sub_1A4C313FC;
      uint64_t v94 = &unk_1E5B7E748;
      uint64_t v96 = v6;
      id v61 = v60;
      id v95 = v61;
      objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v62, 2, (uint64_t)&v91);
      if (!v25)
      {
        if (objc_msgSend_count(v61, v63, v64, v65, v91, v92, v93, v94)) {
          objc_msgSend_removeObjectsAtIndexes_(v4, v81, (uint64_t)v61, v82);
        }
        goto LABEL_28;
      }
      if (objc_msgSend_count(v61, v63, v64, v65, v91, v92, v93, v94))
      {
        uint64_t v69 = objc_msgSend_count(v4, v66, v67, v68);
        uint64_t v76 = objc_msgSend_lastIndex(v61, v70, v71, v72);
        if (v69 - 1 == v76 && (unint64_t)objc_msgSend_count(v61, v73, v74, v75) < 2) {
          goto LABEL_28;
        }
        long long v77 = objc_msgSend_objectAtIndex_(v4, v73, v76, v75);
        objc_msgSend_removeObjectsAtIndexes_(v4, v78, (uint64_t)v61, v79);
        objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v80, (uint64_t)v77, (uint64_t)v4);
      }
      else
      {
        uint64_t v83 = [IMNotifyAnywayChatItem alloc];
        long long v77 = objc_msgSend__init(v83, v84, v85, v86);
        uint64_t v90 = objc_msgSend_chatItemForIMChatItem_(self, v87, (uint64_t)v77, v88);
        if (v90) {
          objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v89, (uint64_t)v90, (uint64_t)v4);
        }
      }
LABEL_28:

      goto LABEL_29;
    }
  }
  if (objc_msgSend_count(v12, v19, v20, v21)) {
    objc_msgSend_removeObjectsAtIndexes_(v4, v43, (uint64_t)v12, v45);
  }
  if (v25) {
    goto LABEL_17;
  }
LABEL_16:
  if (*((unsigned char *)v106 + 24)) {
    goto LABEL_17;
  }
LABEL_29:

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(v109, 8);
  _Block_object_dispose(&v111, 8);
}

- (void)_processChatItemsForJunkRecoveryItem:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v12 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v9, v10, v11);
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  uint64_t v48 = sub_1A4C3160C;
  uint64_t v49 = &unk_1E5B7E748;
  uint64_t v51 = v8;
  id v13 = v12;
  id v50 = v13;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v14, 2, (uint64_t)&v46);
  if (objc_msgSend_isFiltered(v7, v15, v16, v17, v46, v47, v48, v49) == 2
    && (IMIsOscarEnabled(2, v18, v19, v20) & 1) != 0)
  {
    if (objc_msgSend_count(v13, v18, v19, v20))
    {
      uint64_t v24 = objc_msgSend_count(v6, v21, v22, v23) - 1;
      uint64_t Index = objc_msgSend_lastIndex(v13, v25, v26, v27);
      if (v24 == Index) {
        goto LABEL_9;
      }
      uint64_t v31 = objc_msgSend_objectAtIndex_(v6, v29, Index, v30);
      objc_msgSend_removeObjectsAtIndexes_(v6, v32, (uint64_t)v13, v33);
      if (!v31) {
        goto LABEL_9;
      }
    }
    else
    {
      id v39 = [v8 alloc];
      uint64_t v31 = objc_msgSend__initWithItem_(v39, v40, 0, v41);
      if (!v31) {
        goto LABEL_9;
      }
    }
    uint64_t v42 = objc_msgSend_earliestCachedMessageDate(v7, v34, v35, v36);
    objc_msgSend_setEarliestMessageDate_(v31, v43, (uint64_t)v42, v44);

    objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v45, (uint64_t)v31, (uint64_t)v6);
    goto LABEL_9;
  }
  if (objc_msgSend_count(v13, v18, v19, v20)) {
    objc_msgSend_removeObjectsAtIndexes_(v6, v37, (uint64_t)v13, v38);
  }
LABEL_9:
}

- (void)_processChatItemsForStewieResumeButtons:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v12 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v9, v10, v11);
  uint64_t v42 = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  uint64_t v44 = sub_1A4C31810;
  uint64_t v45 = &unk_1E5B7E748;
  uint64_t v47 = v8;
  id v13 = v12;
  id v46 = v13;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v14, 2, (uint64_t)&v42);
  int shouldShowStewieResumeButtonsForChat = objc_msgSend__shouldShowStewieResumeButtonsForChat_(self, v15, (uint64_t)v7, v16, v42, v43, v44, v45);
  uint64_t v21 = objc_msgSend_count(v13, v18, v19, v20);
  if (shouldShowStewieResumeButtonsForChat)
  {
    if (v21)
    {
      uint64_t v25 = objc_msgSend_count(v6, v22, v23, v24) - 1;
      uint64_t Index = objc_msgSend_lastIndex(v13, v26, v27, v28);
      if (v25 == Index) {
        goto LABEL_10;
      }
      uint64_t v32 = objc_msgSend_objectAtIndex_(v6, v30, Index, v31);
      objc_msgSend_removeObjectsAtIndexes_(v6, v33, (uint64_t)v13, v34);
      if (!v32) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v36 = [IMStewieResumeItem alloc];
      uint64_t v40 = objc_msgSend_chatIdentifier(v7, v37, v38, v39);
      uint64_t v32 = objc_msgSend__initWithItem_chatIdentifier_(v36, v41, 0, (uint64_t)v40);

      if (!v32) {
        goto LABEL_10;
      }
    }
    objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v35, (uint64_t)v32, (uint64_t)v6);

    goto LABEL_10;
  }
  if (v21) {
    objc_msgSend_removeObjectsAtIndexes_(v6, v22, (uint64_t)v13, v24);
  }
LABEL_10:
}

- (void)_processChatItemsForDownloadingPendingMessages:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  uint64_t v9 = objc_msgSend_account(WeakRetained, v6, v7, v8);
  id v13 = objc_msgSend_service(v9, v10, v11, v12);

  if (objc_msgSend_supportsShowingSatelliteMessageDownloadCount(v13, v14, v15, v16))
  {
    uint64_t v17 = &off_1E5B79000;
    uint64_t v18 = objc_opt_class();
    id v19 = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t v23 = objc_msgSend_pendingIncomingSatelliteMessageCount(v19, v20, v21, v22);

    uint64_t v27 = objc_msgSend_sharedInstance(IMChorosMonitor, v24, v25, v26);
    if (objc_msgSend_isSatelliteConnectionActive(v27, v28, v29, v30))
    {
      id v31 = objc_loadWeakRetained((id *)&self->_chat);
      int isDownloadingPendingSatelliteMessages = 0;
      if ((objc_msgSend_isGroupChat(v31, v32, v33, v34) & 1) == 0 && v23)
      {
        id v36 = objc_loadWeakRetained((id *)&self->_chat);
        int isDownloadingPendingSatelliteMessages = objc_msgSend_isDownloadingPendingSatelliteMessages(v36, v37, v38, v39);

        uint64_t v17 = &off_1E5B79000;
      }
    }
    else
    {
      int isDownloadingPendingSatelliteMessages = 0;
    }

    uint64_t v43 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v40, v41, v42);
    uint64_t v76 = MEMORY[0x1E4F143A8];
    uint64_t v77 = 3221225472;
    long long v78 = sub_1A4C31ACC;
    uint64_t v79 = &unk_1E5B7E748;
    uint64_t v81 = v18;
    id v44 = v43;
    id v80 = v44;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v4, v45, 2, (uint64_t)&v76);
    uint64_t v49 = objc_msgSend_count(v44, v46, v47, v48, v76, v77, v78, v79);
    if (!isDownloadingPendingSatelliteMessages)
    {
      if (v49) {
        objc_msgSend_removeObjectsAtIndexes_(v4, v50, (uint64_t)v44, v52);
      }
      goto LABEL_17;
    }
    if (v49)
    {
      uint64_t v53 = objc_msgSend_count(v4, v50, v51, v52) - 1;
      uint64_t Index = objc_msgSend_lastIndex(v44, v54, v55, v56);
      if (v53 == Index) {
        goto LABEL_17;
      }
      uint64_t v60 = objc_msgSend_objectAtIndex_(v4, v58, Index, v59);
      objc_msgSend_removeObjectsAtIndexes_(v4, v61, (uint64_t)v44, v62);
      if (!v60) {
        goto LABEL_17;
      }
    }
    else
    {
      id v65 = objc_alloc((Class)v17[425]);
      uint64_t v60 = objc_msgSend__initWithItem_(v65, v66, 0, v67);
      if (!v60)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    objc_msgSend__setPendingIncomingSatelliteMessageCount_(v60, v63, v23, v64);
    id v68 = objc_loadWeakRetained((id *)&self->_chat);
    uint64_t v72 = objc_msgSend_totalSatelliteMessageCount(v68, v69, v70, v71);
    objc_msgSend__setTotalSatelliteMessageCount_(v60, v73, v72, v74);

    objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v75, (uint64_t)v60, (uint64_t)v4);
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_processChatItemsForSuggestedReplies:(id)a3 inChat:(id)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_suggestedRepliesData(v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E9B0], v12, v13, v14);
    int isRBMEnabled = objc_msgSend_isRBMEnabled(v15, v16, v17, v18);

    if (isRBMEnabled)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F6E650];
      uint64_t v24 = objc_msgSend_suggestedRepliesData(v7, v20, v21, v22);
      uint64_t v27 = objc_msgSend_IMChipListFromSuggestions_(v23, v25, (uint64_t)v24, v26);

      id v31 = objc_msgSend_suggestedReplies(v27, v28, v29, v30);
      if (objc_msgSend_count(v31, v32, v33, v34))
      {
        uint64_t v38 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v35, v36, v37);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = sub_1A4C31DF8;
        v63[3] = &unk_1E5B7D978;
        id v39 = v38;
        id v64 = v39;
        objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v6, v40, 2, (uint64_t)v63);
        if (objc_msgSend_count(v39, v41, v42, v43)) {
          objc_msgSend_removeObjectsAtIndexes_(v6, v44, (uint64_t)v39, v46);
        }
        uint64_t v47 = objc_msgSend_suggestedReplies(v27, v44, v45, v46);
        v69[0] = v47;
        uint64_t v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v69, 1);

        if (IMOSLoggingEnabled())
        {
          id v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            uint64_t v54 = objc_msgSend_suggestedReplies(v27, v51, v52, v53);
            *(_DWORD *)buf = 138412546;
            id v66 = v54;
            __int16 v67 = 2112;
            id v68 = v7;
            _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "stage suggested replies: %@, chat: %@", buf, 0x16u);
          }
        }
        uint64_t v55 = [IMNewComposeSuggestedRepliesMessagePartChatItem alloc];
        uint64_t v59 = objc_msgSend_messageItem(v27, v56, v57, v58);
        id v61 = objc_msgSend_initWithItem_suggestedRepliesList_selectedIndex_(v55, v60, (uint64_t)v59, (uint64_t)v49, 0);

        objc_msgSend_addChatItem_toChatItemsAtEndButBeforeWatchReplyOrScheduledSendItems_(self, v62, (uint64_t)v61, (uint64_t)v6);
      }
    }
  }
}

- (void)_processChatItemsForAttribution:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v112 = 0;
  uint64_t v113 = &v112;
  uint64_t v114 = 0x3032000000;
  id v115 = sub_1A4B3458C;
  id v116 = sub_1A4B343AC;
  id v117 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v5, v6, v7);
  id v117 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v106 = 0;
  uint64_t v107 = &v106;
  uint64_t v108 = 0x3032000000;
  uint64_t v109 = sub_1A4B3458C;
  char v110 = sub_1A4B343AC;
  id v111 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  id v111 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x3032000000;
  uint64_t v103 = sub_1A4B3458C;
  uint64_t v104 = sub_1A4B343AC;
  id v105 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v11, v12, v13);
  id v105 = (id)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = sub_1A4C3251C;
  v97[3] = &unk_1E5B7E880;
  id v14 = v4;
  id v98 = v14;
  id v99 = &v100;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v14, v15, 2, (uint64_t)v97);
  objc_msgSend_removeObjectsAtIndexes_(v14, v16, v101[5], v17);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = sub_1A4C325F4;
  v92[3] = &unk_1E5B7E8A8;
  id v18 = v14;
  id v93 = v18;
  uint64_t v94 = self;
  id v95 = &v106;
  uint64_t v96 = &v112;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v19, (uint64_t)v92, v20);
  uint64_t v24 = objc_msgSend_count((void *)v107[5], v21, v22, v23);
  if (v24 == objc_msgSend_count((void *)v113[5], v25, v26, v27))
  {
    objc_msgSend_insertObjects_atIndexes_(v18, v28, v107[5], v113[5]);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = v107[5];
      uint64_t v34 = v113[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v34;
      _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Attribution chat items to insert: %@ did not match indices: %@", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v119 = sub_1A4B3458C;
  uint64_t v120 = sub_1A4B343AC;
  id v121 = 0;
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v29, v30, v31);
  id v121 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = 0;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x3032000000;
  id v89 = sub_1A4B3458C;
  uint64_t v90 = sub_1A4B343AC;
  id v91 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v35, v36, v37);
  id v91 = (id)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = sub_1A4C32718;
  v81[3] = &unk_1E5B7E8D0;
  id v38 = v18;
  uint64_t v84 = buf;
  uint64_t v85 = &v86;
  id v82 = v38;
  uint64_t v83 = self;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v38, v39, 2, (uint64_t)v81);
  objc_msgSend_removeObjectsAtIndexes_(v38, v40, v87[5], v41);
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000;
  long long v78 = sub_1A4B3458C;
  uint64_t v79 = sub_1A4B343AC;
  id v80 = 0;
  objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v42, v43, v44);
  id v80 = (id)objc_claimAutoreleasedReturnValue();
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = sub_1A4C32AA8;
  v72[3] = &unk_1E5B7E880;
  id v45 = v38;
  id v73 = v45;
  uint64_t v74 = &v75;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v45, v46, 2, (uint64_t)v72);
  objc_msgSend_removeObjectsAtIndexes_(v45, v47, v76[5], v48);
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  char v71 = 1;
  uint64_t v64 = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  id v66 = sub_1A4C32BBC;
  __int16 v67 = &unk_1E5B7E8F8;
  uint64_t v69 = v70;
  id v49 = v45;
  id v68 = v49;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v49, v50, 2, (uint64_t)&v64);
  if (objc_msgSend_count(*(void **)(*(void *)&buf[8] + 40), v51, v52, v53, v64, v65, v66, v67))
  {
    uint64_t v57 = objc_msgSend_sharedInstance(IMBalloonPluginAttributionController, v54, v55, v56);
    id v61 = objc_msgSend_allObjects(*(void **)(*(void *)&buf[8] + 40), v58, v59, v60);
    objc_msgSend_didShowAttributionForBundleIDs_(v57, v62, (uint64_t)v61, v63);
  }
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v112, 8);
}

- (BOOL)_shouldReloadChatItemWithAssociatedChatItems:(id)a3 oldAssociatedChatItems:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend_fileTransferReloadStatus(*(void **)(*((void *)&v19 + 1) + 8 * i), v9, v10, v11, (void)v19))
        {

          goto LABEL_15;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (v5 == v6) {
    goto LABEL_16;
  }
  if (v5 && !objc_msgSend_isEqual_(v5, v15, (uint64_t)v6, v16))
  {
LABEL_15:
    LOBYTE(v17) = 1;
    goto LABEL_17;
  }
  if (!v6)
  {
LABEL_16:
    LOBYTE(v17) = 0;
    goto LABEL_17;
  }
  int v17 = objc_msgSend_isEqual_(v6, v15, (uint64_t)v5, v16) ^ 1;
LABEL_17:

  return v17;
}

- (BOOL)_shouldReloadChatItem:(id)a3 oldChatItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  if (v6 == v7) {
    goto LABEL_78;
  }
  int v11 = objc_msgSend_contiguousType(v6, v8, v9, v10);
  if (v11 != objc_msgSend_contiguousType(v7, v12, v13, v14)) {
    goto LABEL_16;
  }
  int v18 = objc_msgSend_attachmentContiguousType(v6, v15, v16, v17);
  if (v18 != objc_msgSend_attachmentContiguousType(v7, v19, v20, v21)) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = objc_msgSend_statusType(v6, v22, v23, v24);
    if (v25 != objc_msgSend_statusType(v7, v26, v27, v28)) {
      goto LABEL_16;
    }
    uint64_t v32 = objc_msgSend_count(v6, v29, v30, v31);
    if (v32 != objc_msgSend_count(v7, v33, v34, v35)) {
      goto LABEL_16;
    }
    uint64_t v39 = objc_msgSend_expireStatusType(v6, v36, v37, v38);
    if (v39 != objc_msgSend_expireStatusType(v7, v40, v41, v42)) {
      goto LABEL_16;
    }
    uint64_t v46 = objc_msgSend__item(v6, v43, v44, v45);
    id v50 = objc_msgSend_message(v46, v47, v48, v49);

    uint64_t v54 = objc_msgSend__item(v7, v51, v52, v53);
    uint64_t v58 = objc_msgSend_message(v54, v55, v56, v57);

    uint64_t v62 = objc_msgSend_error(v50, v59, v60, v61);
    uint64_t v66 = objc_msgSend_code(v62, v63, v64, v65);
    uint64_t v70 = objc_msgSend_error(v58, v67, v68, v69);
    uint64_t v74 = objc_msgSend_code(v70, v71, v72, v73);

    if (v66 != v74) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_wasReportedAsSpam(v6, v75, v76, v77)) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v78 = v7;
    id v82 = objc_msgSend_extensionName(v6, v79, v80, v81);
    uint64_t v86 = objc_msgSend_extensionName(v78, v83, v84, v85);

    LODWORD(v78) = objc_msgSend_isEqualToString_(v82, v87, (uint64_t)v86, v88);
    if (!v78) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || objc_msgSend_supportsCommunicationSafety(v6, v89, v90, v91)
    && objc_msgSend_fileTransferReloadStatus(v7, v94, v95, v96) == 1)
  {
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v97 = v7;
    int v101 = objc_msgSend_failed(v6, v98, v99, v100);
    int v105 = objc_msgSend_failed(v97, v102, v103, v104);

    if (v101 != v105) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v106 = v7;
    int v110 = objc_msgSend_failed(v6, v107, v108, v109);
    int v114 = objc_msgSend_failed(v106, v111, v112, v113);

    if (v110 != v114) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v115 = v7;
    int v119 = objc_msgSend_failed(v6, v116, v117, v118);
    int v123 = objc_msgSend_failed(v115, v120, v121, v122);

    if (v119 != v123) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v124 = v7;
    uint64_t v128 = objc_msgSend_selectedIndex(v6, v125, v126, v127);
    uint64_t v132 = objc_msgSend_selectedIndex(v124, v129, v130, v131);

    if (v128 != v132) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v133 = v6;
    id v134 = v7;
    v138 = objc_msgSend_visibleAssociatedMessageChatItems(v133, v135, v136, v137);
    uint64_t v142 = objc_msgSend_visibleAssociatedMessageChatItems(v134, v139, v140, v141);
    char shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems = objc_msgSend__shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems_(self, v143, (uint64_t)v138, (uint64_t)v142);

    if (shouldReloadChatItemWithAssociatedChatItems_oldAssociatedChatItems) {
      goto LABEL_47;
    }
    uint64_t v148 = objc_msgSend_syndicationType(v134, v145, v146, v147);
    if (v148 != objc_msgSend_syndicationType(v133, v149, v150, v151)) {
      goto LABEL_47;
    }
    v155 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v152, v153, v154);
    int isScheduledMessagesCoreEnabled = objc_msgSend_isScheduledMessagesCoreEnabled(v155, v156, v157, v158);

    if (isScheduledMessagesCoreEnabled)
    {
      if (objc_msgSend_scheduleType(v134, v160, v161, v162) == 2
        || objc_msgSend_scheduleType(v133, v163, v164, v165) == 2)
      {
        uint64_t v335 = objc_msgSend_scheduleType(v134, v163, v164, v165);
        uint64_t v334 = objc_msgSend_scheduleType(v133, v166, v167, v168);
        uint64_t v333 = objc_msgSend_scheduleState(v134, v169, v170, v171);
        uint64_t v175 = objc_msgSend_scheduleState(v133, v172, v173, v174);
        long long v179 = objc_msgSend_time(v134, v176, v177, v178);
        char v183 = objc_msgSend_time(v133, v180, v181, v182);
        int isEqualToDate = objc_msgSend_isEqualToDate_(v179, v184, (uint64_t)v183, v185);

        uint64_t v190 = objc_msgSend_text(v134, v187, v188, v189);
        uint64_t v194 = objc_msgSend_text(v133, v191, v192, v193);
        int isEqualToAttributedString = objc_msgSend_isEqualToAttributedString_(v190, v195, (uint64_t)v194, v196);

        if (v335 != v334 || v333 != v175 || !isEqualToAttributedString || !isEqualToDate)
        {
LABEL_47:

          goto LABEL_16;
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v201 = objc_msgSend__item(v6, v198, v199, v200);
    objc_msgSend_message(v201, v202, v203, v204);
    id v205 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v209 = objc_msgSend__item(v7, v206, v207, v208);
    v213 = objc_msgSend_message(v209, v210, v211, v212);

    v217 = objc_msgSend_sender(v205, v214, v215, v216);
    uint64_t v221 = objc_msgSend_service(v217, v218, v219, v220);
    uint64_t v225 = objc_msgSend_sender(v213, v222, v223, v224);
    v229 = objc_msgSend_service(v225, v226, v227, v228);
    if (v221 != v229)
    {
LABEL_44:

      goto LABEL_45;
    }
    v233 = objc_msgSend_error(v205, v230, v231, v232);
    v240 = objc_msgSend_error(v213, v234, v235, v236);
    if ((v233 != 0) == (v240 == 0)
      || (int isPlayed = objc_msgSend_isPlayed(v205, v237, v238, v239),
          isPlayed != objc_msgSend_isPlayed(v213, v242, v243, v244)))
    {

      v229 = v221;
      goto LABEL_44;
    }
    int hasDataDetectorResults = objc_msgSend_hasDataDetectorResults(v205, v245, v246, v247);
    int v251 = objc_msgSend_hasDataDetectorResults(v213, v248, v249, v250);

    if (hasDataDetectorResults != v251) {
      goto LABEL_46;
    }
    v217 = objc_msgSend_syndicationRanges(v213, v252, v253, v254);
    uint64_t v258 = objc_msgSend_syndicationRanges(v205, v255, v256, v257);
    uint64_t v221 = (void *)v258;
    if (v217 != (void *)v258 && (!v217 || !v258 || !objc_msgSend_isEqualToArray_(v217, v259, v258, v261)))
    {
LABEL_45:

LABEL_46:
      goto LABEL_16;
    }
    char hasEditedParts = objc_msgSend_hasEditedParts(v205, v259, v260, v261);

    if (hasEditedParts) {
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (id v263 = v7,
        int isShowingEditHistory = objc_msgSend_isShowingEditHistory(v6, v264, v265, v266),
        int v271 = objc_msgSend_isShowingEditHistory(v263, v268, v269, v270),
        v263,
        isShowingEditHistory == v271))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v272 = v7;
      v276 = objc_msgSend_richCards(v6, v273, v274, v275);
      uint64_t v280 = objc_msgSend_richCards(v272, v277, v278, v279);

      int v92 = objc_msgSend_isEqual_(v276, v281, (uint64_t)v280, v282) ^ 1;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend_transferGUID(v6, v283, v284, v285),
          BOOL v286 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_transferGUID(v7, v287, v288, v289),
          v290 = objc_claimAutoreleasedReturnValue(),
          int isEqualToString = objc_msgSend_isEqualToString_(v286, v291, (uint64_t)v290, v292),
          v290,
          v286,
          isEqualToString))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v205 = v6;
        uint64_t v297 = objc_msgSend_dataSource(v205, v294, v295, v296);
        int hasInvalidatedSize = objc_msgSend_hasInvalidatedSize(v297, v298, v299, v300);

        if (hasInvalidatedSize)
        {
          v213 = objc_msgSend_dataSource(v205, v302, v303, v304);
          objc_msgSend_setHasInvalidatedSize_(v213, v305, 0, v306);
          goto LABEL_46;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v310 = objc_msgSend_offerState(v6, v307, v308, v309);
        if (v310 != objc_msgSend_offerState(v7, v311, v312, v313)) {
          goto LABEL_16;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend_isEqual_(v6, v314, (uint64_t)v7, v315)) {
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if (!objc_msgSend_isEqual_(v6, v316, (uint64_t)v7, v317)) {
          goto LABEL_16;
        }
      }
      v319 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v316, v318, v317);
      int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v319, v320, v321, v322);

      if (isCarrierPigeonEnabled)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v324 = v7;
            int isPendingSatelliteSend = objc_msgSend_isPendingSatelliteSend(v6, v325, v326, v327);
            int v332 = objc_msgSend_isPendingSatelliteSend(v324, v329, v330, v331);

            if (isPendingSatelliteSend != v332) {
              goto LABEL_16;
            }
          }
        }
      }
LABEL_78:
      LOBYTE(v92) = 0;
      goto LABEL_17;
    }
  }
LABEL_16:
  LOBYTE(v92) = 1;
LABEL_17:

  return v92;
}

- (BOOL)_shouldReloadSatelliteChatItems:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  int UsedSatelliteStatus = objc_msgSend_lastUsedSatelliteStatus(WeakRetained, v6, v7, v8);
  uint64_t v13 = objc_msgSend_sharedInstance(IMChorosMonitor, v10, v11, v12);
  int isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v13, v14, v15, v16);

  if (UsedSatelliteStatus != isSatelliteConnectionActive) {
    goto LABEL_4;
  }
  id v18 = objc_loadWeakRetained((id *)&self->_chat);
  int UsedShowTextRoadsideProviderStatus = objc_msgSend_lastUsedShowTextRoadsideProviderStatus(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_sharedInstance(IMChorosMonitor, v23, v24, v25);
  int shouldShowTextRoadsideProviderButton = objc_msgSend_shouldShowTextRoadsideProviderButton(v26, v27, v28, v29);

  if (UsedShowTextRoadsideProviderStatus != shouldShowTextRoadsideProviderButton) {
    goto LABEL_4;
  }
  id v31 = objc_loadWeakRetained((id *)&self->_chat);
  int UsedShowTextEmergencyServicesStatus = objc_msgSend_lastUsedShowTextEmergencyServicesStatus(v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend_sharedInstance(IMChorosMonitor, v36, v37, v38);
  int shouldShowTextEmergencyServicesButton = objc_msgSend_shouldShowTextEmergencyServicesButton(v39, v40, v41, v42);

  if (UsedShowTextEmergencyServicesStatus == shouldShowTextEmergencyServicesButton)
  {
    id v46 = objc_loadWeakRetained((id *)&self->_chat);
    if (objc_msgSend_isStewieChat(v46, v47, v48, v49))
    {
      id v50 = objc_loadWeakRetained((id *)&self->_chat);
      int shouldShowStewieResumeButtonsForChat = objc_msgSend__shouldShowStewieResumeButtonsForChat_(self, v51, (uint64_t)v50, v52);
      uint64_t v54 = objc_opt_class();
      int v44 = shouldShowStewieResumeButtonsForChat ^ sub_1A4C33C18(v54, v4, v54);
    }
    else
    {
      LOBYTE(v44) = 0;
    }
  }
  else
  {
LABEL_4:
    LOBYTE(v44) = 1;
  }

  return v44;
}

- (id)_itemWithChatItemsDeleted:(id)a3 fromItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapOfItemsDeleted:(id *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v9 = a4;
  objc_opt_class();
  uint64_t v10 = v9;
  if (objc_opt_isKindOfClass())
  {
    id v31 = a5;
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(v32, v12, v13, v14);
    id v18 = objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = v32;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, (uint64_t)v41, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_addObject_(v18, v25, v24, v26);
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v38 = v24;
              __int16 v39 = 2112;
              id v40 = v9;
              _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Can only delete message parts. Tried to delete %@ from message:%@", buf, 0x16u);
            }
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v27, (uint64_t)&v33, (uint64_t)v41, 16);
      }
      while (v21);
    }

    uint64_t v10 = objc_msgSend__messageItemWithPartsDeleted_fromMessageItem_indexesOfItemsDeleted_indexToRangeMapping_(IMMessagePartChatItem, v29, (uint64_t)v18, (uint64_t)v9, v31, a6);
  }

  return v10;
}

- (id)_initWithChat:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMTranscriptChatItemRules;
  id v5 = [(IMTranscriptChatItemRules *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chat, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = objc_msgSend_initWithCapacity_(v7, v8, 10, v9);
    chatItems = v6->_chatItems;
    v6->_chatItems = (NSMutableArray *)v10;
  }
  return v6;
}

- (void)_invalidateSpamIndicatorCachedValues
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  objc_msgSend_invalidateSpamIndicatorCachedValues(WeakRetained, v2, v3, v4);
}

- (IMChat)chat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);

  return (IMChat *)WeakRetained;
}

- (void)setChat:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)chatItems
{
  return self->_chatItems;
}

- (void)setChatItems:(id)a3
{
}

- (NSDate)nextStaleTime
{
  return self->_nextStaleTime;
}

- (void)setNextStaleTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextStaleTime, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak((id *)&self->_chat);
}

- (id)testChatItems
{
  v126[16] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);
  id v6 = objc_msgSend_participants(WeakRetained, v3, v4, v5);

  uint64_t v9 = objc_msgSend_objectAtIndex_(v6, v7, 0, v8);
  uint64_t v15 = 0;
  if ((unint64_t)objc_msgSend_count(v6, v10, v11, v12) >= 2)
  {
    uint64_t v15 = objc_msgSend_objectAtIndex_(v6, v13, 1, v14);
  }
  int v101 = (void *)v15;
  uint64_t v125 = v6;
  uint64_t v16 = [IMGroupActionChatItem alloc];
  id v124 = objc_alloc_init(MEMORY[0x1E4F6E798]);
  objc_msgSend_setActionType_(v124, v17, 0, v18);
  int v123 = objc_msgSend__initWithItem_sender_(v16, v19, (uint64_t)v124, 0);
  v126[0] = v123;
  uint64_t v20 = [IMGroupActionChatItem alloc];
  id v122 = objc_alloc_init(MEMORY[0x1E4F6E798]);
  objc_msgSend_setActionType_(v122, v21, 0, v22);
  uint64_t v121 = objc_msgSend__initWithItem_sender_(v20, v23, (uint64_t)v122, (uint64_t)v9);
  v126[1] = v121;
  uint64_t v24 = [IMGroupTitleChangeChatItem alloc];
  id v120 = objc_alloc_init(MEMORY[0x1E4F6E7A8]);
  objc_msgSend_setTitle_(v120, v25, @"Vegas Trip", v26);
  int v119 = objc_msgSend__initWithItem_sender_(v24, v27, (uint64_t)v120, 0);
  v126[2] = v119;
  uint64_t v28 = [IMGroupTitleChangeChatItem alloc];
  id v118 = objc_alloc_init(MEMORY[0x1E4F6E7A8]);
  objc_msgSend_setTitle_(v118, v29, @"Vegas Trip", v30);
  uint64_t v117 = objc_msgSend__initWithItem_sender_(v28, v31, (uint64_t)v118, (uint64_t)v9);
  v126[3] = v117;
  id v32 = [IMParticipantChangeChatItem alloc];
  id v116 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v116, v33, 0, v34);
  id v115 = objc_msgSend__initWithItem_sender_otherHandle_(v32, v35, (uint64_t)v116, 0, v9);
  v126[4] = v115;
  long long v36 = [IMParticipantChangeChatItem alloc];
  id v114 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v114, v37, 0, v38);
  uint64_t v113 = objc_msgSend__initWithItem_sender_otherHandle_(v36, v39, (uint64_t)v114, (uint64_t)v9, 0);
  v126[5] = v113;
  id v40 = [IMParticipantChangeChatItem alloc];
  id v112 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v112, v41, 0, v42);
  id v111 = objc_msgSend__initWithItem_sender_otherHandle_(v40, v43, (uint64_t)v112, (uint64_t)v9, v15);
  v126[6] = v111;
  int v44 = [IMParticipantChangeChatItem alloc];
  id v110 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v110, v45, 1, v46);
  uint64_t v109 = objc_msgSend__initWithItem_sender_otherHandle_(v44, v47, (uint64_t)v110, 0, v9);
  v126[7] = v109;
  uint64_t v48 = [IMParticipantChangeChatItem alloc];
  id v108 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v108, v49, 1, v50);
  uint64_t v107 = objc_msgSend__initWithItem_sender_otherHandle_(v48, v51, (uint64_t)v108, (uint64_t)v9, 0);
  v126[8] = v107;
  uint64_t v52 = [IMParticipantChangeChatItem alloc];
  id v106 = objc_alloc_init(MEMORY[0x1E4F6E8E0]);
  objc_msgSend_setChangeType_(v106, v53, 1, v54);
  int v105 = objc_msgSend__initWithItem_sender_otherHandle_(v52, v55, (uint64_t)v106, (uint64_t)v9, v15);
  v126[9] = v105;
  uint64_t v56 = [IMLocationShareActionChatItem alloc];
  id v104 = objc_alloc_init(MEMORY[0x1E4F6E800]);
  objc_msgSend_setStatus_(v104, v57, 0, v58);
  objc_msgSend_setDirection_(v104, v59, 0, v60);
  uint64_t v103 = objc_msgSend__initWithItem_sender_otherHandle_(v56, v61, (uint64_t)v104, 0, v9);
  v126[10] = v103;
  uint64_t v62 = [IMLocationShareActionChatItem alloc];
  id v63 = objc_alloc_init(MEMORY[0x1E4F6E800]);
  objc_msgSend_setStatus_(v63, v64, 1, v65);
  objc_msgSend_setDirection_(v63, v66, 0, v67);
  uint64_t v102 = objc_msgSend__initWithItem_sender_otherHandle_(v62, v68, (uint64_t)v63, 0, v9);
  v126[11] = v102;
  uint64_t v69 = [IMLocationShareActionChatItem alloc];
  id v70 = objc_alloc_init(MEMORY[0x1E4F6E800]);
  objc_msgSend_setStatus_(v70, v71, 0, v72);
  objc_msgSend_setDirection_(v70, v73, 1, v74);
  uint64_t v100 = objc_msgSend__initWithItem_sender_otherHandle_(v69, v75, (uint64_t)v70, (uint64_t)v9, 0);
  v126[12] = v100;
  uint64_t v76 = [IMLocationShareActionChatItem alloc];
  id v77 = objc_alloc_init(MEMORY[0x1E4F6E800]);
  objc_msgSend_setStatus_(v77, v78, 1, v79);
  objc_msgSend_setDirection_(v77, v80, 1, v81);
  uint64_t v83 = objc_msgSend__initWithItem_sender_otherHandle_(v76, v82, (uint64_t)v77, (uint64_t)v9, 0);
  v126[13] = v83;
  uint64_t v84 = [IMTranscriptSharingChatItem alloc];
  id v85 = objc_alloc_init(MEMORY[0x1E4F6EAA0]);
  uint64_t v88 = objc_msgSend__initWithItem_(v84, v86, (uint64_t)v85, v87);
  v126[14] = v88;
  id v89 = [IMLocationUpdateSentChatItem alloc];
  id v90 = objc_alloc_init(MEMORY[0x1E4F6E808]);
  uint64_t v94 = objc_msgSend_ID(v9, v91, v92, v93);
  uint64_t v96 = objc_msgSend__initWithItem_chatIdentifier_(v89, v95, (uint64_t)v90, (uint64_t)v94);
  v126[15] = v96;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v97, (uint64_t)v126, 16);
  id v99 = (id)objc_claimAutoreleasedReturnValue();

  return v99;
}

+ (BOOL)testShouldShowReportSpamForChat:(id)a3 items:(id)a4
{
  return sub_1A4C158B0(a3, a4);
}

+ (BOOL)testShouldShowSMSSpamForChat:(id)a3 items:(id)a4
{
  return sub_1A4C2AE30(a3, a4);
}

@end