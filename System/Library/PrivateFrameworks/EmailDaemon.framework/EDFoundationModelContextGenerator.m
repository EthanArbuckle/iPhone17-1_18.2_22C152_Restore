@interface EDFoundationModelContextGenerator
+ (id)_messageInReplyToMessage:(id)a3 messagePersistence:(id)a4 error:(id *)a5;
+ (id)log;
+ (id)originalContentMessageForMessage:(id)a3 limitOfInReplyToAncestors:(unint64_t)a4 checkForForwardedMessages:(BOOL)a5 condenseEmptyLines:(BOOL)a6 messagePersistence:(id)a7 htmlStringFromMessage:(id)a8 error:(id *)a9;
+ (id)originalContentMessageForPersistedMessage:(id)a3 condenseEmptyLines:(BOOL)a4 preserveQuotedForwardedContent:(BOOL)a5 htmlStringFromMessage:(id)a6;
+ (id)originalContentMessagesForPersistedMessages:(id)a3 condenseEmptyLines:(BOOL)a4 preserveQuotedForwardedContent:(BOOL)a5 htmlStringFromMessage:(id)a6;
@end

@implementation EDFoundationModelContextGenerator

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EDFoundationModelContextGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1) {
    dispatch_once(&log_onceToken_35, block);
  }
  v2 = (void *)log_log_35;

  return v2;
}

void __40__EDFoundationModelContextGenerator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;
}

+ (id)originalContentMessageForMessage:(id)a3 limitOfInReplyToAncestors:(unint64_t)a4 checkForForwardedMessages:(BOOL)a5 condenseEmptyLines:(BOOL)a6 messagePersistence:(id)a7 htmlStringFromMessage:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v35 = a7;
  id v36 = a8;
  v33 = v15;
  if (!v15)
  {
LABEL_24:
    id v18 = 0;
    goto LABEL_29;
  }
  if (v12)
  {
    v16 = [v15 subject];
    int v17 = [v16 hasForwardPrefix];

    if (v17)
    {
      if (a9)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Replying to forwarded message, failed to generate any original-content messages");
        id v18 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      goto LABEL_24;
    }
  }
  id v19 = v15;
  v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
  id v21 = 0;
  unint64_t v22 = [v20 count] + a4;
  do
  {
    if ([v20 count] >= v22) {
      break;
    }
    if (v21) {
      break;
    }
    id v41 = 0;
    uint64_t v23 = [a1 _messageInReplyToMessage:v19 messagePersistence:v35 error:&v41];
    id v21 = v41;
    objc_msgSend(v20, "ef_addOptionalObject:", v23);

    id v19 = (id)v23;
  }
  while (v23);
  if (v21)
  {
    v24 = +[EDFoundationModelContextGenerator log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [v21 description];
      +[EDFoundationModelContextGenerator originalContentMessageForMessage:limitOfInReplyToAncestors:checkForForwardedMessages:condenseEmptyLines:messagePersistence:htmlStringFromMessage:error:](v25, buf, v24);
    }
  }
  v26 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v20;
  uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v38;
LABEL_16:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v38 != v28) {
        objc_enumerationMutation(obj);
      }
      v30 = [a1 originalContentMessageForPersistedMessage:*(void *)(*((void *)&v37 + 1) + 8 * v29) condenseEmptyLines:v11 preserveQuotedForwardedContent:0 htmlStringFromMessage:v36];
      if (!v30) {
        break;
      }
      [v26 addObject:v30];

      if (v27 == ++v29)
      {
        uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v27) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  v31 = objc_msgSend(v26, "ef_filter:", &__block_literal_global_21);
  if ([v31 count])
  {
    id v18 = v31;
  }
  else if (a9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to generate any original-content messages");
    id v18 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }

LABEL_29:

  return v18;
}

uint64_t __188__EDFoundationModelContextGenerator_originalContentMessageForMessage_limitOfInReplyToAncestors_checkForForwardedMessages_condenseEmptyLines_messagePersistence_htmlStringFromMessage_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 draft] ^ 1;

  return v3;
}

+ (id)originalContentMessagesForPersistedMessages:(id)a3 condenseEmptyLines:(BOOL)a4 preserveQuotedForwardedContent:(BOOL)a5 htmlStringFromMessage:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        int v17 = [a1 originalContentMessageForPersistedMessage:*(void *)(*((void *)&v19 + 1) + 8 * i) condenseEmptyLines:v8 preserveQuotedForwardedContent:v7 htmlStringFromMessage:v11];
        if (v17) {
          [v12 addObject:v17];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v12;
}

+ (id)originalContentMessageForPersistedMessage:(id)a3 condenseEmptyLines:(BOOL)a4 preserveQuotedForwardedContent:(BOOL)a5 htmlStringFromMessage:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  v26 = (void (**)(id, id))a6;
  id v10 = v26[2](v26, v9);
  if (v10)
  {
    if (v8) {
      uint64_t v11 = 32;
    }
    else {
      uint64_t v11 = 0;
    }
    v25 = v10;
    uint64_t v24 = [MEMORY[0x1E4F608B0] snippetFromHTMLBody:v10 options:v11 maxLength:0x7FFFFFFFFFFFFFFFLL preservingQuotedForwardedContent:v7];
    id v12 = objc_alloc(MEMORY[0x1E4F60408]);
    id v13 = [v9 searchableMessageID];
    uint64_t v23 = [v9 subject];
    long long v22 = [v23 subjectString];
    long long v21 = [v9 senders];
    uint64_t v14 = [v21 firstObject];
    uint64_t v15 = [v9 to];
    v16 = [v9 cc];
    int v17 = [v9 flags];
    id v18 = [v9 dateReceived];
    long long v19 = (void *)[v12 initWithSearchableMessageID:v13 bodyText:v24 subject:v22 sender:v14 toList:v15 ccList:v16 flags:v17 date:v18];

    id v10 = v25;
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

+ (id)_messageInReplyToMessage:(id)a3 messagePersistence:(id)a4 error:(id *)a5
{
  id v7 = a4;
  BOOL v8 = [a3 headersIfAvailable];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 firstMessageIDForKey:*MEMORY[0x1E4F606C8]];
    uint64_t v11 = [v9 messageIDListForKey:*MEMORY[0x1E4F60700]];
    id v12 = v11;
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      id v13 = [v11 lastObject];
      if (!v13)
      {
        uint64_t v14 = 0;
        goto LABEL_8;
      }
    }
    uint64_t v15 = [v7 persistedMessagesForForMessageIDHeader:v13 requireProtectedData:1];
    uint64_t v14 = [v15 firstObject];

LABEL_8:
    goto LABEL_9;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"No headers available");
    uint64_t v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_9:

  return v14;
}

+ (void)originalContentMessageForMessage:(os_log_t)log limitOfInReplyToAncestors:checkForForwardedMessages:condenseEmptyLines:messagePersistence:htmlStringFromMessage:error:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Error while generating original-content messages: %@", buf, 0xCu);
}

@end