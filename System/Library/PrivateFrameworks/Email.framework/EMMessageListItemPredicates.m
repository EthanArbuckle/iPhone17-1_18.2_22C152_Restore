@interface EMMessageListItemPredicates
+ (BOOL)_isPredicateForMessagesInAccountObjectIDs:(id)a3 accountObjectIDs:(id *)a4;
+ (BOOL)_isPredicateForMessagesInMailboxObjectIDs:(id)a3 mailboxObjectIDs:(id *)a4;
+ (BOOL)_isPredicateForMessagesWithActiveFollowUp:(id)a3;
+ (BOOL)isPredicateForMessagesInAccountObjectID:(id)a3 accountObjectID:(id *)a4;
+ (BOOL)isPredicateForMessagesInMailboxObjectID:(id)a3 mailboxObjectID:(id *)a4;
+ (BOOL)isPredicateForMessagesInMailboxWithType:(id)a3 mailboxType:(int64_t *)a4;
+ (BOOL)isPredicateForMessagesWithActiveFollowUp:(id)a3 mailboxTypeResolver:(id)a4 inSent:(BOOL *)a5 sentMailboxObjectIDs:(id *)a6;
+ (BOOL)isPredicateForMessagesWithFiredReadLaterDate:(id)a3 accountObjectIDs:(id *)a4;
+ (BOOL)isValidPredicate:(id)a3 forClass:(Class)a4;
+ (BOOL)predicate:(id)a3 appliesToFlagChange:(id)a4;
+ (OS_os_log)log;
+ (id)_dateRangePredicateForListItemKeyPath:(id)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)_keyPathsForFlagChange:(id)a3;
+ (id)_predicateForActiveFollowUpMessagesIncludeExpired:(BOOL)a3;
+ (id)_predicateForFollowUpMessages;
+ (id)_predicateForKeyPath:(id)a3 value:(id)a4;
+ (id)_predicateForMessagesInMailboxWithType:(id)a3;
+ (id)_predicateForMessagesInMailboxWithURL:(id)a3;
+ (id)_predicateForModelHighImpactMessages;
+ (id)_predicateForReadLaterMessagesFired:(BOOL)a3;
+ (id)_predicateStrippingSpotlightOnlyTerms:(id)a3;
+ (id)mailboxScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4;
+ (id)mailboxURLsForPredicate:(id)a3;
+ (id)predicateForAccount:(id)a3;
+ (id)predicateForAccountIdentifier:(id)a3;
+ (id)predicateForAccountWithObjectID:(id)a3;
+ (id)predicateForCCMeMessages;
+ (id)predicateForExcludingMessagesInMailbox:(id)a3;
+ (id)predicateForExcludingMessagesInMailboxObjectID:(id)a3;
+ (id)predicateForExcludingMessagesInMailboxWithType:(int64_t)a3;
+ (id)predicateForExcludingMessagesInMailboxWithURL:(id)a3;
+ (id)predicateForExcludingMessagesInMailboxes:(id)a3;
+ (id)predicateForExcludingMessagesInMailboxesWithObjectIDs:(id)a3;
+ (id)predicateForExcludingMessagesInMailboxesWithTypes:(id)a3;
+ (id)predicateForFiredReadLaterMessages;
+ (id)predicateForFlagColor:(unint64_t)a3;
+ (id)predicateForFlaggedMessages;
+ (id)predicateForIncludesMeMessages;
+ (id)predicateForIsVIP:(BOOL)a3;
+ (id)predicateForMessagesCced:(id)a3;
+ (id)predicateForMessagesForBusinessID:(int64_t)a3;
+ (id)predicateForMessagesForBusinessID:(int64_t)a3 forAccount:(id)a4;
+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3;
+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3 additionalAccountObjectIDs:(id)a4;
+ (id)predicateForMessagesInConversation:(int64_t)a3;
+ (id)predicateForMessagesInMailbox:(id)a3;
+ (id)predicateForMessagesInMailboxWithObjectID:(id)a3;
+ (id)predicateForMessagesInMailboxWithType:(int64_t)a3;
+ (id)predicateForMessagesInMailboxes:(id)a3;
+ (id)predicateForMessagesInMailboxesWithObjectIDs:(id)a3;
+ (id)predicateForMessagesInMailboxesWithTypes:(id)a3;
+ (id)predicateForMessagesNewerThanDate:(id)a3;
+ (id)predicateForMessagesNewerThanDisplayDate:(id)a3;
+ (id)predicateForMessagesTo:(id)a3;
+ (id)predicateForMessagesWithActiveFollowUp;
+ (id)predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:(id)a3 mailboxTypeResolver:(id)a4;
+ (id)predicateForMessagesWithActiveFollowUpInSent;
+ (id)predicateForMessagesWithAttachments;
+ (id)predicateForMessagesWithCategoryType:(unint64_t)a3;
+ (id)predicateForMessagesWithCcAddresses:(id)a3;
+ (id)predicateForMessagesWithMailboxScope:(id)a3;
+ (id)predicateForMessagesWithRecipient:(id)a3;
+ (id)predicateForMessagesWithRecipients:(id)a3;
+ (id)predicateForMessagesWithSender:(id)a3;
+ (id)predicateForMessagesWithSender:(id)a3 forAccount:(id)a4;
+ (id)predicateForMessagesWithSenders:(id)a3;
+ (id)predicateForMessagesWithThreadScope:(id)a3;
+ (id)predicateForMessagesWithToAddresses:(id)a3;
+ (id)predicateForMessagesWithUnfiredFollowUp;
+ (id)predicateForMessagesWithoutSender:(id)a3;
+ (id)predicateForMessagesWithoutSenders:(id)a3;
+ (id)predicateForMuteMessages;
+ (id)predicateForNonPrimaryMessages;
+ (id)predicateForNotifyMessages;
+ (id)predicateForPrimaryMessages;
+ (id)predicateForReadLaterMessages;
+ (id)predicateForReadLaterMessagesWithStartDate:(id)a3 endDate:(id)a4;
+ (id)predicateForReadLaterSmartMailbox;
+ (id)predicateForReadMessages;
+ (id)predicateForRecentMessages;
+ (id)predicateForSendLaterMessages;
+ (id)predicateForSendLaterMessagesWithStartDate:(id)a3 endDate:(id)a4;
+ (id)predicateForToMeMessages;
+ (id)predicateForTodayMessages;
+ (id)predicateForUnfiredReadLaterMessages;
+ (id)predicateForUnfiredReadLaterMessagesInInbox;
+ (id)predicateForUnflaggedMessages;
+ (id)predicateForUnreadMessages;
+ (id)predicateForUnsubscribableMessages;
+ (id)predicateForUrgentMessages;
+ (id)predicateFromPredicate:(id)a3 ignoringKeyPaths:(id)a4;
+ (id)predicateFromPredicate:(id)a3 ignoringPredicates:(id)a4;
+ (id)predicateStrippingSpotlightOnlyTerms:(id)a3;
+ (id)sortDescriptorForDateAscending:(BOOL)a3;
+ (id)sortDescriptorForKeyPath:(id)a3 ascending:(BOOL)a4;
+ (id)threadScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4;
+ (id)transformPredicateWithMailboxes:(id)a3 mailboxTypeResolver:(id)a4 shouldIncludeFollowUps:(BOOL)a5 shouldIncludeReadLater:(BOOL)a6 limitToSender:(id)a7;
+ (int64_t)dateSortOrderFromSortDescriptors:(id)a3;
@end

