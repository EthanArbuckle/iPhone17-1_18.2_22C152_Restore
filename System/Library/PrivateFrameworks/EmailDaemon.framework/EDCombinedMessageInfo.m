@interface EDCombinedMessageInfo
@end

@implementation EDCombinedMessageInfo

void __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) combinedDate];
  [v3 setDate:v4];

  v5 = [*(id *)(a1 + 40) displayDate];
  [v3 setDisplayDate:v5];

  v6 = [*(id *)(a1 + 40) readLater];
  [v3 setReadLater:v6];

  v7 = [*(id *)(a1 + 40) sendLaterDate];
  [v3 setSendLaterDate:v7];

  v8 = [*(id *)(a1 + 40) followUp];
  [v3 setFollowUp:v8];

  v9 = [*(id *)(a1 + 40) category];
  [v3 setCategory:v9];

  objc_msgSend(v3, "setBusinessID:", objc_msgSend(*(id *)(a1 + 40), "businessID"));
  v10 = [*(id *)(a1 + 40) businessLogoID];
  [v3 setBusinessLogoID:v10];

  v11 = [*(id *)(a1 + 40) subject];
  [v3 setSubject:v11];

  v12 = [*(id *)(a1 + 40) summary];
  [v3 setSummary:v12];

  v13 = [*(id *)(a1 + 40) senderList];
  [v3 setSenderList:v13];

  v14 = [*(id *)(a1 + 40) toList];
  [v3 setToList:v14];

  v15 = [*(id *)(a1 + 40) ccList];
  [v3 setCcList:v15];

  v16 = [*(id *)(a1 + 40) bccList];
  [v3 setBccList:v16];

  v17 = [*(id *)(a1 + 32) combinedMessageFlags];
  [v3 setFlags:v17];

  objc_msgSend(v3, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 40), "isBlocked"));
  objc_msgSend(v3, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 40), "unsubscribeType"));
  objc_msgSend(v3, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 40), "hasAttachments"));
  objc_msgSend(v3, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 40), "isAuthenticated"));
  objc_msgSend(v3, "setAllowAuthenticationWarning:", objc_msgSend(*(id *)(a1 + 40), "allowAuthenticationWarning"));
  objc_msgSend(v3, "setConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 40), "conversationNotificationLevel"));
  v18 = [*(id *)(a1 + 40) brandIndicatorLocation];
  [v3 setBrandIndicatorLocation:v18];

  objc_msgSend(v3, "setConversationID:", objc_msgSend(*(id *)(a1 + 40), "conversationID"));
  v19 = [*(id *)(a1 + 40) documentID];
  [v3 setDocumentID:v19];

  v20 = [*(id *)(a1 + 40) searchableMessageID];
  [v3 setSearchableMessageID:v20];

  v21 = [*(id *)(a1 + 32) combinedMailboxes];
  if (![v21 count])
  {
    v22 = +[EDMessagePersistence log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke_cold_1(v24, [*(id *)(a1 + 32) lowestDatabaseID], v22);
    }
  }
  [v3 setMailboxes:v21];
  objc_msgSend(v3, "setIsToMe:", objc_msgSend(*(id *)(a1 + 40), "isToMe"));
  objc_msgSend(v3, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 40), "isCCMe"));
  objc_msgSend(v3, "setIsVIP:", objc_msgSend(*(id *)(a1 + 40), "isVIP"));
  v23 = [*(id *)(a1 + 40) loaderBlock];
  [v3 setLoaderBlock:v23];
}

id __38___EDCombinedMessageInfo_combinedDate__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "laterDate:");

  return v2;
}

void __45___EDCombinedMessageInfo_deduplicatedMessage__block_invoke_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "No mailboxes were found for legacy message database id: %lld", buf, 0xCu);
}

@end