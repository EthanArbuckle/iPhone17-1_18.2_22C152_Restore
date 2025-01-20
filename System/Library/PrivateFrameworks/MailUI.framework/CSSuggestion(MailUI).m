@interface CSSuggestion(MailUI)
+ (id)mui_emptySuggestion;
+ (id)mui_log;
+ (id)mui_mergeCurrentSuggestion:()MailUI suggestion:;
+ (id)mui_spotlightSuggestionForEmailAddress:()MailUI scope:currentSuggestion:;
+ (id)mui_spotlightSuggestionFromSerializedRepresentation:()MailUI;
+ (id)mui_suggestionForSpotlightQueryWithString:()MailUI;
- (BOOL)mui_isEmpty;
- (id)mui_serializedSpotlightSuggestionRepresentation;
- (void)mui_serializedSpotlightSuggestionRepresentation;
@end

@implementation CSSuggestion(MailUI)

+ (id)mui_log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CSSuggestion_MailUI__mui_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mui_log_onceToken != -1) {
    dispatch_once(&mui_log_onceToken, block);
  }
  v1 = (void *)mui_log_log;
  return v1;
}

+ (id)mui_emptySuggestion
{
  if (mui_emptySuggestion_onceToken != -1) {
    dispatch_once(&mui_emptySuggestion_onceToken, &__block_literal_global);
  }
  v0 = (void *)mui_emptySuggestion_emptySuggestion;
  return v0;
}

+ (id)mui_spotlightSuggestionForEmailAddress:()MailUI scope:currentSuggestion:
{
  id v7 = a3;
  id v8 = a5;
  if (a4 > 2)
  {
    v10 = 0;
  }
  else
  {
    v9 = [(__CFString *)off_1E6D11620[a4] stringByAppendingString:v7];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E4F23870], "mui_emptySuggestion");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = [MEMORY[0x1E4F23870] updatedSuggestionWithCurrentSuggestion:v8 highlightedText:v9];
  }
  return v10;
}

+ (id)mui_spotlightSuggestionFromSerializedRepresentation:()MailUI
{
  id v3 = a3;
  if (v3)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    v5 = v8;
    if (!v4)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F23870], "mui_log");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[CSSuggestion(MailUI) mui_spotlightSuggestionFromSerializedRepresentation:](v5);
      }
    }
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F23870], "mui_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Could not decode data as CSSuggestion. Reason: Data is nil", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)mui_mergeCurrentSuggestion:()MailUI suggestion:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 userQueryString];
  id v8 = [v6 currentTokens];

  if ([v7 length] || objc_msgSend(v8, "count"))
  {
    uint64_t v9 = [v7 length];
    v10 = [v5 userQueryString];
    if (v9)
    {
      uint64_t v11 = [v7 stringByAppendingString:v10];

      v10 = (void *)v11;
    }
    v12 = [v5 userQueryString];
    int v13 = [v12 isEqualToString:v7];

    if (v13)
    {
      uint64_t v14 = [v5 userQueryString];

      v10 = (void *)v14;
    }
    v15 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    v16 = [v10 stringByTrimmingCharactersInSet:v15];

    v17 = [v5 currentTokens];
    v18 = [v8 arrayByAddingObjectsFromArray:v17];

    v19 = (void *)MEMORY[0x1E4F23870];
    v20 = [MEMORY[0x1E4F23870] emptySuggestion];
    id v21 = [v19 updatedSuggestionWithCurrentSuggestion:v20 userString:v16 tokens:v18];
  }
  else
  {
    id v21 = v5;
  }

  return v21;
}

- (id)mui_serializedSpotlightSuggestionRepresentation
{
  id v5 = 0;
  v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v5];
  id v2 = v5;
  if (!v1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F23870], "mui_log");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CSSuggestion(MailUI) mui_serializedSpotlightSuggestionRepresentation](v2);
    }
  }
  return v1;
}

- (BOOL)mui_isEmpty
{
  id v2 = [a1 suggestionTokens];
  if ([v2 count])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [a1 userQueryString];
    BOOL v3 = [v4 length] == 0;
  }
  return v3;
}

+ (id)mui_suggestionForSpotlightQueryWithString:()MailUI
{
  BOOL v3 = (void *)MEMORY[0x1E4F23870];
  id v4 = a3;
  id v5 = [v3 emptySuggestion];
  id v6 = [v3 updatedSuggestionWithCurrentSuggestion:v5 userString:v4 tokens:MEMORY[0x1E4F1CBF0]];

  return v6;
}

+ (void)mui_spotlightSuggestionFromSerializedRepresentation:()MailUI .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "ef_publicDescription");
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "Could not decode data as CSSuggestion. Error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)mui_serializedSpotlightSuggestionRepresentation
{
  v1 = objc_msgSend(a1, "ef_publicDescription");
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "Failed to encode data from CSSuggestion. Error: %{public}@", v4, v5, v6, v7, 2u);
}

@end