@implementation EMMessageListItemPredicates

id __63__EMMessageListItemPredicates_predicateForMessagesInMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) predicateForMessagesInMailbox:a2];
  return v2;
}

+ (id)predicateForMessagesInMailbox:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 makePredicate];
  }
  else
  {
    v9 = [v4 objectID];
    v8 = [a1 predicateForMessagesInMailboxWithObjectID:v9];
  }
  return v8;
}

+ (id)predicateForMessagesInMailboxWithObjectID:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"EMMessageListItemPredicates.m", 120, @"Invalid parameter not satisfying: %@", @"[mailboxObjectID isKindOfClass:[EMMailboxObjectID class]]" object file lineNumber description];
  }
  id v6 = [v5 url];
  v7 = [a1 _predicateForMessagesInMailboxWithURL:v6];

  return v7;
}

+ (id)_predicateForMessagesInMailboxWithURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"mailboxObjectIDs.url.absoluteString"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  v7 = [v3 absoluteString];
  v8 = [v6 expressionForConstantValue:v7];
  v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:2 type:4 options:0];

  return v9;
}

+ (id)_predicateStrippingSpotlightOnlyTerms:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  v7 = v6;
  if (isKindOfClass)
  {
    v8 = [v6 subpredicates];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__EMMessageListItemPredicates__predicateStrippingSpotlightOnlyTerms___block_invoke;
    v23[3] = &__block_descriptor_40_e34___NSPredicate_16__0__NSPredicate_8l;
    v23[4] = a1;
    v9 = objc_msgSend(v8, "ef_compactMap:", v23);

    if ([v9 count]) {
      id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v7, "compoundPredicateType"), v9);
    }
    else {
      id v10 = 0;
    }

    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    v11 = [v7 leftExpression];
    if ([v11 expressionType] == 3)
    {
      v12 = [v7 leftExpression];
      v13 = [v12 keyPath];
      if ([v13 isEqualToString:@"body"])
      {
LABEL_9:

LABEL_10:
        id v10 = 0;
        goto LABEL_18;
      }
      v14 = [v7 leftExpression];
      v15 = [v14 keyPath];
      if ([v15 isEqualToString:@"Spotlight"])
      {

        goto LABEL_9;
      }
      v18 = [v7 leftExpression];
      v19 = [v18 keyPath];
      char v20 = [v19 isEqualToString:@"SpotlightQuery"];

      if (v20) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  else
  {
    v16 = +[EMMessageListItemPredicates log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v21 = (id)objc_opt_class();
      v22 = objc_msgSend(v7, "ef_publicDescription");
      *(_DWORD *)buf = 138412802;
      id v25 = v21;
      __int16 v26 = 2048;
      id v27 = a1;
      __int16 v28 = 2114;
      v29 = v22;
      _os_log_error_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Spotlight predicate does not respond to leftExpression: %{public}@", buf, 0x20u);
    }
  }
  id v10 = v7;
LABEL_18:

  return v10;
}

+ (id)_predicateForKeyPath:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28B98];
  v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:a3];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
  v9 = [v6 predicateWithLeftExpression:v7 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)predicateForNotifyMessages
{
  return (id)[a1 _predicateForKeyPath:@"conversationNotificationLevel" value:&unk_1F1A61E90];
}

+ (id)predicateForMuteMessages
{
  return (id)[a1 _predicateForKeyPath:@"conversationNotificationLevel" value:&unk_1F1A61EA8];
}

+ (id)predicateStrippingSpotlightOnlyTerms:(id)a3
{
  id v3 = [a1 _predicateStrippingSpotlightOnlyTerms:a3];
  if (!v3)
  {
    id v4 = +[EMMessageListItemPredicates log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "Spotlight predicate generated a nil predicate. Using TRUEPREDICATE instead. This may result in unfiltered results.", v6, 2u);
    }

    id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  return v3;
}

id __69__EMMessageListItemPredicates__predicateStrippingSpotlightOnlyTerms___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _predicateStrippingSpotlightOnlyTerms:a2];
  return v2;
}

+ (id)predicateFromPredicate:(id)a3 ignoringKeyPaths:(id)a4
{
  id v4 = predicateFromPredicateIgnoringKeyPaths(a3, a4);
  return v4;
}

+ (id)predicateForUnreadMessages
{
  return (id)[a1 _predicateForKeyPath:@"flags.read" value:MEMORY[0x1E4F1CC28]];
}

+ (id)sortDescriptorForKeyPath:(id)a3 ascending:(BOOL)a4
{
  id v4 = [MEMORY[0x1E4F60F30] sortDescriptorWithKey:a3 ascending:a4];
  return v4;
}

+ (id)predicateForMessagesWithMailboxScope:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"EMMessageListItemPredicates.m", 161, @"Invalid parameter not satisfying: %@", @"mailboxScope" object file lineNumber description];
  }
  id v6 = +[EMMailboxScope allMailboxesScope];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = 1;
