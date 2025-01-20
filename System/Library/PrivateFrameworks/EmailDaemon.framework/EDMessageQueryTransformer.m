@interface EDMessageQueryTransformer
- (BOOL)_predicateIsToOrCC:(id)a3 addressExpression:(id *)a4 operatorType:(unint64_t *)a5;
- (EDAccountsProvider)accountsProvider;
- (EDMailboxPersistence)mailboxPersistence;
- (EDMessagePersistence)messagePersistence;
- (EDMessageQueryTransformer)initWithAccountsProvider:(id)a3 mailboxPersistence:(id)a4 messagePersistence:(id)a5 vipManager:(id)a6;
- (EMVIPManager)vipManager;
- (id)transformComparisonPredicate:(id)a3;
- (id)transformCompoundPredicate:(id)a3;
- (id)transformPredicate:(id)a3;
- (id)transformSubpredicates:(id)a3;
@end

@implementation EDMessageQueryTransformer

id __52__EDMessageQueryTransformer_transformSubpredicates___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) transformPredicate:a2];

  return v2;
}

- (id)transformPredicate:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ef_matchesEverything") & 1) != 0 || (objc_msgSend(v4, "ef_matchesNothing")) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(EDMessageQueryTransformer *)self transformCompoundPredicate:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_3:
      id v5 = v4;
      goto LABEL_4;
    }
    id v5 = [(EDMessageQueryTransformer *)self transformComparisonPredicate:v4];
  }
LABEL_4:
  v6 = v5;

  return v6;
}

- (BOOL)_predicateIsToOrCC:(id)a3 addressExpression:(id *)a4 operatorType:(unint64_t *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  if ([v26 compoundPredicateType] != 2)
  {
    BOOL v21 = 0;
    goto LABEL_32;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v7 = [v26 subpredicates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v8)
  {

    id v10 = 0;
    goto LABEL_30;
  }
  v23 = a4;
  v24 = a5;
  int v25 = 0;
  int v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v29;
  id obj = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
      id v15 = v14;
      v16 = [v15 leftExpression];
      v17 = [v16 keyPath];

      if ([v17 isEqualToString:@"toList.emailAddressValue.simpleAddress"])
      {
        v18 = [v15 rightExpression];
        v19 = v18;
        if (!v10)
        {
          id v10 = v18;
          uint64_t v11 = [v15 predicateOperatorType];
          int v25 = 1;
LABEL_20:
          v19 = v10;
          goto LABEL_21;
        }
        if (![v10 isEqual:v18] || v11 != objc_msgSend(v15, "predicateOperatorType")) {
          goto LABEL_27;
        }
        int v25 = 1;
      }
      else
      {
        if (![v17 isEqualToString:@"ccList.emailAddressValue.simpleAddress"]) {
          goto LABEL_28;
        }
        v20 = [v15 rightExpression];
        v19 = v20;
        if (!v10)
        {
          id v10 = v20;
          uint64_t v11 = [v15 predicateOperatorType];
          int v9 = 1;
          goto LABEL_20;
        }
        if (![v10 isEqual:v20] || v11 != objc_msgSend(v15, "predicateOperatorType"))
        {
LABEL_27:

LABEL_28:
LABEL_29:

          goto LABEL_30;
        }
        int v9 = 1;
      }
LABEL_21:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  if (v25 & v9)
  {
    id v10 = v10;
    id *v23 = v10;
    unint64_t *v24 = v11;
    BOOL v21 = 1;
    goto LABEL_31;
  }
LABEL_30:
  BOOL v21 = 0;
LABEL_31:

LABEL_32:
  return v21;
}

- (id)transformComparisonPredicate:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F60390] predicateForNotifyMessages];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F28B98];
    uint64_t v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"conversationNotificationLevel.isNotify"];
    int v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
    uint64_t v10 = [v7 predicateWithLeftExpression:v8 rightExpression:v9 modifier:0 type:4 options:0];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F60390] predicateForMuteMessages];
    int v12 = [v4 isEqual:v11];

    v13 = v4;
    if (!v12) {
      goto LABEL_6;
    }
    v14 = (void *)MEMORY[0x1E4F28B98];
    uint64_t v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"conversationNotificationLevel.isMute"];
    int v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
    uint64_t v10 = [v14 predicateWithLeftExpression:v8 rightExpression:v9 modifier:0 type:4 options:0];
  }
  v13 = (void *)v10;

