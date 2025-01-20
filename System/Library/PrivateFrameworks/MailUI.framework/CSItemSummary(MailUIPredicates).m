@interface CSItemSummary(MailUIPredicates)
- (id)_datePredicate;
- (id)_flagStatusPredicate;
- (id)_messagePredicate;
- (id)_personPredicate;
- (id)_readStatusPredicate;
- (id)_senderContainsPredicate;
- (id)mui_messageListSearchPredicate;
- (uint64_t)_attachmentPredicate;
- (void)_messagePredicate;
- (void)_personPredicate;
- (void)_senderContainsPredicate;
- (void)mui_messageListSearchPredicate;
@end

@implementation CSItemSummary(MailUIPredicates)

- (id)mui_messageListSearchPredicate
{
  v2 = [a1 type];
  int v3 = [v2 isEqual:*MEMORY[0x1E4F22908]];

  if (v3)
  {
    v4 = [a1 _personPredicate];
  }
  else
  {
    v5 = [a1 type];
    int v6 = [v5 isEqual:*MEMORY[0x1E4F22910]];

    if (v6)
    {
      v4 = [a1 _datePredicate];
    }
    else
    {
      v7 = [a1 type];
      int v8 = [v7 isEqual:*MEMORY[0x1E4F22918]];

      if (v8)
      {
        v4 = [a1 _messagePredicate];
      }
      else
      {
        v9 = [a1 type];
        int v10 = [v9 isEqual:*MEMORY[0x1E4F22900]];

        if (v10)
        {
          v4 = [a1 _attachmentPredicate];
        }
        else
        {
          v11 = [MEMORY[0x1E4F238B0] log];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            [(CSItemSummary(MailUIPredicates) *)a1 mui_messageListSearchPredicate];
          }

          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (id)_messagePredicate
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 textQuery];
  if ([v2 length])
  {
    uint64_t v3 = [a1 textScope];
    if (v3 == 2)
    {
      uint64_t v4 = [MEMORY[0x1E4F60398] spotlightBodySearchPredicateForValue:v2];
      goto LABEL_9;
    }
    if (v3 == 1)
    {
      uint64_t v4 = [MEMORY[0x1E4F60398] spotlightSubjectSearchPredicateForValue:v2 operator:99];
LABEL_9:
      int v6 = (void *)v4;
      goto LABEL_11;
    }
    v7 = (void *)MEMORY[0x1E4F28BA0];
    int v8 = [MEMORY[0x1E4F60398] spotlightSubjectSearchPredicateForValue:v2 operator:99];
    v12[0] = v8;
    v9 = [MEMORY[0x1E4F60398] spotlightBodySearchPredicateForValue:v2];
    v12[1] = v9;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    int v6 = [v7 orPredicateWithSubpredicates:v10];
  }
  else
  {
    v5 = [MEMORY[0x1E4F238B0] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CSItemSummary(MailUIPredicates) _messagePredicate]();
    }

    int v6 = 0;
  }
LABEL_11:

  return v6;
}

- (id)_personPredicate
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 emailAddresses];
  if ([v2 count]
    || ([a1 name],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        !v5))
  {
    uint64_t v3 = 4;
  }
  else
  {
    int v6 = [a1 name];
    v16[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    uint64_t v3 = 99;
    v2 = (void *)v7;
  }
  if ([v2 count])
  {
    switch([a1 contactScope])
    {
      case 0:
        int v8 = [MEMORY[0x1E4F238B0] log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CSItemSummary(MailUIPredicates) _personPredicate](a1);
        }

        goto LABEL_10;
      case 1:
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke;
        v15[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
        v15[4] = v3;
        int v10 = v15;
        goto LABEL_16;
      case 2:
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_2;
        v14[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
        v14[4] = v3;
        int v10 = v14;
        goto LABEL_16;
      case 3:
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_3;
        v13[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
        v13[4] = v3;
        int v10 = v13;
LABEL_16:
        v9 = objc_msgSend(v2, "ef_map:", v10);
        break;
      default:
LABEL_10:
        v9 = 0;
        break;
    }
    if ([v9 count])
    {
      v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v9];
      goto LABEL_20;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F238B0] log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CSItemSummary(MailUIPredicates) _personPredicate]();
    }
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (id)_senderContainsPredicate
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    a1 = 0;
    goto LABEL_15;
  }
  v2 = [a1 senderContainsSearchString];
  if (![v2 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F238B0] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CSItemSummary(MailUIPredicates) _senderContainsPredicate]();
    }

    a1 = 0;
    goto LABEL_14;
  }
  uint64_t v3 = [a1 senderContainsScope];
  switch(v3)
  {
    case 2:
      int v6 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v7 = [MEMORY[0x1E4F60398] spotlightSenderSearchPredicateForValue:v2 operator:99];
      v11[0] = v7;
      int v8 = [MEMORY[0x1E4F60398] spotlightRecipientSearchPredicateForValue:v2 operator:99];
      v11[1] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      a1 = [v6 orPredicateWithSubpredicates:v9];

      break;
    case 1:
      uint64_t v4 = [MEMORY[0x1E4F60398] spotlightRecipientSearchPredicateForValue:v2 operator:99];
      goto LABEL_13;
    case 0:
      uint64_t v4 = [MEMORY[0x1E4F60398] spotlightSenderSearchPredicateForValue:v2 operator:99];
LABEL_13:
      a1 = (void *)v4;
      break;
  }