LABEL_7:
    id v11 = [MEMORY[0x1E4F28F60] predicateWithValue:v8];
    goto LABEL_26;
  }
  v9 = +[EMMailboxScope noMailboxesScope];
  int v10 = [v5 isEqual:v9];

  if (v10)
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  v12 = [v5 mailboxObjectIDs];
  uint64_t v13 = [v12 allObjects];

  v14 = [v5 mailboxTypes];
  uint64_t v15 = [v14 allObjects];

  if (!(v13 | v15))
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:a1 file:@"EMMessageListItemPredicates.m" lineNumber:170 description:@"Mailbox scope must have either mailbox object IDs or mailbox types"];

    v17 = 0;
    v18 = 0;
    goto LABEL_20;
  }
  if (!v13)
  {
    v17 = 0;
    v18 = 0;
    if (v15) {
      goto LABEL_16;
    }
LABEL_20:
    int v19 = [v5 excludeMailboxes];
    char v20 = (void *)MEMORY[0x1E4F28BA0];
    if (v19)
    {
      v28[0] = v17;
      v28[1] = v18;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      uint64_t v22 = [v20 andPredicateWithSubpredicates:v21];
    }
    else
    {
      v27[0] = v17;
      v27[1] = v18;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      uint64_t v22 = [v20 orPredicateWithSubpredicates:v21];
    }
    v23 = (void *)v22;

    id v11 = v23;
    goto LABEL_25;
  }
  if ([v5 excludeMailboxes]) {
    +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxesWithObjectIDs:v13];
  }
  else {
  v16 = +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:v13];
  }
  v17 = v16;
  if (v15)
  {
LABEL_16:
    if ([v5 excludeTypes]) {
      +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxesWithTypes:v15];
    }
    else {
    v18 = +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithTypes:v15];
    }
    id v11 = v18;
    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  id v11 = v16;
  v17 = v11;
LABEL_25:

LABEL_26:
  return v11;
}

+ (id)predicateForExcludingMessagesInMailboxesWithTypes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"mailboxes.type"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  char v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:1 type:10 options:0];

  uint64_t v8 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v7];

  return v8;
}

+ (id)predicateForMessagesInMailboxesWithTypes:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "ef_map:", v6);
  id v4 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];

  return v4;
}

+ (id)predicateForMessagesInMailboxes:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__EMMessageListItemPredicates_predicateForMessagesInMailboxes___block_invoke;
  v6[3] = &__block_descriptor_40_e19__16__0__EMMailbox_8l;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "ef_map:", v6);
  id v4 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];

  return v4;
}

+ (id)predicateForMessagesInMailboxesWithObjectIDs:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithObjectIDs___block_invoke;
  v6[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "ef_map:", v6);
  id v4 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];

  return v4;
}

id __72__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _predicateForMessagesInMailboxWithType:a2];
  return v2;
}

+ (id)_predicateForMessagesInMailboxWithType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"mailboxes.type"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  char v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:2 type:4 options:0];

  return v7;
}

+ (id)predicateForIsVIP:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  id v5 = [a1 _predicateForKeyPath:@"isVIP" value:v4];

  return v5;
}

+ (id)transformPredicateWithMailboxes:(id)a3 mailboxTypeResolver:(id)a4 shouldIncludeFollowUps:(BOOL)a5 shouldIncludeReadLater:(BOOL)a6 limitToSender:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9)
  {
    uint64_t v15 = +[EMMessageListItemPredicates predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:v11 mailboxTypeResolver:v12];
    objc_msgSend(v14, "ef_addOptionalObject:", v15);
  }
  if (v8)
  {
    v16 = +[EMMessageListItemPredicates predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:v11];
    objc_msgSend(v14, "ef_addOptionalObject:", v16);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __143__EMMessageListItemPredicates_transformPredicateWithMailboxes_mailboxTypeResolver_shouldIncludeFollowUps_shouldIncludeReadLater_limitToSender___block_invoke;
  v21[3] = &unk_1E63E4E10;
  id v22 = v14;
  id v23 = v13;
  id v17 = v13;
  id v18 = v14;
  int v19 = (void *)MEMORY[0x1C18A2160](v21);

  return v19;
}

+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3
{
  id v3 = [a1 predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:a3 additionalAccountObjectIDs:0];
  return v3;
}

+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3 additionalAccountObjectIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "ef_any:", &__block_literal_global_122))
  {
    BOOL v8 = [a1 predicateForFiredReadLaterMessages];
  }
  else
  {
    BOOL v9 = objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_125);
    if ([v7 count])
    {
      uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v7];

      BOOL v9 = (void *)v10;
    }
    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_3;
      v18[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
      v18[4] = a1;
      id v13 = objc_msgSend(v12, "ef_compactMap:", v18);
      id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_orCompoundPredicateWithSubpredicates:", v13);
      uint64_t v15 = (void *)MEMORY[0x1E4F28F60];
      v16 = [a1 predicateForFiredReadLaterMessages];
      BOOL v8 = objc_msgSend(v15, "ef_andCompoundPredicateForOptionalPredicate:second:", v14, v16);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (id)_predicateForReadLaterMessagesFired:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"readLater.isActive"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = [NSNumber numberWithBool:v3];
  BOOL v8 = [v6 expressionForConstantValue:v7];
  BOOL v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)predicateForFiredReadLaterMessages
{
  return (id)[a1 _predicateForReadLaterMessagesFired:1];
}

id __76__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) predicateForMessagesInMailboxWithObjectID:a2];
  return v2;
}

uint64_t __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSmartMailbox];
}

uint64_t __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSmartMailbox];
}

+ (id)predicateForUnfiredReadLaterMessages
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [a1 predicateForReadLaterMessages];
  v10[0] = v4;
  id v5 = [a1 _predicateForReadLaterMessagesFired:0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];
  BOOL v8 = objc_msgSend(v7, "ef_simplifiedPredicate");

  return v8;
}

+ (id)predicateForReadLaterMessages
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  BOOL v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"readLater.date"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:5 options:0];

  return v5;
}

+ (id)predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:(id)a3 mailboxTypeResolver:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "ef_any:", &__block_literal_global_115_0))
  {
    BOOL v9 = [a1 predicateForMessagesWithActiveFollowUpInSent];
  }
  else
  {
    uint64_t v10 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_118);
    if ([v10 count])
    {
      id v11 = [v8 mailboxObjectIDsForMailboxType:4];
      id v12 = [v11 allObjects];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_119;
      v22[3] = &unk_1E63E4E58;
      id v23 = v10;
      id v13 = [v12 ef_filter:v22];
      if ([v13 count])
      {
        id v14 = +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:v13];
        uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
        v24[0] = v14;
        v16 = [a1 predicateForMessagesWithActiveFollowUp];
        v24[1] = v16;
        id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
        id v18 = [v15 andPredicateWithSubpredicates:v17];
        BOOL v9 = objc_msgSend(v18, "ef_simplifiedPredicate");
      }
      else
      {
        id v14 = +[EMMessageListItemPredicates log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          char v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          __int16 v26 = v20;
          _os_log_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - empty mailboxesToSearch", buf, 0xCu);
        }
        BOOL v9 = 0;
      }
    }
    else
    {
      id v12 = +[EMMessageListItemPredicates log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        __int16 v26 = v19;
        _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - empty accountIdentifiers", buf, 0xCu);
      }
      BOOL v9 = 0;
    }
  }
  return v9;
}

