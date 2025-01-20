@interface EDMessageListItemPredicates
+ (id)_objectIDsFromRightExpression:(id)a3;
+ (id)_predicateForAnyMailboxWithPredicate:(id)a3;
+ (id)expandedPredicateForCategoryTypePredicate:(id)a3;
+ (id)expandedPredicateForFollowUpIsActivePredicate:(id)a3;
+ (id)expandedPredicateForReadLaterIsActivePredicate:(id)a3;
+ (id)predicateForCategorizationVersionLessThanVersion:(int64_t)a3;
+ (id)predicateForMailboxTypePredicate:(id)a3 mailboxPersistence:(id)a4;
+ (id)predicateForMailboxURLPredicate:(id)a3 mailboxPersistence:(id)a4;
+ (id)predicateForMessageIDHeaderHashPredicate:(id)a3;
+ (id)predicateForMessagesFromVIPs:(id)a3;
+ (id)predicateForMessagesWithListIDHash:(id)a3;
+ (id)predicateForMessagesWithObjectIDsPredicate:(id)a3 objectIDConverter:(id)a4;
+ (id)predicateForMessagesWithPersistentIDs:(id)a3;
+ (id)predicateForMessagesWithRecipientExpression:(id)a3 operatorType:(unint64_t)a4;
+ (id)predicateForNilModelVersion;
+ (id)predicateForUnauthenticatedMessages;
@end

@implementation EDMessageListItemPredicates

+ (id)expandedPredicateForCategoryTypePredicate:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v5 = [v39 rightExpression];
  v6 = [v5 constantValue];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [v39 predicateOperatorType];
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"EDMessageListItemPredicates.m", 170, @"Invalid parameter not satisfying: %@", @"(operatorType == NSEqualToPredicateOperatorType) || (operatorType == NSNotEqualToPredicateOperatorType)" object file lineNumber description];
  }
  BOOL v9 = v8 == 4 && !v7 || v8 == 5 && v7 != 0;
  v11 = (void *)MEMORY[0x1E4F28B98];
  v12 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.senderCategory"];
  v13 = [v39 rightExpression];
  uint64_t v38 = [v11 predicateWithLeftExpression:v12 rightExpression:v13 modifier:0 type:v8 options:0];

  v14 = (void *)MEMORY[0x1E4F28B98];
  v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.senderCategory"];
  v16 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v17 = [v14 predicateWithLeftExpression:v15 rightExpression:v16 modifier:0 type:4 options:0];

  v18 = (void *)MEMORY[0x1E4F28B98];
  v19 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.modelCategory"];
  v20 = [v39 rightExpression];
  v21 = [v18 predicateWithLeftExpression:v19 rightExpression:v20 modifier:0 type:v8 options:0];

  if (v9)
  {
    v22 = (void *)MEMORY[0x1E4F28B98];
    v23 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.modelCategory"];
    v24 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
    v25 = [v22 predicateWithLeftExpression:v23 rightExpression:v24 modifier:0 type:4 options:0];

    v26 = (void *)MEMORY[0x1E4F28BA0];
    v42[0] = v21;
    v42[1] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v28 = (void *)v38;
    uint64_t v29 = [v26 orPredicateWithSubpredicates:v27];

    v21 = (void *)v29;
  }
  else
  {
    v28 = (void *)v38;
  }
  v30 = (void *)MEMORY[0x1E4F28BA0];
  v41[0] = v17;
  v41[1] = v21;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v32 = [v30 andPredicateWithSubpredicates:v31];

  v33 = (void *)MEMORY[0x1E4F28BA0];
  v40[0] = v28;
  v40[1] = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v35 = [v33 orPredicateWithSubpredicates:v34];

  return v35;
}