LABEL_14:

LABEL_15:
  return a1;
}

- (id)_datePredicate
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 dateFrom];

  uint64_t v3 = (void *)MEMORY[0x1E4F5FE30];
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
    uint64_t v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*MEMORY[0x1E4F5FE30]];
    int v6 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v7 = [a1 dateFrom];
    int v8 = [v6 expressionForConstantValue:v7];
    v2 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:2 options:0];
  }
  v9 = [a1 dateTo];

  if (v9)
  {
    int v10 = (void *)MEMORY[0x1E4F28B98];
    v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:*v3];
    v12 = (void *)MEMORY[0x1E4F28C68];
    v13 = [a1 dateTo];
    v14 = [v12 expressionForConstantValue:v13];
    v15 = [v10 predicateWithLeftExpression:v11 rightExpression:v14 modifier:0 type:0 options:0];

    if (v2 && v15)
    {
      v16 = (void *)MEMORY[0x1E4F28BA0];
      v20[0] = v2;
      v20[1] = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      id v18 = [v16 andPredicateWithSubpredicates:v17];

      goto LABEL_10;
    }
  }
  else
  {
    v15 = 0;
  }
  if (!v2) {
    goto LABEL_11;
  }
  id v18 = v2;
LABEL_10:

  v15 = v18;
LABEL_11:

  return v15;
}

- (id)_readStatusPredicate
{
  uint64_t v1 = [a1 statusValue];
  if (v1 == 2)
  {
    v2 = [MEMORY[0x1E4F60390] predicateForUnreadMessages];
  }
  else if (v1 == 1)
  {
    v2 = [MEMORY[0x1E4F60390] predicateForReadMessages];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_flagStatusPredicate
{
  uint64_t v1 = [a1 statusValue];
  if (v1 == 2)
  {
    v2 = [MEMORY[0x1E4F60390] predicateForUnflaggedMessages];
  }
  else if (v1 == 1)
  {
    v2 = [MEMORY[0x1E4F60390] predicateForFlaggedMessages];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_attachmentPredicate
{
  return [MEMORY[0x1E4F60390] predicateForMessagesWithAttachments];
}

- (void)mui_messageListSearchPredicate
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 type];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "Unknown CSItemSummaryType: %@", v4, 0xCu);
}

- (void)_messagePredicate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DDCDB000, v0, OS_LOG_TYPE_ERROR, "_CSSuggestionTokenKindMessage token:%@ does not have valid textQuery.", v1, 0xCu);
}

- (void)_personPredicate
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "contactScope"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1DDCDB000, v2, v3, "_CSSuggestionTokenKindPerson token:%@ has unsupported scope:%@.", v4, v5, v6, v7, v8);
}

- (void)_senderContainsPredicate
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1DDCDB000, v1, OS_LOG_TYPE_ERROR, "_CSSuggestionTokenKindSenderContains token:%@ does not have valid senderContainsSearchString:%@.", v2, 0x16u);
}

@end