+ (id)predicateForPrimaryMessages
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:0];
  BOOL v3 = +[EMMessageListItemPredicates _predicateForModelHighImpactMessages];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v8[1] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v4 orPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateForMessagesWithCategoryType:(unint64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.type"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v6 expressionForConstantValue:v7];
  BOOL v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)_predicateForModelHighImpactMessages
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  BOOL v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.isHighImpact"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F1A61EC0];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)mailboxScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4
{
  id v4 = mailboxScopeForPredicate(a3, a4);
  return v4;
}

+ (id)threadScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "ef_simplifiedPredicate");

  id v8 = v7;
  if (objc_msgSend(v8, "ef_matchesEverything") & 1) != 0 || (objc_msgSend(v8, "ef_matchesNothing"))
  {
LABEL_30:
    id v12 = 0;
    id v22 = v8;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = mailboxScopeForThreadWithPredicate(v8, v6);
    id v12 = v21;
    if (v21
      && __79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke((uint64_t)v21, v21))
    {

      id v22 = 0;
      goto LABEL_31;
    }

    goto LABEL_30;
  }
  id v9 = v8;
  if ([v9 compoundPredicateType] != 1)
  {
    id v12 = 0;
    id v22 = v9;
    goto LABEL_44;
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v9 subpredicates];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v11)
  {
LABEL_41:
    id v12 = 0;
    id v22 = v9;
    goto LABEL_42;
  }
  id v12 = 0;
  uint64_t v13 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      v16 = mailboxScopeForThreadWithPredicate(v15, v6);
      id v17 = v16;
      if (v16) {
        BOOL v18 = v12 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
      if (v16)
      {
        if (!__79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke((uint64_t)v16, v16))goto LABEL_39; {
        id v19 = v17;
        }

        id v12 = v19;
      }
      else
      {
        if (hasMailboxPredicates(v15, v6))
        {
          id v17 = v12;
          goto LABEL_40;
        }
        [v27 addObject:v15];
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  if (v12)
  {
    uint64_t v20 = [v27 count];
    if (v20)
    {
      if (v20 == 1) {
        [v27 firstObject];
      }
      else {
      id v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v27];
      }
    }
    else
    {
      id v22 = 0;
    }
    uint64_t v10 = v9;
LABEL_42:
  }
  else
  {
    id v22 = v9;
  }

LABEL_44:
LABEL_31:
  id v23 = [EMThreadScope alloc];
  v24 = v12;
  if (!v12)
  {
    v24 = +[EMMailboxScope allMailboxesScope];
  }
  id v25 = [(EMThreadScope *)v23 initWithMailboxScope:v24 filterPredicate:v22];
  if (!v12) {

  }
  return v25;
}

id __143__EMMessageListItemPredicates_transformPredicateWithMailboxes_mailboxTypeResolver_shouldIncludeFollowUps_shouldIncludeReadLater_limitToSender___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) insertObject:v3 atIndex:0];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_orCompoundPredicateWithSubpredicates:", *(void *)(a1 + 32));

  if (*(void *)(a1 + 40))
  {
    id v5 = (void *)MEMORY[0x1E4F28BA0];
    v10[0] = v4;
    id v6 = +[EMMessageListItemPredicates predicateForMessagesWithSender:](EMMessageListItemPredicates, "predicateForMessagesWithSender:");
    v10[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v8 = [v5 andPredicateWithSubpredicates:v7];

    id v4 = (void *)v8;
  }
  return v4;
}

+ (id)predicateForMessagesWithActiveFollowUp
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"followUp.isActive"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)predicateForMessagesNewerThanDisplayDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"displayDate"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:2 options:0];

  return v7;
}

+ (id)predicateForMessagesNewerThanDate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"date"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:2 options:0];

  return v7;
}

+ (id)predicateForUnflaggedMessages
{
  return (id)[a1 _predicateForKeyPath:@"flags.flagged" value:MEMORY[0x1E4F1CC28]];
}

id __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 accountIdentifier];
  return v2;
}

uint64_t __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_119(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accountIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 accountIdentifier];
  id v3 = [v2 representedObjectID];

  return v3;
}

id __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) predicateForAccountWithObjectID:a2];
  return v2;
}

+ (id)predicateForAccountWithObjectID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"mailboxes.accountIdentifier.representedObjectID"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = [v3 representedObjectID];
  uint64_t v8 = [v6 expressionForConstantValue:v7];
  id v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:2 type:4 options:0];

  return v9;
}

+ (int64_t)dateSortOrderFromSortDescriptors:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    v10[0] = @"date";
    v10[1] = @"displayDate";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    id v6 = [v4 key];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      if ([v4 ascending]) {
        int64_t v8 = -1;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)predicateForSendLaterMessages
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"sendLaterDate"];
  uint64_t v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:5 options:0];

  return v5;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EMMessageListItemPredicates_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1) {
    dispatch_once(&log_onceToken_26, block);
  }
  v2 = (void *)log_log_26;
  return (OS_os_log *)v2;
}

void __34__EMMessageListItemPredicates_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_26;
  log_log_26 = (uint64_t)v1;
}

+ (id)predicateForMessagesInConversation:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"conversationID"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  int v7 = [NSNumber numberWithLongLong:a3];
  int64_t v8 = [v6 expressionForConstantValue:v7];
  id v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)predicateForMessagesInMailboxWithType:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [a1 _predicateForMessagesInMailboxWithType:v4];

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxWithType:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [a1 _predicateForMessagesInMailboxWithType:v5];
  int v7 = [v4 notPredicateWithSubpredicate:v6];

  return v7;
}

+ (id)predicateForExcludingMessagesInMailbox:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [a1 predicateForMessagesInMailbox:a3];
  id v5 = [v3 notPredicateWithSubpredicate:v4];

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxObjectID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [a1 predicateForMessagesInMailboxWithObjectID:a3];
  id v5 = [v3 notPredicateWithSubpredicate:v4];

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxes:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxes___block_invoke;
  v6[3] = &__block_descriptor_40_e19__16__0__EMMailbox_8l;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "ef_map:", v6);
  uint64_t v4 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return v4;
}