+ (id)predicateForMailboxURLPredicate:(id)a3 mailboxPersistence:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [v5 rightExpression];
  BOOL v9 = [v8 constantValue];
  v10 = [v7 URLWithString:v9];

  if (v10 && ([v6 mailboxURLIsGmailLabel:v10] & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E4F28B98];
    v12 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"labels"];
    v13 = [v5 rightExpression];
    id v14 = [v11 predicateWithLeftExpression:v12 rightExpression:v13 modifier:0 type:10 options:0];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

+ (id)expandedPredicateForReadLaterIsActivePredicate:(id)a3
{
  id v5 = [a3 rightExpression];
  id v6 = [v5 constantValue];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"EDMessageListItemPredicates.m", 136, @"Comparing readLaterIsActive to something other than a BOOLean (%@)", v6 object file lineNumber description];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FEF8]];
  BOOL v9 = (void *)MEMORY[0x1E4F28C68];
  v10 = [MEMORY[0x1E4F1C9C8] now];
  v11 = [v9 expressionForConstantValue:v10];
  if ([v6 BOOLValue]) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  v13 = [v7 predicateWithLeftExpression:v8 rightExpression:v11 modifier:0 type:v12 options:0];

  return v13;
}

+ (id)predicateForMessagesWithPersistentIDs:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"rowid"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  uint64_t v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:10 options:0];

  return v7;
}

+ (id)predicateForMessagesFromVIPs:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v18;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = v4;
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v8 = [v6 displayName];
        BOOL v9 = [v7 predicateWithFormat:@"%K = %@", @"senderAddress.emailAddressValue.displayName", v8, v18];
        [v3 addObject:v9];

        v10 = [v6 emailAddresses];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"senderAddress.emailAddressValue.simpleAddress", *(void *)(*((void *)&v22 + 1) + 8 * j)];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  if ([obj count]) {
    [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];
  }
  else {
  v16 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v16;
}

+ (id)predicateForMessagesWithRecipientExpression:(id)a3 operatorType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v7 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"recipients"];
  uint64_t v8 = [v6 predicateWithLeftExpression:v7 rightExpression:v5 modifier:0 type:a4 options:0];

  return v8;
}

+ (id)predicateForMailboxTypePredicate:(id)a3 mailboxPersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void *)MEMORY[0x1E4F28B98];
  v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F60090]];
  id v11 = [v7 rightExpression];
  uint64_t v12 = objc_msgSend(v9, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v11, 0, objc_msgSend(v7, "predicateOperatorType"), objc_msgSend(v7, "options"));

  uint64_t v13 = [v8 allMailboxes];
  id v14 = [v13 filteredArrayUsingPredicate:v12];

  if ([v14 count])
  {
    v15 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxes:v14];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:a1 file:@"EDMessageListItemPredicates.m" lineNumber:91 description:@"Expected predicate should be a NSCompoundPredicate"];
    }
    id v16 = v15;
    v17 = [v16 subpredicates];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__EDMessageListItemPredicates_predicateForMailboxTypePredicate_mailboxPersistence___block_invoke;
    v22[3] = &unk_1E6C02BA0;
    SEL v24 = a2;
    id v25 = a1;
    id v23 = v8;
    id v18 = objc_msgSend(v17, "ef_map:", v22);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v16, "compoundPredicateType"), v18);
  }
  else
  {
    v19 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v19;
}

id __83__EDMessageListItemPredicates_predicateForMailboxTypePredicate_mailboxPersistence___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"EDMessageListItemPredicates.m" lineNumber:94 description:@"Expected subpredicate should be a NSComparisonPredicate"];
  }
  uint64_t v4 = [*(id *)(a1 + 48) _predicateForAnyMailboxWithPredicate:v3];
  id v5 = [*(id *)(a1 + 48) predicateForMailboxURLPredicate:v4 mailboxPersistence:*(void *)(a1 + 32)];

  return v5;
}