LABEL_6:
  id v15 = [v4 leftExpression];
  uint64_t v16 = [v15 expressionType];

  if (v16 != 3) {
    goto LABEL_19;
  }
  v17 = [v4 leftExpression];
  v18 = [v17 keyPath];

  if ([v18 isEqualToString:*MEMORY[0x1E4F600A0]])
  {
    v19 = [(EDMessageQueryTransformer *)self messagePersistence];
    uint64_t v20 = +[EDMessageListItemPredicates predicateForMessagesWithObjectIDsPredicate:v4 objectIDConverter:v19];
  }
  else
  {
    if ([v18 isEqualToString:*MEMORY[0x1E4F5FEB8]])
    {
      v22 = [v4 rightExpression];
      v39 = [v22 constantValue];

      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__24;
      v47 = __Block_byref_object_dispose__24;
      id v48 = 0;
      v23 = [(EDMessageQueryTransformer *)self accountsProvider];
      v24 = [v23 mailAccounts];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __58__EDMessageQueryTransformer_transformComparisonPredicate___block_invoke;
      v40[3] = &unk_1E6C03660;
      id v25 = v39;
      id v41 = v25;
      v42 = &v43;
      [v24 enumerateObjectsUsingBlock:v40];

      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(id)v44[5] accountURL], id v26 = objc_claimAutoreleasedReturnValue(),
                                                    (v27 = v26) != 0))
      {
        long long v28 = [v26 absoluteString];
        v38 = [v28 stringByAppendingString:@"{"];
        long long v29 = (void *)MEMORY[0x1E4F28B98];
        long long v30 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FEC8]];
        long long v31 = (void *)MEMORY[0x1E4F28C68];
        v49[0] = v28;
        v49[1] = v38;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        uint64_t v33 = [v31 expressionForConstantValue:v32];
        uint64_t v34 = [v29 predicateWithLeftExpression:v30 rightExpression:v33 modifier:2 type:100 options:0];

        v13 = (void *)v34;
      }
      else
      {
        [MEMORY[0x1E4F28F60] predicateWithValue:0];
        v13 = v27 = v13;
      }

      _Block_object_dispose(&v43, 8);
      goto LABEL_18;
    }
    if ([v18 isEqualToString:*MEMORY[0x1E4F5FED0]])
    {
      v19 = [(EDMessageQueryTransformer *)self mailboxPersistence];
      uint64_t v20 = +[EDMessageListItemPredicates predicateForMailboxTypePredicate:v4 mailboxPersistence:v19];
    }
    else
    {
      if (![v18 isEqualToString:*MEMORY[0x1E4F5FEC8]])
      {
        if ([v18 isEqualToString:*MEMORY[0x1E4F5FF00]])
        {
          uint64_t v36 = +[EDMessageListItemPredicates expandedPredicateForReadLaterIsActivePredicate:v4];
        }
        else if ([v18 isEqualToString:*MEMORY[0x1E4F5FE60]])
        {
          uint64_t v36 = +[EDMessageListItemPredicates expandedPredicateForFollowUpIsActivePredicate:v4];
        }
        else
        {
          if (![v18 isEqualToString:*MEMORY[0x1E4F5FE00]]) {
            goto LABEL_18;
          }
          uint64_t v36 = +[EDMessageListItemPredicates expandedPredicateForCategoryTypePredicate:v4];
        }
        v37 = (void *)v36;

        v13 = v37;
        goto LABEL_18;
      }
      v19 = [(EDMessageQueryTransformer *)self mailboxPersistence];
      uint64_t v20 = +[EDMessageListItemPredicates predicateForMailboxURLPredicate:v4 mailboxPersistence:v19];
    }
  }
  BOOL v21 = (void *)v20;

  v13 = v21;
LABEL_18:

LABEL_19:

  return v13;
}

- (id)transformCompoundPredicate:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  uint64_t v12 = 0;
  BOOL v5 = [(EDMessageQueryTransformer *)self _predicateIsToOrCC:v4 addressExpression:&v11 operatorType:&v12];
  id v6 = v11;
  if (v5)
  {
    v7 = +[EDMessageListItemPredicates predicateForMessagesWithRecipientExpression:v6 operatorType:v12];
  }
  else
  {
    uint64_t v8 = [(EDMessageQueryTransformer *)self transformSubpredicates:v4];
    int v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v4, "compoundPredicateType"), v8);
    v7 = objc_msgSend(v9, "ef_simplifiedPredicate");
  }

  return v7;
}

- (id)transformSubpredicates:(id)a3
{
  id v4 = [a3 subpredicates];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__EDMessageQueryTransformer_transformSubpredicates___block_invoke;
  v7[3] = &unk_1E6C02E08;
  v7[4] = self;
  BOOL v5 = objc_msgSend(v4, "ef_map:", v7);

  return v5;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDMessageQueryTransformer)initWithAccountsProvider:(id)a3 mailboxPersistence:(id)a4 messagePersistence:(id)a5 vipManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDMessageQueryTransformer;
  id v15 = [(EDMessageQueryTransformer *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountsProvider, a3);
    objc_storeStrong((id *)&v16->_mailboxPersistence, a4);
    objc_storeWeak((id *)&v16->_messagePersistence, v13);
    objc_storeStrong((id *)&v16->_vipManager, a6);
  }

  return v16;
}

void __58__EDMessageQueryTransformer_transformComparisonPredicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (EDMessagePersistence)messagePersistence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagePersistence);

  return (EDMessagePersistence *)WeakRetained;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);

  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end