id __72__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) predicateForExcludingMessagesInMailbox:a2];
  return v2;
}

+ (id)predicateForExcludingMessagesInMailboxesWithObjectIDs:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxesWithObjectIDs___block_invoke;
  v6[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "ef_map:", v6);
  uint64_t v4 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return v4;
}

id __85__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxesWithObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) predicateForExcludingMessagesInMailboxObjectID:a2];
  return v2;
}

+ (id)predicateForMessagesWithThreadScope:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"EMMessageListItemPredicates.m", 210, @"Invalid parameter not satisfying: %@", @"threadScope" object file lineNumber description];
  }
  id v6 = [v5 mailboxScope];
  int v7 = [v5 filterPredicate];
  int64_t v8 = +[EMMailboxScope allMailboxesScope];

  if (v6 == v8)
  {
    if (v7)
    {
      id v15 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  id v9 = +[EMMailboxScope noMailboxesScope];

  if (v6 == v9)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    uint64_t v11 = v15;
    goto LABEL_12;
  }
  uint64_t v10 = [a1 predicateForMessagesWithMailboxScope:v6];
  uint64_t v11 = (void *)v10;
  if (v7)
  {
    id v12 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v10;
    v18[1] = v7;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v14 = [v12 andPredicateWithSubpredicates:v13];

    uint64_t v11 = (void *)v14;
  }
LABEL_12:

  return v11;
}

+ (id)predicateForMessagesWithSender:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"senderList.emailAddressValue.simpleAddress"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  int v7 = [v3 emailAddressValue];
  int64_t v8 = [v7 simpleAddress];
  id v9 = [v6 expressionForConstantValue:v8];
  uint64_t v10 = [v4 predicateWithLeftExpression:v5 rightExpression:v9 modifier:2 type:4 options:1];

  return v10;
}

+ (id)predicateForMessagesForBusinessID:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"businessID"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  int v7 = [NSNumber numberWithLongLong:a3];
  int64_t v8 = [v6 expressionForConstantValue:v7];
  id v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:1];

  return v9;
}

+ (id)predicateForMessagesForBusinessID:(int64_t)a3 forAccount:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[EMMessageListItemPredicates predicateForAccount:v5];
  int v7 = +[EMMessageListItemPredicates predicateForMessagesForBusinessID:a3];
  int64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v6;
  v12[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateForMessagesWithSender:(id)a3 forAccount:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[EMMessageListItemPredicates predicateForAccount:v6];
  v15[0] = v5;
  int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v9 = +[EMMessageListItemPredicates predicateForMessagesWithSenders:v8];

  uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v7;
  v14[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v12 = [v10 andPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)predicateForMessagesWithSenders:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_33);
  uint64_t v4 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];

  return v4;
}

id __63__EMMessageListItemPredicates_predicateForMessagesWithSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[EMMessageListItemPredicates predicateForMessagesWithSender:a2];
  return v2;
}

+ (id)predicateForMessagesWithoutSender:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"senderList.emailAddressValue.simpleAddress"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  int v7 = [v3 emailAddressValue];
  int64_t v8 = [v7 simpleAddress];
  id v9 = [v6 expressionForConstantValue:v8];
  uint64_t v10 = [v4 predicateWithLeftExpression:v5 rightExpression:v9 modifier:2 type:5 options:1];

  return v10;
}

+ (id)predicateForMessagesWithoutSenders:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_93);
  uint64_t v4 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];

  return v4;
}

id __66__EMMessageListItemPredicates_predicateForMessagesWithoutSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[EMMessageListItemPredicates predicateForMessagesWithoutSender:a2];
  return v2;
}

+ (id)predicateForMessagesTo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"toList.emailAddressValue.simpleAddress"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = v3;
  int64_t v8 = [v7 emailAddressValue];
  id v9 = [v8 simpleAddress];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 stringValue];
  }
  id v12 = v11;

  uint64_t v13 = [v6 expressionForConstantValue:v12];
  uint64_t v14 = [v4 predicateWithLeftExpression:v5 rightExpression:v13 modifier:2 type:4 options:1];

  return v14;
}

+ (id)predicateForMessagesWithToAddresses:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_96);
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"toList.emailAddressValue.simpleAddress"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:2 type:10 options:1];

  return v7;
}

id __67__EMMessageListItemPredicates_predicateForMessagesWithToAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  uint64_t v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

+ (id)predicateForMessagesCced:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"ccList.emailAddressValue.simpleAddress"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = v3;
  int64_t v8 = [v7 emailAddressValue];
  id v9 = [v8 simpleAddress];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 stringValue];
  }
  id v12 = v11;

  uint64_t v13 = [v6 expressionForConstantValue:v12];
  uint64_t v14 = [v4 predicateWithLeftExpression:v5 rightExpression:v13 modifier:2 type:4 options:1];

  return v14;
}

+ (id)predicateForMessagesWithCcAddresses:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_98);
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"ccList.emailAddressValue.simpleAddress"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:2 type:10 options:1];

  return v7;
}

id __67__EMMessageListItemPredicates_predicateForMessagesWithCcAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  uint64_t v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

+ (id)predicateForMessagesWithRecipient:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 predicateForMessagesTo:v4];
  id v6 = [a1 predicateForMessagesCced:v4];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v6;
  int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v7 orPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForMessagesWithRecipients:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "ef_map:", &__block_literal_global_100);
  id v5 = (void *)MEMORY[0x1E4F28B98];
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"toList.emailAddressValue.simpleAddress"];
  id v7 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v4];
  int64_t v8 = [v5 predicateWithLeftExpression:v6 rightExpression:v7 modifier:2 type:10 options:1];

  id v9 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"ccList.emailAddressValue.simpleAddress"];
  id v11 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v4];
  id v12 = [v9 predicateWithLeftExpression:v10 rightExpression:v11 modifier:2 type:10 options:1];

  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v8;
  v17[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v15 = [v13 orPredicateWithSubpredicates:v14];

  return v15;
}

id __66__EMMessageListItemPredicates_predicateForMessagesWithRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  id v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 stringValue];
  }
  id v7 = v6;

  return v7;
}

+ (id)predicateForFlaggedMessages
{
  return (id)[a1 _predicateForKeyPath:@"flags.flagged" value:MEMORY[0x1E4F1CC38]];
}