+ (id)predicateForMessagesWithObjectIDsPredicate:(id)a3 objectIDConverter:(id)a4
{
  id v5 = a4;
  id v6 = [a3 rightExpression];
  id v7 = +[EDMessageListItemPredicates _objectIDsFromRightExpression:v6];

  id v8 = [v5 databaseIDsDictionaryForMessageObjectIDs:v7];
  BOOL v9 = [v8 allKeys];

  v10 = (void *)MEMORY[0x1E4F28B98];
  id v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"rowid"];
  uint64_t v12 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v9];
  uint64_t v13 = [v10 predicateWithLeftExpression:v11 rightExpression:v12 modifier:0 type:10 options:0];

  return v13;
}

+ (id)expandedPredicateForFollowUpIsActivePredicate:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 rightExpression];
  id v7 = [v6 constantValue];

  id v8 = [MEMORY[0x1E4F1C9C8] now];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SEL v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"EDMessageListItemPredicates.m", 148, @"Comparing followUpIsActive to something other than a BOOLean (%@)", v7 object file lineNumber description];
  }
  BOOL v9 = (void *)MEMORY[0x1E4F28B98];
  v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FE68]];
  id v11 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];
  if ([v7 BOOLValue]) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  uint64_t v13 = [v9 predicateWithLeftExpression:v10 rightExpression:v11 modifier:0 type:v12 options:0];

  id v14 = (void *)MEMORY[0x1E4F28B98];
  v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FE58]];
  id v16 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];
  if ([v7 BOOLValue]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  id v18 = [v14 predicateWithLeftExpression:v15 rightExpression:v16 modifier:0 type:v17 options:0];

  v19 = (void *)MEMORY[0x1E4F28BA0];
  if (v7)
  {
    v26[0] = v13;
    v26[1] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];
  }
  else
  {
    v25[0] = v13;
    v25[1] = v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v21 = [v19 orPredicateWithSubpredicates:v20];
  }
  long long v22 = (void *)v21;

  return v22;
}

+ (id)predicateForNilModelVersion
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.modelVersion"];
  uint64_t v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)predicateForCategorizationVersionLessThanVersion:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"category.modelVersion"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 expressionForConstantValue:v7];
  BOOL v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:0 options:0];

  return v9;
}

+ (id)predicateForUnauthenticatedMessages
{
  v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"validation.state"];
  uint64_t v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F35BAD30];
  id v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)_objectIDsFromRightExpression:(id)a3
{
  id v5 = a3;
  if ([v5 expressionType])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"EDMessageListItemPredicates.m" lineNumber:233 description:@"objectID should be a constant value right expression"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v5 constantValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v9 = [v5 constantValue];
    v10 = objc_msgSend(v9, "ef_map:", &__block_literal_global_45);
    [v6 addObjectsFromArray:v10];
  }
  else
  {
    id v11 = [v5 constantValue];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F603A0];
    BOOL v9 = [v5 constantValue];
    v10 = [v13 objectIDFromSerializedRepresentation:v9];
    [v6 addObject:v10];
  }

LABEL_8:

  return v6;
}

id __61__EDMessageListItemPredicates__objectIDsFromRightExpression___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F603A0] objectIDFromSerializedRepresentation:a2];

  return v2;
}

+ (id)_predicateForAnyMailboxWithPredicate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [v3 leftExpression];
  id v6 = [v3 rightExpression];
  id v7 = objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, objc_msgSend(v3, "predicateOperatorType"), 0);

  return v7;
}

+ (id)predicateForMessageIDHeaderHashPredicate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"messageID"];
  id v5 = (void *)MEMORY[0x1E4F28B98];
  id v6 = [v3 rightExpression];
  id v7 = objc_msgSend(v5, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v6, 0, objc_msgSend(v3, "predicateOperatorType"), 0);

  return v7;
}

+ (id)predicateForMessagesWithListIDHash:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"listIDHash"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "int64Value"));
  id v8 = [v6 expressionForConstantValue:v7];
  BOOL v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

@end