+ (id)predicateForFlagColor:(unint64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [a1 _predicateForKeyPath:@"flags.flagColor" value:v4];

  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [a1 predicateForFlaggedMessages];
  v11[0] = v7;
  v11[1] = v5;
  int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v6 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForReadMessages
{
  return (id)[a1 _predicateForKeyPath:@"flags.read" value:MEMORY[0x1E4F1CC38]];
}

+ (id)predicateForMessagesWithAttachments
{
  return (id)[a1 _predicateForKeyPath:@"hasAttachments" value:MEMORY[0x1E4F1CC38]];
}

+ (id)predicateForTodayMessages
{
  id v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"displayDate"];
  id v4 = (void *)MEMORY[0x1E4F28C68];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 startOfDayForDate:v6];
  int64_t v8 = [v4 expressionForConstantValue:v7];
  id v9 = [v2 predicateWithLeftExpression:v3 rightExpression:v8 modifier:0 type:2 options:0];

  return v9;
}

+ (id)predicateForNonPrimaryMessages
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:2];
  id v4 = +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:](EMMessageListItemPredicates, "predicateForMessagesWithCategoryType:", 1, v3);
  v9[1] = v4;
  id v5 = +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:3];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = [v2 orPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForUrgentMessages
{
  id v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"generatedSummary.urgent"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)predicateForReadLaterSmartMailbox
{
  if (_os_feature_enabled_impl()) {
    +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessages];
  }
  else {
  id v2 = +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessagesInInbox];
  }
  return v2;
}

+ (id)predicateForUnfiredReadLaterMessagesInInbox
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [a1 predicateForUnfiredReadLaterMessages];
  v10[0] = v4;
  id v5 = [a1 predicateForMessagesInMailboxWithType:7];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v7 = [v3 andPredicateWithSubpredicates:v6];
  int64_t v8 = objc_msgSend(v7, "ef_simplifiedPredicate");

  return v8;
}

+ (id)_predicateForFollowUpMessages
{
  id v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"followUp.startDate"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:5 options:0];

  return v5;
}

+ (id)predicateForMessagesWithActiveFollowUpInSent
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 predicateForMessagesInMailboxWithType:4];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = [a1 predicateForMessagesWithActiveFollowUp];
  v9[0] = v5;
  v9[1] = v3;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v4 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForMessagesWithUnfiredFollowUp
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28B98];
  id v4 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"displayDate"];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"followUp.startDate"];
  id v6 = [v3 predicateWithLeftExpression:v4 rightExpression:v5 modifier:0 type:0 options:0];

  id v7 = (void *)MEMORY[0x1E4F28BA0];
  int64_t v8 = [a1 _predicateForFollowUpMessages];
  id v9 = objc_msgSend(a1, "predicateForMessagesInMailboxWithType:", 4, v8, v6);
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v11 = [v7 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)_predicateForActiveFollowUpMessagesIncludeExpired:(BOOL)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28B98];
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"displayDate"];
  id v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"followUp.startDate"];
  int64_t v8 = [v5 predicateWithLeftExpression:v6 rightExpression:v7 modifier:0 type:2 options:0];

  uint64_t v9 = [a1 predicateForMessagesInMailboxWithType:4];
  uint64_t v10 = (void *)v9;
  if (a3)
  {
    id v11 = (void *)MEMORY[0x1E4F28BA0];
    v20[0] = v8;
    v20[1] = v9;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28B98];
    id v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"displayDate"];
    v16 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"followUp.endDate"];
    id v12 = [v14 predicateWithLeftExpression:v15 rightExpression:v16 modifier:0 type:0 options:0];

    id v17 = (void *)MEMORY[0x1E4F28BA0];
    v21[0] = v8;
    v21[1] = v12;
    v21[2] = v10;
    BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    uint64_t v13 = [v17 andPredicateWithSubpredicates:v18];
  }
  return v13;
}

+ (id)predicateForUnsubscribableMessages
{
  id v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"unsubscribeType"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F1A61ED8];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:5 options:0];

  return v5;
}

+ (id)predicateForIncludesMeMessages
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [a1 predicateForToMeMessages];
  v9[0] = v4;
  id v5 = [a1 predicateForCCMeMessages];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v3 orPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForToMeMessages
{
  return (id)[a1 _predicateForKeyPath:@"isToMe" value:MEMORY[0x1E4F1CC38]];
}

+ (id)predicateForCCMeMessages
{
  return (id)[a1 _predicateForKeyPath:@"isCCMe" value:MEMORY[0x1E4F1CC38]];
}

+ (id)predicateForRecentMessages
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_lastWeekMidnight");
  id v4 = [a1 predicateForMessagesNewerThanDisplayDate:v3];

  return v4;
}

+ (id)predicateForExcludingMessagesInMailboxWithURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [a1 _predicateForMessagesInMailboxWithURL:a3];
  id v5 = [v3 notPredicateWithSubpredicate:v4];

  return v5;
}

+ (id)predicateForAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"mailboxes.accountIdentifier.representedObjectID"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  id v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:2 type:4 options:0];

  return v7;
}

+ (id)predicateForAccount:(id)a3
{
  id v4 = [a3 objectID];
  id v5 = [a1 predicateForAccountWithObjectID:v4];

  return v5;
}

+ (id)predicateForSendLaterMessagesWithStartDate:(id)a3 endDate:(id)a4
{
  id v4 = [a1 _dateRangePredicateForListItemKeyPath:@"sendLaterDate" startDate:a3 endDate:a4];
  return v4;
}

+ (id)predicateForReadLaterMessagesWithStartDate:(id)a3 endDate:(id)a4
{
  id v4 = [a1 _dateRangePredicateForListItemKeyPath:@"readLater.date" startDate:a3 endDate:a4];
  return v4;
}

+ (id)_dateRangePredicateForListItemKeyPath:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:-1.0];

  id v11 = (void *)MEMORY[0x1E4F28B98];
  id v12 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v7];
  uint64_t v13 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v10];
  uint64_t v14 = [v11 predicateWithLeftExpression:v12 rightExpression:v13 modifier:0 type:2 options:0];

  if (v9)
  {
    id v15 = (void *)MEMORY[0x1E4F28B98];
    v16 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v7];
    id v17 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v9];
    BOOL v18 = [v15 predicateWithLeftExpression:v16 rightExpression:v17 modifier:0 type:0 options:0];

    id v19 = (void *)MEMORY[0x1E4F28BA0];
    v23[0] = v14;
    v23[1] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v21 = [v19 andPredicateWithSubpredicates:v20];
  }
  else
  {
    id v21 = v14;
  }

  return v21;
}

+ (id)predicateFromPredicate:(id)a3 ignoringPredicates:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  id v8 = predicateFromPredicateIgnoringPredicates(v5, v7);

  return v8;
}

+ (id)sortDescriptorForDateAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F60F30] sortDescriptorWithKey:@"date" ascending:a3];
}

+ (BOOL)isPredicateForMessagesInMailboxObjectID:(id)a3 mailboxObjectID:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  id v6 = [v5 leftExpression];
  if ([v6 expressionType] != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  id v7 = [v5 leftExpression];
  id v8 = [v7 keyPath];
  if (![v8 isEqualToString:@"mailboxObjectIDs.url.absoluteString"]
    || [v5 comparisonPredicateModifier] != 2)
  {

    goto LABEL_10;
  }
  uint64_t v9 = [v5 predicateOperatorType];

  if (v9 == 4)
  {
    uint64_t v10 = [v5 rightExpression];
    id v11 = [v10 constantValue];

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];
    uint64_t v13 = [[EMMailboxObjectID alloc] initWithURL:v12];
    uint64_t v14 = v13;
    if (a4) {
      *a4 = v13;
    }

    BOOL v15 = 1;
    goto LABEL_13;
  }
LABEL_11:
  BOOL v15 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_13:

  return v15;
}

+ (BOOL)_isPredicateForMessagesInMailboxObjectIDs:(id)a3 mailboxObjectIDs:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 compoundPredicateType] == 2)
  {
    [v6 subpredicates];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v21 = 0;
          int v13 = [a1 isPredicateForMessagesInMailboxObjectID:v12 mailboxObjectID:&v21];
          id v14 = v21;
          BOOL v15 = v14;
          if (!v13)
          {
            if (a4) {
              *a4 = 0;
            }

            LOBYTE(v16) = 0;
            goto LABEL_25;
          }
          if (!v8) {
            id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
          }
          [v8 addObject:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
    LOBYTE(v16) = 1;
LABEL_25:
  }
  else
  {
    id v20 = 0;
    int v16 = [a1 isPredicateForMessagesInMailboxObjectID:v6 mailboxObjectID:&v20];
    id v8 = v20;
    if (v16)
    {
      id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
      BOOL v18 = v17;
      if (a4) {
        *a4 = v17;
      }
    }
    else if (a4)
    {
      *a4 = 0;
    }
  }

  return v16;
}

+ (BOOL)isPredicateForMessagesInMailboxWithType:(id)a3 mailboxType:(int64_t *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  id v6 = [v5 leftExpression];
  if ([v6 expressionType] != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  id v7 = [v5 leftExpression];
  id v8 = [v7 keyPath];
  if (![v8 isEqualToString:@"mailboxes.type"]
    || [v5 comparisonPredicateModifier] != 2)
  {

    goto LABEL_10;
  }
  uint64_t v9 = [v5 predicateOperatorType];

  if (v9 == 4)
  {
    uint64_t v10 = [v5 rightExpression];
    id v11 = [v10 constantValue];

    if (a4) {
      *a4 = [v11 integerValue];
    }

    BOOL v12 = 1;
    goto LABEL_13;
  }
LABEL_11:
  BOOL v12 = 0;
  if (a4) {
    *a4 = -500;
  }
LABEL_13:

  return v12;
}

+ (BOOL)isPredicateForMessagesWithActiveFollowUp:(id)a3 mailboxTypeResolver:(id)a4 inSent:(BOOL *)a5 sentMailboxObjectIDs:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([a1 _isPredicateForMessagesWithActiveFollowUp:v10])
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6) {
      *a6 = 0;
    }
    BOOL v12 = 1;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 compoundPredicateType] == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v22 = v11;
    int v13 = [v10 subpredicates];
    id obj = v13;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v15 = 0;
      char v23 = 0;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v28 = -500;
          if ([a1 _isPredicateForMessagesWithActiveFollowUp:v18])
          {
            char v23 = 1;
          }
          else if ([a1 isPredicateForMessagesInMailboxWithType:v18 mailboxType:&v28])
          {
            if (v28 != 4) {
              goto LABEL_35;
            }
          }
          else
          {
            if (v15
              || (id v27 = 0,
                  int v19 = [a1 _isPredicateForMessagesInMailboxObjectIDs:v18 mailboxObjectIDs:&v27],
                  id v15 = v27,
                  !v19))
            {
LABEL_35:
              if (a5) {
                *a5 = 0;
              }
              id v20 = obj;
              if (a6) {
                *a6 = 0;
              }
LABEL_49:

              goto LABEL_50;
            }
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __120__EMMessageListItemPredicates_isPredicateForMessagesWithActiveFollowUp_mailboxTypeResolver_inSent_sentMailboxObjectIDs___block_invoke;
            v25[3] = &unk_1E63E4F18;
            id v26 = v22;
            if (objc_msgSend(v15, "ef_any:", v25))
            {
              if (a5) {
                *a5 = 0;
              }
              if (a6) {
                *a6 = 0;
              }

              id v20 = obj;
              goto LABEL_49;
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }

      if (v23)
      {
        if (a5) {
          *a5 = 1;
        }
        if (a6)
        {
          id v15 = v15;
          *a6 = v15;
        }
        BOOL v12 = 1;
LABEL_51:

        id v11 = v22;
        goto LABEL_52;
      }
    }
    else
    {

      id v15 = 0;
    }
    if (a5) {
      *a5 = 0;
    }
    if (a6)
    {
      BOOL v12 = 0;
      *a6 = 0;
    }
    else
    {
LABEL_50:
      BOOL v12 = 0;
    }
    goto LABEL_51;
  }
  if (a5) {
    *a5 = 0;
  }
  BOOL v12 = 0;
  if (a6) {
    *a6 = 0;
  }
LABEL_52:

  return v12;
}

BOOL __120__EMMessageListItemPredicates_isPredicateForMessagesWithActiveFollowUp_mailboxTypeResolver_inSent_sentMailboxObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [*(id *)(a1 + 32) mailboxTypeForMailboxObjectID:v3] != 4;

  return v4;
}

+ (BOOL)_isPredicateForMessagesWithActiveFollowUp:(id)a3
{
  id v4 = a3;
  id v5 = [a1 predicateForMessagesWithActiveFollowUp];
  char v6 = [v4 isEqual:v5];

  return v6;
}

+ (BOOL)isPredicateForMessagesWithFiredReadLaterDate:(id)a3 accountObjectIDs:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v5 = +[EMMessageListItemPredicates predicateForFiredReadLaterMessages];
  int v6 = [v21 isEqual:v5];

  if (v6)
  {
    if (a4) {
      *a4 = 0;
    }
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v21 subpredicates];
    }
    else
    {
      id v8 = 0;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      char v11 = 0;
      id v12 = 0;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = [a1 predicateForFiredReadLaterMessages];
          char v17 = [v15 isEqual:v16];

          if (v17)
          {
            char v11 = 1;
          }
          else if (v12 {
                 || (id v22 = 0,
          }
                     char v18 = [a1 _isPredicateForMessagesInAccountObjectIDs:v15 accountObjectIDs:&v22],
                     id v12 = v22,
                     (v18 & 1) == 0))
          {
            if (a4) {
              *a4 = 0;
            }

            goto LABEL_26;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      if (v11)
      {
        if (a4)
        {
          id v12 = v12;
          *a4 = v12;
        }
        BOOL v7 = 1;
        goto LABEL_30;
      }
    }
    else
    {

      id v12 = 0;
    }
    if (a4)
    {
      BOOL v7 = 0;
      *a4 = 0;
    }
    else
    {
LABEL_26:
      BOOL v7 = 0;
    }
LABEL_30:
  }
  return v7;
}

+ (BOOL)isPredicateForMessagesInAccountObjectID:(id)a3 accountObjectID:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int v6 = [v5 leftExpression];
  if ([v6 expressionType] != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  BOOL v7 = [v5 leftExpression];
  id v8 = [v7 keyPath];
  if (![v8 isEqualToString:@"mailboxes.accountIdentifier.representedObjectID"]
    || [v5 comparisonPredicateModifier] != 2)
  {

    goto LABEL_10;
  }
  uint64_t v9 = [v5 predicateOperatorType];

  if (v9 == 4)
  {
    uint64_t v10 = [v5 rightExpression];
    char v11 = [v10 constantValue];

    id v12 = [[EMObjectID alloc] initWithRepresentedObjectID:v11];
    uint64_t v13 = v12;
    if (a4) {
      *a4 = v12;
    }

    BOOL v14 = 1;
    goto LABEL_13;
  }
LABEL_11:
  BOOL v14 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_13:

  return v14;
}

+ (BOOL)_isPredicateForMessagesInAccountObjectIDs:(id)a3 accountObjectIDs:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 compoundPredicateType] == 2)
  {
    [v6 subpredicates];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v21 = 0;
          int v13 = [a1 isPredicateForMessagesInAccountObjectID:v12 accountObjectID:&v21];
          id v14 = v21;
          id v15 = v14;
          if (!v13)
          {
            if (a4) {
              *a4 = 0;
            }

            LOBYTE(v16) = 0;
            goto LABEL_25;
          }
          if (!v8) {
            id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
          }
          [v8 addObject:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
    LOBYTE(v16) = 1;
LABEL_25:
  }
  else
  {
    id v20 = 0;
    int v16 = [a1 isPredicateForMessagesInAccountObjectID:v6 accountObjectID:&v20];
    id v8 = v20;
    if (v16)
    {
      char v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
      char v18 = v17;
      if (a4) {
        *a4 = v17;
      }
    }
    else if (a4)
    {
      *a4 = 0;
    }
  }

  return v16;
}

uint64_t __79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 mailboxTypes];
  uint64_t v4 = [v3 count];

  id v5 = [v2 mailboxObjectIDs];
  uint64_t v6 = [v5 count];

  if (v4 != 1 || v6)
  {
    if (v4) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v6 == 1;
    }
    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (id)mailboxURLsForPredicate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = v4;
    uint64_t v12 = [v11 leftExpression];
    if ([v12 expressionType] == 3)
    {
      int v13 = [v11 leftExpression];
      id v14 = [v13 keyPath];
      int v15 = [v14 isEqualToString:@"mailboxObjectIDs.url.absoluteString"];

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v12 = [v11 rightExpression];
      int v16 = [v12 constantValue];
      [v5 addObject:v16];
    }
    goto LABEL_14;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend(v4, "subpredicates", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [a1 mailboxURLsForPredicate:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v5 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

LABEL_15:
  return v5;
}

+ (BOOL)predicate:(id)a3 appliesToFlagChange:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _keyPathsForFlagChange:a4];
  uint64_t v8 = [a1 predicateFromPredicate:v6 ignoringKeyPaths:v7];

  LOBYTE(v7) = [v8 isEqual:v6] ^ 1;
  return (char)v7;
}

+ (id)_keyPathsForFlagChange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 readChanged]) {
    [v4 addObject:@"flags.read"];
  }
  if ([v3 flaggedChanged]) {
    [v4 addObject:@"flags.flagged"];
  }

  return v4;
}

+ (BOOL)isValidPredicate:(id)a3 forClass:(Class)a4
{
  id v7 = a3;
  if ([(id)objc_opt_class() isEqual:a4])
  {
    uint64_t v8 = [EMThread alloc];
    uint64_t v9 = objc_alloc_init(EMThreadObjectID);
    uint64_t v10 = [(EMQueryingCollection *)v8 initWithObjectID:v9 query:0];
  }
  else if ([(id)objc_opt_class() isEqual:a4])
  {
    id v11 = [EMMessage alloc];
    uint64_t v9 = objc_alloc_init(EMMessageObjectID);
    uint64_t v10 = [(EMMessage *)v11 initWithObjectID:v9 builder:&__block_literal_global_166];
  }
  else
  {
    if (![(id)objc_opt_class() isEqual:a4])
    {
      int v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, a1, @"EMMessageListItemPredicates.m", 1737, @"Unknown targetClass:%@", a4 object file lineNumber description];

      int v13 = 0;
      BOOL v14 = 0;
      goto LABEL_8;
    }
    uint64_t v12 = [EMGroupedSender alloc];
    uint64_t v9 = objc_alloc_init(EMGroupedSenderObjectID);
    uint64_t v10 = [(EMGroupedSender *)v12 initWithObjectID:v9 builder:&__block_literal_global_171];
  }
  int v13 = (void *)v10;

  [v7 evaluateWithObject:v13];
  BOOL v14 = 1;
LABEL_8:

  return v14;
}

@end